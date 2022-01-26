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
VALUES (97684385,'2022-1-7',-193),
(97684385,'2022-1-24',-557),
(97684385,'2022-1-16',-348),
(97684385,'2022-1-19',-44),
(97684385,'2022-1-19',-600),
(83429629,'2022-1-21',-202),
(83429629,'2022-1-9',604),
(83429629,'2022-1-5',141),
(83429629,'2022-1-5',-309),
(83429629,'2022-1-14',-232),
(37688799,'2022-1-4',785),
(37688799,'2022-1-20',-613),
(37688799,'2022-1-8',-275),
(37688799,'2022-1-17',587),
(37688799,'2022-1-2',487),
(13622749,'2022-1-13',-337),
(13622749,'2022-1-22',799),
(13622749,'2022-1-21',745),
(13622749,'2022-1-21',842),
(13622749,'2022-1-10',571),
(32247480,'2022-1-8',-441),
(32247480,'2022-1-23',151),
(32247480,'2022-1-21',-391),
(32247480,'2022-1-3',424),
(32247480,'2022-1-10',346),
(30890160,'2022-1-21',816),
(30890160,'2022-1-15',86),
(30890160,'2022-1-21',-735),
(30890160,'2022-1-9',-144),
(30890160,'2022-1-2',866),
(91452250,'2022-1-11',-177),
(91452250,'2022-1-1',-11),
(91452250,'2022-1-4',-414),
(91452250,'2022-1-9',-22),
(91452250,'2022-1-24',-859),
(74105178,'2022-1-3',-388),
(74105178,'2022-1-11',880),
(74105178,'2022-1-21',-886),
(74105178,'2022-1-15',-815),
(74105178,'2022-1-8',539),
(49865825,'2022-1-18',366),
(49865825,'2022-1-5',420),
(49865825,'2022-1-2',-177),
(49865825,'2022-1-23',-138),
(49865825,'2022-1-12',199),
(37720583,'2022-1-11',-289),
(37720583,'2022-1-24',-852),
(37720583,'2022-1-2',366),
(37720583,'2022-1-13',-31),
(37720583,'2022-1-23',92)

SELECT customers.firstName , customers.lastName , accounts.accountId from `customers` inner join accounts on customers.customerId = accounts.customerId where customers.customerId in (SELECT accounts.customerId from `accounts` where accounts.accountId in (SELECT loans.accountId from `loans` where loans.loanPayDate <= 7));
SELECT customers.firstName , customers.lastName , accounts.accountId from `customers` inner join accounts on customers.customerId = accounts.customerId where customers.customerId in (SELECT accounts.customerId from `accounts` where accounts.accountId in (SELECT transactions.accountId from `transactions` where transactions.transactionTimeStamp BETWEEN '2022-1-10' AND '2022-1-15')); 

SELECT customers.firstName , customers.lastName , SUM(transactions.amount) + accounts.openingBalance AS sumOf
FROM `customers` 
INNER JOIN `accounts`
  ON customers.customerId = accounts.customerId 
INNER JOIN `transactions`
  ON accounts.accountId = transactions.accountId
GROUP BY transactions.accountId HAVING sumOf >= 5000;

SELECT SUM(accounts.openingBalance) + SUM(transactions.amount)
FROM `accounts`
INNER JOIN `transactions`
  ON accounts.accountId = transactions.accountId


DELIMITER $$
CREATE PROCEDURE AmountInBank()
BEGIN
SELECT SUM(accounts.openingBalance) + SUM(transactions.amount)
FROM `accounts`
INNER JOIN `transactions`
  ON accounts.accountId = transactions.accountId;
END $$ 
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Accounts_Over_5000()
BEGIN
SELECT customers.firstName , customers.lastName , SUM(transactions.amount) + accounts.openingBalance AS sumOf
FROM `customers` 
INNER JOIN `accounts`
  ON customers.customerId = accounts.customerId 
INNER JOIN `transactions`
  ON accounts.accountId = transactions.accountId
GROUP BY transactions.accountId HAVING sumOf >= 5000;
END; $$
DELIMITER ;