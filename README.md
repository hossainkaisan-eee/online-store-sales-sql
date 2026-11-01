# Online Store Sales Database (SQL)

A beginner-to-intermediate SQL project for a small online shop. It answers three questions: which customers are buying, what they are purchasing, and how much revenue the business generates.

## Why Three Tables?
Instead of one large table with repeated customer and product details, the data is split into `customers`, `products`, and `orders`. Each fact is stored once (a customer's city, a product's price), and `JOIN`s combine them when needed. This avoids duplicate data and makes updates easier.

## Tools Used
- SQL (SQLite syntax)
- SQLite Online (browser-based SQL IDE)

## Database Structure

**customers**

| Column | Type | Description |
|---|---|---|
| customer_id | INTEGER (Primary Key) | Unique ID per customer |
| name | TEXT | Customer name |
| city | TEXT | Customer's city |

**products**

| Column | Type | Description |
|---|---|---|
| product_id | INTEGER (Primary Key) | Unique ID per product |
| product_name | TEXT | Product name |
| category | TEXT | Electronics, Stationery or Lifestyle |
| price | REAL | Price per unit in BDT |

**orders**

| Column | Type | Description |
|---|---|---|
| order_id | INTEGER (Primary Key) | Unique ID per order |
| customer_id | INTEGER (Foreign Key) | Links to `customers` |
| product_id | INTEGER (Foreign Key) | Links to `products` |
| quantity | INTEGER | Units ordered |
| order_date | TEXT | Date in YYYY-MM-DD format |

## Queries Included
1. All orders with customer and product names (`JOIN`)
2. Total revenue (`SUM`)
3. Revenue per category (`GROUP BY`)
4. Revenue per customer, highest first
5. Best-selling product by units sold (`ORDER BY` + `LIMIT`)
6. Revenue per city

## Sample Results

| Query | Result |
|---|---|
| Total revenue | 9150 BDT |
| Top category | Electronics (4650 BDT) |
| Top customer | Nusrat (2400 BDT) |
| Best-selling product | Notebook (15 units) |
| Top city | Dhaka (4450 BDT) |

## How to Run
1. Open any online SQL IDE (e.g. SQLite Online).
2. Paste the contents of `online_store.sql`.
3. Click **Run**.

## What I Learned
- Designing related tables with primary and foreign keys
- Joining multiple tables with `JOIN`
- Calculating revenue with `SUM(quantity * price)`
- Grouping and sorting results with `GROUP BY` and `ORDER BY`

## Next Steps
- Add a query for customers with no orders (`LEFT JOIN`)
- Export the data to CSV and build a small Python pipeline
