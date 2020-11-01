-- View of query_1 - all transactions by cardholderid

CREATE VIEW cctxndetail AS
	SELECT  b.cardholderid, a.creditcardnumber, a.transactionid, 
    	    a.transactiondate, a.transactionamount, a.merchantid
	FROM cctransaction as a 
	INNER join creditcard as b 
	ON a.creditcardnumber = b.creditcardnumber
	ORDER BY b.cardholderid, a.creditcardnumber, a.transactiondate;
	

-- View of query_2 - transactions between a time range

CREATE VIEW cctxntimerange AS
	SELECT a.transactionid, a.transactiondate, a.transactionamount, 
    	   a.creditcardnumber, a.merchantid, b.cardholderid, c.merchantname, d.merchantcategoryname
	FROM cctransaction as a 
	INNER join creditcard as b 
	ON a.creditcardnumber = b.creditcardnumber
	INNER join merchant as c
	ON a.merchantid = c.merchantid
	INNER join merchantcategory as d
	ON c.merchantcategoryid = d.merchantcategoryid
	WHERE extract(hour from a.transactiondate) >= 7 and extract(hour from a.transactiondate) <= 9;


-- View of query_3 - transactions less than an amount

CREATE VIEW cctxnamountlimit AS
	SELECT b.cardholderid, a.creditcardnumber, a.transactionid, 
    	   a.transactiondate, a.transactionamount, a.merchantid, c.merchantname, d.merchantcategoryname 
	FROM cctransaction as a 
	INNER join creditcard as b 
	ON a.creditcardnumber = b.creditcardnumber
	INNER join merchant as c
	ON a.merchantid = c.merchantid
	INNER join merchantcategory as d
	ON c.merchantcategoryid = d.merchantcategoryid
	WHERE a.transactionamount < 2
	ORDER BY b.cardholderid, a.creditcardnumber, a.transactiondate, a.transactionamount;


-- View of query_4 - transactions for specific cardholder 2 and 18

CREATE VIEW cctxncardholderid AS
	SELECT  a.transactionid, a.transactiondate, a.transactionamount, 
    	    a.creditcardnumber, a.merchantid, b.cardholderid
	FROM cctransaction as a 
	INNER join creditcard as b 
	ON a.creditcardnumber = b.creditcardnumber
	AND (b.cardholderid = 2 or b.cardholderid = 18);


-- View of query_5 - transactions for cardholder 25 between janjun 2018

CREATE VIEW cctxnjanjun18 AS
    SELECT  a.transactionid, a.transactiondate, a.transactionamount, 
            a.creditcardnumber, a.merchantid, b.cardholderid, c.merchantname, d.merchantcategoryname
    FROM cctransaction as a 
    INNER join creditcard as b 
    ON a.creditcardnumber = b.creditcardnumber
    INNER join merchant as c
    ON a.merchantid = c.merchantid
    INNER join merchantcategory as d
    ON c.merchantcategoryid = d.merchantcategoryid
    WHERE (b.cardholderid = 25) 
    AND extract(month from a.transactiondate) >= 1 and extract(month from a.transactiondate) <= 6;
	