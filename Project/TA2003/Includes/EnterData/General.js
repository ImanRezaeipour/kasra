////////////////////////////////////////////////////////////////////////////////
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
