SELECT districts.name AS "District Name", expenditures.per_pupil_expenditure AS "Per-Pupil Expenditure", 
COUNT(schools.id) AS "Low Performing Schools Count"
FROM districts
JOIN expenditures ON expenditures.district_id = districts.id
JOIN schools ON schools.district_id = districts.id
JOIN graduation_rates ON graduation_rates.school_id = schools.id
WHERE districts.type = 'Public School District'
    AND expenditures.per_pupil_expenditure > (
        SELECT AVG(expenditures.per_pupil_expenditure)
        FROM expenditures
    )
    AND graduation_rates.graduated < (
        SELECT AVG(graduation_rates.graduated)
        FROM graduation_rates
    )
GROUP BY districts.id, districts.name, expenditures.per_pupil_expenditure
HAVING COUNT(schools.id) >= (
    SELECT COUNT(*) * 0.5
    FROM schools AS s
    WHERE s.district_id = districts.id
)
ORDER BY expenditures.per_pupil_expenditure DESC;