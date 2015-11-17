@echo off
echo Loading dutypaid stock data...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\fact\populate_stock_fact_dp_rur.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log

