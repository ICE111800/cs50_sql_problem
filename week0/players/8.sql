SELECT ROUND(AVG(players.height), 2) AS "Average Height", ROUND(AVG(players.weight), 2) AS "Average Weight"
FROM players
WHERE players.debut >= '2000-01-01';