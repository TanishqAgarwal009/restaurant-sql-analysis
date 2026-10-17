# Restaurant Business Analytics Using SQL

## Project Overview

This project uses PostgreSQL to analyze restaurant business data and generate insights into sales performance, customer reviews, delivery efficiency, and outlet performance.

The goal is to transform raw restaurant data into meaningful business insights using SQL queries and aggregate analysis.

## Project Objectives

- Analyze restaurant sales and revenue performance.
- Identify the best-performing outlets in each city.
- Determine popular menu items and food categories.
- Calculate estimated item costs and profit margins.
- Evaluate delivery times and customer satisfaction.
- Analyze order cancellations and outlet performance.

## Tools and Technologies

- Database: PostgreSQL
- Query Tool: pgAdmin 4
- Language: SQL
- Version Control: GitHub

## Dataset

The project uses the following tables:

| Table | Description |
|---|---|
| `outlets` | Restaurant outlet details and locations |
| `customers` | Customer information |
| `menu_items` | Menu item details, categories, prices, and costs |
| `orders` | Order information, status, and delivery time |
| `order_items` | Items and quantities associated with orders |
| `reviews` | Customer ratings and feedback |

## Business Questions and Analysis

1. **Outlet Performance:** Which outlet generates the highest gross item sales in each city?
2. **Menu Item Analysis:** Which menu items sell the most?
3. **Category Analysis:** Which food categories perform best across cities?
4. **Sales Analysis:** How do gross item sales change month by month?
5. **Profitability Analysis:** What are the estimated costs and margins for each menu item?
6. **Delivery Performance:** Which outlets have longer average delivery times?
7. **Customer Satisfaction:** Which outlets receive lower average ratings?
8. **Cancellation Analysis:** What percentage of orders are cancelled at each outlet?
9. **Executive Performance Report:** How do outlets compare in delivered orders, gross item sales, delivery time, customer ratings, and cancellation rates?

## SQL Concepts Practiced

- SELECT, WHERE, and ORDER BY
- GROUP BY and aggregate functions
- INNER JOIN and LEFT JOIN
- Common Table Expressions (CTEs)
- Subqueries
- Window functions such as RANK() and LAG()
- Date and time functions
- Conditional aggregation
- Revenue, cost, margin, and cancellation-rate calculations
- Handling missing values and avoiding duplicate counts

## Project Structure

```text
restaurant-sql-analytics/
|
├── README.md
├── sql/
│   ├── postgreSQL-02.sql
│   ├── postgreSQL-03.sql
│   └── ...
|
├── data/
│   ├── outlets.csv
│   ├── customers.csv
│   ├── menu_items.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── reviews.csv
|
└── results/
    └── restaurant_sql_report.pdf
```

Note: Update the filenames and folders to match the actual contents of your repository.

## Key Business Metrics

- **Gross Item Sales:** Total quantity sold multiplied by item selling price for delivered orders.
- **Estimated Item Cost:** Total quantity sold multiplied by the estimated cost per item.
- **Estimated Item Margin:** Gross item sales minus estimated item cost.
- **Average Delivery Time:** Average recorded delivery time for delivered orders.
- **Average Customer Rating:** Average rating from customer reviews.
- **Cancellation Rate:** Cancelled orders divided by total orders, multiplied by 100.

Estimated item margin is not the same as net profit because other operating expenses are not included.

## Key Learnings

- Writing SQL queries to solve practical business problems.
- Combining multiple tables to create meaningful reports.
- Using aggregation and window functions for business analysis.
- Calculating and comparing key performance indicators.
- Organizing SQL scripts and documenting a data analytics project.

## How to Use

1. Clone or download this repository.
2. Install PostgreSQL and open pgAdmin 4.
3. Create a database for the project.
4. Import the CSV files into their corresponding tables.
5. Open the SQL scripts from the `sql/` folder.
6. Execute the queries and review the results.
7. Refer to the `results/` folder for the project report, if available.

## Author

Created as a hands-on SQL data analytics project to practice PostgreSQL and develop business analysis skills.

## Project Focus

SQL | PostgreSQL | Restaurant Analytics |Data Analysis
