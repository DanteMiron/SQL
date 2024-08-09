
-- CREACION DE PRIMARY KEY

SELECT
    *
FROM
    country;


-- OBSERVAMOS QUE HAY DOS PAISES CON MISMO CODIGO

SELECT
    *
FROM
    country
WHERE
    code = 'NLD';

-- ELIMINO REGISTRO REPETIDO 

DELETE FROM
    country
WHERE
    code2 = 'NA'
    AND code = 'NLD';

-- CONFIGURACION PRIMARY KEY

ALTER TABLE
    country
ADD
    PRIMARY KEY (code);
    
-- Colocamos un check en surfacearea

ALTER TABLE
    country
ADD
    CHECK(
    surfacearea>=0);
    
SELECT * FROM country;

-- Colocamos un check en continent

SELECT
    DISTINCT continent
FROM
    country;
    
ALTER TABLE
    country
ADD
    CHECK(
        (continent = 'Asia' :: text)
        OR (continent = 'South America' :: text)
        OR (continent = 'North America' :: text)
        OR (continent = 'Oceania' :: text)
        OR (continent = 'Antarctica' :: text)
        OR (continent = 'Africa' :: text)
        OR (continent = 'Europe' :: text)
        OR (continent = 'Central America' :: text)
    );
    
SELECT
    *
FROM
    country
WHERE
    code = 'CRI';
    
ALTER TABLE
    country DROP CONSTRAINT "country_continent_check1";

-- CREACION DE INDICES

SELECT * from country WHERE continent = 'Africa';

CREATE INDEX "country_continent" ON country(
continent
);

CREATE UNIQUE INDEX "unique_country_continent" ON country(
name
);