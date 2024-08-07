/*2. For each Player find which team he was been part of for each seasons and his jersey number*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,j.jersey_number,
s.season_id season,t.city ||' '|| t.nickname team_name 
from player_jerseys j inner join players p on p.id=j.player_id inner join player_seasons s on p.id=s.player_id
inner join franchises f on f.id=p.college_id 
inner join teams t on t.franchise_id =f.id order by player_id;



/*3.Find all player Injury details for each season*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,ps.season_id,ict.name injury_category,
ilt.name injury_location,itt.name injury_timing,it.name injury_type from
players p inner join player_seasons ps on p.id=ps.player_id inner join player_injury_details pid on p.id=pid.player_id 
inner join injury_category_types ict on pid.injury_category_type_id =ict.id inner join injury_location_types ilt 
on pid.injury_location_type_id=ilt.id inner join injury_timing_types itt on pid.injury_timing_type_id =itt.id 
inner join injury_types it on pid.injury_type_id =it.id order by p.id;

/*1.Get a count of plays played in Stadium (Over all) and also get a info for
  which seasons a particular Stadiums a play has been played*/
select s.id stadium_id ,s.name stadium_name,count(g.id) total_plays from games g inner join stadiums s 
on g.stadium_id =s.id group by s.id;
select s.id stadium_id ,s.name,g.id play_id,g.name play_name,g.season_id season from games g inner join stadiums s 
on g.stadium_id =s.id order by g.season_id ;

/*4.Find all Player salary cap for each season*
select p.id player_id,p.first_name ||' '||p.last_name player_name,c.year season,c.cap_hit salary_cap 
from contract_active_seasons  c inner join players p on c.player_id=p.id order by player_id;
*/

/*4.Find all Player salary cap for each season*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,c.start_year season,c.apy salary_cap 
from contracts c inner join players p on c.player_id=p.id inner join 
contract_active_seasons cas on cas.contract_id=c.id order by p.id;