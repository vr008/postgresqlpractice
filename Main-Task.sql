
/*Task 1-Player's franchise names in past 10 years*/
SELECT p.id,p.first_name ||' '||p.last_name player_name,f.name franchise_name,c.years 
from players p inner join contracts c on p.id=c.player_id 
inner join franchises f on c.franchise_id =f.id 
where c.years<11 order by c.years DESC;
/*Task 2-Based on game id find the home team name and away team name.*/
select g.id,ht.city||' '||ht.nickname home_team,at.city||' '||at.nickname away_team 
from 
games g inner join franchises hf on g.home_franchise_id= hf.id 
inner join teams ht on hf.id=ht.franchise_id 
inner join franchises af on g.away_franchise_id =af.id
inner join teams at on af.id=at.franchise_id where g.id=732; 