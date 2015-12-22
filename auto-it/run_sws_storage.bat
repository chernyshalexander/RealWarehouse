@ECHO OFF
::load all
cd ""C:\Program Files\unisoft\""
start "" /wait "C:\Program Files\unisoft\SWS_storage.exe" /U:DUTYPAY /S:SWS-CM1 /P:SHOP /AUTO /COM:1 /RETAIL:1 /ORD:1 /BILL:1 /REST:1 /GLOSS:1 /D_R:1 /D_OP:1 /OP_P:1
echo %errorlevel%
::

