/*----------DECLARE VARS--------------*/

SET @DELETE:=670;
SET @SAVE:=144;


/*------------------------------------*/
DELETE FROM mapbrand
  WHERE mapbrand.brand_id=@DELETE;
/*------------------------------------*/


UPDATE good
SET brand_id=@SAVE
  WHERE brand_id=@DELETE;
/*------------------------------------*/
DELETE FROM brand
  WHERE brand_id=@DELETE;
/*------------------------------------*/

