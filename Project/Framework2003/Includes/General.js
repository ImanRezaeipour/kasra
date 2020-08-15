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
	
	var tInnerHTML=''
	var tTitle=''
	var SelectedFld 

	var cnt=getCntChar(',',strCells)	
	var c
	for(c=0;c<cnt;c++)							
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
				tInnerHTML='<img  src="../Images/Grid/Up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'DESC':
				tInnerHTML='<img  src="../Images/Grid/down.gif">'+SelectedFld.innerText
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
				tInnerHTML='<img  src="../Images/Grid/Up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'صعودي':
				tInnerHTML='<img  src="../Images/Grid/Down.gif">'+SelectedFld.innerText
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
		var c
		for(c=0;c<fld.length;c++)							
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
						strOrderField+=document.all.item(grdName).rows(0).cells(cell).ColumnName+' ASC'
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
						strOrderField+=document.all.item(grdName).rows(0).cells(cell).ColumnName+' DESC'
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