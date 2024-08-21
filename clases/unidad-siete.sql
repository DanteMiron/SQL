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

<<<<<<< HEAD
-- tareas 

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";

select count(*), a.languagecode, a."language"  from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent = c.code
where (a.isofficial = true) AND (c."name" like 'Europe')
group by a.languagecode, a."language"
order by count(*) DESC
limit 1;







-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)

select * from country a
inner join countrylanguage b on a.code = b.countrycode
where b.isofficial = true AND a.continent = 5 AND b.languagecode = 135;
=======
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
>>>>>>> 493deb5df5a67f6d1757a698a1bdd981d582a64f

--tarea 2

select count(*), b.name from city a
inner join country b
on a.countrycode = b.code
group by b.name
order by count(*) DESC
limit 1;