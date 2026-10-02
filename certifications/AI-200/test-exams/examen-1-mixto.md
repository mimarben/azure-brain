---
title: AI-200 Simulacro 1 — Mixto
tags: [certification, exam-sim]
certification: [AI-200]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-200
  - https://www.certlibrary.com/exam/AI-200
  - notes/AI-200/roadmap.md
---

# Simulacro 1 — Mixto estilo real

**40 ítems · 100 minutos · libro cerrado.** Dificultad mezclada como el examen real. Preguntas originales alineadas con la skills outline (los ítems reales están bajo NDA).

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna. Al terminar, pide **«corrige el examen de AI-200»** y se leerán tus marcas contra [examen-1-soluciones.md](examen-1-soluciones.md).

---

**1.** *(Una respuesta)* Una app escribe en una base de datos de Azure Cosmos DB configurada con **escrituras en varias regiones**. El requisito: cada usuario debe **leer sus propias escrituras**, con la menor latencia y el menor coste posible. ¿Qué nivel de coherencia usas?

- [ ] A. Strong
- [ ] B. Eventual
- [ ] C. Session
- [ ] D. Consistent Prefix

**2.** *(Una respuesta)* Tu instancia de Azure Container Registry debe **replicar las imágenes automáticamente** en varias regiones geográficas para acercarlas a los despliegues. ¿Qué SKU usas?

- [ ] A. Basic
- [ ] B. Premium
- [ ] C. Standard
- [ ] D. Cualquiera soporta geo-replicación

**3.** *(Una respuesta)* Un pipeline de procesamiento tiene **tres consumidores independientes** y cada uno debe recibir **una copia de todos los mensajes**. ¿Qué usas en Azure Service Bus?

- [ ] A. Una cola (queue) con tres clientes compitiendo
- [ ] B. Un tema (topic) con tres suscripciones
- [ ] C. Azure Event Grid con tres filtros idénticos
- [ ] D. Una tabla de Cosmos DB por consumidor

**4.** *(Una respuesta — exhibit)* Tu tabla de Azure Database for PostgreSQL tiene:

```sql
CREATE EXTENSION vector;
ALTER TABLE docs ADD COLUMN embedding vector(1536);
```

¿Qué significa el **1536**?

- [ ] A. El número de dimensiones de los embeddings — debe coincidir con la salida del modelo de embeddings usado
- [ ] B. El número máximo de filas indexadas
- [ ] C. El tamaño máximo en bytes de cada vector
- [ ] D. La precisión decimal de los componentes del vector

**5.** *(Una respuesta)* Una API en Azure Container Apps recibe tráfico irregular y quieres **no pagar cómputo cuando no hay peticiones**, escalando desde cero según peticiones HTTP en cola. ¿Qué configuras?

- [ ] A. Un mínimo de 3 réplicas para absorber picos
- [ ] B. Un plan dedicado con instancias fijas
- [ ] C. Escalado **KEDA** basado en HTTP con mínimo de 0 réplicas
- [ ] D. Azure Functions en su lugar, obligatoriamente

**6.** *(Una respuesta)* Una app desplegada en App Service (con identidad administrada asignada) debe **leer secretos** de Key Vault con el menor privilegio. ¿Qué configuras?

- [ ] A. Una política de acceso con permisos de claves y certificados
- [ ] B. El rol Owner sobre el Key Vault
- [ ] C. La clave de la cuenta de almacenamiento del vault
- [ ] D. El rol **Key Vault Secrets User** para la identidad administrada (RBAC de Key Vault)

**7.** *(Una respuesta)* El negocio tolera leer datos con un **desfase acotado y cuantificable** (en número de operaciones o segundos) a cambio de mejor latencia y disponibilidad multi-región. ¿Qué nivel de coherencia de Cosmos DB eliges?

- [ ] A. Strong
- [ ] B. Bounded Staleness
- [ ] C. Eventual
- [ ] D. Session

**8.** *(Serie Sí/No — 3 ítems)* Sobre contenedores en Azure:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Azure Container Apps escala con reglas **KEDA** basándose en métricas o eventos externos | [ ] | [ ] |
| b | En AKS, un **Deployment** mantiene el número deseado de réplicas mediante su ReplicaSet | [ ] | [ ] |
| c | Azure Container Apps requiere que aprovisiones y administres un clúster de Kubernetes antes de desplegar | [ ] | [ ] |

**9.** *(Una respuesta)* En Service Bus, los mensajes de un mismo cliente deben procesarse **en orden y de forma exclusiva** (FIFO por cliente). ¿Qué usas?

- [ ] A. **Sesiones** (mensajes con el mismo `SessionId`, receptor por sesión)
- [ ] B. Particiones en la cola
- [ ] C. Duplicar la cola por cliente
- [ ] D. Recepción en modo peek-lock por lotes

**10.** *(Una respuesta)* Quieres desplegar una nueva funcionalidad al **20 % de los usuarios** y subirlo gradualmente, sin redesplegar la app. ¿Qué usas?

- [ ] A. Dos despliegues de App Service y un Traffic Manager weighted 80/20
- [ ] B. Una variable de entorno por usuario
- [ ] C. Un **feature flag** en Azure App Configuration con filtro de porcentaje
- [ ] D. Un slot de staging con tráfico al 20 %

**11.** *(Una respuesta — exhibit)* Tu contenedor de Cosmos DB guarda documentos donde el campo `content` (texto largo, nunca consultado) dispara el consumo de RU. ¿Qué cambias en la directiva de indexación?

- [ ] A. Nada: Cosmos indexa todo por defecto y no se puede cambiar
- [ ] B. Pasar el contenedor a modo serverless
- [ ] C. Indexar solo ese campo
- [ ] D. Añadir `content` a los **excludedPaths** para no indexarlo

**12.** *(Una respuesta)* Una web app en App Service debe desplegarse desde tu Azure Container Registry **sin credenciales ni contraseñas** en la configuración. ¿Qué usas?

- [ ] A. El usuario admin del registro con su contraseña en un secret
- [ ] B. La **identidad administrada** de la web app con permiso de pull (AcrPull) sobre el registro
- [ ] C. Un token de SAS de lectura en el registro
- [ ] D. Copiar la imagen a un registro público

**13.** *(Una respuesta)* Un workflow debe **reaccionar al instante** cuando se crea un blob en un contenedor, sin sondear. ¿Qué usas?

- [ ] A. **Azure Event Grid** con un evento de blob creado que dispara el handler
- [ ] B. Azure Service Bus con un temporizador
- [ ] C. Un bucle `while` con `sleep(60)` en Azure Functions
- [ ] D. Azure Logic Apps con un trigger de periodicidad

**14.** *(Una respuesta)* Una consulta Cosmos DB con `ORDER BY docs.rating DESC` empieza a fallar con "order by" no soportado tras endurecer la directiva de indexación. ¿Qué debe tener el índice?

- [ ] A. Un índice espacial sobre el contenedor
- [ ] B. Un índice de rango (range) sobre la propiedad por la que se ordena
- [ ] C. Claves de partición compuestas
- [ ] D. El índice vectorial DiskANN habilitado

**15.** *(Una respuesta)* En Azure App Configuration, los valores de configuración no deben contener secretos en claro, y deben actualizarse cuando el secreto rote en Key Vault. ¿Qué usas?

- [ ] A. Copiar los secretos en App Configuration cada mes
- [ ] B. **Referencias a Key Vault** en los valores de App Configuration
- [ ] C. Variables de entorno del contenedor con el secreto
- [ ] D. Un webhook que reescriba la configuración

**16.** *(Una respuesta)* Debes procesar **todos los cambios** de un contenedor de Cosmos DB de forma fiable, escalando por particiones y recordando el progreso tras reinicios. ¿Qué usas?

- [ ] A. El **change feed processor** (con contenedor de leases)
- [ ] B. Consultas `SELECT *` periódicas con timestamp
- [ ] C. Un trigger post-operación por escritura
- [ ] D. La replicación geográfica del contenedor

**17.** *(Una respuesta)* Una Container App solo debe ser accesible **desde dentro de la red virtual** (API interna entre servicios), sin exposición pública. ¿Qué configuras?

- [ ] A. Un private endpoint para la Container App
- [ ] B. Una regla NSG de denegación en la subred
- [ ] C. Azure Front Door con listas de IP
- [ ] D. El ingress en modo **internal** (solo entorno interno/VNet)

**18.** *(Una respuesta)* En Service Bus, ¿a dónde van los mensajes que **expiran (TTL) o superan el máximo de entregas** sin procesarse?

- [ ] A. Se borran definitivamente
- [ ] B. Vuelven a la cola original con prioridad alta
- [ ] C. A la subcola **dead-letter** (`$DeadLetterQueue`) de la cola o suscripción
- [ ] D. A una cuenta de almacenamiento del namespace

**19.** *(Una respuesta — elige dos)* Tu solución RAG debe **reducir la latencia y el coste** de las consultas repetidas y acelerar la búsqueda por similitud sobre embeddings cacheados en Azure Managed Redis. ¿Qué dos mecanismos usas?

- [ ] A. Expiración (**TTL**) de las respuestas/cacheadas y embeddings
- [ ] B. Escritura de los vectores en claves persistentes sin expiración
- [ ] C. Almacenar los embeddings en un **vector set** para búsqueda aproximada (ANN)
- [ ] D. Replicación geográfica de la caché

**20.** *(Una respuesta)* Quieres seguir **una petición a través de varios microservicios** (API → Functions → Cosmos) y ver el camino completo con tiempos. ¿Qué señal de OpenTelemetry te da eso?

- [ ] A. Los logs estructurados
- [ ] B. Los **traces** (con spans padre/hijo por servicio)
- [ ] C. Las métricas de contador
- [ ] D. Los eventos de Event Grid

**21.** *(Una respuesta)* Quieres desplegar una nueva revisión de tu Container App y **enviarle el 10 % del tráfico** durante una hora antes del corte total. ¿Qué usas?

- [ ] A. Dos entornos de Container Apps y un Traffic Manager
- [ ] B. Un slot de staging con swap
- [ ] C. Azure Front Door con weighting
- [ ] D. El **reparto de tráfico entre revisiones** (traffic split) de Container Apps

**22.** *(Una respuesta)* Un consumidor de Service Bus debe procesar mensajes **sin perder ninguno** aunque el procesamiento falle: tras recibirlo, procesa y luego lo completa; si falla, lo abandona y se reentrega. ¿Qué modo usa?

- [ ] A. **Peek-lock** (bloqueo + complete/abandon)
- [ ] B. Receive-and-delete
- [ ] C. Sesiones transaccionales en batch
- [ ] D. Suscripción durable de Event Grid

**23.** *(Una respuesta)* Antes de insertar documentos en Cosmos DB quieres **añadir y validar propiedades server-side** (p. ej. sellar `createdAt` si falta), sin confiar en el cliente. ¿Qué usas?

- [ ] A. Un **pre-trigger** en el contenedor
- [ ] B. Un post-trigger asíncrono
- [ ] C. Una función de Azure en el pipeline
- [ ] D. La propiedad `ttl` del contenedor

**24.** *(Una respuesta)* Rotas un secreto de Key Vault generando una **nueva versión**. ¿Cómo evitas tocar la configuración de las apps?

- [ ] A. Las apps siempre consultan la **última versión por nombre** (URI sin versión) y el nuevo valor se aplica tras el refresco
- [ ] B. Hay que recrear el secreto con el mismo nombre exacto, borrando el anterior
- [ ] C. Key Vault reescribe automáticamente la configuración de las apps
- [ ] D. No se puede: las versiones son inmutables y exclusivas

**25.** *(Una respuesta)* En AKS, expones tu Deployment a internet con IP pública del balanceador de Azure. ¿Qué haces?

- [ ] A. `kubectl expose deployment api --type=LoadBalancer --port=80`
- [ ] B. `kubectl expose deployment api --type=ClusterIP --port=80`
- [ ] C. Crear un Ingress sin controlador
- [ ] D. `kubectl scale deployment api --replicas=2`

**26.** *(Serie Sí/No — 3 ítems)* Sobre mensajería e integración:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Una cola de Service Bus garantiza orden FIFO estricto sin configurar nada | [ ] | [ ] |
| b | Event Grid entrega los eventos en **push** con reintentos y soporte de dead-letter | [ ] | [ ] |
| c | Durable Functions orquesta flujos de larga duración guardando checkpoints del progreso | [ ] | [ ] |

**27.** *(Una respuesta — exhibit)* Para recuperar los documentos **más similares** a un embedding dado por **coseno** en pgvector, ¿qué consulta usas?

- [ ] A. `SELECT id FROM docs ORDER BY embedding <-> $1 LIMIT 10`
- [ ] B. `SELECT id FROM docs ORDER BY embedding <=> $1 LIMIT 10`
- [ ] C. `SELECT id FROM docs WHERE embedding = $1`
- [ ] D. `SELECT id FROM docs ORDER BY embedding <#> $1 DESC LIMIT 10`

**28.** *(Una respuesta)* Tu clúster de AKS debe tirar de imágenes de un ACR privado sin credenciales en manifiestos ni secrets manuales. ¿Qué haces?

- [ ] A. Activar el usuario admin de ACR y meterlo como secret del namespace
- [ ] B. Hacer público el registro durante los despliegues
- [ ] C. Un imagePullSecret rotado a mano cada 30 días
- [ ] D. **Adjuntar el ACR al clúster** (`az aks update --attach-acr`), que da a la identidad del kubelet el rol AcrPull

**29.** *(Una respuesta)* Una API con **muchas conexiones cortas** a PostgreSQL agota las conexiones y lanza errores. ¿Qué aplicas?

- [ ] A. **Agrupación de conexiones** (PgBouncer / el pooler integrado de Flexible Server)
- [ ] B. Subir el compute del servidor hasta que cese
- [ ] C. Reintentar con backoff exponencial sin más
- [ ] D. Leer desde una réplica de lectura

**30.** *(Una respuesta — exhibit)* ¿Qué devuelve esta consulta sobre Application Insights (workspace-based)?

```kusto
AppRequests
| where TimeGenerated > ago(24h) and Success == false
| summarize Fallos = count() by Name
| order by Fallos desc
```

- [ ] A. El total de peticiones de las últimas 24 h por operación
- [ ] B. La latencia media de las peticiones fallidas
- [ ] C. El **número de peticiones fallidas por operación**, ordenado de más a menos fallos
- [ ] D. Las operaciones sin peticiones en 24 h

**31.** *(Serie Sí/No — 3 ítems)* Sobre observabilidad:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | OpenTelemetry es un estándar **vendor-neutral** (CNCF) para traces, métricas y logs | [ ] | [ ] |
| b | Instrumentar con OpenTelemetry sustituye las métricas de plataforma que Azure Monitor recopila por defecto | [ ] | [ ] |
| c | En App Service, Application Insights se puede habilitar **sin tocar el código** (codeless) | [ ] | [ ] |

**32.** *(Una respuesta)* Habilitar búsqueda vectorial en un contenedor de Cosmos DB para NoSQL requiere:

- [ ] A. Una **directiva de embeddings vectoriales** y un **índice vectorial** en el contenedor, consultando con `VectorDistance`
- [ ] B. Guardar los vectores como JSON y filtrar con `LIKE`
- [ ] C. Habilitar el change feed
- [ ] D. Un nivel de coherencia Strong obligatorio

**33.** *(Una respuesta)* Un contenedor de Cosmos DB está sobrecargado (429s) porque casi todas las consultas filtran por una propiedad de **baja cardinalidad** usada como clave de partición. ¿Qué partition key elegirías?

- [ ] A. La misma propiedad: ya está calentada
- [ ] B. Una propiedad numérica cualquiera
- [ ] C. El timestamp de creación: es único
- [ ] D. Una propiedad de **alta cardinalidad** que distribuya uniformemente las particiones y los RU

**34.** *(Una respuesta)* Tu Function App necesita **eliminación del arranque en frío** y acceso privado por la red virtual al resto de servicios. ¿Qué plan de hospedaje usas?

- [ ] A. Consumo
- [ ] B. **Premium**
- [ ] C. Dedicado (App Service plan Basic)
- [ ] D. Consumo flexible con VNet parcial

---

*Fin del simulacro 1 de AI-200. Corrige ahora en [examen-1-soluciones.md](examen-1-soluciones.md) — o pide «corrige el examen de AI-200».*
