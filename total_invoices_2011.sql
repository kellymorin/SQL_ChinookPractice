-- 8b. total_invoices_2011.sql: How many Invoices were there in 2011?
SELECT Count(InvoiceId)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2011%"