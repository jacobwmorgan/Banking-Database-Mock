DROP TABLE accounts;

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