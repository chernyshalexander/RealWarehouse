COMMIT;
select t.`date_id`,
       sum(t.`qty`)
from `transaction` t
where t.`base_curr` = 6
group by  t.`date_id`
order by t.`date_id` DESC
limit 5