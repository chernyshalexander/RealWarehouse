@echo off
cd "c:\Program Files\Pentaho\data-integration"
pan.bat /file:c:\RealWarehouse\populate_transaction_fact_eur.ktr /level:Basic >> C:\RealWarehouse\logs\trans.log


