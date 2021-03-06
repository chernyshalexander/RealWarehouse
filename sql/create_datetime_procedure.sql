 CREATE PROCEDURE PopulateDateDimension(BeginDate DATETIME, EndDate DATETIME)
 DETERMINISTIC
 MODIFIES SQL DATA
 BEGIN
 DECLARE DateCounter DATETIME; 
 SET DateCounter = BeginDate;
 /*SET lc_time_names = 'ru_RU';*/
 WHILE DateCounter <=EndDate DO
 INSERT INTO `dt` 
 (
  `date_id`,
  `dt`,
  `year`,
  `quarter`,
  `qname`,
  `month`,
  `mname`,
  `week`,
  `monthday`,
  `weekday`,
  `wdname`
 )
 VALUES 
 (YEAR(DateCounter) * 10000  +  MONTH(DateCounter)*100 + DAY(DateCounter),
  DateCounter,
  YEAR(DateCounter),
  QUARTER(DateCounter),
  CONCAT(CAST(YEAR(DateCounter) AS CHAR(4)),'Q',QUARTER(DateCounter)),
  MONTH(DateCounter),
  DATE_FORMAT( DateCounter,'%b'),
  WEEKOFYEAR(DateCounter),
  DAYOFMONTH(DateCounter),
  DAYOFWEEK(DateCounter),
  DAYNAME(DateCounter)  
 );
 SET DateCounter = DATE_ADD(DateCounter, INTERVAL 1 DAY);
 END WHILE;
 END;