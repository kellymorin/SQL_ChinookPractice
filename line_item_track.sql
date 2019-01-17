-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLine.InvoiceId as "Invoice Id", Track.Name as "Track Name"
FROM InvoiceLine
LEFT JOIN Track ON InvoiceLine.TrackId = Track.TrackId