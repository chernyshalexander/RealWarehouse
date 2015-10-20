/*номера рейсов без привязки к авиакомпаниям*/
SELECT t.flight_id,f.name as "Flight number", COUNT(*) FROM
  transaction t
  JOIN flight f ON (f.flight_id=t.flight_id)
  WHERE t.type=0
  AND t.st_id=1
  AND t.al_id=0
  AND t.flight_id>0
  GROUP BY f.name