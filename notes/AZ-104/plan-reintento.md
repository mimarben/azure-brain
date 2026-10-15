---
title: AZ-104 — Plan de reintento
tags: [certification, roadmap, exam-review]
certification: [AZ-104]
updated: 2026-10-15
sources:
  - https://learn.microsoft.com/en-us/credentials/support/retake-policy
  - certifications/AZ-104/test-exams/repaso-factores-fallo.md
  - certifications/AZ-104/test-exams/respuestas-incorrectas-exam-online-1-8.md
---

# Plan de reintento — AZ-104

Resultado del **08/10/2026: 531/1000 (corte 700)**. Percepción del examen: preguntas más difíciles que los simulacros, con mucho peso de **escenarios de redes** y de **VM/zonas de disponibilidad**, casi todas aplicadas ("ejemplo práctico"). Este plan convierte ese diagnóstico en fases con **puertas de salida medibles** — no se reserva el reintento hasta cumplirlas.

## Diagnóstico — lo que ya decía el repo

| Evidencia | Dato | Lectura |
|---|---|---|
| Notas de simulacros | sim 1: 80 % · sim 2: 57,5 % · sim 3: **42,5 %** · sim 5: 84 % | Se aprobó lo que mide memoria y se suspendió lo que mide aplicación. El objetivo propio ("aprobar el sim 3 con margen") no se cumplió |
| Factores de fallo | De 118 fallos: **29 de redes** (rutas/VPN/DNS 10 · LB/AppGW 8 · Network Watcher 6 · NSG 5) + **10 de VMs disponibilidad/SLA** | Un tercio de los errores históricos estaban en justo lo que el examen real preguntó |
| Bucle de memorización | La pregunta de SAS fallada **4 veces en 4 assessments distintos** | Repetir bancos de preguntas mide reconocimiento, no conocimiento — falsa confianza |
| Recursos gratuitos sin usar | Evaluación de práctica oficial, Study Cram v2, vídeo `aka.ms/AZ104-ExamPrep` — checkboxes sin marcar | Se llegó al examen sin pasar por la única prueba calibrada con la dificultad real |
| Labs | Sin tabla de seguimiento (enlace roto); sin rastro de los labs 06, 08, 10, 11 | Las preguntas "prácticas" (portal, orden de pasos, errores) se responden con memoria de laboratorio |
| Stubs pendientes | [Private Endpoints](../../knowledge/private-endpoints.md) y [Hub-Spoke](../../knowledge/hub-spoke.md) sin contenido | Dos temas estrella de escenario de red, señalados como gap antes del examen |

## Puertas de salida (criterio para reservar el reintento)

- [ ] **P0** · Desglose por áreas del score report oficial extraído y anotado abajo (valida el diagnóstico)
- [ ] **P1** · Labs oficiales **04, 05, 06, 08 y 11** hechos y anotados en [labs/AZ-104/README.md](../../labs/AZ-104/README.md)
- [ ] **P2** · Stubs cerrados — [Private Endpoints](../../knowledge/private-endpoints.md) y [Hub-Spoke](../../knowledge/hub-spoke.md) ✅ (15/10/2026) · [Disponibilidad de VMs](../../knowledge/az104-vm-availability.md) repasada con las mates de FD/UD y SLA
- [ ] **P3** · [Evaluación de práctica oficial](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21) superada + [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k) visto
- [ ] **P4** · [Simulacro 6 — escenarios](../../certifications/AZ-104/test-exams/examen-6-escenarios.md) **≥ 80 %** y repetición del [simulacro 3](../../certifications/AZ-104/test-exams/examen-3-avanzado.md) (ya conocido) **≥ 75 %**

**Regla:** la fecha de reserva se decide al cumplir P4, no al revés. Suspender el simulacro 6 = seguir en Fase 1–2.

## Fase 0 — hoy: el desglose oficial

El score report (email de rechazo y perfil de [Microsoft Learn credentials](https://learn.microsoft.com/credentials)) incluye **barras por área de habilidades**. Copiar aquí el nivel de cada una y repriorizar las fases si difiere de "redes + cómputo":

| Área | Nivel del report | Prioridad |
|---|---|---|
| Identidades y gobernanza (20–25 %) | _pendiente_ | — |
| Almacenamiento (15–20 %) | _pendiente_ | — |
| Procesos (20–25 %) | _alta (previsiblemente)_ | ⚠ |
| Redes virtuales (15–20 %) | _alta (previsiblemente)_ | ⚠ |
| Supervisión (10–15 %) | _pendiente_ | — |

## Fase 1 — labs oficiales de las áreas débiles

En una suscripción real, método **predicción-primero**: antes de cada tarea, escribe qué esperas ver; luego ejecútalo y anota la diferencia. Es lo que convierte "¿qué hago primero?" en algo vivido.

- [ ] [Lab 04 — Implement Virtual Networking](../../raw/AZ-104T00/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md) (VNets, subnets, peering)
- [ ] [Lab 05 — Implement Intersite Connectivity](../../raw/AZ-104T00/Instructions/Labs/LAB_05-Implement_Intersite_Connectivity.md) (VPN S2S, gateway transit)
- [ ] [Lab 06 — Implement Network Traffic Management](../../raw/AZ-104T00/Instructions/Labs/LAB_06-Implement_Network_Traffic_Management.md) (LB, App Gateway, routing)
- [ ] [Lab 08 — Manage Virtual Machines](../../raw/AZ-104T00/Instructions/Labs/LAB_08-Manage_Virtual_Machines.md) (availability sets/zonas, discos, extensiones)
- [ ] [Lab 11 — Implement Monitoring](../../raw/AZ-104T00/Instructions/Labs/LAB_11-Implement_Monitoring.md) (alertas, Log Analytics)
- [ ] Si da tiempo: Lab 07 (Storage) y Lab 10 (Data Protection) — segundo pase de las áreas medias

## Fase 2 — cerrar gaps de conocimiento

- [x] [Private Endpoints](../../knowledge/private-endpoints.md) — completo (15/10/2026), incluye tabla de decisión service endpoint vs private endpoint
- [x] [Hub-Spoke](../../knowledge/hub-spoke.md) — completo (15/10/2026), incluye gateway transit y trampas de examen
- [ ] Repasar [Disponibilidad de VMs](../../knowledge/az104-vm-availability.md): mates de FD/UD (⌈N/UD⌉ mantenimiento, N/FD bastidor), SLA 99,9/99,95/99,99, zonas vs conjuntos vs VMSS cross-zone
- [ ] Repasar [Load Balancer](../../knowledge/az104-load-balancer.md): persistencia, sondeo, regla de salida/NAT gateway, SKU coincidente
- [ ] Repasar [NSG](../../knowledge/az104-network-security-groups.md): intersección subred+NIC, ASGs, etiquetas de servicio

## Fase 3 — cambiar el tipo de práctica

**Regla anti-bucle:** (1) nunca repetir un test para "medirte" — solo para verificar consolidación con ≥1 semana de separación; (2) en cada fallo, escribir por qué cada opción incorrecta es incorrecta; (3) los bancos tipo dump (certlibrary, examtopics) solo como lectura puntual de redactados, nunca como métrica de preparación.

- [ ] [Evaluación de práctica oficial gratuita](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21) (la única calibrada con el examen real) — superarla y repasar donde falle
- [ ] Banco legítimo de nivel escenario (p. ej. Tutorials Dojo AZ-104, ~15 €) — preguntas originales con explicaciones
- [ ] [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k) de Savill (~4 h) como repaso global
- [ ] [Vídeo de preparación del examen](https://aka.ms/AZ104-ExamPrep) (estrategia de examen, 1–2 semanas antes)

## Fase 4 — verificación final

- [ ] [Simulacro 6 — escenarios de redes y cómputo](../../certifications/AZ-104/test-exams/examen-6-escenarios.md) en condiciones reales → **≥ 80 %**
- [ ] Repetir el [simulacro 3](../../certifications/AZ-104/test-exams/examen-3-avanzado.md) (ya visto — aquí sí vale repetir) → **≥ 75 %**
- [ ] Repasar el [relámpago final](../../certifications/AZ-104/test-exams/repaso-factores-fallo.md#relámpago-final) la víspera
- [ ] Reservar el reintento solo con las dos puertas anteriores en verde

## Política de reintento (verificada 15/10/2026)

- **Sin retake gratis**: cada intento se paga entero (~152 € en España).
- **Primer reintento**: esperan 24 h tras el suspenso antes de poder reservarlo; **intentos posteriores**: 14 días entre ellos; máx. **5 intentos/año**.
- Fuente: [Exam and Applied Skills assessment lab retake policies](https://learn.microsoft.com/en-us/credentials/support/retake-policy).
- La certificación se renueva después gratis (evaluación online cada 12 meses) — el coste duro está en los intentos de examen.

## Relacionado

- [Índice AZ-104](../../certifications/AZ-104/INDEX.md)
- [Roadmap de estudio](roadmap.md)
- [Simulacros de examen](../../certifications/AZ-104/test-exams/README.md)
- [Repaso por factores de fallo](../../certifications/AZ-104/test-exams/repaso-factores-fallo.md)
- [Seguimiento de labs](../../labs/AZ-104/README.md)
