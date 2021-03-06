
SELECT  `brand`.`name`, 
	SUM(stock.qty) as QTY, 
	SUM(`stock`.`costrur`* `stock`.`qty`) AS SUMCOST,
    SUM(`stock`.`retailrur`* `stock`.`qty` ) AS SUMRETAIL
     FROM 
 `stock`,`brand`,`good`
WHERE 
`brand`.`brand_id`=`good`.`brand_id` AND
`stock`.`good_id`=`good`.`good_id` and
stock.`base_curr`=27
and stock.`date_id`=20130131 

GROUP BY `brand`.`name`
order by `brand`.`name`