-- 10. Delivery time and ratings
-- Compare average delivery time and average review rating for each outlet. Identify outlets that have slower delivery and lower ratings.

with avg_data as (
select ot.outlet_name, round(avg(o.delivery_minutes), 2) as delivery_time, round(avg(r.rating),2) as avg_rating
from orders o
join reviews r
on o.order_id = r.order_id
join outlets ot
on o.outlet_id = ot.outlet_id
where o.order_status like 'Delivered'
group by ot.outlet_name
ORDER BY delivery_time DESC
)

select d.outlet_name, delivery_time, avg_rating
from avg_data d
where delivery_time > (
	select avg(delivery_minutes)
	from orders
	) and
	  avg_rating < (
	select avg(rating)
	from reviews
	);