@echo off
ECHO Loading stock data (df usd)...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_stock_fact_df_usd_scd.ktr /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log

