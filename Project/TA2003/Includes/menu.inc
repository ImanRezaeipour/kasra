	dim Menu,btnSave,btnDel,btnrefresh
	set Menu = parent.document.all("topmenu")
	menu.onfocus()	
	
	sub MenuBtnShow (Btn,display,Disabled)
		dim disp
		
		disp=""
		if not display then disp="none"
		
		btn=lcase(btn)
		btn=replace(btn,"save","BtnSave")
		btn=replace(btn,"new","BtnNew")
		btn=replace(btn,"delete","BtnDel")
		btn=replace(btn,"del","BtnDel")
		btn=replace(btn,"back","BtnBack")
		btn=replace(btn,"next","Btnnext")
		btn=replace(btn,"home","BtnExit")
		btn=replace(btn,"exit","BtnExit")
		btn=replace(btn,"ref","BtnRefresh")
		btn=replace(btn,"refresh","BtnRefresh")
		btn=replace(btn,"search","Btnsearch")
		btn=replace(btn,"menu","BtnMenu")
		btn=replace(btn,"help","BtnHelp")
		
		if btn<>"" then 
			if typename(Menu.all(btn))<>"Nothing" then
				menu.all(btn).style.display=disp
				menu.all(btn).disabled=disabled
				parent.redraw.innerHTML="."
				parent.redraw.innerHTML=""
			end if
		end if
	end sub
'------------------------
	function MenuOnClick
	dim Src
		Src=ExtMenuClick.EventSrc
		on error resume next
		menuClick(Src)
	end function
'-------------------------
	sub setSearchPageURL(URL)
		parent.tdright.href=URL
	end sub
'-------------------------
	function IsRightMenuDisplied ()
		RightMenuDisplay=(parent.TBlright.style.display="")and _
						 (parent.tdright.doc=1)
	end function
'-------------------------
	sub RefreshSearchPage()
		if not IsRightMenuDisplied and _
		 (parent.TBlright.style.display="") then
			MenuClick "btnSearch"
			parent.frames("Right").window.location.href=parent.tdright.href
			parent.tdright.doc=0
		end if
	end sub
'--------------------------------

sub F1keyPress
	if window.event.altKey  and  window.event.keyCode = 112 then 
		window.event.returnValue=false 
		parent.btnhelp.click
	end if
end sub
'--------------------------------

	document.write _
	"<a style='display:none' id=ExtMenuClick EventSrc='' onclick='MenuOnclick()' onfocus=''></a>"
