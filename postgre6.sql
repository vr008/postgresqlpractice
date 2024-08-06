select e.employee_id,e.employee_name,d.department_name,d.department_id from employees e full outer join departments d on d.department_id=e.department_id where d.department_id is null;
SELECT employee_name, department_name FROM employees e FULL OUTER JOIN departments d ON d.department_id = e.department_id WHERE department_name IS NULL;
DROP TABLE IF EXISTS T1;
CREATE table T1 (LABEL CHAR(1) PRIMARY KEY);

DROP TABLE IF EXISTS T2;

CREATE table T2 (score INT PRIMARY KEY);

INSERT into T1 (LABEL) VALUES
  ('A'),
  ('B');

INSERT into T2 (score) VALUES
  (1),
  (2),
  (3);
  select * from t1,t2;
  select * from t1 cross join t2;
  select * from t1 inner join t2 on true;
  select city,country.country_id,country from city,country; 
  CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY, 
  category_name VARCHAR (255) NOT NULL
);

CREATE TABLE products (
  product_id serial PRIMARY KEY, 
  product_name VARCHAR (255) NOT NULL, 
  category_id INT NOT NULL, 
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO categories (category_name) 
VALUES 
  ('Smartphone'), 
  ('Laptop'), 
  ('Tablet'),
  ('VR')
RETURNING *;

INSERT INTO products (product_name, category_id) 
VALUES 
  ('iPhone', 1), 
  ('Samsung Galaxy', 1), 
  ('HP Elite', 2), 
  ('Lenovo Thinkpad', 2), 
  ('iPad', 3), 
  ('Kindle Fire', 3)
RETURNING *;
select * from categories natural inner join products;
select * from categories natural left join products;
select * from categories natural right join products;
SELECT * FROM city NATURAL JOIN country;
select * from category natural left join film_category order by category_id ;
select * from category natural right join film_category order by category_id ;

