# Cleaning Log

| # | Issue | Fix | Result |
|---|-------|-----|--------|
| 1 | Table Data Import Wizard dropped rows on large CSVs (reviews loaded only 279 rows) | Switched to LOAD DATA LOCAL INFILE | All rows loaded |
| 2 | Empty delivery-date cells broke the DATETIME columns in orders | Loaded dates into @variables, then NULLIF(@x, '') to store NULL | 99,441 orders loaded |
| 3 | 1 malformed row in the reviews CSV | Skipped automatically by LOAD DATA | 99,223 of 99,224 reviews loaded |
| 4 | Re-running LOAD DATA added duplicate rows (counts doubled) | TRUNCATE TABLE, then load once; checked COUNT(*) after every load | Counts match the source files |
| 5 | 8 delivered orders have no delivery date | Excluded with IS NOT NULL in the late vs on-time analysis | No false "On time" labels |
| 6 | Some late orders have no review (6,534 late vs 6,409 in the JOIN) | Noted: the JOIN keeps only orders with a review | Review analysis based on 6,409 late orders |

## Checks used
- COUNT(*) after every load, compared with the source file
- SELECT * ... LIMIT 5 to confirm values sit in the right columns
