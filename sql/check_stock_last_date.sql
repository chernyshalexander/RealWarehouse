SELECT
  s.date_id,
  SUM(s.cost_amountusd)
FROM stock s
USE INDEX (Index_1fk)
WHERE s.base_curr = 6
AND s.company_id = 1
GROUP BY s.date_id
ORDER BY s.date_id DESC
LIMIT 10
