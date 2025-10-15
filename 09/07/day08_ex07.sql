SHOW TRANSACTION ISOLATION LEVEL; --read committed

--Session #1
BEGIN;

--Session #2
BEGIN;

--Session #1
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	id = 1;

--Session #2
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	id = 2;

--Session #1
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	id = 2;

--Session #2
UPDATE PIZZERIA
SET
	RATING = 3.6
WHERE
	id = 1;

--Session #1
COMMIT;

--Session #2
COMMIT;

