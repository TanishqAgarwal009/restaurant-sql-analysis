
-- 13. Top outlet in every city
-- Rank outlets within each city by gross item sales and return the top-performing outlet in each city. Include ties if possible.


with sales as(
select ot.outlet_name as outlet,
	ot.city as city,
	sum(oi.quantity * oi.unit_price) as gross_sales
from outlets ot
join orders o
on ot.outlet_id = o.outlet_id
join order_items oi
on o.order_id = oi.order_id
group by ot.outlet_name, ot.city
),

ranked as( 
select *, 
		rank() over(partition by city
		order by gross_sales desc
		) as rnk
from sales
)

select city, outlet, gross_sales
from ranked
where rnk = 1;




