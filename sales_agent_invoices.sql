-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Invoice.InvoiceId, Customer.FirstName  as "Customer First Name", Customer.LastName as "Customer Last Name", Employee.FirstName as "Employee First Name", Employee.LastName as "Employee Last Name"
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY Employee.FirstName