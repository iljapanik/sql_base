INSERT INTO
	MENU (ID, PIZZERIA_ID, PIZZA_NAME, PRICE)
VALUES
	(
		(
			SELECT
				MAX(MENU.ID) + 1
			FROM
				MENU
		),
		(
			SELECT
				ID
			FROM
				PIZZERIA
			WHERE
				NAME = 'Dominos'
		),
		'sicilian pizza',
		900
	)