---
title: AZ-700 — Diseño e implementación de soluciones de redes de Microsoft Azure
tags: [certification]
certification: [AZ-700]
updated: 2026-08-17
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-700
  - raw/savill-cert-materials/whiteboards/AZ-700-Whiteboard.png
---

# AZ-700: Diseño e implementación de soluciones de redes de Microsoft Azure

## Descripción

Certificación de ingeniero de redes Azure: infraestructura de red principal, conectividad híbrida, servicios de entrega de aplicaciones, acceso privado a servicios Azure y seguridad de redes. Optimiza rendimiento, resiliencia, escala y seguridad; identifica y resuelve problemas de conectividad.

## Objetivos

Experiencia creando y administrando recursos de cómputo, almacenamiento y redes en Azure, con base sólida en resolución de nombres, protocolos de red y gestión de direcciones.

## Habilidades medidas

*Vigente a 27 de julio de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Diseño e implementación de la infraestructura de red principal | 25-30% |
| Diseño, implementación y administración de servicios de conectividad | 20-25% |
| Diseño e implementación de servicios de entrega de aplicaciones | 15-20% |
| Diseño e implementación de acceso privado a servicios de Azure | 10-15% |
| Diseño e implementación de servicios de seguridad de red | 15-20% |

## Módulos

### Infraestructura de red principal (25-30%)

- [ ] **Direccionamiento IP**: espacios de direcciones y segmentación, creación de [[Azure Networking|VNet]], subredes para gateways/private endpoints/service endpoints/firewalls/App Gateway/Bastion, delegación de subred, IP pública (prefijo, BYOIP)
- [ ] **Resolución de nombres**: DNS en VNet, zonas DNS públicas y privadas, vinculación a VNet, Azure DNS Private Resolver
- [ ] **Conectividad y enrutamiento**: service chaining, [[Hub-Spoke|peering de VNet]], Azure Virtual Network Manager, UDR, tunneling forzado, Azure Route Server, Azure NAT Gateway
- [ ] **Supervisión de redes**: Network Watcher, Azure Monitor para redes, protección DDoS, recomendaciones de Defender for Cloud, Cloud Security Explorer

### Servicios de conectividad (20-25%)

- [ ] **VPN sitio a sitio**: SKU de gateway, VPN basada en directivas vs rutas, local network gateway, políticas IPsec/IKE, virtual network gateway, Azure Extended Network
- [ ] **VPN punto a sitio**: SKU de gateway, tipo de túnel, autenticación (RADIUS, Entra ID), archivo de configuración de cliente, VPN Always On
- [ ] **ExpressRoute**: modelo de conectividad, SKU/nivel, redundancia y DR, Global Reach/FastPath/ExpressRoute Direct, peering privado/Microsoft, gateway de ExpressRoute, cifrado, BFD
- [ ] **Virtual WAN**: SKU, arquitectura de hub virtual, unidad de escalado por tipo de gateway, enrutamiento de hub, integración con NVA de terceros

### Servicios de entrega de aplicaciones (15-20%)

- [ ] **Load Balancer y Traffic Manager**: SKU/nivel, público vs interno, regional vs cross-region, reglas de balanceo, reglas NAT/SNAT
- [ ] **Application Gateway**: escalado manual/automático, backend pools, health probes, listeners, reglas de enrutamiento, TLS, rule sets de reescritura
- [ ] **Azure Front Door**: nivel, enrutamiento/orígenes/endpoints, TLS end-to-end, caching, aceleración de tráfico, reglas de reescritura/redirección, Private Link como origen

### Acceso privado a servicios de Azure (10-15%)

- [ ] **Private Link y [[Private Endpoints]]**: planificación, creación, configuración de acceso, creación de Private Link service, integración con DNS
- [ ] **Service Endpoints**: cuándo usarlos, creación, directivas, configuración de acceso

### Seguridad de red (15-20%)

- [ ] **NSG/ASG**: creación y asociación, reglas entrantes/salientes, flow logs, IP flow verify, gestión remota (Bastion), Virtual Network Manager
- [ ] **Azure Firewall y Firewall Manager**: SKU, diseño de implementación, reglas, políticas, hub seguro en Virtual WAN
- [ ] **WAF**: modo detección/prevención, rule sets en Front Door y Application Gateway, políticas WAF

## Progreso

Estado: **no iniciado**.

Material de apoyo: [whiteboard de ámbito del examen](../../raw/savill-cert-materials/whiteboards/AZ-700-Whiteboard.png) de John Savill (MVP).

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-700/labs/`.

## Conceptos relacionados

- [[Azure Networking]]
- [[Hub-Spoke]]
- [[Private Endpoints]]

## Ejemplos

Ninguno todavía. Candidatos: script CLI de VNet peering, plantilla Bicep de Azure Firewall + hub seguro.
