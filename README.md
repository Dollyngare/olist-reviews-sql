# Olist Reviews: Do Late Deliveries Cause Bad Reviews?

SQL analysis of 99K Brazilian e-commerce orders to find out what is driving bad customer reviews.

## Key finding
Late orders are only **7%** of all orders, but they bring about **a third (32%)** of all 1–2 star reviews.

| Delivery | Orders | Avg review | % bad reviews (1–2 stars) |
|----------|--------|------------|---------------------------|
| On time  | 89,943 | 4.29       | 9.3%                      |
| Late     | 6,409  | 2.27       | 62.4%                     |

**Late orders are about 6.7x more likely to get a bad review.**

## Recommendation
Reduce late deliveries first: this could remove up to a third of bad reviews. Next, find which sellers and regions cause the most late orders.

## Tools
MySQL, MySQL Workbench

## SQL skills used
LOAD DATA, JOIN, CASE WHEN, DATEDIFF, GROUP BY, AVG, ROUND, NULLIF, IS NOT NULL

## Project files
- [sql/01_setup.sql](sql/01_setup.sql): create tables and load the data
- [sql/02_analysis.sql](sql/02_analysis.sql): analysis queries, each with its question and result
- [docs/problem_framing.md](docs/problem_framing.md): how the brief was turned into clear questions
- [docs/cleaning_log.md](docs/cleaning_log.md): data issues found and how they were fixed
- [docs/executive_summary.md](docs/executive_summary.md): findings for business leaders

## Data
[Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle). The CSV files are not uploaded because of their size.

## Limitations
This analysis shows a strong link, not proof of cause. Other factors (for example, a seller who ships late and also sends damaged items) may play a part.
