

--#1 
SELECT teacher.name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id
WHERE dept.name IS NULL;

--#2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

--#3 
SELECT teacher.name AS Teachers_name, dept.name AS depart_name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

--#4 
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id



--#5 
SELECT teacher.name, COALESCE(teacher.mobile, '07986 444 2266')
FROM teacher;

--#6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

--#7 
SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher;

--#8 
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;

--#9 
SELECT teacher.name,
  CASE WHEN teacher.dept IN (1, 2)
        THEN 'Sci'
        ELSE 'Art'
  END
FROM teacher;

--#10 
SELECT teacher.name,
  (CASE
   WHEN teacher.dept IN (1,2)
    THEN 'Sci'
   WHEN teacher.dept = 3
    THEN 'Art'
   ELSE 'None'
  END) AS Classified_dept
FROM teacher;
