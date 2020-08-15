//============================================================
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
//============================================================
function CheckCorrectDate()
{
	//alert(event.srcElement.id)
	var strUserControlID = GetUserControlID(event.srcElement);
	//alert(strUserControlID)	
		
	var tempDay = document.all.item(strUserControlID + "_txtDay").value;
	var tempMonth = document.all.item(strUserControlID + "_txtMonth").value;
	var tempYear = document.all.item(strUserControlID + "_txtYear").value;
	
	var day = parseInt((tempDay == '')? '0' : (tempDay.substr(0,1) == '0')? tempDay.substr(1,1) : tempDay);
	var month = parseInt((tempMonth == '')? '0' : (tempMonth.substr(0,1) == '0')? tempMonth.substr(1,1) : tempMonth);
	var year = parseInt((tempYear == '')? '0' : tempYear);
	//________________________________________________________
	
	if (event.srcElement.id == strUserControlID + "_txtDay")
		if (day > 0 && day < 30 )    
		{
			document.all.item(strUserControlID + "_txtDay").value = ((day < 10) ? "0" + day : day)
			return true
		}	
			
		else if (day == 30)	
			if (month == 0 ||
				(month != 0 && month < 12) ||
					(month != 0 && month == 12 && (year == 0 || (year != 0 && (year + 1)%4 == 0)))) //ÓÇá ˜ÈíÓå
			{	
				document.all.item(strUserControlID + "_txtDay").value = day
				return true
			}	
			
			else
			{
					//alert('ÑæÒ ÇÔÊÈÇå æÇÑÏ ÔÏå')
					//document.all.item(strUserControlID + "_txtDay").select();
					return false
			}	
				
		else if (day == 31)		
			if (month == 0 || (month > 0 && month < 7))
				document.all.item(strUserControlID + "_txtDay").value = day 
			else //(month != 0 && month >= 7)	
			{
				//alert('ÑæÒ ÇÔÊÈÇå æÇÑÏ ÔÏå')
				//document.all.item(strUserControlID + "_txtDay").select();
				return false
			}
			
		else
		{
			//alert('ÑæÒ ÇÔÊÈÇå æÇÑÏ ÔÏå')
			//document.all.item(strUserControlID + "_txtDay").select();
			return false
		}	
	//________________________________________________________	
	
    else if (event.srcElement.id == strUserControlID + "_txtMonth")
		if (month > 0 && month <= 12) 
			if ((day == 0) || (year == 0) ||
				(day < 30 ) || (day == 30 && month < 12) ||
					(day == 30 && month == 12 && (year + 1)%4 == 0) || //ÓÇá ˜ÈíÓå
						(day == 31 && (month > 0 && month < 7) ))
			{					
				document.all.item(strUserControlID + "_txtMonth").value = ((month < 10)? "0"+month : month)
				return true
			}	
			
			else
			{
				//alert('ãÇå ÇÔÊÈÇå æÇÑÏ ÔÏå')
				//document.all.item(strUserControlID + "_txtMonth").select();
				return false
			}	
					
		else
		{
			//alert('ãÇå ÇÔÊÈÇå æÇÑÏ ÔÏå')
			//document.all.item(strUserControlID + "_txtMonth").select();
			return false
		}	
	//________________________________________________________	
	
	else if (event.srcElement.id == strUserControlID + "_txtYear")
		if ((year >= 1300 && year <= 1400) || (year < 100 && year >= 0))
			if ((day == 0) || (month == 0) || 
				(day > 0 && day < 30) ||
					(day == 30 && (month < 12 || (month == 12 && (year + 1)%4 == 0))) ||//ÓÇá ˜ÈíÓå
						(day == 31 && (month > 0 && month < 7)))
			{	
				document.all.item(strUserControlID + "_txtYear").value = ((year < 10)? "130"+year : (year < 100)? "13"+year : year)
				return true
			}	
				
			else
			{
				//alert('ÊÇÑöíÎ ÑÇ ÇÕáÇÍ äãÇííÏ')
				//document.all.item(strUserControlID + "_txtYear").select();
				return false
			}	
		else
		{
			//alert('ÓÇá ÇÔÊÈÇå æÇÑÏ ÔÏå')
			//document.all.item(strUserControlID + "_txtYear").select();
			return false
		}
					
}
//============================================================
function onblurtblTextDate(obj)
{
	alert(obj.id)
}
//============================================================
function onKeyDownCheckContentText()
{
	var strUserControlID = GetUserControlID(event.srcElement);
	var obj = event.srcElement.id;
	//alert(document.all.item(obj).value.length)
	if (event.keyCode == 9)
	{
		var retValue = CheckCorrectDate() 
		if (!retValue)
		{
			document.all.item(obj).select()
			document.all.item(obj).focus()
		}	
		
		window.event.returnValue = retValue;
	}
	else if ((event.keyCode != 38) &&	//Up
				(event.keyCode != 40) && //Down
					(event.keyCode != 46) && //Delete
						(event.keyCode != 8)) //BackSpace
	{
		//alert(document.all.item(obj).value.length)
		if ((event.srcElement.id.search('_txtDay') != -1 || event.srcElement.id.search('_txtMonth') != -1) && 
			(event.srcElement.value.length == 2))	//ÏÑ ÕæÑÊí˜å Øæá ÇØáÇÚÇÊ ÈÑÇÈÑ 2 ÈæÏ ÈÑÇí ÑæÒ æ ãÇå Ýæ˜æÓ ÎæÏ˜ÇÑ ÊäÙíã ÑÏÏ
		{
			var retValue = CheckCorrectDate() 
			if (retValue) 
			{
				if (event.srcElement.id.search('_txtDay') != -1)
				{
					document.all.item(strUserControlID + "_txtMonth").select()
					document.all.item(strUserControlID + "_txtMonth").focus()
				}	
				else if (event.srcElement.id.search('_txtMonth') != -1)
				{
					document.all.item(strUserControlID + "_txtYear").select()
					document.all.item(strUserControlID + "_txtYear").focus()
				}	
			}
			else
			{
				document.all.item(obj).select()
				document.all.item(obj).focus()
				window.event.returnValue = (!retValue && (event.keyCode==46 || event.keyCode==8));
			}	
		}
	}			
}
//============================================================
function onBlurCheckContentText()
{
	var strUserControlID = GetUserControlID(event.srcElement);
	var strDay = document.all.item(strUserControlID + "_txtDay").value;
	var strMonth = document.all.item(strUserControlID + "_txtMonth").value;
	var strYear = document.all.item(strUserControlID + "_txtYear").value;
	
	if (!CheckCorrectDate())
	{
		if (strYear != "" | strMonth != "" | strDay != "")
			btnShowCalenderOnClick()
	}
	/*else if ((strYear != "" & (strMonth == "" | strDay == "")) ||
				(strMonth != "" & (strYear == "" | strDay == "")) ||
					(strDay != "" & (strMonth == "" | strYear == "")))	
		btnShowCalenderOnClick()*/		
}
//============================================================
