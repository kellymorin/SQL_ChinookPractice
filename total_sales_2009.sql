-- 9a. total_sales_2009.sql: What are the respective total sales for 2009?
SELECT SUM(Invoice.Total)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2009%"