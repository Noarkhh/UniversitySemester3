-- 1.
SELECT TOP 1 Employees.LastName, Employees.FirstName, MAX(O.OrderDate) AS LastOrder, SUM(O.OrderTotal) AS TotalOrdersValue FROM Employees
INNER JOIN (SELECT SUM([O D].UnitPrice * [O D].Quantity * (1 - [O D].Discount)) AS OrderTotal, [O D].OrderID, Orders.EmployeeID, Orders.OrderDate FROM Orders
            INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
            WHERE YEAR(OrderDate)=1997
            GROUP BY [O D].OrderID, Orders.EmployeeID, Orders.OrderDate) AS O on Employees.EmployeeID = O.EmployeeID
GROUP BY Employees.EmployeeID, Employees.LastName, Employees.FirstName
ORDER BY TotalOrdersValue


-- 2.
SELECT P.ProductName, S.CompanyName, S.Phone, S.Address, S.Fax, S.Country, S.City FROM Products AS P
INNER JOIN Categories C on C.CategoryID = P.CategoryID
INNER JOIN Suppliers S on S.SupplierID = P.SupplierID
WHERE P.UnitPrice BETWEEN 15 AND 35 AND C.CategoryName='Meat/Poultry'


-- 3.
SELECT C.CategoryName, ProductName, P.UnitPrice, C.AvgCategoryPrice, (ABS(P.UnitPrice - (SELECT AVG(UnitPrice) FROM Products))) AS DiffFromAvg FROM Products P
INNER JOIN (SELECT AVG(P.UnitPrice) AS AvgCategoryPrice, P.CategoryID, C.CategoryName FROM Products AS P
            INNER JOIN Categories C on C.CategoryID = P.CategoryID
            GROUP BY P.CategoryID, CategoryName) C on C.CategoryID = P.CategoryID


-- 4.
SELECT O.OrderID, C.CompanyName, S.CompanyName, O.Freight FROM Orders O
INNER JOIN Customers C on O.CustomerID = C.CustomerID
INNER JOIN Shippers S on S.ShipperID = O.ShipVia
WHERE Freight > 0.6*(SELECT AVG(Freight) AS AvgFreight FROM Orders
                     WHERE MONTH(OrderDate) BETWEEN 6 AND 12)
ORDER BY S.CompanyName


-- 5.
SELECT O.OrderID, O.OrderDate, C.CustomerID FROM Orders O
INNER JOIN Customers C on O.CustomerID = C.CustomerID
WHERE ShippedDate IS NULL AND ShipCountry='Argentina'


-- 6.
SELECT COUNT(EmployeeID) FROM Employees
WHERE (YEAR(BirthDate) BETWEEN 1952 AND 1954 OR YEAR(BirthDate) BETWEEN 1955 AND 1957 OR YEAR(BirthDate) BETWEEN 1960 AND 1962)
      AND (City!='London' OR City='Seattle')


