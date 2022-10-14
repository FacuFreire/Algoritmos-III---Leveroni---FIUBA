!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:45:26'!
test01cannotFindEmptyPrefix

	stack := OOStack  new. 
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.
	
	self
		should: [ sentenceFinderByPrefix find: '' ]
		
		raise:  Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixCannotBeEmptyError ].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:45:56'!
test02prefixCannotContainEmptySpaces

	stack := OOStack  new. 
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.
	
	stack push: 'Como estas'.
		
	self
		should: [ sentenceFinderByPrefix find: 'Como estas' ]
		
		raise:  Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixCannotIncludeEmptySpacesError ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:45:39'!
test03cannotFindAPrefixInEmptyStack
	
	stack := OOStack  new. 
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.
	
	self assert: (	(sentenceFinderByPrefix find: 'hola') size = 0).
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:44:31'!
test04findingPrefixWithOneOcurrenceInStack
	
	|result |
	
 	stack := OOStack new.
	
	stack push: 'Hola'.
	stack push: ' Como'.
	stack push: ' Estas'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.	
	
	result := sentenceFinderByPrefix find: 'Hol'.
	
	self assert: result size equals: 1.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:44:45'!
test05findingPrefixWithMultipleOcurrencesInStack
	
	|result |
	
	stack := OOStack new.
	
	stack push: 'Hola'.
	stack push: 'Hola'.
	stack push: 'Como va'.
	stack push: 'Hoy bien'.
	stack push: 'Chau'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.	
	
	result := sentenceFinderByPrefix find: 'Ho'.
	
	self assert: result size equals: 3.
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FF 10/14/2022 13:51:00'!
test06FindingOperationDoesNotChangeStack

	|stringCollection|
	
	stack := OOStack new.
	
	stack push: 'Hola'.
	stack push: 'Hola'.
	stack push: 'Como va'.
	stack push: 'Hoy bien'.
	stack push: 'Chau'.
	
	stringCollection := OrderedCollection new.
	
	stringCollection addAll: #( 'Hola' 'Hola' 'Como va'  'Hoy bien' 'Chau').
	
	sentenceFinderByPrefix := SentenceFinderByPrefix with: stack.	
	
	sentenceFinderByPrefix find: 'Ho'.
	
	self assert: (self stackOrderOf: stack  isEqualTo: stringCollection). 

! !


!SentenceFinderByPrefixTest methodsFor: 'testing - private' stamp: 'FF 10/14/2022 00:23:43'!
stackOrderOf: aStack isEqualTo: anOrderedCollection 
	| auxiliarStack stackCollection |
	
	auxiliarStack := OOStack new.
	stackCollection := OrderedCollection new.
	
	[ aStack isEmpty not ] whileTrue: [
		| currentElement |
		
		currentElement := aStack pop.
		
		auxiliarStack push: currentElement.	
		stackCollection add: currentElement.
	].

	self transfer: auxiliarStack to: aStack.

	^stackCollection reverse isEqualTo: anOrderedCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'testing - private' stamp: 'sc 10/14/2022 12:56:27'!
transfer: aStack to: anotherStack

    [aStack isEmpty not] whileTrue: [
        anotherStack push: aStack pop.
    ]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackCollection maximumSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'FF 10/13/2022 23:38:55'!
canObtainTopFromStack

	^stackCollection first.! !

!OOStack methodsFor: 'private' stamp: 'FF 10/13/2022 23:39:00'!
canPopFromStack

	^stackCollection removeFirst.! !

!OOStack methodsFor: 'private' stamp: 'FF 10/13/2022 23:39:07'!
canPushToStack: aString

	stackCollection addFirst: aString .! !

!OOStack methodsFor: 'private' stamp: 'FF 10/13/2022 23:40:27'!
currentState

	| subclasses currentState |

	subclasses := OOStateOfStack subclasses.
	
	currentState := subclasses detect: [ :aState | aState validStateForStackWith: self isEmpty and: self isFull. ].

	^currentState new.! !


!OOStack methodsFor: 'operation' stamp: 'sc 10/13/2022 20:57:16'!
isEmpty
	
	^stackCollection isEmpty.! !

!OOStack methodsFor: 'operation' stamp: 'FF 10/13/2022 23:38:12'!
isFull
	
	^stackCollection size = maximumSize.! !

!OOStack methodsFor: 'operation' stamp: 'FF 10/13/2022 23:48:45'!
pop

	^self currentState pop: self.! !

!OOStack methodsFor: 'operation' stamp: 'FF 10/13/2022 23:49:12'!
push: aString 

	self currentState push: aString to: self.! !

!OOStack methodsFor: 'operation' stamp: 'sc 10/13/2022 21:16:31'!
size

	^stackCollection size.! !

!OOStack methodsFor: 'operation' stamp: 'FF 10/13/2022 23:49:38'!
top

	^self currentState top: self. 
	
	

	! !


!OOStack methodsFor: 'errors' stamp: 'sc 10/13/2022 22:30:36'!
emptyStackError

	^ self error: self class stackEmptyErrorDescription.
	! !

!OOStack methodsFor: 'errors' stamp: 'FF 10/14/2022 00:08:38'!
fullStackError: aString 

	^self error: self class stackFullErrorDescription. ! !


!OOStack methodsFor: 'initialization' stamp: 'FF 10/13/2022 23:37:07'!
initialize

	stackCollection:= OrderedCollection new.
	maximumSize := infinity.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'sc 10/13/2022 22:54:21'!
stackFullErrorDescription

	^'Stack is full '. ! !


!classDefinition: #OOStateOfStack category: 'Stack-Exercise'!
Object subclass: #OOStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:24:48'!
pop:anOOStack

	self subclassResponsibility! !

!OOStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:24:17'!
push:aString to: anOOStack

	self subclassResponsibility! !

!OOStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:25:42'!
top:anOOStack
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStateOfStack class' category: 'Stack-Exercise'!
OOStateOfStack class
	instanceVariableNames: ''!

!OOStateOfStack class methodsFor: 'testing' stamp: 'FF 10/13/2022 23:40:56'!
validStateForStackWith: aStackIsEmptyBoolean and: aStackIsFullBoolean

	self subclassResponsibility.! !


!classDefinition: #OOEmptyStateOfStack category: 'Stack-Exercise'!
OOStateOfStack subclass: #OOEmptyStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:27:49'!
pop: anOOStack

	^anOOStack emptyStackError. ! !

!OOEmptyStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:34:00'!
push: aString to: anOOStack

	^anOOStack canPushToStack: aString. ! !

!OOEmptyStateOfStack methodsFor: 'operation' stamp: 'sc 10/13/2022 22:32:25'!
top: anOOStack

	^anOOStack emptyStackError. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStateOfStack class' category: 'Stack-Exercise'!
OOEmptyStateOfStack class
	instanceVariableNames: ''!

!OOEmptyStateOfStack class methodsFor: 'testing' stamp: 'FF 10/13/2022 23:42:22'!
validStateForStackWith: aStackIsEmptyBoolean and: aStackIsFullBoolean

	^aStackIsEmptyBoolean and: aStackIsFullBoolean not.! !


!classDefinition: #OOFullStateOfStack category: 'Stack-Exercise'!
OOStateOfStack subclass: #OOFullStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:07:38'!
pop: anOOStack

	^anOOStack canPopFromStack.
	! !

!OOFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:08:17'!
push: aString to: anOOStack

	^anOOStack fullStackError: aString.

	! !

!OOFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:09:25'!
top:anOOStack

	^anOOStack canObtainTopFromStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOFullStateOfStack class' category: 'Stack-Exercise'!
OOFullStateOfStack class
	instanceVariableNames: ''!

!OOFullStateOfStack class methodsFor: 'testing' stamp: 'FF 10/13/2022 23:43:21'!
validStateForStackWith: aStackIsEmptyBoolean and: aStackIsFullBoolean

	^aStackIsEmptyBoolean not and: 	aStackIsFullBoolean.! !


!classDefinition: #OONotEmptyAndNotFullStateOfStack category: 'Stack-Exercise'!
OOStateOfStack subclass: #OONotEmptyAndNotFullStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmptyAndNotFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:10:06'!
pop: anOOStack

	^anOOStack canPopFromStack.! !

!OONotEmptyAndNotFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:10:47'!
push:aString to: anOOStack

	^anOOStack  canPushToStack: aString.! !

!OONotEmptyAndNotFullStateOfStack methodsFor: 'operation' stamp: 'FF 10/14/2022 00:11:11'!
top: anOOStack

	^anOOStack canObtainTopFromStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyAndNotFullStateOfStack class' category: 'Stack-Exercise'!
OONotEmptyAndNotFullStateOfStack class
	instanceVariableNames: ''!

!OONotEmptyAndNotFullStateOfStack class methodsFor: 'testing' stamp: 'FF 10/13/2022 23:45:17'!
validStateForStackWith: aStackIsEmptyBoolean and: aStackIsFullBoolean

	^aStackIsEmptyBoolean not and: aStackIsFullBoolean not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentenceStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'FF 10/14/2022 00:14:11'!
find: aPrefix
	
	self assertValidPrefix: aPrefix.
	
	^self sentencesThatBeginWith: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'sc 10/14/2022 13:00:37'!
assertValidPrefix: aPrefix
	
	(aPrefix includes: $ ) ifTrue: [^self error: 	self class prefixCannotIncludeEmptySpacesError ].
	(aPrefix size = 0) ifTrue: [^self error: self class prefixCannotBeEmptyError ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FF 10/14/2022 00:14:50'!
sentencesThatBeginWith: aPrefix
	
	| auxiliaryStack aCollection |
	
	auxiliaryStack := OOStack new.
	
	aCollection := OrderedCollection new.
	
	[ sentenceStack isEmpty not ] whileTrue: [	 
		| sentence |
		sentence := sentenceStack pop.
		auxiliaryStack push: sentence.
		
		(sentence beginsWith: aPrefix) ifTrue: [ aCollection add: sentence ].		
	].

	self transferBack: auxiliaryStack.
	
	^aCollection! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FF 10/14/2022 00:15:20'!
transferBack: aStack

	[ aStack isEmpty not ] whileTrue: [
		sentenceStack push: aStack pop.
	].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FF 10/14/2022 00:13:40'!
initializeWithMaximumSize: aSentenceStack

	sentenceStack := aSentenceStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'FF 10/14/2022 00:16:37'!
with: aSentenceStack

	^self new initializeWithMaximumSize: aSentenceStack.! !


!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'FF 10/14/2022 00:17:00'!
prefixCannotBeEmptyError
	
	^'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'FF 10/14/2022 00:16:49'!
prefixCannotIncludeEmptySpacesError
	
	^'Prefix cannot include empty spaces'! !
