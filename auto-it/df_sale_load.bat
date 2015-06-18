@echo off
cd "c:\Program Files\Pentaho\data-integration"
kitchen.bat /file:c:\RealWarehouse\populate_sales_df_eur_improved.kjb /level:Basic >> C:\RealWarehouse\logs\trans.log


