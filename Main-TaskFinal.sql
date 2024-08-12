/*2. For each Player find which team he was been part of for each seasons and his jersey number*/
select p.id player_id,p.first_name ||' '||p.last_name player_name,j.jersey_number,s.season_id ,
t.city||' '||t.nickname teamname from player_jerseys j inner join players p on p.id=j.player_id
inner join player_seasons s on p.id=s.player_id and DATE_PART('year', j.effective_start)<=s.season_id and 
DATE_PART('year', j.effective_end)>=s.season_id 
inner join team_members tm on s.player_id =tm.player_id and tm.effective_start<= j.effective_start and tm.effective_end<=j.effective_end 
inner join franchises f on tm.franchise_id = f.id and s.league_id =f.league_id  inner join 
teams t on f.id =tm.franchise_id and tm.franchise_id=t.franchise_id and f.id=tm.franchise_id and 
s.season_id >=t.start_season and s.season_id <t.end_season and s.league_id =f.league_id
order by p.id ;

/*4.Find all Player salary cap for each season*/

select
	p.id,
	p.first_name || ' ' || p.last_name player_name,
	c.year season,
	c.cap_hit as 
	salary_cap
from
	players p
inner join contract_active_seasons c on
	p.id = c.player_id
order by
	p.id, c."year"  ;

