-- =====================================================
-- 01_setup.sql
-- Creates the olist database and loads the 2 tables used.
-- Data: Olist Brazilian E-Commerce dataset (Kaggle)
-- Replace YOUR_FOLDER with the folder holding the CSV files.
-- Run ONCE. LOAD DATA adds rows each time it runs.
-- =====================================================

CREATE DATABASE IF NOT EXISTS olist;
USE olist;

-- ORDERS (expected: 99,441 rows)
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id                      VARCHAR(50),
    customer_id                   VARCHAR(50),
    order_status                  VARCHAR(20),
    order_purchase_timestamp      DATETIME,
    order_approved_at             DATETIME,
    order_delivered_carrier_date  DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

-- Empty date cells become NULL (orders not yet delivered)
LOAD DATA LOCAL INFILE 'YOUR_FOLDER/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, order_purchase_timestamp,
 @approved, @carrier, @delivered, order_estimated_delivery_date)
SET order_approved_at             = NULLIF(@approved, ''),
    order_delivered_carrier_date  = NULLIF(@carrier, ''),
    order_delivered_customer_date = NULLIF(@delivered, '');

-- REVIEWS (expected: 99,223 rows; 1 malformed row skipped)
DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
    review_id               VARCHAR(50),
    order_id                VARCHAR(50),
    review_score            INT,
    review_comment_title    TEXT,
    review_comment_message  TEXT,
    review_creation_date    DATETIME,
    review_answer_timestamp DATETIME
);

LOAD DATA LOCAL INFILE 'YOUR_FOLDER/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CHECK row counts
SELECT COUNT(*) AS orders_rows  FROM orders;
SELECT COUNT(*) AS reviews_rows FROM reviews;
