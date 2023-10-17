-- Задача 1: Найти мин/стоимость товаров для каждой категории

      Categories.CategoryName,
      MIN(Products.Price) AS min_price
      FROM Products
      JOIN Categories ON Products.CategoryID = Categories.CategoryID
      GROUP BY
      Categories.CategoryName

-- Задача 2: Вывести названия категорий, в которых более 10 товаров

      SELECT
      Categories.CategoryName,
      COUNT(Products.ProductID) AS amount_of_products
      FROM Categories
      JOIN Products ON Categories.CategoryID = Products.CategoryID
      GROUP BY
      Categories.CategoryName
      HAVING
      COUNT(Products.ProductID) > 10

-- Задача 3: Очистить тел номер поставщикам из USA

      UPDATE Suppliers
      SET Phone = NULL
      WHERE Country='USA'

-- Задача 4: Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

      SELECT
      Employees.FirstName,
      Employees.LastName,
      COUNT(Orders.OrderID) AS amount_of_orders
      FROM Employees
      JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
      GROUP BY
      Employees.FirstName, Employees.LastName
      HAVING
      COUNT(Orders.OrderID) < 15