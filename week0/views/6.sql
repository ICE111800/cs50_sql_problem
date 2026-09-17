SELECT ROUND(AVG(views.entropy), 2) AS 'Hiroshige Average Entropy'
FROM views
WHERE views.artist = 'Hiroshige';
