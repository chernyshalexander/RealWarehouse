@echo off
echo Loading dutypaid transaction data...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\fact\populate_transaction_fact_rur.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log


