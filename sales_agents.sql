-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT Employee.FirstName, Employee.LastName, Employee.Title
FROM Employee
WHERE Employee.Title = "Sales Support Agent"
