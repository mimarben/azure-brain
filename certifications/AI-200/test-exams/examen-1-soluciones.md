---
title: AI-200 Simulacro 1 — Soluciones
tags: [certification, exam-sim]
certification: [AI-200]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-200
  - notes/AI-200/roadmap.md
---

# Soluciones — Simulacro 1 de AI-200 (mixto)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | C | 10 | C | 19 | A + C | 28 | D |
| 2 | B | 11 | D | 20 | B | 29 | A |
| 3 | B | 12 | B | 21 | D | 30 | C |
| 4 | A | 13 | A | 22 | A | 31 | a Sí · b No · c Sí |
| 5 | C | 14 | B | 23 | B | 32 | A |
| 6 | D | 15 | B | 24 | A | 33 | D |
| 7 | B | 16 | A | 25 | A | 34 | B |
| 8 | a Sí · b Sí · c No | 17 | D | 26 | a No · b Sí · c Sí | | |
| 9 | A | 18 | C | 27 | B | | |

**Puntuación:** ___ / 40. Aprobado ≥ 28 (70 %).

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Contenedores en Azure (20–25 %) | 2, 5, 8, 12, 17, 21, 25, 28 | ___ / 10 |
| Servicios de datos para IA (25–30 %) | 1, 4, 7, 11, 14, 16, 19, 23, 27, 29, 32, 33 | ___ / 12 |
| Conexión y consumo de servicios (20–25 %) | 3, 9, 13, 18, 22, 26, 34 | ___ / 9 |
| Protección y supervisión (20–25 %) | 6, 10, 15, 20, 24, 30, 31 | ___ / 9 |

## Explicaciones

> Los temas sin página local en `knowledge/` enlazan al módulo oficial de Learn y quedan como candidatos para el [backlog](../../../notes/AI-200/backlog.md).

1. **C — Session.** Con escritura multi-región, Session garantiza *read-your-own-writes* dentro de la sesión del cliente con baja latencia y sin el coste de Strong. Módulo: [Optimize query performance for Azure Cosmos DB](https://learn.microsoft.com/en-us/training/modules/optimize-query-performance-azure-cosmos-db/).
2. **B — Premium.** La geo-replicación de ACR es exclusiva de Premium (también imagen geográfica por regiones).
3. **B — topic + suscripciones.** Cada suscripción recibe su copia independiente (y puede filtrar). Una cola entrega cada mensaje a **un solo** consumidor competidor.
4. **A.** `vector(n)` fija las **dimensiones**, que deben casar con el modelo de embeddings (p. ej. 1536 para ada-002/text-embedding-3-small). Módulo: [Implement vector search with Azure Database for PostgreSQL](https://learn.microsoft.com/en-us/training/modules/implement-vector-search-azure-database-postgresql/).
5. **C — KEDA con min 0.** Container Apps escala a cero según reglas KEDA (HTTP, colas, eventos). El mínimo de réplicas 0 es lo que permite no pagar sin tráfico.
6. **D — Key Vault Secrets User.** Rol RBAC de Key Vault de solo lectura de secretos para la identidad — mínimo privilegio. Ver [Key Vault](../../../knowledge/key-vault.md) y [managed identities](../../../knowledge/managed-identities.md).
7. **B — Bounded Staleness.** Único nivel que te deja **acotar** el desfase (K escrituras o T segundos); Strong es lineal y caro; Eventual no acota nada.
8. **a Sí · b Sí · c No.** KEDA es el motor de escalado de Container Apps; el Deployment usa su ReplicaSet para el estado deseado; Container Apps es serverless — **no** gestionas clúster.
9. **A — sesiones.** FIFO por sesión con `SessionId` + receptor de sesión exclusivo. Sin sesiones no hay garantía de orden en colas/particiones.
10. **C — feature flag con filtro de porcentaje.** Rollout gradual sin redesplegar, gestionado en App Configuration. Módulo: [Manage application settings with Azure App Configuration](https://learn.microsoft.com/en-us/training/modules/manage-app-settings-app-config/).
11. **D — excludedPaths.** No indexar las propiedades grandes que no consultas baja el consumo de RU por escritura. (Por defecto Cosmos indexa todo.)
12. **B — identidad administrada + AcrPull.** Pull sin credenciales, sin secretos en configuración; mismo patrón que AKS en la pregunta 28. Ver [managed identities](../../../knowledge/managed-identities.md).
13. **A — Event Grid.** Modelo push: el evento *blob created* dispara tu handler al instante; Service Bus es para colas (sondeo/broker), no para eventos discretos.
14. **B — índice de rango.** `ORDER BY` exige índice range sobre la propiedad; si la excluyes de la indexación, la consulta falla. Clásico de examen.
15. **B — referencias a Key Vault.** App Configuration resuelve la referencia al vuelo: el secreto vive en el vault y la app lo refresca sin cambiar configuración.
16. **A — change feed processor.** Con contenedor de *leases* para checkpoint y reparto por particiones entre instancias; fiable ante reinicios.
17. **D — ingress internal.** Solo expone la app dentro del entorno/VNet. NSG/Front Door no eliminan el endpoint público del ingress.
18. **C — $DeadLetterQueue.** TTL expirado, maxDeliveryCount superado o error van a la subcola DLQ, donde puedes inspeccionarlos.
19. **A + C.** TTL para que lo cacheado caduque (respuesta y embeddings, según tu estrategia de invalidación) + vector set para ANN sobre los embeddings cacheados. Sin expiración, la caché crece sin control. Módulo: [Implement vector storage in Azure Managed Redis](https://learn.microsoft.com/en-us/training/modules/implement-vector-storage-azure-managed-redis/).
20. **B — traces.** Spans jerárquicos (padre/hijo) que encadenan los saltos entre servicios con duración. Los logs son eventos sueltos; las métricas son agregados.
21. **D — traffic split entre revisiones.** Nativamente en Container Apps: activación de revisiones y reparto de % de tráfico.
22. **A — peek-lock.** Bloquea el mensaje, procesa, `Complete()` confirma y `Abandon()` lo devuelve para reentrega → *at-least-once*. Receive-and-delete es *at-most-once* (pérdidas si falla el proceso).
23. **B — pre-trigger.** Se ejecuta **antes** de la operación sobre el item; valida/añade propiedades server-side. El post-trigger llega tarde para validar la escritura.
24. **A — URI sin versión.** Consultando por nombre obtienes siempre la última versión activa; el rotado de versiones no rompe a las apps.
25. **A — `--type=LoadBalancer`.** Crea un Service de AKS respaldado por un Azure LB público. ClusterIP es interno. Módulo: [Deploy applications to AKS](https://learn.microsoft.com/en-us/training/modules/deploy-apps-azure-kubernetes-service/).
26. **a No · b Sí · c Sí.** Sin sesiones/particiones no hay FIFO garantizado en Service Bus; Event Grid entrega push con reintentos y dead-lettering; Durable Functions persiste el estado de la orquestación (checkpoints).
27. **B — `<=>`.** `<=>` es distancia de **coseno**, `<->` es L2 y `<#>` es producto interno negativo; para similitud se ordena ASC y se hace LIMIT.
28. **D — `az aks update --attach-acr`.** Concede a la identidad del kubelet el rol AcrPull; pull automático sin secrets. Igual de válido:dar AcrPull a la identidad manejada del kubelet directamente.
29. **A — pooling.** PgBouncer (o el pooler integrado de Flexible Server) multiplexa conexiones cliente↔servidor: es la solución estructural, no subir compute.
30. **C.** Filtra fallos 24 h, cuenta por nombre de operación (`Name`) y ordena desc: ranking de operaciones por fallos.
31. **a Sí · b No · c Sí.** OTel es CNCF y vendor-neutral; **no** sustituye las métricas de plataforma de Azure Monitor (se complementan); en App Service hay instrumentación codeless de App Insights.
32. **A.** Directiva de embeddings vectoriales + índice vectorial en el contenedor, y `VectorDistance` en las consultas. Módulo: [Implement vector search on Azure Cosmos DB](https://learn.microsoft.com/en-us/training/modules/implement-vector-search-azure-cosmos-db/).
33. **D — alta cardinalidad.** Una clave de partición de baja cardinalidad concentra todo en pocas particiones (particiones calientes → 429). La clave ideal distribuye uniformemente la carga y el almacenamiento. (El timestamp único dispersa, pero suele romper las consultas cross-partición y la actualización; la respuesta de examen es alta cardinalidad con patrón de consulta alineado.)
34. **B — Premium.** Instancias siempre listas (sin cold start), VNet integrada y escalado superior al plan Consumo.

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| | | | |
