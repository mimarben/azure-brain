Tienes una topología hub-and-spoke. Un VPN Gateway está en la VNet hub y los spokes deben llegar a la red on-premises a través de él. ¿Qué configuración de peering es correcta?

'Allow forwarded traffic' en ambos lados y nada más

**Hub→spoke: 'Allow gateway transit'; spoke→hub: 'Use remote gateways'Correct**

Hub→spoke: 'Use remote gateways'; spoke→hub: 'Allow gateway transit'Incorrect

'Allow gateway transit' en ambos lados

Not quite. The correct answer is Hub→spoke: 'Allow gateway transit'; spoke→hub: 'Use remote gateways'.La VNet que contiene el gateway (hub) habilita 'Allow gateway transit' en su peering hacia el spoke, y el spoke habilita 'Use remote gateways' en su peering hacia el hub. Solo se puede usar un gateway remoto si el spoke no tiene su propio gateway.



Una NIC de una VM tiene un NSG con la regla 'Allow TCP 443 desde Internet' con prioridad 100. La subred de esa VM tiene otro NSG con 'Deny TCP 443 desde Internet' con prioridad 200. Un cliente en Internet intenta conectar por 443 a la IP pública de la VM. ¿Qué ocurre?

Se permite solo si hay un Load Balancer delante

Se permite, porque el NSG de la NIC sobrescribe al de la subred

Se permite, porque la prioridad 100 gana a la 200Incorrect

**Se bloquea, porque el tráfico entrante se evalúa primero en el NSG de la subred y se deniega allíCorrect**

Not quite. The correct answer is Se bloquea, porque el tráfico entrante se evalúa primero en el NSG de la subred y se deniega allí.Para tráfico entrante se evalúa primero el NSG de la subred y después el de la NIC; ambos deben permitir el tráfico. Las prioridades solo comparan reglas dentro del mismo NSG. Para tráfico saliente el orden es el inverso (NIC y luego subred).




Un grupo de recursos contiene una VM, un disco y una cuenta de almacenamiento. Despliegas una plantilla ARM en modo Complete sobre ese grupo; la plantilla solo define la cuenta de almacenamiento. ¿Cuál es el resultado?

**Se actualiza la cuenta de almacenamiento y se eliminan la VM y el discoCorrect**

Se actualiza la cuenta de almacenamiento y los otros recursos no cambian

El despliegue falla porque faltan recursos en la plantilla

Se crea una segunda cuenta de almacenamientoIncorrect

Not quite. The correct answer is Se actualiza la cuenta de almacenamiento y se eliminan la VM y el disco.En modo Complete, Resource Manager elimina los recursos del grupo que no están en la plantilla. En modo Incremental (el predeterminado) los deja intactos. Conviene usar What-If antes de un despliegue Complete.