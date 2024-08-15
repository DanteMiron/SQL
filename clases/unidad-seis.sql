--- Creamos tabla continente y los agregamos. 

SELECT
    DISTINCT continent
FROM
    country
ORDER BY
    continent ASC;
    
INSERT INTO
    continent (name)
SELECT
    DISTINCT continent
FROM
    country
ORDER BY
    continent ASC;
    
select * from continent;

---  RESPALDO DE COUNTRY 

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_back" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);

INSERT INTO
    country_back
SELECT
    *
FROM
    country;
    
    
ALTER TABLE


--- tarea


-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
select distinct a."language" from countrylanguage a order by a."language";

-- Actualizar todos los registros
insert into 
	language ("name")
select distinct a."language" from countrylanguage a order by a."language";

-- Cambiar tipo de dato en countrylanguage - languagecode por int4

alter table countrylanguage
alter COLUMN languagecode type int4
USING languagecode::integer;

select language, countrycode, (select code from language b where b."name" = a."language" ) from countrylanguage a;

update countrylanguage a
set languagecode = (select code from language b where b."name" = a."language");

-- Crear el forening key y constraints de no nulo el language_code

-- Revisar lo creado
    
    
