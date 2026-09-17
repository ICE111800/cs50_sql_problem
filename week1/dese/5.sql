SELECT schools.city, COUNT(schools.type) AS school_count
FROM schools
WHERE schools.type = 'Public School'
GROUP BY schools.city
HAVING school_count <= 3
ORDER BY school_count DESC, schools.city ASC;