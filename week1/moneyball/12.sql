SELECT first_name, last_name FROM (
    SELECT id, first_name, last_name FROM 
    (
        SELECT players.id, players.first_name, players.last_name
        FROM players
        JOIN performances ON performances.player_id = players.id
        JOIN salaries ON salaries.player_id = players.id
        WHERE performances.year = 2001
            AND salaries.year = 2001
            AND performances.H > 0
        ORDER BY (salaries.salary / performances.H) ASC
        LIMIT 10
    )
    INTERSECT
    SELECT id, first_name, last_name FROM 
    (
        SELECT players.id, players.first_name, players.last_name
        FROM players
        JOIN performances ON performances.player_id = players.id
        JOIN salaries ON salaries.player_id = players.id
        WHERE performances.year = 2001
            AND salaries.year = 2001
            AND performances.RBI > 0
        ORDER BY (salaries.salary / performances.RBI) ASC
        LIMIT 10
    )
)
ORDER BY id ASC;

