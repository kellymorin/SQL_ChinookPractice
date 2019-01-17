-- 13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT InvoiceLine.InvoiceId as "Invoice Id", Track.Name as "Track Name", Artist.Name as "Artist Name"
FROM InvoiceLine
LEFT JOIN Track ON InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId