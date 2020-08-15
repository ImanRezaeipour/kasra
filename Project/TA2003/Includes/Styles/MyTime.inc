'*******************************time
function Timechk
    dim val
    val=replace(window.event.srcElement.value," ","",1,-1,1)
    if (not (val=""))and(not IsvalidTime(val)) then
 	Dim strQuestion, intReturn
	strQuestion="  ! لطفا دراين قسمت ساعت صحيح وارد كنيد"
	strQuestion=MsgBox(strQuestion, 0, "ساعت اشتباه ")
	window.event.srcElement.focus()
	window.event.returnvalue=false
    else
      if val<>"" then
        dim arr
		arr=split(val,":",-1,0)
        val=""
        val=right("0" & arr(0),2) & ":" & right("0" & arr(1),2) 
        window.event.srcElement.value=val
      end if
    end if
end function
'********************************************
function IsvalidTime(txt)
	dim   t1,t2,Hour,Min,arr
	
	arr=split(txt,":",-1,0)
	
	if ubound(arr)=1 then
			Hour=cint("0" & arr(0))
   			Min=cint("0" & arr(1))
	        
	        
		 t1= (Hour>=0) and (Hour<=23)
		 t2= (Min>=0) and (Min<=59)
	     
		IsvalidTime= (t1 and t2)
	else
		IsvalidTime=false
	end if
end function

