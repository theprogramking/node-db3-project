-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT P.ProductName, C.CategoryName FROM Product AS P
JOIN Category AS C
ON P.CategoryId = C.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT O.Id, O.ShipName 
FROM "Order" AS O 
WHERE O.OrderDate < "2012-09-07"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT P.ProductName, O.Quantity
FROM Product AS P
    INNER JOIN OrderDetail as O
    ON P.Id = O.ProductId AND O.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT O.Id, O.ShipName, E.LastName
FROM "Order" AS O
JOIN Employee AS E
WHERE O.EmployeeId = E.Id
