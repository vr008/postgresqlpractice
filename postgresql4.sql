select first_name,last_name from customer where first_name ='Jamie' and last_name='Rice';
select first_name,last_name from customer where first_name ='Jamie' OR last_name='Rice';
select last_name,first_name from customer where last_name in ('Miller','Jones','Brown') or first_name in ('Lisa','Ruth');
select first_name,last_name from customer where first_name like 'Ann%';
SELECT first_name, last_name FROM customer WHERE first_name LIKE 'Bra%' AND last_name <> 'Motley';
select 1=1 as result;
select true and false as result;
select true and null as result;
select false and false as result;
select false and null as result;
select true and true as result;
select null and null as result;
select title,length,rental_rate from film where length>50 and rental_rate <1;
select 1<>1 as result;
select true<>true as result;
select false <> true as result;
select false<> false as result;
select false<>null as result;
select true<>null as result;
select null<>null as result;
select true or true as result;
select false or true as result;
select false or false as result;
select false or null as result;
select true or null as result;
select null or null as result;
select length,rental_duration from film where length>4 or rental_duration >90;
select title ,description from film order by length limit 10;
select title ,description from film order by length limit 10 offset 3;
select film_id,title,description from film order by length desc limit 10;
select film_id,title from film order by title offset 5 fetch first 5 row only;
select film_id,rental_duration from film where rental_duration in(3,4);
select film_id,title from film where film_id in(10,11,12);
select first_name,last_name from customer where first_name in ('Danny','Amber','Amy');
SELECT payment_id, amount FROM payment WHERE amount NOT BETWEEN 0.99 AND 2.99 ORDER BY amount desc;
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date BETWEEN '2007-03-01' AND '2007-03-05' AND amount > 10 ORDER BY payment_date;
SELECT first_name, last_name FROM customer WHERE first_name LIKE '_her%' ORDER BY first_name;
select first_name ,last_name from customer where first_name ilike 'ca%' order by last_name;
SELECT first_name, last_name FROM customer WHERE first_name ~~ 'Dar%' ORDER BY first_name;
CREATE TABLE t(
   message text
);

INSERT INTO t(message) VALUES('The rents are now 10% higher than last month'), 
      ('The new film will have _ in the title');

SELECT message FROM t;
SELECT * FROM t 
WHERE message LIKE '%10$%%' ESCAPE '$';
select null=null as result;
SELECT address, address2 FROM address WHERE address2 IS NULL;
SELECT address, address2 FROM address WHERE address2 IS not NULL;