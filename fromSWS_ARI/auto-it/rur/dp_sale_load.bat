@echo off
echo Loading dutypaid sales data...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_sale_dp_rur_scd.ktr /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log


