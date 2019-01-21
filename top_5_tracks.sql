-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.
SELECT COUNT( InvoiceLine.TrackId) as "Number of purchased tracks", Track.TrackId, Track.Name
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
ORDER BY "Number of purchased tracks" DESC
LIMIT 5