@echo off
echo Loading dutypaid stock data...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_stock_fact_dp_rur.ktr /level:Error >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log

