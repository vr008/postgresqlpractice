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