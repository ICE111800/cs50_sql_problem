SELECT players.first_name, players.last_name
FROM players
WHERE players.final_game >= '2022-01-01' AND players.final_game <= '2022-12-31'
ORDER BY players.first_name ASC, players.last_name ASC;