SELECT ROUND(AVG(normals."0m"), 2) AS "Average Equator Ocean Surface Temperature"
FROM normals
WHERE normals.latitude BETWEEN -0.5 AND 0.5;