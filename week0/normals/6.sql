SELECT normals.latitude, normals.longitude, normals."50m"
FROM normals
WHERE (normals.latitude BETWEEN 0 AND 20) AND (normals.longitude BETWEEN 55 AND 75);