---
title: ARM Templates
aliases: [ARM Templates, ARM templates, Azure Resource Manager templates]
tags: [devops, iac]
certification: [AZ-104, AZ-400, AZ-305]
updated: 2026-07-31
sources:
  - https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/
---

# ARM Templates

> Página pendiente de contenido completo. Las plantillas JSON de Azure Resource Manager (ARM) definen de forma declarativa la infraestructura que se despliega en Azure; **Bicep** es su sucesor y se transpila a ARM. Stub creado al iniciar el estudio del módulo [Author Azure Resource Manager templates by using VS Code](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/) (refuerzo del gap ARM/Bicep de AZ-104, Bloque 3).
>
> Pendiente de cubrir: estructura (`parameters`, `variables`, `resources`, `outputs`, `functions`) · despliegue con `az deployment group create` / portal / [[Azure Cloud Shell]] · plantillas anidadas y *linked templates* · `what-if` · export de un recurso existente a plantilla · relación con Bicep (transpilación ARM ↔ Bicep).


## Requisitos previos

- Tener conocimientos de Azure, incluidos Azure Portal, las suscripciones, los grupos de recursos y las definiciones de recursos
- Una cuenta de Azure. Puede obtener una cuenta gratuita [aquí.](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_452be339-1a86-302b-60f7-30bce78ca8a2)
- [Visual Studio Code](https://code.visualstudio.com/?azure-portal=true) instalado localmente
- Tener instaladas localmente una de las siguientes:
    - Las herramientas más recientes de la [CLI de Azure](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli?azure-portal=true) instaladas localmente
    - La versión más reciente de [Azure PowerShell](https://learn.microsoft.com/es-es/powershell/azure/install-az-ps?azure-portal=true) instalada localmente
    - 
![[Screenshot From 2026-07-31 13-10-13.png]]


# Introducción.
Las plantillas json de Azure Resource Manager (plantillas de ARM) permiten especificar la infraestructura del proyecto de forma declarativa y reutilizable. Puede crear versiones y guardar las plantillas en el mismo control de código fuente que el proyecto de desarrollo.

> [!NOTE] Title
> Bicep es un lenguaje para la definición de recursos de Azure. Ofrece una experiencia de creación más sencilla que JSON, junto con otras características que ayudan a mejorar la calidad de la infraestructura como código. Se recomienda que cualquier usuario nuevo en la infraestructura como código en Azure utilice Bicep en lugar de JSON. Para más información sobre Bicep, consulte la ruta de aprendizaje [Aspectos básicos de Bicep](https://learn.microsoft.com/es-es/training/paths/fundamentals-bicep/).

## ¿Qué es la infraestructura como código?

La _infraestructura como código_ le permite describir, mediante código, la infraestructura que necesita para la aplicación.

Con la infraestructura como código, puede mantener en un repositorio de código central el código de la aplicación y todo lo que necesita para implementarla. Las ventajas de la infraestructura como código son las siguientes:

- Configuraciones coherentes
- Escalabilidad mejorada
- Implementaciones más rápidas
- Mejor rastreabilidad

## ¿Qué es una plantilla de ARM?

Las plantillas de ARM son archivos de notación de objetos JavaScript (JSON) que definen la infraestructura y la configuración de la implementación. La plantilla usa una _sintaxis declarativa_. La sintaxis declarativa es una forma de crear la estructura y los elementos que describen el aspecto que tienen los recursos sin describir el flujo de control. La sintaxis declarativa es diferente de la _sintaxis imperativa_, en la que se usan comandos que el equipo debe ejecutar. El scripting imperativo se centra en especificar cada paso de la implementación de los recursos.

Las plantillas de ARM le permiten declarar lo que piensa implementar sin tener que escribir la secuencia de comandos de programación para crearlo. En una plantilla de ARM, se especifican los recursos y las propiedades de esos recursos. Después, [Azure Resource Manager](https://learn.microsoft.com/es-es/azure/azure-resource-manager/management/overview) usa esa información para implementar los recursos de forma organizada y coherente.

### Estructura de los archivos de plantilla de ARM

Al escribir una plantilla de ARM, debe comprender todos los elementos que la componen y lo que hacen. Los archivos de plantilla de ARM se componen de los elementos siguientes:

|Elemento|Descripción|
|---|---|
|**esquema**|una sección obligatoria en la que se define la ubicación del archivo de esquema JSON que describe la estructura de los datos JSON. El número de versión que use dependerá del ámbito de la implementación y del editor de JSON.|
|**Versión de contenido**|una sección obligatoria en la que se define la versión de la plantilla (por ejemplo, 1.0.0.0). Puede usar este valor para documentar los cambios importantes en la plantilla y asegurarse de que implementa la plantilla correcta.|
|**apiProfile**|una sección opcional en la que se define una colección de versiones de API para los tipos de recurso. Puede usar este valor para evitar tener que especificar las versiones de API para cada recurso de la plantilla.|
|**Parámetros**|una sección opcional en la que se definen los valores que se proporcionan durante la implementación. Puede proporcionar estos valores en un archivo de parámetros, mediante parámetros de línea de comandos o en Azure Portal.|
|**variables**|una sección opcional en la que se definen los valores que se usan para simplificar las expresiones de lenguaje de plantilla.|
|**Funciones**|una sección opcional en la que se pueden definir [funciones definidas por el usuario](https://learn.microsoft.com/es-es/azure/azure-resource-manager/templates/template-user-defined-functions) que están disponibles dentro de la plantilla. Las funciones definidas por el usuario pueden simplificar la plantilla cuando se usan repetidamente expresiones complicadas en la plantilla.|
|**recursos**|una sección obligatoria en la que se definen los elementos reales que quiere implementar o actualizar en un grupo de recursos o una suscripción.|
|**salida**|Sección opcional en la que se especifican los valores que se devuelven al final de la implementación.|
## Relacionado

- [[Terraform vs Bicep]]
- [[Azure Cloud Shell]]
