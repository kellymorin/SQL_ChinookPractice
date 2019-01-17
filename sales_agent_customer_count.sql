-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.
SELECT Employee.FirstName, Employee.LastName, COUNT(Customer.CustomerId) as "Assigned Customers"
FROM Customer
LEFT JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Employee.FirstName