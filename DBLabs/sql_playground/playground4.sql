-- 1.
SELECT [O D].OrderID, SUM(([O D].UnitPrice * [O D].Quantity) * (1 - [O D].Discount)) AS OrderValue FROM Orders
INNEr JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
WHERE Orders.OrderID=10250
GROUP BY [O D].OrderID

-- 2.
SELECT OrderID, MAX(UnitPrice) AS MaxValue FROM [Order Details]
GROUP BY OrderID
ORDER BY MAX(UnitPrice) DESC

-- 3.
SELECT OrderID, MAX(UnitPrice) AS MinValue, MIN(UnitPrice) AS MaxValue FROM [Order Details]
GROUP BY OrderID

-- 4.
SELECT AVG(PriceAmplitude) AS AvgPriceAmplitude FROM (SELECT (ABS(MAX(UnitPrice) - MIN(UnitPrice))) AS PriceAmplitude FROM [Order Details]
                                                      GROUP BY OrderID) as [O DPA]

-- 5.
SELECT Shippers.CompanyName, COUNT(ShipVia) AS Shipments FROM Orders
INNER JOIN Shippers on Shippers.ShipperID = Orders.ShipVia
GROUP BY Shippers.CompanyName

-- 6.
SELECT TOP 1 Shippers.CompanyName, COUNT(ShipVia) AS Shipments FROM Orders
INNER JOIN Shippers on Shippers.ShipperID = Orders.ShipVia
WHERE YEAR(ShippedDate)=1997
GROUP BY Shippers.CompanyName
ORDER BY COUNT(ShipVia) DESC

-- 7.
SELECT [O D].OrderID, COUNT([O D].ProductID) AS ProductCount, CustomerID FROM Orders
INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
GROUP BY [O D].OrderID, CustomerID
HAVING COUNT([O D].ProductID) > 5

-- 8.
SELECT CustomerID, COUNT(OrderID) AS OrderAmount, SUM(OrderValue) AS TotalValue FROM (SELECT [O D].OrderID, Orders.CustomerID, Orders.ShippedDate, SUM(([O D].UnitPrice * [O D].Quantity) * (1 - [O D].Discount)) AS OrderValue FROM Orders
                                                                                                     LEFT JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
                                                                                                     GROUP BY Orders.CustomerID, [O D].OrderID, Orders.ShippedDate) as OIOV
WHERE YEAR(ShippedDate)=1998
GROUP BY CustomerID
HAVING COUNT(OrderID) > 8
ORDER BY TotalValue DESC

