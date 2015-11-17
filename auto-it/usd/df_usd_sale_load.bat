@echo off
echo Loading sale data (df usd) ...
cd "c:\Program Files\Pentaho\data-integration"
kitchen.bat /file:c:\RealWarehouse\fact\populate_sales_df_usd_improved.kjb /level:Basic >> C:\RealWarehouse\logs\trans.log


