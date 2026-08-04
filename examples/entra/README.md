# Ejemplo - Microsoft Entra ID con una aplicacion

Ejemplo practico para seguir un video sobre registro de una aplicacion en Microsoft Entra ID y su uso como proveedor de identidad para una app.

## Fuente

- Video / quickstart seguido: [Crear una aplicación Node.js en Azure App Service](https://learn.microsoft.com/es-es/azure/app-service/quickstart-nodejs?tabs=windows&pivots=development-environment-vscode)
- Documentacion base: [Configurar una aplicacion de App Service o Azure Functions para usar el inicio de sesion de Microsoft Entra](https://learn.microsoft.com/es-es/azure/app-service/scenario-secure-app-authentication-app-service?tabs=workforce-configuration)

## Objetivo

Registrar una aplicacion en Microsoft Entra ID, identificar los endpoints de autenticacion y dejar preparado el punto de integracion para una aplicacion web.

## Pasos

1. Entrar en [Microsoft Entra admin center](https://entra.microsoft.com/).
2. Abrir **Identity** > **Applications** > **App registrations**.
3. Seleccionar **New registration**.
4. Definir el nombre de la aplicacion.
5. Elegir el tipo de cuenta admitido segun el escenario del video.
6. Configurar la URI de redireccion si la aplicacion ya la requiere.
7. Crear el registro y copiar:
   - Application (client) ID
   - Directory (tenant) ID
   - Endpoints OAuth 2.0 / OpenID Connect
8. Revisar **Authentication** y anadir las plataformas o redirect URIs necesarias.
9. Revisar **API permissions** y conceder permisos solo si el escenario los necesita.
10. Validar el inicio de sesion desde la aplicacion.

## Datos que conviene guardar

| Dato | Donde aparece | Nota |
|---|---|---|
| Application (client) ID | Overview | Identifica la aplicacion cliente. |
| Directory (tenant) ID | Overview | Identifica el tenant de Entra ID. |
| Redirect URI | Authentication | Debe coincidir exactamente con la URL usada por la app. |
| Endpoint de autorizacion | Endpoints | Punto de inicio del flujo de login. |
| Endpoint de token | Endpoints | Punto usado para intercambiar codigo por token. |

## Notas del video

- 

## Comprobaciones

- [ ] La aplicacion aparece en **App registrations**.
- [ ] La Redirect URI coincide con la URL real de la app.
- [ ] El flujo de login redirige a Microsoft Entra ID.
- [ ] La app recibe respuesta despues de autenticarse.

## Relacionado

- [[Entra ID]]
- [[Managed Identities]]
- [[Azure RBAC]]
