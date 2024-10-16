SELECT r.*, p.paper_title, p.citations
FROM researcher r
	JOIN authorship a ON a.researcher_id = r.researcher_id
	JOIN paper p ON a.paper_id = p.paper_id
WHERE p.paper_id IN (
	SELECT paper_id
	FROM
	(
		SELECT
			p.paper_id,
			GROUP_CONCAT(r.surname ORDER BY a.seqno ASC SEPARATOR ", ") AS authorlist,
			p.pub_year,
			p.citations,
			ROUND((p.citations / (2024-pub_year)), 1) AS citations_per_year,
			ROUND((p.citations / COUNT(DISTINCT r.researcher_id)), 1) AS citations_per_author,
			p.paper_title,
			p.outlet_name,
			p.doi
		FROM
			paper p
			LEFT JOIN authorship a ON p.paper_id = a.paper_id
			LEFT JOIN researcher r ON r.researcher_id = a.researcher_id
		GROUP BY p.paper_id
		HAVING ROUND((p.citations / COUNT(DISTINCT r.researcher_id)), 1) > 30
		ORDER BY citations_per_year DESC
	) x
)
;
