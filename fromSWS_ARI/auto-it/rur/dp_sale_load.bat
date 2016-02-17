@echo off
echo Loading dutypaid sales data...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\fact\populate_sale_dp_rur_scd.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log


