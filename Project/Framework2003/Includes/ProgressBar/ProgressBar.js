var oInterval="";
var Counter=0;
var TimeCount=0;
var objPB=null;
var setColor="#ff99cc";
var resetColor="#ffffff";
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
function ProgressBar(obj)
{
	this.id = obj.id
	//this.oInterval = __SetInterval;
}
/////////////////////////////////////////////////////////////////////////////////
function __SetInterval()
{
	var oInterval="";
	return (oInterval);
	//return (window.setInterval("fnRecycle()",500))
}
/////////////////////////////////////////////////////////////////////////////////
function GetTdID(obj,index)
{
	var tmpobj=obj.id.substring(0,obj.id.indexOf('_'))
	return (obj.all.item(tmpobj+'_td'+index))
}
/////////////////////////////////////////////////////////////////////////////////
function fnStartInterval(obj)
{
	/*objPB = new ProgressBar(obj)
	objPB.oInterval = window.setInterval("fnRecycle()",500);*/
	
	objPB = obj
	if(oInterval=="")
	{
		oInterval=window.setInterval("fnRecycle()",500);
	}
	else
	{
		fnStopInterval(obj);
	}
}
/////////////////////////////////////////////////////////////////////////////////
function fnStopInterval(obj)
{
	if(oInterval!="")
	{
		window.clearInterval(oInterval);
		ResetVariable()
		ResetBrogressBarColor(obj)
		objPB=null;
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
	else
	{
		var oTD=GetTdID(objPB,Counter+1)
		
		if (TimeCount%2==0)
			oTD.bgColor=setColor
		else
			oTD.bgColor=resetColor;
			
		Counter++;	
	}
}
/////////////////////////////////////////////////////////////////////////////////
function ResetVariable()
{
	oInterval="";
	Counter=0;
	TimeCount=0;
}
/////////////////////////////////////////////////////////////////////////////////
function ResetBrogressBarColor(obj)
{
	for (var i=1;i<7;i++)
	{
		var oTD=GetTdID(obj,i)
		oTD.bgColor=resetColor;
	}
}
/////////////////////////////////////////////////////////////////////////////////
function ShowProgressBar(obj)
{
	objPB = obj
	for (var i=1;i<7;i++)
	{
		var oTD=GetTdID(obj,i)
		oTD.style.display='inline';
	}
}
/////////////////////////////////////////////////////////////////////////////////
function HideProgressBar(obj)
{
	objPB = obj
	for (var i=1;i<7;i++)
	{
		var oTD=GetTdID(obj,i)
		oTD.style.display='none';
	}
}
/////////////////////////////////////////////////////////////////////////////////
