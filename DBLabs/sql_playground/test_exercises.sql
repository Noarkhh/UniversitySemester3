SELECT Orders.OrderID FROM Orders
INNER JOIN (SELECT YEAR(ShippedDate) AS ShippedYear, AVG(Freight) AS AvgFreight FROM Orders GROUP BY YEAR(ShippedDate)) AS A ON YEAR(Orders.ShippedDate) = A.ShippedYear
WHERE Freight > A.AvgFreight
-- ORDER BY Orders.ShippedDate

-- SELECT OrderID, ShippedDate, AVG(Freight) AS AvgFreight FROM Orders
-- GROUP BY ShippedDate, OrderID

SELECT YEAR(OrderDate) AS ShippedYear, MONTH(OrderDate) AS ShippedMonth, S.CompanyName, SUM(Orders.Freight) FROM Orders
INNER JOIN Shippers S on Orders.ShipVia = S.ShipperID
GROUP BY YEAR(OrderDate), MONTH(OrderDate), S.CompanyName


SELECT ProductName, SUM([O D].Total) AS TotalProductIncome FROM Products
INNER JOIN (SELECT ProductID, UnitPrice * Quantity * (1 - Discount) AS Total FROM [Order Details]
            INNER JOIN Orders O on [Order Details].OrderID = O.OrderID
            WHERE YEAR(O.OrderDate)=1996)
    AS [O D] on Products.ProductID = [O D].ProductID
GROUP BY ProductName
ORDER BY TotalProductIncome


SELECT Employees.LastName, Count(O.OrderID) AS ProcessedOrders, MAX(OrderDate) AS LatestOrder FROM Employees
INNER JOIN (SELECT EmployeeID, OrderID, OrderDate FROM Orders WHERE YEAR(OrderDate)=1997) AS O on Employees.EmployeeID = O.EmployeeID
GROUP BY Employees.LastName
HAVING Count(O.OrderID) > 6


SELECT * FROM Orders
WHERE Freight > AVG(Freight)


SELECT Employees.LastName, O.OrderDate FROM Employees
LEFT JOIN (SELECT OrderID, EmployeeID, OrderDate FROM Orders WHERE OrderDate=1997-01-01) AS O on Employees.EmployeeID = O.EmployeeID
WHERE O.OrderID IS NULL