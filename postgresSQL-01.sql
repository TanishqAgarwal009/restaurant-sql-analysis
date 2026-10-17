-- 1. Find the total number of orders received by each outlet. 
-- Display the outlet name and order count, sorted from highest to lowest.

select ot.outlet_name, count(o.order_id) as total_order
from orders o
join outlets ot
on o.outlet_id = ot.outlet_id
group by o.outlet_id, ot.outlet_name
order by count(o.order_id) desc;