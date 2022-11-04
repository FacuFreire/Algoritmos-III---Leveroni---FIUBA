!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'norte adelante atras sur este oeste izquierda derecha'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!TestMarsRover methodsFor: 'setup' stamp: 'sc 11/4/2022 16:52:53'!
setUp
	norte:=#Norte.
	sur:=#Sur.
	este:=#Este.
	oeste:=#Oeste.
	
	adelante:='f'.
	atras:='b'.
	derecha:='r'.
	izquierda:='l'.
	
	! !


!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:51:30'!
test02comandoMoverHaciaAdelanteConDireccionNorte

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionNorte.
	self procesarComandoAdelante: aMarsRover.
	self assert:(aMarsRover esta: 0 @ 1 apuntando: norte).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:51:57'!
test03comandoMoverHaciaAtrasConDireccionNorte

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionNorte.
	self procesarComandoAtras: aMarsRover .
	self assert:(aMarsRover esta: 0 @ -1 apuntando: norte).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:53:13'!
test04comandoMoverHaciaAdelanteConDireccionSur

	| aMarsRover |
	aMarsRover:=self inicializarMarsRoverOrientacionSur.
	self procesarComandoAdelante: aMarsRover.
	self assert:(aMarsRover esta: 0 @ -1 apuntando: sur).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:51:30'!
test05comandoMoverHaciaAdelanteConDireccionEste

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionEste.
	self procesarComandoAdelante: aMarsRover.
	self assert:(aMarsRover esta: 1@ 0 apuntando: este).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:51:30'!
test06comandoMoverHaciaAdelanteConDireccionOeste

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionOeste.
	self procesarComandoAdelante: aMarsRover.
	self assert:(aMarsRover esta: -1 @ 0 apuntando: oeste).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:52:44'!
test07comandoMoverHaciaAtrasConDireccionSur

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionSur.
	self procesarComandoAtras: aMarsRover.
	self assert:(aMarsRover esta: 0 @ 1 apuntando: sur).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:52:44'!
test08comandoMoverHaciaAtrasConDireccionEste

	| aMarsRover |
	aMarsRover:=self inicializarMarsRoverOrientacionEste.
	self procesarComandoAtras: aMarsRover.
	self assert:(aMarsRover esta: -1 @ 0 apuntando: este).! !

!TestMarsRover methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:55:31'!
test09comandoMoverHaciaAtrasConDireccionOeste

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionOeste.
	self procesarComandoAtras: aMarsRover.
	self assert:(aMarsRover esta: 1 @ 0 apuntando: oeste).! !


!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:53:52'!
test10comandoRotar90GradosIzquierdaConDireccionNorte

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionNorte.
	self procesarComandoIzquierda: aMarsRover .
	self assert:(aMarsRover esta: 0 @ 0 apuntando: oeste).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:53:52'!
test11comandoRotar90GradosIzquierdaConDireccionSur

	| aMarsRover |
	aMarsRover := self inicializarMarsRoverOrientacionSur.
	self procesarComandoIzquierda: aMarsRover.
	self assert: (aMarsRover esta: 0 @ 0 apuntando: este).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:53:52'!
test12comandoRotar90GradosIzquierdaConDireccionEste

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionEste.
	self procesarComandoIzquierda: aMarsRover.
	self assert: (aMarsRover esta: 0 @ 0 apuntando: norte).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:55:31'!
test13comandoRotar90GradosIzquierdaConDireccionOeste

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionOeste.
	self procesarComandoIzquierda: aMarsRover.
	self assert: (aMarsRover esta: 0 @ 0 apuntando: sur).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:54:17'!
test14comandoRotar90GradosDerechaConDireccionNorte

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionNorte.
	self procesarComandoDerecha: aMarsRover.
	self assert: (aMarsRover esta: 0 @ 0 apuntando: este).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:54:17'!
test15comandoRotar90GradosDerechaConDireccionSur

	| aMarsRover |
	aMarsRover :=self inicializarMarsRoverOrientacionSur.
	self procesarComandoDerecha: aMarsRover.
	self assert: (aMarsRover esta: 0 @ 0 apuntando: oeste).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:54:43'!
test16comandoRotar90GradosDerechaConDireccionEste

	| aMarsRover |
	aMarsRover := self inicializarMarsRoverOrientacionEste.
	self procesarComandoDerecha: aMarsRover.
	self assert:(aMarsRover esta: 0 @ 0 apuntando: sur).! !

!TestMarsRover methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:56:10'!
test17comandoRotar90GradosDerechaConDireccionOeste


	| aMarsRover |
	aMarsRover := self inicializarMarsRoverOrientacionOeste.
	self procesarComandoDerecha: aMarsRover.
	self assert:(aMarsRover esta: 0 @ 0 apuntando: norte).! !


!TestMarsRover methodsFor: 'inicializaciones' stamp: 'sc 11/4/2022 17:49:29'!
inicializarMarsRoverOrientacionEste

	^ MarsRover posicion: 0 @ 0 apuntando: este! !

!TestMarsRover methodsFor: 'inicializaciones' stamp: 'sc 11/4/2022 17:48:29'!
inicializarMarsRoverOrientacionNorte

	^ MarsRover posicion: 0 @ 0 apuntando: norte! !

!TestMarsRover methodsFor: 'inicializaciones' stamp: 'sc 11/4/2022 17:56:10'!
inicializarMarsRoverOrientacionOeste

	^ MarsRover posicion:  0@ 0 apuntando: oeste! !

!TestMarsRover methodsFor: 'inicializaciones' stamp: 'sc 11/4/2022 17:56:33'!
inicializarMarsRoverOrientacionSur

	^ MarsRover posicion:  0@0 apuntando: sur! !


!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:53:13'!
procesarComandoAdelante: aMarsRover

	^ aMarsRover procesarComandos:adelante! !

!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:52:44'!
procesarComandoAtras: aMarsRover

	^ aMarsRover procesarComandos: atras! !

!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:54:43'!
procesarComandoDerecha: aMarsRover

	^ aMarsRover procesarComandos:derecha! !

!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:53:52'!
procesarComandoIzquierda: aMarsRover

	^ aMarsRover procesarComandos: izquierda! !

!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:48:29'!
test01UnComandoVacioNoHaceNada
	| marsRover |
	marsRover :=self inicializarMarsRoverOrientacionNorte.
	marsRover procesarComandos: ''.
	self assert:(marsRover esta: 0 @ 0 apuntando: norte).! !

!TestMarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:56:33'!
test18UnComandoInvalidoFrenaLaEjecucion

	| marsRover |
    	marsRover := self inicializarMarsRoverOrientacionSur.

    	self
        		should: [ marsRover procesarComandos: 'messi'. ]
        		raise: Error - MessageNotUnderstood 
        		withExceptionDo: [ :unError |
            			self assert: unError messageText = MarsRover mensajeErrorComando ].

    self assert: (marsRover  esta: 0@0 apuntando: sur).! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRover methodsFor: 'acceso' stamp: 'sc 11/4/2022 16:58:31'!
orientacionActual

	^orientacionActual.! !

!MarsRover methodsFor: 'acceso' stamp: 'sc 11/4/2022 16:58:39'!
posicion
	^ posicion.! !


!MarsRover methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 16:56:09'!
inicializarPosicion: unaPosicion conOrientacion: unPuntoCardinal

	posicion :=unaPosicion.
	orientacionActual:=unPuntoCardinal.
	! !


!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:56:23'!
moverHaciaAdelante

	|marsRoverMovimientoPuntoCardinal|
	
	marsRoverMovimientoPuntoCardinal := MarsRoverMovimientoPuntosCardinales conOrientacionActual: orientacionActual.
	
	marsRoverMovimientoPuntoCardinal moverHaciaAdelante: self.
! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:56:57'!
moverHaciaAdelanteConDireccionEste

	posicion:= posicion + (1 @ 0). 
! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:09'!
moverHaciaAdelanteConDireccionNorte

	posicion:= posicion + (0 @ 1).
! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:19'!
moverHaciaAdelanteConDireccionOeste

	posicion:= posicion + (-1 @ 0). 

	! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:29'!
moverHaciaAdelanteConDireccionSur

	posicion:= posicion + (0 @ -1).! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:39'!
moverHaciaAtras


	|marsRoverMovimientoPuntoCardinal|
	
	marsRoverMovimientoPuntoCardinal := MarsRoverMovimientoPuntosCardinales conOrientacionActual: orientacionActual.
	
	marsRoverMovimientoPuntoCardinal moverHaciaAtras: self.! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:50'!
moverHaciaAtrasConDireccionEste

	self moverHaciaAdelanteConDireccionOeste.! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:57:59'!
moverHaciaAtrasConDireccionNorte

	self moverHaciaAdelanteConDireccionSur.

	.! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:58:11'!
moverHaciaAtrasConDireccionOeste

	self moverHaciaAdelanteConDireccionEste.! !

!MarsRover methodsFor: 'traslaciones-privado' stamp: 'sc 11/4/2022 16:58:21'!
moverHaciaAtrasConDireccionSur

	self moverHaciaAdelanteConDireccionNorte.
! !


!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 16:59:20'!
rotar90GradosALaDerecha


	|marsRoverMovimientoPuntoCardinal|
	
	marsRoverMovimientoPuntoCardinal := MarsRoverMovimientoPuntosCardinales conOrientacionActual: orientacionActual.
	
	marsRoverMovimientoPuntoCardinal rotarALaDerecha: self.
	! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 16:59:36'!
rotar90GradosALaIzquierda

	
	|marsRoverMovimientoPuntoCardinal|
	
	marsRoverMovimientoPuntoCardinal := MarsRoverMovimientoPuntosCardinales conOrientacionActual: orientacionActual.
	
	marsRoverMovimientoPuntoCardinal rotarALaIzquierda: self.! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 16:59:51'!
rotarALaDerechaConDireccionActualEste

	orientacionActual := #Sur.
! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:02'!
rotarALaDerechaConDireccionActualNorte

	orientacionActual := #Este.! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:11'!
rotarALaDerechaConDireccionActualOeste

	orientacionActual := #Norte.
! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:21'!
rotarALaDerechaConDireccionActualSur

	orientacionActual:= #Oeste.
	! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:30'!
rotarALaIzquierdaConDireccionActualEste

	orientacionActual := #Norte.
! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:41'!
rotarALaIzquierdaConDireccionActualNorte

	orientacionActual := #Oeste.
	! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:00:50'!
rotarALaIzquierdaConDireccionActualOeste

	orientacionActual := #Sur.
! !

!MarsRover methodsFor: 'rotaciones-privado' stamp: 'sc 11/4/2022 17:01:01'!
rotarALaIzquierdaConDireccionActualSur

	orientacionActual := #Este.
	! !


!MarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 16:58:50'!
procesarComandos: unaCadenaDeComandos

	unaCadenaDeComandos do: [ :unComando | self procesarUnComando: unComando ].! !

!MarsRover methodsFor: 'comandos' stamp: 'sc 11/4/2022 17:38:28'!
procesarUnComando: unComando

	 |marsRoverTipoDeMovimiento|
	
	self assertComandoInvalido: unComando.
	
	marsRoverTipoDeMovimiento := MarsRoverComandosDeMovimientos comando: unComando.
	
	marsRoverTipoDeMovimiento movimientoSegunComando: self.

! !


!MarsRover methodsFor: 'comparaciones' stamp: 'sc 11/4/2022 16:55:54'!
esta: unaPosicion apuntando: unPuntoCardinal

	^ posicion = unaPosicion and: [ orientacionActual = unPuntoCardinal ].! !


!MarsRover methodsFor: 'assertions' stamp: 'sc 11/4/2022 17:40:58'!
assertComandoInvalido: unComando
	
	|comandosValidos|
	
	comandosValidos :=#($f $b $l $r).
	
	(comandosValidos includes: unComando) ifFalse: [self error: self class mensajeErrorComando].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error' stamp: 'sc 11/4/2022 17:26:28'!
mensajeErrorComando
	^'Comando invalido'.! !

!MarsRover class methodsFor: 'error' stamp: 'sc 11/4/2022 16:54:39'!
mensajeErrorPosicion

	^'La posicion es invalida'.! !

!MarsRover class methodsFor: 'error' stamp: 'sc 11/4/2022 16:54:58'!
mensajeErrorPuntoCardinal
	
	^'Punto cardinal invalido'.! !


!MarsRover class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 16:55:30'!
posicion: unaPosicion apuntando: unPuntoCardinal

	
	self assertPuntoCardinalInvalido: unPuntoCardinal.
	self assertPosicionInvalid: unaPosicion.
	
	^ self new inicializarPosicion: unaPosicion conOrientacion: unPuntoCardinal.! !


!MarsRover class methodsFor: 'assertions' stamp: 'sc 11/4/2022 16:53:34'!
assertPosicionInvalid: unaPosicion

	(unaPosicion isKindOf: Point) ifFalse:[self error: self mensajeErrorPosicion].
	! !

!MarsRover class methodsFor: 'assertions' stamp: 'sc 11/4/2022 16:54:25'!
assertPuntoCardinalInvalido: unPuntoCardinal
	
	|puntosCardinalesValidos|
	
	puntosCardinalesValidos  := #(#Norte #Sur #Este #Oeste).
	
	(puntosCardinalesValidos includes: unPuntoCardinal ) ifFalse:[self error: self mensajeErrorPuntoCardinal].! !


!classDefinition: #MarsRoverComandosDeMovimientos category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRoverComandosDeMovimientos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverComandosDeMovimientos methodsFor: 'movimientos' stamp: 'sc 11/4/2022 17:01:28'!
movimientoSegunComando: aMarsRover 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverComandosDeMovimientos class' category: 'Ejercicio-MarsRover'!
MarsRoverComandosDeMovimientos class
	instanceVariableNames: ''!

!MarsRoverComandosDeMovimientos class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:29:55'!
canHandle: unaCadenaDeComandos

	self subclassResponsibility ! !

!MarsRoverComandosDeMovimientos class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:01:45'!
comando: unaCadenaDeComandos

		
	^(MarsRoverComandosDeMovimientos allSubclasses detect:[:unaClaseDeMarsRoverTiposDeMovimiento| unaClaseDeMarsRoverTiposDeMovimiento canHandle: unaCadenaDeComandos ])para: unaCadenaDeComandos. 
	 ! !

!MarsRoverComandosDeMovimientos class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:01:57'!
para: unComando

	^self new! !


!classDefinition: #MarsRoverComandoMovimientoHaciaAdelante category: 'Ejercicio-MarsRover'!
MarsRoverComandosDeMovimientos subclass: #MarsRoverComandoMovimientoHaciaAdelante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverComandoMovimientoHaciaAdelante methodsFor: 'movimientos' stamp: 'sc 11/4/2022 17:06:25'!
movimientoSegunComando: aMarsRover 
	
	^ aMarsRover moverHaciaAdelante.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverComandoMovimientoHaciaAdelante class' category: 'Ejercicio-MarsRover'!
MarsRoverComandoMovimientoHaciaAdelante class
	instanceVariableNames: ''!

!MarsRoverComandoMovimientoHaciaAdelante class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:06:39'!
canHandle: unaCadenaDeComandos

	^unaCadenaDeComandos = $f.! !


!classDefinition: #MarsRoverComandoMovimientoHaciaAtras category: 'Ejercicio-MarsRover'!
MarsRoverComandosDeMovimientos subclass: #MarsRoverComandoMovimientoHaciaAtras
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverComandoMovimientoHaciaAtras methodsFor: 'movimientos' stamp: 'sc 11/4/2022 17:06:12'!
movimientoSegunComando: aMarsRover 
	
	^ aMarsRover moverHaciaAtras. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverComandoMovimientoHaciaAtras class' category: 'Ejercicio-MarsRover'!
MarsRoverComandoMovimientoHaciaAtras class
	instanceVariableNames: ''!

!MarsRoverComandoMovimientoHaciaAtras class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:05:59'!
canHandle: unComando

	^unComando=$b.! !


!classDefinition: #MarsRoverComandoMovimientoRotacionALaDerecha category: 'Ejercicio-MarsRover'!
MarsRoverComandosDeMovimientos subclass: #MarsRoverComandoMovimientoRotacionALaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverComandoMovimientoRotacionALaDerecha methodsFor: 'movimientos' stamp: 'sc 11/4/2022 17:05:37'!
movimientoSegunComando: aMarsRover 
	
	^aMarsRover rotar90GradosALaDerecha.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverComandoMovimientoRotacionALaDerecha class' category: 'Ejercicio-MarsRover'!
MarsRoverComandoMovimientoRotacionALaDerecha class
	instanceVariableNames: ''!

!MarsRoverComandoMovimientoRotacionALaDerecha class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:05:07'!
canHandle: unComando
 
	^unComando= $r.! !


!classDefinition: #MarsRoverComandoMovimientoRotacionALaIzquierda category: 'Ejercicio-MarsRover'!
MarsRoverComandosDeMovimientos subclass: #MarsRoverComandoMovimientoRotacionALaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverComandoMovimientoRotacionALaIzquierda methodsFor: 'movimientos' stamp: 'sc 11/4/2022 17:04:14'!
movimientoSegunComando: aMarsRover 
	
	^aMarsRover rotar90GradosALaIzquierda.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverComandoMovimientoRotacionALaIzquierda class' category: 'Ejercicio-MarsRover'!
MarsRoverComandoMovimientoRotacionALaIzquierda class
	instanceVariableNames: ''!

!MarsRoverComandoMovimientoRotacionALaIzquierda class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:04:36'!
canHandle: unComando
 
	^unComando = $l.! !


!classDefinition: #MarsRoverMovimientoPuntosCardinales category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRoverMovimientoPuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverMovimientoPuntosCardinales methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:09:24'!
rotarALaDerecha: unMarsRover

	self subclassResponsibility ! !

!MarsRoverMovimientoPuntosCardinales methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:09:35'!
rotarALaIzquierda: unMarsRover

	self subclassResponsibility! !


!MarsRoverMovimientoPuntosCardinales methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:08:58'!
moverHaciaAdelante: unMarsRover

	self subclassResponsibility ! !

!MarsRoverMovimientoPuntosCardinales methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:09:09'!
moverHaciaAtras: unMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovimientoPuntosCardinales class' category: 'Ejercicio-MarsRover'!
MarsRoverMovimientoPuntosCardinales class
	instanceVariableNames: ''!

!MarsRoverMovimientoPuntosCardinales class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:29:05'!
canHandle: unPuntoCardinal

	self subclassResponsibility ! !

!MarsRoverMovimientoPuntosCardinales class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:15:32'!
conOrientacionActual: unPuntoCardinal 
	
	^(MarsRoverMovimientoPuntosCardinales allSubclasses detect:[:unaClaseDeMarsRoverMovimientoPuntosCardinales| unaClaseDeMarsRoverMovimientoPuntosCardinales canHandle: unPuntoCardinal ])para: unPuntoCardinal.! !

!MarsRoverMovimientoPuntosCardinales class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:15:45'!
para: unPuntoCardinal
 
	^self new.! !


!classDefinition: #EsteMarsRoverMoviemientoPuntoCardinal category: 'Ejercicio-MarsRover'!
MarsRoverMovimientoPuntosCardinales subclass: #EsteMarsRoverMoviemientoPuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!EsteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:09:59'!
moverHaciaAdelante: unMarsRover

	^unMarsRover moverHaciaAdelanteConDireccionEste.! !

!EsteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:10:12'!
moverHaciaAtras: unMarsRover

	^unMarsRover moverHaciaAtrasConDireccionEste.! !


!EsteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:10:22'!
rotarALaDerecha: unMarsRover

	^unMarsRover rotarALaDerechaConDireccionActualEste.! !

!EsteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:10:32'!
rotarALaIzquierda: unMarsRover

	^unMarsRover rotarALaIzquierdaConDireccionActualEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EsteMarsRoverMoviemientoPuntoCardinal class' category: 'Ejercicio-MarsRover'!
EsteMarsRoverMoviemientoPuntoCardinal class
	instanceVariableNames: ''!

!EsteMarsRoverMoviemientoPuntoCardinal class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:15:07'!
canHandle: unPuntoCardinal

	^unPuntoCardinal = #Este.! !


!classDefinition: #NorteMarsRoverMoviemientoPuntoCardinal category: 'Ejercicio-MarsRover'!
MarsRoverMovimientoPuntosCardinales subclass: #NorteMarsRoverMoviemientoPuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!NorteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:10:50'!
moverHaciaAdelante: unMarsRover

	^unMarsRover moverHaciaAdelanteConDireccionNorte.! !

!NorteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:11:00'!
moverHaciaAtras: unMarsRover

	^unMarsRover moverHaciaAtrasConDireccionNorte.! !


!NorteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:11:12'!
rotarALaDerecha: unMarsRover

	^unMarsRover rotarALaDerechaConDireccionActualNorte.! !

!NorteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:11:23'!
rotarALaIzquierda: unMarsRover

	^unMarsRover rotarALaIzquierdaConDireccionActualNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorteMarsRoverMoviemientoPuntoCardinal class' category: 'Ejercicio-MarsRover'!
NorteMarsRoverMoviemientoPuntoCardinal class
	instanceVariableNames: ''!

!NorteMarsRoverMoviemientoPuntoCardinal class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:15:02'!
canHandle: unPuntoCardinal

	^unPuntoCardinal = #Norte.! !


!classDefinition: #OesteMarsRoverMoviemientoPuntoCardinal category: 'Ejercicio-MarsRover'!
MarsRoverMovimientoPuntosCardinales subclass: #OesteMarsRoverMoviemientoPuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OesteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:11:37'!
moverHaciaAdelante: unMarsRover

	^unMarsRover moverHaciaAdelanteConDireccionOeste.! !

!OesteMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:11:47'!
moverHaciaAtras: unMarsRover

	^unMarsRover moverHaciaAtrasConDireccionOeste.! !


!OesteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:12:00'!
rotarALaDerecha: unMarsRover

	^unMarsRover rotarALaDerechaConDireccionActualOeste! !

!OesteMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:12:11'!
rotarALaIzquierda: unMarsRover

	^unMarsRover rotarALaIzquierdaConDireccionActualOeste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OesteMarsRoverMoviemientoPuntoCardinal class' category: 'Ejercicio-MarsRover'!
OesteMarsRoverMoviemientoPuntoCardinal class
	instanceVariableNames: ''!

!OesteMarsRoverMoviemientoPuntoCardinal class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:14:17'!
canHandle: unPuntoCardinal

	^unPuntoCardinal= #Oeste.! !


!classDefinition: #SurMarsRoverMoviemientoPuntoCardinal category: 'Ejercicio-MarsRover'!
MarsRoverMovimientoPuntosCardinales subclass: #SurMarsRoverMoviemientoPuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!SurMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:12:29'!
moverHaciaAdelante: unMarsRover

	^unMarsRover moverHaciaAdelanteConDireccionSur.! !

!SurMarsRoverMoviemientoPuntoCardinal methodsFor: 'traslaciones' stamp: 'sc 11/4/2022 17:12:41'!
moverHaciaAtras: unMarsRover

	^unMarsRover moverHaciaAtrasConDireccionSur.! !


!SurMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:12:54'!
rotarALaDerecha: unMarsRover

	^unMarsRover rotarALaDerechaConDireccionActualSur! !

!SurMarsRoverMoviemientoPuntoCardinal methodsFor: 'rotaciones' stamp: 'sc 11/4/2022 17:13:19'!
rotarALaIzquierda: unMarsRover

	^unMarsRover rotarALaIzquierdaConDireccionActualSur! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SurMarsRoverMoviemientoPuntoCardinal class' category: 'Ejercicio-MarsRover'!
SurMarsRoverMoviemientoPuntoCardinal class
	instanceVariableNames: ''!

!SurMarsRoverMoviemientoPuntoCardinal class methodsFor: 'inicializacion' stamp: 'sc 11/4/2022 17:13:52'!
canHandle: unPuntoCardinal

	^unPuntoCardinal= #Sur.! !
