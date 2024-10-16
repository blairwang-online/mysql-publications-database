SELECT
	paper_id,
	paper_title,
	outlet_name,
	citations
FROM paper
;

-- group statement --

SELECT
	GROUP_CONCAT(paper_id) AS paper_ids,
	GROUP_CONCAT(paper_title) AS paper_titles,
	outlet_name,
	COUNT(DISTINCT paper_id) AS papers_this_outlet,
	SUM(citations) AS total_citations,
	AVG(citations) AS citations_per_paper
FROM paper
GROUP BY outlet_name
;

