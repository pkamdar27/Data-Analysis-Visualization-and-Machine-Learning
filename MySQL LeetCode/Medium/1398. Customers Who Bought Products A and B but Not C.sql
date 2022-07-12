-- Table: Customers

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | customer_id         | int     |
-- | customer_name       | varchar |
-- +---------------------+---------+
-- customer_id is the primary key for this table.
-- customer_name is the name of the customer.
 

-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | customer_id   | int     |
-- | product_name  | varchar |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- customer_id is the id of the customer who bought the product "product_name".
 

-- Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

-- Return the result table ordered by customer_id.

-- The query result format is in the following example.

 

-- Customers table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 1           | Daniel        |
-- | 2           | Diana         |
-- | 3           | Elizabeth     |
-- | 4           | Jhon          |
-- +-------------+---------------+

-- Orders table:
-- +------------+--------------+---------------+
-- | order_id   | customer_id  | product_name  |
-- +------------+--------------+---------------+
-- | 10         |     1        |     A         |
-- | 20         |     1        |     B         |
-- | 30         |     1        |     D         |
-- | 40         |     1        |     C         |
-- | 50         |     2        |     A         |
-- | 60         |     3        |     A         |
-- | 70         |     3        |     B         |
-- | 80         |     3        |     D         |
-- | 90         |     4        |     C         |
-- +------------+--------------+---------------+

-- Result table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 3           | Elizabeth     |
-- +-------------+---------------+
-- Only the customer_id with id 3 bought the product A and B but not the product C.




# Write your MySQL query statement below

SELECT 
    c.customer_id, c.customer_name
FROM 
    Customers c
WHERE customer_id IN ( SELECT DISTINCT customer_id
                        FROM Orders
                        WHERE product_name = 'A' 
                        AND
                        customer_id in (select distinct customer_id from Orders
                                         where product_name = 'B'))
                        AND 
                        customer_id NOT IN (select distinct customer_id from Orders
                                             where product_name = 'C' )


SELECT DISTINCT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id  
WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id
                          FROM Orders
                          WHERE product_name = "C")
AND c.customer_id IN (SELECT DISTINCT customer_id
                          FROM Orders
                          WHERE product_name = "B")
AND c.customer_id IN (SELECT DISTINCT customer_id
                          FROM Orders
                          WHERE product_name = "A")