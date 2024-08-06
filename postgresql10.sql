select name from cities union select name from stadiums;
select id from games union all select game_id from game_officials order by id;
select id from schools union select school_id from players union all select id from cities order by id;
select first_name,last_name,avg(height) from players group by grouping sets(
(first_name,last_name),
(first_name),
(last_name),
()
);
select grouping(first_name) group_first_name,grouping(current_class) group_current_class,first_name,current_class,avg(height)
from players group by grouping sets((first_name),(current_class)) order by first_name ,current_class ;
select grouping(s.name),grouping(g.name),s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by grouping sets((s.name),(g.name));
select grouping(s.name) stadium_group,grouping(g.name) grass_group,s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by grouping sets((s.name),(g.name)) having grouping(s.name) =1 order by s.name,g.name;
select s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by cube(s.name,g.name) order by s.name,g.name;
select s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by s.name,cube(s.name,g.name) order by s.name,g.name;
select s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by s.name,cube(g.name) order by s.name,g.name;
select name from stadiums where grass_type_id=(select id from grass_types where id=1);
select name from stadiums where grass_type_id in (select id from grass_types);
select s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by rollup(s.name,g.name) order by s.name,g.name;
select s.name,g.name,avg(s.elevation) from stadiums s inner join grass_types g on s.grass_type_id =g.id group by s.name,rollup(g.name) order by s.name,g.name;
select EXTRACT (YEAR FROM time) y,EXTRACT (MONTH FROM time) M,EXTRACT (DAY FROM time) d,COUNT (game_id) from game_weather GROUP by ROLLUP (
EXTRACT (YEAR FROM time),EXTRACT (MONTH FROM time),EXTRACT (DAY FROM time));
select grass_type_id,stadiums.name from stadiums inner join grass_types on stadiums.grass_type_id=grass_types.id where stadiums.name ilike 'a%' order by stadiums.name;
select id,name,noise_level from stadiums s where noise_level >(select avg(noise_level) from stadiums where id=s.id);