--сколько раз бронировался каждый столик
SELECT 
	t.table_id_sk, 
	t.hall, 
	COUNT(r.reserv_id) AS total_reservations --сумма сколько раз бронировали определенный столик
FROM 
	fact_reservations r
JOIN --объединяем с измерением столов
	dim_tables t 
	ON r.table_id_sk = t.table_id_sk
GROUP BY --группируем по id стола и залу
	t.table_id_sk, 
	t.hall
ORDER BY --отсортируем в убывании, чтобы увидеть самый загруженный столик
	total_reservations DESC;