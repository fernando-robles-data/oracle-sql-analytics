# Oracle SQL Analytics & Data Quality

A portfolio project demonstrating Oracle SQL skills through relational data modeling, sales analysis, analytical functions, and data quality validation.

## Project Overview

This project simulates a small sales database involving customers, orders, and order items. It demonstrates how Oracle SQL can be used to structure relational data, analyze sales performance, and identify potential data quality issues.

The dataset contains fictional records created for demonstration purposes.

## Objectives

- Design relational tables with primary keys, foreign keys, and check constraints.
- Insert sample data into an Oracle database.
- Analyze orders and sales by status and customer.
- Apply Common Table Expressions (CTEs) and analytical functions.
- Identify potential data quality issues and duplicate customer names.
- Document the data model and database rules.

## Technologies

- **Database:** Oracle Database
- **Language:** Oracle SQL
- **Version Control:** Git and GitHub

## Repository Structure

```text
oracle-sql-analytics/
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_sample_data.sql
│   ├── 03_sales_analysis.sql
│   └── 04_data_quality.sql
├── docs/
│   └── data_dictionary.md
└── README.md
```

## SQL Features Demonstrated

| Feature | Application |
|---|---|
| Relational modeling | Customers, orders, and order items |
| Constraints | Primary keys, foreign keys, and check constraints |
| Aggregations | `COUNT`, `SUM`, and `GROUP BY` |
| Joins | Combining customer, order, and item data |
| Null handling | `NVL` |
| Common Table Expressions | Organizing multi-step queries with `WITH` |
| Analytical functions | `DENSE_RANK` and `ROW_NUMBER` |
| Data quality | Detecting orphan records, missing order details, and potential duplicate names |

## Getting Started

Execute the scripts in the following order using an Oracle SQL client connected to a suitable schema:

1. `sql/01_create_tables.sql` — Create the tables and constraints.
2. `sql/02_insert_sample_data.sql` — Insert the sample records.
3. `sql/03_sales_analysis.sql` — Run the sales analysis queries.
4. `sql/04_data_quality.sql` — Run the data quality checks.

Review `docs/data_dictionary.md` for table definitions, column descriptions, and relationships.

**Note:** The scripts have been prepared for Oracle SQL. Successful execution must be validated in an Oracle Database environment.

## Expected Results

Using the supplied sample data, the completed-order sales total should be **5,000.00**.

The data quality checks are designed to return no rows for several error conditions when the sample data is loaded correctly. The duplicate-name check may return no rows because the sample customers have different names.

## Future Improvements

- Add monthly sales and customer performance reports.
- Include date-based sales comparisons.
- Expand data quality checks with additional business rules.
- Add screenshots or query execution results from Oracle Database.
- Integrate Python for data processing and visualization.

## Author

**Fernando Robles**

GitHub: [@fernando-robles-data](https://github.com/fernando-robles-data)
