
SELECT
  c.name AS "Базовая валюта",
  dt.dt AS "Дата",
  SUM(s.qty) AS "Единиц товара"
FROM stock s FORCE INDEX (Index_1fk)
  JOIN currency c
    ON (c.currency_id = s.base_curr)
  JOIN dt
    ON (s.date_id = dt.date_id)
WHERE s.date_id IN ((SELECT
    MAX(s1.date_id)
  FROM stock s1), (SELECT
    MAX(s1.date_id) - 1
  FROM stock s1), (SELECT
    MAX(s1.date_id) - 2
  FROM stock s1))
GROUP BY c.name,
         dt.dt