-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT COUNT(Invoice.InvoiceId), Invoice.BillingCountry
FROM Invoice
GROUP BY Invoice.BillingCountry