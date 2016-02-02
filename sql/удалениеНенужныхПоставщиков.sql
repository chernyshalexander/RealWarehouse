/*----------DECLARE VARS--------------*/
SET @DELETE:=1163;
SET @SAVE:=1364;
/*------------------------------------*/
DELETE FROM mapsup
  WHERE mapsup.supplier_id=@DELETE;
/*------------------------------------*/
UPDATE sale
SET supplier_id=@SAVE
  WHERE supplier_id=@DELETE;
/*------------------------------------*/
UPDATE supply
SET supplier_id=@SAVE
  WHERE supplier_id=@DELETE;
/*------------------------------------*/
DELETE FROM supplier
  WHERE supplier_id=@DELETE;
/*------------------------------------*/

