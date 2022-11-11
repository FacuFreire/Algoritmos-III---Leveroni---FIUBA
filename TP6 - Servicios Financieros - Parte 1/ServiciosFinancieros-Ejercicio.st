!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'firstAccount secondAccount thirdAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:03'!
test01PortfolioBalanceIsEqualAccountBalance

	|portfolio |
	

	
	
	Deposit register: (100*peso) on: firstAccount .
	Deposit register: (100*peso) on:secondAccount .
	
	portfolio:= Portfolio with:{firstAccount .secondAccount }.
	
	
	self assert: portfolio balance equals: 200*peso.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:03'!
test02PortfolioWithTransactionsReturnsTrueWhenAskedIfAnAccountHasRegisteredATransaction

	|portfolio  deposit withdraw |
	
	
	
	deposit:=Deposit register: (100*peso) on: firstAccount .
	withdraw:=Withdraw register: (100*peso) on:secondAccount .
	
	portfolio:= Portfolio with:{firstAccount . secondAccount }.
	
	self assert: true equals: (portfolio hasRegistered: deposit).
	self assert: true equals: (portfolio hasRegistered: withdraw ).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/10/2022 23:04:43'!
test03AnEmptyPortfolioDoesNotHaveTransactions

	|emptyPortfolio |
	
	emptyPortfolio:= Portfolio with:{}.
	
	
	self assert: (emptyPortfolio transactions isEmpty ).
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:03'!
test04PortfolioKnowsAllItsTransactions
	
	|secondTransaction firstTransaction portfolio|
	
	
	firstTransaction :=Deposit register: (100*peso) on: firstAccount .
	secondTransaction :=Withdraw register: (100*peso) on: secondAccount .
	
	portfolio := Portfolio with:{firstAccount .secondAccount }.
	
	
	self assert: (portfolio transactions first ) equals: firstTransaction .
	self assert: (portfolio transactions last ) equals: secondTransaction! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:57:46'!
test05PortfolioCannotRegisterTheSameAccount
	
	| portfolio|

	
	Deposit register: (100*peso) on: firstAccount .
	
	portfolio := Portfolio with:{firstAccount }. 
	
	self
        		should: [portfolio registerAccount: firstAccount .]
        		raise: Error
        		withExceptionDo: [: anError | 
            			self assert: anError messageText = Portfolio cannotRegisterTheSameAccountTwiceErrorDescription].

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:58:01'!
test06PortfolioCannotRegisterAnAccountIncludeInAnotherPortfolio
	
	|firstPortfolio|
	
	
	
	Deposit  register: 100*peso  on: firstAccount .
	
	firstPortfolio := Portfolio with:{firstAccount }. 
	 
	self
        		should: [ Portfolio with: {firstAccount . firstPortfolio }.]
        		raise: Error
        		withExceptionDo: [: anError | 
            			self assert: anError messageText = Portfolio cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription].

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:55:51'!
test07PortfolioCannotRegisterAnAccountToAPortfolioWhenThisOneIsAlreadySonOfAnotherFatherPortfolio
	
	| firstPortfolio secondPortfolio|
	
	
	
	Deposit  register: 100*peso  on: firstAccount .
	
	firstPortfolio := Portfolio with:{ firstAccount }.
	
	secondPortfolio := Portfolio with:{firstAccount }.
	
	self
        		should: [ firstPortfolio registerAccount: secondPortfolio ]
        		raise: Error
        		withExceptionDo: [: anError | 
            			 anError messageText = Portfolio cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription].
	
	
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:55:51'!
test08PortfolioCannotIncludedHisSelf
	
	|firstPortfolio |
	
	
	
	Deposit  register: 100*peso  on: firstAccount .
	
	firstPortfolio := Portfolio with:{ firstAccount }.
	
	self
        		should: [ firstPortfolio registerAccount: firstPortfolio ]
        		raise: Error
        		withExceptionDo: [: anError | 
            			 anError messageText = Portfolio cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription].
	
	
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 00:30:03'!
test09AnEmptyPortfolioHasZeroBalance

	|emptyPortfolio |
	
	emptyPortfolio:= Portfolio with:{}.
	
	
	self assert: 0*peso equals: emptyPortfolio balance .
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:13'!
test10PortfolioWithAnotherPortfoliHasTheSameBalanceAsSumOfAllAccountBalances

	| firstPortofolio secondPortfolio|
	
	
	Deposit register: 100*peso on: firstAccount .
	Deposit register: 200*peso on: secondAccount . 
	Deposit register: 300*peso on: thirdAccount .
	
	firstPortofolio := Portfolio with: {firstAccount .secondAccount }.
	secondPortfolio := Portfolio with: {firstPortofolio .thirdAccount }.
	
	
	self assert: 600*peso equals: secondPortfolio balance .
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:03'!
test11PortfolioWithPortfolioWithTransactionsReturnsTrueWhenAskedIfAnAccountHasRegisteredATransaction

	|firstPortfolio secondPortfolio  deposit withdraw |
	
	
	
	deposit:=Deposit register: (100*peso) on: firstAccount .
	withdraw:=Withdraw register: (100*peso) on: secondAccount .
	
	firstPortfolio := Portfolio with:{firstAccount }.
	secondPortfolio :=Portfolio with:{firstPortfolio .secondAccount }.
	
	self assert: true equals: (secondPortfolio hasRegistered: deposit).
	self assert: true equals: (secondPortfolio hasRegistered: withdraw ).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:56:03'!
test12PortfolioWithPortfolioKnowsAllItsTransactions

	| firstPortfolio secondPortfolio transactions firstTransaction secondTransaction |


	
	
	firstTransaction:=Deposit register: 200*peso on: firstAccount .
	secondTransaction:=Deposit register: 250*peso on: secondAccount .
	
    	firstPortfolio := Portfolio with: {firstAccount }.
    	secondPortfolio := Portfolio with: {firstPortfolio . secondAccount }.
	
    	transactions := OrderedCollection new.

    	transactions addAll: {firstTransaction. secondTransaction}.

   	 self assert: transactions equals: (secondPortfolio transactions)
! !


!PortfolioTest methodsFor: 'setup' stamp: 'sc 11/11/2022 01:56:13'!
setUp

	
	firstAccount:= ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	thirdAccount := ReceptiveAccount new.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount aDeposit aWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'withdraw' stamp: 'sc 11/11/2022 01:20:35'!
createAWithdraw: amountValue

	^ Withdraw register: amountValue on: anAccount! !

!ReceptiveAccountTest methodsFor: 'withdraw' stamp: 'sc 11/11/2022 01:20:49'!
test03WithdrawDecreasesBalanceOnTransactionValue 


	self createADeposit: 100*peso.
	self createAWithdraw: 50*peso.
	
	self assert: 50 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'withdraw' stamp: 'sc 11/11/2022 01:22:24'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (self createAWithdraw: withdrawValue ) value
! !


!ReceptiveAccountTest methodsFor: 'deposit' stamp: 'sc 11/11/2022 01:16:46'!
createADeposit: amountValue

	^ Deposit register: amountValue on: anAccount! !

!ReceptiveAccountTest methodsFor: 'deposit' stamp: 'sc 11/11/2022 01:19:20'!
test02DepositIncreasesBalanceOnTransactionValue

	
	
	self createADeposit: 100*peso.
	
	self assert:100*peso equals: anAccount balance
! !


!ReceptiveAccountTest methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:11:47'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 


	self assert: 0 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:24:25'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	
	self assert: (anAccount hasRegistered: (self createADeposit: 100*peso)) .
	self assert: (anAccount hasRegistered: (self createAWithdraw: 50*peso)).
! !

!ReceptiveAccountTest methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:27:01'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	|  deposit withdraw |
	
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (anAccount hasRegistered: deposit).
	self deny: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:29:35'!
test07AccountKnowsItsTransactions 

	|  deposit |
	
	
	
	deposit := self createADeposit: 50 * peso.
		
	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setup' stamp: 'sc 11/11/2022 01:30:00'!
setUp

	
	anAccount := ReceptiveAccount new.
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'senderAccount receiverAccount transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:44:31'!
test01TransferAValueFromASenderAccountToAReceiverAccountIsCorrect

	
	
	self createADeposit: 500*peso.
	
	self createATransferWithAValue: 200*peso.
	
	self assert: transfer value  equals: 200*peso. 
	self assert: transfer deposit value equals: 200*peso.
	self assert: transfer withdraw value equals: 200*peso.
	! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:40:34'!
test02TransferAValueUpdateBalance

	self createADeposit: 500*peso.
	self createATransferWithAValue: 200*peso.
	
	
	self assert: 200*peso  equals: receiverAccount balance. 
	self assert: 300*peso  equals: senderAccount balance.
	! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:44:31'!
test03TransferDepositCounterpartIsATransferWithdraw

	self createADeposit: 500*peso.
	
	self createATransferWithAValue: 200*peso.
	
	
	self assert:  (transfer deposit) counterpart equals: transfer withdraw. 
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:44:31'!
test04TransferWithdrawCounterpartIsATransferDeposit
	
	self createADeposit: 500*peso.
	
	self createATransferWithAValue: 200*peso.
	
	self assert:  (transfer withdraw ) counterpart equals: transfer deposit . ! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:43:00'!
test05AnAccountWithInsufficientFondsCanNotTransfer

	self createADeposit: 0*peso.
	self
        		should: [self createATransferWithAValue: 200*peso.]
        		raise: Error
        		withExceptionDo: [: anError | 
            			self assert: anError messageText = Transfer insufficientFundsErrorDescription].
! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:58:54'!
test06ATransferCannotBeDoneToTheSameAccount

	self createADeposit: 500*peso.
	
	

    self
        should: [Transfer transfer: (200* peso) from: senderAccount to: senderAccount .]
        raise: Error
        withExceptionDo: [: anError | 
            self assert: anError messageText = Transfer canNotTransferTheSameAccountErrorDescription].
! !

!TransferTest methodsFor: 'tests' stamp: 'sc 11/11/2022 01:59:12'!
test07ATransferValueCannotBeNegative

	self createADeposit: 500*peso.
	

    self
        should: [self createATransferWithAValue: (-200*peso).]
        raise: Error
        withExceptionDo: [: anError | 
            self assert: anError messageText = Transfer canNotTransferANegativeValueErrorDescription].
! !


!TransferTest methodsFor: 'transfer' stamp: 'sc 11/11/2022 01:44:31'!
createATransferWithAValue: aTransferValue

	transfer:= Transfer transfer: aTransferValue from:senderAccount to: receiverAccount. ! !


!TransferTest methodsFor: 'deposit' stamp: 'sc 11/11/2022 01:35:05'!
createADeposit: amountValue

	^ Deposit register: amountValue on: senderAccount .! !


!TransferTest methodsFor: 'setup' stamp: 'sc 11/11/2022 01:33:09'!
setUp

	
	senderAccount:= ReceptiveAccount  new.
	receiverAccount := ReceptiveAccount new.
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:02:32'!
hasRegistered: aTransaction

	self  subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'sc 11/11/2022 01:03:38'!
transactions

	self  subclassResponsibility ! !


!Account methodsFor: 'accounts' stamp: 'sc 11/11/2022 01:01:17'!
accounts

	self  subclassResponsibility ! !

!Account methodsFor: 'accounts' stamp: 'sc 11/11/2022 01:01:35'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'accounts' stamp: 'sc 11/11/2022 01:03:04'!
includes:anAccountToCheck

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'sc 11/10/2022 22:45:12'!
initializeWith: aCollectionOfAccounts

	accounts := aCollectionOfAccounts asOrderedCollection.
	
	
	! !


!Portfolio methodsFor: 'asserts' stamp: 'sc 11/10/2022 21:42:43'!
assertErrorAccountToRegisterDoesNotInvolveSelf: anAccount.

	(self  includesAccount: anAccount) ifTrue: [ self error: Portfolio cannotRegisterTheSameAccountTwiceErrorDescription ].
	
	! !

!Portfolio methodsFor: 'asserts' stamp: 'sc 11/10/2022 23:24:01'!
assertErrorAccountToRegisterIsNotAlreadyInPortfolio: anAccountToRegister

	(accounts anySatisfy: [:anAccount |anAccountToRegister includes: anAccount ]) ifTrue: [self error: Portfolio cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription].
	! !


!Portfolio methodsFor: 'accounts' stamp: 'sc 11/10/2022 23:15:24'!
accounts
	
	| auxiliaryAccountCollection | 
    	auxiliaryAccountCollection := OrderedCollection new.

    ^accounts do: [:anAccount | auxiliaryAccountCollection addAll: anAccount accounts].! !

!Portfolio methodsFor: 'accounts' stamp: 'sc 11/10/2022 22:45:12'!
balance

	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'accounts' stamp: 'sc 11/10/2022 22:49:45'!
includes:anAccountToCheck

	^(accounts anySatisfy: [:anAccount| anAccount includesAccount: anAccountToCheck ]).! !

!Portfolio methodsFor: 'accounts' stamp: 'sc 11/10/2022 22:45:12'!
includesAccount: anAccount

	^(self == anAccount ) or: (accounts includes: anAccount)
	
	! !

!Portfolio methodsFor: 'accounts' stamp: 'sc 11/10/2022 22:45:12'!
registerAccount: anAccount


	self assertErrorAccountToRegisterDoesNotInvolveSelf: anAccount .
	self assertErrorAccountToRegisterIsNotAlreadyInPortfolio: anAccount.
	
	accounts add: anAccount.
	
	! !


!Portfolio methodsFor: 'transactions' stamp: 'sc 11/10/2022 22:45:12'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'transactions' stamp: 'sc 11/10/2022 22:45:12'!
transactions

	|portfoliosTransactions|
	
	portfoliosTransactions := OrderedCollection new.
	
	accounts do: [:anAccount| portfoliosTransactions addAll: anAccount transactions ].
	
	^portfoliosTransactions 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'sc 11/10/2022 23:20:20'!
assertAccountsAreNotRepeated:anArrayOfAccounts

    | auxiliaryCollectionOfAccounts |

    auxiliaryCollectionOfAccounts := OrderedCollection new.
    anArrayOfAccounts do: [:anAccount | auxiliaryCollectionOfAccounts addAll: anAccount accounts].
    (auxiliaryCollectionOfAccounts asSet size = auxiliaryCollectionOfAccounts size) ifFalse: [self error: self cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription ]! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'sc 11/10/2022 21:42:20'!
cannotRegisterAnAccountThatIsAlreadyInAnotherPortfolioErrorDescription

	^'The account is already registered in portfolio'. ! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'sc 11/10/2022 21:42:43'!
cannotRegisterTheSameAccountTwiceErrorDescription

	^'Portfolio can not register the same account twice'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'sc 11/10/2022 23:12:21'!
with: anArrayOfAccounts

	self assertAccountsAreNotRepeated: anArrayOfAccounts.

	^self new initializeWith: anArrayOfAccounts. 
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'sc 11/9/2022 10:27:37'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'sc 11/9/2022 10:28:04'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'sc 11/9/2022 10:28:10'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'accounts' stamp: 'sc 11/10/2022 23:15:42'!
accounts
	
	^OrderedCollection with: self. ! !

!ReceptiveAccount methodsFor: 'accounts' stamp: 'sc 11/9/2022 11:26:13'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueWithSign ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'accounts' stamp: 'sc 11/9/2022 10:27:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'accounts' stamp: 'sc 11/10/2022 22:47:35'!
includes:anAccountToCheck
	
	^(self == anAccountToCheck )! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'sc 11/9/2022 10:26:58'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'sc 11/11/2022 00:06:33'!
valueWithSign

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'sc 11/11/2022 00:06:06'!
initializeFor: aTransfer

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'counterpart' stamp: 'sc 11/11/2022 00:06:53'!
counterpart

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'intialization' stamp: 'sc 11/9/2022 10:28:35'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'sc 11/9/2022 10:27:17'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'sc 11/9/2022 10:27:08'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'sc 11/9/2022 11:25:55'!
valueWithSign

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'initialization' stamp: 'sc 11/9/2022 10:29:10'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'counterpart' stamp: 'sc 11/10/2022 01:21:27'!
counterpart

	^transfer withdraw.! !


!TransferDeposit methodsFor: 'value' stamp: 'sc 11/10/2022 01:01:07'!
value

	^transfer value! !

!TransferDeposit methodsFor: 'value' stamp: 'sc 11/10/2022 00:59:45'!
valueWithSign

	^ transfer value! !


!TransferDeposit methodsFor: 'initialization' stamp: 'sc 11/10/2022 01:00:55'!
initializeFor: aTransfer

	transfer:= aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'intialization' stamp: 'sc 11/10/2022 00:55:55'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !

!TransferDeposit class methodsFor: 'intialization' stamp: 'sc 11/10/2022 01:13:00'!
register: aTransfer on: account

	| transaction |
	
	transaction := self for: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'value' stamp: 'sc 11/10/2022 00:54:35'!
value

	^ transfer value! !

!TransferWithdraw methodsFor: 'value' stamp: 'sc 11/10/2022 01:01:21'!
valueWithSign

	^ (transfer value *(-1))! !


!TransferWithdraw methodsFor: 'counterpart' stamp: 'sc 11/10/2022 01:27:34'!
counterpart

	^transfer deposit.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'sc 11/10/2022 01:01:29'!
initializeFor: aTransfer

	transfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'intialization' stamp: 'sc 11/10/2022 00:56:11'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !

!TransferWithdraw class methodsFor: 'intialization' stamp: 'sc 11/10/2022 01:13:09'!
register: aTransfer on: account

	| transaction |
	
	transaction := self for: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'sc 11/9/2022 10:27:26'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'sc 11/9/2022 11:24:37'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'sc 11/9/2022 11:25:35'!
valueWithSign

	^ (self value *(-1))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'intialization' stamp: 'sc 11/9/2022 10:29:00'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value deposit withdraw receiverAccount senderAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'deposit' stamp: 'sc 11/9/2022 12:33:48'!
deposit

	^deposit.! !


!Transfer methodsFor: 'values' stamp: 'sc 11/9/2022 12:19:11'!
value

	^value. ! !


!Transfer methodsFor: 'extractions' stamp: 'sc 11/10/2022 01:05:40'!
withdraw

	^withdraw ! !


!Transfer methodsFor: 'initialization' stamp: 'sc 11/10/2022 01:26:13'!
initializeWithAValue: aValue from: aSenderAccount to: aReceiverAccount 
	
	receiverAccount:=aReceiverAccount.
	senderAccount:=aSenderAccount .
	value:= aValue.
	
	deposit:= TransferDeposit register: self on: aReceiverAccount.
	withdraw := TransferWithdraw register: self on: aSenderAccount.
	
	 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'initialization' stamp: 'sc 11/10/2022 10:37:33'!
transfer: aValue from: aSenderAccount to: aReceiverAccount

	self check: aSenderAccount hasMoreMoneyThanAReceiverAccount: aValue.
	self check: aSenderAccount isDifferentFromTheReceiverAccount: aReceiverAccount .
	self checkAValueIsPositive: aValue .

	^self new initializeWithAValue:aValue from:aSenderAccount  to: aReceiverAccount.
	! !


!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 10:36:56'!
canNotTransferANegativeValueErrorDescription

	^'A transfer value can not be negative'.! !

!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 10:28:33'!
canNotTransferTheSameAccountErrorDescription

	^'Can not transfer to the same account'.! !

!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 01:40:33'!
check: aSenderAccount hasMoreMoneyThanAReceiverAccount: aValue
	
	(aSenderAccount balance < aValue) ifTrue:[ self error: Transfer insufficientFundsErrorDescription ].! !

!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 10:33:22'!
check: aSenderAccount isDifferentFromTheReceiverAccount: aReceiverAccount 
	
		(aSenderAccount = aReceiverAccount) ifTrue: [self error: Transfer canNotTransferTheSameAccountErrorDescription ].! !

!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 10:38:38'!
checkAValueIsPositive: aValue
	
	
	(aValue < 0) ifTrue: [self error: Transfer canNotTransferANegativeValueErrorDescription ].! !

!Transfer class methodsFor: 'error' stamp: 'sc 11/10/2022 01:31:33'!
insufficientFundsErrorDescription

	^'Error insufficient funds'.! !
