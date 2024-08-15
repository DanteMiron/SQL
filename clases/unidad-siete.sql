-- UNIONES

select code, name from continent where name like '%America%'
UNION
select code, name from continent where code in (3,5)
order by code ASC;


select
    a.name as country,
    b."name" as continent
from
    country a,
    continent b
where
    a.continent = b.code
order by
    a.name asc;
    
select a.name as country, b.name as continent from country a
inner join continent b on a.continent = b.code
order by a.name asc;

--- FULL OUTER JOIN

select
    a.name,
    a.continent as codeContinent,
    b.name as continentName
from
    country a 
   full outer join continent b on a.continent = b.code
order by 
	a.name DESC;

--- RIGTH OUTER JOIN 

select
    a.name,
    a.continent as codeContinent,
    b.name as continentName
from
    country a 
right join  continent b on a.continent = b.code
where a.continent IS NULL
order by 
	a.name DESC;

--- union 

(select count(*) as count, b.name as continentName
from country a
inner join continent b 
on a.continent = b.code
group by b."name"
)
union
(
select 0 as count, b.name as continentName
from country a
right join continent b 
on a.continent = b.code
where a.continent is null
group by b."name"
)
order by count ASC;

--TAREA

(select count(*) as Total, b.name as continent from country a
inner join continent b 
on a.continent = b.code
where b.name not like '%America%'
group by b.name 
)
union
(select count(*) as Total, 'America' from country a 
inner join continent b 
on a.continent = b.code
where b.name like '%America%')

order by Total ASC;
