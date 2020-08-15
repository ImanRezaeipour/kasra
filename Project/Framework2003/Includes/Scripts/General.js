//تعداد يک رشته خاص در يک رشته را برميگرداند
function getCntChar(subStr1,Str1)
{
	var Str=new String					
	Str=Str1+''
	if (Str1=='')
		return(0)

	var subStr=new String		 
	subStr=subStr1+''
	if (subStr1=='')
		return(0)
		
	var cnt
	cnt=0
	for(j=0;j<Str.length;++j)
		if(Str.substring(j,j+subStr.length)==subStr)
				cnt+=1
	return(cnt)
}
////////////////////////////////////////////////////////////////////////////////
//
function getArray(Str,Index,sep)
{
	var j
	var i
	i=0
	var items=new String
	items=Str
	var p=new String
	if (items!="")
	{
		j=items.search(sep)	
		while(j<=items.length && i<=Index)	
		{
			p=items.substring(0,j)
			if (j<0) p=items.substring(0,items.length)
			j=j+1
			items=items.substring(j,items.length)
			j=items.search(sep)	
			if (j<0) j=items.length+1
			i=i+1
		}
	}
	i=i-1
	if (i==Index)
		return(p.substring(0,p.length))
	else
		return('')
}

////////////////////////////////////////////////////////////////////////////////
//فقط اجازه ورود عدد صحيح و اعشاري را با توجه به پارامترهاي ورودي به کاربر ميدهد.
function OnKeyDownNum(TypeNum,number)
{
	var key=window.event.keyCode
	if (TypeNum=='double')
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1)
			)
	}
	if (TypeNum=='integer')
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) 
			)
	}
	
}
//////////////////////////////////
function OnKeyDownInt(number)
{
	var key=window.event.keyCode
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) 
		)
}
//////////////////////////////////
function OnKeyDownFloat(number)
{
	var key=window.event.keyCode
	window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1)
			)
}
//////////////////////////////////
function OnKeyDownTime(number)
{
	var key=window.event.keyCode
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) ||
			(key==186)
			
		)
}
//////////////////////////////////
function OnKeyDownDate(number)
{
	var key=window.event.keyCode
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) ||
			(key==191)||(key==111)
		)
}
////////////////////////////////////////////////////////////////////////////////
//اين تابع با کليدهاي حرکتي بالا و پايين بين ستوني که از کاربر دريافت ميشود، حرکت ميکند.
//اين تابع با کليدهاي حرکتي چپ و راست به ستوني که از کاربر دريافت ميشود، حرکت ميکند.
function onkeydownMoveByArrowKey(SelectedCell,cell,rcell,lCell)
{
	var oGrid
	oGrid=SelectedCell.parentElement.parentElement.parentElement.parentElement
	
	var oRow
	oRow=SelectedCell.parentElement.parentElement
	
	var key=window.event.keyCode
	if (key==40)//down
	{
		if (oRow.rowIndex<oGrid.rows.length-1)
			oGrid.rows(oRow.rowIndex+1).cells(cell).firstChild.focus()
		return
	}
	if (key==38)//up
	{
		if (oRow.rowIndex>0)
			oGrid.rows(oRow.rowIndex-1).cells(cell).firstChild.focus()
		return
	}
	if (key==39)//left
	{
		oGrid.rows(oRow.rowIndex).cells(lCell).firstChild.focus()
		return
	}
	if (key==37)//right
	{
		oGrid.rows(oRow.rowIndex).cells(rcell).firstChild.focus()
		return
	}
}
///////////////////////////////////////////////////////////////
function ReplaceAll(str,char1,replaceChar)
{
	var x=getCntChar(char1,str)
	var s=new String()
	s=str
	while(x>0)
	{
		s=s.replace(char1,replaceChar)
		x--
	}
	return(s)
}
///////////////////////////////////////////////////////////////////////
//Functions_Sorting 850129
///////////////////////////////////////////////////////////////////////
function onclickBodyForSort(url,grdName)
{
	var returnValue=onclickGrdHeaderForSort(grdName)
	if(returnValue!='0')
	{
		returnValue=returnValue+"&TypeSumbit=sort"
		Form1.action=url+"?"+returnValue
		Form1.submit()
	}
}
/////////////////////////////////////////////////////////////////////////////////
function onLoadGrdHeaderForSort(grdName,strCells,strType)
{
	if(grdName=='')
		return
	var cell=0
	var obj=grdName+'_Header'
	var fld=document.all.item(obj).rows(0).all
	
	var tInnerHTML
	var tTitle
	var SelectedFld 

	var cnt=getCntChar(',',strCells)	
	for(var c=0;c<cnt;c++)							
	{
		
		if(getArray(strCells,c,',')=='')
			break
		SelectedFld=fld.item(parseInt(getArray(strCells,c,',')))				
		switch(getArray(strType,c,','))
		{
			case '':
				tInnerHTML=SelectedFld.innerText
				tTitle=''
				break
			case 'ASC':
				tInnerHTML='<img  src="../../Images/Grid/up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'DESC':
				tInnerHTML='<img  src="../../Images/Grid/down.gif">'+SelectedFld.innerText
				tTitle='نزولي'
				break
		}
		SelectedFld.innerHTML=tInnerHTML
		SelectedFld.title=tTitle
	}
}
/////////////////////////////////////////////////////////////////////////////////
function onclickGrdHeaderForSort(grdName)
{
	
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName+'_Header')
	{
		
		var tInnerHTML
		var tTitle
		var SelectedFld = window.event.srcElement
		switch(SelectedFld.title)
		{
			case '':
				tInnerHTML='<img  src="../../Images/Grid/up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'صعودي':
				tInnerHTML='<img  src="../../Images/Grid/down.gif">'+SelectedFld.innerText
				tTitle='نزولي'
				break
			case 'نزولي':
				tInnerHTML=''+SelectedFld.innerText
				tTitle=''
				break
		}
		SelectedFld.innerHTML=tInnerHTML
		SelectedFld.title=tTitle
		
		var fld=SelectedFld.parentElement.all
		var strOrderField=''
		var strCells=''
		var strType=''
						
		var cell=0
		for(var c=0;c<fld.length;c++)							
		{
			if(fld.item(c).tagName=='TD')
			{
				switch(fld.item(c).title)
				{
					case '':
						break
					case 'صعودي':
						if(strOrderField!='')
						{
							strOrderField+=','
							strCells+=','
							strType+=','
						}
						strCells+=c
						strType+='ASC'
						strOrderField+=grdPerson.rows(0).cells(cell).ColumnName+' ASC'
						break
					case 'نزولي':
						if(strOrderField!='')
						{
							strOrderField+=','
							strCells+=','
							strType+=','
						}
						strCells+=c
						strType+='DESC'
						strOrderField+=grdPerson.rows(0).cells(cell).ColumnName+' DESC'
						break
				}
				cell++
			}
		}
		if(strOrderField!='')
		{
			strCells+=','
			strType+=','
		}
		return("grdName="+grdName+"&strOrderField="+strOrderField+"&strCells="+strCells+"&strType="+strType)				
	}
	else
		return('0')
}
///////////////////////////////////////////////////////////////////////
//Functions_Filtering 850223
///////////////////////////////////////////////////////////////////////
function onLoadGrdHeaderForFilter(grdName,GroupDocId)
{
	if(grdName=='')
		return
	var obj=grdName+'_Header'
	var SelectedFld=document.all.item(obj).rows(0).all.item(0)			
	
	SelectedFld.innerHTML='<img runat="server" src="../../Images/Grid/dblup.gif" onclick="onclickImgFilter(this,'+GroupDocId+')">'+SelectedFld.innerText
	if(document.all.item('StrFilter').value=='')
		SelectedFld.title='فيلتر'
	else
		SelectedFld.title=document.all.item('StrTitleFilter').value
}
////////////////////////////////////////////////////////////////////////////////////////////////
function onclickImgFilter(obj,GroupDocId,ProjName)
{
	var url
	url='/'+ProjName+'/Pages/Filter/grdFilter.aspx?GroupDocId='+GroupDocId
	var StrReturn=new String()
	StrReturn=window.showModalDialog(url,"","dialogWidth:600px;dialogHeight:400px;center: Yes;help: no;status:no")
	
	if(StrReturn=='0')
		return
	var StrFilter=StrReturn.substring(0,StrReturn.search('#'))
	var StrTitleFilter=StrReturn.substring(StrReturn.search('#')+1,StrReturn.length)
	
	obj.title=StrTitleFilter
	document.all.item('StrFilter').value=StrFilter
	document.all.item('StrTitleFilter').value=StrTitleFilter
	document.all.item('TypeSubmit').value='filter'
	Form1.submit()

}
////__________________________________________________________________________________
function Timechk(obj)
{
	var val=""
	val=ReplaceAll(obj.value," ","")
	
	
	if (( val!="") && (IsvalidTime(val)==false))
	{
 		var strQuestion;
 		var intReturn;
 		
		strQuestion="  ! لطفا دراين قسمت ساعت صحيح وارد كنيد"
		strQuestion=alert(strQuestion, 0, "ساعت اشتباه ")
		obj.focus()
		return;
		
	}
	else if ((val!="") && (IsvalidTime(val)==true))
	{
		var arr
		if (getCntChar(':',val)==0)
		{
			arr=val
			if (arr.length==1)
				arr="0"+arr+":00"
			else if (arr.length==2)
				arr=arr+":00"
			else if (arr.length==4)
				arr=arr.substr(0,2)+":"+arr.substr(2,2)
		val=arr
		}
		else
		{
			arr=val.split(":")
			var str1=arr[0]
			var str2=arr[1]
			if (str1.length==0)
				str1="00"
			else if (str1.length==1)
				str1="0"+str1
			if (str2.length==0)
				str2="00"
			else if (str2.length==1)
				str2="0"+str2
		val=str1+":"+str2
		
		}
		obj.value=val
		
	}
}
//********************************************
function IsvalidTime(txt)
{
	var t1;
	var t2;
	var Hour;
	var Min;
	var arr
	var H;
	var M;
	//************
	if (getCntChar(':',txt)>1)
		return(false)
	//*************	
		
	else if (getCntChar(':',txt)==0)
	{
		if (txt.length==2)
		{
			if (txt>24)
			{
				return(false)
			}
			else
			{
				return(true)
			}
		}
		
		if(txt.length==4)
		{
			H=txt.substr(0,2)
			M=txt.substr(2,2)
			
			if (H>24 || M>60)
			{
				return(false)
			}
			else
			{
				return(true)
			}
		}
		if (txt.length==1 || txt.length==2)
		{
			return(true)
		}
		else if (txt.length>2)
		{
			return(false)
		}
		//************
		if (txt.length>2)
			return (false)
		//***************
	}
	else
	{
		arr=txt.split(":")
		
		Hour=parseInt(arr[0])
   		Min=parseInt(arr[1])
				
		if (Hour>24 || Min>60)
		{
			return(false)
		}
		else
		{
			return(true)
		}
	}
}
////__________________________________________________________________________
