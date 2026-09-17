SELECT views.english_title,views.entropy AS "Complexity"
FROM views
WHERE views.artist = 'Hokusai'
ORDER BY views.entropy DESC
LIMIT 5;