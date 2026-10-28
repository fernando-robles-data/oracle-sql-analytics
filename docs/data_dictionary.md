# Data Dictionary

## Project Overview

This document describes the database tables used in the Oracle SQL Analytics project. The data model represents a simple sales process involving customers, orders, and order items.

## 1. Table: `CUSTOMERS`

**Purpose:** Stores customer information.

| Column | Data Type | Constraints | Description |
|---|---|---|---|
| `CUSTOMER_ID` | `NUMBER(10)` | Primary Key, Not Null | Unique customer identifier |
| `CUSTOMER_NAME` | `VARCHAR2(100)` | Not Null | Customer's full name |
| `CITY` | `VARCHAR2(60)` | Nullable | Customer's city |
| `CREATED_AT` | `DATE` | Not Null, Default `SYSDATE` | Record creation date |

## 2. Table: `ORDERS`

**Purpose:** Stores customer orders and their current status.

| Column | Data Type | Constraints | Description |
|---|---|---|---|
| `ORDER_ID` | `NUMBER(10)` | Primary Key, Not Null | Unique order identifier |
| `CUSTOMER_ID` | `NUMBER(10)` | Foreign Key, Not Null | Customer who placed the order |
| `ORDER_DATE` | `DATE` | Not Null | Date the order was placed |
| `STATUS` | `VARCHAR2(20)` | Not Null, Check Constraint | Order status: `COMPLETED`, `PENDING`, or `CANCELLED` |

## 3. Table: `ORDER_ITEMS`

**Purpose:** Stores the products and quantities associated with each order.

| Column | Data Type | Constraints | Description |
|---|---|---|---|
| `ITEM_ID` | `NUMBER(10)` | Primary Key, Not Null | Unique order item identifier |
| `ORDER_ID` | `NUMBER(10)` | Foreign Key, Not Null | Associated order |
| `PRODUCT_NAME` | `VARCHAR2(100)` | Not Null | Product name |
| `QUANTITY` | `NUMBER(10)` | Not Null, Greater Than 0 | Quantity of products |
| `UNIT_PRICE` | `NUMBER(12,2)` | Not Null, Greater Than or Equal to 0 | Price per unit |

## Relationships

- One customer can have multiple orders.
- Each order belongs to one customer.
- One order can contain multiple order items.
- Each order item belongs to one order.

## Data Integrity Rules

- Primary keys uniquely identify records.
- Foreign keys enforce relationships between customers, orders, and order items.
- Order status must be `COMPLETED`, `PENDING`, or `CANCELLED`.
- Order item quantity must be greater than zero.
- Unit price cannot be negative.

## Related SQL Scripts

1. `sql/01_create_tables.sql` — Creates the database tables and constraints.
2. `sql/02_insert_sample_data.sql` — Inserts fictional sample data.
3. `sql/03_sales_analysis.sql` — Runs sales analysis queries.
4. `sql/04_data_quality.sql` — Checks for potential data quality issues.
