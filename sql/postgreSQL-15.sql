-- 15. Executive performance report
-- Build a single report by outlet showing delivered orders, gross item sales, average delivery time, average review rating, and cancellation rate. Use it to identify outlets needing attention.

with delivered as(
select ot.outlet_id, ot.outlet_name, 
	count(distinct o.order_id) as delivered_orders,
	round(avg(o.delivery_minutes),2) as avg_delivery_time
from orders o
join outlets ot
on o.outlet_id = ot.outlet_id
where o.order_status like 'Delivered'
group by ot.outlet_id, ot.outlet_name
),

item_sales as (
	select o.outlet_id,
	sum(oi.quantity * oi.unit_price) as gross_item_sales
from orders o
join order_items oi
on o.order_id = oi.order_id
where o.order_status like 'Delivered'
group by o.outlet_id
),

rating as(
	select o.outlet_id,
	round(avg(r.rating),2) as avg_rating
from orders o
join reviews r
on r.order_id = o.order_id
where o.order_status like 'Delivered'
group by o.outlet_id
),

cancelled as (
		select ot.outlet_id, ot.outlet_name, count(order_id) as cancellation_order
		from orders o
		join outlets ot
		on o.outlet_id = ot.outlet_id
		where order_status like 'Cancelled'
		group by ot.outlet_name, ot.outlet_id
	), 

total as (
	select outlet_id,
	count(order_id) as total_orders
	from orders 
	group by outlet_id
),

cancellation as (
	select t.outlet_id, 
	round(
	(c.cancellation_order * 100.0) / nullif(t.total_orders,0),
	2
	) as cancellation_rate 
	from cancelled c
	join total t
	on t.outlet_id = c.outlet_id
	)

select d.outlet_name,
	d.delivered_orders,
	i.gross_item_sales,
	d.avg_delivery_time,
	r.avg_rating,
	COALESCE(c.cancellation_rate, 0) AS cancellation_rate
from delivered d
left join cancellation c
on d.outlet_id = c.outlet_id
join item_sales i
on i.outlet_id = d.outlet_id
join rating r
on r.outlet_id = d.outlet_id
order by cancellation_rate desc;





