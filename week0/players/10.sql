SELECT players.first_name, players.last_name, players.weight AS 'Heavy Weight'
FROM players
WHERE players.throws = 'L' AND players.height >= 79
ORDER BY players.weight DESC, players.first_name ASC, players.last_name ASC;