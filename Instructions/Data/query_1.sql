select a.transactionid,
       a.transactiondate,
	   a.transactionamount,
	   a.creditcardnumber,
	   a.merchantid,
	   b.cardholderid
	FROM cctransaction as a 
	INNER join creditcard as b 
	ON a.creditcardnumber = b.creditcardnumber
	AND (b.cardholderid = 2 or b.cardholderid = 18);
	
select * from creditcard where cardholderid = 18;

SELECT *, extract(hour from transactiondate) as hour
  FROM cctransaction
  where extract(hour from transactiondate) >= 7 and extract(hour from transactiondate) <= 9;

SELECT *
  FROM cctransaction
  where extract(hour from transactiondate) >= 7 and extract(hour from transactiondate) <= 9
  and transactionamount <= 2
  order by creditcardnumber;
  
SELECT
	*,
	COUNT (customer_id)
FROM
	cctransaction
GROUP BY
	customer_id;

