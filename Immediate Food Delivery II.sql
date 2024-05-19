WITH FirstOrders AS(
    SELECT customer_id,
           MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
),
FirstOrderDeliveries AS(
    SELECT d.customer_id,
           d.order_date,
           d.customer_pref_delivery_date
    FROM Delivery d
    JOIN FirstOrders fo ON d.customer_id = fo.customer_id
    AND d.order_date = fo.first_order
)
SELECT ROUND(AVG(order_date=customer_pref_delivery_date) * 100, 2) as immediate_percentage 
FROM FirstOrderDeliveries
