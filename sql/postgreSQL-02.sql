-- 2. Best-selling menu items
-- Find the top 5 menu items by total quantity sold. Count only items belonging to delivered orders.

select oi.item_id, mi.item_name, sum(oi.quantity) as order_placed
from order_items oi
join orders o
on oi.order_id = o.order_id
join menu_items mi
on oi.item_id = mi.item_id
where o.order_status like 'Delivered'
group by oi.item_id, mi.item_name
order by order_placed desc limit 5;
