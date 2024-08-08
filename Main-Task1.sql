/*2. For each Player find which team he was been part of for each seasons and his jersey number*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,j.jersey_number,
s.season_id season,t.city ||' '|| t.nickname team_name 
from player_jerseys j inner join players p on p.id=j.player_id inner join player_seasons s on p.id=s.player_id
inner join franchises f on f.id=p.college_id 
inner join teams t on t.franchise_id =f.id order by player_id;

/*4.Find all Player salary cap for each season*
select p.id player_id,p.first_name ||' '||p.last_name player_name,c.year season,c.cap_hit salary_cap 
from contract_active_seasons  c inner join players p on c.player_id=p.id order by player_id;
*/

/*4.Find all Player salary cap for each season*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,c.start_year season,c.apy salary_cap 
from contracts c inner join players p on c.player_id=p.id inner join 
contract_active_seasons cas on cas.contract_id=c.id order by p.id;