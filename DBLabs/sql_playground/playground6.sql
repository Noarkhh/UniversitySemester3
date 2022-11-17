-- 1.
SELECT DISTINCT C.CompanyName, C.Phone FROM Orders
INNER JOIN Customers C on Orders.CustomerID = C.CustomerID
INNER JOIN Shippers S on S.ShipperID = Orders.ShipVia
WHERE S.CompanyName='United Package'

-- 2.
SELECT DISTINCT C.CompanyName, C.Phone FROM Orders
INNER JOIN Customers C on Orders.CustomerID = C.CustomerID
INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
INNER JOIN Products P on P.ProductID = [O D].ProductID
INNER JOIN Categories C2 on C2.CategoryID = P.CategoryID
WHERE C2.CategoryName='Confections'

-- 3.
SELECT Customers.CompanyName FROM (SELECT DISTINCT C.CompanyName, C.Phone FROM Orders
                            INNER JOIN Customers C on Orders.CustomerID = C.CustomerID
                            INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
                            INNER JOIN Products P on P.ProductID = [O D].ProductID
                            INNER JOIN Categories C2 on C2.CategoryID = P.CategoryID
                            WHERE C2.CategoryName='Confections') as CNP
RIGHT JOIN Customers ON CNP.CompanyName=Customers.CompanyName
WHERE CNP.CompanyName IS NULL

-- 4.
SELECT ProductName, MAX([O D].Quantity) FROM Products
INNER JOIN [Order Details] [O D] on Products.ProductID = [O D].ProductID
GROUP BY ProductName

-- 5.
SELECT * FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM Products)

-- 6.
SELECT Products.ProductName FROM (SELECT CategoryID, AVG(UnitPrice) AS AvgCategoryPrice FROM Products GROUP BY CategoryID) AS A1
INNER JOIN Products ON A1.CategoryID = Products.CategoryID
WHERE Products.UnitPrice < A1.AvgCategoryPrice

-- 7.
SELECT ProductName, UnitPrice, (SELECT AVG(UnitPrice) FROM Products) AS AvgPrice,
       ABS(UnitPrice - (SELECT AVG(UnitPrice) FROM Products)) AS AvgDeviation FROM Products

-- 8.
SELECT C.CategoryName, Products.ProductName, A1.AvgCategoryPrice, ABS(Products.UnitPrice - A1.AvgCategoryPrice) AS AvgCategoryDeviation
FROM (SELECT CategoryID, AVG(UnitPrice) AS AvgCategoryPrice FROM Products GROUP BY CategoryID) AS A1
INNER JOIN Products ON A1.CategoryID = Products.CategoryID
INNER JOIN Categories C on C.CategoryID = Products.CategoryID

-- 9.
SELECT O.OrderID, SUM((Quantity * UnitPrice) * (1 - Discount)) + Freight AS TotalOrderPrice FROM [Order Details]
INNER JOIN Orders O on O.OrderID = [Order Details].OrderID
WHERE O.OrderID = 10250
GROUP BY O.OrderID, Freight

-- 10.
SELECT O.OrderID, SUM((Quantity * UnitPrice) * (1 - Discount)) + Freight AS TotalOrderPrice FROM [Order Details]
INNER JOIN Orders O on O.OrderID = [Order Details].OrderID
GROUP BY O.OrderID, Freight



