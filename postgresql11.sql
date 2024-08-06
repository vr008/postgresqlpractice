CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE managers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO employees (first_name, last_name, salary) 
VALUES
('Bob', 'Williams', 45000.00),
('Charlie', 'Davis', 55000.00),
('David', 'Jones', 50000.00),
('Emma', 'Brown', 48000.00),
('Frank', 'Miller', 52000.00),
('Grace', 'Wilson', 49000.00),
('Harry', 'Taylor', 53000.00),
('Ivy', 'Moore', 47000.00),
('Jack', 'Anderson', 56000.00),
('Kate', 'Hill',  44000.00),
('Liam', 'Clark', 59000.00),
('Mia', 'Parker', 42000.00);
SELECT 
  * 
FROM 
  employees 
WHERE 
  salary = ANY (
    SELECT 
      salary 
    FROM 
      managers
  );

INSERT INTO managers(first_name, last_name, salary) 
VALUES
('John', 'Doe',  60000.00),
('Jane', 'Smith', 55000.00),
('Alice', 'Johnson',  58000.00);
SELECT 
  * 
FROM 
  employees 
WHERE 
  salary > ANY (
    SELECT 
      salary 
    FROM 
      managers
  );
                
 SELECT 
  * 
FROM 
  employees 
WHERE 
  salary < ALL(
    select 
      salary 
    from 
      managers
  ) order by salary desc;
  CREATE TABLE employeers (
  employee_id SERIAL PRIMARY KEY, 
  full_name VARCHAR NOT NULL, 
  manager_id INT
);
INSERT INTO employeers (employee_id, full_name, manager_id) 
VALUES 
  (1, 'Michael North', NULL), 
  (2, 'Megan Berry', 1), 
  (3, 'Sarah Berry', 1), 
  (4, 'Zoe Black', 1), 
  (5, 'Tim James', 1), 
  (6, 'Bella Tucker', 2), 
  (7, 'Ryan Metcalfe', 2), 
  (8, 'Max Mills', 2), 
  (9, 'Benjamin Glover', 2), 
  (10, 'Carolyn Henderson', 3), 
  (11, 'Nicola Kelly', 3), 
  (12, 'Alexandra Climo', 3), 
  (13, 'Dominic King', 3), 
  (14, 'Leonard Gray', 4), 
  (15, 'Eric Rampling', 4), 
  (16, 'Piers Paige', 7), 
  (17, 'Ryan Henderson', 7), 
  (18, 'Frank Tucker', 8), 
  (19, 'Nathan Ferguson', 8), 
  (20, 'Kevin Rampling', 8);
  WITH RECURSIVE subordinates AS (
  SELECT 
    employee_id, 
    manager_id, 
    full_name 
  FROM 
    employeers 
  WHERE 
    employee_id = 2 
  UNION 
  SELECT 
    e.employee_id, 
    e.manager_id, 
    e.full_name 
  FROM 
    employeers e 
    INNER JOIN subordinates s ON s.employee_id = e.manager_id
) 
SELECT * FROM subordinates;
CREATE TABLE courses(
  course_id serial PRIMARY KEY, 
  course_name VARCHAR(255) NOT NULL, 
  price DECIMAL(10,2) NOT NULL,
  description VARCHAR(500), 
  published_date date
);


INSERT INTO courses( course_name, price, description, published_date) 
VALUES 
('PostgreSQL for Developers', 299.99, 'A complete PostgreSQL for Developers', '2020-07-13'), 
('PostgreSQL Admininstration', 349.99, 'A PostgreSQL Guide for DBA', NULL), 
('PostgreSQL High Performance', 549.99, NULL, NULL), 
('PostgreSQL Bootcamp', 777.99, 'Learn PostgreSQL via Bootcamp', '2013-07-11'), 
('Mastering PostgreSQL', 999.98, 'Mastering PostgreSQL in 21 Days', '2012-06-30');

SELECT * FROM courses;
update courses set price=400 where course_id=1 returning *;
update courses set price=price*1.05 where course_id=1;
select * from courses;
