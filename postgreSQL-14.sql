-- 14. Estimated menu-item margin
-- For each menu item, calculate quantity sold, sales, estimated item cost, and estimated item margin. Only include delivered orders.

select mi.item_name, 
	sum(oi.quantity) as quantity_sold,
	sum(oi.quantity * oi.unit_price) as sales,
	sum(mi.cost * oi.quantity) as estimated_cost,
	sum((oi.unit_price-mi.cost) * oi.quantity) as estimated_item_margin
from menu_items mi
join order_items oi
on mi.item_id = oi.item_id
join orders o
on oi.order_id = o.order_id
where o.order_status like 'Delivered'
group by mi.item_name, mi.cost









