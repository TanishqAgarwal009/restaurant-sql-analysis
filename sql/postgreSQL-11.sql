-- 11. Peak ordering times
-- Find the busiest day of the week and hour of the day based on order count. Compare patterns across cities if possible.

with peak_time as (
select ot.city,
		to_char(o.order_date, 'fmday') as week_day,
	    extract(hour from o.order_date) as order_hour,
		count(order_id) as total_order
from orders o
join outlets ot
on o.outlet_id = ot.outlet_id
group by ot.city,
		 to_char(o.order_date, 'fmday'),
		 extract(hour from o.order_date)
),

ranked as (
select *, 
	rank() over(partition by city
	order by total_order desc) as rnk
	from peak_time
)

select city, week_day, order_hour, total_order
from ranked
where rnk = 1;