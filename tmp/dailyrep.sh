#!/bin/bash
curl --user "analyst:analyst" http://localhost:8080/pentaho/plugin/saiku/api/admin/discover/refresh
curl --user "analyst:analyst" http://localhost:8080/pentaho/plugin/saiku/api/public/export/saiku/xls?file=/home/analyst/SalesByDepLocationMonthly.saiku --o "/export/home/data/dailyrep/report.xls"
cd /opt/pentaho/data-integration
./kitchen.sh -file=/export/home/data/dailyrep/mail_rep.kjb
curl http://localhost:8080/pentaho/Logout
exit 0

 http://localhost:8080/pentaho/Logout