@echo off
echo Loading dutypaid transaction data...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_transaction_fact_rur.ktr /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log


