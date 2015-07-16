SELECT department.`name`,
       SUM(sale.`sale_qty`),
       SUM(sale.`costrur` * `sale`.`sale_qty`) as costsum,            
	   SUM(`sale`.`amountrur`) as revenue,
       SUM(sale.`retailrur` * `sale`.`sale_qty`) as retail,  
       SUM(sale.`retailrur` * `sale`.`sale_qty`)-SUM(`sale`.`amountrur`) as disc_summ
FROM `sale`,
     `good`,
     `department`
WHERE good.`dep_id` = `department`.`dep_id` and
      good.`good_id` = `sale`.`good_id` and
      `sale`.`sldate_id` BETWEEN 20130101 and 20131231 AND
      sale.`st_id` = 2 
      and sale.`opr_id` = 0
GROUP BY `department`.`name`