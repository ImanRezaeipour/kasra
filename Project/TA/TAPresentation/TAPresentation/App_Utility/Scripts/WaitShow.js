var oInterval="";
var Counter=0;
var TimeCount=0;
/////////////////////////////////////////////////////////////////////////////////
function fnStartInterval()
{

	if(oInterval=="")
	{
		oInterval=window.setInterval("fLoop()",500);
	}
	/*else
	{
		fnStopInterval();
	}*/
}
/////////////////////////////////////////////////////////////////////////////////
function fLoop()
{
    var j=0;
    for (var i=0 ;i>200;i++)
    {
        j=j+1;
    }
}
////////////////////////////////////////////////////////////////////////////////
function fnStopInterval()
{

	if(oInterval!="")
	{
		window.clearInterval(oInterval);
		resetVariable()
		resetColor()
	}
}
/////////////////////////////////////////////////////////////////////////////////
function fnRecycle()
{
	if (Counter==6)
	{
		Counter=0;
		TimeCount++;
	}
	else if (TimeCount%2==0)
	{
		Counter++;
		switch(Counter)
		{
			case 1:
				document.all.item('td1').bgColor="#ff99cc"
				break
			case 2:
				document.all.item('td2').bgColor="#ff99cc"
				break
			case 3:
				document.all.item('td3').bgColor="#ff99cc"
				break	
			case 4:
				document.all.item('td4').bgColor="#ff99cc"
				break	
			case 5:
				document.all.item('td5').bgColor="#ff99cc"
				break	
			case 6:
				document.all.item('td6').bgColor="#ff99cc"
				break									
		}		
	}
	else if (TimeCount%2!=0)
	{
		Counter++;
		switch(Counter)
		{
			case 1:
				document.all.item('td1').bgColor="#ffffff"
				break
			case 2:
				document.all.item('td2').bgColor="#ffffff"
				break
			case 3:
				document.all.item('td3').bgColor="#ffffff"
				break	
			case 4:
				document.all.item('td4').bgColor="#ffffff"
				break	
			case 5:
				document.all.item('td5').bgColor="#ffffff"
				break	
			case 6:
				document.all.item('td6').bgColor="#ffffff"
				break									
		}		
	}
}
/////////////////////////////////////////////////////////////////////////////////
function resetVariable()
{
	oInterval="";
	Counter=0;
	TimeCount=0;
}
/////////////////////////////////////////////////////////////////////////////////
function resetColor()
{
	document.all.item('td1').bgColor="#ffffff"
	document.all.item('td2').bgColor="#ffffff"
	document.all.item('td3').bgColor="#ffffff"
	document.all.item('td4').bgColor="#ffffff"
	document.all.item('td5').bgColor="#ffffff"
	document.all.item('td6').bgColor="#ffffff"
}
