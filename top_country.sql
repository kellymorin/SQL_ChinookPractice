-- 23. top_country.sql: Which country's customers spent the most?
SELECT Invoice.BillingCountry, SUM(Invoice.Total) as "Total Spent"
FROM Invoice
GROUP BY Invoice.BillingCountry
ORDER BY "Total Spent" DESC
LIMIT 1