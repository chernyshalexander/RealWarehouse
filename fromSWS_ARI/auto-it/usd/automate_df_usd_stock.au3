
#include <Constants.au3>
#include <Date.au3>
;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
#RequireAdmin
Opt("WinTitleMatchMode",2)
Opt("WinSearchChildren",1)
Local Const $stock_batch="C:\Program Files\unisoft\sws_copy.exe /F /L:SWS_storage /U:DUTY /S:SWS-MAIN /P:SHOP /I:9"
Local Const $kettle_batch="C:\RealWarehouse\fromSWS_ARI\auto-it\usd\df_usd_stock_load.bat"
Local Const $files="C:\RealWarehouse\auto-it\"

Local Const $main_form_name="[CLASS:TFPOUTForm]"
Local Const $message_form_name="[CLASS:TMessageForm]"

Local Const $alt_currnecy_1="001"
Local Const $alt_currnecy_2="100"

Local Const $start_date="2016/02/01"
Local Const $end_date="2016/02/10"

$date_processed=$start_date

; ***************************************************
; loop through dates
; ***************************************************
Do

	if WinExists("�������� ������ �� SWS+") Then
		WinClose("�������� ������ �� SWS+")
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
	ControlCommand($MainWinHdl,"","TCheckBox2","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox3","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox4","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox5","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox6","Check","")
	ControlCommand($MainWinHdl,"","[CLASS:TValueComboBox; INSTANCE:1]","SelectString","�� ���� ��������")
	ControlSetText($MainWinHdl,"","[CLASS:TEdit; INSTANCE:1]","REPOS")

; ***************************************************
; main activity
; ***************************************************

	$tmp_str_array=StringSplit($date_processed,"/")
	$date_string=    $tmp_str_array[3] & $tmp_str_array[2] & $tmp_str_array[1]
	ControlSend($MainWinHdl,"", "TDateEdit1","{HOME}"&$date_string);

	WinMenuSelectItem($MainWinHdl,"","���������","��������� ������ � ���������")
	$info_win_hdl = WinWait($message_form_name)
	Sleep(1000)
	Send("{ENTER}")
	;WinActivate($info_win_hdl)
	;ControlSend($info_win_hdl, "", "TButton1","{ENTER}" )
	RunWait($kettle_batch)
	Sleep(1000)
	$date_processed=_DateAdd("D", 1, $date_processed)
	WinClose($MainWinHdl);
Until _DateDiff("D",   $date_processed,$end_date) < 0


; Finished!
