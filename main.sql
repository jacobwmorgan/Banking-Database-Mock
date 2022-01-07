--Creates Database for banking system
CREATE DATABASE Bank

CREATE TABLE customers
(
  customerId INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  DOB DATE NOT NULL,
  customerAddress VARCHAR(255) NOT NULL,
  telephone VARCHAR(255) NOT NULL,
  CONSTRAINT customer_id_pk PRIMARY KEY(customerId)
)

CREATE TABLE accounts
(
  accountId INT NOT NULL AUTO_INCREMENT,
  customerId INT NOT NULL,
  openingBalance INT NOT NULL,
  CONSTRAINT checkBalance
    CHECK (openingBalance >= 50),
  activationDate DATE NOT NULL,
  accountType VARCHAR(255) NOT NULL,
  CONSTRAINT accountId_pk PRIMARY KEY(accountId),
  CONSTRAINT accounts_customerId_fk FOREIGN KEY(customerId) REFERENCES customers(customerId)
)
CREATE TABLE loans
(
  loanId INT NOT NULL AUTO_INCREMENT,
  customerId INT NOT NULL,
  accountId INT NOT NULL,
  amount INT NOT NULL,
  CONSTRAINT loanId_pk PRIMARY KEY (loanId),
  CONSTRAINT loans_customerId_fk FOREIGN KEY (customerId) REFERENCES customers(customerId),
  CONSTRAINT loans_accountId_fk FOREIGN KEY (accountId) REFERENCES accounts(accountId)
)

CREATE TABLE transactions
(
  transactionId INT NOT NULL AUTO_INCREMENT,
  accountId INT ,
  loanId INT ,
  transactionTimeStamp DATE NOT NULL ,
  amount INT NOT NULL,
  transactionDesc VARCHAR(255),
  CONSTRAINT transactionId_pk PRIMARY KEY (transactionId),
  CONSTRAINT transactions_accountId_fk FOREIGN KEY (accountId) REFERENCES accounts(accountId),
  CONSTRAINT transactions_loanId_fk FOREIGN KEY (loanId) REFERENCES loans(loanId)
)


