SELECT
  s.sldate_id,
  SUM(s.sale_qty)
FROM sale s
WHERE s.company_id = 2
GROUP BY s.sldate_id
ORDER BY s.sldate_id DESC
LIMIT 50