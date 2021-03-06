SELECT
  department.`name`,
  SUM(sale.`sale_qty`),
  SUM(sale.`costusd` * `sale`.`sale_qty`) AS costsum,
  SUM(`sale`.`amountusd`) AS revenue,
  SUM(sale.`retailusd` * `sale`.`sale_qty`) AS retail,
  SUM(sale.`retailusd` * `sale`.`sale_qty`) - SUM(`sale`.`amountusd`) AS disc_summ
FROM `sale`,     
     `department`
WHERE sale.`dep_id` = `department`.`dep_id`
AND `sale`.`sldate_id` BETWEEN 20151201 AND 20151220
AND sale.`st_id` = 1
AND sale.company_id=1
AND sale.`opr_id` = 0
GROUP BY `department`.`name`