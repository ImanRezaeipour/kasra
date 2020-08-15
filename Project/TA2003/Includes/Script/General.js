function getCntChar(subStr1,Str1){
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
	return(cnt)}
function getArray(Str,Index,sep){
	var j
	var i
	i=0
	var items=new String
	items=Str
	var p=new String
	if (items!=""){
		j=items.search(sep)	
		while(j<=items.length && i<=Index){
			p=items.substring(0,j)
			if (j<0) p=items.substring(0,items.length)
			j=j+1
			items=items.substring(j,items.length)
			j=items.search(sep)	
			if (j<0) j=items.length+1
			i=i+1}}
	i=i-1
	if (i==Index)
		return(p.substring(0,p.length))
	else
		return('')}
function OnKeyDownNum(TypeNum,number){
	var key=window.event.keyCode
	if (TypeNum=='double'){
		window.event.returnValue=(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1))}
	if (TypeNum=='integer'){
		window.event.returnValue=(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)))}}
function OnKeyDownInt(number){
	var key=window.event.keyCode
	window.event.returnValue=(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)))}
function OnKeyDownFloat(number){
	var key=window.event.keyCode
	window.event.returnValue=(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1))}
function OnKeyDownTime(number){
	var key=window.event.keyCode
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) ||
			(key==186))}
function OnKeyDownDate(number){
	var key=window.event.keyCode
	window.event.returnValue=(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) ||
			(key==191)||(key==111))}
function onkeydownMoveByArrowKey(SelectedCell,cell,rcell,lCell){
	var oGrid
	oGrid=SelectedCell.parentElement.parentElement.parentElement.parentElement	
	var oRow
	oRow=SelectedCell.parentElement.parentElement	
	var key=window.event.keyCode
	if (key==40){
		if (oRow.rowIndex<oGrid.rows.length-1)
			oGrid.rows(oRow.rowIndex+1).cells(cell).firstChild.focus()
		return}
	if (key==38){
		if (oRow.rowIndex>0)
			oGrid.rows(oRow.rowIndex-1).cells(cell).firstChild.focus()
		return	}
	if (key==39){
		oGrid.rows(oRow.rowIndex).cells(lCell).firstChild.focus()
		return}
	if (key==37){
		oGrid.rows(oRow.rowIndex).cells(rcell).firstChild.focus()
		return}}
function ReplaceAll(str,char1,replaceChar){
	var x=getCntChar(char1,str)
	var s=new String()
	s=str
	while(x>0){
		s=s.replace(char1,replaceChar)
		x--}
	return(s)}
function onclickBodyForSort(url,grdName){
	var returnValue=onclickGrdHeaderForSort(grdName)
	if(returnValue!='0'){
		document.all.item("txtSubmit").value="sort"
		returnValue=returnValue+"&TypeSumbit=sort"
		Form1.action=url+"?"+returnValue
		Form1.submit()}}
function onLoadGrdHeaderForSort(grdName,strCells,strType){
	if(grdName=='')
		return
	var cell=0
	var obj=grdName+'_Header'
	var fld=document.all.item(obj).rows(0).all	
	var tInnerHTML
	var tTitle
	var SelectedFld 
	var cnt=getCntChar(',',strCells)	
	for(var c=0;c<cnt;c++){		
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
				tInnerHTML='<img  src="/TA/Includes/Images/Grid/Up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'DESC':
				tInnerHTML='<img  src="/TA/Includes/Images/Grid/Down.gif">'+SelectedFld.innerText
				tTitle='نزولي'
				break}
		SelectedFld.innerHTML=tInnerHTML
		SelectedFld.title=tTitle}}
function onclickGrdHeaderForSort(grdName){
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName.id+'_Header'){		
		var tInnerHTML
		var tTitle
		var SelectedFld = window.event.srcElement
		switch(SelectedFld.title)
		{
			case '':
				tInnerHTML='<img  src="/TA/Includes/Images/Grid/Up.gif">'+SelectedFld.innerText
				tTitle='صعودي'
				break
			case 'صعودي':
				tInnerHTML='<img  src="/TA/Includes/Images/Grid/Down.gif">'+SelectedFld.innerText
				tTitle='نزولي'
				break
			case 'نزولي':
				tInnerHTML=''+SelectedFld.innerText
				tTitle=''
				break}
		SelectedFld.innerHTML=tInnerHTML
		SelectedFld.title=tTitle		
		var fld=SelectedFld.parentElement.all
		var strOrderField=''
		var strCells=''
		var strType=''						
		var cell=0
		for(var c=0;c<fld.length;c++){
			if(fld.item(c).tagName=='TD'){
				switch(fld.item(c).title)
				{
					case '':
						break
					case 'صعودي':
						if(strOrderField!=''){
							strOrderField+=','
							strCells+=','
							strType+=','}
						strCells+=c
						strType+='ASC'
						//alert(grdName.rows(0).cells(cell).ColumnName)
						strOrderField+=grdName.rows(0).cells(cell).ColumnName+' ASC'
						break
					case 'نزولي':
						if(strOrderField!=''){
							strOrderField+=','
							strCells+=','
							strType+=','}
						strCells+=c
						strType+='DESC'
						strOrderField+=grdName.rows(0).cells(cell).ColumnName+' DESC'
						break}
				cell++}}
		if(strOrderField!=''){
			strCells+=','
			strType+=','}
		return("grdName="+grdName.id+"&strOrderField="+strOrderField+"&strCells="+strCells+"&strType="+strType)}
	else
		return('0')}
function onLoadGrdHeaderForFilter(grdName,GroupDocId){
	if(grdName=='')
		return
	var obj=grdName+'_Header'
	var SelectedFld=document.all.item(obj).rows(0).all.item(0)
	SelectedFld.innerHTML='<img runat="server" src="../../Images/Grid/dblup.gif" onclick="onclickImgFilter(this,'+GroupDocId+')">'+SelectedFld.innerText
	if(document.all.item('StrFilter').value=='')
		SelectedFld.title='فيلتر'
	else
		SelectedFld.title=document.all.item('StrTitleFilter').value}
function onclickImgFilter(obj,GroupDocId,ProjName){
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
	Form1.submit()}
function Timechk(obj){
	var val=""
	val=ReplaceAll(obj.value," ","")	
	var negativeFlag=val.substr(0,1)	
	if (negativeFlag=="-")
		val=val.substr(1,val.length)	
	if (( val!="") && (IsvalidTime(val)==false)){
 		var strQuestion;
 		var intReturn; 		
		strQuestion="  ! لطفا دراين قسمت ساعت صحيح وارد كنيد"
		strQuestion=alert(strQuestion, 0, "ساعت اشتباه ")
		obj.focus()
		return;}
	else if ((val!="") && (IsvalidTime(val)==true)){
		var arr
		if (getCntChar(':',val)==0){
			arr=val
			if (arr.length==1)
				arr="0"+arr+":00"
			else if (arr.length==2)
				arr=arr+":00"
			else if (arr.length==4)
				arr=arr.substr(0,2)+":"+arr.substr(2,2)
		val=arr}
		else{
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
		val=str1+":"+str2}		
		if (negativeFlag=="-")
			obj.value="-"+val
		else
			obj.value=val}}
function Timechk1(obj){
	var val=""
	val=ReplaceAll(obj.value," ","")
	if (( val!="") && (IsvalidTime(val)==false)){
 		var strQuestion;
 		var intReturn; 		
		strQuestion="  ! لطفا دراين قسمت ساعت صحيح وارد كنيد"
		strQuestion=alert(strQuestion, 0, "ساعت اشتباه ")
		obj.focus()}
	if ((val!="") && (IsvalidTime(val)==true)){
		var arr
		arr=val.split(":")		
		var str1=arr[0]
		var str2;
		if (str1.length==1){
			str1="0"+str1}
		if (getCntChar(':',val)==0){
			str2=""
			var tmpS='';
			tmpS=str1.substr(2,2)
			if (tmpS==""){
				tmpS="00"}
			val=str1.substr(0,2)+":"+tmpS}
		else{
			str2=arr[1]
			if (str2.length==1){
				str2="0"+str2}
			if (str2==""){
				val=str1.substr(0,2)+":00"}
			else{
				val=str1.substr(0,2)+":"+str2.substr(0,2)}} 
		obj.value=val}}			
function IsvalidTime(txt){
	var t1;
	var t2;
	var Hour;
	var Min;
	var arr
	var H;
	var M;
	if (getCntChar(':',txt)>1)
		return(false)
	else if (getCntChar(':',txt)==0){
		if (txt.length==2){
			if (txt>24){
				return(false)}
			else{
				return(true)}}
		if(txt.length==4){
			H=txt.substr(0,2)
			M=txt.substr(2,2)			
			if (H>24 || M>60){
				return(false)}
			else{
				return(true)}}
		if (txt.length==1 || txt.length==2){
			return(true)}
		else if (txt.length>2){
			return(false)}
		if (txt.length>2)
			return (false)}
	else{
		arr=txt.split(":")		
		Hour=parseInt(arr[0])
   		Min=parseInt(arr[1])				
		if (Hour>24 && Min>60){
			return(false)}
		else{
			return(true)}}}
function checkOnGrid(){
	var obj=window.event.srcElement
	for (o=0;o<3;o++){
		obj=obj.parentElement
		if (obj==null)
			return true;}}
function findSelectedcellNumber(grdName){
	var grdNameHeader=document.all.item(grdName.id+'_Header')
	var SelectedFld = window.event.srcElement
	var fld=SelectedFld.parentElement.all
	//---شماره ستون-----
	for(var c=0;c<fld.length;c++)
		if (grdNameHeader.rows(0).cells(c).innerHTML==SelectedFld.innerHTML)
			return c;}
function findmaxwidth(grdName,SelectedcellNumber,maxtitle){
	var grdNameHeader=document.all.item(grdName.id+'_Header')
	var ll=grdName.rows.length
	var maxwidth=0
	var oDiv=document.createElement("DIV");
	document.body.appendChild(oDiv);
	oDiv.style.width=0
	var lll=maxtitle.length
	oDiv.innerText=maxtitle.substr(0,lll/10)
	maxwidth=oDiv.offsetWidth
	maxwidth=maxwidth*10	
	var elseWidth=maxwidth
	var curwidth=grdNameHeader.rows(0).cells(SelectedcellNumber).offsetWidth
	var tafavotWidth=maxwidth-curwidth
	maxwidth=maxwidth/curwidth
	document.body.removeChild(oDiv)
	lastwidthgrdHeaderitem=grdNameHeader.rows(0).cells(SelectedcellNumber).style.width
	lastwidthgrditem=grdName.rows(0).cells(SelectedcellNumber).style.width
	lastwidthgrdHeader=grdNameHeader.style.width
	lastwidthgrd=grdName.style.width
	if (tafavotWidth>0){
		grdNameHeader.style.width=(parseInt(grdNameHeader.offsetWidth)+parseInt(tafavotWidth))+'px'
		grdName.style.width=(parseInt(grdName.offsetWidth)+parseInt(tafavotWidth))+'px'}
	if(maxwidth>1){
		var endwidth=""
		var pasvand=""
		var str=""
		if (grdNameHeader.rows(0).cells(SelectedcellNumber).style.width!="")
			str = grdNameHeader.rows(0).cells(SelectedcellNumber).style.width; 
		else
			str = grdNameHeader.rows(0).cells(SelectedcellNumber).width; 		
		for(t=0;t<str.length;t++){
			if((str.charCodeAt(t)>=48)&&(str.charCodeAt(t)<=57))
				endwidth=endwidth + str.substr(t,1)
			else
				pasvand=pasvand + str.substr(t,1)}
		if ((parseInt(endwidth)*maxwidth)!=0)
			elseWidth=(parseInt(endwidth)*maxwidth)+pasvand
		grdNameHeader.rows(0).cells(SelectedcellNumber).style.width=elseWidth
		for(i=0;i<ll;i++){
			grdName.rows(i).cells(SelectedcellNumber).style.width=elseWidth}}
	return maxwidth;}
function Kind1121(grdName,SelectedcellNumber){
	var ll=grdName.rows.length
	lastSelectedcellNumber=SelectedcellNumber
	var maxtitle="";
	var maxtitlelength=0
	for(i=0;i<ll;i++){
		if(grdName.rows(i).cells(SelectedcellNumber).title.length>maxtitlelength){
			maxtitlelength=grdName.rows(i).cells(SelectedcellNumber).title.length
			maxtitle=grdName.rows(i).cells(SelectedcellNumber).title}}
	var maxwidth=findmaxwidth(grdName,SelectedcellNumber,maxtitle)
	var lastInnerText=""
	for(i=0;i<ll;i++)
	{
		if(grdName.rows(i).cells(SelectedcellNumber).title!="")
		{
			lastInnerText=grdName.rows(i).cells(SelectedcellNumber).innerText
			grdName.rows(i).cells(SelectedcellNumber).innerText=grdName.rows(i).cells(SelectedcellNumber).title
			grdName.rows(i).cells(SelectedcellNumber).title=lastInnerText
		}
	}
	Kind=1121//----فيلد معمولي بدون firstChild
	grdName.parentElement.style.overflow=""
}
/****************************************************************/
function Kind1122(grdName,SelectedcellNumber)
{
	var ll=grdName.rows.length
	lastSelectedcellNumber=SelectedcellNumber
	var maxtitle="";
	var maxtitlelength=0
	//---پيدا کردن بزرگترين title
	for(i=0;i<ll;i++)
	{
		if(grdName.rows(i).cells(SelectedcellNumber).firstChild.title.length>maxtitlelength)
		{
			maxtitlelength=grdName.rows(i).cells(SelectedcellNumber).firstChild.title.length
			maxtitle=grdName.rows(i).cells(SelectedcellNumber).firstChild.title
		}
	}
	var maxwidth=findmaxwidth(grdName,SelectedcellNumber,maxtitle)
	//---set Title and Text
	var lasttitle=""
	for(i=0;i<ll;i++)
	{
		if(grdName.rows(i).cells(SelectedcellNumber).firstChild.title!="")
		{
			grdName.rows(i).cells(SelectedcellNumber).innerHTML="<DIV align='right' title='"+grdName.rows(i).cells(SelectedcellNumber).innerHTML+"'>"+grdName.rows(i).cells(SelectedcellNumber).firstChild.title+'</DIV>'
			grdName.rows(i).cells(SelectedcellNumber).firstChild.style.width="100%"//grdName.rows(i).cells(SelectedcellNumber).style.width
		}
	}
	Kind=1122//----فيلد با firstChild => DIV
	grdName.parentElement.style.overflow=""
}
/****************************************************************/
function onmouseoverClientGrd(grdName)
{

	if (checkOnGrid())	
		return;
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName.id+'_Header')//1
	{
		var ll=grdName.rows.length
		if (ll>0)//1-1
		{
			var grdNameHeader=document.all.item(grdName.id+'_Header')
			var SelectedcellNumber=findSelectedcellNumber(grdName)//1-1-1
			if (grdName.rows(0).cells(SelectedcellNumber).title!=null)//1-1-2
			{
				if(grdName.rows(0).cells(SelectedcellNumber).firstChild==null)
					return;
				if(grdName.rows(0).cells(SelectedcellNumber).firstChild.tagName==null)//1-1-2-1
				{
					Kind1121(grdName,SelectedcellNumber)
				}//1-1-2-1
				else if(grdName.rows(0).cells(SelectedcellNumber).firstChild.tagName=="DIV")//1-1-2-2
				{
					Kind1122(grdName,SelectedcellNumber)
				}//1-1-2-2
			}//1-1-2
		}//1-1
	}//1

}
/****************************************************************/
function onmouseoutClientGrd(grdName)
{
try{
	if (checkOnGrid())	
		return;
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName.id+'_Header')
	{
		var ll=grdName.rows.length
		if (ll>0)
		{
			if (lastSelectedcellNumber!=-1)
			{
				var grdNameHeader=document.all.item(grdName.id+'_Header')
				grdNameHeader.style.width=lastwidthgrdHeader
				grdName.style.width=lastwidthgrd
				grdNameHeader.rows(0).cells(lastSelectedcellNumber).style.width=lastwidthgrdHeaderitem
				var lastInnerText=""
				switch (Kind)
				{
					case 1121:
						for(i=0;i<ll;i++)
						{
							if (grdName.rows(i).cells(lastSelectedcellNumber).title!="")
							{
								lastInnerText=grdName.rows(i).cells(lastSelectedcellNumber).innerText
								grdName.rows(i).cells(lastSelectedcellNumber).innerText=grdName.rows(i).cells(lastSelectedcellNumber).title
								grdName.rows(i).cells(lastSelectedcellNumber).title=lastInnerText
								grdName.rows(i).cells(lastSelectedcellNumber).style.width=lastwidthgrditem
							}
						}
						break;
					case 1122:
						for(i=0;i<ll;i++)
						{
							if (grdName.rows(i).cells(lastSelectedcellNumber).firstChild.title!="")
							{
								grdName.rows(i).cells(lastSelectedcellNumber).innerHTML=grdName.rows(i).cells(lastSelectedcellNumber).firstChild.title
								grdName.rows(i).cells(lastSelectedcellNumber).style.width=lastwidthgrditem
							}
						}
						break;
				}
				lastwidthgrditem=""
				Kind=0
				lastSelectedcellNumber=-1
				grdName.parentElement.style.overflow="auto" 
			}
		}
	}
}
catch(e)
{}
}
/**************************************************************/
//Written by N.y------------------------------------
function onmouseoutBody(grdName)
{
try{
	if (checkOnGrid())	
		return;
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName.id+'_Header')
	{
		
		var ll=grdName.rows.length
		if (ll>0)
		{
			if ((lastSelectedcellNumber!=-1))
			{
				var grdNameHeader=document.all.item(grdName.id+'_Header')
				grdNameHeader.style.width=lastwidthgrdHeader
				grdName.style.width=lastwidthgrd
				grdNameHeader.rows(0).cells(lastSelectedcellNumber).style.width=lastwidthgrdHeaderitem
				for(i=0;i<ll;i++)
				{
					if (grdName.rows(i).cells(lastSelectedcellNumber).firstChild.title!="")
					{
						grdName.rows(i).cells(lastSelectedcellNumber).innerHTML=grdName.rows(i).cells(lastSelectedcellNumber).firstChild.title
						
					}
					grdName.rows(i).cells(lastSelectedcellNumber).style.width=lastwidthgrditem
				}
				lastSelectedcellNumber=-1
				lastwidthgrditem=""
				grdName.parentElement.style.overflow="auto"	
			}
		}
	}
}
catch(e)
{}
}
/**************************************************************/
function onmouseoverBody(grdName)
{
try{
	if (checkOnGrid())	
		return;
	if(window.event.srcElement.parentElement.parentElement.parentElement.id==grdName.id+'_Header')
	{
		
		var ll=grdName.rows.length
		if (ll>0)
		{
			var SelectedcellNumber=findSelectedcellNumber(grdName)
			if ((grdName.rows(0).cells(SelectedcellNumber).firstChild.title!="undefined")&&(grdName.rows(0).cells(SelectedcellNumber).firstChild.tagName=="SPAN"))
			{
				lastSelectedcellNumber=SelectedcellNumber
				var maxtitle=""
				var maxtitlelength=0;
				for(i=0;i<ll;i++)
				{
					if (grdName.rows(i).cells(SelectedcellNumber).firstChild.title.length>maxtitlelength)
					{
						maxtitlelength=grdName.rows(i).cells(SelectedcellNumber).firstChild.title.length
						maxtitle=grdName.rows(i).cells(SelectedcellNumber).firstChild.title
					}
				}
				var maxwidth=findmaxwidth(grdName,SelectedcellNumber,maxtitle)
				for(i=0;i<ll;i++)
				{
					if(grdName.rows(i).cells(SelectedcellNumber).firstChild.title!="")
					{
						grdName.rows(i).cells(SelectedcellNumber).innerHTML="<SPAN align='right' title='"+grdName.rows(i).cells(SelectedcellNumber).innerHTML+"'>"+grdName.rows(i).cells(SelectedcellNumber).firstChild.title+'</SPAN>'
						grdName.rows(i).cells(SelectedcellNumber).firstChild.style.width="100%"//grdName.rows(i).cells(SelectedcellNumber).style.width
					}
				}
				grdName.parentElement.style.overflow=""
			}
		}
	}
}
catch(e)
{}
}
/**************************************************************/
var lastgrdSize=0		
var lastinnerText=""
var lasttitle=""
var lastwidth=0
var lastwidthgrdHeaderitem=""
var lastwidthgrditem=""
var lastwidthgrdHeader=""
var lastwidthgrd=""
var Kind=0
var lastSelectedcellNumber=-1
/****************************************************************/
function OnKeyDownNegativeTime(number)
{
	var key=window.event.keyCode
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40))||
			(key==186) ||
			(key==109)
			
		)
}
/****************************************************************/
//فقط اجازه ورود عددو منفی صحيح و اعشاري را با توجه به پارامترهاي ورودي به کاربر ميدهد.
function OnKeyDownNumNegative(TypeNum,number)
{

	var key=window.event.keyCode
	
	if (TypeNum=='double')
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||(key==109)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1)
			)
	}
	if (TypeNum=='integer')
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||(key==109)||
				((key>=35)&& (key<=40)) 
			)
	}
	
}
/****************************************************************/
/****************************************************************/