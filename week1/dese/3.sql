SELECT CAST(AVG(expenditures.per_pupil_expenditure) * 100000000000 AS INTEGER) / 100000000000.0 
AS "Average District Per-Pupil Expenditure"
FROM expenditures;
