CREATE VIEW one_bedrooms AS
SELECT id, property_type, host_name, accommodates
FROM listings
WHERE listings.bedrooms = 1;