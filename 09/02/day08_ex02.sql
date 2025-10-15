SHOW TRANSACTION ISOLATION LEVEL; --REPEATABLE READ в именно транзакции

--Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #1
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';

--Session #2
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';

--Session #1
UPDATE PIZZERIA
SET
	RATING = 4
WHERE
	NAME = 'Pizza Hut';

--Session #2
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	NAME = 'Pizza Hut';

--Session #1
COMMIT;

--Session #2
COMMIT;

--Session #1
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';

--Session #2
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';