INSERT INTO
	PERSON_VISITS (ID, PERSON_ID, PIZZERIA_ID, VISIT_DATE)
VALUES
	(
		(
			SELECT
				MAX(ID) + 1
			FROM
				PERSON_VISITS
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
				PIZZERIA
			WHERE
				NAME = 'Dominos'
		),
		'2022-02-24'
	),
	(
		(
			SELECT
				MAX(ID) + 2
			FROM
				PERSON_VISITS
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
				PIZZERIA
			WHERE
				NAME = 'Dominos'
		),
		'2022-02-24'
	);