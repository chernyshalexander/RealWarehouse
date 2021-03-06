/* update columns COMPANYSTOCK & LOCATIONSTOCK */
TRUNCATE `companystock`;
INSERT INTO companystock
(
	SELECT 
		GOOD_ID, 
		DATE_ID, 
		SUM(qty) AS LOCK_STOCK
	FROM stock
	WHERE 
		BASE_CURR=15
	AND 
		DATE_ID BETWEEN 20130701 AND 20131231
	GROUP BY GOOD_ID, DATE_ID
);
COMMIT;
TRUNCATE `locstock`;
INSERT INTO locstock
(
	SELECT 
		GOOD_ID, 
		LOC_ID,
		DATE_ID, 
		SUM(qty) AS LOCK_STOCK
	FROM stock
	WHERE 
		BASE_CURR=15
	AND 
		DATE_ID BETWEEN 20130701 AND 20131231
	GROUP BY GOOD_ID, DATE_ID
);
commit;
update sale s,
       `companystock` c
set s.company_stock = c.comp_stock_qty
where s.`good_id` = c.`mdf_good_id` and
      s.`sldate_id` = c.`mdf_date_id` and
      s.`sldate_id` BETWEEN 20130701 AND 20131231 AND
      s.`base_curr`=15;
COMMIT;
update sale s,
       `locstock` l
set s.`loc_stock` = l.`loc_stock_qty`
where s.`good_id` = l.`mdf_good_id` and
      s.`sldate_id` = l.`mdf_date_id` and
      s.`loc_id`=l.`mdf_loc_id` and
      s.`sldate_id` BETWEEN 20130701 AND 20131231 AND
      s.`base_curr`=15;
COMMIT;

