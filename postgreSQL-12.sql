-- 12. Month-over-month sales growth
-- Calculate monthly gross item sales and the percentage change compared with the previous month.

with monthly_sales as (
select date_trunc('month', o.order_date)::date as sales_month ,
		sum(oi.quantity * oi.unit_price) as gross_sales
from order_items oi
join orders o
on oi.order_id = o.order_id
where order_status like 'Delivered'
group by date_trunc('month', o.order_date)::date
order by sales_month
),

previous_sales as (
select *,
	lag(gross_sales) over(order by sales_month) as pre_month_sales
from monthly_sales
)

select  upper(to_char(sales_month, 'fmmonth yyyy')) as months,
		gross_sales,
		gross_sales - pre_month_sales as monthly_growth,
		round(
		((gross_sales-pre_month_sales) * 100.0
		/ nullif(pre_month_sales, 0))::numeric, 2)  as growth_percentage
from previous_sales;