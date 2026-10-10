-- =====================================================
-- 02_analysis.sql
-- Project: Olist Reviews - Do late deliveries cause bad reviews?
-- Tables: orders, reviews
-- Author: Dolfine Ngare
-- =====================================================

USE olist;

-- Q1: How many delivered orders arrived late?
-- Result: 6,534 of 96,478 delivered orders (6.8%)
SELECT COUNT(*) AS late_orders
FROM orders
WHERE order_status = 'delivered'
  AND DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) > 0;


-- Q2: Do late orders get lower review scores?
-- Q3: What % of late vs on-time orders get a bad review (1-2 stars)?
-- Result: Late = 2.27 avg, 62.4% bad | On time = 4.29 avg, 9.3% bad
SELECT CASE
           WHEN DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) > 0
           THEN 'Late'
           ELSE 'On time'
       END AS delivery,
       COUNT(*) AS orders,
       ROUND(AVG(r.review_score), 2) AS avg_score,
       ROUND(AVG(r.review_score <= 2) * 100, 1) AS pct_bad_reviews
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery;

-- Q4: What share of all bad reviews come from late orders?
-- Result: ~32% (late = 7% of orders but ~1/3 of bad reviews)
-- Calculated from Q3: (6,409 x 62.4%) / (6,409 x 62.4% + 89,943 x 9.3%)
