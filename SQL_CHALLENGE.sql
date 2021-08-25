SHOW databases;
USE world;
SHOW tables;
DESCRIBE country;
DESCRIBE city;
SELECT * FROM city where CountryCode = 'USA';
SELECT count(CountryCode) FROM city;


-- 2
SELECT Population, LifeExpectancy FROM country WHERE name = 'Argentina';
-- 37032000, 75.1

-- 3
SELECT name, Lifeexpectancy FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;
-- Andorra 83.5


-- 4
SELECT language FROM country c JOIN countrylanguage cl ON c.Code=cl.CountryCode WHERE region LIKE 'Southeast Asia';

-- 5
SELECT a.name, c.name FROM city a JOIN country c ON a.id=c.capital WHERE c.Name LIKE 'Spain';
-- Madrid, Spain

-- 6
SELECT name FROM city WHERE Name LIKE 'F%' LIMIT 25;


-- 7

SELECT count(a.Name) FROM city a JOIN country c ON a.CountryCode=c.code WHERE c.Name LIKE 'China';
-- 363

-- 8
SELECT name, population FROM country WHERE population != 0 ORDER BY POPULATION LIMIT 1;
 -- Pitcairn 50 



-- 10
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10;

-- 11
SELECT a.Name, c.Name, c.Population FROM city a JOIN country c ON a.CountryCode=c.code WHERE c.NAME LIKE '%Japan' ORDER BY Population DESC LIMIT 5;

-- 12
UPDATE country
SET HeadOfState='Elizabeth II'
WHERE HeadOfState='Elisabeth II';
SELECT Name, Code, HeadOfState FROM country WHERE HeadOfState = 'Elizabeth II';

-- 13
SELECT Name, Population, SurfaceArea, (Population/SurfaceArea) FROM country WHERE (Population/SurfaceArea) != 0 ORDER BY (Population/SurfaceArea) ASC LIMIT 10;

-- 14
SELECT DISTINCT language FROM countrylanguage;
-- 15
SELECT name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

-- 16
SELECT distinct language, count(language) as frequency FROM countrylanguage group by language order by frequency desc limit 10;

-- 17
SELECT CountryCode, Percentage, Language FROM countrylanguage WHERE Language ='German' AND Percentage > 50;

-- 18
SELECT * FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy LIMIT 1;

-- 19
SELECT distinct GovernmentForm, count(GovernmentForm) as frequency FROM country group by GovernmentForm order by frequency DESC LIMIT 3;

-- 20
SELECT count(IndepYear) FROM country;



