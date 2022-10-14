!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:34:57'!
test01StackShouldBeEmptyWhenCreated
	| stack |
	
	stack := Stack new.
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:49:13'!
test02PushAnElementToStack
	|stack|
	
	stack := Stack new.
	
	stack push: 'Hola'.
	
	self deny: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:49:32'!
test03PopAnElementFromStack

	|stack|
	
	stack:= Stack new.
	
	stack push: 'algo'.
	
	stack pop.
	
	self assert: stack isEmpty
	
! !

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:35:31'!
test04PopReturnsLastElementFromStack

	|stack pushedObject|
	
	stack := Stack new.
	pushedObject := 'hola'.
	
	stack push: pushedObject.
	
	self assert: stack pop equals: pushedObject.! !

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:42:14'!
test05LIFOStack

	|stack firstPushedObject secondPushedObject|
	
	stack := Stack new.
	
	firstPushedObject := 'Hola'.
	secondPushedObject := 'Chau'.
	
	stack push: firstPushedObject .
	stack push: secondPushedObject.
	
	self assert: secondPushedObject  equals: stack pop.
	self assert: firstPushedObject  equals: stack pop.
	self assert: stack isEmpty. 
	! !

!StackTest methodsFor: 'tests' stamp: 'FF 10/14/2022 16:37:11'!
test06TopGetLastElementFromStackWithoutUsingPop

	|stack pushedObject|
	
	stack := Stack new.
	pushedObject := 'Hola'.
	
	stack push: pushedObject .
	
	self assert: pushedObject  equals: stack top! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stackCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'operations' stamp: 'sc 10/13/2022 11:21:11'!
isEmpty

	^stackCollection isEmpty.! !

!Stack methodsFor: 'operations' stamp: 'FF 10/14/2022 16:46:49'!
pop

	
	^stackCollection removeLast.
! !

!Stack methodsFor: 'operations' stamp: 'FF 10/14/2022 16:47:29'!
push: anObject

	stackCollection addLast: anObject.

	

	


! !

!Stack methodsFor: 'operations' stamp: 'FF 10/14/2022 16:39:18'!
size

	^stackCollection size.! !

!Stack methodsFor: 'operations' stamp: 'sc 10/13/2022 14:50:19'!
top

	^stackCollection at: stackCollection size.! !


!Stack methodsFor: 'initialization' stamp: 'FF 10/14/2022 16:37:30'!
initialize

	stackCollection := OrderedCollection new! !
