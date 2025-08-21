--сколько бронировали в каждый из дней недели
SELECT 
	d.day_of_week, 
	COUNT(r.reserv_id) AS total_reservations --сумма бронирований в конктретный д.н.
FROM 
	fact_reservations r
JOIN 
	dim_date d --объединяем, чтобы получить полную инфо
	ON r.date_sk = d.date_sk
GROUP BY 
	d.day_of_week--группируем по лням недели для легктго визуального анализа
ORDER BY 
	d.day_of_week;--сортируем от пн до вс