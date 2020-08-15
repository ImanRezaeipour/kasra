///////////////////////////////////////////////////////////////////////////////////////////////////////////////
var NextObj;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Calendar(ucID)
{
	this.id = ucID;
	this.GetYear = ___fnGetYear;
	this.GetMonth = ___fnGetMonth;
	this.GetDay = ___fnGetDay;
	this.SetYear = ___fnSetYear;
	this.SetMonth = ___fnSetMonth;
	this.SetDay = ___fnSetDay;
	
	document.all.item(this.id + "_MainTable").UserControlID = ucID;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnGetYear()
{
	return document.all.item(this.id + "_txtYear").value;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnGetMonth()
{
	return document.all.item(this.id + "_txtMonth").value;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnGetDay()
{
	return document.all.item(this.id + "_txtDay").value;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnSetYear(strYear)
{
	document.all.item(this.id + "_txtYear").value = strYear;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnSetMonth(strMonth)
{
	document.all.item(this.id + "_txtMonth").value = strMonth;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ___fnSetDay(strDay)
{
	document.all.item(this.id + "_txtDay").value = strDay;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function OnKeyDownNumInput()
{
	//------
	var key = event.keyCode;
	window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) 
			)
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtonkeydown()
{
	var obj=event.srcElement;
	var strUserControlID = GetUserControlID(event.srcElement);
	var iKeyCode = event.keyCode
	if(iKeyCode==38)  //Up
	{
		TextDateUserControl_SetDate(strUserControlID , event.srcElement , "up");
		return;
	}
	if(iKeyCode==40)  //Down
	{
		TextDateUserControl_SetDate(strUserControlID , event.srcElement , "down");
		return;
	}
	//R.ACP 87/04/16_$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	if(iKeyCode==13)
	{
		if (obj.id.search("_txtDay")!=0)
		{
			ResetDateColor(strUserControlID)
			document.all.item(strUserControlID+"_txtMonth").style.backgroundColor="pink"
			document.all.item(strUserControlID+"_txtMonth").focus()
		}	
			
		if (obj.id==strUserControlID+"_txtMonth")
		{
			ResetDateColor(strUserControlID)
			document.all.item(strUserControlID+"_txtYear").style.backgroundColor="pink"
			document.all.item(strUserControlID+"_txtYear").focus()	
		}	
			
		if (obj.id==strUserControlID+"_txtYear")
		{
			ResetDateColor(strUserControlID)
			NextObj.focus();	
		}	
	}
	
	document.all.item(strUserControlID + "_txtKeyCodeHid").value = iKeyCode;
	OnKeyDownNumInput();
	var DayNumberStr=new String
	DayNumberStr=document.all.item(strUserControlID + "_tblTextDate").rows(0).children(2).children(0).value
	
	//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtDayonkeyup()
{
	if(event.keyCode==38 || event.keyCode==40)
		return;
	var strUserControlID = GetUserControlID(event.srcElement);
	
	var DayNumberStr=new String
	var DayNumber=new Number
	
	DayNumberStr=document.all.item(strUserControlID + "_tblTextDate").rows(0).children(0).children(0).value
	DayNumber=DayNumberStr
	if (DayNumberStr.length==2 && DayNumber!=0 && document.all.item(strUserControlID + "_txtKeyCodeHid").value!=9)
		document.all.item(strUserControlID + "_tblTextDate").rows(0).children(2).children(0).focus()
	
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtMonthonkeyup()
{
	if(event.keyCode==38 || event.keyCode==40)
		return;
	var strUserControlID = GetUserControlID(event.srcElement);
	
	var DayNumberStr=new String
	var DayNumber=new Number
	DayNumberStr=document.all.item(strUserControlID + "_tblTextDate").rows(0).children(2).children(0).value
	DayNumber=DayNumberStr
	if (DayNumberStr.length==2 && DayNumber!=0 && document.all.item(strUserControlID + "_txtKeyCodeHid").value!=9)
		document.all.item(strUserControlID + "_tblTextDate").rows(0).children(4).children(0).focus()
	
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtonblur()
{	
	var strUserControlID = GetUserControlID(event.srcElement);
	
	if (document.all.item(strUserControlID + "_txtFocusTextsHid").value=="true" && parseInt(document.all.item(strUserControlID + "_txtFocusCountHid").value)>1)	
	{
		document.all.item(strUserControlID + "_txtFocusTextsHid").value=false
	}
	else
	{
		var Temp 
		document.all.item(strUserControlID + "_txtFocusCountHid").value=0
		Temp=window.event.srcElement.value
	}	
		
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtonfocus()
{
	var strUserControlID = GetUserControlID(event.srcElement);
	
	document.all.item(strUserControlID + "_txtFocusCountHid").value=parseInt(document.all.item(strUserControlID + "_txtFocusCountHid").value)+1;
	document.all.item(strUserControlID + "_txtFocusTextsHid").value=true;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function F_GetUserControlID(obj) {
    // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 

    try {
        var strUserControlID = "";
        var iCounter = 0;

        while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
            obj = obj.parentElement;

        }
        if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
            strUserControlID = obj.UserControlID;

        }
        return strUserControlID;
    }
    catch (e) {
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function btnShowCalenderOnClick() {

    this.UserControlID = F_GetUserControlID(event.srcElement);

    if (document.getElementById(this.UserControlID + "_txtCalendar").value != "") {
        var Year = document.getElementById(this.UserControlID + "_txtYear").value
        var Month = document.getElementById(this.UserControlID + "_txtMonth").value
        var Day = document.getElementById(this.UserControlID + "_txtDay").value
    }
    else {

        obj = document.getElementById(this.UserControlID + "_txtDateNow").value

        var Year = obj.substr(0, 4)
        var Month = obj.substr(5, 2)
        var Day = obj.substr(8, 2)
    }
	var oCurrentDate = new Object();
	oCurrentDate.Year = Year;
	oCurrentDate.Month = Month;
	oCurrentDate.Day = Day;
	/**********************************************************/
	/*******اضافه شده توسط الياس سربند در تاريخ 87/01/19*******/
	oCurrentDate.Holiday = document.all.item(this.UserControlID + "_txtXmlHoliday").value
	/**********************************************************/
	var strFeature = "dialogHeight:266px;dialogWidth:277px;dialogLeft:200px;dialogTop:200px;status=no";
	var strUrl = "/FrmPresentation/App_Utility/NewCalendar/SolarCalendar.htm";
	
	var oDate = showModalDialog(strUrl , oCurrentDate , strFeature);
	var strYear = "";
	var strMonth = "";
	var strDay = "";
	if(oDate!=null)
	{
		var strYear = oDate.Year;
		var strMonth = ((parseInt(oDate.Month , 10)<10) ? "0" + parseInt(oDate.Month , 10).toString() : oDate.Month.toString());
		var strDay = ((parseInt(oDate.Day , 10)<10) ? "0" + parseInt(oDate.Day , 10).toString() : oDate.Day.toString());
	}

Year = strYear;
Month = strMonth;
Day = strDay;

document.getElementById(this.UserControlID + "_txtDay").value = Day
document.getElementById(this.UserControlID + "_txtMonth").value = Month
document.getElementById(this.UserControlID + "_txtYear").value = Year

document.getElementById(this.UserControlID + "_txtCalendar").value = document.getElementById(this.UserControlID + "_txtDay").value + "/" + document.getElementById(this.UserControlID + "_txtMonth").value + "/" + document.getElementById(this.UserControlID + "_txtYear").value
document.getElementById(this.UserControlID + "_txtCalendar").value = document.getElementById(this.UserControlID + "_txtCalendar").value + "  " + F_adbsghh(document.getElementById(this.UserControlID + "_txtDay").value + "/" + document.getElementById(this.UserControlID + "_txtMonth").value + "/" + document.getElementById(this.UserControlID + "_txtYear").value)

eval(document.all.item(this.UserControlID + "_txtOnChangeFunc").value);
	return;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function GetUserControlID(obj)
{
	var strUserControlID = "";
	var iCounter = 0;
	
	while(++iCounter<20 && obj!=null && obj.IsMainTable==null)
		obj = obj.parentElement;
		
	if(obj!=null && obj.IsMainTable!=null && obj.IsMainTable=="true")
		strUserControlID = obj.UserControlID;
	return strUserControlID;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function TextDateUserControl_SetDate(strUserControlID , oSrcElement , strDirection)
{
	//-------
	var oYear = document.all.item(strUserControlID + "_txtYear");
	if(isNaN(parseInt(oYear.value , 10)) || parseInt(oYear.value , 10)<1300 || parseInt(oYear.value , 10)>1500)
		return;
	else
		var iYear = parseInt(oYear.value , 10);
	//-------
	var oMonth = document.all.item(strUserControlID + "_txtMonth");
	if(isNaN(parseInt(oMonth.value , 10)) || parseInt(oMonth.value , 10)<1 || parseInt(oMonth.value , 10)>12)
		return;
	else
		var iMonth = parseInt(oMonth.value , 10);
	//-------
	var oDay = document.all.item(strUserControlID + "_txtDay");
	if(isNaN(parseInt(oDay.value , 10)) || parseInt(oDay.value , 10)<1 || parseInt(oDay.value , 10)>31)
		return;
	else
		var iDay = parseInt(oDay.value , 10);
	
	//-------
	var oKasraDate = new KasraDate();

	//-------
	var strDatePartintion = oSrcElement.DatePartintion;
	var arrNewDate;
	if(strDirection=="up")
	{
		switch(strDatePartintion)
		{
			case "Year" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , 1 , 0);
				break;
			case "Month" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , 1 , 1);
				break;
			case "Day" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , 1 , 2);
				break;
		}
	}
	else
	{
		switch(strDatePartintion)
		{
			case "Year" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , -1 , 0);
				break;
			case "Month" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , -1 , 1);
				break;
			case "Day" :
				arrNewDate = oKasraDate.PersianDateAdd(iYear , iMonth , iDay , -1 , 2);
				break;
		}
	}
	
	//-------
	var iYearLength = arrNewDate[0].toString().length;
	for(var iCounter=4 ; iCounter>iYearLength ; iCounter--)
		arrNewDate[0] = "0" + arrNewDate[0];
	var iMonthLength = arrNewDate[1].toString().length;
	for(iCounter=2 ; iCounter>iMonthLength; iCounter--)
		arrNewDate[1] = "0" + arrNewDate[1];
	var iDayLength = arrNewDate[2].toString().length;
	for(iCounter=2 ; iCounter>iDayLength; iCounter--)
		arrNewDate[2] = "0" + arrNewDate[2];
	
	//-------
	oYear.value = arrNewDate[0];
	oMonth.value = arrNewDate[1];
	oDay.value = arrNewDate[2];
	
	//-------
	return;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//R.ACP 87/04/16
function SetObjAfterDate(Obj)
{
	NextObj = Obj
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ResetDateColor(strUserControlID)
{
	document.all.item(strUserControlID+"_txtDay").style.backgroundColor=""
	document.all.item(strUserControlID+"_txtMonth").style.backgroundColor=""
	document.all.item(strUserControlID+"_txtYear").style.backgroundColor=""
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
