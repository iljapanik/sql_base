INSERT INTO
	PERSON_ORDER (ID, PERSON_ID, MENU_ID, ORDER_DATE)
SELECT
	GEN_ID,
	GEN_PERSON_ID,
	(
		SELECT
			ID
		FROM
			MENU
		WHERE
			PIZZA_NAME = 'greek pizza'
	),
	'2022-02-25'
FROM
	(
		SELECT
			GENERATE_SERIES(
				(
					SELECT
						MAX(ID) + 1
					FROM
						PERSON_ORDER
				),
				(
					SELECT
						MAX(ID)
					FROM
						PERSON_ORDER
				) + (
					SELECT
						COUNT(ID)
					FROM
						PERSON
				),
				1
			) AS GEN_ID,
			GENERATE_SERIES(
				(
					SELECT
						MIN(ID)
					FROM
						PERSON
				),
				(
					SELECT
						MAX(ID)
					FROM
						PERSON
				),
				1
			) AS GEN_PERSON_ID
	);