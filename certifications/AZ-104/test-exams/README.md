---
title: AZ-104 — Simulacros de examen
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-06
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacros de examen AZ-104

Cinco exámenes de práctica **originales** construidos sobre la [guía oficial de estudio](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104) y el material de `raw/` (curso AZ-104T00). Reproducen el formato, los tipos de pregunta y los pesos del examen real. Los ítems reales están protegidos por NDA — estos son preguntas nuevas al estilo del examen, no dumps.

## Cómo simular

| Regla | Detalle |
|---|---|
| ⏱ Tiempo | 100 minutos por examen (el real ronda esa cifra para 40–60 preguntas — verifica la duración actual en la [página del examen](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/) antes de programarlo) |
| ✍️ Marcado | Marca tu respuesta con una **x** en los corchetes de la opción (`[ ]` → `[x]`); en las series Sí/No tica **una sola** columna (Sí o No); en las de ordenar escribe las letras de la secuencia |
| 📕 Material | Libro cerrado: sin notas, sin portal, sin documentación |
| 📊 Puntuación | 1 punto por ítem. Aprobado ≥ 70 % (equivalente al 700/1000 con escala del real) |
| ✅ Multi-selección | Todo-o-nada: debe coincidir el conjunto exacto de respuestas |
| 🔢 Series Sí/No | Cada serie son **3 ítems puntuables** (3 puntos) |
| 🧩 Caso práctico | Solo en el examen 3: lee el caso antes de sus preguntas y vuelve a él cuantas veces quieras (permitido en el real) |

## Formatos de pregunta (como el examen real)

- **Opción múltiple** — una respuesta.
- **Selección múltiple** — "elige dos/tres", todo-o-nada.
- **Serie Sí/No** — "para cada afirmación, selecciona Sí si es verdadera; en caso contrario, No".
- **Ordenar** — poner los pasos en la secuencia correcta (drag-and-drop en el real; aquí escribe el orden).
- **Caso práctico con escenario** — fondo + requisitos + preguntas que los cruzan.
- **Exhibits** — fragmentos de JSON, CLI o KQL sobre los que se pregunta.

## Los exámenes

| Examen | Nivel | Ítems | Enfoque |
|---|---|---|---|
| [Simulacro 1](examen-1-basico.md) | Básico | 40 | Recordatorio directo de conceptos y configuraciones fundamentales |
| [Simulacro 2](examen-2-intermedio.md) | Intermedio | 40 | Escenarios aplicados: "necesitas X, ¿qué haces?", menor privilegio, coste |
| [Simulacro 3](examen-3-avanzado.md) | Avanzado | 40 | Incluye caso práctico, exhibits y trampas de redacto — nivel real o superior |
| [Simulacro 4](examen-4-mixto.md) | Mixto estilo real | 40 | Dificultad mezclada sin avisar; temario calibrado con fuentes externas (Tutorials Dojo, repos de práctica) — preguntas originales |
| [Simulacro 5](examen-5-avanzado.md) | Avanzado | 50 | 120 minutos. Gotchas de mecanismo y exhibits; 4 series Sí/No y caso práctico; refuerza los puntos débiles detectados (supervisión, Storage avanzado, identidad) |

Soluciones (no abrir hasta terminar): [1](examen-1-soluciones.md) · [2](examen-2-soluciones.md) · [3](examen-3-soluciones.md) · [4](examen-4-soluciones.md) · [5](examen-5-soluciones.md).

Repaso acumulado: [Examen de fallos (108 preguntas)](examen-repaso-fallos.md). Reúne preguntas falladas de los assessments online 1–6 y de los simulacros 1–3; las respuestas están plegadas.

Lista compacta de fallos: [Respuestas incorrectas de assessments online 1–8](respuestas-incorrectas-exam-online-1-8.md). Incluye únicamente las opciones marcadas como incorrectas y la explicación de cada error.

## Flujo recomendado

1. Haz el simulacro en condiciones reales (cronómetro, libro cerrado), marcando tus respuestas con `[x]`.
2. Corrige con la hoja de soluciones (cada explicación enlaza la página de `knowledge/` correspondiente) — o pide en la sesión de Claude **«corrige el examen N»**: se leerán tus marcas y se puntuará contra la solución, con desglose por dominio.
3. Apunta la nota y los dominios débiles en la tabla de autoevaluación de la solución.
4. Repasa las páginas enlazadas de los fallos y actualiza el [roadmap](../../../notes/AZ-104/roadmap.md).
5. Repite el examen días después para verificar consolidación.

Objetivo antes del examen real: aprobar el simulacro 3 con margen y después la [evaluación de práctica oficial gratuita](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21).

## Relacionado

- [AZ-104 — Índice de certificación](../INDEX.md)
- [Roadmap de estudio](../../../notes/AZ-104/roadmap.md)
- [Chuleta de identidad y gobernanza](../../../cheatsheets/az-104-identity-governance.md) · [compute](../../../cheatsheets/az-104-compute.md) · [storage](../../../cheatsheets/az-104-storage.md)
