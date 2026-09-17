SELECT COUNT(*)
FROM players
WHERE (players.bats = 'R' AND players.throws = 'L') 
    OR (players.bats = 'L' AND players.throws = 'R');