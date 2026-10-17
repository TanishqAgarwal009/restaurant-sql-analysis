-- 5. Orders by status
-- Count delivered, cancelled, and refunded orders separately. Display the status and count.

select order_status, count(order_id)
from orders
group by order_status;