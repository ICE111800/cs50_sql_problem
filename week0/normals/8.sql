SELECT normals.latitude, normals.longitude, normals."0m"
FROM normals
ORDER BY normals."0m" ASC, normals.latitude ASC
LIMIT 10;