CREATE VIEW rural AS
SELECT id, district, locality, families, households, population, male, female
FROM census
WHERE census.locality LIKE '%rural%';

-- SELECT * FROM rural LIMIT 6;