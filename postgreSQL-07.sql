-- 7. Outlet cancellation rate
-- For each outlet, calculate total orders, cancelled orders, and cancellation percentage. Sort outlets by cancellation rate.

with outlet_orders as
(
select ot.outlet_name, count(o.order_id) as total_orders,
sum(
case
	when o.order_status = 'Cancelled' 
	then 1 else 0
	end 
) as cancelled_orders,

sum(
case
	when o.order_status = 'Refunded' 
	then 1 else 0
	end 
) as refunded_orders,
sum(
case
	when o.order_status = 'Delivered' 
	then 1 else 0
	end 
) as delivered_orders

from orders o
join outlets ot
on o.outlet_id = ot.outlet_id
group by ot.outlet_id
)
 
select outlet_name, 
	total_orders,
	cancelled_orders,
	round((100.0 * cancelled_orders)/total_orders, 2) as cancelled_rate,
	delivered_orders,
	refunded_orders
from outlet_orders
order by cancelled_rate desc;