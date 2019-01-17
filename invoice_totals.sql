-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT Invoice.InvoiceId, Invoice.Total, Customer.FirstName as "Customer First Name", Customer.LastName as "Customer Last Name", Customer.Country, Employee.FirstName as "Sales First Name", Employee.LastName as "Sales Last Name"
FROM Invoice
LEFT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
LEFT JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId