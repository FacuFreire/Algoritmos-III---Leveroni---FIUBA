!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'account anotherAccount aReceiverAccount aSenderAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'asserts' stamp: 'sc 11/18/2022 02:27:48'!
assertAccountSummaryFor: anAccountToBeReported is: anExpectedSummary

	self assert: anExpectedSummary equals: (AccountSummary for:anAccountToBeReported ) generateReport.! !


!AccountSummaryTest methodsFor: 'setup' stamp: 'sc 11/18/2022 02:37:25'!
setUp

	account := ReceptiveAccount new.
    	aReceiverAccount := ReceptiveAccount new.
    	aSenderAccount := ReceptiveAccount new! !


!AccountSummaryTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:26:14'!
test01AccountWithNoTransactionsHasZeroBalanceInAccountSummary

	| expectedSummary |
	
	
	expectedSummary:= OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assertAccountSummaryFor: account is: expectedSummary.
	
	
	
	
	
	
		! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:30:06'!
test02ReceptiveAccountWithDepositHasDepositAndBalanceInAccountSummary

	| expectedSummary |
	
	
	Deposit register: 20*peso on: account.
	
	expectedSummary:= OrderedCollection new.
	
	expectedSummary add: 'Depósito por 20 * pesos'.
	expectedSummary add: 'Balance = 20 * pesos'.
	
	self assertAccountSummaryFor: account is: expectedSummary .
	
	
	
	
	
	
		! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:32:09'!
test03ReceptiveAccountWithOutgoingTransferHasOutgoingTransferAndBalanceInAccountSummary

	| expectedSummary |
	
	
	Transfer amount: 20*peso from: aSenderAccount to: aReceiverAccount.
	
	expectedSummary:= OrderedCollection new.
	
	expectedSummary add: 'Salida por transferencia de 20 * pesos'.
	expectedSummary add: 'Balance = -20 * pesos'.
	
	self assertAccountSummaryFor: aSenderAccount is:  expectedSummary 
	
	
	
	
	
	
		! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:34:24'!
test04ReceptiveAccountWithIncomingTransferHasIncomingTransferAndBalanceInAccountSummary

	| expectedSummary |
	
	
	
	Transfer amount: 20*peso from: aSenderAccount to: aReceiverAccount. 
	
	
	expectedSummary:= OrderedCollection new.
	
	expectedSummary add: 'Entrada por transferencia de 20 * pesos'.
	expectedSummary add: 'Balance = 20 * pesos'.
	
	self assertAccountSummaryFor: aReceiverAccount is: expectedSummary .
	
	
	
	
	
	
		! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:37:02'!
test05ReceptiveAccountWithMultipleTransactionsHasThemIncludedInAccountSummary

	| expectedSummary |
	
	
	Deposit register: 30*peso on: aSenderAccount .
	Withdraw register: 20*peso on: aSenderAccount .
	
	Transfer amount: 50*peso from: aSenderAccount to: aReceiverAccount .
	Transfer amount: 100*peso from: aReceiverAccount to: aSenderAccount .
	
	
	expectedSummary:= OrderedCollection new.
	
	expectedSummary add: 'Depósito por 30 * pesos'.
	expectedSummary add: 'Extracción por 20 * pesos'.
	expectedSummary add: 'Salida por transferencia de 50 * pesos'.
	expectedSummary add: 'Entrada por transferencia de 100 * pesos'.
	expectedSummary add: 'Balance = 60 * pesos'.
	
	self assertAccountSummaryFor: aSenderAccount is: expectedSummary .
	
	
	
	
	
	
		! !


!classDefinition: #NetTransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #NetTransferTest
	instanceVariableNames: 'account anotherAccount externalAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransferTest methodsFor: 'setup' stamp: 'sc 11/18/2022 02:39:06'!
setUp

	account:= ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	externalAccount:= ReceptiveAccount new.! !


!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:41:05'!
test01AccountWithNoTransfersHasZeroNetTransferValue
	

	
	self assertNetTransferFor:account isEquals: 0*peso.! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:44:06'!
test02AccountWithTransferDepositHasTransferValueAsNetTransferValue

	
	
	
	Transfer amount: 20*peso from: anotherAccount to: account .
	
	
	self assertNetTransferFor: account isEquals: 20*peso.! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:45:34'!
test03AccountWithTransferWithdrawHasNegativeTransferValueAsNetTransferValue

	
	Transfer amount: 20*peso from:  account to: anotherAccount .
	self assertNetTransferFor: account isEquals: -20*peso.! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:47:08'!
test04AccountWithMultipleTransfersHasCorrectNetTransferValue


	Transfer amount: 10*peso from:  account to: anotherAccount .
	Transfer amount: 20*peso  from: anotherAccount to: account .
	
	self assertNetTransferFor: account isEquals: 10*peso.! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:47:57'!
test05NetTransferIgnoresDepositTransaction

	
	
	Deposit register: 10*peso on: account .
	
	self assertNetTransferFor: account isEquals: 0*peso. ! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:48:47'!
test06NetTransferIgnoresWithdrawTransaction

	
	Withdraw register: 10*peso on: account .
	
	self assertNetTransferFor: account isEquals: 0*peso.! !

!NetTransferTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:50:55'!
test07PortfolioWithMultipleTransfersHasCorrectNetTransferValue
    |  aPortfolio  |

    aPortfolio := Portfolio with: account with: anotherAccount.

    Transfer amount: 10 * peso from: account to: anotherAccount .
    Transfer amount: 20 * peso from: anotherAccount to: externalAccount .

    self assertNetTransferFor: aPortfolio isEquals: -20*peso.! !


!NetTransferTest methodsFor: 'asserts' stamp: 'sc 11/18/2022 02:42:22'!
assertNetTransferFor:anAccountToBeReported isEquals:anExpectedValue

	self assert: anExpectedValue equals: (NetTransfer for: anAccountToBeReported ) generateReport.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: 'johnsAccount angiesAccount childrenPortfolio myAccount familyPortfolio johnsEmptyPortfolio johnsPortfolio angiesPortfolio indent facusAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'setup' stamp: 'sc 11/18/2022 02:22:36'!
setUp

	indent:='    '.
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	facusAccount := ReceptiveAccount named: 'Cuenta de Facundo'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	
	
	johnsEmptyPortfolio := Portfolio named: 'Portfolio de Juan'.
    	johnsPortfolio := Portfolio named: 'Portfolio de Juan' with: johnsAccount.
 	angiesPortfolio := Portfolio named: 'Portfolio de Angeles' with:angiesAccount .! !


!PortfolioTreePrinterTest methodsFor: 'asserts' stamp: 'sc 11/18/2022 01:29:10'!
assertBriefTreePrintOfPortfolio: aPortfolioToBePrinted isEqualTo: aBriefPortfolioTreePrint

	 self assert: aBriefPortfolioTreePrint equals: (PortfolioBriefTreePrinter with: aPortfolioToBePrinted) generateReport.
	! !

!PortfolioTreePrinterTest methodsFor: 'asserts' stamp: 'sc 11/18/2022 01:40:55'!
assertDetailedTreePrintOfPortfolio: aPortfolioToBePrinted isEqualTo: aDetailedPortfolioTreePrint

    self assert: aDetailedPortfolioTreePrint equals: (PortfolioCompleteTreePrinter with: aPortfolioToBePrinted) generateReport.! !


!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:57:38'!
test01PortfolioCompleteTreePrinterOnlyPrintsEmptyPortfolioName

    | expectedPortfolioStructure |

    expectedPortfolioStructure := OrderedCollection with: 'Portfolio de Juan' with: indent, 'Balance = 0 * pesos'.

    self assertDetailedTreePrintOfPortfolio: johnsEmptyPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:06:20'!
test01PortfolioTreePrinterOnlyPrintsEmptyPortfolioName
    | expectedPortfolioStructure |

    expectedPortfolioStructure := OrderedCollection with: 'Portfolio de Juan'.

    self assertBriefTreePrintOfPortfolio: johnsEmptyPortfolio isEqualTo: expectedPortfolioStructure.
	

	! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:15:43'!
test02PortfolioTreePrinterPrintsPortfolioNameWithPortfolioAccount
    | expectedPortfolioStructure |

    expectedPortfolioStructure := OrderedCollection with: 'Portfolio de Juan' with:indent,'Cuenta de Juan'.
    self assertBriefTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:49:37'!
test02PortfolioWithAccountAndNoTransactionsIsPrintedCorrectly
    | expectedPortfolioStructure |

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Juan'.
        indent,'Cuenta de Juan'.
        indent,indent,'Balance = 0 * pesos'.
        indent,'Balance = 0 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:19:06'!
test03PortfolioTreePrinterPrintsPortfolioNameWithPortfolioAccounts
    | aPortfolio expectedPortfolioStructure |

    aPortfolio := Portfolio named: 'Portfolio de Juan y Angeles' with: johnsAccount with: angiesAccount .
    expectedPortfolioStructure := OrderedCollection with: 'Portfolio de Juan y Angeles' with: indent,'Cuenta de Juan' with: indent,'Cuenta de Angeles'.

    self assertBriefTreePrintOfPortfolio: aPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:50:24'!
test03PortfolioWithPortfolioWithNoTransactionsIsPrintedCorrectly
    | aPortfolio expectedPortfolioStructure |

    aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesPortfolio .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de la familia'.
        indent,'Portfolio de Angeles'.
        indent,indent,'Cuenta de Angeles'.
        indent,indent,indent,'Balance = 0 * pesos'.
        indent,indent,'Balance = 0 * pesos'.
        indent,'Balance = 0 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: aPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 01:26:05'!
test04NestedPortfolioIsPrintedCorrectly
    | familysPortfolio expectedPortfolioStructure angieAndFacuPortfolio |

    angieAndFacuPortfolio := Portfolio named: 'Portfolio de Angeles y Facundo' with: angiesAccount with: facusAccount .
    familysPortfolio := Portfolio named: 'Portfolio de Familia' with: johnsAccount with: angieAndFacuPortfolio .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Familia'.
        indent,'Cuenta de Juan'.
        indent,'Portfolio de Angeles y Facundo'.
        indent,indent,'Cuenta de Angeles'.
        indent,indent,'Cuenta de Facundo'.
    }.

    self assertBriefTreePrintOfPortfolio: familysPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:00:11'!
test04PortfolioWithMultipleAccountsWithNoTransactionsIsPrintedCorrectly
    | familysPortfolio expectedPortfolioStructure |

    familysPortfolio := Portfolio named: 'Portfolio de la familia' with: facusAccount with: angiesPortfolio .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de la familia'.
        indent,'Cuenta de Facundo'.
        indent,indent,'Balance = 0 * pesos'.
        indent,'Portfolio de Angeles'.
        indent,indent,'Cuenta de Angeles'.
        indent,indent,indent,'Balance = 0 * pesos'.
        indent,indent,'Balance = 0 * pesos'.
        indent,'Balance = 0 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: familysPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:13:07'!
test05PortfolioWithAccountWithDepositIsPrintedCorrectly
    | expectedPortfolioStructure |

    Deposit register: 100*peso on: johnsAccount .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Juan'.
        indent,'Cuenta de Juan'.
        indent,indent,'Depósito por 100 * pesos'.
        indent,indent,'Balance = 100 * pesos'.
        indent,'Balance = 100 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:15:59'!
test06PortfolioWithAccountWithWithdrawIsPrintedCorrectly
    | expectedPortfolioStructure |

    Withdraw register: 20*peso on: johnsAccount .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Juan'.
        indent,'Cuenta de Juan'.
        indent,indent,'Extracción por 20 * pesos'.
        indent,indent,'Balance = -20 * pesos'.
        indent,'Balance = -20 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:18:25'!
test07PortfolioWithSenderAccountInTransferIsPrintedCorrectly
    | expectedPortfolioStructure |

    Transfer amount: 50*peso from: johnsAccount  to: angiesAccount .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Juan'.
        indent,'Cuenta de Juan'.
        indent,indent,'Salida por transferencia de 50 * pesos'.
        indent,indent,'Balance = -50 * pesos'.
        indent,'Balance = -50 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:18:42'!
test08PortfolioWithReceivingAccountInTransferIsPrintedCorrectly
    | expectedPortfolioStructure |

    Transfer amount: 75*peso from: angiesAccount to: johnsAccount.

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de Juan'.
        indent,'Cuenta de Juan'.
        indent,indent,'Entrada por transferencia de 75 * pesos'.
        indent,indent,'Balance = 75 * pesos'.
        indent,'Balance = 75 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: johnsPortfolio isEqualTo: expectedPortfolioStructure.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sc 11/18/2022 02:21:57'!
test09PortfolioWithMultipleAccountsAndTransactionsIsPrintedCorrectly
    | familyPortfolios expectedPortfolioStructure childrenPortfolios |

    childrenPortfolios := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 

    familyPortfolios := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolios.

    Deposit register: 20*peso on: myAccount.
    Withdraw register: 70*peso on: myAccount.
    Deposit register: 35*peso on: johnsAccount .
    Withdraw register: 5*peso on: johnsAccount.
    Transfer amount: 10*peso from: angiesAccount to: facusAccount .

    expectedPortfolioStructure := OrderedCollection newFrom: {
        'Portfolio de la familia'.

        indent,'Cuenta mia'.
        indent,indent,'Depósito por 20 * pesos'.
        indent,indent,'Extracción por 70 * pesos'.
        indent,indent,'Balance = -50 * pesos'.

        indent,'Portfolio de hijos'.
        indent,indent,'Cuenta de Juan'.
        indent,indent,indent,'Depósito por 35 * pesos'.
        indent,indent,indent,'Extracción por 5 * pesos'.
        indent,indent,indent,'Balance = 30 * pesos'.

        indent,indent,'Cuenta de Angeles'.
        indent,indent,indent,'Salida por transferencia de 10 * pesos'.
        indent,indent,indent,'Balance = -10 * pesos'.
        indent,indent,'Balance = 20 * pesos'.

        indent,'Balance = -30 * pesos'.
    }.

    self assertDetailedTreePrintOfPortfolio: familyPortfolios isEqualTo: expectedPortfolioStructure.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'name' stamp: 'sc 11/18/2022 01:14:19'!
name

	^name.! !


!Account methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 21:58:55'!
visitTransactionsWith: anAccountToBeReported
	
	self  transactions do: [ :aTransaction | aTransaction accept: anAccountToBeReported ]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'initialization' stamp: 'sc 11/18/2022 00:47:23'!
named: aName

	^self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'sc 11/18/2022 01:13:38'!
initializeWithName: aPortfolioName 
	
	name := aPortfolioName.
	accounts:= OrderedCollection new.
	parents:= OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'sc 11/18/2022 01:48:39'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:34:09'!
accept: anAccountVisitor

	 ^anAccountVisitor visitPortfolio: self.
	
	! !

!Portfolio methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 00:34:03'!
visitAccountsWith: anAccountVisitor
	
	accounts do: [ :anAccount | anAccount accept: anAccountVisitor].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'initialization' stamp: 'sc 11/18/2022 00:04:28'!
named: aNamePortfolio with: anAccount 
	
	|aPortfolio|
	
	aPortfolio:= self new initializeWithName: aNamePortfolio.
	
	^aPortfolio  
		add: anAccount;
		yourself
	
	! !

!Portfolio class methodsFor: 'initialization' stamp: 'sc 11/17/2022 23:12:45'!
named: aPortfolioName with: anAccount with: anotherAccount
	
	|aPortfolio|
	
	aPortfolio:= self new initializeWithName: aPortfolioName.
	
	^aPortfolio
		add: anAccount;
		add: anotherAccount;
		yourself
	! !

!Portfolio class methodsFor: 'initialization' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'initialization' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'sc 11/18/2022 00:57:12'!
initializeWithName: aNameAccount 
	
	name:= aNameAccount.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sc 11/18/2022 01:47:31'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:53:13'!
accept: anAccountVisitor
	
	^anAccountVisitor visitReceptiveAccount:self.! !

!ReceptiveAccount methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 21:59:54'!
visitTransactionsWith: anAccountToBeReported
	
	self transactions do: [ :aTransaction | aTransaction accept: anAccountToBeReported ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'initialization' stamp: 'sc 11/18/2022 00:57:04'!
named: aNameAccount
	
	^self new initializeWithName: aNameAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:12:37'!
accept: anAccountSummary

	self subclassResponsibility .! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:45:16'!
accept: anAccountSummaryVisitor

	
	^anAccountSummaryVisitor visitDeposit: self value.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:46:56'!
accept: anAccountSummaryVisitor

	
	^anAccountSummaryVisitor visitDepositLeg: self value.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:47:14'!
accept: anAccountSummaryVisitor

	^anAccountSummaryVisitor visitWithdrawLeg: self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:47:39'!
accept: anAccountSummaryVisitor

	^anAccountSummaryVisitor visitWithdraw: self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio treePortfolio treeLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'tree protocol' stamp: 'sc 11/18/2022 01:31:28'!
addAccountToTreePortfolio: anAccount

	treePortfolio add: (self currentIndent append: anAccount name)! !

!PortfolioTreePrinter methodsFor: 'tree protocol' stamp: 'sc 11/18/2022 01:31:55'!
decreaseTreeLevel
	
	^treeLevel := treeLevel - 1.! !

!PortfolioTreePrinter methodsFor: 'tree protocol' stamp: 'sc 11/18/2022 01:32:20'!
increaseTreeLevel
	
	^treeLevel := treeLevel + 1.! !


!PortfolioTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:32:55'!
visitPortfolio: aPortfolio 
	
	self subclassResponsibility ! !

!PortfolioTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:51:28'!
visitReceptiveAccount: aReceptiveAccount 

	self  subclassResponsibility ! !


!PortfolioTreePrinter methodsFor: 'report' stamp: 'sc 11/18/2022 01:31:41'!
currentIndent

	| indent |
    	indent := ''.
    	treeLevel timesRepeat: [indent := indent append: '    '].

    	^indent.! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'sc 11/18/2022 01:32:06'!
generateReport
	
	portfolio accept: self.
	
	^treePortfolio.! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'sc 11/18/2022 01:32:32'!
initializeWith: aPortfolio 
	
	portfolio := aPortfolio.
	treePortfolio:= OrderedCollection new.
	treeLevel:=0.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'initialization' stamp: 'sc 11/18/2022 01:41:57'!
with: aPortfolioToBePrinted

	^self new initializeWith: aPortfolioToBePrinted .! !


!classDefinition: #PortfolioBriefTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter subclass: #PortfolioBriefTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioBriefTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 00:31:53'!
visitPortfolio: aPortfolio 
	
	self addAccountToTreePortfolio: aPortfolio.
	self increaseTreeLevel.
    	aPortfolio visitAccountsWith: self.
    	self decreaseTreeLevel.! !

!PortfolioBriefTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:52:28'!
visitReceptiveAccount: aReceptiveAccount 

	self addAccountToTreePortfolio: aReceptiveAccount.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioBriefTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioBriefTreePrinter class
	instanceVariableNames: ''!

!PortfolioBriefTreePrinter class methodsFor: 'initalization' stamp: 'sc 11/18/2022 00:11:58'!
with: aPortfolio 
	
	^self new initializeWith: aPortfolio.! !


!classDefinition: #PortfolioCompleteTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter subclass: #PortfolioCompleteTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioCompleteTreePrinter methodsFor: 'tree protocol' stamp: 'sc 11/18/2022 01:34:44'!
addAccountBalanceToPortfolioTree: aReceptiveAccount

    ^ treePortfolio add: (self currentIndent,'Balance = ' append: aReceptiveAccount balance asString)! !

!PortfolioCompleteTreePrinter methodsFor: 'tree protocol' stamp: 'sc 11/18/2022 01:35:15'!
addDescriptionAsPortfolioTreeLine: aTransactionDescription ofTransaction: aTransaction

    treePortfolio add: (self currentIndent append: (aTransactionDescription , aTransaction value asString)).! !


!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:36:35'!
visitDeposit: aDeposit

    self addDescriptionAsPortfolioTreeLine: 'Depósito por ' ofTransaction: aDeposit! !

!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 02:17:48'!
visitDepositLeg: aTransferDepositLeg 

    self addDescriptionAsPortfolioTreeLine: 'Entrada por transferencia de ' ofTransaction: aTransferDepositLeg.! !

!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:35:49'!
visitPortfolio: aPortfolio

    self addAccountToTreePortfolio: aPortfolio.

    self increaseTreeLevel.
    aPortfolio visitAccountsWith: self.
    self addAccountBalanceToPortfolioTree: aPortfolio.
    self decreaseTreeLevel.! !

!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:36:18'!
visitReceptiveAccount: aReceptiveAccount


    self addAccountToTreePortfolio: aReceptiveAccount.

    self increaseTreeLevel.
    aReceptiveAccount visitTransactionsWith: self.
    self addAccountBalanceToPortfolioTree: aReceptiveAccount.
    self decreaseTreeLevel.! !

!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 01:37:12'!
visitWithdraw: aWithdraw

    self addDescriptionAsPortfolioTreeLine: 'Extracción por ' ofTransaction: aWithdraw.! !

!PortfolioCompleteTreePrinter methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 02:18:06'!
visitWithdrawLeg: aTransferWithdrawLeg 

    self addDescriptionAsPortfolioTreeLine: 'Salida por transferencia de ' ofTransaction: aTransferWithdrawLeg.! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'report' stamp: 'sc 11/17/2022 21:04:41'!
generateReport
	
	self subclassResponsibility.! !


!Report methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:51:19'!
visitAccountTransactions

	self subclassResponsibility ! !

!Report methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:51:38'!
visitDeposit: aDeposit

	self subclassResponsibility ! !

!Report methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:52:01'!
visitDepositLeg: aDepositLeg

	self subclassResponsibility! !

!Report methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:52:21'!
visitWithdraw: aWithdraw

	self subclassResponsibility ! !

!Report methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 16:52:40'!
visitWithdrawLeg: aWithdrawLeg

	self subclassResponsibility ! !


!Report methodsFor: 'initialization' stamp: 'sc 11/18/2022 16:50:44'!
initializeWith: anAccountToBeReported 

	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'sc 11/17/2022 21:00:22'!
initializeWith: anAccountToBeReported 
	
	account := anAccountToBeReported.
	report:= OrderedCollection new.! !


!AccountSummary methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 21:47:41'!
visitAccountTransactions
	
	account visitTransactionsWith: self.! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'sc 11/18/2022 02:11:06'!
visitDeposit: aDeposit
	
	^report add: ('Depósito por ',  aDeposit  value asString).! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:04:38'!
visitDepositLeg: aDepositLeg

	^report add: ('Entrada por transferencia de ', aDepositLeg value asString )! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:09:55'!
visitWithdraw: aWithdraw

	^report add: ('Extracción por ', aWithdraw value asString ). ! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:08:50'!
visitWithdrawLeg: aWithdrawLeg

	^report add: ('Salida por transferencia de ', aWithdrawLeg  value asString ).! !


!AccountSummary methodsFor: 'report' stamp: 'sc 11/17/2022 21:44:40'!
generateReport

	self visitAccountTransactions.
	
	report add: ('Balance = ', account balance asString ).

	^report . ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'initialization' stamp: 'sc 11/16/2022 19:28:29'!
for: anAccountToBeReported

	^self new initializeWith: anAccountToBeReported .
	
	

	! !


!classDefinition: #NetTransfer category: 'ServiciosFinancieros-Solucion'!
Report subclass: #NetTransfer
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransfer methodsFor: 'initialization' stamp: 'sc 11/17/2022 20:50:55'!
initializeWith: anAccountToBeReported 
	
	account := anAccountToBeReported.
	value:= 0*peso.! !


!NetTransfer methodsFor: 'report' stamp: 'sc 11/17/2022 22:00:46'!
generateReport
	
	
	self visitAccountTransactions.
	
	^value. ! !


!NetTransfer methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:01:44'!
visitAccountTransactions
	
	account visitTransactionsWith: self.! !

!NetTransfer methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:10:35'!
visitDeposit: aDeposit
	! !

!NetTransfer methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:05:38'!
visitDepositLeg: aTransacationDepositLeg
	
	 value:= value + aTransacationDepositLeg value.! !

!NetTransfer methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:10:55'!
visitWithdraw: aWithdraw 
	! !

!NetTransfer methodsFor: 'visitor protocol' stamp: 'sc 11/17/2022 22:08:09'!
visitWithdrawLeg: aTransactionWithdrawLeg

	value:= value - aTransactionWithdrawLeg value.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NetTransfer class' category: 'ServiciosFinancieros-Solucion'!
NetTransfer class
	instanceVariableNames: ''!

!NetTransfer class methodsFor: 'initialization' stamp: 'sc 11/17/2022 19:12:29'!
for: anAccountSummary
	
	^self new initializeWith: anAccountSummary .! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
