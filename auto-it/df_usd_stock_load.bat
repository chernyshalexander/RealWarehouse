@echo off
ECHO Loading stock data (df usd)...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\populate_stock_fact_df_usd.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log

