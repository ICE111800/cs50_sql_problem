-- ============================================================================
-- Database Initialization & Cleanup
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `linkedin`;
USE `linkedin`;

-- 依照外鍵相依性相反順序刪除舊表 (防止 DROP 時觸發 FK 限制)
DROP TABLE IF EXISTS `work_experience`;
DROP TABLE IF EXISTS `education`;
DROP TABLE IF EXISTS `connections`;
DROP TABLE IF EXISTS `companies`;
DROP TABLE IF EXISTS `schools`;
DROP TABLE IF EXISTS `users`;


-- ============================================================================
-- 1. Core Entities (主體實體表)
-- ============================================================================

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL COMMENT 'Stores hashed password',
    PRIMARY KEY(`id`)
) COMMENT 'User account information'; 

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `founded_year` SMALLINT NOT NULL,
    PRIMARY KEY(`id`)
) COMMENT 'Educational institutions';

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
) COMMENT 'Registered company profiles';


-- ============================================================================
-- 2. Relationships & Affiliations (關聯表與經歷)
-- ============================================================================

CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user_a_id` INT NOT NULL,
    `user_b_id` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_a_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_b_id`) REFERENCES `users`(`id`),
    -- 避免重複建立同一組好友連結
    UNIQUE(`user_a_id`, `user_b_id`)
) COMMENT 'User-to-user mutual connections';

CREATE TABLE `education` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE COMMENT 'NULL indicates currently enrolled', 
    `degree_type` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
) COMMENT 'User education records';

CREATE TABLE `work_experience` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE COMMENT 'NULL indicates current employment',
    `title` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
) COMMENT 'User work history';

