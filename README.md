Juego programado en lenguaje Ruby de forma estructurada (desconocía en ese entonces la Programación Orientada a Objetos).


*** Esconde tus Zanahorias ***

Simpático juego de texto programado en Ruby que tiene como objetivo atrapar a los conejos escondidos, antes que ellos se coman tus zanahorias.
Para jugarlo por la consola, idealmente a pantalla completa

Objetivo del juego:
Atrapar a los conejos (la cpu) antes que ellos atrapen tus zanahorias. Dos de ellos se han escondido en tu campo y atacarán por turno. Debes adivinar su ubicación antes que ellos adivinen las ubicaciones de tus zanahorias ingresando las coordenadas de los terrenos.

Lógica del programa:
La cpu elige 2 ubicaciones donde esconderse de forma aleatoria, de un array ya definido (terreno). Si detecta que ha elegido dos ubicaciones iguales, itera nuevamente. Estas ubicaciones las guarda en un array llamado (ubicaciones_cpu)

El jugador ingresa manualmente los terrenos en un array llamado (ubicaciones_jugador).Si detecta que la ubicación no está incluida en el array definido (terreno) o son iguales, vuelve a iterar.

El ataque: el sistema compara la elección del jugador vs la ubicación del cpu usando (array.include?(elección)). Si detecta que está incluido, toma ese dato y lo borra de la ubicación, dejando el array de ubicación con un elemento menos. Cuando el array de ubicación queda en cero, gana el oponente. 
De la misma forma, desde el punto de vista de la cpu, ubicación la elige aleatoriamente. Para evitar que repita las mismas elecciones, cada elección se guarda en un array llamado (recuerdo_cpu). Si encuentra un valor incluido allí (repetido), volverá a elegir aleatoriamente.

Programado y Creado por Carlos Toledo - 07 de agosto del 2022
