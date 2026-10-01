# Log

Registro cronológico de ingestas, consultas y lints. Formato: `## [YYYY-MM-DD] tipo | Título`.

## [2026-10-01] maintenance | Localización de imágenes de los módulos 13–14 de AZ-104
Fuente: petición del usuario
Páginas actualizadas: knowledge/az104-virtual-machines.md, knowledge/az104-vm-availability.md
Notas: descargadas 10 imágenes enlazadas de Microsoft Learn (3 del módulo 13, 7 del módulo 14) a assets/images/AZ-104/ con nombres descriptivos en kebab-case; los enlaces de ambas fichas pasan de URL externa a ruta relativa local. Se verificó que todos los ficheros son PNG válidos.

## [2026-09-28] maintenance | Reinicio del seguimiento del curso AZ-104
Fuente: petición del usuario (reiniciar el curso AZ-104)
Páginas actualizadas: certifications/AZ-104/INDEX.md, notes/AZ-104/roadmap.md, log.md
Notas: progreso reabierto desde el módulo 01 (Azure Cloud Shell) y checklists alineados; se conservan las notas y páginas de conocimiento existentes.

## [2026-08-26] maintenance | URLs de Microsoft Learn a en-us en todo el repo
Fuente: petición del usuario ("todas las direcciones las quiero en inglés")
Páginas actualizadas: 63 ficheros de knowledge/, certifications/, notes/, labs/, examples/, INDEX.md y ROADMAP.md — todas las URLs `/es-es/` → `/en-us/`
Notas: se excluyen `raw/` (capa inmutable) y las entradas históricas de `log.md` (registran las fuentes tal como se usaron en su momento). La preferencia queda como convención del repo: los enlaces a Microsoft Learn van en en-us. De paso: renombrado manual por el usuario de knowledge/azure-cloud-shell.md → az900-azure-cloud-shell.md (el alias `[[Azure Cloud Shell]]` sigue resolviendo); corregida la fila correspondiente del INDEX raíz que apuntaba a un alias inexistente.

## [2026-08-26] maintenance | AZ-104 al nivel del AZ-900 + resolución de conflictos de merge
Fuente: petición del usuario (AZ-900 acabado; revisar AZ-104 "en todos sus puntos" y igualarlo al patrón AZ-900)
Páginas creadas: knowledge/_template-az104.md, knowledge/_template-az900.md, 26 fichas knowledge/az104-*.md, labs/AZ-104/README.md
Páginas actualizadas: certifications/AZ-104/INDEX.md (reescrito: checklist de 28 módulos con "Mi nota" + repaso final), notes/AZ-104/roadmap.md, INDEX.md, certifications/ROADMAP.md, certifications/AZ-900/INDEX.md, log.md
Notas: (1) Verificado contra Learn el 26/08/2026: skills outline AZ-104 sin cambios (vigente desde 17/04/2026) y composición de las 6 rutas estable — salvo que la ruta de prerrequisitos pasó de 1 a 2 módulos (el de plantillas ARM JSON pasó de refuerzo suelto a oficial, movido al Bloque 0). (2) Labs oficiales verificados contra el repo MicrosoftLearning/AZ-104 (Lab 01–11, tabla por bloque en labs/AZ-104/README.md); necesitan suscripción propia, no sandbox. (3) Resueltos los marcadores de conflicto del merge 4727622 en 11 ficheros (roadmap AZ-900, INDEX AZ-900, log.md, labs/AZ-900/README.md y 7 fichas az900-*), quedando el lado entrante (04f9f9d "az-900 ended"). (4) AZ-900 pasa a "estudio completado — examen pendiente de programar"; AZ-104 marca los módulos 03–08 como hechos (bloques 0–1, según progreso registrado) y la ficha del módulo de arquitectura apunta a la nota AZ-900 (mismo módulo, sin duplicar).

## [2026-08-21] maintenance | Enlazado de los laboratorios AZ-900
Fuente: petición del usuario
Páginas actualizadas: labs/AZ-900/README.md, notes/AZ-900/roadmap.md, certifications/AZ-900/INDEX.md, knowledge/az900-azure-storage.md, knowledge/az900-azure-compute.md, knowledge/az900-azure-identity.md, knowledge/az900-cost-management.md, knowledge/az900-governance-compliance.md, knowledge/az900-management-tools.md, knowledge/az900-monitoring-tools.md
Notas: los 8 proyectos guiados del Bloque 4 ya tenían resultado en labs/AZ-900/ pero sin ninguna referencia entrante (el README de labs decía "ninguno todavía"). Cada proyecto queda enlazado desde el roadmap (Bloque 4) y desde la nota del módulo correspondiente en knowledge/ (sección Relacionado).

## [2026-08-03] maintenance | Guard de estado local en raw setup
Fuente: petición del usuario
Páginas actualizadas: raw/setup-raw.sh, raw/setup-raw.ps1, log.md
Notas: antes de hacer `pull --ff-only` sobre un repo ya clonado en `raw/`, los scripts comprueban cambios locales; si el repo no está limpio, muestran `git status` y saltan la actualización de ese repo.

## [2026-08-03] example | Aplicación con Microsoft Entra ID
Fuente: https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=windows&pivots=development-environment-vscode + documentación base de App Service authentication con Microsoft Entra.
Páginas creadas: examples/entra/README.md
Páginas actualizadas: examples/README.md, knowledge/entra-id.md, certifications/AZ-104/INDEX.md

## [2026-08-03] maintenance | Raw repo bootstrap
Fuente: petición del usuario
Páginas creadas: raw/setup-raw.sh, raw/setup-raw.ps1, raw/repos.txt
Páginas actualizadas: .gitignore, INDEX.md, CLAUDE.md
Notas: `raw/` queda preparado para versionar solo los scripts y el manifiesto; los repos clonados siguen ignorados.

## [2026-07-07] setup | Arquitectura inicial del cerebro
Se define la filosofía (adaptación de karpathy.txt a Azure) en CLAUDE.md: capas raw/knowledge/certifications, frontmatter, convenciones de enlace, flujo de ingesta/consulta/lint.
Se mueve azure.txt → raw/courses-list.txt (fuente, no contenido de wiki).
Se crean INDEX.md, README.md, log.md en la raíz.
Carpetas heredadas de un scaffold anterior (agents/, architecture/, archive/, cheatsheets/, concepts/, labs/, notes/, processed/, prompts/, scripts/, templates/) se mantienen vacías por decisión del usuario.

## [2026-07-07] ingest | Shared Responsibility Model (piloto)
Fuente: raw/azure-docs/articles/security/fundamentals/shared-responsibility.md
Páginas creadas: knowledge/shared-responsibility-model.md, certifications/AZ-900/INDEX.md
Páginas actualizadas (stubs con frontmatter + enlace de vuelta): knowledge/azure-rbac.md, knowledge/managed-identities.md, knowledge/key-vault.md
Certificación creada: certifications/AZ-900/ (no existía, elegida por el usuario como piloto)

## [2026-07-07] ingest | Guías de estudio oficiales (AI-200 + 8 certificaciones)
Fuente: learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/{ai-200,az-104,az-500,az-140,az-305,az-400,az-700,gh-900,az-900}
Motivo: el usuario aportó la URL de la guía oficial de AI-200; se detectó el patrón de URL y se aplicó al resto de certificaciones activas para reemplazar estructura genérica por la skills outline real.
Páginas creadas: certifications/AI-200/INDEX.md, certifications/AZ-104/INDEX.md, certifications/AZ-500/INDEX.md, certifications/AZ-140/INDEX.md, certifications/AZ-305/INDEX.md, certifications/AZ-400/INDEX.md, certifications/AZ-700/INDEX.md, certifications/GH-900/INDEX.md
Página reemplazada: certifications/AZ-900/INDEX.md (el borrador manual del piloto anterior se sustituyó por la skills outline oficial)
Stubs de knowledge/ completados con frontmatter + enlaces: aks.md, azure-networking.md, entra-id.md, hub-spoke.md, private-endpoints.md, terraform-vs-bicep.md
Stub nuevo: knowledge/azure-virtual-desktop.md (núcleo de AZ-140, mencionado también en AZ-900)
Pendiente: desarrollar contenido real de knowledge/ (todos siguen siendo stubs salvo Shared Responsibility Model), añadir labs y ejemplos por certificación.

## [2026-07-07] fix | CLAUDE.md movido de vuelta a la raíz
CLAUDE.md había aparecido en agents/CLAUDE.md (movido fuera de la sesión, no por mí). Como Claude Code solo autocarga el CLAUDE.md de la raíz del repo, se devuelve a /mnt/SRC/azure-brain/CLAUDE.md. agents/ vuelve a quedar vacía.

## [2026-07-07] ingest | Roadmap de estudio AI-200
Fuente: learn.microsoft.com/en-us/training/courses/ai-200t00 + sus 9 learning paths oficiales (implement-container-app-hosting-azure, deploy-manage-apps-azure-container-apps, deploy-monitor-apps-azure-kubernetes-service, develop-ai-solutions-azure-cosmos-db, develop-ai-solutions-azure-database-postgresql, enhance-ai-solutions-azure-managed-redis, integrate-backend-services-ai-solutions, manage-app-secrets-configuration, observe-troubleshoot-apps)
Página creada: certifications/AI-200/notes/roadmap.md — 24 módulos oficiales mapeados a las 4 áreas de la skills outline, con checkboxes y huecos "Notas propias" para que el usuario rellene con el curso AI-200T00/vídeos.
Página actualizada: certifications/AI-200/INDEX.md (progreso → en curso, enlace al roadmap), INDEX.md raíz.
Hallazgo: raw/azure-docs es un clon parcial (146 carpetas) que no incluye cosmos-db/, postgresql/, key-vault/ ni aks/ — el roadmap usa enlaces a Microsoft Learn para esos temas en vez de rutas locales.
Alcance: solo AI-200 recibe este nivel de detalle por ahora; el resto de certificaciones se desarrollará cuando el usuario empiece a estudiarlas (decisión explícita del usuario).

## [2026-07-07] fix | Convención de carpetas: notes/ y labs/ pasan a ser de primer nivel
Motivo: al ejecutar la auditoría de documentación de AI-200 se propuso inicialmente `certifications/AI-200/notes/` y `certifications/AI-200/labs/`, pero el usuario corrigió: `notes/<CERT>/` y `labs/<CERT>/` deben vivir en la raíz del repo, una subcarpeta por certificación; `certifications/<CERT>/` contiene únicamente `INDEX.md`.
CLAUDE.md actualizado: `notes/` y `labs/` salen de la lista de carpetas deprecated (siguen deprecated: agents/, architecture/, archive/, cheatsheets/, concepts/, processed/, prompts/, scripts/, templates/); nueva sección "notes/ y labs/ — material de estudio por certificación"; plantilla de INDEX.md corregida (enlaces a `labs/<CERT>/` y `examples/`, ya no a subcarpetas dentro de `certifications/<CERT>/`).
Movido: certifications/AI-200/notes/roadmap.md → notes/AI-200/roadmap.md (enlaces internos corregidos).

## [2026-07-07] audit | Auditoría de documentación, backlog y grafo de dependencias — AI-200
Fuente: inventario de raw/azure-docs/ (146 carpetas), raw/architecture-center/, raw/well-architected/, raw/github/ (azure-cli, azure-quickstart-templates, azure-sdk-for-net, azure-sdk-for-python, bicep).
Páginas creadas: notes/AI-200/documentation-audit.md (qué documentación local cubre AI-200 y qué se solapa/duplica), notes/AI-200/missing-documentation.md (fuentes oficiales relevantes no clonadas, con URL y carpeta recomendada), notes/AI-200/backlog.md (backlog priorizado de conceptos, sin desarrollar en knowledge/ todavía), notes/AI-200/knowledge-graph.md (grafo Mermaid de dependencias entre servicios), labs/AI-200/README.md (índice de módulos Learn, quickstarts y hands-on labs pendientes de clonar).
Páginas actualizadas: examples/README.md, examples/python/README.md, examples/azure-cli/README.md, examples/bicep/README.md (reescritos desde placeholders de una sesión anterior con enlaces "?utm_source=chatgpt.com"), certifications/AI-200/INDEX.md (enlaces a las nuevas notas), INDEX.md raíz.
Páginas nuevas en examples/: examples/csharp/README.md, examples/terraform/README.md, examples/rest-api/README.md.
Hallazgo: no hay clon local de Azure AI Foundry, Azure OpenAI, Azure AI Search, AI Agent Service, Content Safety ni Document Intelligence en `raw/azure-docs` — el temario de servicios de IA "puros" de AI-200 se apoya en `architecture-center/docs/ai-ml/` y `well-architected/well-architected/ai/` (completos) más los SDKs en `raw/github/azure-sdk-for-{python,net}/sdk/{ai,openai,search}`.
Pendiente (bloqueado hasta aprobación explícita del usuario): no se ha tocado `knowledge/` — ni auditoría, ni backlog, ni grafo desarrollan contenido ahí todavía.

## [2026-07-31] ingest | Roadmap de estudio AZ-104 + cleanup de carpetas
Fuente: learn.microsoft.com (página de certificación azure-administrator, study guide az-104, curso az-104t00 y sus 6 learning paths oficiales: az-104-administrator-prerequisites, az-104-manage-identities-governance, az-104-manage-storage, az-104-manage-compute-resources, az-104-manage-virtual-networks, az-104-monitor-backup-resources).
Página creada: notes/AZ-104/roadmap.md — 26 módulos oficiales mapeados a las 5 áreas de la skills outline (vigente 17/04/2026), con checkboxes, objetivos del examen por bloque, huecos "Notas propias", sección de gaps detectados (ARM/Bicep, ACR, Container Apps, App Gateway, Site Recovery, Network Watcher, private endpoints — no cubiertos por las rutas Beginner de MS Learn) y plan de sesiones. Ruta elegida por el usuario: autoestudio gratuito.
Páginas actualizadas: certifications/AZ-104/INDEX.md (progreso → en curso con enlace al roadmap; puntero de laboratorios corregido de `certifications/AZ-104/labs/` a `labs/AZ-104/`), INDEX.md raíz (AZ-104 → en curso).
Cleanup: eliminadas subcarpetas legadas vacías en certifications/AZ-104/ (cheatsheets, exam, examples, labs, notes) — restos de un scaffold anterior; certifications/<CERT>/ debe contener únicamente INDEX.md (ver CLAUDE.md).
Hallazgo: raw/azure-docs/articles/ cubre la mayoría de temas de AZ-104 (storage, virtual-network, app-service, application-gateway, load-balancer, dns, backup, site-recovery, bastion, container-apps, containers, azure-resource-manager, role-based-access-control, governance, cost-management-billing) pero NO active-directory (Entra ID, solo b2c), virtual-machines, azure-monitor ni network-watcher — el roadmap enlaza esos a Microsoft Learn directamente.
Pendiente: desarrollar el contenido real de knowledge/ (los stubs siguen sin desarrollar) y añadir labs y ejemplos conforme avance el estudio.

## [2026-07-31] ingest | Azure Cloud Shell (stub, primer módulo de AZ-104)
Fuente: https://learn.microsoft.com/en-us/training/modules/intro-to-azure-cloud-shell/ (ruta de prerrequisitos de AZ-104, Bloque 0).
Página creada: knowledge/azure-cloud-shell.md (stub con frontmatter + `## Relacionado`; pendiente de contenido — lo rellena el usuario al estudiar).
Páginas actualizadas: INDEX.md (fila en catálogo), certifications/AZ-104/INDEX.md (Conceptos relacionados), notes/AZ-104/roadmap.md (módulo bajo Bloque 0 + enlace en Relacionado).

## [2026-07-31] ingest | ARM Templates (stub, refuerzo del gap ARM/Bicep de AZ-104)
Fuente: https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/ (módulo fuera de la ruta oficial de cómputo; cubre el gap ARM/Bicep del Bloque 3).
Página creada: knowledge/arm-templates.md (stub con frontmatter + `## Relacionado` a [[Terraform vs Bicep]] y [[az104-Azure Cloud Shell]]; pendiente de contenido).
Páginas actualizadas: INDEX.md (fila en catálogo), certifications/AZ-104/INDEX.md (Conceptos relacionados), notes/AZ-104/roadmap.md (módulo bajo Bloque 3.1 + enlace en Relacionado).
Mantenimiento: creado assets/ (faltaba) para imágenes embebidas como `![[...]]`.

## [2026-08-17] create | Roadmap global de certificaciones
Fuente: síntesis propia sobre los INDEX.md de las 9 certificaciones activas (niveles y prerrequisitos según Microsoft Learn).
Páginas creadas: certifications/ROADMAP.md — vista de básico a experto (Fundamentals → Associate → Specialty → Expert) con diagrama Mermaid de dependencias, secuencia recomendada y estado actual.
Páginas actualizadas: INDEX.md (enlace al roadmap global en la sección Certificaciones).
Hallazgo: AZ-500 se retira el 31/08/2026 (ya anotado en su INDEX) — destacado en el roadmap: no da tiempo a prepararla de cero, verificar sucesor en Microsoft Learn.

## [2026-08-17] ingest | CertificationMaterials de John Savill en raw/
Fuente: https://github.com/johnthebrit/CertificationMaterials (verificado vía GitHub API: ~44 MB packed / 76 MB en disco, última actualización 2026-05-18, sin licencia explícita — uso privado, citar sin copiar).
Páginas actualizadas: raw/repos.txt (fuente savill-cert-materials), certifications/AZ-900/INDEX.md (whiteboard + handout), certifications/AZ-104/INDEX.md (whiteboard v2), certifications/AZ-500/INDEX.md, certifications/AZ-700/INDEX.md, certifications/AZ-305/INDEX.md (whiteboard), notes/AZ-104/roadmap.md (mapa del examen), certifications/ROADMAP.md (nota), INDEX.md (Raw sources).
Clon: raw/savill-cert-materials/ vía ./raw/setup-raw.sh --only savill-cert-materials (shallow).
Hallazgo: cobertura de whiteboards — AZ-900, AZ-104 (v2 y v1), AZ-500, AZ-700, AZ-305; NO hay para AZ-140, AZ-400, GH-900 ni AI-200 (solo AI-900/AI-901/AI-102, no activas).

## [2026-08-17] ingest | Roadmap de estudio AZ-900
Fuente: learn.microsoft.com — curso az-900t00 + las 4 rutas de la serie "Introducción a la infraestructura en la nube" (microsoft-azure-fundamentals-describe-cloud-concepts, azure-fundamentals-describe-azure-architecture-services, describe-azure-management-governance, introduction-cloud-infrastructure-apply-azure-skills-guided-projects), slugs verificados uno a uno.
Páginas creadas: notes/AZ-900/roadmap.md — 12 módulos oficiales mapeados 1:1 a las 3 áreas de la skills outline (vigente 20/07/2026), con checkboxes, objetivos del examen por bloque, "Notas propias", Bloque 4 opcional (8 proyectos guiados con sandbox), plan de sesiones y checklist pre-examen. labs/AZ-900/README.md — índice de laboratorios (vía práctica: proyectos guiados; la subcarpeta de la certificación activa ya existe).
Páginas actualizadas: certifications/AZ-900/INDEX.md (enlace al roadmap; punteros corregidos de certifications/AZ-900/labs|examples/ a labs/AZ-900/ y examples/), INDEX.md raíz (AZ-900 → en curso con roadmap).
Hallazgo: la serie pasó de 3 a 4 partes (~2026-08): nueva ruta de 8 proyectos guiados con sandbox gratuito, aún no listada en la página del curso AZ-900T00 (actualizada 31/03/2026). La ruta 2 pasó además de 4 a 5 módulos (split: servicios de proceso vs servicios de red).
Pendiente: desarrollar los stubs de knowledge/ conforme avance el estudio; registrar proyectos guiados completados en labs/AZ-900/.

## [2026-08-17] ingest | AZ-900 — checklist Learn × vídeos de Savill (12 módulos)
Fuente: las 3 rutas de Learn del curso az-900t00 verificadas sin caché el 17/08/2026 (títulos y slugs módulo a módulo) + "Video Table of Contents" del handout PDF de John Savill (johnthebrit/AZ900CertCourse, abril 2025; playlist del Full Course: PLlVtbbG169nED0_vMEniWBQjSoxTsBYS3).
Páginas creadas: knowledge/_template-az900.md (plantilla de nota por módulo: Concepto / Resumen en mis palabras / Por qué importa para el examen / Enlaces relacionados), knowledge/az900-*.md (12 fichas de estudio vacías — solo estructura y enlaces, el contenido lo rellena quien estudia), assets/images/AZ-900/AZ-900-Whiteboard.png (copia local de raw/savill-cert-materials/whiteboards/).
Páginas actualizadas: certifications/AZ-900/INDEX.md (sección Módulos → checklist secuencial 12 módulos con Learn + vídeo de Savill @duración + nota; nueva sección Repaso final con Study Cram, whiteboard embebida, handout y evaluación de práctica), INDEX.md raíz (nota sobre las fichas az900-*).
Hallazgo: la ruta 2 tiene de nuevo 5 módulos (proceso y red separados; ruta actualizada 2026-08-10, módulo de redes re-publicado 2026-08-09) — una lectura con caché devolvía el estado fusionado de 2025 (4 módulos). El "Full Course" de Savill no es un único vídeo con timestamps sino una playlist de vídeos cortos por tema: el [mm:ss] del handout es la duración de cada vídeo, así que el INDEX enlaza vídeo+@duración por tema en vez de &t=Xs. El handout (abril 2025) sigue la estructura antigua del examen (6 dominios); el cruce con los 12 módulos actuales es por tema, no por sección.

## [2026-09-28] lab | Bicep con ficheros de parámetros (AZ-104, módulo 02)
Fuente: práctica propia sobre la "Opción 2: fichero de parámetros" del módulo 02 (learn.microsoft.com/training/modules/create-azure-resource-manager-template-vs-code + docs de parameter files de Bicep).
Páginas creadas: labs/AZ-104/arm-templates/bicep-parameters/ — main.bicep (parámetros con decoradores @minLength/@maxLength/@allowed/@description), dev/prod.parameters.json (JSON clásico), dev.bicepparam (alternativa Bicep nativa), commands.sh (what-if, create con cada formato, bicep build, limpieza) y README.md con el flujo de resolución de parámetros.
Páginas actualizadas: knowledge/az104-arm-templates.md (enlace al lab en la sección Laboratorio).
Nota: los .parameters.json se pasan con @; los .bicepparam sin @ y se validan contra la plantilla al compilar.

## [2026-09-28] lab | ARM JSON con parámetros y salidas (AZ-104, módulo 02 unidad 4) — refactor sin Bicep
Fuente: learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/4-add-flexibility-arm-template?tabs=azure-cli (unidad 4: parámetros + salidas, tab Azure CLI).
Páginas creadas: labs/AZ-104/arm-templates/parameters/ — azuredeploy.json (storageAccountType igual que la unidad 4: defaultValue Standard_LRS + allowedValues con Premium_LRS; storageAccountName adicional con minLength/maxLength; output storageEndpoint con reference()), dev/prod.parameters.json, commands.sh (despliegue inline de la unidad 4 + what-if + consulta de outputs + limpieza) y README.md.
Páginas actualizadas: knowledge/az104-arm-templates.md (enlace de la sección Laboratorio repuntado a la nueva carpeta), notes/AZ-104/roadmap.md (lab añadido en la línea Lab del Bloque 0).
Mantenimiento: eliminado labs/AZ-104/arm-templates/bicep-parameters/ completo (creado esa misma sesión, nunca commiteado) — el usuario pidió el ejemplo en ARM JSON puro.

## [2026-09-29] refactor | Componentes arquitectónicos de Azure (AZ-104)
Fuente: refactor de referencias — el módulo 05 del AZ-104T00 apuntaba directamente a la ficha AZ-900 por ser el mismo módulo de Learn (describe-core-architectural-components-of-azure).
Páginas creadas: knowledge/az104-azure-architecture.md (ficha AZ-104 con plantilla _template-az104.md; sin duplicar contenido — callout que remite a la ficha AZ-900, solo enfoque operativo del examen: mover recursos y herencia RG/suscripción/MG).
Páginas actualizadas: notes/AZ-104/roadmap.md (línea del módulo repuntada), certifications/AZ-104/INDEX.md (módulo 05 repuntado), knowledge/az900-azure-architecture.md (backlink en Relacionado), INDEX.md raíz (recuento de fichas az104-* corregido 26→28 — ya había 27 en disco).

## [2026-09-29] refactor | Revertida la ficha AZ-104 de componentes arquitectónicos
Decisión del usuario: al ser exactamente el mismo módulo de Learn que el 04 de AZ-900, se referencia directamente la ficha AZ-900 y no se mantiene una ficha AZ-104 paralela (regla de no duplicación).
Páginas eliminadas: knowledge/az104-azure-architecture.md (creada y revertida en la misma sesión, sin commitear).
Páginas actualizadas: notes/AZ-104/roadmap.md y certifications/AZ-104/INDEX.md (módulo 05 de vuelta a la ficha AZ-900), knowledge/az900-azure-architecture.md (retirado el backlink), INDEX.md raíz (recuento definitivo: 27 fichas az104-*).

## [2026-09-30] lint | Imágenes de AZ-104
Páginas actualizadas: fichas AZ-104 de knowledge/, laboratorios AZ-104 y knowledge/az900-azure-architecture.md (referencias de imágenes locales con rutas relativas).
Assets: imágenes externas descargadas en assets/images/AZ-104/, incluidas seis capturas de Azure Files enlazadas desde knowledge/az104-azure-files.md; capturas pegadas renombradas según su contenido; una imagen de AZ-900 movida a assets/images/AZ-900/; cuatro archivos sin referencias eliminados de assets/images/AZ-104/.

## [2026-09-30] revisión | Laboratorio 07 de Azure Storage
Fuente: https://microsoftlearning.github.io/AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/LAB_07-Manage_Azure_Storage.html
Páginas actualizadas: labs/AZ-104/MicrosoftAzureAdministrator/AZ-104-MicrosoftAzureAdministrator..md (traducción, tabla de creación corregida y ejemplos por tarea), knowledge/az104-storage-security.md (imagen local y enlace al laboratorio).
Assets: capturas oficiales del laboratorio guardadas con nombres descriptivos en assets/images/AZ-104/.

## [2026-10-01] lint | Últimas imágenes remotas de AZ-104
Páginas actualizadas: knowledge/az104-app-service-plans.md, knowledge/az104-azure-files.md y labs/AZ-104/VM/Creación de una VM..md (enlaces de imagen remotos sustituidos por rutas locales relativas).
Assets: seis imágenes nuevas en assets/images/AZ-104/ (app-service-planes-portal.gif, app-service-condicion-escalado-automatico.png, azure-file-sync-cache.png, vm-crear-recurso.png, vm-panel-notificaciones.png, vm-ip-publica.png). Las seis capturas de Azure Files descargadas el 2026-09-30 se verificaron por checksum y solo faltaba re-enlazarlas.

## [2026-10-01] lint | Imagen pegada del Lab09a de App Service
Páginas actualizadas: labs/AZ-104/app-service/Lab09a-Implement-Web-Apps.md (imagen pegada renombrada y wikilink convertido a ruta relativa Markdown).
Assets: assets/images/AZ-104/Pasted image 20261001132023.png renombrada a app-service-scale-out-automatico.png (blade Scale out con escalado Automatic, máximo burst 2).

## [2026-10-01] lint | Imágenes remotas de App Service
Páginas actualizadas: knowledge/az104-app-service.md, labs/AZ-104/app-service/app-service..md y labs/AZ-104/app-service/Lab09a-Implement-Web-Apps.md (enlaces de imagen remotos sustituidos por rutas locales relativas; la imagen-enlace del diagrama de tareas del Lab09a se convirtió en imagen plana).
Assets: doce imágenes nuevas en assets/images/AZ-104/ con prefijo app-service-* (opciones-configuracion, cicd-github, centro-implementacion, ranuras-implementacion, dominio-personalizado, copias-seguridad, application-insights, lab09a-arquitectura, lab09a-tareas, creacion-portal, panel-url, web-navegador).
