--получить инфо: какое же самое популярное время для бронирования
SELECT
	t.hour,
	COUNT(r.reserv_id) AS total_reservations--сумма броней на конктретное время
FROM
	fact_reservations r
JOIN
	dim_time t
	ON r.time_sk = t.time_sk
GROUP BY
	t.hour--группируем по времени (чтобы использовать агрегатные ф-ции и для легкого анализа)
ORDER BY
	total_reservations DESC--сортируем по убыванию (самое большое число в конце)
LIMIT 1;--т.к. нам нужно только одно время