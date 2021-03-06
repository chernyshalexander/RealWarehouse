SELECT `supplier`.`name`,
       SUM(sale.`sale_qty`),
       SUM(sale.`retaileur` * `sale`.`sale_qty`) as retail,
       SUM(sale.`costeur` * `sale`.`sale_qty`) as costsum,
	   SUM(`sale`.`amounteur`) as revenue,
       SUM(sale.`retaileur` * `sale`.`sale_qty`)-SUM(`sale`.`amounteur`) as disc_summ
FROM `sale`,
     `good`,
     `supplier`
WHERE `sale`.`supplier_id`=`supplier`.`supplier_id` and
      good.`good_id` = `sale`.`good_id` and
      `sale`.`sldate_id` = 20130110 and
      sale.`st_id` = 1 and
      sale.`opr_id` = 1
GROUP BY `supplier`.`name`