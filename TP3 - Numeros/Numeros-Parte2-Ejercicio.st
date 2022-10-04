!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'six zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'FF 9/29/2022 23:43:56'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5)  equals: one + oneFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'FF 9/30/2022 00:26:44'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'FF 9/30/2022 00:30:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	
	six := Entero with: 6.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:58:15'!
divideAUnEntero: unEntero

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:58:39'!
divideAUnaFraccion: unaFraccion

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:56:22'!
multiplicaAUnEntero: unEnteroASerMutiplicado

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:57:46'!
multiplicaAUnaFraccion: unaFraccionASerMultiplicada
	self subclassResponsibility .! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:54:33'!
restaAUnEntero: unEntero

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:55:02'!
restaAUnaFraccion: unaFraccion

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:53:11'!
sumaAUnEntero: unEntero

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'sc 10/3/2022 20:54:09'!
sumaAUnaFraccion: unaFraccion

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:54:20'!
* aMultiplier 
	
	^ aMultiplier multiplicaAUnEntero: self.
	
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:54:10'!
+ anAdder
	^ anAdder sumaAUnEntero: self.

		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:52:26'!
- aSubtrahend 	
	
	^ aSubtrahend restaAUnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:19:20'!
/ aDivisor 
	^aDivisor divideAUnEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sc 10/3/2022 20:33:03'!
fibonacci

	| one two |
		
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:20:08'!
divideAUnEntero: unEntero 
								
	^Fraccion with: unEntero over: self.

	

! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:28:13'!
divideAUnaFraccion: unaFraccion

	^ Fraccion with: unaFraccion numerator over: self * unaFraccion denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:54:54'!
multiplicaAUnEntero: unEnteroASerMutiplicado
	^ Entero with: (self integerValue * unEnteroASerMutiplicado integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:55:31'!
multiplicaAUnaFraccion: unaFraccionASerMultiplicada
	^ Fraccion with: (self * unaFraccionASerMultiplicada numerator) over: (unaFraccionASerMultiplicada denominator)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:52:07'!
restaAUnEntero: unEnteroASerRestado
	^  Entero with: unEnteroASerRestado integerValue - self integerValue.
	
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 20:02:31'!
restaAUnaFraccion: unaFraccionASerRestada
	^ Fraccion with: unaFraccionASerRestada numerator - (self * unaFraccionASerRestada denominator) over: unaFraccionASerRestada denominator.
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:53:42'!
sumaAUnEntero: unEnteroASerSumado
	^  Entero with: self integerValue + unEnteroASerSumado integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 20:01:21'!
sumaAUnaFraccion: unaFraccionASerSumada

	^ Fraccion with: self * unaFraccionASerSumada denominator + unaFraccionASerSumada numerator over: unaFraccionASerSumada denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'sc 10/3/2022 20:39:12'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(aValue = 0) ifTrue: [^Cero new initializeWith: aValue].
	(aValue < 0) ifTrue: [^Negativo new initializeWith: aValue].
	(aValue = 1) ifTrue: [^Uno new initializeWith: aValue].
	
	^self new initializeWith: aValue! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 22:38:21'!
divideAUnEntero:unEntero

	Numero error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 22:42:17'!
divideAUnaFraccion:unEntero

	Numero error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 21:52:50'!
errorDenominadorCero

	self error: Numero canNotDivideByZero. 

	! !

!Cero methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 20:46:55'!
errorNumeradorCero
	self error: 'una fraccion no puede ser cero'
! !

!Cero methodsFor: 'as yet unclassified' stamp: 'FF 10/3/2022 20:09:00'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 22:35:03'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 22:39:03'!
divideAUnEntero: aDividend

	^aDividend negated / self negated.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 22:23:19'!
dividirPorEntero: aDividend

	^aDividend negated / self negated.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 20:29:12'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription ! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'sc 10/3/2022 20:47:36'!
errorDenominadorUno

	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'! !

!Uno methodsFor: 'as yet unclassified' stamp: 'FF 10/3/2022 20:10:51'!
fibonacci

	^Entero with: 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:25:59'!
divideAUnEntero: unEntero

	^ Fraccion with: unEntero * self denominator over: self numerator.       	
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:21:30'!
divideAUnaFraccion: unaFraccion

	^ Fraccion with: self denominator * unaFraccion numerator over: self numerator * unaFraccion denominator.
	
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:43:06'!
multiplicaAUnEntero: unEnteroASerMutiplicado 
	^ Fraccion with: unEnteroASerMutiplicado * numerator  over: denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:43:50'!
multiplicaAUnaFraccion: unaFraccionASerMultiplicada
	^ Fraccion with: numerator * unaFraccionASerMultiplicada numerator over: (denominator * unaFraccionASerMultiplicada denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:38:43'!
restaAUnEntero: unEnteroASerRestado
	^ Fraccion with: (unEnteroASerRestado * denominator - numerator) over: denominator.
	

! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:39:09'!
restaAUnaFraccion: FraccionASerRestada
	
	^ Fraccion with: (denominator * FraccionASerRestada numerator) - (FraccionASerRestada denominator * numerator) over: (denominator * FraccionASerRestada denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:59:31'!
sumaAUnEntero: unEnteroASerSumado
	^ Fraccion with:  unEnteroASerSumado * denominator + numerator over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'FF 10/3/2022 19:44:56'!
sumaAUnaFraccion: unaFraccionASerSumada
	| newNumerator newDenominator |
	newNumerator := (numerator * unaFraccionASerSumada denominator) + (unaFraccionASerSumada numerator * denominator).
	newDenominator := denominator * unaFraccionASerSumada denominator.
	^newNumerator / newDenominator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:45:41'!
* aMultiplier 
	^ aMultiplier multiplicaAUnaFraccion: self.
	
		! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:44:20'!
+ anAdder 
	^ anAdder sumaAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:45:49'!
- aSubtrahend 
	
	^ aSubtrahend restaAUnaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FF 10/3/2022 19:21:49'!
/ aDivisor 
	^aDivisor divideAUnaFraccion: self.
	! !


!Fraccion methodsFor: 'comparing' stamp: 'FF 9/30/2022 01:38:11'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'sc 10/3/2022 22:43:59'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'sc 10/3/2022 20:50:07'!
initializeWith: aNumerator over: aDenominator

	
	numerator := aNumerator.
	denominator := aDenominator. ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'sc 10/3/2022 23:10:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
