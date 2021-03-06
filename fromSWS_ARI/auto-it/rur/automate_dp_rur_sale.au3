#include <Constants.au3>
#include <Date.au3>
;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
#RequireAdmin
Opt("WinTitleMatchMode",2)
Opt("WinSearchChildren",1)
Local Const $stock_batch="C:\Program Files\unisoft\sws_copy.exe /F /L:SWS_storage /U:DP /S:SWS-MAIN /P:SHOP /I:9"

Local Const $kettle_sale_batch="C:\RealWarehouse\fromSWS_ARI\auto-it\rur\dp_sale_load.bat"
Local Const $kettle_trans_batch="C:\RealWarehouse\fromSWS_ARI\auto-it\rur\dp_trans_load.bat"
Local Const $kettle_cash_batch="C:\RealWarehouse\fromSWS_ARI\auto-it\rur\dp_cash_load.bat"

Local Const $files="C:\RealWarehouse\fromSWS_ARI\auto-it\"

Local Const $main_form_name="[CLASS:TFPOUTForm]"
Local Const $message_form_name="[CLASS:TMessageForm]"

Local Const $alt_currnecy_1="100"
Local Const $alt_currnecy_2="101"

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
	ControlCommand($MainWinHdl,"","TCheckBox2","Check","");����
	ControlCommand($MainWinHdl,"","TCheckBox3","Check","");�������
	ControlCommand($MainWinHdl,"","TCheckBox4","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox5","UnCheck","")
	ControlCommand($MainWinHdl,"","TCheckBox6","UnCheck","")
	ControlCommand($MainWinHdl,"","[CLASS:TValueComboBox; INSTANCE:1]","SelectString","�� ���� ��������")
	ControlSetText($MainWinHdl,"","[CLASS:TEdit; INSTANCE:1]","REPOS")

; ***************************************************
; main activity
; ***************************************************

	$tmp_str_array=StringSplit($date_processed,"/")
	$date_string=    $tmp_str_array[3] & $tmp_str_array[2] & $tmp_str_array[1]
	ControlSend($MainWinHdl,"", "TDateEdit3","{HOME}"&$date_string);
	ControlSend($MainWinHdl,"", "TDateEdit2","{HOME}"&$date_string);
	WinMenuSelectItem($MainWinHdl,"","���������","��������� ������ � ���������")
	$info_win_hdl = WinWait($message_form_name)
	;WinActivate($info_win_hdl)
	;ControlSend($info_win_hdl, "", "TButton1","{ENTER}" )
	Sleep(1000)
	Send("{ENTER}")
	RunWait($kettle_sale_batch,"",@SW_HIDE)
	Sleep(1000)
	RunWait($kettle_cash_batch,"",@SW_HIDE)
	Sleep(1000)
	RunWait($kettle_trans_batch,"",@SW_HIDE)
	$date_processed=_DateAdd("D", 1, $date_processed)
	WinClose($MainWinHdl);
Until _DateDiff("D",   $date_processed,$end_date) < 0
MsgBox(0, "���������", "�������� ������ DP ���������", 10)

; Finished!
