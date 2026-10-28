
-- Project: Oracle SQL Analytics & Data Quality
-- Purpose: Create the sales analysis data model.
-- Database: Oracle Database

CREATE TABLE customers (
    customer_id   NUMBER(10)     NOT NULL,
    customer_name VARCHAR2(100)  NOT NULL,
    city          VARCHAR2(60),
    created_at    DATE           DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    order_id      NUMBER(10)     NOT NULL,
    customer_id   NUMBER(10)     NOT NULL,
    order_date    DATE           NOT NULL,
    status        VARCHAR2(20)   NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT chk_orders_status
        CHECK (status IN ('COMPLETED', 'PENDING', 'CANCELLED'))
);

CREATE TABLE order_items (
    item_id       NUMBER(10)     NOT NULL,
    order_id      NUMBER(10)     NOT NULL,
    product_name  VARCHAR2(100)  NOT NULL,
    quantity      NUMBER(10)     NOT NULL,
    unit_price    NUMBER(12, 2)  NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (item_id),
    CONSTRAINT fk_items_orders
        FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT chk_items_quantity CHECK (quantity > 0),
    CONSTRAINT chk_items_price CHECK (unit_price >= 0)
);
