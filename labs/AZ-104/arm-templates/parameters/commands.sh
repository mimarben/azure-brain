# Lab AZ-104 · ARM JSON con parámetros y salidas
# Sigue la unidad 4: https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/4-add-flexibility-arm-template?tabs=azure-cli
# Ruta: labs/AZ-104/arm-templates/parameters/

az login

# 1. Grupo de recursos (mismo nombre que el resto del lab) y default para la sesión
az group create --name rg-arm-template --location northeurope
az configure --defaults group=rg-arm-template

# 2. (unidad 4, CLI) Despliegue con parámetros inline — "Opción 1" del curso
#    La unidad 4 solo parametriza storageAccountType (el nombre va hardcodeado en
#    learntemplatestorage123); esta plantilla también parametriza el nombre
templateFile="azuredeploy.json"
az deployment group create \
  --name testdeployment1 \
  --template-file $templateFile \
  --parameters storageAccountName=learntemplatestorage123 storageAccountType=Standard_LRS

# 3. ("Opción 2") Misma plantilla con fichero de parámetros
az deployment group create \
  --resource-group rg-arm-template \
  --template-file azuredeploy.json \
  --parameters @dev.parameters.json

# 3b. Otro entorno: solo cambia el fichero (SKU GRS en prod)
az deployment group create \
  --resource-group rg-arm-template \
  --template-file azuredeploy.json \
  --parameters @prod.parameters.json

# 4. Vista previa sin desplegar: qué crearía/cambiaría
az deployment group what-if \
  --resource-group rg-arm-template \
  --template-file azuredeploy.json \
  --parameters @dev.parameters.json

# 5. La salida de la unidad 4: output storageEndpoint con reference()
az deployment group show \
  --resource-group rg-arm-template \
  --name testdeployment1 \
  --query "properties.outputs"

# 6. Inspección y limpieza (¡destruye el entorno para no acumular coste!)
az deployment group list --resource-group rg-arm-template --output table
az group delete --name rg-arm-template --yes --no-wait
