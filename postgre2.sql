select  last_name from customer order by first_name desc
select  last_name from customer order by first_name asc
select first_name ,last_name from customer order by first_name desc,last_name  asc;
select first_name, length(last_name) len from customer order by len desc;
-- create a new table
CREATE TABLE sort_demo(num INT);

-- insert some data
INSERT INTO sort_demo(num)  VALUES (1);
INSERT INTO sort_demo(num)  VALUES (2);
INSERT INTO sort_demo(num)  VALUES (3);
INSERT INTO sort_demo(num)  VALUES (null);
SELECT 
  num 
FROM 
  sort_demo 
ORDER BY 
  num NULLS FIRST;
  
 SELECT 
  num 
FROM 
  sort_demo 
ORDER BY 
  num DESC NULLS FIRST;