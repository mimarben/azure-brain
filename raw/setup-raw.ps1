<#
.SYNOPSIS
    Clona o actualiza los repos de documentacion de Azure listados en repos.txt dentro de raw/.
    Equivalente Windows de setup-raw.sh.

.PARAMETER Shallow
    Clona con --depth 1 (mas rapido, sin historial).

.PARAMETER DryRun
    Solo muestra que haria, sin ejecutar nada.

.EXAMPLE
    .\raw\setup-raw.ps1
    .\raw\setup-raw.ps1 -Shallow
    .\raw\setup-raw.ps1 -DryRun
#>

[CmdletBinding()]
param(
    [switch]$Shallow,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$ScriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot   = Split-Path -Parent $ScriptDir
$RawDir     = Join-Path $RepoRoot "raw"
$ConfigFile = Join-Path $ScriptDir "repos.txt"

if (-not (Test-Path $ConfigFile)) {
    Write-Error "No encuentro $ConfigFile"
    exit 1
}

New-Item -ItemType Directory -Force -Path $RawDir | Out-Null

$ok = 0
$fail = 0

Write-Host "== Sincronizando raw/ desde $ConfigFile =="

Get-Content $ConfigFile | ForEach-Object {
    $line = $_.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { return }

    $parts  = $line -split '\s+'
    $name   = $parts[0]
    $url    = $parts[1]
    $branch = if ($parts.Count -ge 3) { $parts[2] } else { $null }

    if (-not $name -or -not $url) { return }

    $dest = Join-Path $RawDir $name

    if (Test-Path (Join-Path $dest ".git")) {
        Write-Host "-> [pull] $name"
        if ($DryRun) {
            Write-Host "   (dry-run) git -C $dest status --porcelain"
            Write-Host "   (dry-run) git -C $dest pull --ff-only"
        } else {
            try {
                $status = git -C $dest status --porcelain
                if ($status) {
                    Write-Warning "   $name tiene cambios locales; no se actualiza. Estado:"
                    git -C $dest status
                    $fail++
                    return
                }

                git -C $dest pull --ff-only
                $ok++
            } catch {
                Write-Warning "   fallo al actualizar $name : $_"
                $fail++
            }
        }
    } else {
        Write-Host "-> [clone] $name  <-  $url"
        $cloneArgs = @("clone")
        if ($Shallow) { $cloneArgs += @("--depth", "1") }
        if ($branch)  { $cloneArgs += @("--branch", $branch) }
        $cloneArgs += @($url, $dest)

        if ($DryRun) {
            Write-Host "   (dry-run) git $($cloneArgs -join ' ')"
        } else {
            try {
                & git @cloneArgs
                $ok++
            } catch {
                Write-Warning "   fallo al clonar $name (URL incorrecta o repo no disponible): $_"
                $fail++
            }
        }
    }
}

Write-Host ""
Write-Host "== Resumen: $ok OK, $fail fallidos =="
if ($fail -gt 0) { exit 1 }
exit 0