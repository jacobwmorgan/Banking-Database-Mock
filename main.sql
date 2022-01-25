--Creates Database for banking system
CREATE DATABASE bank

CREATE TABLE customers
(
  customerId INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  DOB DATE NOT NULL,
  customerAddress VARCHAR(255) NOT NULL,
  telephone VARCHAR(255) NOT NULL,
  PRIMARY KEY (customerId)
);


CREATE TABLE accounts
(
  accountId INT NOT NULL,
  customerId INT NOT NULL,
  openingBalance INT NOT NULL CHECK(openingBalance >= 50),
  activationDate DATE NOT NULL,
  sortcode VARCHAR(255) NOT NULL,
  accountType VARCHAR(255) NOT NULL,
  PRIMARY KEY(accountId),
  FOREIGN KEY(customerId) REFERENCES customers(customerId)
);



CREATE TABLE loans
(
  loanId INT NOT NULL AUTO_INCREMENT,
  accountId INT NOT NULL,
  numberOfPayments INT NOT NULL,
  monthlyPayments INT NOT NULL,
  loanPayDate INT NOT NULL,
  loanStart DATE NOT NULL,
  PRIMARY KEY (loanId),
  FOREIGN KEY (accountId) REFERENCES accounts(accountId)
) 

CREATE TABLE transactions
(
  transactionId INT NOT NULL AUTO_INCREMENT,
  accountId INT NOT NULL,
  transactionTimeStamp DATE NOT NULL ,
  amount INT NOT NULL,
  PRIMARY KEY (transactionId),
  FOREIGN KEY (accountId) REFERENCES accounts(accountId)
);


INSERT INTO customers (firstName,lastName,DOB,customerAddress,telephone)
VALUES('Terry','Davis','1969-12-15','Alders Farm, Alders Lane, Whixall','(01268) 641573'),
('Jon','Arbuckle','1978-1-8','2 Ovett Close, London','(01590) 071172'),
('Jim','Morrison','1944-12-8','8 Boulevard de Ménilmontant, Paris, FR 75020','(01287) 332446'),
('Ian','Curtis','1956-6-15','75 Port St, Manchester, M1 2EG, England','(01202) 652231'),
('Charles','Thompson IV','1965-4-6','5 Marlborough Crescent, Gateshead','(0191) 288 1786'),
('Jello','Biafra','1958-6-17','2 Morris Court Farm Cottages, School Lane, Bapchild','(01795) 082437'),
('Damon','Albarn','1968-3-23','212 Wobble Street, London, SW21 7QJ','(01726) 784542'),
('Paul','Simon','1941-10-13','42nd Street, New York City, NY ','(0115) 338 6172'),
('Adam','Ant','1954-11-3','Holme Lea, Wellington,CA20 1BE','(01946) 157853'),
('James','Murphy','1970-2-4','15 Mount Street, Bala ,LL23 7RS','(01678) 263368')

INSERT INTO accounts (accountId,customerId,openingBalance,activationDate,sortcode,accountType)
VALUES (97684385,1,500,'2019-10-1','593694','Current'),
(83429629 ,2, 10232,'1999-5-29','593694','Savings'),
(37688799 ,3, 24215,'2002-4-12','593694','Savings'),
(13622749 ,4, 80,'2007-2-14','593694','Current'),
(32247480 ,5, 6000,'2006-9-2','593694','Current'),
(30890160 ,6, 2122,'2019-10-2','593694','Savings'),
(91452250 ,7, 5000,'2003-1-9','593694','Savings'),
(74105178 ,8, 90,'2018-5-10','593694','Current'),
(49865825 ,9, 1401411,'2020-3-15','593694','Current'),
(37720583 ,10, 100,'2000-9-5',' 593694','Savings')

INSERT INTO loans (accountId,numberOfPayments,monthlyPayments,loanPayDate,loanStart)
VALUES (13622749,10,15,1,'2019-10-30'),
(32247480,50,19,6,'2020-5-29'),
(74105178,5,23,10,'2021-9-20'),
(30890160,10,11,29,'2021-1-12')

INSERT INTO transactions (accountId,transactionTimeStamp,amount)
VALUES (97684385,'2022-1-5',-214),
(97684385,'2022-1-19',-420),
(97684385,'2022-1-3',418),
(97684385,'2022-1-1',-214),
(97684385,'2022-1-18',698),
(97684385,'2022-1-21',513),
(97684385,'2022-1-18',265),
(97684385,'2022-1-17',-270),
(97684385,'2022-1-9',867),
(97684385,'2022-1-17',-250),
(83429629,'2022-1-21',165),
(83429629,'2022-1-11',-330),
(83429629,'2022-1-6',-804),
(83429629,'2022-1-9',374),
(83429629,'2022-1-4',577),
(83429629,'2022-1-10',-660),
(83429629,'2022-1-23',142),
(83429629,'2022-1-6',440),
(83429629,'2022-1-2',829),
(83429629,'2022-1-3',303),
(37688799,'2022-1-20',43),
(37688799,'2022-1-8',574),
(37688799,'2022-1-16',-408),
(37688799,'2022-1-10',-352),
(37688799,'2022-1-14',573),
(37688799,'2022-1-24',413),
(37688799,'2022-1-24',-537),
(37688799,'2022-1-7',632),
(37688799,'2022-1-10',-101),
(37688799,'2022-1-17',-264),
(13622749,'2022-1-1',-17),
(13622749,'2022-1-4',628),
(13622749,'2022-1-23',-478),
(13622749,'2022-1-6',883),
(13622749,'2022-1-24',-193),
(13622749,'2022-1-21',-707),
(13622749,'2022-1-21',323),
(13622749,'2022-1-15',708),
(13622749,'2022-1-12',-43),
(13622749,'2022-1-2',379),
(32247480,'2022-1-3',-420),
(32247480,'2022-1-24',-105),
(32247480,'2022-1-17',-208),
(32247480,'2022-1-15',739),
(32247480,'2022-1-9',-625),
(32247480,'2022-1-23',-137),
(32247480,'2022-1-19',-728),
(32247480,'2022-1-18',-47),
(32247480,'2022-1-1',-404),
(32247480,'2022-1-17',-809),
(30890160,'2022-1-20',-543),
(30890160,'2022-1-13',-33),
(30890160,'2022-1-1',67),
(30890160,'2022-1-13',817),
(30890160,'2022-1-24',346),
(30890160,'2022-1-10',391),
(30890160,'2022-1-14',629),
(30890160,'2022-1-3',28),
(30890160,'2022-1-10',243),
(30890160,'2022-1-12',-412),
(91452250,'2022-1-5',439),
(91452250,'2022-1-22',-591),
(91452250,'2022-1-21',-338),
(91452250,'2022-1-2',-381),
(91452250,'2022-1-24',103),
(91452250,'2022-1-20',869),
(91452250,'2022-1-14',864),
(91452250,'2022-1-18',377),
(91452250,'2022-1-19',-645),
(91452250,'2022-1-23',183),
(74105178,'2022-1-15',440),
(74105178,'2022-1-17',-278),
(74105178,'2022-1-2',-138),
(74105178,'2022-1-12',566),
(74105178,'2022-1-16',763),
(74105178,'2022-1-10',548),
(74105178,'2022-1-3',836),
(74105178,'2022-1-13',-660),
(74105178,'2022-1-15',89),
(74105178,'2022-1-22',734),
(49865825,'2022-1-1',-413),
(49865825,'2022-1-19',-334),
(49865825,'2022-1-10',-250),
(49865825,'2022-1-10',-408),
(49865825,'2022-1-19',-343),
(49865825,'2022-1-15',-288),
(49865825,'2022-1-22',-571),
(49865825,'2022-1-9',115),
(49865825,'2022-1-22',558),
(49865825,'2022-1-20',-586),
(37720583,'2022-1-13',-688),
(37720583,'2022-1-7',78),
(37720583,'2022-1-19',271),
(37720583,'2022-1-11',-685),
(37720583,'2022-1-7',835),
(37720583,'2022-1-7',-516),
(37720583,'2022-1-17',77),
(37720583,'2022-1-7',747),
(37720583,'2022-1-22',419),
(37720583,'2022-1-16',-462)

SELECT customers.firstName , customers.lastName , accounts.accountId from `customers` inner join accounts on customers.customerId = accounts.customerId where customers.customerId in (SELECT accounts.customerId from `accounts` where accounts.accountId in (SELECT loans.accountId from `loans` where loans.loanPayDate <= 7));
SELECT customers.firstName , customers.lastName , accounts.accountId from `customers` inner join accounts on customers.customerId = accounts.customerId where customers.customerId in (SELECT accounts.customerId from `accounts` where accounts.accountId in (SELECT transactions.accountId from `transactions` where transactions.transactionTimeStamp BETWEEN '2022-1-10' AND '2022-1-15')); 

