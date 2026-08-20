# Log

Registro cronológico de ingestas, consultas y lints. Formato: `## [YYYY-MM-DD] tipo | Título`.

## [2026-08-03] maintenance | Guard de estado local en raw setup
Fuente: petición del usuario
Páginas actualizadas: raw/setup-raw.sh, raw/setup-raw.ps1, log.md
Notas: antes de hacer `pull --ff-only` sobre un repo ya clonado en `raw/`, los scripts comprueban cambios locales; si el repo no está limpio, muestran `git status` y saltan la actualización de ese repo.

## [2026-08-03] example | Aplicación con Microsoft Entra ID
Fuente: https://learn.microsoft.com/es-es/azure/app-service/quickstart-nodejs?tabs=windows&pivots=development-environment-vscode + documentación base de App Service authentication con Microsoft Entra.
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
Fuente: learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/{ai-200,az-104,az-500,az-140,az-305,az-400,az-700,gh-900,az-900}
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
Fuente: https://learn.microsoft.com/es-es/training/modules/intro-to-azure-cloud-shell/ (ruta de prerrequisitos de AZ-104, Bloque 0).
Página creada: knowledge/azure-cloud-shell.md (stub con frontmatter + `## Relacionado`; pendiente de contenido — lo rellena el usuario al estudiar).
Páginas actualizadas: INDEX.md (fila en catálogo), certifications/AZ-104/INDEX.md (Conceptos relacionados), notes/AZ-104/roadmap.md (módulo bajo Bloque 0 + enlace en Relacionado).

## [2026-07-31] ingest | ARM Templates (stub, refuerzo del gap ARM/Bicep de AZ-104)
Fuente: https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/ (módulo fuera de la ruta oficial de cómputo; cubre el gap ARM/Bicep del Bloque 3).
Página creada: knowledge/arm-templates.md (stub con frontmatter + `## Relacionado` a [[Terraform vs Bicep]] y [[Azure Cloud Shell]]; pendiente de contenido).
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
