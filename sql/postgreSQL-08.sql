-- 8. Repeat customers
-- Find customers who have placed at least 5 delivered orders. Show customer ID, city, and number of delivered orders.

select c.customer_id, c.city, count(o.order_id) as delivered_orders
from customers c
join orders o
on c.customer_id = o.customer_id
where order_status like 'Delivered'
group by c.customer_id
having count(o.order_id) >= 5
order by delivered_orders desc;