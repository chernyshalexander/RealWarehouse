SELECT
  t.boarding_pass,
  SUBSTR(t.boarding_pass, 3, LOCATE('/', t.boarding_pass) - 3) AS "LAST NAME",

  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)), 'MRS', ''), 'MR', ''), 'MS', ''), 'MISS', ''), ' M', '') AS "FIRST NAME",

  IF((SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MRS%") OR (SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MS%") OR (SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MISS%"), 'FEMALE', IF(SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MR%",'MALE','UNKNOWN')) AS "SEX" 
  

FROM transaction t
WHERE st_id = 1
AND boarding_pass BETWEEN "M1" AND "M9"
LIMIT 10000

