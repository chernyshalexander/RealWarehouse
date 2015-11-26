/*----------DECLARE VARS--------------*/

SET @DELETE:=558;
SET @DELETE2:=558;

SET @SAVE:=1128;



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
