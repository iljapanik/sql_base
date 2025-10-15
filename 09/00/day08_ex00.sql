--Session #1
-- начали
BEGIN;

--обновили
UPDATE PIZZERIA
SET
	RATING = 5
WHERE
	NAME = 'Pizza Hut';

--закончили
COMMIT;

--Session #2 запускаем 2 раза до и после вывод на скиншоте
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';