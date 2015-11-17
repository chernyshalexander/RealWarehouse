UPDATE
 transaction t
 SET t.gender=   IF((SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MRS%") OR (SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MS%") OR (SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MISS%"), 'f', IF(SUBSTR(t.boarding_pass, LOCATE('/', t.boarding_pass) + 1,
  22 - LOCATE('/', t.boarding_pass)) LIKE "%MR%",'m','u'))
 WHERE st_id=1
AND boarding_pass BETWEEN "M1" AND  "M9"