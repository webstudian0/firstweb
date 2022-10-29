#NoEnv  
SendMode Input 
SetWorkingDir %A_ScriptDir% 
SetBatchLines,-1
Gui, Add, Edit, x6 y88 w460 h28 VURL2,https://m.cafe.naver.com/ca-fe/web/cafes/19136191/join
Gui, Add, Edit, x6 y126 w460 h28 VURL3, Cafe URL 3
Gui, Add, Edit, x6 y164 w460 h28 VURL4, Cafe URL 4
Gui, Add, Edit, x6 y203 w460 h28 VURL5, Cafe URL 5
Gui, Add, Edit, x6 y241 w460 h28 VURL6, Cafe URL 6
Gui, Add, Edit, x6 y280 w460 h28 VURL7, Cafe URL 7
Gui, Add, Edit, x6 y318 w460 h28 VURL8, Cafe URL 8
Gui, Add, Edit, x6 y356 w460 h28 VURL9, Cafe URL 9
Gui, Add, Edit, x6 y395 w460 h28 VURL10, Cafe URL 10
Gui, Add, Button, x6 y1 w412 h38 ggo , Go
Gui, Add, Edit, x428 y1 w38 h38 VURLCount,2
Gui, Add, Edit, x6 y49 w460 h28 VURL1,https://m.cafe.naver.com/ca-fe/web/cafes/14421878/join
; Generated using SmartGUI Creator for SciTE
Gui, Show, w481 h433, 자동 가입기
driver:=ComObjCreate("selenium.chromedriver")
driver.get("https://m.cafe.naver.com/")

return

GuiClose:
ExitApp
sleep,1000

return

go:
gui,submit,NoHide

loop,%URLCount%
{
gui,submit,NoHide
URLGet:=URL%A_index%
sleep,100
driver.get(URLGet)
comobjerror(0)
sleep,1000
;~ driver.executescript("document.getElementsByClassName('btn_join')[0].click()")
sleep,3000
WinActivate,ahk_exe chrome.exe
loop {

Qus=return document.getElementsByClassName('form_label')[
Qus.=A_Index
qus.="].innerHTML"

sleep,500
QusValue:=driver.executescript(Qus)
sleep,500

	if (QusValue!="")	
	{
	Quscount++	
	}
	else
	{
	break	
	}
QusValue:=""	
}
if (Quscount!="") {
	
	loop,%Quscount% {
	qusWrite=label_join_question_
	qusWrite.=A_Index
	qusWrite.=".value='안녕하세요'"
	sleep,100
	driver.executescript(qusWrite)	
	driver.executescript("label_join_nick.value='곰돌이12349'") ;;별명 처리
	
	sleep,100
	qusWrite:=""
									}
}

ControlSend,,{tab}{tab}{tab}{tab},A
sleep,50
loop,%Quscount% {
ControlSend,,{1},A
sleep,50
ControlSend,,{tab},A
}

driver.executescript("document.getElementsByClassName('ButtonBase__txt')[1].click()")
Quscount:=0
driver.get("https://m.cafe.naver.com/")
sleep,1000
}
RETURN