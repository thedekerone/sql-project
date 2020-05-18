--#1 
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

--#2
SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population >
  (SELECT gdp/population FROM world
  WHERE name = 'United kingdom');

--#3

SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
OR
continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;

--#4 
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND
population < (SELECT population FROM world WHERE name = 'Poland');

--#5
SELECT name,
       CONCAT(ROUND(100*population/(SELECT population
                                    FROM world
                                    WHERE name = 'Germany'))
        , '%')
FROM world
WHERE continent = 'Europe';

--#6 
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT MAX(gdp)
                           FROM world
                          WHERE continent = 'Europe');



--#7 
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

--# this also work in place of the above...
SELECT w1.continent, name, w1.area
  FROM world AS w1
  JOIN (SELECT continent, MAX(area) AS area
          FROM world
         GROUP BY continent) AS w2
    ON w1.continent = w2.continent
   AND w1.area = w2.area;




--#8 
SELECT continent, name FROM world x
WHERE name = (SELECT name
                  FROM world y
                  WHERE  x.continent =  y.continent
                  ORDER BY name ASC
                  LIMIT 1);
-- you can also do the above likewise as :
SELECT continent, MIN(name) AS name
FROM world
GROUP BY continent
ORDER by continent;


--#9 
SELECT name, continent, population
FROM world x
WHERE NOT EXISTS (                
   SELECT *
   FROM world y
   WHERE y.continent = x.continent 
   AND y.population > 25000000    
   );


--#10 
SELECT name, continent FROM world x
WHERE population > ALL(SELECT population*3
                       FROM world y
                       WHERE y.continent=x.continent AND y.name != x.name);
