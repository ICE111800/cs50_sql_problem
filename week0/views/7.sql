SELECT views.english_title
FROM views
WHERE views.artist = 'Hiroshige'
ORDER BY views.brightness DESC
LIMIT 5;