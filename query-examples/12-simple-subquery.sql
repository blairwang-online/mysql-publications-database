SELECT *
FROM researcher
WHERE researcher_id IN (
	SELECT researcher_id
	FROM authorship
	WHERE paper_id IN (
		SELECT paper_id
		FROM paper
		WHERE doi = '10.17705/1jais.00641'
	)
)
;