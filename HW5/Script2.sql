--сколько гостей обслужил каждый сотрудник
SELECT 
	s.first_name,--выбрать сотрудника
	s.last_name,
	SUM(r.num_guests) AS total_guests--просуммировать кол-во клиентов, которых обслужил
FROM 
	fact_reservations r
JOIN 
	dim_staff s --объединить по staff_id_sk
	ON r.staff_id_sk = s.staff_id_sk
GROUP BY 
	s.first_name, s.last_name--сгруппировать по сотрудникам
ORDER BY 
	total_guests DESC;--отсортировать в обратном порядке