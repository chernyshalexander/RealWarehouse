
#include <Constants.au3>
#include <Date.au3>
;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
#RequireAdmin
Opt("WinTitleMatchMode",2)
Opt("WinSearchChildren",1)
Local Const $stock_batch="C:\RealWarehouse\auto-it\nav\stock_one_day.bat "

Local Const $start_date="2013/02/01"
Local Const $end_date="2013/08/31"




$date_processed=$start_date
ProgressOn("Stock data from NAV","","")
; ***************************************************
; loop through dates
; ***************************************************
Do

	$tmp_str_array=StringSplit($date_processed,"/")
	$date_string=  $tmp_str_array[1]  & $tmp_str_array[2] & $tmp_str_array[3]
	;$iDate=Number($date_string)
	$date_processed=_DateAdd("D", 1, $date_processed)
	$Progress=ABS( _DateDiff("D",   $date_processed,$start_date)) / ABS( _DateDiff("D",   $end_date,$start_date)) * 100

	ProgressSet(Int($Progress), "Loading... " & $date_processed & ", overall progress: " & Int($Progress) & "%" )
    Sleep(1000)
Until _DateDiff("D",   $date_processed,$end_date) < 0
    ProgressOff()

; Finished!
