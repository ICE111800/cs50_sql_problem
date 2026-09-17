SELECT  players.first_name, players.last_name, players.debut
FROM players
WHERE players.birth_city = 'Pittsburgh' AND players.birth_state = 'PA'
ORDER BY players.debut DESC, players.first_name ASC, players.last_name ASC;