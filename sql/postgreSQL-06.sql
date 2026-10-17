-- 6. Average order value by city
-- Calculate average order value for each city using delivered orders. 

select city, round(avg(total_value),2) as average_order_value
from (
select ot.city, o.order_id, sum(mi.price * oi.quantity) as total_value
from outlets ot
join orders o
on ot.outlet_id = o.outlet_id
join order_items oi
on o.order_id = oi.order_id
join menu_items mi
on oi.item_id = mi.item_id
where o.order_status like 'Delivered'
group by ot.city, o.order_id
) as total_sales
group by city;