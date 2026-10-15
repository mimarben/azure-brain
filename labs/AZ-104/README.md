# Laboratorios AZ-104

Índice y seguimiento de los laboratorios prácticos. Los **labs oficiales** viven en el clon local del repo [MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) (`raw/AZ-104T00/Instructions/Labs/`) — son la mejor forma de cubrir lo que las rutas de Learn dejan corto, y el examen real pregunta a nivel de portal/pasos/errores que solo se aprenden haciéndolos.

**Cómo usar la tabla:** marca `[x]` al completar el lab y anota la fecha y lo que te costó (errores, comandos que fallaron). El **método recomendado** (Fase 1 del [plan de reintento](../../notes/AZ-104/plan-reintento.md)) es *predicción-primero*: antes de cada tarea, escribe qué esperas ver; luego ejecútala y anota la diferencia.

**Prioridad actual (tras el suspenso del 08/10/2026):** 🔴 04 · 05 · 06 · 08 · 11 (redes y disponibilidad) → 🟡 07 · 10 → ⚪ resto.

## Labs oficiales (AZ-104T00)

| Estado | Lab | Área | Material propio |
|---|---|---|---|
| 🔴 [ ] | [01 — Manage Entra ID Identities](../../raw/AZ-104T00/Instructions/Labs/LAB_01-Manage_Entra_ID_Identities.md) | Identidad | — |
| 🟡 [ ] | [02a — Manage Subscriptions and RBAC](../../raw/AZ-104T00/Instructions/Labs/LAB_02a_Manage_Subscriptions_and_RBAC_Entra.md) | Gobernanza | [RBAC/Role.md](RBAC/Role.md) |
| 🟡 [ ] | [02b — Manage Governance via Azure Policy](../../raw/AZ-104T00/Instructions/Labs/LAB_02b-Manage_Governance_via_Azure_Policy.md) | Gobernanza | — |
| ⚪ [ ] | [03b — Manage Azure Resources by Using ARM Templates](../../raw/AZ-104T00/Instructions/Labs/LAB_03b-Manage_Azure_Resources_by_Using_ARM_Templates.md) | ARM | [arm-templates/](arm-templates/) · [parameters/](arm-templates/parameters/README.md) |
| 🔴 [ ] | [04 — Implement Virtual Networking](../../raw/AZ-104T00/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md) | Redes | [network/Implementación de redes virtuales..md](network/Implementación%20de%20redes%20virtuales..md) |
| 🔴 [ ] | [05 — Implement Intersite Connectivity](../../raw/AZ-104T00/Instructions/Labs/LAB_05-Implement_Intersite_Connectivity.md) | Redes | [dns/Lab 05 - Implement Intersite Connectivity..md](dns/Lab%2005%20-%20Implement%20Intersite%20Connectivity..md) |
| 🔴 [ ] | [06 — Implement Network Traffic Management](../../raw/AZ-104T00/Instructions/Labs/LAB_06-Implement_Network_Traffic_Management.md) | Redes (LB/AppGW) | **sin material — gap clave** |
| 🟡 [ ] | [07 — Manage Azure Storage](../../raw/AZ-104T00/Instructions/Labs/LAB_07-Manage_Azure_Storage.md) | Almacenamiento | [Blob-Storage/alamcenamiento-publico.md](Blob-Storage/alamcenamiento-publico.md) |
| 🔴 [ ] | [08 — Manage Virtual Machines](../../raw/AZ-104T00/Instructions/Labs/LAB_08-Manage_Virtual_Machines.md) | Cómputo (zonas/sets) | [VM/Creación de una VM..md](VM/Creación%20de%20una%20VM..md) · [create-vm.md](create-vm.md) |
| ⚪ [ ] | [09a — Implement Web Apps](../../raw/AZ-104T00/Instructions/Labs/LAB_09a-Implement_Web_Apps.md) | Cómputo (App Service) | [app-service/Lab09a-Implement-Web-Apps.md](app-service/Lab09a-Implement-Web-Apps.md) |
| ⚪ [ ] | [09b — Implement Azure Container Instances](../../raw/AZ-104T00/Instructions/Labs/LAB_09b-Implement_Azure_Container_Instances.md) | Cómputo (ACI) | [containers/Contenedor.md](containers/Contenedor.md) |
| ⚪ [ ] | [09c — Implement Azure Container Apps](../../raw/AZ-104T00/Instructions/Labs/LAB_09c-Implement-Azure-Container-Apps.md) | Cómputo (Container Apps) | — |
| 🟡 [ ] | [10 — Implement Data Protection](../../raw/AZ-104T00/Instructions/Labs/LAB_10-Implement_Data_Protection.md) | Backup | — |
| 🔴 [ ] | [11 — Implement Monitoring](../../raw/AZ-104T00/Instructions/Labs/LAB_11-Implement_Monitoring.md) | Supervisión | — |

🔴 prioridad alta (plan de reintento) · 🟡 media · ⚪ normal.

## Material propio fuera de los labs oficiales

- [network/](network/) — NVA, rutas personalizadas (UDR), enrutamiento: [Creación de rutas personalizadas.md](network/Creación%20de%20rutas%20personalizadas.md) · [Creación de una NVA..md](network/Creación%20de%20una%20NVA..md) · [Enrutamiento NVA..md](network/Enrutamiento%20NVA..md) · [Create and configure network..md](network/Create%20and%20configure%20network..md)
- [SSPR.md](SSPR.md) — restablecimiento de contraseñas
- [MicrosoftAzureAdministrator/](MicrosoftAzureAdministrator/) — notas del curso oficial

## Registro de sesiones

| Fecha | Lab | Resultado / notas |
|---|---|---|
| — | — | _vacío — anota cada sesión de laboratorio_ |
