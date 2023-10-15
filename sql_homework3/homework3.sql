-- Задача 1: Вывести ко-во поставщиков не из UK и не из China

      SELECT  
      COUNT(*) AS SuppliersUpdated
      FROM Suppliers
      WHERE
      Country NOT IN ('USA' , 'China')

-- Задача 2: Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

      SELECT 
      AVG(Price) AS avg_price,
      MAX(Price) AS max_price,
      MIN(Price) AS min_price
      FROM Products
      WHERE 
      CategoryID IN (3,5)

-- Задача 3: Вывести общую сумму проданных товаров

      SELECT
      SUM(OrderDetails.Quantity) AS total_amount_of_sales
      FROM OrderDetails

-- Задача 4: Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)

      SELECT
      Orders.OrderID AS orderID,
      Customers.ContactName AS contact_name,
      Customers.Country AS customer_country,
      Employees.LastName AS employee_lastname,
      Shippers.ShipperName AS shipper_name
      FROM
      Orders
      JOIN Customers ON Orders.CustomerID = Customers.CustomerID
      JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
      JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- Задача 5: Вывести сумму, на которую было отправлено товаров клиентам в Germany

      SELECT
      SUM(Products.Price * OrderDetails.Quantity) AS amount_sent_to_Germany
      FROM OrderDetails
      JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
      JOIN Customers ON Orders.CustomerID=Customers.CustomerID
      JOIN Products ON OrderDetails.ProductID=Products.ProductID
      WHERE
      Customers.Country='Germany'