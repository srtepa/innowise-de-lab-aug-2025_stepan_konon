select first_name, last_name, o. item, o. amount
from customers c 
left join orders o
on c. customer_id = o. customer_id
order by c. customer_id;

--заметим, что нам выводятся также люди, которые ничего не покупали.
--если мы хотим видеть только тех, кто что-то купил - используем right join