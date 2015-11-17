select s.`date_id`, SUM(s.`qty`)  from stock s
  USE INDEX (Index_1fk)
where s.`base_curr`=27
group by s.`date_id`
order by s.`date_id` DESC
limit 5