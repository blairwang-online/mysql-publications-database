-- Replace hard-coded researcher_id 1 with any other number of your choosing
SELECT
	r.surname,
	r.forenames,
	COUNT(DISTINCT p.paper_id) AS paper_count,
	GROUP_CONCAT(p.paper_id) AS paper_ids
FROM
	authorship a
	JOIN researcher r ON a.researcher_id = r.researcher_id
	JOIN paper p ON a.paper_id = p.paper_id
WHERE
	a.researcher_id != 1
	AND a.paper_id IN (
		SELECT DISTINCT paper_id FROM authorship
		WHERE researcher_id = 1
	)
GROUP BY r.researcher_id
ORDER BY 3 DESC, 1 ASC, 2 ASC;
