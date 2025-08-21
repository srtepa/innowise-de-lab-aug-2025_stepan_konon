--просмотр количества бронирований у каждого клиента
SELECT 
	c.first_name, --выбрать столбцы
	c.last_name, 
	COUNT(r.reserv_id) AS total_reservations --посчитать кол-во бронирований
FROM 
	fact_reservations r
JOIN 
	dim_clients c --объединить
	ON r.client_id_sk = c.client_id_sk--по id
GROUP BY 
	c.first_name, c.last_name --сгруппировать по полному имени
ORDER BY --отсортировать по кол-во бронирований
	total_reservations;