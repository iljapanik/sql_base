SHOW TRANSACTION ISOLATION LEVEL; --read committed

--Session #1
BEGIN;

--Session #2
BEGIN;

--Session #1
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';

--Session #2
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	NAME = 'Pizza Hut';

--Session #2
COMMIT;

--Session #1
SELECT
	*
FROM
	PIZZERIA
WHERE
	NAME = 'Pizza Hut';

--Session #1
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