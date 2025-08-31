# Создайте функцию без параметров show_current_time() — печатает
# текущие дату и время (используйте модуль datetime).

import datetime as dt #импортируем модуль

def show_current_time():#объявляем ф-цию
    print(f"Настоящее время в формате год-месяц-день часы-минуты-секунды: {dt.datetime.now()}")

show_current_time()#вызвывем ф-цию