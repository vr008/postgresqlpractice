select COUNT(*) from customer
select COUNT(distinct(first_name)) from customer
CREATE TABLE colors(
  id SERIAL PRIMARY KEY, 
  bcolor VARCHAR, 
  fcolor VARCHAR
);
INSERT INTO
  colors (bcolor, fcolor)
VALUES
  ('red', 'red'),
  ('red', 'red'),
  ('red', NULL),
  (NULL, 'red'),
  (NULL, NULL),
  ('green', 'green'),
  ('blue', 'blue'),
  ('blue', 'blue');
  SELECT 
  id, 
  bcolor, 
  fcolor 
FROM 
  colors;
 SELECT DISTINCT bcolor FROM colors ORDER BY bcolor;
 select distinct rental_duration from film order by rental_duration;