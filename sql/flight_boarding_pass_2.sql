SELECT
 DISTINCT( 
 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)), 'MRS', ''), 'MR', ''), 'MS', ''), 'MISS', ''), ' M', '')) AS "FIRST NAME"


FROM transaction t
WHERE st_id = 1
AND boarding_pass BETWEEN "M1" AND "M9"
HAVING LENGHT("FIRST NAME")>1
LIMIT 1000
