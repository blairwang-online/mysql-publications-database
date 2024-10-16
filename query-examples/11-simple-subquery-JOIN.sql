SELECT r.*
FROM researcher r
	JOIN authorship a ON a.researcher_id = r.researcher_id
	JOIN paper p ON a.paper_id = p.paper_id
WHERE p.doi = '10.17705/1jais.00641'
;