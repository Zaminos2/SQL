SELECT
cus.name,
cus.lastname
FROM customers cus
WHERE id NOT IN (
SELECT
orders.customerid
FROM orders
);

SELECT
pr.title
FROM products pr
WHERE pr.id  NOT IN (
SELECT 
ord.productid
FROM orders ord
);


SELECT
pr.title
FROM products pr
WHERE pr.id NOT IN (
SELECT 
ord.productid
FROM orders ord
WHERE ord.ordertype IN ("online")
);
use homework_practice;

SELECT c.name, c.lastname
FROM customers c
WHERE c.id = (
    SELECT o.customerid
    FROM orders o
    INNER JOIN products pr ON pr.id = o.productid
    WHERE o.product_count IS NOT NULL
    ORDER BY pr.price * o.product_count DESC
    LIMIT 1
);
