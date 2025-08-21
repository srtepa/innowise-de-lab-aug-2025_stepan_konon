В первом HW мной была выбрана бизнес-область: **Система бронирования в ресторане**.
В данном задании нужно спроектировать DWH с использованием одной из схем (Звезда или Снежинка). Я выбрал схему "**Звезда**", т.к. при использовании ее SQL-запросы выглядят проще и элегантнее.

**Почему мной была выбрана именно эта бизнес-область?** Я считаю, что в данной сфере обслуживания должно быть все четно: стаф должен знать, какой именно столик он может предложить клиенту. Также важной деятельностью является аналитика: знать, какой день недели самый загруженный, - хорошая практика, чтобы на смену ставить больше работников (избегать длительное ожидание, что сейчас не редкость). 

**Уровень детализации (grain):** 
	одно уникальное бронирование одного столика одним клиентом на конкретную дату и конкретное время, обработанное конкретным сотрудником. Значит, одна строка в таблице фактов - это одно бронирование.

В данной бизнес-области я выделил следующую таблицу фактов - fact_reservations, т.к. самый главный процесс - просмотр забронированных столов, а также делать статистику бронирования столов.

После выбора таблицы фактов, важно правильно выбрать таблицы измерений, чтобы разграничить таблицы (хоть они могут быть и денормализованы).

Присутствуют вопросы: "Где вы предпочитаете сидеть?", "В какой день вы хотите забронировать?", "В какое время?", "Сколько будет человек?"

При этом были выделены следующие таблицы измерений: dim_clients, dim_staff, dim_tables, dim_date, dim_time с учетом того, какую бы можно было делать аналитику.

Рассмотрим таблицы измерений и фактов:
1. **Fact**: fact_reservations
	- **Description**: таблица фактов бронирования (центральная таблица от которой отходят связи к таблицам измерения)
	- **Attributes**:
		- reserv_id: PK, SERIAL;
		- client_id_sk: SK (REFERENCES dim_clients), INTEGER, NOT NULL;
		- table_id_sk: SK (REFERENCES dim_tables), INTEGER, NOT NULL;
		- staff_id_sk: SK (REFERENCES dim_staff), INTEGER, NOT NULL;
		- date_sk: SK (REFERENCES dim_date), INTEGER, NOT NULL;
		- time_sk: SK (REFERENCES dim_time), INTEGER, NOT NULL;
		- num_guests: INTEGER, NOT NULL, DEFAULT 1.
	- **Constrainst**:
		- PK_reservations: PRIMARY KEY (reserv_id);
		- SK_reservations_clients: SURROGATE KEY (client_id_sk) REFERENCES dim_clients(client_id_sk);
		- SK_reservations_tables: SURROGATE KEY (table_id_sk) REFERENCES dim_tables(table_id_sk);
		- SK_reservations_staff: SURROGATE KEY (staff_id_sk) REFERENCES dim_staff(staff_id_sk);
		- CHK_guests: CHECK(num_guests<=dim_tables.table_id.capacity);
2. **Dimension**: dim_clients
	- Description: справочник клиентов, совершающих бронирования
	- **Attributes**:
		- client_id_sk: PK, SERIAL;
		- first_name: TEXT, NOT NULL;
		- last_name: TEXT, NOT NULL;
		- phone_number: VARCHAR(15), NOT NULL, UNIQUE;
		- email: TEXT, UNIQUE.
	- **Constrainst**:
		- PK_clients: PRIMARY KEY (client_id_sk);
		- UQ_clients_phone: UNIQUE (phone_number);
		- UQ_clients_email: UNIQUE (email).
3. **Dimension**: dim_tables
	- **Description**: список столов в ресторане с их характеристиками
	- **Attributes**:
		- table_id_sk: PK, SERIAL;
		- hall: SMALLINT, NOT NULL;
		- capacity: SMALLINT, NOT NULL, DEFAULT 1.
	- **Constrainst**: 
		- PK_tables: PRIMARY KEY (table_id_sk);
		- CHK_capacity: CHECK(capacity > 0).
4. **Dimension**: dim_staff
	-  **Description**: список сотрудников ресторана, которые могут быть связаны с бронированием
	- **Attributes**:
		- staff_id_sk: PK, SERIAL;
		- first_name: TEXT, NOT NULL;
		- last_name: TEXT, NOT NULL;
		- position: TEXT.
	- **Constrainst**:
		- PK_staff: PRIMARY KEY (staff_id_sk).
5. **Dimension**: dim_date
	- **Description**: измерение с атрибутами даты для анализа по дням, месяцам и годам
	- **Attributes**:
		- date_sk: PK, SERIAL;
		- full_date: DATE, NOT NULL;
		- day_of_week: SMALLINT, NOT NULL;
		- month: SMALLINT, NOT NULL;
		- year: SMALLINT, NOT NULL;
		- is_weekend: BOOLEAN, NOT NULL.
	- **Constrainst**:
		- PK_date: PRIMARY KEY (date_sk);
		- CHK_day_of_week: CHECK (day_of_week BETWEEN 1 AND 7);
		- CHK_month: CHECK (month BETWEEN 1 AND 12).
6. **Dimension**: dim_time
	- **Description**: измерение времени суток, детализирующее время бронирования
	- **Attributes**:
		- time_sk: PK, SERIAL;
		- time: TIME, NOT NULL;
		- hour: SMALLINT, NOT NULL;
		- minute: SMALLINT, NOT NULL.
	- **Constrainst**:
		- PK_time: PRIMARY KEY (time_sk);
		- CHK_hour: CHECK (hour BETWEEN 0 AND 23);
		- CHK_minute: CHECK (minute BETWEEN 0 AND 59).