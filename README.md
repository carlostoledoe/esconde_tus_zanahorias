*** Esconde tus Zanahorias ***

Simpático juego de texto programado en Ruby que tiene como objetivo atrapar a los conejos escondidos, antes que ellos se coman tus zanahorias.

Para jugarlo por la consola, idealmente a pantalla completa

Objetivo del juego:
Atrapar a los conejos (la cpu) antes que ellos atrapen tus zanahorias. 
Cada uno tiene 2 vidas (2 conejos y 2 zanahorias).
El jugador esconde sus zanahorias en el terreno y los conejos se esconden también allí.
El jugador intenta atrapar a los conejos escribiendo una ubicación en el terreno y si hay un conjeno allí, es atrapado y descuenta un conejo. Siguiente, los conejos intentan buscar una zanahoria en el terreno de forma aleatoria. Si la encuentra, te descuenta una zanahora. Gana quien deje al oponente en cero.


Logica del programa:
La cpu elige 2 ubicaciones donde esconderse de forma aleatoria, de un array ya definido (terreno). Si detecta que ha sacado dos iguales, itera nuevamente. Estas ubicaciones las guarda en un array llamado (ubicaciones_cpu)

El jugador ingresa manualmente los terrenos en un array llamado (ubicaciones_jugador).Si detecta que la ubicación no está incluida en el array definido (terreno), vuelve a iterar, de la misma forma, si son iguales.

El ataque: el sistema compara la elección del jugador vs la ubicación del cpu usando (array.include?(elección)). Si detecta que está incluido, toma ese dato y lo borra de la ubicación, dejando el array de ubicación con un elemento menos. Cuando el array de ubicación queda en cero, gana el oponte. 
De la misma forma, desde el punto de vista de la cpu, a diferencia que la ubicación la elige aleatoriamente. Para evitar que repita las mismas elecciones, cada elección se guarda en un array llamado (recuerdo_cpu). Si encuentra un valor incluido allí (repetido), volverá a elegir aleatoreamente.

Programado y Creado por Carlos Toledo - 07 de agosto del 20022
