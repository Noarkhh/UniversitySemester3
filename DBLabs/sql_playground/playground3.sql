-- Part 1.
-- 1.
-- SELECT COUNT(*) FROM Products
-- WHERE UnitPrice < 10 OR UnitPrice > 20

-- 2.
-- SELECT MAX(UnitPrice) FROM Products
-- WHERE UnitPrice < 20

-- 3.
-- SELECT MIN(UnitPrice) AS Min, MAX(UnitPrice) AS Max, AVG(UnitPrice) AS Avg FROM Products
-- WHERE QuantityPerUnit LIKE '%bottle%'

-- 4.
-- SELECT * FROM Products
-- WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

-- 5.
-- SELECT SUM([Order Details].UnitPrice * [Order Details].Quantity) AS Total FROM Orders
-- LEFT JOIN [Order Details]on Orders.OrderID = [Order Details].OrderID
-- WHERE Orders.OrderID = 10250

-- Part 2.
-- 1., 2.
-- SELECT [O D].OrderID, MAX([O D].UnitPrice) AS MaxOrderProduct FROM Orders
-- LEFT JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
-- GROUP BY [O D].OrderID
-- ORDER BY MAX([O D].UnitPrice)

-- 3.
-- SELECT [O D].OrderID, MAX([O D].UnitPrice) AS MinOrderProduct, MIN([O D].UnitPrice) AS MaxOrderProduct FROM Orders
-- LEFT JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
-- GROUP BY [O D].OrderID

-- 4., 5.
-- SELECT TOP 1 Shippers.CompanyName, COUNT(Orders.OrderID) AS Count FROM Orders
-- LEFT JOIN Shippers on Orders.ShipVia = Shippers.ShipperID
-- GROUP BY Shippers.CompanyName
-- ORDER BY Count DESC


-- Part 3.
-- 1.
-- SELECT [O D].OrderID, CustomerID FROM Orders
-- INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
-- GROUP BY [O D].OrderID, CustomerID
-- HAVING COUNT([O D].ProductID) > 5

-- 2.
-- SELECT CompanyName, CONCAT(Phone, ', ', Fax) FROM Suppliers