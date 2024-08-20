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
