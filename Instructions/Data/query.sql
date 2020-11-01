-- query_1 
-- Query to isolate transactions of each cardholder

SELECT  b.cardholderid, a.creditcardnumber, a.transactionid, 
        a.transactiondate, a.transactionamount, a.merchantid
FROM cctransaction as a 
INNER join creditcard as b 
ON a.creditcardnumber = b.creditcardnumber
ORDER BY b.cardholderid, a.creditcardnumber, a.transactiondate;


-- query_2 
-- Consider the time period 7:00 a.m. to 9:00 a.m. What are the 100 highest transactions during this time period

select  a.transactionid, a.transactiondate, a.transactionamount, 
        a.creditcardnumber, a.merchantid, b.cardholderid, c.merchantname, d.merchantcategoryname
FROM cctransaction as a 
INNER join creditcard as b 
ON a.creditcardnumber = b.creditcardnumber
INNER join merchant as c
ON a.merchantid = c.merchantid
INNER join merchantcategory as d
ON c.merchantcategoryid = d.merchantcategoryid
WHERE extract(hour from a.transactiondate) >= 7 and extract(hour from a.transactiondate) <= 9;


-- query_3 
-- Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders.
-- Count the transactions that are less than $2.00 per cardholder. 

SELECT  b.cardholderid, a.creditcardnumber, a.transactionid, 
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


-- query_4 
-- Loading data for card holder 2 and 18 from the database

SELECT  a.transactionid, a.transactiondate, a.transactionamount, 
        a.creditcardnumber, a.merchantid, b.cardholderid
FROM cctransaction as a 
INNER join creditcard as b 
ON a.creditcardnumber = b.creditcardnumber
AND (b.cardholderid = 2 or b.cardholderid = 18);


-- query_5
-- Loading data of daily transactions from jan to jun 2018 for card holder 25

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
