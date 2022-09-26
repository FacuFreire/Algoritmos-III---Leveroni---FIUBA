!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 00:47:15'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	| customerBook |
	
	customerBook := CustomerBook new.
	
	self should: [customerBook addCustomerNamed: 'John Lennon'.] notTakeMoreThan: 50 milliSeconds.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 00:49:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self customerBookWithOneCustomer: paulMcCartney.
	
	self should: [customerBook removeCustomerNamed: paulMcCartney.] notTakeMoreThan: 100 milliSeconds.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 01:28:08'!
test03CanNotAddACustomerWithEmptyName 

    | customerBook |

    customerBook := CustomerBook new.

    self given: [ customerBook addCustomerNamed: ''.] shouldRaise: Error asserting: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 
		self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 01:20:12'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	
	customerBook := self customerBookWithOneCustomer: johnLennon.
	
	self given: [ customerBook removeCustomerNamed: 'Paul McCartney'.] shouldRaise: NotFound asserting: 
	[ :anError | self testThat: customerBook hasASingleCustomerWhichIs: johnLennon. ]


	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 00:59:11'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self customerBookWithOneSuspendedCustomer:paulMcCartney.
	
	self testNumberOfCustomersFrom: customerBook active: 0 suspended: 1 total: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 01:01:05'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self customerBookWithOneSuspendedCustomer:paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.
	
	self testNumberOfCustomersFrom: customerBook active: 0 suspended: 0 total: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 01:20:21'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon|
	
	johnLennon := 'John Lennon'.
	
	customerBook := self customerBookWithOneCustomer: johnLennon.
	
	 self given: [customerBook suspendCustomerNamed: 'Ringo Starr'.] shouldRaise: CantSuspend asserting:
        [:anError | self testThat: customerBook hasASingleCustomerWhichIs: johnLennon. ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FF 9/26/2022 01:20:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook johnLennon |
	
	johnLennon := 		'John Lennon'.
	customerBook := self customerBookWithOneSuspendedCustomer: johnLennon.
	
	self given: [ customerBook suspendCustomerNamed: johnLennon.] shouldRaise: CantSuspend asserting:
        [:anError | self testThat: customerBook hasASingleCustomerWhichIs: johnLennon.]! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'FF 9/26/2022 00:46:20'!
customerBookWithOneCustomer: aName

	| customerBook |

	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aName.
	^customerBook

! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FF 9/26/2022 00:58:22'!
customerBookWithOneSuspendedCustomer: aName

	| customerBook |

	customerBook := self customerBookWithOneCustomer: aName.
	customerBook suspendCustomerNamed: aName.
	^customerBook! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FF 9/26/2022 00:32:10'!
given: aBlockClosure shouldRaise: anError asserting: assertionBlock
    [ aBlockClosure value. self fail ] on: anError do: assertionBlock! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'ML 5/18/2021 00:20:18'!
testNumberOfCustomersFrom: aCustomerBook active: activeCustomers  suspended: suspendedCustomers total: totalCustomers

	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'ML 5/18/2021 00:28:29'!
testThat: aCustomerBook hasASingleCustomerWhichIs: customerName

	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: customerName).

! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'ML 5/18/2021 00:40:59'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'ML 5/18/2021 00:58:09'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ML 5/18/2021 00:53:23'!
removeCustomerNamed: aName 

	(self removeCustomerNamed: aName from: active) = aName
		ifTrue: [ ^aName ].

	(self removeCustomerNamed: aName from: suspended) = aName
		ifTrue: [ ^aName ].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'ML 5/18/2021 23:27:43'!
removeCustomerNamed: aName from: aCollection

	aCollection remove: aName ifAbsent: [^NotFound].
	
	^aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'ML 5/18/2021 01:00:12'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	active remove: aName.
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'ML 5/18/2021 00:54:16'!
numberOfActiveCustomers

	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'ML 5/18/2021 00:55:26'!
numberOfCustomers

	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'ML 5/18/2021 00:54:30'!
numberOfSuspendedCustomers

	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'ML 5/18/2021 00:55:55'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'ML 5/18/2021 00:56:02'!
isEmpty

	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'ML 5/18/2021 00:56:28'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'ML 5/18/2021 01:04:17'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'ML 5/18/2021 01:05:03'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'ML 5/18/2021 01:04:54'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
