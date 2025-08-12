select order_id, item, amount, customer_id 
from orders o
where o. amount>1000;