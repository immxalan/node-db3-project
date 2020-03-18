-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryId
FROM Product;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.ShipName, od.OrderId
FROM [Order] as o 
INNER JOIN OrderDetail as od ON o.Id = od.OrderId
WHERE o.OrderDate < 20190809;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.Quantity, od.OrderId
FROM [Product] as p
INNER JOIN OrderDetail as od ON od.ProductId = p.Id
WHERE od.OrderId = 10251
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id, c.CompanyName, e.LastName
FROM [Order] as o 
INNER JOIN [Customer] AS c ON o.CustomerId = c.Id
INNER JOIN [Employee] AS e ON o.EmployeeId = e.Id;

-- STRETCH

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT CategoryName, Count(*) as Count FROM [Category]
JOIN Product ON Product.CategoryID = Category.ID
GROUP BY CategoryName;
-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT Orders.OrderID, Count() as ItemCount FROM [Orders]
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderId;