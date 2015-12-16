@ECHO OFF
REM жхйк дкъ гюцпсгйх дюммшу он нярюрйюл хг NAVISION б опедекюу ндмнцн леяъжю он ндмнлс дмч б жхйке
SET START=20130209
SET END=20130228
FOR /L %%I IN (%START%,1,%END%) DO "C:\Program Files\Pentaho\data-integration_new\Pan.bat" -file="C:\RealWarehouse\fromNavision\populate_stock_fact.ktr" %%I %%I


