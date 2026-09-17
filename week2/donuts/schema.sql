-- 每次進來 read 都刷新表，把舊表刪除
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS donuts;
DROP TABLE IF EXISTS ingredients;

-- 1.成分表
CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    unit TEXT NOT NULL,
    price_per_unit REAL NOT NULL
);

-- 2. 甜甜圈表
CREATE TABLE donuts (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    gluten_free INTEGER NOT NULL,
    price REAL NOT NULL
);

-- 3. 顧客資訊
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- 4. 訂單
CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 5. 訂單項目
CREATE TABLE order_items (
    id INTEGER PRIMARY KEY,
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

-- 6. 食譜
CREATE TABLE recipes (
    id INTEGER PRIMARY KEY,
    ingredient_id INTEGER,
    donut_id INTEGER,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

-- 直接插入這些測試資料
-- 原物料資料
INSERT INTO ingredients (name, unit, price_per_unit)
VALUES ('Cocoa', 'pound', 5.00),
       ('Sugar', 'pound', 2.00),
       ('Flour', 'pound', 10.00),
       ('Buttermilk', 'milliliter', 8.00),
       ('Sprinkles', 'pound', 3.00);

-- 甜甜圈資料
INSERT INTO donuts (name, gluten_free, price)
VALUES ('Belgian Dark Chocolate', 0, 4.00),
       ('Back-To-School Sprinkles', 0, 4.00);

-- 食譜配方資料
INSERT INTO recipes (ingredient_id, donut_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (2, 2),
       (3, 2),
       (4, 2),
       (5, 2);

-- 顧客資料
INSERT INTO customers (first_name, last_name)
VALUES ('Luis', 'Singh');

-- 訂單與明細資料 (訂單點了 3 個巧克力、2 個糖霜)
INSERT INTO orders (customer_id)
VALUES (1);

INSERT INTO order_items (order_id, donut_id, quantity)
VALUES (1, 1, 3),
       (1, 2, 2);