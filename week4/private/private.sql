-- 創建暗語密碼表
CREATE TABLE password (
    id INTEGER PRIMARY KEY,
    sentence_id INTEGER,
    start_char_position INTEGER,
    char_length INTEGER
);

-- 插入密碼線索
INSERT INTO password (sentence_id, start_char_position, char_length)
VALUES (14, 98, 4),
       (114, 3, 5),
       (618, 72, 9),
       (630, 7, 3),
       (932, 12, 5),
       (2230, 50, 7),
       (2346, 44, 10),
       (3041, 14, 5);

-- 實驗字串切片語法
-- SELECT substr(sentence, start_char_position, char_length) 
-- FROM sentences
-- JOIN password ON password.sentence_id = sentences.id;

-- 正式創建 message VIEW
CREATE VIEW message AS
SELECT substr(sentence, start_char_position, char_length) AS phrase
FROM sentences
JOIN password ON password.sentence_id = sentences.id
ORDER BY password.id ASC;