PART 1:
--
SELECT card, COUNT (*) AS transaction_count 
FROM transaction
GROUP BY card
ORDER BY COUNT(*) DESC;
--
SELECT card, COUNT (*) AS transaction_count 
FROM transaction
WHERE amount < 2
GROUP BY card
ORDER BY COUNT(*) DESC;
--
SELECT amount
FROM transaction
WHERE date>='01-01-2018' 
AND date <'12-31-2018' 
AND CAST(date AS TIME) between '07:00' and '09:00'
ORDER BY amount DESC
LIMIT 100;
--
SELECT merchant_id, COUNT (*) AS transaction_count 
FROM transaction
WHERE amount < 2
GROUP BY merchant_id
ORDER BY COUNT(*) DESC;
PART 2:
--
SELECT * FROM credit_card AS a
LEFT JOIN transaction as b ON a.card = b.card
WHERE (cardholder_id = 2 OR cardholder_id = 18);
--
SELECT * FROM credit_card AS a
LEFT JOIN transaction as b ON a.card = b.card
WHERE cardholder_id = 25;
---
SELECT * FROM credit_card AS a
LEFT JOIN transaction as b ON a.card = b.card
WHERE cardholder_id = 25
AND date >= '2018-01-01'::date
AND date <= '2018-06-30'::date;