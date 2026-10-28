
-- Project: Oracle SQL Analytics & Data Quality
-- Purpose: Identify potential data quality issues.
-- Prerequisites:
--   01_create_tables.sql
--   02_insert_sample_data.sql

-- =====================================================
-- 1. CUSTOMERS WITH MISSING REQUIRED INFORMATION
-- =====================================================

SELECT
    customer_id,
    customer_name,
    city
FROM customers
WHERE customer_name IS NULL;


-- =====================================================
-- 2. ORDERS WITHOUT A VALID CUSTOMER
-- =====================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status
FROM orders o
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.customer_id = o.customer_id
);


-- =====================================================
-- 3. INVALID ORDER ITEM VALUES
-- =====================================================

SELECT
    item_id,
    order_id,
    product_name,
    quantity,
    unit_price
FROM order_items
WHERE quantity <= 0
   OR unit_price < 0
   OR quantity IS NULL
   OR unit_price IS NULL;


-- =====================================================
-- 4. ORDERS WITHOUT DETAIL LINES
-- =====================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status
FROM orders o
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE oi.order_id = o.order_id
);


-- =====================================================
-- 5. POTENTIAL DUPLICATE CUSTOMER NAMES
-- =====================================================

SELECT
    UPPER(TRIM(customer_name)) AS normalized_name,
    COUNT(*) AS occurrences
FROM customers
GROUP BY UPPER(TRIM(customer_name))
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;
