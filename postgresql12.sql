select exists(select noise_level from stadiums where noise_level>137);
select games.name from stadiums inner join games on games.stadium_id = stadiums.id where exists(select noise_level from stadiums where noise_level>137);
select games.name from stadiums inner join games on games.stadium_id = stadiums.id where not exists(select noise_level from stadiums where noise_level<137);
select games.name from stadiums inner join games on games.stadium_id = stadiums.id where exists(select null);
with stadium_games as (select games.name,games.stadium_id from stadiums inner join games on games.stadium_id = stadiums.id)
select t.stadium_id,t.franchise_id from team_stadiums t inner join stadium_games  on t.stadium_id=stadium_games.stadium_id;  

CREATE TABLE product_segment (
    id SERIAL PRIMARY KEY,
    segment VARCHAR NOT NULL,
    discount NUMERIC (4, 2)
);


INSERT INTO 
    product_segment (segment, discount)
VALUES
    ('Grand Luxury', 0.05),
    ('Luxury', 0.06),
    ('Mass', 0.1);

   CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    price NUMERIC(10,2),
    net_price NUMERIC(10,2),
    segment_id INT NOT NULL,
    FOREIGN KEY(segment_id) REFERENCES product_segment(id)
);


INSERT INTO 
    product (name, price, segment_id) 
VALUES 
    ('diam', 804.89, 1),
    ('vestibulum aliquet', 228.55, 3),
    ('lacinia erat', 366.45, 2),
    ('scelerisque quam turpis', 145.33, 3),
    ('justo lacinia', 551.77, 2),
    ('ultrices mattis odio', 261.58, 3),
    ('hendrerit', 519.62, 2),
    ('in hac habitasse', 843.31, 1),
    ('orci eget orci', 254.18, 3),
    ('pellentesque', 427.78, 2),
    ('sit amet nunc', 936.29, 1),
    ('sed vestibulum', 910.34, 1),
    ('turpis eget', 208.33, 3),
    ('cursus vestibulum', 985.45, 1),
    ('orci nullam', 841.26, 1),
    ('est quam pharetra', 896.38, 1),
    ('posuere', 575.74, 2),
    ('ligula', 530.64, 2),
    ('convallis', 892.43, 1),
    ('nulla elit ac', 161.71, 3);
 update product set price=price-price*discount*2 from product_segment where product.segment_id=product_segment.id;
 delete from product where segment_id=2;
 select * from product;
 delete from product using product_segment where product.segment_id=product_segment.id;
 delete from product where segment_id in(select id from product_segment);
 
   CREATE TABLE products(
    id INT primary key,
    name VARCHAR NOT NULL,
    price NUMERIC(10,2),
    segment_id INT NOT NULL
);
insert into products (id,name, price, segment_id) values (1,'paste',200,1);
insert into products (id,name,price,segment_id) values(1,'halls',300,1) on conflict(id) do update set name=excluded.name , price=excluded.price;
select * from products;