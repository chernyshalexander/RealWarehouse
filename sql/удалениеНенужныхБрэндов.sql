/*----------DECLARE VARS--------------*/

SET @DELETE:=1119;
SET @DELETE2:=1038;

SET @SAVE:=1098;



/*------------------------------------*/
DELETE FROM mapbrand
  WHERE mapbrand.brand_id=@DELETE;
/*------------------------------------*/
DELETE FROM mapbrand
  WHERE mapbrand.brand_id=@DELETE2;
/*------------------------------------*/

UPDATE good
SET brand_id=@SAVE
  WHERE brand_id=@DELETE;
/*------------------------------------*/
DELETE FROM brand
  WHERE brand_id=@DELETE;
/*------------------------------------*/

DELETE FROM brand
  WHERE brand_id=@DELETE2;
/*------------------------------------*/
