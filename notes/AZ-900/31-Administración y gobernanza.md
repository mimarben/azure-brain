# Azure Storage — Ejercicios

## 1. Asignación de patrones de carga de trabajo

| Patrón de carga | Servicio Azure recomendado | Justificación |
|---|---|---|
| Almacenar imágenes, vídeos, copias de seguridad y documentos | **Azure Blob Storage** | Está diseñado para almacenar grandes cantidades de datos no estructurados. Ofrece alta durabilidad, escalabilidad y diferentes niveles de acceso (Hot, Cool, Cold y Archive). |
| Compartir archivos entre servidores y usuarios mediante SMB | **Azure Files** | Proporciona recursos compartidos de archivos administrados accesibles mediante SMB y NFS. Es adecuado para aplicaciones que necesitan un sistema de archivos compartido. |
| Procesar mensajes entre componentes de una aplicación | **Azure Queue Storage** | Permite almacenar mensajes de forma asíncrona entre productores y consumidores. Es útil para desacoplar componentes y absorber picos de carga. |
| Almacenar grandes cantidades de datos estructurados con acceso mediante clave | **Azure Table Storage** | Es un almacén NoSQL que proporciona almacenamiento de datos estructurados mediante entidades y claves. Es adecuado para grandes volúmenes de datos sin necesidad de un esquema relacional complejo. |

### Resumen

- **Blob Storage** → datos no estructurados.
- **Azure Files** → sistemas de archivos compartidos.
- **Queue Storage** → mensajes y procesamiento asíncrono.
- **Table Storage** → datos NoSQL estructurados.

---

# 2. Comparación LRS, ZRS, GRS y GZRS

| Opción | Protección principal | Zonas | Regiones | Coste relativo | Uso recomendado |
|---|---|---:|---:|---|---|
| **LRS** | Fallos locales de hardware | 1 | 1 | Bajo | Datos no críticos o cuando el coste es prioritario |
| **ZRS** | Fallo de una zona | 3 | 1 | Medio | Aplicaciones que necesitan alta disponibilidad dentro de una región |
| **GRS** | Fallo de una región | 1 | 2 | Medio/alto | Protección frente a desastres regionales |
| **GZRS** | Fallo de zona + región | 3 | 2 | Alto | Cargas críticas que necesitan máxima resiliencia |

## LRS — Locally Redundant Storage

Mantiene varias copias de los datos dentro de un único centro de datos de la región.

### Ventajas

- Menor coste.
- Buena protección frente a fallos de hardware locales.
- Adecuado para datos no críticos.

### Limitaciones

- No protege frente a la pérdida de una zona completa.
- No protege frente a la pérdida de una región.

---

## ZRS — Zone-Redundant Storage

Replica los datos de forma síncrona entre varias zonas de disponibilidad de una misma región.

### Ventajas

- Protección frente al fallo de una zona.
- Alta disponibilidad dentro de la región.
- No requiere depender de una segunda región.

### Limitaciones

- No protege frente a un desastre que afecte a toda la región.
- Coste superior a LRS.

---

## GRS — Geo-Redundant Storage

Mantiene los datos en la región primaria y replica los datos en una región secundaria.

### Ventajas

- Protección frente a la pérdida de la región primaria.
- Adecuado para recuperación ante desastres.

### Limitaciones

- La replicación hacia la región secundaria es asíncrona.
- Puede existir pérdida de datos en caso de desastre, por lo que el RPO no es cero.
- Mayor coste que LRS.

---

## GZRS — Geo-Zone-Redundant Storage

Combina las ventajas de ZRS y GRS.

Los datos se replican entre varias zonas de la región primaria y posteriormente se replican a una región secundaria.

### Ventajas

- Protección frente al fallo de una zona.
- Protección frente al fallo de una región.
- Alta disponibilidad y elevada durabilidad.
- Adecuado para cargas empresariales críticas.

### Limitaciones

- Mayor coste.
- La replicación geográfica sigue siendo asíncrona.

---

## Recomendación

Para una aplicación empresarial crítica con:

- **RPO inferior a 15 minutos**
- Alta disponibilidad
- Protección frente a pérdida de una zona
- Protección frente a pérdida de una región
- Presupuesto limitado pero con necesidad de resiliencia

La opción recomendada sería **GZRS**, siempre que el servicio y la región admitan esta configuración.

GZRS proporciona redundancia dentro de la región mediante varias zonas y además mantiene una copia geográfica en una segunda región.

Sin embargo, hay que tener en cuenta que **GZRS por sí solo no garantiza un RPO inferior a 15 minutos**, ya que la replicación geográfica es asíncrona. Si el RPO de menos de 15 minutos es un requisito estricto, se deben complementar los mecanismos de redundancia con una estrategia específica de backup, replicación o recuperación ante desastres.

### Conceptos clave

- **RPO (Recovery Point Objective)** → cantidad máxima de datos que se acepta perder.
- **RTO (Recovery Time Objective)** → tiempo máximo aceptable para recuperar el servicio.
- **Disponibilidad** → capacidad del servicio para permanecer operativo.
- **Durabilidad** → probabilidad de que los datos permanezcan intactos.

---

# 3. Herramientas para migración de datos

| Herramienta | Uso principal | Cuándo utilizarla |
|---|---|---|
| **Azure Migrate** | Evaluación y planificación de migraciones | Antes de comenzar una migración para descubrir y evaluar servidores y cargas de trabajo |
| **Azure Data Box** | Transferencia física de grandes volúmenes de datos | Cuando existen grandes cantidades de datos y la transferencia por Internet no es viable |
| **AzCopy** | Transferencia de datos mediante línea de comandos | Para automatizar o realizar transferencias entre almacenamiento local y Azure |
| **Azure Storage Explorer** | Administración y transferencia mediante interfaz gráfica | Para usuarios que necesitan gestionar Storage mediante una herramienta visual |
| **Azure File Sync** | Sincronización entre servidores locales y Azure Files | Cuando se necesita mantener datos locales sincronizados con Azure |

## Lista de comprobación de migración

### 1. Evaluación

- [ ] Identificar servidores, aplicaciones y datos que deben migrarse.
- [ ] Analizar dependencias entre aplicaciones.
- [ ] Evaluar capacidad, rendimiento y requisitos de las cargas.
- [ ] Utilizar **Azure Migrate** para realizar el descubrimiento y la evaluación.
- [ ] Determinar los requisitos de seguridad y cumplimiento.

### 2. Planificación

- [ ] Seleccionar el servicio de almacenamiento de Azure adecuado.
- [ ] Determinar la región de Azure.
- [ ] Elegir el nivel de redundancia: LRS, ZRS, GRS o GZRS.
- [ ] Calcular el volumen de datos que debe transferirse.
- [ ] Determinar si la transferencia por Internet es viable.
- [ ] Definir RPO y RTO.
- [ ] Planificar una estrategia de backup y recuperación.

### 3. Transferencia

- [ ] Utilizar **AzCopy** para transferencias mediante CLI.
- [ ] Utilizar **Azure Storage Explorer** cuando sea necesaria una interfaz gráfica.
- [ ] Utilizar **Azure Data Box** cuando el volumen de datos sea demasiado grande para una transferencia eficiente por Internet.
- [ ] Utilizar **Azure File Sync** cuando se necesite mantener archivos locales sincronizados con Azure Files.
- [ ] Monitorizar el progreso de la transferencia.

### 4. Validación

- [ ] Comprobar que todos los datos han sido transferidos.
- [ ] Verificar permisos y accesos.
- [ ] Comprobar la integridad de los datos.
- [ ] Validar el rendimiento.
- [ ] Comprobar que las aplicaciones pueden acceder correctamente a los datos.
- [ ] Realizar pruebas de recuperación.

### 5. Puesta en producción

- [ ] Cambiar las aplicaciones para utilizar el almacenamiento de Azure.
- [ ] Monitorizar el entorno.
- [ ] Configurar alertas.
- [ ] Verificar costes.
- [ ] Confirmar que los backups funcionan correctamente.
- [ ] Documentar la arquitectura final.
- [ ] Mantener un plan de rollback en caso de problemas.

---

# Resumen para recordar

```text
Azure Blob Storage
        ↓
Datos no estructurados
Imágenes, vídeos, backups, documentos

Azure Files
        ↓
Sistema de archivos compartido
SMB / NFS

Azure Queue Storage
        ↓
Mensajería asíncrona
Desacoplar aplicaciones

Azure Table Storage
        ↓
NoSQL
Datos estructurados mediante claves