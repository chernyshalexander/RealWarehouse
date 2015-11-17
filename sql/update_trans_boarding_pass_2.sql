UPDATE transaction t
SET t.airport_from=IF(boarding_pass BETWEEN "M1" AND  "M9", SUBSTRING(boarding_pass, 31, 3), ""),
    t.airport_to=IF(boarding_pass BETWEEN "M1" AND  "M9", SUBSTRING(boarding_pass, 34, 3), "")
WHERE st_id=1
AND boarding_pass BETWEEN "M1" AND  "M9"


