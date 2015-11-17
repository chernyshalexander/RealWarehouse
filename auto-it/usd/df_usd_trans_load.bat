@echo off
ECHO Loading transaction data (df usd)...
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\fact\populate_transaction_fact_usd.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log


