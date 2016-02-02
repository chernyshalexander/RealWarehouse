SELECT
  dt.month,
  f.name AS flight,
  a.descr AS airline,
  l.name AS location,
  d.name AS department,  
  a1.country_eng AS destination,
  SUM(t.amountusd) AS revenue,
  SUM(t.qty) AS "sold qty"
FROM transaction t
  JOIN department d
    ON d.dep_id = t.dep_id
  JOIN location l
    ON l.loc_id = t.loc_id
  JOIN flight f
    ON f.flight_id = t.flight_id
  JOIN airline a ON t.al_id = a.al_id
  JOIN dt
    ON t.date_id = dt.date_id
  JOIN airport a1 ON a1.iata_code=t.airport_to
WHERE t.company_id = 1
AND t.st_id = 1
AND t.date_id BETWEEN 20150101 AND 20151231
AND t.type = 0
GROUP BY dt.month,
         l.name,
         f.name,a.name,
         d.name,a1.country_eng
 