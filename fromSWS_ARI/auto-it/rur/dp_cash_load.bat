@echo off
echo loading cash dp data ...
cd "c:\Program Files\Pentaho\data-integration_new"
pan.bat /file:c:\RealWarehouse\fromSWS_ARI\fact\populate_cashdrawer_dp_rur.ktr /level:Basic >> C:\RealWarehouse\fromSWS_ARI\logs\trans.log

