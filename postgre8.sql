CREATE TABLE top_rated_films(
  title VARCHAR NOT NULL, 
  release_year SMALLINT
);

CREATE TABLE most_popular_films(
  title VARCHAR NOT NULL, 
  release_year SMALLINT
);

INSERT INTO top_rated_films(title, release_year) 
VALUES 
   ('The Shawshank Redemption', 1994), 
   ('The Godfather', 1972), 
   ('The Dark Knight', 2008),
   ('12 Angry Men', 1957);

INSERT INTO most_popular_films(title, release_year) 
VALUES 
  ('An American Pickle', 2020), 
  ('The Godfather', 1972), 
  ('The Dark Knight', 2008),
  ('Greyhound', 2020);

SELECT *
FROM most_popular_films 
INTERSECT
SELECT *
FROM top_rated_films
ORDER BY release_year;
SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films;
SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films
ORDER BY title;
DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300)
RETURNING *;
select brand,segment,sum(quantity) from sales group by brand,segment;
select brand,sum(quantity) from sales group by brand;
select segment,sum(quantity) from sales group by segment;
select sum(quantity) from sales;
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;