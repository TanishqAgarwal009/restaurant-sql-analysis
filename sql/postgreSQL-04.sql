-- 4. Customer review analysis
-- Calculate the average review rating for each outlet. Show the outlet name and average rating, highest rated first.

select ot.outlet_name, round(avg(r.rating),2) as avg_rating
from outlets ot
join orders o
on ot.outlet_id = o.outlet_id
join reviews r
on o.order_id = r.order_id
group by ot.outlet_name
order by avg_rating desc;