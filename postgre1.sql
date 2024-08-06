SELECT * from actor;
select  first_name from actor where last_name like '%a'
SELECT 
   first_name || '-' || last_name fullname,
   email
FROM 
   customer;
select last_name as surename from customer
select first_name || ''|| last_name as "full name" from actor