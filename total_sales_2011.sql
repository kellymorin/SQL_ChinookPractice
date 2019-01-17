-- 9b. total_sales_2011.sql: What are the respective total sales for 2011?
SELECT SUM(Invoice.Total)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2011%"