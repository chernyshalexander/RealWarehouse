@echo off
echo Loading sale data (df usd) ...
cd "c:\Program Files\Pentaho\data-integration_new"
kitchen.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_sales_df_usd_improved.kjb /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log


