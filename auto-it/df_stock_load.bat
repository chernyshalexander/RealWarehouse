@echo off
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\populate_stock_fact_df_eur.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log

