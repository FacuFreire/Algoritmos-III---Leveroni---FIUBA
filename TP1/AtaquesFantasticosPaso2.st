!classDefinition: #CombatienteHumanoArthas category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #CombatienteHumanoArthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteHumanoArthas class' category: 'AtaquesFantasticosPaso2'!
CombatienteHumanoArthas class
	instanceVariableNames: 'estrategia dañoAAbsorber dañoAInfligir puntosDeVida enemigos dañoReducidoPorAgilidad dañoPorDistraido'!

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/19/2022 19:48:38'!
atacar
	| enemigoElegido |
	
	enemigos isEmpty ifTrue: [^self].
	
	self enemigos: enemigos.
	enemigoElegido := estrategia value: enemigos.
	self atacarA: enemigoElegido.! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/19/2022 15:47:46'!
atacarA: unCombatiente 
	(self estaMuerto) ifTrue:[^self].
	(unCombatiente estaMuerto) ifTrue:[^self].
	unCombatiente recibirDaño: dañoAInfligir.! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:22:57'!
dejaDeEstarDistraido: daño
	|nuevoDañoADescontar|
	dañoPorDistraido := 0*pv. 
      	^nuevoDañoADescontar := daño + (2*pv).! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:02:05'!
enemigos: unConjuntoDeEnemigos
	
	enemigos := unConjuntoDeEnemigos select:  [:combatiente | 0*pv < combatiente puntosDeVida].
	! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:26:32'!
estaDistraido
	dañoPorDistraido := 2*pv.! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 20:08:49'!
estaHerido
	(20*pv > puntosDeVida and: [0*pv < puntosDeVida]) ifTrue:[^true] ifFalse:[^false]
	! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 22:34:05'!
estaMuerto
	(1*pv > puntosDeVida) ifTrue: [^true] ifFalse:[^false]! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:05:22'!
focalizarEnElMasHerido
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMin: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:05:32'!
focalizarEnElMasSano
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMax: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:38:01'!
listaDeEnemigos
	^enemigos.! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:24:58'!
noEstaHerido
	(20*pv = puntosDeVida) ifTrue:[^true] ifFalse:[^false]! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/19/2022 16:35:50'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	
	dañoPorDistraido := 0*pv.
	dañoReducidoPorAgilidad := 1*pv.
	
	dañoAInfligir := 2*pv.
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'pal 8/23/2022 23:49:24'!
puntosDeVida
	^puntosDeVida! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:26:23'!
recibirDaño:  unaCantidadDeDaño
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber - dañoReducidoPorAgilidad) max: 0*pv.
	
	(0*pv = dañoADescontar) ifTrue: [self estaDistraido].

	(0*pv < dañoADescontar and: [2*pv = dañoPorDistraido]) ifTrue: [dañoADescontar := self dejaDeEstarDistraido: dañoADescontar].
	
	puntosDeVida := puntosDeVida - dañoADescontar.! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:38:53'!
tieneEnemigos
	(enemigos size > 0) ifTrue:[^true.] ifFalse:[^false.]! !

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:46:28'!
tienePuntosDeVida: aSimpleMeasure 
	^aSimpleMeasure = puntosDeVida! !


!CombatienteHumanoArthas class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:27:09'!
usarArmaduraDeCuero
	dañoAAbsorber := 2*pv.! !

!CombatienteHumanoArthas class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:27:15'!
usarArmaduraDeMetal
	dañoAAbsorber := 6*pv.! !

!CombatienteHumanoArthas class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:27:19'!
usarEspada
	dañoAInfligir := 8*pv.! !

!CombatienteHumanoArthas class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:27:23'!
usarHacha
	dañoAInfligir := 10*pv.! !


!CombatienteHumanoArthas class methodsFor: '--** private fileout/in **--' stamp: 'FF 9/19/2022 19:51:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteHumanoArthas; instVarAt: 2 put: '[ :argm6_1 |
	argm6_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 20; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := #().
	dañoReducidoPorAgilidad := (SimpleMeasure basicNew instVarAt: 1 put: 1; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoPorDistraido := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).! !


!classDefinition: #CombatienteOrcoMankrik category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #CombatienteOrcoMankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteOrcoMankrik class' category: 'AtaquesFantasticosPaso2'!
CombatienteOrcoMankrik class
	instanceVariableNames: 'dañoPorFuerza estrategia dañoAAbsorber dañoAInfligir puntosDeVida enemigos dañoForFuerza dañoPorDistraido'!

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/19/2022 19:48:56'!
atacar
	| enemigoElegido |
	enemigos isEmpty ifTrue: [^self].
	
	self enemigos: enemigos.
	enemigoElegido := estrategia value: enemigos.
	self atacarA: enemigoElegido.! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/19/2022 15:47:40'!
atacarA: unCombatiente 
	(self estaMuerto) ifTrue:[^self].
	(unCombatiente estaMuerto) ifTrue:[^self].
	unCombatiente recibirDaño: dañoAInfligir + (dañoPorFuerza).! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:22:23'!
dejaDeEstarDistraido: daño
	|nuevoDañoADescontar|
	dañoPorDistraido := 0*pv. 
      	^nuevoDañoADescontar := daño + (2*pv).! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:04:46'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos select:  [:combatiente | 0*pv < combatiente puntosDeVida].! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:27:00'!
estaDistraido
	dañoPorDistraido := 2*pv.! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 20:08:38'!
estaHerido
	(20*pv > puntosDeVida and: [0*pv < puntosDeVida]) ifTrue:[^true] ifFalse:[^false]! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 22:39:14'!
estaMuerto
	(1*pv > puntosDeVida) ifTrue: [^true] ifFalse:[^false]! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:03:12'!
focalizarEnElMasHerido
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMin: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:03:31'!
focalizarEnElMasSano
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMax: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:41:08'!
listaDeEnemigos
	^enemigos.! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:53:36'!
noEstaHerido
	((20)*pv = puntosDeVida) ifTrue:[^true] ifFalse:[^false]
	! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:55:19'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	dañoPorDistraido := 0*pv.
	dañoAInfligir := 2*pv.
	dañoPorFuerza := 2*pv.
	
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'pal 8/23/2022 23:51:54'!
puntosDeVida
	^puntosDeVida! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:27:14'!
recibirDaño:  unaCantidadDeDaño
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	
	(0*pv = dañoADescontar) ifTrue: [self estaDistraido].

	(0*pv < dañoADescontar and: [2*pv = dañoPorDistraido]) ifTrue: [dañoADescontar := self dejaDeEstarDistraido: dañoADescontar].
	
	puntosDeVida := puntosDeVida - dañoADescontar.! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:40:43'!
tieneEnemigos
	(enemigos size > 0) ifTrue:[^true.] ifFalse:[^false.]
	! !

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:46:10'!
tienePuntosDeVida: aSimpleMeasure 
	^aSimpleMeasure = puntosDeVida! !


!CombatienteOrcoMankrik class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:26:48'!
usarArmaduraDeCuero
	dañoAAbsorber := 2*pv.! !

!CombatienteOrcoMankrik class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:26:53'!
usarArmaduraDeMetal
	dañoAAbsorber := 6*pv.! !

!CombatienteOrcoMankrik class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:26:57'!
usarEspada
	dañoAInfligir := 8*pv.! !

!CombatienteOrcoMankrik class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:27:02'!
usarHacha
	dañoAInfligir := 10*pv.! !


!CombatienteOrcoMankrik class methodsFor: '--** private fileout/in **--' stamp: 'FF 9/19/2022 19:51:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	dañoPorFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteOrcoMankrik; instVarAt: 2 put: '[ :argm6_1 |
	argm6_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 20; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := #().
	dañoForFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoPorDistraido := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).! !


!classDefinition: #CombatienteOrcoOlgra category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #CombatienteOrcoOlgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteOrcoOlgra class' category: 'AtaquesFantasticosPaso2'!
CombatienteOrcoOlgra class
	instanceVariableNames: 'dañoPorFuerza enemigos puntosDeVida dañoAInfligir dañoAAbsorber estrategia dañoForFuerza dañoPorDistraido'!

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/19/2022 19:49:02'!
atacar
	| enemigoElegido |
	enemigos isEmpty ifTrue: [^self].
	
	self enemigos: enemigos.
	enemigoElegido := estrategia value: enemigos.
	self atacarA: enemigoElegido.! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/19/2022 15:46:53'!
atacarA: unCombatiente 
	(self estaMuerto) ifTrue:[^self].
	(unCombatiente estaMuerto) ifTrue:[^self].
	unCombatiente recibirDaño: dañoAInfligir + (dañoPorFuerza).! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:19:21'!
dejaDeEstarDistraido: daño
	|nuevoDañoADescontar|
	dañoPorDistraido := 0*pv. 
      	^nuevoDañoADescontar := daño + (2*pv).
	

	! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/19/2022 00:19:25'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos select:  [:combatiente | 0*pv < combatiente puntosDeVida].! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:27:25'!
estaDistraido
	dañoPorDistraido := 2*pv.
	! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 20:07:47'!
estaHerido
	(20*pv > puntosDeVida and: [0*pv < puntosDeVida]) ifTrue:[^true] ifFalse:[^false]
	! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 22:39:20'!
estaMuerto
	(1*pv > puntosDeVida) ifTrue: [^true] ifFalse:[^false]! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:01:25'!
focalizarEnElMasHerido
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMin: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'JMB 9/11/2022 12:01:39'!
focalizarEnElMasSano
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMax: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:41:53'!
listaDeEnemigos
	^enemigos.! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:20:12'!
noEstaHerido
	(20*pv = puntosDeVida) ifTrue:[^true] ifFalse:[^false]! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:55:09'!
prepararseParaElCombate	
	puntosDeVida := 20*pv.
	dañoPorDistraido := 0*pv.
	dañoAInfligir := 2*pv.	
	dañoPorFuerza := 1*pv.
	
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	
	! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'pal 8/23/2022 23:50:14'!
puntosDeVida
	^puntosDeVida! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 23:27:39'!
recibirDaño:  unaCantidadDeDaño
	| dañoADescontar |	
	
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	
	(0*pv = dañoADescontar) ifTrue: [self estaDistraido].

	(0*pv < dañoADescontar and: [2*pv = dañoPorDistraido]) ifTrue: [dañoADescontar := self dejaDeEstarDistraido: dañoADescontar].
	
	puntosDeVida := puntosDeVida - dañoADescontar.! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/19/2022 17:42:38'!
tieneEnemigos
	(enemigos size > 0) ifTrue:[^true.] ifFalse:[^false.]! !

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'FF 9/18/2022 21:45:55'!
tienePuntosDeVida: aSimpleMeasure 
	^aSimpleMeasure = puntosDeVida
	! !


!CombatienteOrcoOlgra class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:28:52'!
usarArmaduraDeCuero
	dañoAAbsorber := 2*pv.! !

!CombatienteOrcoOlgra class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:28:57'!
usarArmaduraDeMetal
	dañoAAbsorber := 6*pv.! !

!CombatienteOrcoOlgra class methodsFor: 'equipo' stamp: 'JMB 9/14/2022 00:29:03'!
usarEspada
	dañoAInfligir := 8*pv.! !

!CombatienteOrcoOlgra class methodsFor: 'equipo' stamp: 'FF 9/18/2022 18:15:36'!
usarHacha
	dañoAInfligir := 10*pv.! !


!CombatienteOrcoOlgra class methodsFor: '--** private fileout/in **--' stamp: 'FF 9/19/2022 19:51:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	dañoPorFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 1; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := #().
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 20; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteOrcoOlgra; instVarAt: 2 put: '[ :argm6_1 |
	argm6_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	dañoForFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 1; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoPorDistraido := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso2'!
CombatientesTest class
	instanceVariableNames: ''!


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !


!CombatientesTest class methodsFor: '--** private fileout/in **--' stamp: 'JMB 9/14/2022 00:19:03'!
initialize

	"Este método está para crear unidades. No se debe tocar"

	| puntosDeVida |
	puntosDeVida := BaseUnit named: 'puntosDeVida' sign: 'pv'.

	Smalltalk at: #pv put: puntosDeVida.
	Smalltalk at: #puntosDeVida put: puntosDeVida.! !


!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:54:04'!
combatienteHumanoArthas
	^CombatienteHumanoArthas ! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:54:34'!
combatienteOrcoMankrik
	^CombatienteOrcoMankrik ! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:54:12'!
combatienteOrcoOlgra
	^CombatienteOrcoOlgra ! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:53:32'!
comenzarUnNuevoCombate
	CombatienteHumanoArthas prepararseParaElCombate .
	CombatienteOrcoOlgra prepararseParaElCombate .
	CombatienteOrcoMankrik prepararseParaElCombate .! !


!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:06'!
test01CuandoArthasAtacaAOlgraLeHaceDaño
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe tener 18 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:11'!
test02CuandoArthasAtacaMasDeUnaVezAOlgraLeHaceDañoEnCadaAtaque

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:17'!
test03CuandoArthasAtacaConUnHachaHace10DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 10*pv) description: 'Olgra debe tener 10 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:21'!
test04CuandoArthasAtacaConUnaEspadaHace8DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) description: 'Olgra debe tener 12 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:27'!
test05CuandoOlgraUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 14*pv) description: 'Olgra debe tener 14 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:33'!
test06CuandoOlgraUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe tener 18 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/10/2022 16:45:40'!
test07CuandoOlgraUsaUnaArmaduraResuceElDañoPeroNoRecuperaPuntosDeVida

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.! !


!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/10/2022 16:55:02'!
test08CuandoArthasNoTieneEnemigosNoAtacaANadie
	self comenzarUnNuevoCombate .
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.
	Assert isTrue: self combatienteOrcoMankrik noEstaHerido description: 'Mankrik debe tener los puntos de vida completos'.
	
	! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/10/2022 15:24:46'!
test09CuandoArthasTieneEnemigosAtacaAUno
	| soloOlgraEstaHerido soloMankrikEstaHerido |
	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	soloOlgraEstaHerido := self combatienteOrcoOlgra estaHerido and: [self combatienteOrcoMankrik noEstaHerido ].
	soloMankrikEstaHerido := self combatienteOrcoMankrik estaHerido and: [self combatienteOrcoOlgra noEstaHerido ].
	Assert isTrue: (soloOlgraEstaHerido or: [soloMankrikEstaHerido]).! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/14/2022 00:20:44'!
test10CuandoArthasTieneComoEstrategiaAtacarAlMasHeridoDañaAlQueEstaMasHerido
	
	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra .	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida'.
	! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/14/2022 00:20:51'!
test11CuandoArthasTieneComoEstrategiaAtacarAlMasSanoDañaAlQueEstaMenosHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.	
	self combatienteHumanoArthas focalizarEnElMasSano.
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) description: 'Olgra debe tener 12 puntos de vida'.
	! !


!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:38:50'!
test12CuandoOlgraAtacaConSusPuñosAMankrikLeHace2DeDañoMas1PorFuerza
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 17*pv) description: 'Mankrik debe tener 17 puntos de vida (20 inicial - 2 por puños - 1 por fuerza)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:38:32'!
test13CuandoMankrikAtacaConSusPuñosAOlgraLeHace2DeDañoMas2PorFuerza
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida (20 inicial - 2 por puños - 2 por fuerza)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:39:42'!
test14CuandoMankrikAtacaAArthasLeHaceDañoReducidoEn1PorSuAgilidad
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.

	Assert 
		isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 17*pv) 
		description: 'Arthas debe tener 17 puntos de vida (20 inicial - 2 por puños - 2 por fuerza + 1 agilidad de Arthas)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:12'!
test15CuandoOlgraAtacaConUnHachaHace10DeDañoMas1PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarHacha.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 9*pv) description: 'Olgra debe tener 9 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:17'!
test16CuandoOlgraAtacaConUnaEspadaHace8DeDañoMas1PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 11*pv) description: 'Mankrik debe tener 11 puntos de vida'.
	! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:41:17'!
test17CuandoMankrikAtacaConUnHachaHace10DeDañoMas2PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarHacha.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 8*pv) description: 'Olgra debe tener 8 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:41:26'!
test18CuandoMankrikAtacaConUnaEspadaHace8DeDañoMas2PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarEspada.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 10*pv) description: 'Olgra debe tener 10 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:35'!
test19CuandoMankrikUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoMankrik usarArmaduraDeCuero.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 13*pv) description: 'Mankrik debe tener 13 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:40'!
test20CuandoMankrikUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoMankrik usarArmaduraDeMetal.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 17*pv) description: 'Mankrik debe tener 17 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:44'!
test21CuandoArthasUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeCuero.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 14*pv) description: 'Arthas debe tener 14 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:49'!
test22CuandoArthasUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeMetal.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe tener 18 puntos de vida'.! !


!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/10/2022 15:18:22'!
test23CuandoArthasEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarHacha.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isFalse: self combatienteOrcoOlgra estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/10/2022 16:52:19'!
test24CuandoOlgraEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isFalse: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'FF 9/18/2022 20:14:05'!
test25CuandoMankrikEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	Assert isFalse: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'FF 9/18/2022 20:58:54'!
test26ArthasNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas focalizarEnElMasHerido.		
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	self combatienteHumanoArthas atacar.
	Assert isTrue: self combatienteOrcoOlgra estaHerido! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'FF 9/18/2022 21:03:53'!
test27OlgraNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra focalizarEnElMasHerido.
	self combatienteOrcoOlgra usarHacha.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra enemigos: {self combatienteHumanoArthas. self combatienteOrcoMankrik .}.
	
	self combatienteOrcoOlgra atacar.
	
	Assert isTrue: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'FF 9/18/2022 21:05:51'!
test28MankrikNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik focalizarEnElMasHerido.
	self combatienteOrcoMankrik usarHacha.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik enemigos: {self combatienteHumanoArthas. self combatienteOrcoOlgra .}.
	
	self combatienteOrcoMankrik atacar.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido.! !


!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:38:42'!
test29CuandoOlgraEstaDistraidoLeHacen2MasDeDaño
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert 
		isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) 
		description: 'Olgra debe tener 12 puntos de vida: 20 (inicial) - 8 (por espada) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'FF 9/18/2022 22:01:01'!
test30CuandoElAtaqueNoInflingeDañoOlgraNoRecibeDañoPorEstarDistradido
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:39:52'!
test31CuandoMankrikEstaDistraidoLeHacen2MasDeDaño
	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	Assert 
		isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 12*pv) 
		description: 'Mankrik debe tener 12 puntos de vida: 20 (inicial) - 8 (por espada) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:39:39'!
test32CuandoElAtaqueNoInflingeDañoMankrikNoRecibeDañoPorEstarDistradido
	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: self combatienteOrcoMankrik noEstaHerido description: 'Mankrik debe tener los puntos de vida completos'.! !


!classDefinition: #EstrategiasTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #EstrategiasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiasTest class' category: 'AtaquesFantasticosPaso2'!
EstrategiasTest class
	instanceVariableNames: ''!

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:07:54'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos
	
	OrquestadorDeCombatesTest prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self combatienteHumanoArthas usarHacha.
	OrquestadorDeCombatesTest 
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ OrquestadorDeCombatesTest orquestadorDeCombates! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:07:39'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos
	
	OrquestadorDeCombatesTest prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self combatienteHumanoArthas usarHacha.
	OrquestadorDeCombatesTest 
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ OrquestadorDeCombatesTest orquestadorDeCombates! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:10:15'!
puntosDeVidaDelGanadorFocalizandoEnElMasHerido
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:10:08'!
puntosDeVidaDelGanadorFocalizandoEnElMasSano
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !


!EstrategiasTest class methodsFor: 'combatientes' stamp: 'JMB 9/14/2022 23:10:44'!
combatienteHumanoArthas
	^CombatienteHumanoArthas ! !

!EstrategiasTest class methodsFor: 'combatientes' stamp: 'JMB 9/15/2022 00:01:56'!
combatienteOrcoMankrik
	^CombatienteOrcoMankrik ! !

!EstrategiasTest class methodsFor: 'combatientes' stamp: 'JMB 9/14/2022 23:11:07'!
combatienteOrcoOlgra
	^CombatienteOrcoOlgra ! !


!EstrategiasTest class methodsFor: 'tests' stamp: 'JMB 9/15/2022 00:09:22'!
test01FocalizarEnElMasHeridoEsMejorQueEnElMasSano
	
	Assert isTrue: self puntosDeVidaDelGanadorFocalizandoEnElMasHerido > self puntosDeVidaDelGanadorFocalizandoEnElMasSano.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrquestadorDeCombatesTest class' category: 'AtaquesFantasticosPaso2'!
OrquestadorDeCombatesTest class
	instanceVariableNames: 'elBandoUno elBandoDos'!

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 19:05:35'!
assertElResultadoIndicaQueGanoElBando1: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado
	Assert isTrue: (resultadoDeUnCombate = 'Ganó el bando 1') description: 'Ganó el bando 1 en el siguiente número de rondas: ', unNumeroDeRondaEsperado printString! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 19:05:13'!
assertElResultadoIndicaQueGanoElBando2: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado
	Assert isTrue: (resultadoDeUnCombate = 'Ganó el bando 2') description: 'Ganó el bando 2 en el siguiente número de rondas: ', unNumeroDeRondaEsperado printString! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 19:05:28'!
assertElResultadoIndicaQueNoHayGanador: resultadoDeUnCombate  alcanzadaLaRonda: unNumeroDeRondaEsperado	
	Assert isTrue: (resultadoDeUnCombate = 'No ganó nadie') description: 'No ganó nadie en el siguiente número de rondas: ', unNumeroDeRondaEsperado printString
	! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 19:12:44'!
desarrollarDuranteRondas: numeroDeRondas

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
		
	^ 'No ganó nadie'! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 18:49:58'!
establecerCombateEntreBando1: unBando1 contraBando2: unBando2        
	
	unBando1 do: [:combatienteBando1 | combatienteBando1 enemigos: unBando2.].
	unBando2 do: [:combatienteBando2 | combatienteBando2 enemigos: unBando1.].
	
	elBandoUno := unBando1.
	elBandoDos := unBando2.
		
	! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 18:53:54'!
listaBandoDos
	^elBandoDos.! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 18:53:18'!
listaBandoUno
	^elBandoUno.! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'FF 9/19/2022 18:54:24'!
orquestadorDeCombates
	
	^self.! !


!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:13'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:25'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self establecerCombateEntreBando1:  {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'FF 9/19/2022 18:40:42'!
orquestadorParaCombateArthasVsOlgra		
	self prepararCombatientes. 
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:51'!
orquestadorParaCombateArthasVsOrcos
	self prepararCombatientes.
	self establecerCombateEntreBando1: { self combatienteHumanoArthas } contraBando2: {self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:33'!
orquestadorParaCombateManoAManoConBando2Inmune	
	
	self prepararCombatientes.
	self combatienteOrcoOlgra usarEspada.
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:13'!
orquestadorParaCombateOrcosVsArthas
	self prepararCombatientes.
	self establecerCombateEntreBando1: {self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: { self combatienteHumanoArthas }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:43'!
orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }. 
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:54'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/12/2022 20:49:44'!
prepararCombatientes

	self combatienteHumanoArthas prepararseParaElCombate. 
	self combatienteOrcoOlgra prepararseParaElCombate.
	self combatienteOrcoMankrik prepararseParaElCombate. ! !


!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'FF 9/19/2022 00:06:13'!
combatienteHumanoArthas
	^ CombatienteHumanoArthas! !

!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'JMB 9/12/2022 20:49:44'!
combatienteOrcoMankrik

	^ CombatienteOrcoMankrik! !

!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'JMB 9/12/2022 20:48:43'!
combatienteOrcoOlgra

	^ CombatienteOrcoOlgra! !


!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'FF 9/19/2022 15:25:53'!
test01AlDesarrollarUnCombateSinRondasLosCombatientesNoSeAtacan
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	Assert isTrue: self combatienteHumanoArthas noEstaHerido.
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test02AlDesarrollarUnCombateManoAManoDeUnaRondaLosBandosSeAtacanUnaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 1.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe recibir un puñetazo (2 de daño)'.
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe recibir un puñetazo (2 de daño)'.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test03AlDesarrollarUnCombateManoAManoConMasDeUnaRondaLosBandosSeAtacanCadaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 16*pv) description: 'Arthas debe recibir dos puñetazos (4 de daño)'.
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe recibir dos puñetazos (4 de daño)'.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test04AlDesarrollarUnCombateManoAManoSinGanadoresElResultadoEsIndeterminado
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 0.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test05AlDesarrollarUnCombateManoAManoGanaElBando1CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test06AlDesarrollarUnCombateCuandoHayUnGanadorFinalizaEnLaRondaQueElPerdedorQuedoFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 11.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:31:33'!
test07AlDesarrollarUnCombateManoAManoGanaElBando2CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateManoAManoConBando2Inmune.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 100.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 3.! !


!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:13'!
test08AlDesarrollarUnCombateLosDelBando1PuedenAtacarACualquieraDelBando2
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido. 
	Assert isTrue: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:13'!
test09AlDesarrollarUnCombateAtacanTodesLosDelBando1EnCadaRonda
	"
		En cada ronda Olgra daña a Arthas en 2  (2 puños + 1 por fuerza - 1 por agilidad de Arthas) y  Mankrik 3 (2 puños + 2 por fuerza - 1 por agilidad de Arthas) 
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthas.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 4.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 4.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:43'!
test10AlDesarrollarUnCombateLosDelBando2PuedenAtacarACualquieraDelBando1
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido. 
	Assert isTrue: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:51'!
test11AlDesarrollarUnCombateAtacanTodesLosDelBando2EnCadaRonda
	"
		En cada ronda Olgra daña a Arthas en 2  (2 puños + 1 por fuerza - 1 por agilidad de Arthas) y  Mankrik 3 (2 puños + 2 por fuerza - 1 por agilidad de Arthas) 
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 4.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 4.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:25'!
test12AlDesarrollarUnCombateLosDelBando1NoGananSiTodosLosDelBando2NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:54'!
test13AlDesarrollarUnCombateLosDelBando2NoGananSiTodosLosDelBando1NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !


!OrquestadorDeCombatesTest class methodsFor: '--** private fileout/in **--' stamp: 'FF 9/19/2022 19:51:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	elBandoUno := ((Array new: 1) at: 1 put: CombatienteHumanoArthas; yourself).
	elBandoDos := ((Array new: 2) at: 1 put: CombatienteOrcoOlgra; at: 2 put: CombatienteOrcoMankrik; yourself).! !

CombatienteHumanoArthas initializeAfterFileIn!
CombatienteOrcoMankrik initializeAfterFileIn!
CombatienteOrcoOlgra initializeAfterFileIn!
CombatientesTest initialize!
OrquestadorDeCombatesTest initializeAfterFileIn!