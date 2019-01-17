-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.
SELECT COUNT( InvoiceLine.TrackId) as "Number of purchased tracks", MediaType.Name as "Media Type"
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
GROUP BY MediaType.Name
ORDER BY "Number of purchased tracks" DESC
LIMIT 1