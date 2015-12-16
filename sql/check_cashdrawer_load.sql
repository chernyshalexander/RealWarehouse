COMMIT;
select c.`date_id`,
       sum(c.amounteur)
from `cashdrawer` c
where c.`base_curr` = 27

group by c.`date_id`
order by c.`date_id` desc
limit 15