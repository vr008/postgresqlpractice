CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');
    
 select a,fruit_a,b,fruit_b from basket_a,basket_b where fruit_a=fruit_b;
 select a,fruit_a,b,fruit_b from basket_a inner join basket_b on fruit_a=fruit_b; 
 select a,fruit_a,b,fruit_b from basket_a join basket_b on fruit_a=fruit_b; 
 select a,fruit_a,b,fruit_b from basket_a left join basket_b on fruit_a=fruit_b; 
 select a,fruit_a from basket_a left join basket_b on fruit_a=fruit_b where b is null; 

 select b,fruit_b from basket_a right join basket_b on fruit_a=fruit_b where a is null; 
 select a,fruit_a,b,fruit_b from basket_a full join basket_b on fruit_a=fruit_b; 
 select a,fruit_a,b,fruit_b from basket_a full join basket_b on fruit_a=fruit_b where a is null or b is null; 
        
SELECT column_name, data_type, is_nullable, column_default FROM information_schema.columns WHERE table_name = 'film';
select last_name from customer as c order by c.last_name limit 5;
select f.film_id,fc.film_id,f.title,fc.last_update from film f inner join film_category fc on f.film_id =fc.film_id ;
select f1.title,f2.title,f1.length from film f1 INNER JOIN film f2 ON f1.film_id <> f2.film_id AND f1.length = f2.length;
select c.customer_id,c.first_name,c.last_name,p.amount,p.payment_date from customer c inner join payment p using(customer_id) order by p.payment_date;
select c.customer_id,c.first_name,c.last_name,p.amount,p.payment_date from customer c inner join payment p on c.customer_id=p.customer_id order by p.payment_date;
select s.staff_id ,r.rental_id, c.first_name || ' ' || c.last_name customer_name,s.first_name || ' ' || s.last_name staff_name,r.return_date from customer c inner join rental r using(customer_id)
inner join staff s using(staff_id) order by r.return_date;
select c.customer_id,c.first_name ||' '||c.last_name customer_name ,a.district  from customer c left join address a using (address_id) where district = '' ; 
SELECT film.film_id, film.title,inventory.inventory_id  FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id where inventory_id is NULL;
SELECT film.film_id, film.title,inventory.inventory_id  FROM film LEFT JOIN inventory using(film_id) where inventory_id is null order by film_id ;
SELECT film.film_id, film.title, inventory.inventory_id FROM inventory RIGHT JOIN film ON film.film_id = inventory.film_id ORDER BY film.title;
select city.city_id,country.country_id,city.city,country.country from country right join city using(country_id) order by country;
SELECT f.film_id, f.title, i.inventory_id FROM inventory i RIGHT JOIN film f USING(film_id) ORDER BY f.title;
SELECT f.film_id, f.title, i.inventory_id FROM inventory i RIGHT JOIN film f USING(film_id) WHERE i.inventory_id IS null ORDER BY f.title;
select c.customer_id,c.email,r.rental_date,r.staff_id from customer c right join rental r using(customer_id);
CREATE TABLE employee (
  employee_id INT PRIMARY KEY, 
  first_name VARCHAR (255) NOT NULL, 
  last_name VARCHAR (255) NOT NULL, 
  manager_id INT, 
  FOREIGN KEY (manager_id) REFERENCES employee (employee_id) ON DELETE CASCADE
);
INSERT INTO employee (employee_id, first_name, last_name, manager_id) 
VALUES 
  (1, 'Windy', 'Hays', NULL), 
  (2, 'Ava', 'Christensen', 1), 
  (3, 'Hassan', 'Conner', 1), 
  (4, 'Anna', 'Reeves', 2), 
  (5, 'Sau', 'Norman', 2), 
  (6, 'Kelsie', 'Hays', 3), 
  (7, 'Tory', 'Goff', 3), 
  (8, 'Salley', 'Lester', 3);

SELECT * FROM employee;
select e.first_name ||' '||e.last_name employee_name,m.first_name ||' '|| m.last_name manager_name from employee m inner join employee e on e.employee_id=m.manager_id order by e.first_name ,m.first_name;
 select e.first_name ||' '||e.last_name employee_name,m.first_name ||' '|| m.last_name manager_name from employee m left join employee e on e.employee_id=m.manager_id order by e.first_name ,m.first_name;
SELECT f1.title, f2.title, f1.length FROM film f1 INNER JOIN film f2 ON f1.film_id > f2.film_id AND f1.length = f2.length;
CREATE TABLE departments ( department_id serial PRIMARY KEY, department_name VARCHAR (255) NOT NULL);
CREATE TABLE employees (employee_id serial PRIMARY KEY, employee_name VARCHAR (255), department_id INTEGER);
INSERT INTO departments (department_name) 
VALUES 
  ('Sales'), 
  ('Marketing'), 
  ('HR'), 
  ('IT'), 
  ('Production');
INSERT INTO employees (employee_name, department_id) 
VALUES 
  ('Bette Nicholson', 1), 
  ('Christian Gable', 1), 
  ('Joe Swank', 2), 
  ('Fred Costner', 3), 
  ('Sandra Kilmer', 4), 
  ('Julia Mcqueen', NULL);

select * from employees;
select * from departments;
select e.employee_id,e.employee_name,d.department_name,d.department_id from employees e full outer join departments d on d.department_id=e.department_id;
select customer_id,email,address_id,address from customer full outer join address using(address_id) order by customer_id;