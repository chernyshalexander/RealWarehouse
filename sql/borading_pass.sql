select t1.reg_id,t2.reg_id, distinct(t1.boarding_pass),t1.time
from `transaction` t1,
     `transaction` t2
where t1.`boarding_pass` = t2.`boarding_pass` and
      t1.reg_id > t2.reg_id and t1.
      t1.`boarding_pass` like 'm1%' and
      t2.date_id between 20130701 and 20130701 and
      t1.date_id between 20130701 and 20130701 and
      t1.`type` = 0 and 
      t2.type=0