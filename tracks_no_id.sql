-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT Track.Name as "Track Name", Album.Title as "Album Name", MediaType.Name as "Media Type", Genre.Name as "Genre"
FROM Track
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
LEFT JOIN Genre ON Track.GenreId = Genre.GenreId