# Laboratorios — AZ-900

Índice de laboratorios prácticos para AZ-900. No duplica contenido ya detallado en otras páginas — enlaza a él.

## Proyectos guiados (Microsoft Learn, sandbox gratuito)

La vía práctica oficial de AZ-900 es la ruta [Aplicación de aptitudes de Azure en proyectos guiados](https://learn.microsoft.com/es-es/training/paths/introduction-cloud-infrastructure-apply-azure-skills-guided-projects/) — 8 proyectos guiados con sandbox gratuito (sin suscripción), uno por cada área del examen. Lista completa con enlaces y checkboxes en [notes/AZ-900/roadmap.md](../../notes/AZ-900/roadmap.md) (Bloque 4).

Los módulos de las 3 rutas de estudio también incluyen ejercicios interactivos embebidos con el mismo sandbox.

## Resultados

Los 8 proyectos guiados, completados — un archivo por proyecto, con capturas en la misma carpeta:

| # | Proyecto guiado | Resultado | Conceptos que practica |
|---|---|---|---|
| 1 | [Sitio web estático con Blob Storage](https://learn.microsoft.com/es-es/training/modules/guided-project-deploy-static-website-blob-storage/) | [sitio-web.md](sitio-web/sitio-web.md) | Blob Storage, hospedaje web estático |
| 2 | [Etiquetas y bloqueos](https://learn.microsoft.com/es-es/training/modules/guided-project-organize-resources-tags-locks/) | [etiquetas-bloqueos.md](etiquetas-bloqueos/etiquetas-bloqueos.md) | Tags, bloqueos de recursos, gobernanza |
| 3 | [Endpoint web con Azure Functions](https://learn.microsoft.com/es-es/training/modules/guided-project-build-basic-website-endpoint-with-functions/) | [web-sencillo-Azure.md](web-sencillo-Azure/web-sencillo-Azure.md) | Serverless, HTTP trigger, function keys, Application Insights |
| 4 | [Acceso de empleados (Entra ID y RBAC)](https://learn.microsoft.com/es-es/training/modules/guided-project-new-employee-access/) | [entra.md](Entra/entra.md) | Usuarios y grupos, RBAC, privilegio mínimo, TAP |
| 5 | [Compartir archivos de forma segura](https://learn.microsoft.com/es-es/training/modules/guided-project-share-files-securely/) | [share-files.md](compartir-ficheros/share-files.md) | SAS, directivas de acceso almacenadas, ciclo de vida |
| 6 | [Límites de protección de costos](https://learn.microsoft.com/es-es/training/modules/guided-project-cost-guardrails/) | [protection-cost.md](costes-proteccion/protection-cost.md) | Tags, presupuestos, alertas de coste, Azure Policy |
| 7 | [Alertas de actividad y Service Health](https://learn.microsoft.com/es-es/training/modules/guided-project-monitor-service-health-activity-alerts/) | [alerts.md](alertas/alerts.md) | Azure Monitor, grupos de acciones, Service Health |
| 8 | [Cloud Shell y CLI](https://learn.microsoft.com/es-es/training/modules/guided-project-manage-resources-cloud-shell-cli/) | [cloud-shell.md](cloud-shell/cloud-shell.md) | Cloud Shell, Azure CLI, JMESPath |

### Material adicional

- [az900-lab.md](az900-lab.md) — setup del entorno local: instalación de Azure CLI en Fedora, `az login`, GitHub Copilot CLI y tabla de equivalencias PowerShell/CLI.
- [crear-vm.sh](crear-vm.sh) — laboratorio IaaS: creación de una VM Ubuntu por CLI (grupo de recursos + VM + puerto 22).

## Relacionado

- [certifications/AZ-900/INDEX.md](../../certifications/AZ-900/INDEX.md)
- [notes/AZ-900/roadmap.md](../../notes/AZ-900/roadmap.md)
