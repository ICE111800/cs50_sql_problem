DROP TABLE IF EXISTS "check-ins";
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS airline_concourses;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS passengers;

-- 1.旅客表
CREATE TABLE passengers (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL
);

-- 2.航空表
CREATE TABLE airlines (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 3.航空公司與航廈關聯表
CREATE TABLE airline_concourses (
    id INTEGER PRIMARY KEY,
    airline_id INTEGER ,
    concourse TEXT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(id)
);

-- 4.航班表
CREATE TABLE flights (
    id INTEGER PRIMARY KEY,
    number TEXT NOT NULL,
    airline_id INTEGER,
    origin_code TEXT NOT NULL,
    destination_code TEXT NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);

-- 5.報到表
CREATE TABLE "check-ins" (
    id INTEGER PRIMARY KEY,
    flight_id INTEGER,
    passenger_id INTEGER,
    datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (flight_id) REFERENCES flights(id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(id)
);





