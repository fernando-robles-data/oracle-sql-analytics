
-- Project: Oracle SQL Analytics & Data Quality
-- Purpose: Analyze orders and completed sales.
-- Prerequisites:
--   01_create_tables.sql
--   02_insert_sample_data.sql

-- =====================================================
-- 1. ORDER SUMMARY BY STATUS
-- =====================================================

SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY status;


-- =====================================================
-- 2. COMPLETED SALES BY CUSTOMER
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    NVL(SUM(oi.quantity * oi.unit_price), 0) AS total_sales
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.customer_id
   AND o.status = 'COMPLETED'
LEFT JOIN order_items oi
    ON oi.order_id = o.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_sales DESC;


-- =====================================================
-- 3. CUSTOMER SALES RANKING
-- =====================================================

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        NVL(SUM(oi.quantity * oi.unit_price), 0) AS total_sales
    FROM customers c
    LEFT JOIN orders o
        ON o.customer_id = c.customer_id
       AND o.status = 'COMPLETED'
    LEFT JOIN order_items oi
        ON oi.order_id = o.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_sales,
    DENSE_RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM customer_sales
ORDER BY sales_rank, customer_id;


-- =====================================================
-- 4. LATEST ORDER FOR EACH CUSTOMER
-- =====================================================

WITH ranked_orders AS (
    SELECT
        o.customer_id,
        c.customer_name,
        o.order_id,
        o.order_date,
        o.status,
        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date DESC, o.order_id DESC
        ) AS rn
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
)
SELECT
    customer_id,
    customer_name,
    order_id,
    order_date,
    status
FROM ranked_orders
WHERE rn = 1
ORDER BY customer_id;
