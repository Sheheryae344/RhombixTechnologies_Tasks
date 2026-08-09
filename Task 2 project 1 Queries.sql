--Confirm everything loaded
SELECT COUNT(*) AS TotalRows FROM ECommerceData;
SELECT TOP 10 * FROM ECommerceData;

--SELECT + WHERE — filter to a specific country
SELECT InvoiceNo, StockCode, Description, Quantity, UnitPrice, Country
FROM ECommerceData
WHERE Country = 'United Kingdom' AND Quantity > 0;

--Calculated column — revenue per line item
SELECT InvoiceNo, StockCode, Description, Quantity, UnitPrice,
       Quantity * UnitPrice AS LineRevenue
FROM ECommerceData
WHERE Quantity > 0 AND UnitPrice IS NOT NULL;

--GROUP BY + ORDER BY — top-selling products
SELECT TOP 10 StockCode, Description,
       SUM(Quantity) AS UnitsSold,
       SUM(Quantity * UnitPrice) AS TotalRevenue
FROM ECommerceData
WHERE Quantity > 0 AND UnitPrice IS NOT NULL
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC;

--Revenue by country
SELECT Country,
       COUNT(DISTINCT InvoiceNo) AS NumOrders,
       SUM(Quantity * UnitPrice) AS TotalRevenue
FROM ECommerceData
WHERE Quantity > 0 AND UnitPrice IS NOT NULL
GROUP BY Country
ORDER BY TotalRevenue DESC;

--Monthly revenue — find the highest-revenue month
SELECT FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
       SUM(Quantity * UnitPrice) AS MonthlyRevenue,
       COUNT(DISTINCT InvoiceNo) AS OrdersCount
FROM ECommerceData
WHERE Quantity > 0 AND UnitPrice IS NOT NULL
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY MonthlyRevenue DESC;

--Top customers by spend
SELECT TOP 10 CustomerID,
       COUNT(DISTINCT InvoiceNo) AS OrdersPlaced,
       SUM(Quantity * UnitPrice) AS LifetimeRevenue
FROM ECommerceData
WHERE Quantity > 0 AND UnitPrice IS NOT NULL AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY LifetimeRevenue DESC;

--JOIN — this table is single-table, so let's create a real second table to join against
-- Build a small reference table
SELECT DISTINCT Country,
       ROW_NUMBER() OVER (ORDER BY Country) AS CountryID
INTO Countries
FROM ECommerceData;

-- Now JOIN OnlineRetail back to it
SELECT c.Country, c.CountryID,
       SUM(o.Quantity * o.UnitPrice) AS TotalRevenue
FROM ECommerceData o
JOIN Countries c ON o.Country = c.Country
WHERE o.Quantity > 0 AND o.UnitPrice IS NOT NULL
GROUP BY c.Country, c.CountryID
ORDER BY TotalRevenue DESC;