-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
SELECT Artist.ArtistId, Artist.Name, COUNT(InvoiceLine.TrackId) as "Total Track"
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY "Total Track" DESC
LIMIT 3