SQL Window Functions Intro

Overview

This project focuses on learning SQL Window Functions using the Online Retail dataset.

The objective was to understand analytical SQL patterns using:

- "ROW_NUMBER()"
- "RANK()"
- "DENSE_RANK()"
- "LAG()"
- "PARTITION BY"
- "ORDER BY"
- CTEs
- Conditional logic using "CASE"

Dataset

Dataset: Online Retail

The dataset contains retail transaction information such as:

- Invoice Number
- Invoice Date
- Customer ID
- Country
- Quantity
- Unit Price

Tool Used

- MySQL

Objective

The main objective was to practice ranking, sequencing, previous-row comparison, and sales trend analysis using SQL Window Functions.

Queries Completed

A total of 12 SQL queries were completed.

1. ROW_NUMBER()
2. RANK()
3. LAG()
4. ROW_NUMBER() with PARTITION BY
5. RANK() with PARTITION BY
6. DENSE_RANK()
7. LAG() with PARTITION BY
8. Current Sales and Previous Sales
9. Sales Difference using LAG()
10. Top 3 Customers per Country using ROW_NUMBER()
11. Top Customers per Country using RANK()
12. Sales Trend using LAG() and CASE

Key Learnings

ROW_NUMBER()

Used to assign a unique sequential number to rows.

RANK()

Used to rank rows based on a specified value. Ties receive the same rank and the next rank may be skipped.

DENSE_RANK()

Similar to RANK(), but ranking numbers are not skipped after ties.

LAG()

Used to access the previous row's value and compare current and previous records.

PARTITION BY

Used to divide data into groups before applying a window function.

Outcome

The project improved understanding of SQL analytical patterns and demonstrated how Window Functions can be used for ranking, customer analysis, and trend comparison.

Conclusion

Task 23 was completed using MySQL and the Online Retail dataset. The project provided practical experience with SQL Window Functions, ranking techniques, previous-row analysis, and customer sales trends.
