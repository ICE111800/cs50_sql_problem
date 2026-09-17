-- 新增旅客
INSERT INTO passengers (first_name, last_name, age)
VALUES ('Amelia', 'Earhart', 39);

-- 新增航空公司
INSERT INTO airlines (name)
VALUES ('Delta');

-- 新增航空公司的航廈
INSERT INTO airline_concourses (airline_id, concourse)
VALUES (1, 'A'), (1, 'B'), (1, 'C'), (1, 'D'), (1, 'T');

-- 新增航班
INSERT INTO flights (number, airline_id, origin_code, destination_code, departure_time, arrival_time)
VALUES ('300', 1, 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00');

-- 新增 Amelia check-in
INSERT INTO "check-ins" (passenger_id, flight_id, datetime)
VALUES (1, 1, '2023-08-03 15:03:00');

--
SELECT * FROM passengers LIMIT 3;
SELECT * FROM airlines LIMIT 3;
SELECT * FROM airline_concourses LIMIT 5;
SELECT * FROM flights LIMIT 3;
SELECT * FROM "check-ins" LIMIT 3;