Debe crear una cuenta de Azure Storage que admita las funcionalidades de Azure Data Lake Storage Gen2.

¿Qué dos tipos de cuentas de almacenamiento puede usar? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

blobs en bloques premium

**Esta respuesta es correcta.**

Recursos compartidos de archivos de nivel premium

**Esta respuesta no es correcta.**

uso general estándar, v2

**Esta respuesta es correcta.**

blobs de páginas premium

Para admitir Data Lake Storage, la cuenta de almacenamiento debe admitir Blob Storage, que está disponible como blobs en bloques estándar de uso general v2 y Premium. Además, al crear una cuenta de almacenamiento, debe habilitar el espacio de nombres jerárquico.

[Crear una cuenta de almacenamiento para Azure Data Lake Storage Gen2: Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/create-data-lake-storage-account)

Determine los tipos de cuenta de almacenamiento - Entrenamiento | Microsoft Learn

___
Ha implementado una aplicación web en Microsoft Azure mediante un Microsoft Load Balancer público para distribuir el tráfico entre máquinas virtuales. Los usuarios notifican problemas de conectividad intermitentes.

Debe solucionar los problemas de conectividad para el acceso coherente a las aplicaciones.

Cada respuesta correcta presenta parte de la solución. ¿Qué dos acciones debe realizar?

Seleccione todas las respuestas que procedan.

Cambie el modo de distribución del equilibrador de carga a Afinidad de IP de origen.

Compruebe la configuración del sondeo de estado.

**Esta respuesta es correcta.**

Compruebe las reglas del grupo de seguridad de red para las máquinas virtuales.

**Esta respuesta no es correcta.**

Compruebe las SKU coincidentes para el equilibrador de carga y la dirección IP pública.

**Esta respuesta es correcta.**

La comprobación de la configuración del sondeo de estado es fundamental porque un sondeo inactivo o configurado incorrectamente puede provocar que el tráfico se enrute a instancias incorrectas, lo que provoca problemas de conectividad. La comprobación de las SKU coincidentes para el equilibrador de carga y la dirección IP pública también es esencial, ya que las SKU no coincidentes pueden interrumpir el funcionamiento adecuado y provocar problemas de conectividad. La comprobación de las reglas del grupo de seguridad de red puede parecer relevante, pero no aborda la causa principal de los problemas de conectividad. Cambiar el modo de distribución del equilibrador de carga podría parecer que podría mejorar la persistencia de la sesión, pero no resuelve los problemas de configuración subyacentes que causan los problemas de conectividad.

[Improvear la escalabilidad y resistencia de las aplicaciones mediante Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer)
___
Su organización usa un Azure Load Balancer para administrar el tráfico de las máquinas virtuales que hospedan una aplicación web. Los usuarios experimentan una distribución de tráfico desigual, con algunas máquinas virtuales que reciben más tráfico que otros.

Debe configurar el equilibrador de carga para garantizar la distribución del tráfico uniforme en todas las máquinas virtuales del grupo de back-end.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Agregue más máquinas virtuales al pool.

Ajuste la configuración de la regla de equilibrio de carga.

Deshabilite la persistencia de la sesión.

**Esta respuesta es correcta.**

Habilite la persistencia de sesión (afinidad de IP de origen).

**Esta respuesta no es correcta.**

Deshabilitar la persistencia de sesión garantiza incluso la distribución del tráfico quitando cualquier afinidad que dirija el tráfico a la misma máquina virtual. Ajustar la configuración de la regla de equilibrio de carga podría parecer una solución, pero no aborda la causa principal de la distribución desigual. La habilitación de la afinidad de IP de origen mantiene la persistencia de la sesión, lo que podría exacerbar la distribución desigual del tráfico. Agregar más máquinas virtuales no resuelve el problema de distribución causado por la configuración de persistencia de sesión.

[Configurar la configuración de la red de la máquina virtual de Azure - Formación | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/create-windows-virtual-machine-in-azure/6-manage-vm)

___
Tiene una suscripción de Azure denominada Sub1 que contiene un grupo de recursos denominado RG1 y un servidor local denominado Server1 que ejecuta Windows Server.

Tiene previsto realizar copias de seguridad de archivos y carpetas de Server1 a Azure mediante Azure Backup.

En RG1, creas una bóveda de servicios de recuperación llamado Vault1.

Instale el agente de Microsoft Azure Recovery Services (MARS) en Server1.

Debe asegurarse de que Server1 puede realizar una copia de seguridad de los datos en Vault1.

¿Qué debe hacer a continuación?

Seleccione solo una respuesta.

Cree una directiva de copia de seguridad para Vault1.

**Esta respuesta no es correcta.**

Descargue las credenciales de Vault1 y registre Server1 con Vault1.

**Esta respuesta es correcta.**

Habilite la eliminación reversible para Vault1.

Modifique la configuración de seguridad de Vault1.

**Objetivo:**

5.2 Implementación de copias de seguridad y recuperación

**Qué prueba este elemento:**

Realizar operaciones de copia de seguridad y restauración mediante Azure Backup

**Lectura adicional:**

[Cómo funciona Azure Backup- Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/3-how-azure-backup-works)

[Implementa la copia de seguridad híbrida y la recuperación con IaaS de Windows Server - Capacitación | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/implement-hybrid-backup-recovery-windows-server-iaas/)

**Justificación:**

Correcto: es necesario descargar las credenciales del almacén y registrar el servidor con el almacén de Recovery Services antes de que se puedan producir operaciones de copia de seguridad, ya que esto establece la confianza entre el servidor local y el almacén.

Incorrecto: la configuración de una directiva de copia de seguridad, la habilitación de la eliminación temporal o la modificación de la configuración de seguridad del almacén solo se pueden realizar después de que el almacén registre y reconozca el servidor, por lo que estas acciones no habilitan la conectividad de copia de seguridad por sí sola.

