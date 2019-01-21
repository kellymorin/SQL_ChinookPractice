-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, CustomerId, Country FROM Customer
WHERE Customer.Country is not "USA"

-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT FirstName, LastName, CustomerId, Country FROM Customer
WHERE Customer.Country is "Brazil"

-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = "Brazil"

-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT Employee.FirstName, Employee.LastName, Employee.Title
FROM Employee
WHERE Employee.Title = "Sales Support Agent"

-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry
FROM Invoice

-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Invoice.InvoiceId, Customer.FirstName  as "Customer First Name", Customer.LastName as "Customer Last Name", Employee.FirstName as "Employee First Name", Employee.LastName as "Employee Last Name"
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY Employee.FirstName

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT Invoice.InvoiceId, Invoice.Total, Customer.FirstName as "Customer First Name", Customer.LastName as "Customer Last Name", Customer.Country, Employee.FirstName as "Sales First Name", Employee.LastName as "Sales Last Name"
FROM Invoice
LEFT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
LEFT JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId

-- 8a. total_invoices_2009.sql: How many Invoices were there in 2009?
SELECT Count(InvoiceId)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2009%"

-- 8b. total_invoices_2011.sql: How many Invoices were there in 2011?
SELECT Count(InvoiceId)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2011%"

-- 9a. total_sales_2009.sql: What are the respective total sales for 2009?
SELECT SUM(Invoice.Total)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2009%"

-- 9b. total_sales_2011.sql: What are the respective total sales for 2011?
SELECT SUM(Invoice.Total)
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "%2011%"

-- 10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceLine.InvoiceLineId)
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = 37

-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceLine.InvoiceId, COUNT(InvoiceLine.InvoiceLineId)
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId

-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLine.InvoiceId as "Invoice Id", Track.Name as "Track Name"
FROM InvoiceLine
LEFT JOIN Track ON InvoiceLine.TrackId = Track.TrackId

-- 13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT InvoiceLine.InvoiceId as "Invoice Id", Track.Name as "Track Name", Artist.Name as "Artist Name"
FROM InvoiceLine
LEFT JOIN Track ON InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId

-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT COUNT(Invoice.InvoiceId), Invoice.BillingCountry
FROM Invoice
GROUP BY Invoice.BillingCountry

-- 15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
SELECT Playlist.Name, COUNT(TrackId) as "Number of Tracks"
FROM PlaylistTrack
LEFT JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY PlaylistTrack.PlaylistId

-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT Track.Name as "Track Name", Album.Title as "Album Name", MediaType.Name as "Media Type", Genre.Name as "Genre"
FROM Track
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
LEFT JOIN Genre ON Track.GenreId = Genre.GenreId

-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT COUNT(InvoiceLine.InvoiceLineId) as "Invoice Lines",  Invoice.*
FROM InvoiceLine
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
GROUP BY InvoiceLine.InvoiceId

-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.
SELECT ROUND(SUM(Invoice.Total), 2) as "Total Sales", Employee.FirstName, Employee.LastName
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName

-- 19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
SELECT ROUND(SUM(Invoice.Total), 2) as "Total Sales", Employee.FirstName, Employee.LastName
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate LIKE "%2009%"
GROUP BY Employee.FirstName
ORDER BY "Total Sales" DESC
LIMIT 1

-- 20. top_agent.sql: Which sales agent made the most in sales over all?
SELECT ROUND(SUM(Invoice.Total), 2) as "Total Sales", Employee.FirstName, Employee.LastName
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName
ORDER BY "Total Sales" DESC
LIMIT 1

-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.
SELECT Employee.FirstName, Employee.LastName, COUNT(Customer.CustomerId) as "Assigned Customers"
FROM Customer
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName

-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.
SELECT Invoice.BillingCountry, SUM(Invoice.Total) as "Total Sales"
FROM Invoice
GROUP BY Invoice.BillingCountry

-- 23. top_country.sql: Which country's customers spent the most?
SELECT Invoice.BillingCountry, SUM(Invoice.Total) as "Total Spent"
FROM Invoice
GROUP BY Invoice.BillingCountry
ORDER BY "Total Spent" DESC
LIMIT 1

-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.
SELECT COUNT(InvoiceLine.TrackId) as "Number of purchased tracks", Track.TrackId, Track.Name
FROM InvoiceLine
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
WHERE Invoice.InvoiceDate LIKE "%2013%"
GROUP BY InvoiceLine.TrackId
ORDER BY "Number of purchased tracks" DESC

-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.
SELECT COUNT( InvoiceLine.TrackId) as "Number of purchased tracks", Track.TrackId, Track.Name
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
ORDER BY "Number of purchased tracks" DESC
LIMIT 5

-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
SELECT Artist.ArtistId, Artist.Name, COUNT(InvoiceLine.TrackId) as "Total Track"
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY "Total Track" DESC
LIMIT 3

-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.
SELECT COUNT( InvoiceLine.TrackId) as "Number of purchased tracks", MediaType.Name as "Media Type"
FROM InvoiceLine
LEFT JOIN Track ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
GROUP BY MediaType.Name
ORDER BY "Number of purchased tracks" DESC
LIMIT 1