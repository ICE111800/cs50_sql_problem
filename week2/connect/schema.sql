-- 每次進來 read 都刷新表，把舊表刪除
DROP TABLE IF EXISTS work_experience;
DROP TABLE IF EXISTS academic_certificate;
DROP TABLE IF EXISTS connections;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS users;

-- 1. 使用者表
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

-- 2. 學校表
CREATE TABLE schools (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location NOT NULL,
    founded_year INTEGER
);

-- 3. 公司表
CREATE TABLE companies (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);

-- 4. 關係表
CREATE TABLE connections (
    id INTEGER PRIMARY KEY,
    user_a_id INTEGER,
    user_b_id INTEGER,
    FOREIGN KEY (user_a_id) REFERENCES users(id),
    FOREIGN KEY (user_b_id) REFERENCES users(id)
);

-- 5. 學業證明表
CREATE TABLE academic_certificate (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    school_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE,
    degree_type TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id)
);

-- 6. 工作經歷表
CREATE TABLE work_experience (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    company_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE,
    job_title TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

-- 直接插入這些測試資料
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