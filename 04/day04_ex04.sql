CREATE VIEW V_SYMMETRIC_UNION AS (
	WITH
		R AS (
			SELECT
				PERSON_ID
			FROM
				PERSON_VISITS
			WHERE
				VISIT_DATE = '2022-01-02'
		),
		S AS (
			SELECT
				PERSON_ID
			FROM
				PERSON_VISITS
			WHERE
				VISIT_DATE = '2022-01-06'
		) (
			SELECT
				*
			FROM
				R
			EXCEPT
			SELECT
				*
			FROM
				S
		)
		UNION
		(
			SELECT
				*
			FROM
				S
			EXCEPT
			SELECT
				*
			FROM
				R
		)
	ORDER BY
		PERSON_ID
);