DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    city        TEXT
);

CREATE TABLE products (
    product_id   INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category     TEXT,
    price        REAL
);

CREATE TABLE orders (
    order_id    INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id  INTEGER,
    quantity    INTEGER,
    order_date  TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Rahim',  'Dhaka'),
(2, 'Nusrat', 'Chattogram'),
(3, 'Karim',  'Khulna'),
(4, 'Sadia',  'Dhaka'),
(5, 'Tanvir', 'Sylhet');

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Wireless Mouse', 'Electronics', 800),
(2, 'Keyboard',       'Electronics', 1500),
(3, 'Notebook',       'Stationery',  120),
(4, 'Water Bottle',   'Lifestyle',   450),
(5, 'USB Cable',      'Electronics', 250),
(6, 'Backpack',       'Lifestyle',   1800);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, 2,  '2026-10-01'),
(2, 2, 3, 5,  '2026-10-02'),
(3, 3, 2, 1,  '2026-10-02'),
(4, 1, 5, 3,  '2026-10-03'),
(5, 4, 4, 2,  '2026-10-04'),
(6, 2, 6, 1,  '2026-10-05'),
(7, 5, 1, 1,  '2026-10-06'),
(8, 4, 3, 10, '2026-10-07');

SELECT * FROM orders;


-- 1. Every order with customer and product names
SELECT o.order_id, c.name, p.product_name, o.quantity, o.order_date
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

--2. Total revenue 
SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o 
JOIN products p ON o.product_id= p.product_id;

--3. Revenue per category 
SELECT p.category, SUM(o.quantity * p.price) AS revenue
FROM orders o 
JOIN products p ON o.product_id= p.product_id
GROUP BY p.category 
ORDER BY revenue DESC;

--4. Revenue per customer, highest first 
SELECT c.name, SUM(o.quantity * p.price) AS total_spent 
FROM orders o
JOIN customers c ON o.customer_id= c.customer_id
JOIN products p  ON  o.product_id  = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

--5. Best-selling product by quantity 
SELECT p.product_name, SUM(o.quantity) AS units_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name 
ORDER BY units_sold desc 
LIMIT 1;

--6. Revenue per city 
SELECT c.city, SUM(o.quantity * p.price) AS revenue
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p  ON  o.product_id = p.product_id 
GROUP BY c.city
ORDER BY revenue DESC;

























