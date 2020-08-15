dim century
century="13"
function datechk
    dim val
    val=replace(window.event.srcElement.value," ","",1,-1,1)
    if (not (val=""))and(not Isvaliddate(val)) then
 	Dim strQuestion, intReturn
	strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„   «—ÌŒ ‘„”Ì ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
	strQuestion=MsgBox(strQuestion, 0, " «—ÌŒ ‘„”Ì «‘ »«Â ")
	window.event.srcElement.focus()
	window.event.returnvalue=false
    else
      if val<>"" then
        dim arr
		arr=split(val,"/",-1,0)
		if arr(2)<100  then  
			century="13"
		else	  
			century=""
		end if
		val=right("0" & arr(1),2) & "/" & century & arr(2)
        val=right("0" & arr(0),2) & "/" & val  
        window.event.srcElement.value=val
      end if
    end if
end function
'********************
function isshleap (sal)
  dim ybase_sh,L1

      if sal<100   then  
          sal=sal+1300
      end if
      
      ybase_sh=int((sal-125)/ 99)*99+125
      
      L1=((sal-ybase_sh) mod 99)
      if (L1>=98) then
          isshleap=(((L1-89) mod 4 )=0)
      else
          if (L1 >=61) then
                  isshleap=(((L1-62) mod 4)=0)
          else 
              if L1 >=28 then
                   isshleap=(((L1-29) mod 4)=0)
              else 
                   isshleap=((L1 MOD 4)=0)
              end if
          end if
      end if

END function

'********************************************
function Isvaliddate(txt)
  dim   le,t1,t2,sal,mah,roz,arr
  
  arr=split(txt,"/",-1,0)
  if ubound(arr)=2 then
       roz=cint("0" & arr(0))
   	    mah=cint("0" & arr(1))
 		sal=cint("0" & arr(2))
        
       le=0
       if sal<100   then 
           sal=sal+1300
       end if
        
       if isshleap(sal)then 
           le=1 
       end if 
        
       t1= (mah>=1) and (mah<=12)
       t2= (roz>=1) and (roz<=29+le)
       t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
       t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

       Isvaliddate= (t1 and t2)
  else
       Isvaliddate=false
  end if
end function
'****************************

function mi2sh(Mdate)
  dim   roz 
  if  isdate(mdate) then
        roz=(mdate - #22 March 1935#)
        Mi2sh=InttoSHD(roz)
  else
        mi2sh=""
  end if
end function
'*********************
function InttoSHD(roz)
  dim   leap,Esal,sal,mahbase,tag 

        sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

        do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
        do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

        select case roz
	        case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
	        case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
	        case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
	        case else
        	  if (roz>=00000) and (roz<=10225) then
	              tag=1  :Esal=0  :base=00000 
                  end if
	
	          if (roz>=10226) and (roz<=10590) then
	               tag=2 :Esal=1  :base=10226 
                  end if

	          if (roz>=10592) and (roz<=22278) then
        	       tag=3 :Esal=1  :base=10592 
                  end if
          
	          if (roz>=22279) and (roz<=22643) then
        	       tag=4 :Esal=2  :base=22279 
                  end if

	          if (roz>=22645) and (roz<=35792) then
        	       tag=5 :Esal=2 :base=22645  
                  end if

	          if (roz>=35793) and (roz<=36157) then
        	       tag=6 :Esal=3 :base=35793  
                  end if
       end select

       if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
           roz=roz-1 :leap=1
       end if

       if tag>0 then
           roz=roz-Esal*365 
           roz=roz-int(roz / 1461)
           sal=Esal+sal+ int(roz / 365)+1314
       	   roz=roz mod 365+leap
       end if

       if roz>=186 then
           roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
       else
           mah=int(roz / 31) :roz=roz mod 31
       end if
       
       InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
end function
'*************************************************
function SHDtoInt(shd)
  dim  sal,mah,roz,Tr,arr
      
  arr=split(shd,"/",-1,1)
  if ubound(arr)=2 then
      sal=cint(arr(0)) 
      mah=cint(arr(1))-1
      roz=cint(arr(2))-1
      Tr=0
      
      if sal <100 then sal=1300+sal end if
      sal=sal-1314

      do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
      do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
      

      if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
      if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
      if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
      if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
      
      if mah>6 then
           Tr=Tr+(mah-6)*30+186
      else 
		   Tr=Tr+mah*31
	  end if

      SHDtoInt=Tr+roz
  else
     alert("«‘ﬂ«· œ—  «—ÌŒ ‘„”Ì")
     SHDtoInt=0
  end if
end function
'*******************************
function Between(date1,date2)
   between=SHDtoInt(date2)-SHDtoInt(date1)+1
end function
'*******************************
function shdAdd(Sdate,days)
   days=cint(days)
   if days<>0 then 
		shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
   else
		shdAdd=Sdate
   end if
end function
'*******************************






