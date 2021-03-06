
SELECT  `department`.`name`, 
	SUM(stock.qty) as QTY, 
	SUM(`stock`.`costeur`* `stock`.`qty`) AS SUMCOST,
    SUM(`stock`.`retaileur`* `stock`.`qty` ) AS SUMRETAIL
     FROM 
 `stock`,`department`
WHERE 
`department`.`dep_id`=`stock`.`dep_id` and 
stock.`base_curr`=15
and stock.`date_id`=20131231

GROUP BY `department`.`name`