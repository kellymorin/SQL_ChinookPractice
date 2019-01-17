-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT COUNT(InvoiceLine.InvoiceLineId) as "Invoice Lines",  Invoice.*
FROM InvoiceLine
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
GROUP BY InvoiceLine.InvoiceId