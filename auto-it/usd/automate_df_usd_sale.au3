#include <Constants.au3>
#include <Date.au3>
;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
#RequireAdmin
Opt("WinTitleMatchMode",2)
Opt("WinSearchChildren",1)
Local Const $stock_batch="C:\Program Files\unisoft\sws_copy.exe /F /L:SWS_storage /U:DUTYFREE /S:SWS-MAIN /P:SHOP /I:9"

Local Const $kettle_sale_batch="C:\RealWarehouse\auto-it\usd\df_usd_sale_load.bat"
Local Const $kettle_trans_batch="C:\RealWarehouse\auto-it\usd\df_usd_trans_load.bat"
Local Const $kettle_cash_batch="C:\RealWarehouse\auto-it\usd\df_usd_cash_load.bat"


Local Const $files="C:\RealWarehouse\auto-it\"

Local Const $main_form_name="[CLASS:TFPOUTForm]"
Local Const $message_form_name="[CLASS:TMessageForm]"

Local Const $alt_currnecy_1="003"
Local Const $alt_currnecy_2="001"

Local Const $start_date="2015/11/30"
Local Const $end_date="2015/12/06"


$date_processed=$start_date

; ***************************************************
; loop through dates
; ***************************************************
Do
	if WinExists("Выгрузка данных из SWS+") Then
		WinClose("Выгрузка данных из SWS+")
		EndIf
	Run($stock_batch)
	Sleep(1000)
	Local $MainWinHdl= WinWait($main_form_name)
	Sleep(1000)
; ***************************************************
; initialize application
; ***************************************************
	ControlSend($MainWinHdl,"", "TUserGlosMaskEdit2",$alt_currnecy_1);
	ControlSend($MainWinHdl,"", "TUserGlosMaskEdit1",$alt_currnecy_2);

	ControlCommand($MainWinHdl,"","TCheckBox1","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox2","Check","");чеки
	ControlCommand($MainWinHdl,"","TCheckBox3","Check","");продажи
	ControlCommand($MainWinHdl,"","TCheckBox4","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox5","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox6","UnCheck","")
	ControlCommand($MainWinHdl,"","[CLASS:TValueComboBox; INSTANCE:1]","SelectString","на дату поставки")
	ControlSetText($MainWinHdl,"","[CLASS:TEdit; INSTANCE:1]","REPOS")

; ***************************************************
; main activity
; ***************************************************

	$tmp_str_array=StringSplit($date_processed,"/")
	$date_string=    $tmp_str_array[3] & $tmp_str_array[2] & $tmp_str_array[1]

	ControlSend($MainWinHdl,"", "TDateEdit3","{HOME}"&$date_string);
	ControlSend($MainWinHdl,"", "TDateEdit2","{HOME}"&$date_string);

	WinMenuSelectItem($MainWinHdl,"","Выполнить","Выгрузить данные в хранилище")
	$info_win_hdl = WinWait($message_form_name)
	Sleep(1000)
	Send("{ENTER}")
	;WinActivate($info_win_hdl)
	;ControlSend($info_win_hdl, "", "TButton1","{ENTER}" )
	RunWait($kettle_sale_batch)
	Sleep(1000)
	RunWait($kettle_cash_batch)
	Sleep(1000)
	RunWait($kettle_trans_batch)
	$date_processed=_DateAdd("D", 1, $date_processed)
	WinClose($MainWinHdl);
Until _DateDiff("D",   $date_processed,$end_date) < 0


; Finished!
