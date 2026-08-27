---
title: Laboratorios AZ-104
tags: [certification, labs]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator
---

# Laboratorios AZ-104

Los labs oficiales de Microsoft (repo [MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator), carpeta `Instructions/Labs`) son la vía principal de práctica de AZ-104 — más necesarios aún que en AZ-900, porque las rutas de Learn son nivel principiante y el examen pide nivel operativo (ver sección *Gaps* del [roadmap](../../notes/AZ-104/roadmap.md)).

**Cómo trabajarlos**: a diferencia de los proyectos guiados de AZ-900 (sandbox gratuito), estos labs requieren **suscripción de Azure propia** — usan recursos reales (VMs, VNets, storage). Hazlos en tandas cortas y **destruye el entorno al terminar** (el propio lab lo indica) para no acumular coste. Cada lab completado → una subcarpeta aquí con qué se hizo, comandos usados y hallazgos; capturas en [`assets/`](../../assets/) si hacen falta.

Lista verificada contra el repo oficial el 26/08/2026 (el README del repo avisa de cambios de seguridad que afectan a algunos labs — revisarlo antes de empezar):

| Lab | Título (repo oficial) | Bloque | Módulos relacionados | Resultado |
|---|---|---|---|---|
| 01 | Manage Entra ID Identities | 1 | 03–04, 08 | — |
| 02a | Manage Subscriptions and RBAC | 1 | 07 | — |
| 02b | Manage Governance via Azure Policy | 1 | 06 | — |
| 03b | Manage Azure Resources by Using ARM Templates | 0 / 3 | 02 | — |
| 04 | Implement Virtual Networking | 4 | 18–19 | — |
| 05 | Implement Intersite Connectivity | 4 | 21 | — |
| 06 | Implement Network Traffic Management | 4 | 23–24 | — |
| 07 | Manage Azure Storage | 2 | 09–12 | — |
| 08 | Manage Virtual Machines | 3 | 13–14 | — |
| 09a | Implement Web Apps | 3 | 15–16 | — |
| 09b | Implement Azure Container Instances | 3 | 17 | — |
| 09c | Implement Azure Container Apps | 3 (gap) | 17 | — |
| 10 | Implement Data Protection | 5 | 11, 26–27 | — |
| 11 | Implement Monitoring | 5 | 28 | — |

Sin lab dedicado: Azure DNS (módulo 20), Network Watcher (25), Site Recovery y Bastion — práctica libre en sandbox siguiendo las docs oficiales.

## Relacionado

- [Índice de la certificación](../../certifications/AZ-104/INDEX.md)
- [Roadmap de estudio](../../notes/AZ-104/roadmap.md) — bloques y *gaps* que estos labs cubren
