---
title: AZ-104 — Iniciativas de Azure Policy
aliases: ["Iniciativas de Azure Policy (AZ-104)"]
tags: [associate, governance]
certification: [AZ-104]
updated: 2026-09-29
sources:
  - https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/
---

# AZ-104 — Iniciativas de Azure Policy

Módulo 06 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Uso de iniciativas de Azure Policy para aplicar estándares de la organización, evaluar el cumplimiento a escala y administrar los recursos de Azure de forma eficaz.

## Resumen en mis palabras

Azure Policy permite definir reglas para controlar y evaluar los recursos de Azure. Una **iniciativa** agrupa varias definiciones de directiva para asignarlas y supervisarlas como un conjunto.

Las directivas se asignan a un ámbito —por ejemplo, un grupo de administración, una suscripción o un grupo de recursos— y los ámbitos inferiores heredan las asignaciones de los superiores. Cada definición compara propiedades del recurso con condiciones y, si se cumplen, aplica un efecto: por ejemplo, **auditar**, **denegar**, **modificar** o **implementar un recurso relacionado**.

Azure Policy evalúa tanto los recursos nuevos o actualizados como los que ya existían. En estos últimos, el estado de cumplimiento se actualiza mediante exámenes que pueden tardar. Para reducir riesgos, conviene probar las directivas sin aplicarlas y desplegarlas gradualmente por anillos antes de extenderlas a producción.

**Explicado de forma sencilla**

Piensa en Azure Policy como un conjunto de reglas para los recursos de tu organización:

- Una **definición** es una regla concreta: por ejemplo, “las máquinas virtuales solo pueden tener ciertos tamaños”.
- Una **iniciativa** es un paquete de reglas relacionadas, como un estándar de seguridad.
- Una **asignación** decide dónde se aplican esas reglas y qué valores tienen sus parámetros.
- El **efecto** determina qué ocurre si un recurso incumple: se puede registrar el incumplimiento, bloquear la operación o corregir ciertos aspectos.
- Una **exención** permite exceptuar un recurso o ámbito; a diferencia de una exclusión, queda registrada como exento en el contexto de cumplimiento.

Hay dos escenarios importantes: **Greenfield**, cuando la regla ya existe y se crea o actualiza un recurso; y **Brownfield**, cuando se asigna una regla a recursos que ya estaban desplegados. En Brownfield, los recursos existentes se evalúan y pueden aparecer como no conformes, pero no necesariamente se modifican o eliminan.

Para introducir una directiva con cuidado, primero se puede asignar con `enforcementMode` desactivado para evaluar el impacto sin aplicar el efecto. Después se valida en entornos no productivos y se amplía el despliegue poco a poco. **No es lo mismo que el efecto `disabled`**: ese efecto impide que la regla se evalúe; `enforcementMode` permite evaluarla, pero evita aplicar su efecto.

## Por qué importa para el examen

> - Implementación y administración de Azure Policy
> - Del mismo área (cubrir con labs/docs): bloqueos de recursos, etiquetas, grupos de administración

## Enlaces relacionados

**Módulo de Learn**: [Iniciativas de Azure Policy](https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/) ([ES](https://learn.microsoft.com/es-es/training/modules/sovereignty-policy-initiatives/))

**Savill**: buscar "Policy" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Gobernanza y cumplimiento en Azure (AZ-900)]] · [[Azure RBAC]]

**Laboratorio**: Lab 02b (gobernanza con Azure Policy) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure RBAC]]


# Introducción

Azure Policy es un servicio que permite crear, asignar y administrar directivas de gobernanza que aplican reglas y efectos a los recursos de Azure para garantizar que cumplan los estándares de gobernanza de TI. Estas directivas aplican diversas reglas y efectos a los recursos para garantizar que se ajusten a los estándares corporativos y a los acuerdos de nivel de servicio. Se describen en formato JSON y se conocen como definiciones de directiva. Azure Policy es fundamental para aplicar los estándares de la organización y evaluar el cumplimiento a gran escala.

Las iniciativas de Azure Policy son colecciones de definiciones de Azure Policy agrupadas para alcanzar un objetivo o propósito específico. Al consolidar varias directivas de Azure en un único elemento, las iniciativas permiten controlar y aplicar configuraciones de forma centralizada en los recursos de Azure.

Las organizaciones de sectores como el gobierno, el sector público y las finanzas aceleran la transformación digital y obtienen mejores resultados empresariales. Pueden lograrlo mediante la adopción de iniciativas de Azure Policy específicas y centradas en la soberanía, que abordan la complejidad de cumplir los requisitos normativos nacionales y regionales.

Los clientes pueden crear iniciativas de Azure Policy para personalizar las implementaciones, reducir el tiempo necesario para auditar los entornos y facilitar el cumplimiento de los marcos normativos establecidos y de los requisitos gubernamentales. Estas iniciativas ayudan a los clientes y asociados del sector público a establecer barreras de protección en la nube y aplicar eficazmente normativas específicas. Pueden combinar varias iniciativas para crear una solución completa que se ajuste a sus necesidades y automatizar las implementaciones para garantizar la coherencia, aplicar los procedimientos recomendados y ahorrar tiempo.

En este módulo aprenderás cómo Azure Policy ayuda a realizar tareas habituales de creación, asignación y administración de directivas en toda la organización, como las siguientes:

- Asignar una directiva para exigir una condición a los recursos que se creen en el futuro.
- Crear y asignar una definición de iniciativa para hacer seguimiento del cumplimiento de varios recursos.
- Corregir un recurso no conforme o cuya creación se haya denegado.
- Implementar una nueva directiva en toda la organización.

# Cloud Adoption Framework para Azure

Microsoft Cloud Adoption Framework para Azure ofrece orientación técnica integral para Microsoft Azure. Este marco, de principio a fin, ayuda a arquitectos de nube, especialistas de TI y responsables empresariales a alcanzar sus objetivos de adopción de la nube. Incluye procedimientos recomendados, documentación y herramientas que empleados, asociados y clientes de Microsoft aportan para formular e implementar estrategias empresariales y tecnológicas eficaces para la nube. Para obtener más información, consulta la [documentación de Microsoft Cloud Adoption Framework para Azure](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/overview).

El diagrama siguiente ofrece una visión general de las distintas metodologías incluidas en Microsoft Cloud Adoption Framework para Azure para cada fase del ciclo de adopción de la nube. En este marco, Azure Policy desempeña un papel importante en la gobernanza y ayuda a administrar el entorno y las cargas de trabajo en la nube.

![[microsoft-caf-for-azure.png]]

La gobernanza de la nube consiste en administrar el uso de la nube en una organización. La metodología Govern de Cloud Adoption Framework ofrece un marco sistemático para establecer y mejorar la gobernanza de la nube en Azure. Esta orientación se aplica a organizaciones de distintos sectores y aborda áreas fundamentales como el cumplimiento normativo, la seguridad, las operaciones, la administración de costos, los datos, la administración de recursos y la inteligencia artificial. Es esencial para definir y mantener un uso eficiente de la nube.

Una gobernanza integral de la nube supervisa todos los aspectos de su uso, minimiza distintos riesgos (como los relacionados con el cumplimiento, la seguridad, la administración de recursos y los datos) y optimiza las operaciones en la nube en toda la organización. Garantiza que las actividades en la nube sean coherentes con la estrategia general y facilita alcanzar los objetivos empresariales con menos obstáculos.

## Pasos para la gobernanza de la nube

La gobernanza de la nube es un proceso continuo. Requiere supervisión, evaluación y ajustes permanentes para adaptarse a la evolución de las tecnologías, los riesgos y los requisitos de cumplimiento. La metodología Govern de Cloud Adoption Framework divide la gobernanza de la nube en cinco pasos.


![[steps-for-cloud-governance.svg]]

1. **Formar un equipo de gobernanza**: establecer un equipo dedicado a la gobernanza de la nube, responsable de definir y mantener las directivas, así como de informar sobre su progreso.

2. **Evaluar los riesgos de la nube**: realizar una evaluación de riesgos exhaustiva y adaptada a la organización que abarque todas las categorías, incluido el cumplimiento normativo, la seguridad, las operaciones, los costos, la administración de datos y recursos, y los riesgos relacionados con la inteligencia artificial.

3. **Documentar las directivas de gobernanza de la nube**: documentar claramente las directivas que determinan los usos aceptables de la nube y especifican las reglas y directrices para mitigar los riesgos identificados.

4. **Aplicar las directivas de gobernanza de la nube**: implementar un enfoque sistemático para garantizar su cumplimiento. Combinar herramientas automatizadas con supervisión manual para establecer barreras de protección, supervisar configuraciones y asegurar que se respeten las directivas.

5. **Supervisar la gobernanza de la nube**: supervisar periódicamente el uso de la nube y los equipos de gobernanza para garantizar el cumplimiento continuo de las directivas establecidas.

## Consideraciones para definir una directiva de gobernanza de la nube

Al definir una directiva corporativa de gobernanza de la nube, deben tenerse en cuenta los siguientes aspectos:

- **Riesgo empresarial**: documentar los riesgos empresariales cambiantes y la tolerancia de la organización al riesgo, según la clasificación de los datos y la criticidad de las aplicaciones.

- **Directivas y cumplimiento**: convertir las decisiones sobre riesgos en declaraciones de directiva para establecer de forma eficaz los límites de adopción de la nube.

- **Procesos**: establecer procesos para supervisar las infracciones y el cumplimiento de las directivas corporativas.

![[cloud-governance.png]]

Las cinco disciplinas fundamentales de la gobernanza de la nube son:

- **Administración de costos**: evalúa y supervisa los costos, incluido el control de los gastos de TI, para establecer una administración de costos bien definida. También contempla ajustar los recursos según la demanda. Controlar el gasto en la nube es fundamental para obtener más valor de las inversiones.

- **Línea base de seguridad**: garantiza el cumplimiento de los requisitos de seguridad de TI mediante la aplicación de una línea base de seguridad en todas las iniciativas de adopción.

- **Coherencia de los recursos**: garantiza la coherencia de la configuración de los recursos y la aplicación de prácticas de incorporación, recuperación y detección.

- **Línea base de identidad**: garantiza que se aplique la línea base de identidad y acceso mediante la aplicación coherente de definiciones y asignaciones de roles.

- **Aceleración de las implementaciones**: acelera la implementación de directivas mediante la centralización, la coherencia y la estandarización de las plantillas de implementación.
## Gobernanza de la nube con Azure Policy

La principal herramienta de gobernanza de Azure es [Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/overview). Azure Policy facilita la gobernanza de todos los recursos, tanto los actuales como los futuros. Ayuda a aplicar los estándares de la organización y evaluar el cumplimiento a escala mediante el establecimiento de barreras de protección en distintos recursos.

Azure Policy permite administrar las directivas de forma centralizada, hacer seguimiento del estado de cumplimiento e investigar los cambios que provocan incumplimientos. Puedes consolidar todos los datos de cumplimiento en un único repositorio, lo que simplifica las auditorías y mejora el cumplimiento en la nube y la gobernanza de los recursos. El panel de cumplimiento de Azure Policy ofrece una vista agregada del estado general del entorno y permite examinar los detalles de cada recurso y directiva.

Azure Policy garantiza el cumplimiento coherente de los estándares y evita configuraciones incorrectas. También ayuda a que los recursos cumplan los requisitos mediante la corrección en bloque de los recursos existentes y la corrección automática de los nuevos. Además, al integrar Azure Policy directamente en la plataforma Azure, se puede reducir considerablemente la necesidad de procesos de aprobación externos y aumentar la productividad de los desarrolladores.

Algunas acciones de gobernanza útiles que puedes aplicar con Azure Policy son:

- Garantizar que el equipo implemente recursos de Azure solo en las regiones permitidas.

- Aplicar reglas de replicación geográfica para cumplir los requisitos de residencia de datos.

- Permitir únicamente determinados tamaños de máquinas virtuales en el entorno de nube.

- Exigir la aplicación coherente de etiquetas taxonómicas en los recursos.

- Recomendar actualizaciones del sistema en los servidores.

- Permitir la autenticación multifactorial en todas las cuentas de la suscripción.

- Exigir que los recursos envíen registros de diagnóstico a un área de trabajo de Azure Monitor Logs.

Azure Policy evalúa los recursos y señala los que no cumplen las directivas que has creado. También puede impedir que se creen recursos no conformes. Incluye definiciones integradas de directivas e iniciativas para almacenamiento, redes, proceso, Security Center y supervisión. Por ejemplo, si defines una directiva que solo permite determinados tamaños de máquina virtual (VM) en el entorno, se invoca al crear una VM y cada vez que se cambia el tamaño de una existente. Azure Policy también evalúa y supervisa todas las VM actuales del entorno, incluidas las creadas antes de definir la directiva.

En algunos casos, Azure Policy puede corregir automáticamente recursos y configuraciones no conformes para mantener la integridad de su estado. Por ejemplo, si todos los recursos de un grupo de recursos determinado deben tener la etiqueta _AppName_ con el valor _SpecialOrders_, Azure Policy puede agregarla automáticamente cuando falte. Sin embargo, mantienes el control total del entorno. Si no quieres que Azure Policy actualice automáticamente un recurso concreto, puedes marcarlo como excepción y la directiva no lo actualizará.

Azure Policy también se integra con Azure DevOps mediante la aplicación de las directivas de los canales de integración y entrega continuas correspondientes a las fases anteriores y posteriores a la implementación de las aplicaciones.

Al diseñar una directiva de Azure, el objetivo debe ser equilibrar el control y la estabilidad con la rapidez y los resultados. Este equilibrio permite mantener un entorno fácil de administrar y aplicar los controles de gobernanza necesarios sin perjudicar la eficiencia operativa ni la productividad. Al establecer y aplicar estos controles, hay que procurar que no se reduzca la velocidad necesaria para alcanzar la eficiencia. Por eso, equilibrar el control y la estabilidad con la rapidez y los resultados suele requerir decisiones meditadas, y es necesario evaluar cuidadosamente el impacto potencial antes de introducir nuevas directivas.

Para obtener más información, consulta [Microsoft Cloud Adoption Framework para Azure](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/).

# Principios de diseño de Azure Policy

La gobernanza proporciona mecanismos y procesos para mantener el control de las aplicaciones y los recursos de Azure. Implica planificar las directivas en Azure Policy y establecer prioridades estratégicas. Al diseñarlas, debes organizar los recursos en la nube para protegerlos, administrarlos y hacer seguimiento de los costos asociados a las cargas de trabajo.

## Jerarquía de gobernanza

Azure proporciona cuatro niveles de administración para establecer una gobernanza adecuada: grupos de administración, suscripciones, grupos de recursos y recursos. Puedes crear una estructura flexible de grupos de administración y suscripciones para organizar los recursos en una jerarquía y administrar de forma unificada las directivas y el acceso. El diagrama siguiente muestra un ejemplo de jerarquía de gobernanza creada con grupos de administración.

![[azure-governance-hierarchy.png]]

La estructura de Azure comienza con el grupo raíz del inquilino, en la parte superior, seguido de una jerarquía de grupos de administración que puede extenderse hasta seis niveles por debajo de la raíz. A continuación se define cada nivel de la jerarquía y la relación entre ellos:

|Concept|Description|
|---|---|
|**Recurso**|Un recurso es el componente básico de Azure e incluye instancias de servicios que se crean, aprovisionan, implementan, etc. Las máquinas virtuales (VM), las redes virtuales, las bases de datos y los servicios de inteligencia artificial, entre otros, son recursos de Azure.|
|**Grupos de recursos**|Los grupos de recursos agrupan recursos. Al crear un recurso, debes colocarlo en un grupo de recursos. Un grupo puede contener muchos recursos, pero cada recurso solo puede pertenecer a un grupo a la vez.  <br>  <br>Cuando se aplica una acción a un grupo de recursos, esta afecta a todos sus recursos. Si eliminas el grupo, se eliminan todos sus recursos. Si concedes o deniegas el acceso al grupo, también se concede o deniega el acceso a todos sus recursos.|
|**Suscripciones**|En Azure, las suscripciones son una unidad de administración, facturación y escala. Al igual que los grupos de recursos permiten organizar los recursos de forma lógica, las suscripciones permiten organizar los grupos de recursos y facilitan la facturación. Cada suscripción tiene límites o cuotas para la cantidad de recursos que se pueden crear y usar. Las organizaciones pueden usar suscripciones para administrar los costos y los recursos creados por usuarios, equipos y proyectos.  <br>  <br>Para usar Azure se necesita una suscripción. Esta proporciona acceso autenticado y autorizado a los productos y servicios de Azure, y permite aprovisionar recursos. Una suscripción de Azure está vinculada a una cuenta de Azure, que es una identidad de Microsoft Entra ID o de un directorio en el que Microsoft Entra ID confía.|
|**Grupos de administración**|Los grupos de administración de Azure proporcionan un ámbito situado por encima de las suscripciones. Si tienes muchas suscripciones, quizá necesites una forma eficaz de administrar su acceso, sus directivas y su cumplimiento. Puedes organizarlas en contenedores llamados grupos de administración y aplicarles condiciones de gobernanza.  <br>  <br>Los grupos de administración permiten administrar a escala empresarial, independientemente del tipo de suscripciones. Se pueden anidar.|
Puedes aplicar la configuración de administración en cualquiera de estos niveles de ámbito. El nivel seleccionado determina la amplitud de la aplicación. Los niveles inferiores heredan la configuración de los superiores. Por ejemplo, una directiva asignada a una suscripción se aplica a todos sus grupos de recursos y recursos. Una directiva asignada a un grupo de recursos se aplica a ese grupo y a todos sus recursos, pero no a otros grupos. Todas las suscripciones de un grupo de administración heredan automáticamente las condiciones aplicadas a dicho grupo.

## Introducción a Azure Resource Manager

Azure Resource Manager es el servicio de implementación y administración de Azure. Proporciona una capa de administración que permite crear, actualizar y eliminar recursos en la cuenta de Azure.

Las operaciones de Azure se clasifican en dos tipos principales: plano de control y plano de datos. El plano de control permite administrar los recursos de la suscripción, mientras que el plano de datos permite acceder a las funcionalidades de instancias de tipos de recursos específicos.

### Plano de control

Azure Policy opera en el plano de control para aplicar reglas y requisitos de cumplimiento a los recursos. Azure Resource Manager administra todas las operaciones del plano de control de Azure e integra componentes comunes a los distintos servicios. Azure Policy está integrado con Azure Resource Manager.

![[azure-policy-and-resource-manager.png]]

Azure Resource Manager administra funciones esenciales, como las implementaciones basadas en plantillas, el control de acceso basado en roles (RBAC), la auditoría, la supervisión y el etiquetado. Esto proporciona una experiencia unificada para administrar los recursos de Azure después de implementarlos. Por ejemplo, puedes crear una cuenta de almacenamiento mediante Azure Resource Manager y aplicar una directiva que exija el cifrado en todas las cuentas de almacenamiento.

### Plano de datos

El plano de datos es donde se realizan las operaciones sobre los datos. Azure Policy garantiza que los recursos con los que interactúas en este plano cumplan las directivas. Las operaciones del plano de datos implican interactuar directamente con los datos almacenados en un recurso. Siguiendo con el ejemplo anterior, la carga y descarga de archivos en la cuenta de almacenamiento se gestionan directamente en el plano de datos de dicha cuenta, no mediante Azure Resource Manager.

Azure Policy permite que los servicios individuales de Azure implementen una extensión de Azure Policy, lo que amplía el comportamiento de las directivas y su integración con proveedores de recursos específicos. Actualmente, Azure Policy admite operaciones del plano de datos mediante los siguientes modos de proveedor de recursos:

- **Microsoft.Kubernetes.Data**: se usa para administrar clústeres de Kubernetes y componentes como pods, contenedores e ingress.

- **Microsoft.KeyVault.Data**: se usa para administrar almacenes y certificados de Azure Key Vault.

- **Microsoft.Network.Data**: se usa para administrar directivas personalizadas de pertenencia de Azure Virtual Network Manager mediante Azure Policy.

- **Microsoft.ManagedHSM.Data**: se usa para administrar claves de Azure Key Vault Managed HSM mediante Azure Policy.

- **Microsoft.DataFactory.Data**: se usa para que Azure Policy deniegue nombres de dominio del tráfico saliente de Azure Data Factory.

- **Microsoft.MachineLearningServices.v2.Data**: se usa para administrar implementaciones de modelos de Azure Machine Learning. Este modo de proveedor de recursos informa del cumplimiento de los componentes recién creados o actualizados.

## Flujos de operación de Azure Resource Manager.

Azure Resource Manager contempla dos escenarios para gestionar solicitudes de Azure: **Greenfield** y **Brownfield**. Al implementar recursos, Azure Resource Manager determina cuándo debe crear recursos nuevos y cuándo actualizar los existentes.

![[operation-flows.png]]

**Greenfield** describe el escenario en el que ya existe una directiva de Azure Policy (primero la directiva) y se crea o actualiza un recurso de Azure.

Por ejemplo, creas un recurso mediante una llamada a la API REST HTTPS de Azure Resource Manager dirigida a un proveedor de recursos específico. La solicitud pasa por distintas capas, entre ellas el control de acceso basado en roles (RBAC) y Azure Policy. Aunque son solo dos de varias capas, es importante recordar que Azure Policy se ejecuta después de RBAC. Si no tienes permiso para realizar una operación, esta falla en la fase de RBAC y Azure Policy ni siquiera se evalúa. Si tienes permiso, la solicitud pasa por Azure Policy y se evalúa frente a las directivas aplicables. Al actualizar un recurso, el cuerpo de la solicitud incluye únicamente los cambios (el delta). Azure Policy necesita conocer el estado completo del recurso, por lo que lee su estado actual y combina con él el delta enviado. El estado resultante es el que se evalúa frente a las directivas.

**Brownfield** describe el escenario en el que los recursos ya existen (primero los recursos) y se les asigna una nueva directiva de Azure Policy.

En este caso, la evaluación de la directiva se realiza mediante un examen de cumplimiento, que se ejecuta automáticamente cada 24 horas o puede iniciarse manualmente. La duración del examen es impredecible, pero al finalizar se actualiza el estado de cumplimiento de los recursos existentes. Para realizar la evaluación, Azure Policy lee todos los recursos existentes en el ámbito. Puedes crear una directiva que prohíba crear recursos fuera de una región determinada, como West Europe. Los recursos existentes fuera de esa región no se eliminan, pero se marcan como no conformes; las futuras solicitudes para crear recursos fuera de West Europe se deniegan.

# Recursos de Azure Policy

Azure Policy aplica los estándares de la organización y evalúa el cumplimiento a escala. Evalúa los recursos y las acciones de Azure comparando sus propiedades con las reglas empresariales, y ofrece una vista agregada del estado general del entorno. También permite analizar detalladamente cada recurso y cada directiva. Azure dispone de seis tipos de recursos de Policy, asociados a varios conceptos.

![[policy-resources.png]]

## Definiciones

Las definiciones de Azure Policy describen las condiciones de cumplimiento de los recursos y el efecto que se aplica cuando se cumple una condición. Varias opciones determinan qué recursos evalúa una directiva. Estas opciones se explican en la siguiente unidad, **Definiciones de Azure Policy**. El concepto principal al que se aplican es el ámbito.

El ámbito de Azure Policy corresponde a los niveles de la jerarquía de gobernanza de Azure. Bajo la raíz del inquilino hay cuatro niveles de ámbito de administración: grupos de administración, suscripciones, grupos de recursos y recursos. La definición puede guardarse en un grupo de administración o en una suscripción. Su ubicación determina el ámbito al que se puede asignar la iniciativa o la directiva. La asignación también incluye propiedades que establecen el ámbito y determinan qué recursos evalúa Azure Policy y cuáles se contabilizan para el cumplimiento.

Puedes aplicar la configuración de administración en cualquiera de estos niveles. El nivel seleccionado determina la amplitud de su aplicación, y los niveles inferiores heredan la configuración de los superiores. Para obtener más información, consulta [Ámbito en Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/scope).

## Iniciativas

Las iniciativas de Azure Policy, también conocidas como conjuntos de directivas, permiten agrupar varias definiciones para simplificar su asignación y administración, ya que se trabaja con la iniciativa como un único elemento. Ofrecen un enfoque optimizado y automatizado de la gobernanza, que permite a las organizaciones administrar y supervisar el cumplimiento a escala.

## Asignaciones

Las asignaciones de directiva definen qué recursos se evalúan mediante una definición de directiva o una iniciativa. Se pueden crear en el portal, mediante una llamada a la API o desde la interfaz de línea de comandos.

Las directivas y las iniciativas se asignan a un ámbito específico (grupo de administración, suscripción o grupo de recursos). Durante la asignación, se pueden definir varios aspectos opcionales, como el ámbito de los recursos y la definición de directiva.

- Los _selectores de recursos_ opcionales permiten implementar gradualmente según la ubicación o el tipo de recurso.
- Las _invalidaciones_ opcionales permiten cambiar el efecto de una definición de directiva sin modificar la definición subyacente.
- Se puede deshabilitar _enforcementMode_ para admitir escenarios hipotéticos («what-if») sin cambiar la definición. Esto equivale a cambiar el efecto de la definición a _audit_, pero se configura en el nivel de asignación. Por ejemplo, si la directiva tiene el efecto _Deny_, la denegación no se aplica, aunque se puede ver el resultado de la evaluación de cumplimiento.
- Los _ámbitos excluidos_ opcionales permiten excluir contenedores o recursos secundarios del ámbito de asignación.
- Se pueden definir _mensajes de incumplimiento_.
- Se pueden asignar valores a los _parámetros_.
- Si una directiva usa el efecto _deployIfNotExists_, se le puede asignar una _identidad administrada_ (asignada por el sistema o por el usuario) para habilitar las acciones de corrección. Una asignación tiene varias propiedades que establecen el ámbito y determinan qué recursos evalúa Azure Policy y cuáles se contabilizan para el cumplimiento. Estas propiedades corresponden a los conceptos siguientes:
  - **Inclusión**: para obtener más información, consulta la [estructura de las asignaciones de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure)).
  - **Exclusión**: para obtener más información, consulta los [ámbitos excluidos de las asignaciones de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure#excluded-scopes) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure#excluded-scopes)).

## Exenciones

Usa la característica de exenciones de Policy para excluir de la evaluación de iniciativas o definiciones una jerarquía de recursos o un recurso individual. Los recursos _exentos_ se contabilizan en el cumplimiento general, aunque no se evalúan o cuentan con una dispensa temporal. Las exenciones se crean como objetos secundarios de la jerarquía de recursos o del recurso individual al que se concede la exención.

Las exenciones de Policy no se crean al asignar la directiva, sino después; su efecto es similar al de excluir un ámbito. Hay dos categorías de exención:

- **Mitigada**: se concede la exención porque el objetivo de la directiva se cumple por otro método.
- **Dispensa**: se concede la exención porque se acepta temporalmente el estado de incumplimiento del recurso.

Para obtener más información sobre las exenciones, consulta la [estructura de exenciones de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/exemption-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/exemption-structure)).

## Atestaciones

Azure Policy usa atestaciones para establecer el estado de cumplimiento de los recursos o ámbitos a los que se aplican las [directivas manuales](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effect-manual) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/effect-manual)). Cada recurso aplicable requiere una atestación por cada asignación de directiva manual. Para facilitar la administración, las directivas manuales deben diseñarse para aplicarse al ámbito que delimita los recursos cuyo estado de cumplimiento debe atestarse.

Para obtener más información, consulta la [estructura de atestaciones de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/attestation-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/attestation-structure)).

## Correcciones

La característica de tareas de corrección de Policy se usa para conseguir que los recursos cumplan una definición y una asignación. Los recursos que no cumplen una asignación de definición con efecto _modify_ o _deployIfNotExists_ se pueden corregir mediante una tarea de corrección. Los recursos que se crean o actualizan y están sujetos a una asignación de definición con efecto _deployIfNotExists_ o _modify_ se corrigen automáticamente.

Para obtener más información, consulta la [estructura de tareas de corrección de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/remediation-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/remediation-structure)).


# Definiciones de Azure Policy

Una **definición de Azure Policy** describe las condiciones de cumplimiento de los recursos y la acción o los efectos que se aplican cuando se cumplen dichas condiciones. La directiva consta de dos partes:

- Una **condición** que compara un campo de propiedad del recurso o un valor, al que se accede mediante alias, con un valor requerido.

- El **efecto** determina qué ocurre cuando la regla de directiva evalúa que se cumple la condición. Los efectos se comportan de manera distinta con los recursos nuevos, actualizados y existentes.

## Estructura de una definición de directiva

Las definiciones de directiva se crean en JSON y contienen los elementos que se muestran en la tabla siguiente.

|Element|Description|Properties or values|
|---|---|---|
|_displayName (string, max 128 characters)_|Se usa para identificar la definición de directiva.||
|_description (string, max 512 characters)_|Proporciona contexto sobre el uso de la definición.||
|_policyType (read-only string)_|Indica el origen de la definición de directiva. Esta propiedad no se puede establecer, pero el SDK devuelve tres valores visibles en el portal.|● Integrada: proporcionada y mantenida por Microsoft.  <br>● Personalizada: definición creada por el cliente.  <br>● Estática: directiva de cumplimiento normativo propiedad de Microsoft.|
|_mode (string)_|Se configura según el destino de la directiva: una propiedad de Azure Resource Manager o del proveedor de recursos.|● Modos de Resource Manager:  <br>    o On All: evalúa grupos de recursos, suscripciones y todos los tipos de recursos.  <br>    o Indexed: evalúa grupos de recursos, suscripciones y todos los tipos de recursos.  <br>● Modos de proveedor de recursos (solo directivas integradas y con compatibilidad completa):  <br>    o Microsoft.Kubernetes.Data  <br>    o Microsoft.KeyVault.Data  <br>    o Microsoft.Network.Data  <br>● Modos de proveedor de recursos (solo directivas integradas y en versión preliminar):  <br>    o Microsoft.ManagedHSM.Data  <br>    o Microsoft.DataFactory.Data|
|_version (string, optional)_|Las definiciones de directiva integradas pueden tener varias versiones con el mismo definitionID. Si no se especifica una versión, todas las experiencias muestran la versión más reciente de la definición.||
|_metadata (object, optional, max 1,024 characters)_|Almacena información sobre la definición de directiva.|Propiedades comunes de las directivas integradas:  <br>● _version (string)_: registra detalles de la versión del contenido de una definición de directiva.  <br>● _category (string)_: determina la categoría en la que se muestra la definición en el portal de Azure.  <br>● _preview (Boolean)_: valor verdadero o falso que indica si la definición está en versión preliminar.  <br>● _deprecated (Boolean)_: valor verdadero o falso que indica si la definición está en desuso.  <br>● _portalReview (string)_: determina si es necesario revisar los parámetros en el portal.|
|_parameters (object, optional)_|Ayuda a simplificar la administración de directivas al reducir la cantidad de definiciones. Los parámetros permiten reutilizar una directiva en distintos escenarios con diferentes valores.|Propiedades:  <br>● name  <br>● type (String, Array, Object, Boolean, Integer, Float, DateTime)  <br>● metadata (description, displayName, strongType, assignPermissions)  <br>● defaultValue  <br>● allowedValues  <br>● schema|
|_policyRule (object)_|El efecto de una directiva se define en _policyRule_. La regla consta de los bloques _if_ y _then_.  <br>● En el bloque _if_, se definen una o varias condiciones que determinan cuándo se aplica la directiva.  <br>● En el bloque _then_, se define el efecto que se aplica cuando las condiciones de _if_ se evalúan como verdaderas.||

```json
{
  "displayName": "Allowed locations",
  "description": "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region.",
  "policyType": "BuiltIn",
  "mode": "Indexed",
  "metadata": {
    "version": "1.0.0",
    "category": "General"
  },
  "parameters": {
    "listOfAllowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of locations that can be specified when deploying resources.",
        "strongType": "location",
        "displayName": "Allowed locations"
      }
    }
  },
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "location",
            "notIn": "[parameters('listOfAllowedLocations')]"
          },
          {
            "field": "location",
            "notEquals": "global"
          },
          {
            "field": "type",
            "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
```

En el ejemplo, _b2cDirectories_ queda excluido de la lógica de la directiva porque su campo de ubicación no corresponde a una región (puede ser «United States», «Europe», «Asia Pacific» o «Australia»). Esta lógica se puede aplicar mediante una directiva independiente.

## Operadores lógicos y condiciones (bloques _if_)

La primera parte de _policyRule_ en una definición de Azure Policy es el bloque _if_. Este bloque define las condiciones que usa la directiva para evaluar los recursos. Una definición puede contener varias expresiones condicionales. Según los requisitos de evaluación, puede ser necesario que todas sean verdaderas o que solo lo sean algunas.
### Operadores lógicos admitidos en el bloque _if_

En la condición _if_ se pueden usar distintos operadores lógicos.

|Operador|Tipo|Descripción|
|---|---|---|
|_not_|{condition or operator}|La sintaxis _not_ invierte el resultado de la condición.|
|_allOf_|[{condition or operator}, {condition or operator}]|La sintaxis _allOf_ (similar a la operación lógica _and_) requiere que todas las condiciones sean verdaderas.|
|_anyOf_|[{condition or operator}, {condition or operator}]|La sintaxis _anyOf_ (similar a la operación lógica _or_) requiere que una o varias condiciones sean verdaderas.|
```json
{
  "if": {
    "allOf": [
      {
        "field": "location",
        "notIn": "[parameters('listOfAllowedLocations')]"
      },
      {
        "field": "location",
        "notEquals": "global"
      },
      {
        "field": "type",
        "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
      }
    ]
  },
  "then": {
    "effect": "deny"
  }
}
```
### Operaciones lógicas anidadas

Las operaciones lógicas son opcionales y se pueden anidar para crear escenarios complejos.

El ejemplo siguiente muestra una operación _not_ anidada en una operación _allOf_:
```json
"if": {
    "allOf": [
      {
        "not": {
          "field": "tags",
          "containsKey": "application"
        }
      },
      {
        "field": "type",
        "equals": "Microsoft.Storage/storageAccounts"
      }
    ]
  },
```


### Condiciones

En una condición se pueden evaluar propiedades como campos, valores o recuentos.

|   |   |   |
|---|---|---|
|**Campos**|Las expresiones de campo permiten crear condiciones que evalúan si los valores de las propiedades de la carga de la solicitud de recurso cumplen ciertos criterios.|Name, fullName, kind, type, location, ID, identity.type, tags, tags['tagName'], alias de propiedades|
|**Valor**|Las expresiones de valor permiten crear condiciones que evalúan si un valor cumple ciertos criterios.||
|**Recuento**|Las expresiones de recuento permiten contar cuántos elementos de una matriz cumplen ciertos criterios.|● Recuento de campos y recuento de valores  <br>● La función current() devuelve el valor del elemento de matriz que se está evaluando|
La condición de Azure Policy evalúa si los valores de propiedades, como los campos, los valores o los recuentos, cumplen determinados criterios. Si una función devuelve un error, la directiva produce un efecto deny. Durante las pruebas, se puede evitar este resultado deshabilitando _enforcementMode_ en la asignación. Para obtener más información, consulta [Modo de cumplimiento](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure#enforcement-mode) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure#enforcement-mode)).

|Criterio de evaluación|Tipo de valor|
|---|---|
|_equals_|stringValue|
|_notEquals_|stringValue|
|_like_|stringValue|
|_notLike_|stringValue|
|_match_|stringValue|
|_notMatch_|stringValue|
|_matchInsensitively_|stringValue|
|_notMatchInsensitively_|stringValue|
|_contains_|stringValue|
|_notContains_|stringValue|
|_In_|["stringValue1", "stringValue2"]|
|_notIn_|["stringValue1", "stringValue2"]|
|_containsKey_|keyName|
|_notContainsKey_|keyName|
|_less_|dateValue|
|_less_|stringValue|
|_less_|intValue|
|_lessOrEquals_|dateValue|
|_lessOrEquals_|stringValue|
|_lessOrEquals_|intValue|
|_greater_|dateValue|
|_greater_|stringValue|
|_greater_|intValue|
|_greaterOrEquals_|dateValue|
|_greaterOrEquals_|stringValue|
|_greaterOrEquals_|intValue|
|_exists_|bool|
```json
{
  "if": {
    "allOf": [
      {
        "value": "[resourceGroup().name]",
        "like": "*netrq"
      },
      {
        "field": "type",
        "notLike": "Network/*"
      }
    ]
  },
  "then": {
    "effect": "deny",
    "details": {
      "count": {
        "field": "Microsoft.Network/virtualNetworks/addressSpace.addressPrefixes[*]",
        "where": {
          "value": "[ipRangeContains('10.0.0.0/24', current('Microsoft.Network/virtualNetworks/addressSpace.addressPrefixes[*]'))]",
          "equals": "greater"
        }
      }
    }
  }
}
```

### Funciones de Policy

Se pueden usar funciones para añadir lógica a una regla de directiva. Se resuelven en la regla de la definición de directiva y en los valores de los parámetros asignados a las definiciones de una iniciativa.

En una regla de directiva se pueden usar las funciones de plantillas de Resource Manager, excepto algunas [funciones de Policy y funciones definidas por el usuario](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-policy-rule#policy-functions) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/definition-structure-policy-rule#policy-functions)).

La función _utcNow()_ se puede usar en una regla de directiva, pero su comportamiento difiere del que tiene en una plantilla de Azure Resource Manager (plantilla ARM). A diferencia de una plantilla ARM, esta función se puede usar fuera de _defaultValue_. Devuelve una cadena con la fecha y hora actuales en formato ISO 8601 universal `yyyy-MM-ddTHH:mm:ss.fffffffZ`.

La tabla siguiente describe las funciones disponibles únicamente en las reglas de directiva.

|Función|Descripción|
|---|---|
|`addDays(dateTime, numberOfDaysToAdd)`|● `dateTime`: cadena [obligatoria] en formato ISO 8601 universal 'yyyy-MM-ddTHH:mm:ss.FFFFFFFZ'.  <br>● `numberOfDaysToAdd`: entero [obligatorio] que indica el número de días que se agregarán.|
|`Field(fieldName)`|● `fieldName`: cadena [obligatoria], nombre del [campo](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-policy-rule#fields) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/definition-structure-policy-rule#fields)) que se recuperará.  <br>● Devuelve el valor de ese campo del recurso evaluado por la condición _if_.  <br>● `field` se usa principalmente con `auditIfNotExists` y `deployIfNotExists` para hacer referencia a campos del recurso que se está evaluando.|
|`requestContext().apiVersion`|Devuelve la versión de API de la solicitud que desencadenó la evaluación de la directiva. Este valor es la versión de API usada en la solicitud PUT/PATCH para evaluar la creación o actualización de un recurso. Al evaluar el cumplimiento de recursos existentes, siempre se usa la versión de API más reciente.|
|`policy()`|Devuelve información sobre la directiva que se está evaluando. Se puede acceder a las propiedades del objeto devuelto.  <br>`"assignmentId": ""`,  <br>`"definitionId": ""`,  <br>`"setDefinitionId": ""`,  <br>`"definitionReferenceId": ""`|
|`ipRangeContains(range, targetRange)`|● `range`: cadena [obligatoria] que especifica un intervalo de direcciones IP para comprobar si contiene `targetRange`.  <br>● `targetRange`: cadena [obligatoria] que especifica el intervalo de direcciones IP cuya inclusión en `range` se quiere validar.  <br>Devuelve un valor booleano que indica si el intervalo IP de `range` contiene el intervalo IP de `targetRange`. No se permiten intervalos vacíos ni combinar familias IP; hacerlo provoca un error de evaluación.|
|`current(indexName)`|Función especial que solo se puede usar dentro de expresiones de recuento.|
## Tipos de efecto (bloques _then_)

La segunda parte de _policyRule_ en una definición de Azure Policy es el bloque _then_. Este bloque define el efecto que se aplica cuando la regla determina que los recursos cumplen la condición. Una definición de directiva puede admitir más de un efecto. En esos casos, se suelen usar parámetros para especificar los valores de efecto permitidos (_allowedValues_), lo que aporta flexibilidad a una misma definición durante la asignación. Las propiedades de los recursos y la lógica de la regla pueden determinar si un efecto concreto es válido para la definición.

| Efecto              | Descripción                                                                                                                                                                                                                                                                                                      | Tipo                   |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| _disabled_          | El efecto _disabled_ desactiva la directiva. Si una definición tiene _Disabled_ como efecto, sus asignaciones no están activas. Este efecto se comprueba primero para determinar si se debe evaluar la regla. Así se puede desactivar una sola asignación sin desactivar todas las asignaciones de la directiva. | Evaluación sincrónica  |
| _append_            | El efecto _append_ agrega campos al recurso solicitado durante su creación o actualización. En gran medida ha quedado obsoleto porque _modify_ también permite agregar campos a la solicitud.                                                                                                                    | Evaluación sincrónica  |
| _modify_            | El efecto _modify_ agrega, actualiza o quita propiedades o etiquetas de una suscripción o un recurso durante su creación o actualización. Permite que Azure Policy modifique las solicitudes a Azure Resource Manager cambiando campos para garantizar el cumplimiento.                                          | Evaluación sincrónica  |
| _deny_              | El efecto _deny_ impide una solicitud de recurso que no cumple los estándares definidos por una directiva y hace que la solicitud produzca un error.                                                                                                                                                             | Evaluación sincrónica  |
| _denyAction_        | El efecto _denyAction_ bloquea a escala las solicitudes según la acción prevista sobre los recursos. Actualmente, la única acción admitida es DELETE.                                                                                                                                                            | Evaluación sincrónica  |
| _audit_             | El efecto _audit_ crea un evento de advertencia en el registro de actividad al evaluar un recurso no conforme, pero no detiene la solicitud.                                                                                                                                                                     | Evaluación asincrónica |
| _auditIfNotExists_  | El efecto _auditIfNotExists_ audita los recursos relacionados con el recurso que coincide con la condición _if_ cuando no tienen las propiedades especificadas en los detalles de la condición _then_.                                                                                                           | Evaluación asincrónica |
| _deployIfNotExists_ | La definición de directiva con efecto _deployIfNotExists_ ejecuta una implementación de plantilla cuando se cumple la condición. Puede desencadenar la implementación de un recurso relacionado según el estado de cumplimiento del recurso evaluado.                                                            | Evaluación asincrónica |
| _manual_            | El efecto _manual_ permite atestar manualmente el cumplimiento de recursos o ámbitos. Cuando se asigna una definición con efecto _Manual_, se pueden establecer los estados de cumplimiento de los recursos o ámbitos seleccionados mediante atestaciones personalizadas.                                        | Atestación manual      |
La siguiente lista ofrece orientación general sobre los efectos que se pueden intercambiar:

- _audit_, _deny_ y _modify_ o _append_ suelen ser intercambiables.
- _auditIfNotExists_ y _deployIfNotExists_ suelen ser intercambiables.
- _manual_ no es intercambiable.
- _disabled_ se puede intercambiar con cualquier efecto.

Se pueden asignar varias directivas a un mismo recurso, en el mismo ámbito o en ámbitos distintos. Por lo general, cada directiva define un efecto diferente. La condición y el efecto de cada directiva se evalúan de forma independiente. El resultado neto de combinar definiciones de directiva se considera **el más restrictivo de forma acumulativa**.

# Evaluación de recursos mediante Azure Policy.

Una ventaja importante de Azure Policy es la visibilidad y el control que ofrece sobre los recursos de una suscripción o de un grupo de suscripciones. Este control puede impedir que se creen recursos en ubicaciones incorrectas, exigir un uso uniforme de las etiquetas o auditar la configuración y los valores adecuados de los recursos existentes. Antes de revisar los datos de cumplimiento y actuar en consecuencia, es necesario comprender los desencadenadores de evaluación, los tiempos y los estados de cumplimiento de los recursos.
## Desencadenadores de evaluación

La evaluación de las directivas y las iniciativas asignadas se produce como resultado de distintos eventos:

- Se asigna una directiva o iniciativa nueva a un ámbito.

- Se actualiza una directiva o iniciativa que ya estaba asignada a un ámbito.

- Se implementa o actualiza un recurso en un ámbito con una asignación, mediante Azure Resource Manager, la API REST o un SDK compatible.

- Se crea o mueve una suscripción (tipo de recurso Microsoft.Resources/subscriptions) dentro de una jerarquía de grupos de administración que tiene asignada una definición de directiva dirigida al tipo de recurso de suscripción.

- Se crea, actualiza o elimina una exención de directiva.

- Se inicia el ciclo estándar de evaluación del cumplimiento.

- Un recurso administrado actualiza el proveedor de recursos de configuración de máquina con detalles de cumplimiento.

- Se inicia un examen a petición.

Para obtener más información, consulta los [desencadenadores de evaluación](https://learn.microsoft.com/en-us/azure/governance/policy/how-to/get-compliance-data#evaluation-triggers).
## Tiempos de evaluación.

Al trabajar con asignaciones de directivas en Azure, es importante comprender el comportamiento y los tiempos de los exámenes de cumplimiento, especialmente en escenarios **Brownfield**, donde se aplican directivas nuevas a recursos existentes. Los exámenes de cumplimiento de Azure Policy se pueden desencadenar de varias maneras:

- **Examen completo automático**: se inicia automáticamente cada 24 horas.

- **Examen manual en escenarios Brownfield**: cuando se aplica una directiva nueva a recursos existentes, puedes iniciar manualmente un examen de cumplimiento ejecutando _az policy state trigger-scan_.

Al asignar una **directiva nueva, su aplicación puede demorarse hasta 30 minutos**. La caché de Azure Resource Manager conserva datos de sesión y la directiva puede tardar en propagarse dentro de la misma sesión. Para evitar la demora de la caché, puedes cerrar sesión y volver a iniciarla para actualizarla y lograr que la directiva nueva se aplique inmediatamente al ámbito definido.

Una vez iniciado el examen, varios factores influyen en el tiempo que tarda en completarse:

- **Definiciones de directiva**: su tamaño y complejidad pueden aumentar la duración del examen.

- **Cantidad de directivas**: cuantas más directivas se apliquen, más puede tardar el examen.

- **Tamaño del ámbito**: también influye el tamaño del ámbito de recursos al que se asigna la directiva.

- **Carga del sistema**: los exámenes de cumplimiento tienen prioridad baja; si el sistema está ocupado con tareas más importantes, pueden tardar más. El sistema prioriza las operaciones interactivas y de alta importancia, por lo que un examen puede durar varios minutos o incluso decenas de minutos, aun en entornos pequeños.

- **Examen sincrónico (ejecución de baja prioridad)**: como los exámenes de cumplimiento son sincrónicos y tienen baja prioridad en Azure, se retrasan si el sistema está ocupado. Esto puede prolongar considerablemente su duración, incluso con ámbitos o directivas pequeños.

Comprender el proceso de examen de cumplimiento y sus posibles demoras permite administrar mejor la aplicación y evitar esperas innecesarias, especialmente en entornos con definiciones de directiva complejas o extensas.

## Estados de cumplimiento de los recursos

Al asignar definiciones de directiva o iniciativas, Azure Policy determina qué recursos son aplicables. Después evalúa los que no están excluidos ni exentos. Según las condiciones de la regla y el grado en que cada recurso las cumple, la evaluación asigna a cada uno un estado de cumplimiento:

- **No conforme** (`Non-compliant`).

- **Conforme** (`Compliant`).

- **Error** (error de plantilla o de evaluación).

- **En conflicto** (`Conflicting`): dos o más asignaciones del mismo ámbito tienen reglas contradictorias, por ejemplo, dos directivas agregan la misma etiqueta con valores distintos.

- **Protegido** (`Protected`): el recurso está cubierto por una asignación con efecto _denyAction_.

- **Exento desconocido** (`Exempted Unknown`): estado predeterminado de las definiciones con efecto _manual_.

Cuando varios recursos o directivas tienen distintos estados de cumplimiento, el estado general se determina individualmente para cada recurso y cada asignación de directiva. Azure Policy asigna una prioridad a los estados para resolver estas situaciones; el orden de prioridad es el indicado en la lista anterior.

El porcentaje de cumplimiento se calcula dividiendo la cantidad de recursos **conformes**, **exentos** y **desconocidos** entre el total de recursos. El total incluye los recursos con estado **conforme**, **no conforme**, **desconocido**, **exento**, **en conflicto** y **error**.

Para obtener más información sobre cuándo devuelven las directivas estos estados para un recurso determinado, consulta los [estados de cumplimiento de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/compliance-states) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/compliance-states)).

## Modo de cumplimiento

_enforcementMode_ es una propiedad de la asignación de una directiva que permite desactivar la aplicación de determinados efectos. Este modo permite probar el resultado de la directiva en recursos existentes sin activar el efecto ni generar entradas en el [registro de actividad de Azure](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/platform-logs-overview) ([ES](https://learn.microsoft.com/es-es/azure/azure-monitor/essentials/platform-logs-overview)). Una vez probada exhaustivamente, se puede cambiar _enforcementMode_ a Enabled.

Este escenario suele denominarse _What If_ y se ajusta a las prácticas de implementación segura. _enforcementMode_ es distinto del efecto _disabled_: el efecto _disabled_ impide por completo la evaluación de los recursos, mientras que _enforcementMode_ permite evaluarlos sin aplicar el efecto.

La tabla siguiente describe los valores de esta propiedad.

|Modo|Valor JSON|Tipo|Corrección manual|Entrada en el registro de actividad|Descripción|
|---|---|---|---|---|---|
|Enabled|Predeterminado|string|Sí|Sí|El efecto de la directiva se aplica al crear o actualizar recursos.|
|Disabled|DoNotEnforce|string|Sí|No|El efecto de la directiva no se aplica al crear o actualizar recursos.|
## Aplicación de directivas y procedimientos recomendados para una implementación segura

Sin conocer los procedimientos recomendados ni realizar las pruebas adecuadas, aplicar un conjunto de directivas a un entorno existente que ejecuta cargas de trabajo de producción puede provocar comportamientos imprevistos en los recursos. Tratar las directivas como código (mantener sus definiciones en el control de código fuente y probar y validar cada cambio) permite automatizar las pruebas y evitar errores manuales. El marco de procedimientos recomendados se centra en reducir al mínimo el impacto de los cambios y garantizar el cumplimiento, y consta de dos aspectos:

- **Primer aspecto**: comenzar asignando las directivas nuevas con _enforcementMode_ Disabled. Al asignar directivas con acciones deny o modify, iniciar con _enforcementMode_ Disabled permite consultar el estado de cumplimiento y evaluar los resultados sin desencadenar acciones ni denegar operaciones. Este escenario «what-if» minimiza el impacto y ayuda a detectar problemas en las directivas nuevas o en los cambios sin interrumpir el entorno.

- **Segundo aspecto**: implementar las directivas por anillos. Para controlar posibles efectos negativos, las directivas deben implementarse gradualmente, primero en subconjuntos pequeños y luego en otros más grandes. Puedes empezar en entornos de prueba y desarrollo y pasar después a producción, aplicando inicialmente la directiva a un subconjunto reducido. Esta estrategia permite probarla a fondo. La ampliación gradual del ámbito mediante anillos puede cubrir todo el entorno de producción.

![[safe-deployment.png]]

Los pasos siguientes corresponden a los indicados en la captura anterior:

1. **Crear la definición**: empezar definiendo la directiva con el ámbito raíz (inquilino).

2. **Crear la asignación**: definir anillos de implementación (del 1 al 5) mediante selectores de recursos. Asignar la directiva a un ámbito específico (por ejemplo, un grupo de recursos, una suscripción o un grupo de administración) del anillo 5. Asignarla con _enforcementMode_ Disabled para evaluar el cumplimiento sin aplicar cambios.

3. a) **Comprobación del cumplimiento**: verificar que la directiva se aplique correctamente y que los recursos del anillo 5 alcancen el estado de cumplimiento deseado.

    b) **Comprobación del estado de la aplicación**: evaluar el impacto de la directiva en los recursos del anillo 5 y confirmar que no haya efectos secundarios imprevistos.

4. **Repetir en cada anillo (no producción)**: repetir el paso 3 en todos los anillos de los entornos que no son de producción.

5. **Actualizar la asignación (opcional)**: si es necesario, ajustar la definición o la asignación según la evaluación de los recursos del entorno que no es de producción y volver a asignarla a los recursos del anillo 5 con _enforcementMode_ Enabled.

6. a) **Comprobación del cumplimiento**: volver a evaluar el cumplimiento después de realizar los cambios (igual que en el paso 3a).

    b) **Comprobación del estado de la aplicación**: volver a confirmar que la directiva no esté causando problemas (igual que en el paso 3b).

7. **Repetir en cada anillo (no producción)**: repetir el paso 6 en todos los anillos de los entornos que no son de producción.

8. **Repetir en los anillos de producción**: después de validar la directiva en un entorno que no es de producción, implementarla gradualmente en los entornos de producción, empezando por un subconjunto pequeño (un anillo) y ampliando el ámbito con el tiempo.


For more detailed steps on the safe deployment of Azure Policy assignments with different effects, see [Safe deployment of Azure Policy assignments](https://learn.microsoft.com/en-us/azure/governance/policy/how-to/policy-safe-deployment-practices#steps-for-safe-deployment-of-azure-policy-assignments-with-deny-or-append-effects).

## Respuesta a los cambios de estado de las directivas

Los eventos de Azure Policy permiten que las aplicaciones reaccionen a los cambios de estado. Esta integración no requiere código complejo ni servicios de sondeo costosos e ineficientes. Los eventos de Azure Policy (el origen de eventos) se envían mediante Azure Event Grid a los controladores de eventos.

![[reacting-to-policy-changes.png]]

Azure Event Grid ofrece servicios de entrega confiables a las aplicaciones mediante directivas de reintento completas y entrega de mensajes no procesables. Event Grid enruta, filtra y distribuye los eventos correctamente a sus destinos mediante suscripciones de Event Grid. Para obtener más información, consulta [Azure Event Grid](https://learn.microsoft.com/en-us/azure/event-grid/).

El controlador de eventos es el destino al que se envía el evento. Se pueden configurar varios servicios para gestionarlos, como Microsoft Azure Functions, Microsoft Azure Logic Apps o un agente de escucha HTTP personalizado. También se puede usar cualquier webhook.

Para obtener más información, consulta [Controladores de eventos en Azure Event Grid](https://learn.microsoft.com/en-us/azure/event-grid/event-handlers), [Respuesta a eventos de cambio de estado de Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/event-overview?tabs=event-grid-event-schema) y el tutorial [Enrutamiento de eventos de cambio de estado de directivas a Event Grid con la CLI de Azure](https://learn.microsoft.com/en-us/azure/governance/policy/tutorials/route-state-change-events).

# Summary.

Azure Policy is a crucial component of the governance model in the Cloud Adoption Framework for Azure, which is designed to balance control and stability with speed and results. It helps you enforce organizational and regulatory standards and assess compliance at scale through built-in and custom policies and policy initiatives.

The module covered the hierarchical organization of Azure resources, policy operations in Greenfield and Brownfield scenarios, and the various components of policy definitions. You also delved into the evaluation and effects of policies, safe deployment practices, and integration with Event Grid for automated actions based on policy state changes. Key points included:

- Importance of careful policy design
- Testing to ensure effective governance without disrupting operations
- Logical operators and conditions in policy evaluation
- Supported effect types such as _disabled_, _modify_, _deny_, _audit_, _deployIfNotExists_, and _manual_

Additionally, the module emphasized starting with _enforcementMode_ deactivated for new policies to test their impact and then deploying policies in rings to gradually expand to production environments.

For more information, see the [Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/overview) documentation.