var cntPrOpen=0;
var cntPrClose=0;
/*******************************************************************/
function onClickbtnNumber(obj)
{
	switch (obj.value)
	{
		case "()":
			document.all.item('txtFormul').value="( "+document.all.item('txtFormul').value+" )";
			document.all.item('FormulTemp').value="( "+document.all.item('FormulTemp').value+" )";
			cntPrOpen++;
			cntPrClose++;
			break
		case "█": //Alt+219
			document.all.item('txtFormul').value+=(document.all.item('txtFormul').value.slice(document.all.item('txtFormul').value.length-1,document.all.item('txtFormul').value.length)==" ")? "█ " : " █ ";
			document.all.item('FormulTemp').value+=(document.all.item('FormulTemp').value.slice(document.all.item('FormulTemp').value.length-1,document.all.item('FormulTemp').value.length)==" ")? "█ " : " █ ";
			break
		case "(":
			document.all.item('txtFormul').value+=(document.all.item('txtFormul').value.slice(document.all.item('txtFormul').value.length-1,document.all.item('txtFormul').value.length)==" ")? "( " : " ( ";
			document.all.item('FormulTemp').value+=(document.all.item('FormulTemp').value.slice(document.all.item('FormulTemp').value.length-1,document.all.item('FormulTemp').value.length)==" ")? "( " : " ( ";
			cntPrClose++;
			break
		case ")":
			document.all.item('txtFormul').value+=(document.all.item('txtFormul').value.slice(document.all.item('txtFormul').value.length-1,document.all.item('txtFormul').value.length)==" ")? ") " : " ) ";
			document.all.item('FormulTemp').value+=(document.all.item('FormulTemp').value.slice(document.all.item('FormulTemp').value.length-1,document.all.item('FormulTemp').value.length)==" ")? ") " : " ) ";
			cntPrOpen++;
			break	
		case "1":
		case "2":
		case "3":
		case "4":
		case "5":
		case "6":
		case "7":
		case "8":
		case "9":
		case "0":
		case ".":
			document.all.item('txtFormul').value+=obj.value;
			document.all.item('FormulTemp').value+=obj.value;
			break
		default	: 
			document.all.item('txtFormul').value+=(document.all.item('txtFormul').value.slice(document.all.item('txtFormul').value.length-1,document.all.item('txtFormul').value.length)==" ")? obj.value+" " : " "+obj.value+" ";
			document.all.item('FormulTemp').value+=(document.all.item('FormulTemp').value.slice(document.all.item('FormulTemp').value.length-1,document.all.item('FormulTemp').value.length)==" ")? obj.value+" " : " "+obj.value+" ";
			break
	}
}
/*******************************************************************/
function onClickbtnFormulaFldIns()
{
	if (Form1.CmbField.value!=0)
	{
		document.all.item('txtFormul').value+=Form1.CmbField(Form1.CmbField.selectedIndex).text;
		document.all.item('FormulTemp').value+=((Form1.ChkNull.checked)? "IsNull("+document.all.item('CmbField').value+","+document.all.item('txtNull').value+")" : document.all.item('CmbField').value) ;
	}
	else
		alert('ابتدا آيتم مورد نظر را انتخاب نماييد')	
}
/*******************************************************************/
function onClickbtnDel()
{
	var strDel=document.all.item('FormulTemp').value.substring(document.all.item('FormulTemp').value.lastIndexOf(" ")+1,document.all.item('FormulTemp').value.length)
	var strClear="";
	if (strDel=="(")
		cntPrClose--
	else if (strDel==")")	
		cntPrOpen--
	else if ((strDel!=" ") && (strDel!="") && (strDel!="/") &&
		(strDel!="+") && (strDel!="-") && (strDel!="*") && (strDel!="█") )
		if (document.all.item('CmbField').innerHTML.indexOf('value='+strDel)!=-1) //Delete Field
		{
			document.all.item('CmbField').value=strDel
			strClear=Form1.CmbField(Form1.CmbField.selectedIndex).text
		 }	
		
	var strTemp=document.all.item('FormulTemp').value.substring(0,document.all.item('FormulTemp').value.lastIndexOf(" "))
	document.all.item('FormulTemp').value=strTemp;
	
	if ((strClear!="") && (strClear!=" "))
	{
		strTemp=document.all.item('txtFormul').value.substring(0,document.all.item('txtFormul').value.lastIndexOf(strClear))
		document.all.item('txtFormul').value=strTemp;
		strTemp=document.all.item('txtFormul').value.substring(0,document.all.item('txtFormul').value.lastIndexOf(" "))
	}
	else
		strTemp=document.all.item('txtFormul').value.substring(0,document.all.item('txtFormul').value.lastIndexOf(" "));	
		
	document.all.item('txtFormul').value=strTemp;
	
	if (document.all.item('txtFormul').value=="")
	{
		document.all.item('FormulTemp').value="";
		cntPrOpen=0;
		cntPrClose=0;
	}
}
/*******************************************************************/
function LoadFormula()
{
	if (srcId.search('Formula')!=-1)
	{
		SetFormulaSettings()
		document.all.item('FormulTemp').value=srcId.split("$")[1];
		Form1.CmbField.value=0
	}	
}
/*******************************************************************/
function SetFormulaSettings()
{
	var strSetting=srcId.split("$")[1]+" ";
	//alert(strSetting)
	var strFormul=""
	var x=0;
	var val=new String;
	if (strSetting!=null)
	{
		while (x<getCntChar(' ',strSetting))  
		{		
			val=getArray(strSetting,x,' ')
			if ((val!=' ') && (val!=''))
			{
				if (val==")")
					cntPrOpen++
				else if (val=="(")	
					cntPrClose++
				else if (Form1.CmbField.innerHTML.indexOf('value='+val)!=-1)
				{
					Form1.CmbField.value=val;
					val=Form1.CmbField(Form1.CmbField.selectedIndex).text
				}
				else if (val.indexOf("IsNull")!=-1)	
				{
					val=val.slice(parseInt(val.indexOf("("))+1,val.indexOf(","))
					Form1.CmbField.value=val;
					val=Form1.CmbField(Form1.CmbField.selectedIndex).text
				}
				strFormul+=((strFormul=="")? val : " "+val);
			}	
			x++;
		}	
		document.all.item('txtFormul').value=strFormul;
		//alert("open #"+cntPrOpen+" close #"+cntPrClose)	
	}
}
/*******************************************************************/
function onClickbtnDelAll()
{	//All Text Delete
	document.all.item('txtFormul').value=""
	document.all.item('FormulTemp').value=""
	cntPrClose=0;
	cntPrOpen=0;
}
/*******************************************************************/
function onclickb1()
{
	alert("txtFormul # "+document.all.item('txtFormul').value)
	alert("FormulTemp # "+document.all.item('FormulTemp').value)
}
/*******************************************************************/
function onChangeCmbField()
{
	/*var oXmlDoc=new ActiveXObject("Microsoft.XMLDOM")
	oXmlDoc.async="false" ;
	oXmlDoc.loadXML(Form1.txtXML.value)
	
	var oXmlNodes=oXmlDoc.documentElement.selectNodes('/ReportsEntity/DRReportView [ColName="'+Form1.CmbField.value+'"]')
	if (oXmlNodes.length!=0)
		switch(oXmlNodes.item(0).selectSingleNode('TypeData').text)
		{
			case "Int":
			case "Float":
			case "Lookup":
				document.all.item('txtNull').value="0";
				break
			default :
				document.all.item('txtNull').value="''"; 
				break
		}*/
}
/*******************************************************************/