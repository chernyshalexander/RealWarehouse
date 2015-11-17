/*----------DECLARE VARS--------------*/
SET @DELETE:=181;
SET @SAVE:=740;
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

