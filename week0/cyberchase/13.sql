SELECT episodes.title, episodes.season, episodes.topic
FROM episodes
WHERE (episodes.season = 1 OR episodes.season = 2) AND episodes.topic LIKE '%area%';