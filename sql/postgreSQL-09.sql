-- 9. Popular categories by city
-- Find the most popular menu category in each city based on quantity sold in delivered orders.

with item_order as(
select mi.category as popular_category,
		ot.city as city,
		sum(oi.quantity) as item_delivered
from order_items oi
join orders o
on oi.order_id = o.order_id
join outlets ot
on o.outlet_id = ot.outlet_id
join menu_items mi
on oi.item_id = mi.item_id
where order_status like 'Delivered'
group by mi.category, ot.city
),

ranked as (
select *, 
	rank() over(partition by city
	order by item_delivered desc
	) as rnk
	from item_order
)

select city, popular_category, item_delivered
from ranked
where rnk = 1;