-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.
SELECT ROUND(SUM(Invoice.Total), 2) as "Total Sales", Employee.FirstName, Employee.LastName
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName