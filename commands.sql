
-- create
CREATE TABLE customers (
  customerId integer PRIMARY KEY,
  name varchar(20) NOT NULL,
  email varchar(30) NOT NULL UNIQUE
);

-- insert
INSERT INTO customers VALUES (1, 'Alice', 'alice04556@gmail.com');
INSERT INTO customers VALUES (2, 'Bob', 'bob13666@gmail.com');
INSERT INTO customers VALUES (3, 'Charlie', 'charlie66987@gmail.com');

-- fetch 
CREATE TABLE orders (
  orderId integer PRIMARY KEY,
  customerId integer NOT NULL,
  order_date date default current_date,
  total_amount decimal default 0,
  FOREIGN KEY (customerId) REFERENCES customers (customerId)
);

-- insert
INSERT INTO orders VALUES (101, 1, '2025-04-01', 150.00);
INSERT INTO orders VALUES (102, 2, '2025-04-12', 100.00);
INSERT INTO orders VALUES (103, 2, '2025-04-25', 200.00);

--fetch
--Write a query to list all customers who have made at least one order. 
--Include their name and total amount of all their orders.
-- SELECT c.name, sum(o.total_amount) FROM customers c
-- JOIN orders o ON c.customerId = o.customerId
-- GROUP BY c.name

--Write a query to find customers who have never made an order.
-- SELECT c.customerId, c.name 
-- FROM customers c
-- LEFT JOIN orders o ON c.customerId = o.customerId
-- WHERE o.orderId IS NULL
-- GROUP BY c.name, c.customerId

--Write a query to get the most recent order for each customer.
-- SELECT o.orderId, o.order_date, c.name, o.total_amount
-- FROM orders o 
-- JOIN customers c ON o.customerId = c.customerId
-- WHERE o.order_date = (
--   SELECT max(o2.order_date)
--   FROM orders o2
--   WHERE o2.customerId = o.customerId
-- );


--Write a query to return each customer's name along with the number of orders they made and their average order value.
-- SELECT c.name, count(o.orderId), avg(o.total_amount) 
-- FROM customers c 
-- JOIN orders o ON c.customerId = o.customerId
-- GROUP BY c.customerId, c.name
-- ORDER BY c.name

--Write a query to return the names and number of orders of customers who placed more than one order.
-- SELECT c.name, count(o.orderId) as orders
-- FROM customers c
-- JOIN orders o ON c.customerId = o.customerId
-- GROUP BY c.name
-- HAVING count(o.orderId) > 1

--Task: Find the customer(s) who spent the most in total.
--Return the customer's name and the total amount they spent on all orders.
--If multiple customers spent the same maximum amount, return them all.
-- SELECT c.name, o.customerId, sum(o.total_amount) as total_spent
-- FROM customers c
-- JOIN orders o ON c.customerId = o.customerId
-- GROUP BY o.customerId, c.name
-- HAVING sum(o.total_amount) = (
--   SELECT max(total)
--   FROM (
--     SELECT sum(o2.total_amount) as total
--     FROM orders o2
--     GROUP BY o2.customerId
--   ) sub
  
-- );
--Task: Find customers who have never placed an order.
--Return the names (and optionally the IDs) of customers who have no records in the orders table.
-- SELECT c.name, c.customerId
-- FROM customers c 
-- WHERE NOt EXISTS (
--   SELECT 1
--   FROM orders o
--   WHERE o.customerId = c.customerId
-- )


  












