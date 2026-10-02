---
title: AZ-104 — Supervisión de las máquinas virtuales de Azure con Azure Monitor
aliases: ["Supervisión de las máquinas virtuales de Azure con Azure Monitor (AZ-104)"]
tags: [associate, monitoring]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/
---

# AZ-104 — Supervisión de las máquinas virtuales de Azure con Azure Monitor

Módulo 28 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 5 — Supervisión y copia de seguridad de recursos de Azure · Área: Supervisión y mantenimiento de recursos de Azure (10–15%).

## Concepto

Supervisar VMs con Azure Monitor: recopilar y analizar métricas y registros de cliente y host de máquina virtual.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Interpretación de métricas en Azure Monitor
> - Configurar ajustes de registro en Azure Monitor (diagnostic settings, Log Analytics)
> - Consulta y análisis de registros en Azure Monitor (KQL básico)

> **Gap del examen**: reglas de alertas, grupos de acciones, reglas de procesamiento de alertas e Insights (VMs/storage/redes) son objetivos explícitos con módulo limitado — la base práctica ya se vio en AZ-900 (proyecto guiado de alertas); completar con [docs de Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/) ([ES](https://learn.microsoft.com/es-es/azure/azure-monitor/)).

## Enlaces relacionados

**Módulo de Learn**: [Supervisión de las máquinas virtuales de Azure con Azure Monitor](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/) ([ES](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/))

**Savill**: buscar "Monitor" / "KQL" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Herramientas de supervisión de Azure (AZ-900)]]

**Laboratorio**: Lab 11 (Implement Monitoring) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)


# Introducción.

Supongamos que es el administrador de TI del sitio web de un grupo musical hospedado en máquinas virtuales de Azure. En el sitio web se ejecutan servicios críticos para el grupo, como la reserva de entradas, información de las salas y las actualizaciones de la gira. El sitio web debe responder rápidamente y permanecer accesible durante las actualizaciones frecuentes y picos de tráfico.

Debe mantener suficiente tamaño y memoria de máquina virtual para hospedar eficazmente el sitio web sin incurrir en costos innecesarios. Además, es necesario prevenir de manera proactiva y responder rápidamente a cualquier problema de acceso, seguridad y rendimiento. Para ayudar a lograr estos objetivos, quiere supervisar rápidamente y fácilmente el tráfico, el estado, el rendimiento y los eventos de las máquinas virtuales.

Azure Monitor proporciona capacidades de supervisión integradas y personalizables. Puede usarlos para realizar un seguimiento del estado, el rendimiento y el comportamiento del host de máquina virtual y del sistema operativo, las cargas de trabajo y las aplicaciones que se ejecutan en la máquina virtual. Este módulo de aprendizaje le muestra cómo ver los datos de supervisión del host de máquina virtual, configurar reglas de alerta recomendadas y utilizar la información de la máquina virtual y reglas de recopilación de datos (DCR) personalizadas para recopilar y analizar los datos de supervisión desde el interior de sus máquinas virtuales.

## Requisitos previos

Para completar este módulo, debe cumplir los siguientes requisitos previos:

- Familiaridad con la virtualización, la navegación de Azure Portal y las máquinas virtuales de Azure.
- Acceso a una suscripción de Azure con al menos el rol de **colaborador**. Si no tiene ninguna, cree una [cuenta gratuita](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_3e3a5fc1-a727-c9d3-197a-fbd974b8fb7d) y agregue una suscripción antes de empezar. Si es alumno, puede aprovechar la oferta [Azure for Students](https://azure.microsoft.com/free/students/?cid=msft_learn_3e3a5fc1-a727-c9d3-197a-fbd974b8fb7d).

## Objetivos de aprendizaje

- Comprenda qué datos de supervisión necesita recopilar de la máquina virtual.
- Habilite y vea las alertas y diagnósticos recomendados.
- Use Azure Monitor para recopilar y analizar los datos de host de máquina virtual.
- Use el agente de Azure Monitor para recopilar métricas de rendimiento de cliente de máquina virtual y registros de eventos.

# Supervisión de máquinas virtuales de Azure

En esta unidad, explorará las funcionalidades de supervisión de Azure para las máquinas virtuales y los tipos de datos de supervisión que puede recopilar y analizar con Azure Monitor. Azure Monitor es una solución de supervisión completa para recopilar, analizar y responder a los datos de supervisión de recursos de Azure y que no son de Azure, incluidas las máquinas virtuales. Azure Monitor tiene dos características principales de supervisión: Métricas de Azure Monitor y registros de Azure Monitor.

Las métricas son valores numéricos recopilados en intervalos predeterminados para describir algún aspecto de un sistema. Las métricas pueden medir el rendimiento de las máquinas virtuales, el uso de recursos, los recuentos de errores, las respuestas de usuario o cualquier otro aspecto del sistema que pueda cuantificar. Las métricas de Azure Monitor supervisan automáticamente un conjunto predefinido de métricas de cada máquina virtual de Azure y conserva los datos durante 93 días con algunas excepciones.

Los registros son eventos del sistema registrados que contienen una marca de tiempo y diferentes tipos de datos estructurados o de forma libre. Azure registra automáticamente los registros de actividad de todos los recursos de Azure. Estos datos están disponibles en el nivel de recurso. Azure Monitor no recopila registros de forma predeterminada, pero puede configurar los registros de Azure Monitor para que recopilen de cualquier recurso de Azure. Los registros de Azure Monitor almacenan los datos de registro en un área de trabajo de Log Analytics para realizar consultas y análisis.

## Capas de supervisión de máquinas virtuales

Las máquinas virtuales de Azure tienen varias capas que requieren supervisión. Cada una de las capas siguientes tiene un conjunto distinto de requisitos de telemetría y supervisión.

- Máquina virtual host
- Sistema operativo (SO) invitado
- Cargas de trabajo de cliente
- Aplicaciones que se ejecutan en la máquina virtual

![Diagrama que muestra la arquitectura fundamental de la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitoring-layers.png)

## Supervisión de máquinas virtuales de host

El host de máquina virtual representa los recursos de proceso, almacenamiento y red que Azure asigna a la máquina virtual.

### Métricas del host de máquina virtual

Las métricas del host de máquina virtual miden aspectos técnicos de la máquina virtual, como el uso del procesador y si la máquina se está ejecutando. Puede usar las métricas del host de máquina virtual para:

- Desencadene una alerta cuando la máquina virtual esté alcanzando sus límites de disco o CPU.
- Identificar tendencias o patrones.
- Controlar los costos operativos mediante el dimensionamiento de las máquinas virtuales en función del uso y la demanda.

Azure recopila automáticamente métricas básicas para los hosts de máquina virtual. En la página **Información general** de la máquina virtual en Azure Portal, puede ver gráficos integrados para las siguientes métricas importantes del host de máquina virtual.

- Disponibilidad de máquinas virtuales
- Porcentaje de uso de CPU (promedio)
- Uso del disco del sistema operativo (total)
- Operaciones de red (total)
- Operaciones de disco por segundo (promedio)

Puede usar el Explorador de métricas de Azure Monitor para trazar más gráficos de métricas, investigar los cambios y correlacionar visualmente las tendencias de métricas de las máquinas virtuales. Con el Explorador de métricas, puede hacer lo siguiente:

- Trazar varias métricas en un gráfico para ver cuánto tráfico alcanza la máquina virtual y cómo funciona esta.
- Realizar un seguimiento de la misma métrica en varias máquinas virtuales de un grupo de recursos u otro ámbito y usar la división para mostrar cada máquina virtual en el gráfico.
- Seleccionar intervalos de tiempo flexibles y granularidad.
- Especificar muchas otras opciones, como el tipo de gráfico y los intervalos de valores.
- Enviar gráficos a libros o anclarlos a paneles para ver rápidamente el estado y el rendimiento.
- Agrupar métricas por intervalos de tiempo, regiones geográficas, clústeres de servidores o componentes de aplicación.

[![Captura de pantalla que muestra el uso de porcentaje de CPU y el gráfico de flujo de entrada.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/2-vm-metrics-screenshot.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/2-vm-metrics-screenshot.png#lightbox)

### Reglas de alertas recomendadas

Las alertas le notifican proactivamente las apariciones y los patrones especificados en las métricas del host de máquina virtual. _Las reglas de alerta recomendadas_ son un conjunto predefinido de reglas de alertas basadas en métricas de host supervisadas con frecuencia. Estas reglas definen los niveles de uso recomendados de CPU, memoria, disco y red para alertar. Las reglas también incluyen disponibilidad de máquina virtual, que le avisa cuando la máquina virtual deja de ejecutarse.

Puede habilitar y configurar rápidamente las reglas de alerta recomendadas al crear una máquina virtual de Azure o después desde la página del portal de la máquina virtual. También puede ver, configurar y crear alertas personalizadas mediante alertas de Azure Monitor.

### Registros de actividad

Azure Monitor registra y muestra automáticamente los registros de actividad de las máquinas virtuales de Azure. Los registros de actividad incluyen información como el inicio o las modificaciones de la máquina virtual. Puede crear la configuración de diagnóstico para enviar registros de actividad a los siguientes destinos:

- **Registros de Azure Monitor:** Para consultas y alertas más complejas, y para una retención más larga hasta dos años.
- **Azure Storage:** Para el archivado a largo plazo más barato.
- **Azure Event Hubs:** Para reenviar fuera de Azure.

### Diagnósticos de arranque

Los diagnósticos de arranque son registros de host que puede usar para ayudar a solucionar problemas de arranque de las máquinas virtuales. Puede habilitar los diagnósticos de arranque de manera predeterminada al crear una máquina virtual o después en el caso de las máquinas virtuales existentes.

Una vez habilita los diagnósticos de arranque, puede ver capturas de pantalla del hipervisor de la máquina virtual en el caso de las máquinas Windows y Linux. También puede ver la salida del registro de la consola serie de la secuencia de arranque de la máquina virtual en el caso de las máquinas Linux. Los diagnósticos de arranque almacenan datos en una cuenta de almacenamiento administrada.

## Sistema operativo invitado, carga de trabajo de cliente y supervisión de aplicaciones

La supervisión del cliente de máquina virtual puede incluir la supervisión del sistema operativo (SO), las cargas de trabajo y las aplicaciones que se ejecutan en la máquina virtual. Para recopilar métricas y registros de las cargas de trabajo y aplicaciones de cliente y del sistema operativo invitado, debe instalar el agente de Azure Monitor y configurar un DCR.

Las DCR definen qué datos se van a recopilar y dónde enviar esos datos. Puede usar un DCR para enviar datos de métricas de Azure Monitor o _contadores de rendimiento_ a registros de Azure Monitor o métricas de Azure Monitor. También puede enviar datos del registro de eventos a los registros de Azure Monitor. En otras palabras, las métricas de Azure Monitor solo pueden almacenar datos de métricas, pero los registros de Azure Monitor pueden almacenar tanto métricas como registros de eventos.

### VM Insights

VM Insights es una característica de Azure Monitor que le ayuda a empezar a supervisar los clientes de máquina virtual. VM Insights es especialmente útil para explorar el uso y el rendimiento generales de las máquinas virtuales cuando aún no conoce la métrica de interés principal. VM Insights proporciona:

- Incorporación simplificada del agente de Azure Monitor para habilitar la supervisión del sistema operativo invitado y las cargas de trabajo de una máquina virtual.
- Un DCR preconfigurado que supervisa y recopila los contadores de rendimiento más comunes para Windows y Linux.
- Gráficos de métricas de rendimiento y libros predefinidos del sistema operativo invitado de la máquina virtual.
- Un conjunto de libros predefinidos que muestran las métricas de cliente de máquina virtual recopiladas a lo largo del tiempo.
- Opcionalmente, una colección de procesos que se ejecutan en la máquina virtual, dependencias con otros servicios y un mapa de dependencias que muestra componentes interconectados con otras máquinas virtuales y orígenes externos.

Los libros predefinidos de VM Insights muestran el rendimiento, las conexiones, los puertos activos, el tráfico y otros datos recopilados de una o varias máquinas virtuales. Puede ver los datos de VM Insights directamente desde una sola máquina virtual o ver una vista combinada de varias máquinas virtuales para ver y evaluar tendencias y patrones entre máquinas virtuales. Puede editar las configuraciones del libro precompilado o crear sus propios libros personalizados.

### Datos del registro de eventos del cliente

VM Insights crea un DCR que recopila un conjunto específico de contadores de rendimiento. Para recopilar otros datos, como registros de eventos, puede crear un DCR independiente que especifique los datos que desea recopilar de la máquina virtual y dónde enviarlos. Azure Monitor almacena los datos de registro recopilados en un área de trabajo de Log Analytics. Desde allí, puede acceder a los datos y analizarlos mediante consultas de registro escritas en el Lenguaje de consulta Kusto (KQL).


# Supervisión de los datos del host de máquina virtual.

Quiere supervisar las máquinas virtuales que hospedan su sitio web, por lo que decide crear rápidamente una máquina virtual en Azure Portal y evaluar sus capacidades de supervisión integradas. En esta unidad, usará Azure Portal para crear una máquina virtual Linux con alertas recomendadas y diagnósticos de arranque habilitados. En cuanto se inicia la máquina virtual, Azure comienza automáticamente a recopilar métricas básicas y registros de actividad. A continuación, puede ver gráficos de métricas integrados, registros de actividad y diagnósticos de arranque.

## Creación de una máquina virtual y habilitación de alertas recomendadas

1. Inicie sesión en [Azure Portal](https://portal.azure.com/) y, en el campo de búsqueda, escriba _Máquinas virtuales_.
    
2. En la página **Máquinas virtuales**, seleccione **Crear** y, después, **Máquina virtual de Azure**.
    
3. En la pestaña **Aspectos básicos** de la página **Crear una máquina virtual**.
    
    - En el campo **Suscripción**, seleccione la suscripción correcta si aún no está seleccionada.
    - En **Grupo de recursos**:
        1. Seleccione **Crear nuevo**.
        2. En **Nombre**, escriba _learn-monitor-vm-rg_.
        3. Seleccione **Aceptar**.
    - En **Nombre de máquina virtual**, escriba _monitored-linux-vm_.
    - En **Imagen**, seleccione **Ubuntu Server 20.04 LTS - x64 Gen2**.
4. Deje la otra configuración en sus valores actuales y seleccione la pestaña **Supervisión**.
    
    [![Captura de pantalla que muestra la pestaña Aspectos básicos de la página Crear una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-basic.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-basic.png#lightbox)
    
5. En la pestaña **Supervisión**, active la casilla situada junto a **Habilitar reglas de alerta recomendadas**.
    
6. En la pantalla **Configurar reglas de alerta recomendadas**:
    
    1. Seleccione todas las reglas de alerta enumeradas si aún no están seleccionadas y ajuste los valores si lo desea.
    2. En **Notificarme por**, active la casilla situada junto a **Correo electrónico** y escriba una dirección de correo electrónico para recibir notificaciones de alerta.
    3. Seleccione **Guardar**.
7. En **Diagnósticos**, en **Diagnósticos de arranque**, asegúrese de que la opción **Habilitar con la cuenta de almacenamiento administrada (recomendada)** esté seleccionada.
    
    Nota:
    
    No seleccione **Habilitar diagnósticos de invitado del sistema operativo**. El Agente de diagnósticos de Linux (LAD) está en desuso y puede habilitar la supervisión de clientes y invitados del sistema operativo más adelante.
    
8. Seleccione **Revisar y crear** en la parte inferior de la pantalla y, cuando se supere la validación, seleccione **Crear**.
    
    [![Captura de pantalla que muestra la pestaña Supervisión y la pantalla de configuración de la regla de alertas de la página Crear una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-monitoring.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-monitoring.png#lightbox)
    
9. En la ventana emergente **Generar nuevo par de claves**, seleccione **Descargar clave privada y crear recurso**.
    

La creación de la máquina virtual puede tardar unos minutos. Cuando reciba la notificación de que se crea la máquina virtual, seleccione **Ir al recurso** para ver los datos básicos de métricas.

## Visualización de gráficos de métricas integradas

Una vez creada la máquina virtual, Azure comienza a recopilar datos de métricas básicas automáticamente. Los gráficos de métricas integradas, junto con las alertas recomendadas que haya habilitado, pueden ayudarle a supervisar si la máquina virtual encuentra problemas de mantenimiento o de rendimiento, y en qué momento. Después, puede usar funcionalidades de supervisión y análisis más avanzadas para investigar las causas y la corrección del problema.

1. Para ver gráficos de métricas básicas, en la página **Información general** de las máquinas virtuales, seleccione la ficha **Supervisión**.
    
    [![Captura de pantalla que muestra la pestaña Supervisión en una pantalla de información general de máquinas virtuales.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/select-monitoring.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/select-monitoring.png#lightbox)
    
2. En **Rendimiento y uso**>**Métricas de plataforma**, revise los siguientes gráficos de métricas relacionados con el rendimiento y uso de las máquinas virtuales. Seleccione **Mostrar más métricas** si todos los gráficos no aparecen inmediatamente.
    
    - **Disponibilidad de máquinas virtuales**
    - **CPU (promedio)**
    - **Bytes de disco (total)**
    - **Red (total)**
    - **Operaciones de disco por segundo (promedio)**
    
    [![Captura de pantalla que muestra los gráficos de métricas de la plataforma en la página Información general de la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/platform-metrics.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/platform-metrics.png#lightbox)
    
3. En **Métricas del sistema operativo invitado**, observe que las métricas del sistema operativo invitado aún no se recopilan. En las unidades siguientes, configura la información detallada sobre las máquinas virtuales y las reglas de recopilación de datos para recopilar métricas del sistema operativo del invitado.
    

## Visualización del registro de actividad

Para ver el registro de actividad de las máquinas virtuales, seleccione **Registro de actividad** en el menú de navegación izquierdo de las máquinas virtuales. También puede recuperar entradas mediante PowerShell o la CLI de Azure.

[![Captura de pantalla del registro de actividad de una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/activity-log.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/activity-log.png#lightbox)

## Ver los diagnósticos de arranque

Ha habilitado los diagnósticos de arranque al crear la máquina virtual. Puede consultar los diagnósticos de arranque para ver los datos de arranque y solucionar problemas de inicio.

1. En el menú de navegación izquierdo de la máquina virtual, seleccione **Diagnósticos de arranque** en **Ayuda**.
    
2. En la página **Diagnóstico de arranque**, seleccione **Captura de pantalla** para ver una captura de pantalla de inicio del hipervisor de la máquina virtual. Seleccione **Registro serie** para ver los mensajes de registro creados al iniciar la máquina virtual.
    
    [![Captura de pantalla en la que se muestra la imagen del diagnóstico de arranque capturada.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-boot-diagnostics.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-boot-diagnostics.png#lightbox)



# Uso del Explorador de métricas para ver las métricas detalladas del host.


Quieres investigar cómo el tráfico que fluye hacia tu máquina virtual afecta a la capacidad de la CPU. Si los gráficos de métricas integrados de una máquina virtual aún no muestran los datos que necesita, puede usar el Explorador de métricas para crear gráficos personalizados de métricas. En esta unidad, trazará un gráfico que muestra el porcentaje máximo de CPU de la máquina virtual y los datos promedio del flujo de entrada juntos.

El Explorador de métricas de Azure Monitor ofrece una interfaz de usuario para explorar y analizar las métricas de máquina virtual. Puede usar el Explorador de métricas para ver y crear gráficos personalizados para muchas métricas del host de máquina virtual, además de las métricas que se muestran en los gráficos integrados.

## Comprender el Explorador de métricas

Para abrir el Explorador de métricas, puede hacer lo siguiente:

- Seleccione **Métricas** en el menú de navegación izquierdo de la máquina virtual en **Supervisión**.
- Seleccione el vínculo **Ver todas las métricas** situado junto a **Métricas de plataforma** en la pestaña **Supervisión** de la página **Información general** de la máquina virtual.
- Seleccione **Métricas** en el menú de navegación izquierdo de la página **Información general** de Azure Monitor.

[![Captura de pantalla que muestra el Explorador de métricas.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/metrics-explorer.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/metrics-explorer.png#lightbox)

En el Explorador de métricas, puede seleccionar los siguientes valores en los campos desplegables:

- **Ámbito:** Si abre el Explorador de métricas desde una máquina virtual, este campo se rellena previamente con el nombre de la máquina virtual. Puede agregar más elementos con el mismo tipo de recurso (VM) y ubicación.
- **Espacio de nombres de la métrica**: La mayoría de los tipos de recursos solo tienen un espacio de nombres; sin embargo, para algunos tipos, debe elegir un espacio de nombres. Por ejemplo, las cuentas de almacenamiento tienen espacios de nombres independientes para archivos, tablas, blobs y colas.
- **Métrica**: Cada espacio de nombres de métricas tiene muchas métricas disponibles para elegir.
- **Agregación**: Para cada métrica, el Explorador de métricas aplica una agregación predeterminada. Puede usar otra agregación para obtener información diferente sobre la métrica.

Puede aplicar las siguientes funciones de agregación a las métricas:

- **Recuento**: Cuenta el número de puntos de datos.
- **Promedio (Avg)**: Calcula la media aritmética de los valores.
- **Máximo (máx)**: Identifica el valor más alto.
- **Mínimo (mín)**: Identifica el valor más bajo.
- **Suma**: Suma todos los valores.

Puede seleccionar intervalos de tiempo flexibles para los gráficos, desde los últimos 30 minutos hasta los últimos 30 días, o intervalos personalizados. Puede especificar la granularidad del intervalo de tiempo de un minuto a un mes.

## Creación de un gráfico de métricas

Para crear un gráfico del Explorador de métricas que muestre el porcentaje máximo de CPU de la máquina virtual host y los flujos de entrada juntos durante los últimos 30 minutos:

1. Para abrir el **Explorador de métricas**, seleccione **Ver todas las métricas** en la pestaña **Supervisión** de la máquina virtual o seleccione **Métricas** en el menú de navegación izquierdo de la máquina virtual.
    
2. Los valores de **Ámbito** y **Espacio de nombres de la métrica** ya se han rellenado para la máquina virtual host. Seleccione **Porcentaje de CPU** en la lista desplegable **Métricas**.
    
3. El valor de **Agregación** se ha rellenado automáticamente con **Avg**, pero cámbielo a **Máx**.
    
    [![Captura de pantalla del gráfico Porcentaje de métricas de CPU para una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-view-host-level-metrics.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-view-host-level-metrics.png#lightbox)
    
4. Seleccione **Agregar métrica** en la esquina superior izquierda.
    
5. En **Métrica**, seleccione **Flujos entrantes**. Deje el valor de **Agregación** en **Avg**.
    
6. En la esquina superior derecha, seleccione **Hora local: Últimas 24 horas (Automático: 15 minutos)**, cambie el valor a **Últimos 30 minutos** y seleccione **Aplicar**.
    

El gráfico debe tener un aspecto similar al de la captura de pantalla siguiente:

[![Captura de pantalla que muestra un gráfico de uso de CPU y tráfico entrante.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-metric-graph.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-metric-graph.png#lightbox)

# Recopilación de contadores de rendimiento de cliente mediante VM Insights.
Además de supervisar el estado, el uso y el rendimiento del host de la máquina virtual, debe supervisar el software y los procesos que se ejecutan en la máquina virtual. Se denominan invitado o cliente de máquina virtual. En esta unidad, habilitará la característica VM Insights de Azure Monitor, que ofrece una manera rápida de empezar a supervisar el cliente de máquina virtual.

El cliente de máquina virtual incluye el sistema operativo y otras cargas de trabajo y aplicaciones. Para supervisar el software que se ejecuta en la máquina virtual, instale el agente de Azure Monitor, que recopila datos desde dentro de la máquina virtual. VM Insights:

- Instala el agente de Azure Monitor en la máquina virtual.
- Crea una DCR que recopila y envía un conjunto predefinido de datos de rendimiento de cliente a un área de trabajo de Log Analytics.
- Presenta los datos en libros mantenidos.

Aunque no es necesario usar VM Insights para instalar Azure Monitor Agent, crear DCR ni configurar workbooks, VM Insights facilita la configuración de la supervisión de clientes de VM. VM Insights proporciona una base para supervisar el rendimiento del cliente de máquina virtual y asignar los procesos que se ejecutan en la máquina.

## Habilitación de VM Insights

1. En Azure Portal, en la página **Información general** de la máquina virtual, seleccione **Conclusiones** en el menú de navegación izquierdo en **Supervisión**.
    
2. En la página **Conclusiones**, seleccione **Habilitar**.
    
3. En **Regla de recopilación de datos**, anote las propiedades de DCR que crea VM Insights. En la descripción de DCR, **Procesos y dependencias (asignación)** se establece en **Deshabilitado**, que puede cambiar a **Habilitado** o revisar [este artículo con instrucciones](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/vminsights-maps) si está atenuado. También se crea o asigna un**Área de trabajo de Log Analytics** por defecto.
    
4. Seleccione **Configurar**.
    
    [![Captura de pantalla que muestra cómo habilitar y configurar Insights de VM.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/enable-insights.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/enable-insights.png#lightbox)
    
    La configuración del área de trabajo y la instalación del agente normalmente tarda de 5 a 10 minutos. Los datos pueden tardar entre 5 y 10 minutos en estar disponibles para verlos en el portal.
    
5. Cuando finalice la implementación, confirme que el Agente de Azure Monitor está instalado en la pestaña **Propiedades** de la página **Información general** de la máquina virtual, en **Extensiones y aplicaciones**.
    
    En la pestaña **Supervisión** de la página **Información general**, en **Rendimiento y uso**, puede ver que ahora se recopilan las **métricas del sistema operativo invitado**.
    
    [![Recorte de pantalla que muestra las métricas del sistema operativo invitado en la pestaña Supervisión de la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/guest-os-metrics.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/guest-os-metrics.png#lightbox)
    

## Visualización de VM Insights

VM Insights crea un DCR que envía contadores de rendimiento de máquinas virtuales cliente a los registros de Azure Monitor. Dado que DCR envía sus métricas a los registros de Azure Monitor, no necesita usar el Explorador de métricas para ver los datos de métricas que recopila VM Insights.

Para ver los gráficos y mapas de rendimiento de VM Insights:

1. Seleccione **Conclusiones** en el menú de navegación izquierdo de la máquina virtual en **Supervisión**.
    
2. Cerca de la parte superior de la página **Insights**, seleccione la **pestaña Rendimiento**. El libro de rendimiento precompilado de VM Insights muestra gráficos con datos relacionados con el rendimiento de la VM actual.
    
    [![Captura de pantalla que muestra el libro rendimiento de VM Insights precompilado.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/vm-insights-performance.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/vm-insights-performance.png#lightbox)
    
    - Puede personalizar la vista especificando otro **intervalo de tiempo** en la parte superior de la página y agregaciones diferentes en la parte superior de cada grafo.
        
    - Seleccione **Ver libros de trabajo** para elegir entre otros libros de trabajo preconfigurados de VM Insights disponibles. Seleccione **Ir a la galería** para elegir desde una galería de otros libros de trabajo y plantillas de libro de trabajo de VM Insights, o para editar y crear sus propios libros de trabajo.
        
3. Si se ha activado anteriormente, seleccione la pestaña **Mapa** en la página **Información** para ver el libro de trabajo de la función Mapa. El mapa visualiza las dependencias de la VM mediante la detección de grupos de procesos y procesos que se están ejecutando y que tienen conexiones de red activas durante un determinado intervalo de tiempo.
    
    [![Captura de pantalla que muestra un mapa de dependencias en la pestaña Mapa de VM insights.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dependency-map.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dependency-map.png#lightbox)


# Recopilación de registros de eventos de cliente de la máquina virtual.

Las métricas de Azure Monitor y los contadores de rendimiento de VM Insights le ayudan a identificar anomalías de rendimiento y alertas cuando se alcanzan los umbrales. Pero para analizar las causas principales de los problemas detectados, debe analizar los datos de registro para ver qué eventos del sistema han causado o contribuido a los problemas. En esta unidad, configurará una DCR para recopilar datos de Syslog de máquina virtual Linux y verá los datos del registro en Log Analytics de Azure Monitor mediante una consulta sencilla con Lenguaje de consulta Kusto (KQL).

VM Insights instala el agente de Azure Monitor y crea una DCR que recopila contadores de rendimiento predefinidos, asigna dependencias de proceso y presenta los datos en libros creados previamente. Puede crear sus propias DCR para recopilar contadores de rendimiento de máquinas virtuales que la DCR de VM Insights no recopila o para recopilar los datos de registro.

Al crear una DCR en Azure Portal, puede seleccionar entre varios contadores de rendimiento y velocidades de muestreo, o agregar contadores de rendimiento personalizados. De forma alternativa, puede seleccionar entre un conjunto predefinido de tipos de registro y niveles de gravedad, o definir esquemas de registro personalizados. Puede asociar una única DCR a cualquiera o todas las máquinas virtuales de la suscripción, pero es posible que necesite varias DCR para recopilar diferentes tipos de datos de máquinas virtuales diferentes.

## Creación de una DCR para recopilar los datos de registro

En Azure Portal, busque y seleccione _supervisar_ para ir a la página de **Información general** de Azure Monitor.

[![Recorte de pantalla que muestra la página Información general de Azure Monitor.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitor-overview.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitor-overview.png#lightbox)

### Crear un punto de conexión de recopilación de datos

Debe tener un punto de conexión de recopilación de datos al cual enviar los datos de registro. Para crear un punto de conexión:

1. En el menú de navegación izquierdo de Azure Monitor, en **Configuración**, seleccione **Puntos de conexión de recopilación de datos**.
2. En la página **Puntos de conexión de recopilación de datos**, seleccione **Crear**.
3. En la página **Crear punto de conexión de recopilación de datos**, en **Nombre**, escriba _linux-logs-endpoint_.
4. Seleccione la misma **Suscripción**, el **Grupo de recursos** y la **Región** que usa la máquina virtual.
5. Seleccione **Revisar y crear** y, una vez superada la validación, seleccione **Crear**.

### Crear una regla de recopilación de datos

Para crear la DCR para recopilar los registros de eventos:

1. En el menú de navegación izquierdo Supervisar, en **Configuración**, seleccione **Reglas de recopilación de datos**.
    
2. En la página **Reglas de recopilación de datos**, puede ver la DCR que creó VM Insights. Seleccione **Crear** para crear una nueva regla de recopilación de datos.
    
    [![Recorte de pantalla de la pantalla Reglas de recopilación de datos con Crear resaltado.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-create.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-create.png#lightbox)
    
3. En la pestaña **Aspectos básicos** de la pantalla **Crear regla de recopilación de datos**, proporcione la siguiente información:
    
    - **Nombre de la regla**: Escriba _collect-events-linux_.
    - **Suscripción**, **Grupo de recursos** y **Región**: Seleccione los mismos valores que para la máquina virtual.
    - **Tipo de plataforma**: Seleccione **Linux**.
4. Seleccione **Siguiente: Recursos** o la pestaña **Recursos**.
    
    [![Recorte de pantalla de la pestaña Aspectos básicos de la pantalla Crear regla de recopilación de datos.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-basics.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-basics.png#lightbox)
    
5. En la pantalla **Recursos**, seleccione **Agregar recursos**.
    
6. En la pantalla **Seleccionar un ámbito**, seleccione la máquina virtual **monitored-linux-vm** y, a continuación, seleccione **Aplicar**.
    
7. En la pantalla **Recursos**, seleccione **Habilitar puntos de conexión de recopilación de datos**.
    
8. En **Punto de conexión de recopilación de datos** para **monitored-linux-vm**, seleccione el punto de conexión **linux-logs-endpoint** que creó.
    
9. Seleccione **Siguiente: Recopilar y entregar**, o la pestaña **Recopilar y entregar**.
    
    [![Recorte de pantalla de la pestaña Recursos de la pantalla Crear regla de recopilación de datos.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-resources.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-resources.png#lightbox)
    
10. En la pestaña **Recopilar y entregar**, seleccione **Agregar origen de datos**.
    
11. En la pantalla **Agregar origen de datos**, en **Tipo de origen de datos**, seleccione **Linux Syslog**.
    
12. En la pantalla **Agregar origen de datos**, seleccione **Siguiente: Destino** o la pestaña **Destino** y asegúrese de que la **cuenta o el espacio de nombres** coincidan con el área de trabajo de Log Analytics que desea usar. Puede usar el área de trabajo predeterminada de Log Analytics que configuró VM Insights o crear o usar otra área de trabajo de Log Analytics.
    
13. En la pantalla **Agregar origen de datos**, seleccione **Agregar origen de datos**.
    
14. En la pantalla **Crear regla de recopilación de datos**, seleccione **Revisar y crear** y, cuando se supere la validación, seleccione **Crear**.
    
    [![Recorte de pantalla de Revisar y crear resaltado en la pantalla Crear regla de recopilación de datos.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-finish.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-finish.png#lightbox)
    

## Visualización de los datos de registro

Puede ver y analizar los datos de registro recopilados por la DCR mediante las consultas del registro de KQL. Hay disponible un conjunto de consultas KQL de ejemplo para las máquinas virtuales, aunque puede escribir una consulta para examinar los eventos que recopila la DCR.

1. En la página de **Información general** de la máquina virtual, seleccione **Registros** en el menú de navegación izquierdo en **Supervisión**. Log Analytics se abre con una ventana de consulta vacía con el ámbito establecido en la máquina virtual.
    
    También puede acceder a los datos de registro seleccionando **Registros** en el panel de navegación izquierdo de la página de **Información general** de Azure Monitor. Si es necesario, seleccione **Seleccionar ámbito** en la parte superior de la ventana de consulta para definir el ámbito de la consulta en el área de trabajo y la máquina virtual de Log Analytics deseadas.
    
    Nota:
    
    La ventana **Consultas** con las consultas de ejemplo podría abrirse al abrir Log Analytics. Por ahora, cierre esta ventana, ya que va a crear manualmente una consulta sencilla.
    
2. En la ventana de consulta vacía, escriba _Syslog_ y, a continuación, seleccione **Ejecutar**. Se muestran todos los eventos de registro del sistema recopilados por la DCR en el **intervalo de tiempo**.
    
3. Puede refinar la consulta para identificar eventos de interés. Por ejemplo, puede mostrar solo los eventos que tengan una **SeverityLevel** de **advertencia**.
    
    [![Recorte de pantalla que muestra los eventos devueltos desde Syslog por DCR.](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-log.png)](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-log.png#lightbox)
    


# Resumen.
Azure Monitor le ayuda a recopilar, analizar y alertar sobre varios tipos de datos de supervisión de host y cliente de las máquinas virtuales de Azure.

- Azure Monitor proporciona un conjunto de registros de host de máquina virtual y métricas de rendimiento y uso para todas las máquinas virtuales de Azure.
- Puede habilitar las reglas de alerta recomendadas al crear máquinas virtuales o después para alertar sobre las métricas importantes del host de máquina virtual.
- El Explorador de métricas de Azure Monitor permite representar gráficamente y analizar las métricas para máquinas virtuales de Azure y otros recursos.
- La información de la máquina virtual proporciona una manera sencilla de supervisar los contadores de rendimiento y los procesos importantes del cliente de máquina virtual que se ejecutan en su máquina virtual.
- Puede crear reglas de recopilación de datos para recopilar otras métricas y registros del cliente de máquina virtual.
- Puede usar Log Analytics para consultar y analizar datos de registro.

Ahora que comprende estas herramientas, puede estar seguro de que Azure Monitor puede supervisar eficazmente las máquinas virtuales de Azure y ayudarle a mantener su sitio web en ejecución de forma eficaz.

## Limpieza de recursos

En este módulo, ha creado una máquina virtual en la suscripción de Azure. Para evitar cargos adicionales para esta máquina virtual, puede eliminarlo o el grupo de recursos que lo contiene.

Para eliminar el grupo de recursos que contiene la máquina virtual y sus recursos:

1. Seleccione el vínculo **Grupo de recursos** en la parte superior de la sección **Essentials** de la página de **Información general** de la máquina virtual.
2. En la parte superior de la página del grupo de recursos, seleccione **Eliminar grupo de recursos**.
3. En la pantalla de eliminación, active la casilla situada junto a **Aplicar la opción para forzar la eliminación de las máquinas virtuales y los conjuntos de escalado de máquinas virtuales seleccionados**. Escriba el nombre del grupo de recursos en el campo y seleccione **Eliminar**.

## Saber más

Para obtener más información sobre la supervisión de las máquinas virtuales con Azure Monitor, consulte los siguientes recursos:

- [Documentación sobre Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor)
- [Supervisión de máquinas virtuales con Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/monitor-virtual-machine)
- [Métricas compatibles con Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/reference/supported-metrics/metrics-index)
- [Enviar datos del registro de actividad de Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/essentials/activity-log)
- [Métricas admitidas para Microsoft.Compute/virtualMachines](https://learn.microsoft.com/es-es/azure/azure-monitor/reference/supported-metrics/microsoft-compute-virtualmachines-metrics)
- [Información general de VM Insights](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/vminsights-overview)
- [Creación de informes interactivos con libros de VM Insights](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/vminsights-workbooks)
- [Uso de la característica Asignación de VM Insights para comprender los componentes de la aplicación](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/vminsights-maps)
- [Información general del agente de Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/agents/azure-monitor-agent-overview)
- [Recopilación de datos con el agente de Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/agents/azure-monitor-agent-data-collection)
- [Tutorial: Recopilación de registros y métricas de invitado de una máquina virtual de Azure](https://learn.microsoft.com/es-es/azure/azure-monitor/vm/tutorial-monitor-vm-guest)

































## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Herramientas de supervisión de Azure (AZ-900)]]
- [[Introducción a Azure Network Watcher (AZ-104)]]
