-- 19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
SELECT ROUND(SUM(Invoice.Total), 2) as "Total Sales", Employee.FirstName, Employee.LastName
FROM Invoice
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate LIKE "%2009%"
GROUP BY Employee.FirstName
ORDER BY "Total Sales" DESC
LIMIT 1