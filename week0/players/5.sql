SELECT players.first_name, players.last_name
FROM players
WHERE players.bats = 'R'
ORDER BY players.first_name ASC, players.last_name ASC;