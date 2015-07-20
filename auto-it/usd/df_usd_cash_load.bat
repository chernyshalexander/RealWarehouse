@echo off
echo Loading cash data (df usd)...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\populate_cashdrawer_df_usd.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log

