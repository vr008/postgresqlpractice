select player_id,sum(signing_bonus) from contracts group by player_id order by player_id;
select c.player_id,p.first_name ||' '||p.last_name  full_name,sum(c.cash_bonus) from players p inner join contract_active_seasons c on p.id=c.player_id group by c.player_id,full_name order by c.player_id;
select s.id,s.name,f.name,count(t.id) from stadiums s inner join team_stadiums t on s.id=t.stadium_id inner join franchises f on t.franchise_id =f.id group by f.name ,s.id,t.id order by t.id;
select generic_position ,count(generic_position) from position_generic_types group by generic_position order by generic_position;
select c.name,count(s.city_id) from cities c inner join schools s on c.id=s.city_id group by c.id;
select sum(height) ,dob :: date dob from players group by dob:: date order by dob; 
select g.name,avg(w.cloud_cover),avg(w.dew_point) from games g inner join game_weather w on g.id=w.game_id group by g.name having avg(w.cloud_cover)>8.6 and avg(w.cloud_cover)>17.8 order by g.name;