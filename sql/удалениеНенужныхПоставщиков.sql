/*----------DECLARE VARS--------------*/
SET @DELETE:=239;
SET @SAVE:=831;
/*------------------------------------*/
UPDATE accessoryb
SET supplier_id=@SAVE
  WHERE supplier_id=@DELETE;
/*------------------------------------*/
UPDATE accessorys
SET supplier_id=@SAVE
  WHERE supplier_id=@DELETE;
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

