select s.`date_id`, SUM(s.`qty`)  from stock s
  USE INDEX (IDX_stock_company_id)
where s.company_id=1
group by s.`date_id`
order by s.`date_id` DESC
limit 10