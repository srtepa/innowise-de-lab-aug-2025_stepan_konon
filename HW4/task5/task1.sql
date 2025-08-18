CREATE OR REPLACE FUNCTION CalculateAnnualBonus (--создаем функцию
	employeeid INTEGER,--которая принимает такие аргументы
	salary NUMERIC 
)
RETURNS NUMERIC--возвращает тип
LANGUAGE plpgsql
AS $$
DECLARE 
	bonus NUMERIC;--будет использоваться такая переменная в области видимости ф-ции
BEGIN 
	IF salary<0 THEN --если зп<0
		RETURN 0;--возвращаем 0
	ELSE --иначе
		bonus:=salary/10;
		RETURN bonus;--возвращаем сумму бонуса
	END IF;
END;
$$;

