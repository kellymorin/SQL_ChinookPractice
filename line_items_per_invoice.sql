-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceLine.InvoiceId, COUNT(InvoiceLine.InvoiceLineId)
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId