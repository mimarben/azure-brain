|Pregunta|Respuesta|
|---|---|
|¿Azure Load Balancer es Layer 7?|❌ No|
|¿Application Gateway es Layer 4?|❌ No|
|¿Front Door trabaja con HTTP/HTTPS?|✅ Sí|
|¿NSG inspecciona contenido HTTP?|❌ No|
|¿VPN Gateway trabaja en Capa 3?|✅ Sí|
|¿ExpressRoute trabaja con routing IP?|✅ Sí|

# 🌐 Modelo OSI y Servicios Azure.


| Capa OSI | Nombre          | Función Principal                               | Protocolos                   | Servicios Azure Relacionados                                                             |
| -------- | --------------- | ----------------------------------------------- | ---------------------------- | ---------------------------------------------------------------------------------------- |
| **7**    | Aplicación      | Interacción con aplicaciones y usuarios         | HTTP, HTTPS, DNS, SMTP, REST | Azure Front Door, Application Gateway (WAF), API Management, App Service, Azure DNS      |
| **6**    | Presentación    | Cifrado, compresión y formato de datos          | TLS, SSL                     | Azure Key Vault, TLS Certificates, SSL Offloading en Application Gateway, Front Door TLS |
| **5**    | Sesión          | Gestión y persistencia de sesiones              | RPC, NetBIOS                 | Session Affinity, Cookie-Based Affinity, Front Door Session Persistence                  |
| **4**    | Transporte      | Comunicación extremo a extremo mediante puertos | TCP, UDP                     | Azure Load Balancer, NSG, NAT Gateway, Azure Firewall                                    |
| **3**    | Red             | Direccionamiento IP y enrutamiento              | IP, ICMP, IPSec              | VNet, VNet Peering, Route Tables (UDR), VPN Gateway, ExpressRoute, Azure Firewall        |
| **2**    | Enlace de Datos | Comunicación mediante direcciones MAC           | Ethernet, ARP                | Network Interface (NIC), Accelerated Networking, Azure SDN Fabric                        |
| **1**    | Física          | Infraestructura física y transmisión            | Fibra, Cable                 |                                                                                          |
