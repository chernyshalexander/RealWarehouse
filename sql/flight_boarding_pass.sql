SELECT
  trn_id,
  IF(boarding_pass BETWEEN "M1" AND  "M5", SUBSTRING(boarding_pass, 34, 3), "") AS AIRPORT_TO,
  IF(boarding_pass BETWEEN "M1" AND  "M5", SUBSTRING(boarding_pass, 31, 3), "") AS AIRPORT_FROM,
boarding_pass

FROM transaction
  WHERE st_id=1
  AND boarding_pass BETWEEN "M1" AND  "M9"
LIMIT 1000