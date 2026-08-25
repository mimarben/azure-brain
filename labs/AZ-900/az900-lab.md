
Me he dado de alta en azure con mi****@hotmail.com



Instalacion en Fedora 44:
```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install -y https://packages.microsoft.com/config/fedora/41/packages-microsoft-prod.rpm
sudo dnf install -y azure-cli
```


```bash
az login
az logout
```

Work from your terminal

The GitHub Copilot CLI reads, writes, runs and deploys code to Azure right where you work.
1. Install GitHub Copilot CLI
```bash
npm install -g @github/copilot
```
See other installation options
here 
2. Install the Copilot extension
```bash
copilot extension install github/ github-copilot-cli && \
```
3. Add the Azure plugin marketplace
```bash
copilot plugin marketplace add microsoft/github-copilot-for-azure && \
```
4. Install the Azure plugin
```bash
copilot plugin install azure@github-copilot-for-azure
```
Or,

Copy the entire code
```bash
npm install -g @github/copilot copilot extension install github/ github-copilot-cli && \ copilot plugin marketplace add microsoft/github-copilot-for-azure && \ copilot plugin install azure@github- copilot-for-azure
```

| Equivalencias PowerShell | Azure CLI |
|---|---|
| `Get-AzVM` | `az vm list` |
| `Get-AzVM -ResourceGroupName X` | `az vm list -g X` |
| `Get-AzVM -ResourceGroupName X -Name Y` | `az vm show -g X -n Y` |
| `Get-AzVM -Status` | `az vm list -d` |
| `Start-AzVM` | `az vm start` |
| `Stop-AzVM` | `az vm stop` |
| `Restart-AzVM` | `az vm restart` |
| `Remove-AzVM` | `az vm delete` |