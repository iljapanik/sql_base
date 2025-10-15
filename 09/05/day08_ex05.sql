SHOW TRANSACTION ISOLATION LEVEL;
--READ COMMITTED

--Session #1
BEGIN;

--Session #2
BEGIN;

--Session #1
SELECT
	SUM(RATING)
FROM
	PIZZERIA;

--Session #2
INSERT INTO
	PIZZERIA (ID, NAME, RATING)
VALUES
	(10, 'Kazan Pizza', 5);
	
--Session #2
COMMIT;

--Session #1
SELECT
	SUM(RATING)
FROM
	PIZZERIA;

--Session #1
COMMIT;

--Session #1
SELECT
	SUM(RATING)
FROM
	PIZZERIA;

--Session #2
SELECT
	SUM(RATING)
FROM
	PIZZERIA;