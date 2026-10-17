-- 3. Revenue by city
-- Calculate gross item sales for each city using delivered orders only. Display the city and total sales.

select ot.city, sum(oi.unit_price * oi.quantity) as revenue
from order_items oi
join orders o
on  oi.order_id = o.order_id
join outlets ot
on o.outlet_id = ot.outlet_id
where o.order_status like 'Delivered'
group by ot.city
order by revenue desc;