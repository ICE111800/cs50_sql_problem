-- 1. 根據學生 ID 查詢歷史選課（查某人選了哪些課）。
-- EXPLAIN QUERY PLAN
-- SELECT courses.title, courses.semester
-- FROM enrollments
-- JOIN courses ON courses.id = enrollments.course_id
-- JOIN students ON students.id = enrollments.student_id
-- WHERE students.id = 3;

CREATE INDEX "enrollments_by_student_id"
ON enrollments (student_id, course_id);

-- 2. 查詢 2023 秋季班選修 CS50 的所有學生。
-- EXPLAIN QUERY PLAN
-- SELECT students.id, students.name
-- FROM students
-- WHERE students.id IN (
--     SELECT enrollments.student_id
--     FROM enrollments
--     WHERE enrollments.course_id = (
--         SELECT courses.id
--         FROM courses
--         WHERE courses.department = 'Computer Science'
--         AND courses.number = 50
--         AND courses.semester = 'Fall 2023'
--     )
-- );

CREATE INDEX "CS50_Fall_2023_Course"
ON courses (department, number, semester);

CREATE INDEX "enrollments_by_course_id"
ON enrollments (course_id, student_id);

-- 3. 將 2023 秋季班的課程依選課人數由多到少排序。
-- EXPLAIN QUERY PLAN
-- SELECT courses.id, courses.department, courses.number, courses.title, COUNT(*) AS "enrollment"
-- FROM courses
-- JOIN enrollments ON enrollments.course_id = courses.id
-- WHERE courses.semester = 'Fall 2023'
-- GROUP BY courses.id
-- ORDER BY enrollment DESC;


-- 4. 查詢 2024 春季班開的所有資工系課程。
-- EXPLAIN QUERY PLAN
-- SELECT courses.id, courses.department, courses.number, courses.title
-- FROM courses
-- WHERE courses.department = 'Computer Science'
-- AND courses.semester = 'Spring 2024';


-- 5. 查詢「Advanced Databases」在 2023 秋季班滿足了什麼畢業要求。
-- EXPLAIN QUERY PLAN
-- SELECT requirements.name
-- FROM requirements
-- WHERE requirements.id = (
--     SELECT requirement_id
--     FROM satisfies
--     WHERE course_id = (
--         SELECT courses.id
--         FROM courses
--         WHERE courses.title = 'Advanced Databases'
--         AND courses.semester = 'Fall 2023'
--     )
-- );

CREATE INDEX "idx_satisfies_course_id_and_requirement_id"
ON satisfies (course_id, requirement_id);

-- 6. 統計某個學生在各個畢業要求項目中已經滿足了幾門課。
-- EXPLAIN QUERY PLAN
-- SELECT requirements.name, COUNT(*) AS "courses"
-- FROM requirements
-- JOIN satisfies ON satisfies.requirement_id = requirements.id
-- WHERE satisfies.course_id IN (
--     SELECT course_id
--     FROM enrollments
--     WHERE enrollments.student_id = 8
-- )
-- GROUP BY requirements.name;

--7. 用課名開頭與學期搜尋課程（例如用 title LIKE 'History%'）。
-- EXPLAIN QUERY PLAN
-- SELECT courses.department, courses.number, courses.title
-- FROM courses
-- WHERE courses.title LIKE 'History%'
-- AND courses.semester = 'Fall 2023';

CREATE INDEX "idx_courses_semester_title"
ON courses (semester, title);