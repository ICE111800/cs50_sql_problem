-- 新增使用者 Alan Garber
INSERT INTO users (first_name, last_name, username, password)
VALUES ('Alan', 'Garber', 'alan', 'password');

-- 新增使用者 Reid Hoffman
INSERT INTO users (first_name, last_name, username, password)
VALUES ('Reid', 'Hoffman', 'reid', 'password');

-- 新增學校
INSERT INTO schools (name, type, location, founded_year)
VALUES ('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

-- 新增公司
INSERT INTO companies (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- 新增使用者 Alan Garber 的學歷
INSERT INTO academic_certificate (user_id, school_id, start_date, end_date, degree_type)
VALUES (1, 1, '1973-09-01', '1976-06-01', 'BA');

-- 新增使用者 Reid Hoffman 工作經歷
INSERT INTO work_experience (user_id, company_id, start_date, end_date, job_title)
VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');