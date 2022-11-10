-- 1.
SELECT Products.ProductName, Products.UnitPrice, Suppliers.CompanyName FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice BETWEEN 20 AND 30

-- 2.
SELECT Products.ProductName, Products.UnitsInStock, Suppliers.CompanyName FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName='Tokyo Traders'

-- 3.
SELECT Customers.CustomerID, Customers.ContactName, Customers.Address FROM (SELECT * FROM Orders WHERE YEAR(OrderDate)=1997) as [O*]
RIGHT JOIN Customers on [O*].CustomerID = Customers.CustomerID
WHERE OrderDate IS NULL

-- 4.
SELECT Suppliers.CompanyName, Suppliers.Phone FROM Products
INNER JOIN Suppliers on Suppliers.SupplierID = Products.SupplierID
WHERE Products.UnitsInStock=0

-- 5.
SELECT Products.ProductName, Products.UnitPrice, Suppliers.ContactName, Suppliers.Address FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Products.UnitPrice BETWEEN 20 AND 30 AND Categories.CategoryName='Meat/Poultry'

-- 6.
SELECT Products.ProductName, Products.UnitPrice, Suppliers.CompanyName FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName='Confections'

-- 7.
SELECT C.CompanyName, C.Phone FROM Orders
INNER JOIN Shippers S on S.ShipperID = Orders.ShipVia
INNER JOIN Customers C on Orders.CustomerID = C.CustomerID
WHERE YEAR(Orders.OrderDate)=1997 AND S.CompanyName='United Package'

-- 8.
SELECT DISTINCT C2.CompanyName, C2.Phone FROM Orders
INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
INNER JOIN Products P on [O D].ProductID = P.ProductID
INNER JOIN Categories C on C.CategoryID = P.CategoryID
INNER JOIN Customers C2 on Orders.CustomerID = C2.CustomerID
WHERE C.CategoryName='Confections'

-- czelendż1
SELECT DISTINCT C2.CompanyName, C2.Phone, S.CompanyName FROM Orders
INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
INNER JOIN Products P on [O D].ProductID = P.ProductID
INNER JOIN Categories C on C.CategoryID = P.CategoryID
INNER JOIN Customers C2 on Orders.CustomerID = C2.CustomerID
INNER JOIN Suppliers S on S.SupplierID = P.SupplierID
WHERE C.CategoryName='Meat/Poultry'

-- czelendż2
SELECT DISTINCT C2.CompanyName, C2.Phone, S.CompanyName, R2.RegionDescription FROM Orders
INNER JOIN [Order Details] [O D] on Orders.OrderID = [O D].OrderID
INNER JOIN Products P on [O D].ProductID = P.ProductID
INNER JOIN Categories C on C.CategoryID = P.CategoryID
INNER JOIN Customers C2 on Orders.CustomerID = C2.CustomerID
INNER JOIN Suppliers S on S.SupplierID = P.SupplierID
INNER JOIN Employees E on E.EmployeeID = Orders.EmployeeID
INNER JOIN EmployeeTerritories ET on E.EmployeeID = ET.EmployeeID
INNER JOIN Territories T on ET.TerritoryID = T.TerritoryID
INNER JOIN Region R2 on R2.RegionID = T.RegionID
WHERE C.CategoryName='Meat/Poultry'