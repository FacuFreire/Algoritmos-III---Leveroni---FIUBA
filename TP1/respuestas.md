# Preguntas

## Pregunta 1

El mensaje estaHerido está implementado de la siguiente manera:

`estaHerido --> (20*pv > puntosDeVida and: [0*pv < puntosDeVida]) ifTrue:[^true] ifFalse:[^false]`

Se chequean los puntos de vida de los combatientes. Es decir, si los puntos de vida son menores a 20 y mayores a 0, el combatiente reciibió daño, por lo tanto está herido.

Mientras que el mensaje noEstaHerido está implementado como se muestra a continuación:

`noEstaHerido (20\*pv = puntosDeVida) ifTrue:[^true] ifFalse:[^false] `

En este mensaje se chequea si los puntos de vida son igual a 20. De esta manera, se comprueba si el combatiente no recibió daño.
Se podría usar un solo mensaje, por ejemplo, estaHerido. Y para corroborar si no está herido, como devuelve un objeto booleano, se podría negar el resultado y así implementar un solo mensaje.

## Pregunta 2

Al tener 3 tests para el mismo comportamiento pero aplicado a cada uno de los combatientes, se está repitiendo código, cuando en realidad esto no debería ser necesario y se podría utilizar un solo test.

## Pregunta 3

Para modelar desarrollar un combate se implementó de la siguiente manera:

`desarrollarDuranteRondas: numeroDeRondas

    |bando1 bando2|
    bando1 := OrquestadorDeCombatesTest listaBandoUno.
    bando2 := OrquestadorDeCombatesTest listaBandoDos.

    1 to: numeroDeRondas do: [:indice |

    	bando1 do: [:combatienteBando1 | combatienteBando1 atacar.].
    	bando2 do: [:combatienteBando2 | combatienteBando2 atacar.].
    	bando1 := bando1 select:  [:combatiente | 0*pv < combatiente puntosDeVida].
    	bando2 := bando2 select:  [:combatiente | 0*pv < combatiente puntosDeVida].
    	(bando1 size = 0) ifTrue:[^ 'Ganó el bando 2'].
    	(bando2 size = 0) ifTrue:[^ 'Ganó el bando 1'].

    	].

    ^ 'No ganó nadie'

`

El resultado fue modelado a través de un String. Los resultados posibles son: "Ganó el bando 1", "Ganó el bando 2" o "No ganó nadie".
La opción que consideramos para desarrollar el combate durante una cierta cantidad de rondas, es que inicialmente ataca el bando 1. El bando 2 recibe el ataque y luego ataca al bando 2. Está idea fue pensada a partir de los clásicos juegos por turno, donde primero ataca un jugador en su turno y luego le toca al próximo jugador. Quizas una modificación que se podría realizar a esté método es que el turno en el que comienza atacando un bando sea aleatorio y no fijo como está implementado actualmente.
