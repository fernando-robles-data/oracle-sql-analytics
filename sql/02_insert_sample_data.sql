
-- Project: Oracle SQL Analytics & Data Quality
-- Purpose: Load fictional customers, orders and order items.
-- Prerequisite: Run 01_create_tables.sql first.

-- CUSTOMERS
INSERT INTO customers
    (customer_id, customer_name, city, created_at)
VALUES
    (1, 'Ana Torres', 'Lima', DATE '2026-01-10');

INSERT INTO customers
    (customer_id, customer_name, city, created_at)
VALUES
    (2, 'Luis Perez', 'Arequipa', DATE '2026-01-15');

INSERT INTO customers
    (customer_id, customer_name, city, created_at)
VALUES
    (3, 'Maria Lopez', 'Lima', DATE '2026-02-01');

INSERT INTO customers
    (customer_id, customer_name, city, created_at)
VALUES
    (4, 'Carlos Diaz', 'Cusco', DATE '2026-02-12');

INSERT INTO customers
    (customer_id, customer_name, city, created_at)
VALUES
    (5, 'Sofia Ramos', 'Trujillo', DATE '2026-03-05');


-- ORDERS
INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1001, 1, DATE '2026-03-01', 'COMPLETED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1002, 2, DATE '2026-03-03', 'COMPLETED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1003, 1, DATE '2026-03-10', 'PENDING');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1004, 3, DATE '2026-03-15', 'COMPLETED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1005, 4, DATE '2026-03-20', 'CANCELLED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1006, 5, DATE '2026-04-02', 'COMPLETED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1007, 2, DATE '2026-04-08', 'COMPLETED');

INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
    (1008, 3, DATE '2026-04-12', 'PENDING');


-- ORDER ITEMS
INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (1, 1001, 'Keyboard', 2, 45.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (2, 1001, 'Mouse', 1, 25.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (3, 1002, 'Monitor', 1, 650.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (4, 1003, 'Keyboard', 1, 45.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (5, 1004, 'Laptop', 1, 2800.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (6, 1005, 'Mouse', 3, 25.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (7, 1006, 'Monitor', 2, 650.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (8, 1007, 'Keyboard', 3, 45.00);

INSERT INTO order_items
    (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (9, 1008, 'Mouse', 2, 25.00);

COMMIT;
