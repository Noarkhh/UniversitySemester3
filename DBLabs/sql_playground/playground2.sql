-- 1.
-- SELECT Orders.OrderID, [Order Details].UnitPrice, [Order Details].Quantity,
--        [Order Details].UnitPrice * [Order Details].Quantity AS TotalPrice,
--        [Order Details].UnitPrice * 1.15 AS UnitPriceTaxed,
--        [Order Details].Quantity * [Order Details].UnitPrice * 1.15 AS TotalPriceTaxed,
--        [Order Details].UnitPrice * [Order Details].Quantity * [Order Details].Discount AS TotalPriceDiscount,
--        [Order Details].UnitPrice * [Order Details].Quantity * [Order Details].Discount * 1.15 AS TotalPriceTaxedDiscount
-- FROM Orders
-- LEFT JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID

-- 2.
-- SELECT CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName, ', ur. ', BirthDate,
--     ', zatrudniony w dniu ', HireDate, ', adres: ', Address, ' ', City, ' ', PostalCode, ' ', Country)
-- FROM Employees
-- ORDER BY BirthDate

-- 3.
-- SELECT TOP 3 CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName, ', zatrudniony ', HireDate) FROM Employees
-- ORDER BY HireDate DESC

-- 4.
-- SELECT COUNT(EmployeeID) FROM Employees
-- WHERE Region IS NOT NULL

-- 5.
-- SELECT AVG(UnitPrice) FROM Products

-- 6.
-- SELECT AVG(UnitPrice) FROM Products
-- WHERE UnitsInStock >= 30

-- 7.
-- SELECT AVG(UnitPrice) FROM Products
-- WHERE UnitsInStock >= (SELECT AVG(UnitsInStock) from Products)

-- 8.
-- SELECT COUNT(Orders.OrderID) FROM Orders
-- LEFT JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID
-- WHERE UnitPrice > 30

-- 9.
-- SELECT MIN(UnitPrice) AS Min, MAX(UnitPrice) AS Max, AVG(UnitPrice) AS Avg FROM Products
-- WHERE QuantityPerUnit LIKE '%bottle%'

-- 10.
-- SELECT * FROM Products
-- WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

