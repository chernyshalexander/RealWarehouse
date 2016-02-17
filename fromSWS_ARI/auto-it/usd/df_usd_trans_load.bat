@echo off
ECHO Loading transaction data (df usd)...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_transaction_fact_usd.ktr /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log


