SELECT FNAME FROM (SELECT
  FNAME
FROM (SELECT
  DISTINCT
    (
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
    22 - LOCATE('/', t.boarding_pass)), 'MRS', ''), 'MR', ''), 'MS', ''), 'MISS', ''), ' M', ''),' ','' )) AS "FNAME"
  FROM transaction t
  WHERE st_id = 1
  AND boarding_pass BETWEEN "M1" AND "M9"
  ) AS TBL1
HAVING LENGTH(FNAME) > 1) AS TBL2
  WHERE NOT EXISTS (SELECT FNAME FROM genderize g WHERE g.FNAME=TBL2.FNAME)