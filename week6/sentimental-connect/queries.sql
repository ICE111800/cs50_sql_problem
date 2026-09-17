-- ============================================================================
-- Search Test
-- ============================================================================

-- 1. 撈出「Reid Hoffman 在 LinkedIn 工作時的職稱是什麼」？
SELECT work_experience.title 
FROM work_experience
JOIN users ON users.id = work_experience.user_id
JOIN companies ON companies.id = work_experience.company_id
WHERE users.first_name = 'Reid' 
  AND users.last_name = 'Hoffman'
  AND companies.name = 'LinkedIn';

-- 2. 撈出「Harvard University 的所有校友」？
SELECT u.first_name, u.last_name 
FROM users AS u
JOIN education AS e ON e.user_id = u.id
JOIN schools AS s ON s.id = e.school_id
WHERE s.name = 'Harvard University';