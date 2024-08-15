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
    country DROP CONSTRAINT country_continent_check;
    
    
