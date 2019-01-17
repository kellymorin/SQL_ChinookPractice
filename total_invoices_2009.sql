-- 8a. total_invoices_2009.sql: How many Invoices were there in 2009?
SELECT Count(InvoiceId)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2009%"