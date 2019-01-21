-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.
SELECT COUNT(InvoiceLine.TrackId) as "Number of purchased tracks", Track.TrackId, Track.Name
FROM InvoiceLine
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
WHERE Invoice.InvoiceDate LIKE "%2013%"
GROUP BY InvoiceLine.TrackId
ORDER BY "Number of purchased tracks" DESC