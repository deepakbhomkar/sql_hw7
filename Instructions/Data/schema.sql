DROP TABLE IF EXISTS cardholder CASCADE;
DROP TABLE IF EXISTS merchantcategory CASCADE;
DROP TABLE IF EXISTS creditcard CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS cctransaction CASCADE;

CREATE TABLE cardholder (
	cardholderid INT PRIMARY KEY NOT NULL,
	cardholdername VARCHAR(255)
	);
	
CREATE TABLE merchantcategory (
	merchantcategoryid INT PRIMARY KEY NOT NULL,
	merchantcategoryname VARCHAR(255)
	);

CREATE TABLE creditcard (
	creditcardnumber VARCHAR(20) PRIMARY KEY NOT NULL,
	cardholderid INT NOT NULL,
	FOREIGN KEY (cardholderid) REFERENCES cardholder(cardholderid)
);

CREATE TABLE merchant (
	merchantid INT PRIMARY KEY NOT NULL,
	merchantname VARCHAR(255),
	merchantcategoryid INT NOT NULL,
	FOREIGN KEY (merchantcategoryid) REFERENCES merchantcategory(merchantcategoryid)
);

CREATE TABLE cctransaction (
	transactionid INT PRIMARY KEY NOT NULL,
	transactiondate TIMESTAMP NOT NULL,
	transactionamount DECIMAL(12,2),
	creditcardnumber VARCHAR(20) NOT NULL,
	FOREIGN KEY (creditcardnumber) REFERENCES creditcard(creditcardnumber),
	merchantid INT NOT NULL,
	FOREIGN KEY (merchantid) REFERENCES merchant(merchantid)
);
