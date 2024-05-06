WITH Sales_Product AS(
SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p on s.product_id = p.product_id
)
SELECT * FROM Sales_product
