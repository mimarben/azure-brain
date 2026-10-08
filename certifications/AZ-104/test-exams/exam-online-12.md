# Simulacro avanzado AZ-104

## Pregunta 1 — RBAC y alcance

Tienes un grupo de recursos llamado `RG-Production` dentro de la suscripción `Sub-01`.

Un usuario debe poder:

- Reiniciar máquinas virtuales.
    
- Leer configuraciones de red.
    
- No modificar redes virtuales, grupos de seguridad de red ni cuentas de almacenamiento.
    
- Administrar únicamente los recursos de `RG-Production`.
    

¿Qué debes hacer?

A. Asignar el rol **Virtual Machine Contributor** en el ámbito de la suscripción `Sub-01`.

B. Asignar el rol **Virtual Machine Contributor** en el ámbito de `RG-Production`.

C. Asignar los roles **Contributor** y **Reader** en el ámbito de `RG-Production`.

D. Crear una directiva de Azure Policy que permita reiniciar máquinas virtuales.

---

## Pregunta 2 — Azure Policy

Una empresa quiere garantizar que todas las cuentas de almacenamiento nuevas:

- Se creen únicamente en `West Europe`.
    
- Incluyan la etiqueta `Environment`.
    
- No tengan acceso público a blobs.
    

Quieres impedir que se creen recursos que incumplan estas condiciones.

¿Qué debes utilizar?

A. Azure RBAC.

B. Azure Policy con efectos `Deny`.

C. Un bloqueo `CanNotDelete`.

D. Azure Advisor.

---

## Pregunta 3 — SAS

Una aplicación externa necesita leer archivos de un contenedor de Azure Blob Storage durante exactamente 24 horas.

La aplicación no debe conocer las claves de la cuenta y no quieres concederle acceso permanente.

¿Cuál es la opción más adecuada?

A. Compartir una clave de acceso de la cuenta.

B. Crear una identidad administrada y asignarla a la aplicación externa.

C. Crear una firma de acceso compartido (SAS) de servicio con permiso de lectura y fecha de expiración.

D. Conceder el rol Storage Blob Data Owner a la aplicación.

---

## Pregunta 4 — Red y DNS privado

Tienes una cuenta de almacenamiento con un punto de conexión privado en la red virtual `VNet-A`.

Una máquina virtual de `VNet-A` intenta resolver el nombre de la cuenta de almacenamiento, pero obtiene la dirección IP pública del servicio.

¿Qué debes configurar?

A. Una zona DNS privada para `privatelink.blob.core.windows.net`, vinculada a `VNet-A`.

B. Una zona DNS pública para `blob.core.windows.net`.

C. Una tabla de rutas con una ruta hacia la dirección IP privada.

D. Un grupo de seguridad de red que permita DNS sobre TCP.

---

<font color="#ff0000">## Pregunta 5 — NSG</font>

<font color="#ff0000">Tienes una subred llamada `Subnet-App` con un grupo de seguridad de red (NSG) asociado.</font>

<font color="#ff0000">La subred contiene servidores web y servidores de base de datos. Todos los servidores están en la misma subred.</font>

<font color="#ff0000">Quieres permitir:</font>

<font color="#ff0000">- HTTP desde Internet a los servidores web.</font>
    
<font color="#ff0000">- Tráfico desde los servidores web a los servidores de base de datos por el puerto TCP 1433.</font>
    
<font color="#ff0000">- Ningún acceso directo desde Internet a los servidores de base de datos.</font>
    

<font color="#ff0000">¿Cuál es la mejor solución?</font>

<font color="#ff0000">A. Crear una regla que permita TCP 1433 desde Internet a toda la subred.</font>

<font color="#ff0000"><b>B. Mover los servidores de base de datos a otra subred y utilizar reglas de NSG entre subredes.</b></font>

<font color="#ff0000">C. Crear una regla que permita TCP 1433 desde `Internet` a los servidores de base de datos.</font>

<font color="#ff0000">D. Crear una regla de salida que permita TCP 1433 desde los servidores web.</font>

---

## Pregunta 6 — Virtual Machine Scale Sets

Tienes un conjunto de escalado de máquinas virtuales con 10 instancias. El conjunto está configurado con actualización automática de imagen.

Necesitas instalar una extensión de máquina virtual en todas las instancias existentes y también en las nuevas instancias.

¿Qué debes hacer?

A. Instalar manualmente la extensión en cada instancia actual.

B. Agregar la extensión al modelo del conjunto de escalado y actualizar las instancias.

C. Crear una Azure Policy que instale la extensión.

D. Reiniciar el conjunto de escalado.

---

## Pregunta 7 — Azure App Service

Una aplicación web ejecutándose en Azure App Service debe cumplir estos requisitos:

- Tener una instancia de producción y otra de pruebas.
    
- Probar una versión nueva sin afectar a los usuarios actuales.
    
- Cambiar el tráfico gradualmente hacia la nueva versión.
    
- Poder volver atrás rápidamente.
    

¿Qué debes configurar?

A. Dos planes de App Service en dos regiones diferentes.

B. Dos aplicaciones web independientes con Azure Traffic Manager.

C. Dos ranuras de implementación en la misma aplicación y en el mismo plan de App Service.

D. Dos conjuntos de escalado de máquinas virtuales detrás de Azure Load Balancer.

---

## Pregunta 8 — Azure Backup

Proteges una máquina virtual mediante Azure Backup.

Un usuario elimina accidentalmente un archivo dentro de la máquina virtual. Necesitas recuperar únicamente ese archivo, sin restaurar el disco completo.

¿Qué debes utilizar?

A. Restauración de discos de la máquina virtual.

B. Restauración de archivos desde el punto de recuperación.

C. Azure Site Recovery.

D. Una instantánea de la cuenta de almacenamiento.

---

## Pregunta 9 — Monitorización

Tienes que detectar cuándo una máquina virtual mantiene un uso de CPU superior al 85% durante 10 minutos.

Además, debes enviar un correo electrónico a un administrador y ejecutar una acción automática.

¿Qué componentes debes configurar? Selecciona **dos**.

A. Una alerta de métricas de Azure Monitor.

B. Un grupo de acciones.

C. Un bloqueo `ReadOnly`.

D. Una consulta de Azure Resource Graph.

E. Una etiqueta de recurso.

---

## Pregunta 10 — Storage lifecycle management

Una cuenta de almacenamiento contiene blobs que cumplen este patrón:

- Durante los primeros 30 días se consultan frecuentemente.
    
- Entre los días 31 y 180 se consultan ocasionalmente.
    
- Después de 180 días casi nunca se consultan.
    
- Tras 365 días deben eliminarse automáticamente.
    

¿Qué debes configurar?

A. Una directiva de ciclo de vida que mueva los blobs a Cool, después a Archive y finalmente los elimine.

B. Azure Backup con una retención de 365 días.

C. Una cuenta de almacenamiento Premium.

D. Una directiva de Azure Policy que cambie la categoría de acceso.

1b, 2b, 3c, 4a, 5d, 6b, 7c, 8b, 9a, 10a

Has obtenido **8/10**. Los fallos están en las preguntas **5 y 9**. Es un resultado muy bueno, pero precisamente esos dos errores son de los típicos que pueden aparecer en el AZ-104 por los matices de reglas de red y alertas.

La pregunta 5 tiene una **ambigüedad técnica importante**; te la explico abajo.

## Resultado

|Pregunta|Tu respuesta|Correcta|Resultado|
|---|---|---|---|
|1|B|B|Correcta|
|2|B|B|Correcta|
|3|C|C|Correcta|
|4|A|A|Correcta|
|5|D|B*|Incorrecta|
|6|B|B|Correcta|
|7|C|C|Correcta|
|8|B|B|Correcta|
|9|A|A + B|Parcial/incorrecta|
|10|A|A|Correcta|