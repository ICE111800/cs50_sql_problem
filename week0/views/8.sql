SELECT views.english_title
FROM views
WHERE views.artist = 'Hokusai'
ORDER BY views.contrast ASC
LIMIT 5;