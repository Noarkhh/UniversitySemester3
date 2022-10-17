-- 8.
-- SELECT Products.ProductName, Products.UnitPrice, Categories.Description FROM Products
-- LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
-- WHERE Categories.Description LIKE '%Sweet%';

-- 9.
-- SELECT LastName, BirthDate FROM Employees
-- WHERE City='London' AND BirthDate < '1960-01-01 00:00:00.000';

-- 10.
-- SELECT TOP 5 FirstName, LastName, BirthDate FROM Employees
-- ORDER BY BirthDate;

-- 11.
-- SELECT COUNT(EmployeeID) FROM Employees
-- WHERE (BirthDate BETWEEN '1950' AND '1955' OR BirthDate BETWEEN '1958' AND '1960') AND City='London';

-- 12.
-- SELECT ProductName FROM Products
-- WHERE Discontinued='false';

-- 13.
-- SELECT Orders.OrderID, Customers.CustomerID FROM Orders
-- LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
-- WHERE OrderDate < '1996-09-01'

-- 14.
-- SELECT CompanyName, ContactName from Customers
-- WHERE CompanyName LIKE '%the%'

-- 15.
-- SELECT CompanyName, ContactName from Customers
-- WHERE CompanyName LIKE 'B%' OR CompanyName LIKE 'W%'

-- 16.
-- SELECT ProductID, ProductName, UnitPrice FROM Products
-- WHERE ProductName LIKE 'C%' OR (ProductID < 40 AND UnitPrice > 20)

-- 20.
-- SELECT CompanyName, Country, Fax, HomePage FROM Suppliers
-- WHERE Fax IS NULL AND HomePage IS NULL AND (Country='USA' OR Country='Germany')

-- 21.
-- SELECT COUNT(ProductID) FROM Products
-- WHERE QuantityPerUnit LIKE '%bottle%' OR QuantityPerUnit LIKE '%glass%'

-- 22.
-- SELECT COUNT(Products.ProductID), Categories.CategoryName FROM Products
-- LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
-- GROUP BY CategoryName

-- 23.
-- SELECT Categories.CategoryName, SUM(Products.UnitsInStock) FROM Products
-- LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
-- GROUP BY Categories.CategoryName
-- ORDER BY SUM(Products.UnitsInStock)