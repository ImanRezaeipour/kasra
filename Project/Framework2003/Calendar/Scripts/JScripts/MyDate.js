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

function chkDayOfDate()
{

	
	var strUserControlID = GetUserControlID(event.srcElement);
	
	var tempDay = document.all.item(strUserControlID + "_txtDay").value;
	var tempMonth = document.all.item(strUserControlID + "_txtMonth").value;
	var tempYear = document.all.item(strUserControlID + "_txtYear").value;
	
	var strDay = document.all.item(strUserControlID + "_txtDay").value;
	var strMonth = document.all.item(strUserControlID + "_txtMonth").value;
	var strYear = document.all.item(strUserControlID + "_txtYear").value;
	
	var day = parseInt(tempDay);
	var month = parseInt(tempMonth);
	var year = parseInt(tempYear);
	
	//alert(tempDay.substring(0,1));
	if(tempDay.substring(0,1) == "0")
		day = parseInt(tempDay.substring(1,2));
	//alert(day);
	
	if(tempMonth.substring(0,1) == "0")
		month = parseInt(tempMonth.substring(1,2));
	//alert(month);
	
	
	if(parseInt(tempYear) < 100)
	{
		year = parseInt( "13" + tempYear);
		document.all.item(strUserControlID + "_txtYear").value = year;
	}
	
	//alert(year);
	//var element = event.srcElement.tagName.ID 
	
	//if(strDay == "")
	
	
	if(strDay != "" && (day > 31 || day == 0))
	{
		//alert("روز وارد شده اشتباه");
		
		alert("wrong Day");
		document.all.item(strUserControlID + "_txtDay").select();
	}
	if(strMonth != "" && (month > 12 || month == 0))
	{
		//alert("ماه وارد شده اشتباه");
		alert("wrong Month");
		document.all.item(strUserControlID + "_txtMonth").select();	
	}
	
	
	if(strYear != "" && (year < 1300 && year > 100 || year == 100))
	{
		//alert("سال وارد شده اشتباه");
		alert("wrong Year");
		document.all.item(strUserControlID + "_txtYear").select();
	}
	//alert(year);
	//if ( strYear != "" && year < 100 )
	//{
	//	alert(year);
	//	document.all.item(strUserControlID + "_txtMonth").value = "13" + year
	//}
	
	if(strDay != "" && day == 31)
	{
		if(strMonth != "" && month > 6)
		{
			alert("wrong Date");
			document.all.item(strUserControlID + "_txtDay").select();
		}
	}
	if ( strDay != "" && day < 10 )
	{
		//if(document.all.item(strUserControlID + "_txtDay").value.length == 2 && )
		document.all.item(strUserControlID + "_txtDay").value = "0" + day;
		if(strMonth == "")
			document.all.item(strUserControlID + "_txtMonth").focus();
		else if(strYear == "")
			document.all.item(strUserControlID + "_txtYear").focus();
	}
	
	//if(strMonth == "")
		//alert("لطفا ماه را وارد نماييد");
	if ( strMonth != "" && month < 10 )
	{
		document.all.item(strUserControlID + "_txtMonth").value = "0" + month
		if(strYear == "")
			document.all.item(strUserControlID + "_txtYear").focus();
		else if(strDay =="")
			document.all.item(strUserControlID + "_txtDay").focus();
	}
		
	//if(strYear == "")
	//	alert("لطفا سال را وارد نماييد");
	/****************************86/07/28********************************/
	/*if (strYear != "")	
	{
		if (year < 10)
			document.all.item(strUserControlID + "_txtYear").value = "130" + year
		else if (year < 100)	
			document.all.item(strUserControlID + "_txtYear").value = "13" + year
			
		if(strDay == "")
			document.all.item(strUserControlID + "_txtDay").focus();
		else if(strMonth =="")
			document.all.item(strUserControlID + "_txtMonth").focus();
	}
	
	if ((year + 1) % 4 != 0 && month == 12) 
		if (day > 29)
			document.all.item(strUserControlID + "_txtDay").focus();*/
		
	/*******************************************************************/
}