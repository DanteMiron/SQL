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

