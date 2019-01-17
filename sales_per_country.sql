-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.
SELECT Invoice.BillingCountry, SUM(Invoice.Total) as "Total Sales"
FROM Invoice
GROUP BY Invoice.BillingCountry