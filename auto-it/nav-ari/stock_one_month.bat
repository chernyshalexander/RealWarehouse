@ECHO OFF
REM ���� ��� �������� ������ �� �������� �� NAVISION � �������� ������ ������ �� ������ ��� � �����
SET START=20130209
SET END=20130228
FOR /L %%I IN (%START%,1,%END%) DO "C:\Program Files\Pentaho\data-integration_new\Pan.bat" -file="C:\RealWarehouse\fromNavision\populate_stock_fact.ktr" %%I %%I


