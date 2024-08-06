select * from leads;
select p.id player_id,p.first_name ||' '||p.last_name player_name,s.name school_name,c.name hometown into player_details from 
players p inner join schools s on p.school_id=s.id inner join cities c on s.city_id=c.id order by p.id;
select * from player_details; 
select p.id player_id,p.first_name ||' '||p.last_name player_name,s.name school_name,c.name hometown into player_detail from 
players p inner join schools s on p.school_id=s.id inner join cities c on s.city_id=c.id  where c.name ilike 'london' order by p.id;
select * from player_detail; 

create table details as select p.id,p.name,p.price,s.segment from product p inner join product_segment s on p.segment_id = s.id;
select * from details;
CREATE SEQUENCE mysequen
minvalue 2
maxvalue 5
INCREMENT 1
START 2
cycle;
select nextval('mysequen') ;
drop sequence mysequen;
CREATE TABLE contacts(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   full_name VARCHAR(101) GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED,
   email VARCHAR(300) UNIQUE
);
INSERT INTO contacts(first_name, last_name, email)
VALUES
   ('John', 'Doe', 'john.doe@postgresqltutorial.com'),
   ('Jane', 'Doe', 'jane.doe@postgresqltutorial.com')
RETURNING *;

CREATE TABLE contact(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   full_name VARCHAR(101) GENERATED ALWAYS AS (first_name || ' ' || last_name) virtual           ,
   email VARCHAR(300) UNIQUE
);
INSERT INTO contact(first_name, last_name, email)
VALUES
   ('John', 'Doe', 'john.doe@postgresqltutorial.com'),
   ('Jane', 'Doe', 'jane.doe@postgresqltutorial.com')
RETURNING *;

DROP TABLE IF EXISTS links;

CREATE TABLE links (
   link_id serial PRIMARY KEY,
   title VARCHAR (512) NOT NULL,
   url VARCHAR (1024) NOT NULL
);

ALTER TABLE links
ADD COLUMN active boolean;
ALTER TABLE links 
DROP COLUMN active;
ALTER TABLE links 
RENAME COLUMN title TO link_title;
ALTER TABLE links 
ADD COLUMN target VARCHAR(10);
ALTER TABLE links 
ALTER COLUMN target
SET DEFAULT '_blank';

INSERT INTO links (link_title, url)
VALUES('PostgreSQL Tutorial','https://www.postgresqltutorial.com/');
SELECT * FROM links;
ALTER TABLE links 
ADD CHECK (target IN ('_self', '_blank', '_parent', '_top'));
INSERT INTO links(link_title,url,target) 
VALUES('PostgreSQL','http://www.postgresql.org/','whatever');
ALTER TABLE links 
RENAME TO urls;
create view product_details as select p,name,p.price,s.segment from product p inner join product_segment s on p.segment_id=s.id;
select * from product_details;
create table backup_details as table product;
