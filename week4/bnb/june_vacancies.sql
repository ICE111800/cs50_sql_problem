CREATE VIEW june_vacancies AS
SELECT listings.id, listings.property_type, listings.host_name, COUNT(listings.id) AS days_vacant
FROM listings
LEFT JOIN availabilities ON availabilities.listing_id = listings.id
WHERE availabilities.available = 'TRUE' AND availabilities.date LIKE '2023-06%'
GROUP BY listings.id;
