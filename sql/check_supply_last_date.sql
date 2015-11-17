SELECT
  s.`date_id`,
  SUM(s.`qty`)
FROM supply s
WHERE s.`base_curr` = 6
GROUP BY s.`date_id`
ORDER BY s.`date_id` DESC
LIMIT 50