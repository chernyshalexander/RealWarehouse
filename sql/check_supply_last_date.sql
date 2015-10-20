select s.`date_id`, SUM(s.`qty`)  from supply s
where s.`base_curr`=27
group by s.`date_id`
order by s.`date_id` DESC
limit 15