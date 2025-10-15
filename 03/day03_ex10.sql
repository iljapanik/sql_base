INSERT INTO
	PERSON_ORDER (ID, PERSON_ID, MENU_ID, ORDER_DATE)
VALUES
	(
		(
			SELECT
				MAX(ID) + 1
			FROM
				PERSON_ORDER
		),
		(
			SELECT
				ID
			FROM
				PERSON
			WHERE
				NAME = 'Denis'
		),
		(
			SELECT
				ID
			FROM
				MENU
			WHERE
				PIZZA_NAME = 'sicilian pizza'
		),
		'2022-02-24'
	),
	(
		(
			SELECT
				MAX(ID) + 2
			FROM
				PERSON_ORDER
		),
		(
			SELECT
				ID
			FROM
				PERSON
			WHERE
				NAME = 'Irina'
		),
		(
			SELECT
				ID
			FROM
				MENU
			WHERE
				PIZZA_NAME = 'sicilian pizza'
		),
		'2022-02-24'
	);