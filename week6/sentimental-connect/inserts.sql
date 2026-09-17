-- ============================================================================
-- Insert Test Data
-- ============================================================================

-- 1. 先寫入主表 (Users, Schools, Companies)
INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES ('Claudine', 'Gay', 'claudine', 'password');

INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools` (`name`, `type`, `location`, `founded_year`)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO `companies` (`name`, `industry`, `location`)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- 2. 再寫入關聯子表 (Education, Work Experience)
INSERT INTO `education` (`user_id`, `school_id`, `start_date`, `end_date`, `degree_type`)
VALUES (1, 1, '1993-01-01', '1998-12-31', 'PhD');

INSERT INTO `work_experience` (`user_id`, `company_id`, `start_date`, `end_date`, `title`)
VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');