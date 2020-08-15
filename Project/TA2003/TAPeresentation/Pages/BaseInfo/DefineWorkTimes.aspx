<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DefineWorkTimes.aspx.vb" validateRequest="false" Inherits="TA.DefineWorkTimes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>-------------------------------------------------------------------------------------تعريف 
			برنامه کاري 
			-------------------------------------------------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/General.js"></script>
		<script language="javascript">
		    var stateNode;		
		/****************************************************************/
		function offState(rootCell) 
		{
	 		var tallyLeft = document.getElementById(rootCell).offsetLeft;
			var tallyTop = document.getElementById(rootCell).offsetTop;
			if (document.getElementById(rootCell).offsetParent) {
				var rootNodeFound = false;
				var offsetStart = document.getElementById(rootCell).offsetParent;
				while (!rootNodeFound) {
					tallyLeft += offsetStart.offsetLeft;
					tallyTop += offsetStart.offsetTop;
					if (offsetStart.offsetParent)
						offsetStart = offsetStart.offsetParent;
					else
						rootNodeFound = true;
				}
			}
	 
			var shadow = document.createElement('div');
			shadow.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=90)';
			shadow.style.MozOpacity = 0.85;
			shadow.setAttribute('id', 'shadow_' + rootCell);
			shadow.style.position = 'absolute';
			shadow.style.left = tallyLeft + 'px';
			shadow.style.top = tallyTop + 'px';
			shadow.style.width = document.getElementById(rootCell).offsetWidth.toString() + 'px';
			shadow.style.height = document.getElementById(rootCell).offsetHeight.toString() + 'px';
			shadow.style.background = '#e7eeff';
			document.body.appendChild(shadow);
	 
			var shadowMessage = document.createElement('div');
			shadowMessage.setAttribute('id', 'shadowMessage');
			shadowMessage.style.position = 'absolute';
			shadowMessage.innerHTML =
				'<table>' +
					'<tr>' +
						'<td valign=middle style="color:#006699;">' +
							'لطفا منتظر بمانيد' +
						'</td>' +
						'<td valign=middle>' +
							'<object type="application/x-shockwave-flash" data="/TA/Includes/Images/Please Wait/throbber-bars1.swf" width="40" height="40">' +
								'<param name="movie" value="/TA/Includes/Images/Please Wait/throbber-bars1.swf" />' +
								'<param name="BGCOLOR" value="#e7eeff" />' +
								'<param name="wmode" value="transparent" />' +
							'</object>' +
						'</td>' +
					'</tr>' +
				'</table>';
			shadow.appendChild(shadowMessage);
			shadowMessage.style.left = ((shadowMessage.offsetParent.offsetWidth / 2) - (shadowMessage.offsetWidth / 2)).toString() + 'px';
			shadowMessage.style.top = ((shadowMessage.offsetParent.offsetHeight / 2) - (shadowMessage.offsetHeight / 2)).toString() + 'px';
	 
			stateNode = 'shadow_' + rootCell;
			document.all.item('lstSelected').style.display='none'
			document.all.item('lstExist').style.display='none'
			
	 
		}
		
	/****************************************************************/
		function onState () {
			document.all.item('lstSelected').style.display='inline'
			document.all.item('lstExist').style.display='inline'
			document.getElementById(stateNode).parentNode.removeChild(document.getElementById(stateNode));
		}
	/****************************************************************/
	
		var newrowindex=0;
		var asciii=65
		var optionId=0
		var LastSelectedRowgrd=null;
		var LastSelectedRowClassgrd="";
		var root='/BaseInfoEntity'
		var flag=0
		/****************************************************************/
		function setSequence() {
		    GN = Form1.txtGroupNumber.value 
		    L=Form1.txtlength.value
		    seq = parseInt(L / GN)
		    var oGrid = document.all.item("XTabTable")
		    var ll = oGrid.rows.length
		    for (var i = 0; i < ll; i++) {
		        oGrid.rows(i).cells(2).firstChild.value = i * seq
		    }
		}
		/****************************************************************/
		function onLoad()
		{
			window.name="DefineWorkTimes"
			Form1.target = window.name
			if (Form1.txtModalflag.value =="11")
			{
				document.all.item('btnTOPCancel').style.display='inline'
}
offState('TopRow')
			if (flag==0)
			{
				tblImgStor()
				flag=1
			}
			try{
				onState ()
				}
			catch(e)
			{}
			//Form1.txtProgramName.focus()
			
			
			if (Form1.Active.value=='DownRow')
			{
				if (Form1.SId.Value>0)
				{
					FillData(Form1.SId.value)
					Form1.SId.Value = ""
					ViewDownRow()
				}
				ViewTopRow()
				Form1.SId.Value = ""
			}
			else if (Form1.Active.value=='TopRow')
				ViewTopRow()
				if (Form1.txtAlert.value!="")
			{
				//alert(Form1.txtAlert.value.substr(0,13))
			    
				if (Form1.txtAlert.value.substr(0,13)=="confirmdelete")
				{
					if (confirm(Form1.txtAlert.value.substr(14,Form1.txtAlert.value.length)))
					{
						Form1.txtconfirmdelete.value="confirmdelete"
						Form1.txtSubmit.value="Delete"
						Form1.submit()
					}
				}	
				else
					alert(Form1.txtAlert.value)
				Form1.txtAlert.value=""
			}
		}
		/****************************************************************/
		function onClickbtnNew()
		{
		    ClearAll()
		    //***********فعال کردن نام برنامه کاری در حالت ایجاد******
		    Form1.txtProgramName.disabled = false
		    //*****************************************************************
			ViewDownRow()
			Form1.txtmodify.value ="Insert"	
		}
		/****************************************************************/
		function onclickbtnSelectGroup(obj)
		{
			
				url="ValidGroup.aspx?CategoryId=-1"	
				strOptions="dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no"
				
				var str=window.showModalDialog(url,"",strOptions)
				
				if (str!="")
				{
					if (confirm("گروه جديد جايگزين گروه قبلي شود؟")) 
					{
						createtable(obj,str)
					}
					
				}
		}
		/****************************************************************/
		function createtable(obj,str)
		{
			var oGrid=document.all.item("XTabTable")
			
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(str);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			var r=newrowindex
			xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetGroup[Selected=1]");
			l=xmlNodes.length
			//disabled
			//"<INPUT class='txtControls' type='text' tabIndex='10' value='"+Form1.txtProgramName.value+"' style='WIDTH: 100px; HEIGHT: 20px'>"
			//"<INPUT class='txtControls' type='text' tabIndex='11' style='WIDTH: 50px; HEIGHT: 20px'>"
			
			if (l>0)
			{
				obj.parentElement.parentElement.firstChild.innerHTML="<INPUT class='TxtControlsReadOnly' type='text' tabIndex='10' value='"+xmlNodes.item(0).selectSingleNode('Groupname').text+"' style='WIDTH: 100px; HEIGHT: 20px' disabled>"
				
				
				obj.parentElement.parentElement.childNodes(1).innerHTML="<INPUT class='TxtControlsReadOnly' type='text' tabIndex='11' value='"+xmlNodes.item(0).selectSingleNode('Acronym').text+"' style='WIDTH: 50px; HEIGHT: 20px' disabled>"
				
				
				obj.parentElement.parentElement.childNodes(4).innerText=xmlNodes.item(0).selectSingleNode('GroupID').text
				
			}
			
				
			
		}
		/****************************************************************/
		function Cleargrd(obj)
		{
			j=obj.rows.length-1
			for(;j>=0;--j)
				obj.deleteRow(j)
			newrowindex=0
		}
		/****************************************************************/
		function ClearAll()
		{
//			Form1.EndDate_txtYear.value="1399"
//			Form1.EndDate_txtMonth.value="12"
//			Form1.EndDate_txtDay.value="29"
			Form1.StartDate_txtYear.value=Form1.txtSDate.value.substr(0,4)
			Form1.StartDate_txtMonth.value=Form1.txtSDate.value.substr(5,2)
			Form1.StartDate_txtDay.value=Form1.txtSDate.value.substr(8,2)
			Form1.txtProgramName.value=""
			Form1.txtlength.value =""
			Form1.txtGroupNumber.value =""
			Cleargrd(XTabTable)	
			onclickbtnnNext()
			optionId=0
			//document.all.item('Week').style.display='none'
			Form1.chkHoliday.checked=false
			//Form1.chkWeekly.checked=false
			//Form1.rdbSat.checked=false
			//Form1.rdbSun.checked=false
//			Form1.rdbMon.checked=false
//			Form1.rdbTus.checked=false
//			Form1.rdbWed.checked=false
//			Form1.rdbTur.checked=false
//			Form1.rdbFri.checked=false
			
			Form1.cmbSchedulePresent.value=0
			Form1.txtTempXmlSchedulePresent.value=""
		}
		/****************************************************************/
		function onclickCssBtnCancel()
		{
			ViewTopRow()
		}
		/****************************************************************/
		function ViewTopRow()
		{
			document.all.item('TopRow').style.display='inline'
			document.all.item('DownRow').style.display='none'
			Form1.Active.value = 'TopRow'
			Form1.txtmodify.value = 'Insert'
			Form1.SId.value=0
		}
		/****************************************************************/
		function ViewDownRow()
		{
			document.all.item('DownRow').style.display='inline'
			document.all.item('TopRow').style.display='none'
			Form1.Active.value='DownRow'
		}
		/****************************************************************/
		function onclickbtnback()
		{
			
			if (Form1.txtGroupNumber.value=="")
			{	
				alert("براي انتخاب يک ساختار ، ابتدا بايد تعداد گروههاي شيفتي را وارد نمائيد.")
				
				//Form1.lstExist.value=""
				if(lastob!=null)
					lastob.bgColor=""
								
			}
			else
			{
				if(lastob!=null)
				{
					var len=Form1.lstSelected.length
					if (len<parseInt(Form1.txtlength.value))
					{
						if (optionId==0)
							if (len>0)
								Form1.lstSelected.remove(0)
						optionEl=document.createElement("OPTION")
						Form1.lstSelected.options.add(optionEl)
						document.all('lstSelected').all(optionId).innerText=(optionId+1)+"_"+lastob.cells(1).innerText//document.all('lstExist').all(Form1.lstExist.selectedIndex).innerText
						document.all('lstSelected').all(optionId).value=lastob.cells(2).innerText//Form1.lstExist.value 
						//optionEl=document.createElement("OPTION")
						//Form1.lstSelected.options.add(optionEl)
						//document.all('lstSelected').all(optionId).innerText=(optionId+1)+"."+document.all('lstExist').all(Form1.lstExist.selectedIndex).innerText
						//document.all('lstSelected').all(optionId).value=Form1.lstExist.value 
						optionId=optionId+1
					}
					
				}
			}
		}
		/****************************************************************/
		function onclickbtnNext()
		{	
			if (Form1.txtGroupNumber.value=="")
			{	
				alert("براي انتخاب يک ساختار ، ابتدا بايد تعداد گروههاي شيفتي را وارد نمائيد.")
				//Form1.lstExist.value=""
				if(lastob!=null)
					lastob.bgColor=""
			}
			var i=Form1.lstSelected.selectedIndex
			if (Form1.lstSelected.value!="")
			{
				if (i>=0)
				{
					var j
					var ln=Form1.lstSelected.length
					for (j=i+1;j<=ln-1;j++)
					{
						var txt=document.all('lstSelected').all(j).innerText
						var rr=txt.split("_")
						
						//document.all('lstSelected').all(j).innerText=(parseInt(txt.substr(0,1))-1)+txt.substr(1,txt.length-1)
						document.all('lstSelected').all(j).innerText=(parseInt(rr[0])-1)+"_"+rr[1]
					}
					Form1.lstSelected.selectedIndex=i+1
					Form1.lstSelected.remove(i)
					optionId=optionId-1
				}				
			}
		}
		/****************************************************************/
		function onclickbtnnNext()
		{	
			
			var ln=Form1.lstSelected.length
			for (i=0;i<=ln-1;i++)
				Form1.lstSelected.remove(0)//Form1.lstSelected.remove(Form1.lstSelected.value)*/
			optionId=0
		
		}
		/****************************************************************/
		function onclickbtnUP()
		{
			var test='14.test'
			
			var i=Form1.lstSelected.selectedIndex
			if (i>0)
			{
				var txt1=document.all('lstSelected').all(i-1).innerText
				var val1=document.all('lstSelected').all(i-1).value
				var txt2=document.all('lstSelected').all(i).innerText
				var val2=document.all('lstSelected').all(i).value
				var arr1=txt1.split('_')
				var arr2=txt2.split('_')
				
				//document.all('lstSelected').all(i).innerText=txt2.substr(0,1)+txt1.substr(1,txt1.length-1)
				document.all('lstSelected').all(i).innerText=arr2[0]+'_'+arr1[1]
				document.all('lstSelected').all(i).value=val1
				document.all('lstSelected').all(i-1).innerText=arr1[0]+'_'+arr2[1]
				document.all('lstSelected').all(i-1).value=val2
				Form1.lstSelected.selectedIndex=i-1
			}			
		}
		/****************************************************************/
		function onclickbtnDown()
		{
			var i=Form1.lstSelected.selectedIndex
			if (i!=Form1.lstSelected.length-1)
			{
				var txt1=document.all('lstSelected').all(i+1).innerText
				var val1=document.all('lstSelected').all(i+1).value
				var txt2=document.all('lstSelected').all(i).innerText
				var val2=document.all('lstSelected').all(i).value
				var arr1=txt1.split('_')
				var arr2=txt2.split('_')
				document.all('lstSelected').all(i).innerText=arr2[0]+'_'+arr1[1]
				document.all('lstSelected').all(i).value=val1
				document.all('lstSelected').all(i+1).innerText=arr1[0]+'_'+arr2[1]
				document.all('lstSelected').all(i+1).value=val2
				Form1.lstSelected.selectedIndex=i+1
			}			
		}
		/****************************************************************/
		function onclicklstSelected(obj) {
		    if (obj.value == "") return;
			Form1.cmbSchedulePresent.value=0
			if(Form1.SId.value!="")
			{
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async="false" ;
				xmlDoc.loadXML(Form1.txtXmlSchedulePresent.value);
				var xmlNodes;
				xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID="+Form1.SId.value+"][PropertyValue="+obj.value+"]");
				
				if(xmlNodes.length!=0)
				{
					Form1.cmbSchedulePresent.value=xmlNodes.item(0).selectSingleNode('PropertyID').text
				}
				
				if(Form1.cmbSchedulePresent.value=="")
					Form1.cmbSchedulePresent.value=0
			}
			else if(Form1.SId.value=="")
			{
				if(Form1.txtTempXmlSchedulePresent.value!="")
				{
					var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
					xmlDoc.async="false" ;
					xmlDoc.loadXML(Form1.txtTempXmlSchedulePresent.value);
					var xmlNodes;
					xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID=0][PropertyValue="+obj.value+"]");
					
					if(xmlNodes.length!=0)
					{
						Form1.cmbSchedulePresent.value=xmlNodes.item(0).selectSingleNode('PropertyID').text
					}
					
					if(Form1.cmbSchedulePresent.value=="")
						Form1.cmbSchedulePresent.value=0
				}
			}
			
			//Form1.lstExist.value=""
			if(lastob!=null)
					lastob.bgColor=""
					
		}
		/****************************************************************/
		function cmbSchedulePresentOnChange(obj)
		{
			if(Form1.SId.value=="")
			{
				if(Form1.lstSelected.value=="")
				{
					//alert("noting1")
				}
				else
				{
					//alert("create xml 1")
					if(Form1.txtTempXmlSchedulePresent.value=="")
					{
						var Str=""
						Str+="<BaseInfoEntity>"
						Str+="<ScheduleProperty>"
						Str+="<SchedulePropertyID>0</SchedulePropertyID>"
						Str+="<ScheduleID>0</ScheduleID>"
						Str+="<PropertyID>"+obj.value+"</PropertyID>"
						Str+="<PropertyValue>"+Form1.lstSelected.value+"</PropertyValue>"
						Str+="</ScheduleProperty>"
						Str+="</BaseInfoEntity>"
						Form1.txtTempXmlSchedulePresent.value=Str
					}
					else
					{
						var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
						xmlDoc.async="false" ;
						xmlDoc.loadXML(Form1.txtTempXmlSchedulePresent.value);
						var xmlNodes;
						xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID=0][PropertyValue="+Form1.lstSelected.value+"]");
						
						//alert(xmlNodes.length)
						if(xmlNodes.length!=0)
						{
							//alert("Edit xml")
							xmlNodes.item(0).selectSingleNode('PropertyID').text=obj.value
							Form1.txtTempXmlSchedulePresent.value=xmlDoc.xml 
						}
						else
						{
							//alert("create Xml 2")
							var Str=""
							Str+="<ScheduleProperty>"
							Str+="<SchedulePropertyID>0</SchedulePropertyID>"
							Str+="<ScheduleID>0</ScheduleID>"
							Str+="<PropertyID>"+obj.value+"</PropertyID>"
							Str+="<PropertyValue>"+Form1.lstSelected.value+"</PropertyValue>"
							Str+="</ScheduleProperty>"
							
							
							Form1.txtTempXmlSchedulePresent.value=Form1.txtTempXmlSchedulePresent.value.replace("<BaseInfoEntity>","")
							Form1.txtTempXmlSchedulePresent.value=Form1.txtTempXmlSchedulePresent.value.replace("</BaseInfoEntity>","")
							
							Form1.txtTempXmlSchedulePresent.value=Form1.txtTempXmlSchedulePresent.value+Str
							
							Form1.txtTempXmlSchedulePresent.value="<BaseInfoEntity>"+Form1.txtTempXmlSchedulePresent.value+"</BaseInfoEntity>"
							
						}
					}
					
				}
				
			}
			else
			{
				if(Form1.lstSelected.value=="")
				{
					//alert("noting2")
				}
				else
				{
					
					var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
					xmlDoc.async="false" ;
					xmlDoc.loadXML(Form1.txtXmlSchedulePresent.value);
					var xmlNodes;
					xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID="+Form1.SId.value+"][PropertyValue="+Form1.lstSelected.value+"]");
					
					if(xmlNodes.length!=0)
					{
						//alert("Edit xml")
						xmlNodes.item(0).selectSingleNode('PropertyID').text=obj.value
						Form1.txtXmlSchedulePresent.value=xmlDoc.xml 
					}
					else
					{
						//alert("create Xml 2")
						var Str=""
						Str+="<ScheduleProperty>"
						Str+="<SchedulePropertyID>0</SchedulePropertyID>"
						Str+="<ScheduleID>"+Form1.SId.value+"</ScheduleID>"
						Str+="<PropertyID>"+obj.value+"</PropertyID>"
						Str+="<PropertyValue>"+Form1.lstSelected.value+"</PropertyValue>"
						Str+="</ScheduleProperty>"
						
						
						Form1.txtXmlSchedulePresent.value=Form1.txtXmlSchedulePresent.value.replace("<BaseInfoEntity>","")
						Form1.txtXmlSchedulePresent.value=Form1.txtXmlSchedulePresent.value.replace("</BaseInfoEntity>","")
						
						Form1.txtXmlSchedulePresent.value=Form1.txtXmlSchedulePresent.value+Str
						
						Form1.txtXmlSchedulePresent.value="<BaseInfoEntity>"+Form1.txtXmlSchedulePresent.value+"</BaseInfoEntity>"
						
					}
				}
			}
		}
		/****************************************************************/
		function onclicklstExist()
		{
			Form1.lstSelected.value=""
		}
		/****************************************************************/
		function onclickbtnDownSave()
		{
			var aa=true
			var oGrid1 = document.all.item("XTabTable")
			var oGrid = document.all.item("XTabTable")
			if (oGrid.rows.length > 0) {
			    var l1 = oGrid1.rows.length
			    for (i = 0; i < l1; i++) {
			        for (j = 0; j < l1; j++) {
			            if ((oGrid1.rows(j).cells(0).firstChild.value == oGrid1.rows(i).cells(0).firstChild.value) && (i != j))
			                aa = false
			        }
			    }

			    if (aa == false)
			        alert(".نام گروههاي شيفتي نبايد تکراري باشد")
			    else {
			        if (CheckNotEmptyData()) {
			            var ll = Form1.lstSelected.length
			            //alert(ll)
			            //alert(Form1.txtlength.value)
			            if (ll != Form1.txtlength.value) {
			                alert(".تعداد ساختارهاي انتخاب شده بايد با طول چرخه يکسان باشد")
			            }
			            else {
			                offState('DownRow')
			                Form1.txtSDate.value = Form1.StartDate_txtYear.value + "/" + Form1.StartDate_txtMonth.value + "/" + Form1.StartDate_txtDay.value
			                //Form1.txtEDate.value=Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
			                Form1.txtEDate.value = "1399/12/29";
			                //						if (Form1.chkWeekly.checked==false)
			                //						{
			                //							Form1.rdbSat.checked=false
			                //							Form1.rdbSun.checked=false
			                //							Form1.rdbMon.checked=false
			                //							Form1.rdbTus.checked=false
			                //							Form1.rdbWed.checked=false
			                //							Form1.rdbTur.checked=false
			                //							Form1.rdbFri.checked=false
			                //						}
			                var HolidayFollow = Form1.chkHoliday.checked ? "0,1,2,3,4,5,6,7" : "";
			                //						if (Form1.rdbSat.checked==true) HolidayFollow+="0,"; 
			                //										
			                //						if (Form1.rdbSun.checked==true) HolidayFollow+="1,"; 
			                //						 
			                //						if (Form1.rdbMon.checked==true) HolidayFollow+="2,";  
			                //						
			                //						if (Form1.rdbTus.checked==true) HolidayFollow+="3,"; 
			                //						
			                //						if (Form1.rdbWed.checked==true) HolidayFollow+="4,"; 
			                //						
			                //						if (Form1.rdbTur.checked==true) HolidayFollow+="5,"; 
			                //						
			                //						if (Form1.rdbFri.checked==true) HolidayFollow+="6,"; 
			                //						
			                //						if (Form1.chkHoliday.checked==true) HolidayFollow+="7,"; 
			                //						HolidayFollow=HolidayFollow.substr(0,HolidayFollow.length-1);
			                //alert(HolidayFollow)
			                var str;
			                str = "<Schedule>"
			                str += "<SName>" + Form1.txtProgramName.value + "</SName>"
			                str += "<SDate>" + Form1.txtSDate.value + "</SDate>"
			                str += "<EDate>" + Form1.txtEDate.value + "</EDate>"
			                str += "<CycleLength>" + Form1.txtlength.value + "</CycleLength>"
			                str += "<HolidayFollow>" + HolidayFollow + "</HolidayFollow>"
			                str += "</Schedule>"
			                Form1.txtScheduleXML.value = str
			                //alert(str)						
			                var l = oGrid.rows.length
			                str = "<root>"
			                var i
			                //alert(oGrid.rows(0).cells(3).innerHTML)
			                for (i = 0; i < l; i++) {
			                    str += "<Group1>"
			                    str += "<GName>" + oGrid.rows(i).cells(0).firstChild.value + "</GName>"
			                    //alert(oGrid.rows(i).cells(0).innerText)
			                    str += "<Acronym>" + oGrid.rows(i).cells(1).firstChild.value + "</Acronym>"
			                    str += "<GroupID>" + oGrid.rows(i).cells(4).innerText + "</GroupID>"
			                    str += "<SkipDays>" + oGrid.rows(i).cells(2).firstChild.value + "</SkipDays>"
			                    str += "</Group1>"
			                }
			                //str+="<GName>"+Form1.txtProgramName+"</GName>"
			                //str+="<SkipDays>"++"</SkipDays>"
			                str += "</root>"
			                Form1.txtGroupXML.value = str
			                //alert(str)
			                str = "<root>"
			                var j
			                var ll = Form1.lstSelected.length
			                for (j = 0; j < ll; j++) {

			                    var txt1 = document.all('lstSelected').all(j).innerText
			                    var val1 = document.all('lstSelected').all(j).value

			                    var s = ""
			                    s = txt1.split('_')
			                    str += "<sakhtar>"
			                    str += "<Number>" + s[0] + "</Number>"
			                    str += "<value>" + val1 + "</value>"
			                    str += "</sakhtar>"


			                }
			                str += "</root>"
			                Form1.txtSakhtarXML.value = str


			                /**********************************************************************/
			                /****************************Sarband 88/04/16**************************/
			                /**********************************************************************/

			                if (Form1.SId.value != "") {
			                    var StrSave = "";
			                    if (Form1.txtXmlSchedulePresent.value != "") {
			                        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			                        xmlDoc.async = "false";
			                        xmlDoc.loadXML(Form1.txtXmlSchedulePresent.value);
			                        var xmlNodes;
			                        xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID=" + Form1.SId.value + "]");

			                        if (xmlNodes.length != "") {
			                            StrSave = "<BaseInfoEntity>";
			                            for (var i = 0; i < xmlNodes.length; ++i) {

			                                StrSave += "<ScheduleProperty>"
			                                StrSave += "<SchedulePropertyID>" + xmlNodes.item(i).selectSingleNode('SchedulePropertyID').text + "</SchedulePropertyID>"
			                                StrSave += "<ScheduleID>" + xmlNodes.item(i).selectSingleNode('ScheduleID').text + "</ScheduleID>"
			                                StrSave += "<PropertyID>" + xmlNodes.item(i).selectSingleNode('PropertyID').text + "</PropertyID>"
			                                StrSave += "<PropertyValue>" + xmlNodes.item(i).selectSingleNode('PropertyValue').text + "</PropertyValue>"
			                                StrSave += "</ScheduleProperty>"
			                            }
			                            StrSave += "</BaseInfoEntity>"
			                        }
			                    }

			                }
			                else {
			                    var StrSave = "";
			                    if (Form1.txtTempXmlSchedulePresent.value != "") {
			                        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			                        xmlDoc.async = "false";
			                        xmlDoc.loadXML(Form1.txtTempXmlSchedulePresent.value);
			                        var xmlNodes;
			                        xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID=0]");

			                        if (xmlNodes.length != "") {
			                            StrSave = "<BaseInfoEntity>"
			                            for (var i = 0; i < xmlNodes.length; ++i) {

			                                StrSave += "<ScheduleProperty>"
			                                StrSave += "<SchedulePropertyID>" + xmlNodes.item(i).selectSingleNode('SchedulePropertyID').text + "</SchedulePropertyID>"
			                                StrSave += "<ScheduleID>" + xmlNodes.item(i).selectSingleNode('ScheduleID').text + "</ScheduleID>"
			                                StrSave += "<PropertyID>" + xmlNodes.item(i).selectSingleNode('PropertyID').text + "</PropertyID>"
			                                StrSave += "<PropertyValue>" + xmlNodes.item(i).selectSingleNode('PropertyValue').text + "</PropertyValue>"
			                                StrSave += "</ScheduleProperty>"
			                            }
			                            StrSave += "</BaseInfoEntity>"
			                        }
			                    }
			                }
			                Form1.txtXmlSaveScheduleProperty.value = StrSave

			                /**********************************************************************/
			                /****************************Sarband 88/04/16**************************/
			                /**********************************************************************/
			                //						alert(Form1.txtScheduleXML.value)
			                Form1.txtSubmit.value = "Save"
			                Form1.submit()
			            }
			        }
			    }
			}
			else alert("لطفا گروه را وارد کنيد");
		}
		/****************************************************************/
		function CheckNotEmptyData()
		{
			
			
			if (Form1.txtProgramName.value=="")
			{
				alert('نام برنامه کاري را وارد نماييد')
				document.all.item('txtProgramName').focus()
				return false
			}
			else if (Form1.txtlength.value=="")
			{
				alert('طول چرخه  را وارد نماييد')
				document.all.item('txtlength').focus()
				return false
			}
			
			else if (Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value=="//")
			{
				alert('تاريخ شروع  را وارد نماييد')
				return false
			}
//			else if (Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value=="//")
//			{
//				alert('تاريخ پايان را وارد نماييد')
//				
//				return false
//			}
//			else if ((Form1.EndDate_txtYear.value<Form1.StartDate_txtYear.value))
//			{
//				alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
//				
//				return false
//			}
//			else if((Form1.EndDate_txtYear.value==Form1.StartDate_txtYear.value)&&(Form1.EndDate_txtMonth.value<Form1.StartDate_txtMonth.value))
//			{
//				alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
//				
//				return false
//			}
//			else if((Form1.EndDate_txtYear.value==Form1.StartDate_txtYear.value)&&(Form1.EndDate_txtMonth.value==Form1.StartDate_txtMonth.value)&&(Form1.EndDate_txtDay.value<Form1.StartDate_txtDay.value))
//			{
//				alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
//				
//				return false
//			}
			else if (checkEmptyAcronym())
					return false
			else
			{
				return true;
			}
				
		}
		
		/****************************************************************/
		function onclickgrd(SelectedRow)
		{
			if(LastSelectedRowgrd!=null)
			{
				LastSelectedRowgrd.className=LastSelectedRowClassgrd;
			}
			LastSelectedRowClassgrd=SelectedRow.className;
			LastSelectedRowgrd=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			//alert(LastSelectedRowgrd.ScheduleId);
		}
		
		/****************************************************************/
		function LoadData(SelectedRow)
		{
			ClearAll()
			Form1.txtProgramName.value=SelectedRow.cells(0).innerText;
			Form1.txtlength.value=SelectedRow.cells(1).innerText;
			Form1.txtGroupNumber.value=SelectedRow.cells(2).innerText;
			var Sd=SelectedRow.cells(3).innerText;
			
			Form1.StartDate_txtDay.value=Sd.substr(0,2);
			Form1.StartDate_txtMonth.value=Sd.substr(3,2);
			Form1.StartDate_txtYear.value=Sd.substr(6,4);
//			
//			var Ed=SelectedRow.cells(4).innerText;
//			Form1.EndDate_txtDay.value=Ed.substr(0,2);
//			Form1.EndDate_txtMonth.value=Ed.substr(3,2);
//			Form1.EndDate_txtYear.value=Ed.substr(6,4);
			
			Form1.txtTempXmlSchedulePresent.value=""
			
			FillData(SelectedRow.ScheduleId)
			
			/******************************************/
			Form1.cmbSchedulePresent.value=0
			
			if(Form1.SId.value!="")
			{						
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async="false" ;
				xmlDoc.loadXML(Form1.txtXmlSchedulePresent.value);
				var xmlNodes;
				xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScheduleProperty[ScheduleID="+Form1.SId.value+"]");
				
				if(xmlNodes.length!=0)
				{
					Form1.cmbSchedulePresent.value=xmlNodes.item(0).selectSingleNode('PropertyID').text
				}
				
				if(Form1.cmbSchedulePresent.value=="")
					Form1.cmbSchedulePresent.value=0
			}
			
			/******************************************/
			
		}
		/****************************************************************/
		function FillData(SId)
		{
			
			Cleargrd(XTabTable)	
			onclickbtnnNext()
			optionId=0
//			document.all.item('Week').style.display='none'
			Form1.chkHoliday.checked=false
//			Form1.chkWeekly.checked=false
//			Form1.rdbSat.checked=false
//			Form1.rdbSun.checked=false
//			Form1.rdbMon.checked=false
//			Form1.rdbTus.checked=false
//			Form1.rdbWed.checked=false
//			Form1.rdbTur.checked=false
//			Form1.rdbFri.checked=false
//			//alert(SId)
				
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XML1.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			//alert(Form1.XML1.value)
			
			xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/Group[ScheduleId="+SId+"]")
			var i=0
			//alert(xmlNodes.length)
			l=xmlNodes.length
			var oGrid=document.all.item("XTabTable")
			for (newrowindex=0;newrowindex<l;newrowindex++)
			{
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "XItemStyle";
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(0).innerHTML="<INPUT class='TxtControlsReadOnly' type='text' tabIndex='10' value='"+xmlNodes.item(newrowindex).selectSingleNode('Name').text+"' style='WIDTH: 100px; HEIGHT: 20px' disabled>"
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(1).innerHTML="<INPUT class='TxtControlsReadOnly' type='text' tabIndex='11'  style='WIDTH: 50px; HEIGHT: 20px' value='"+xmlNodes.item(newrowindex).selectSingleNode('Acronym').text+"' disabled>"//  value='"+lll+"' runat='server'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(2).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' value='"+xmlNodes.item(newrowindex).selectSingleNode('skipDays').text+"' style='WIDTH: 70px; HEIGHT: 20px'>"//  value='"+lll+"' runat='server'>"
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(3).innerHTML="<input onclick='onclickbtnSelectGroup(this)' class='CssBtnbtnAddNode' type='button' style='WIDTH: 20px; HEIGHT: 20px'	title='انتخاب گروههاي شيفتي'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(4).innerText=xmlNodes.item(newrowindex).selectSingleNode('GroupId').text
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(5).innerHTML="<INPUT class='CssBtnShowCal' onclick='onclickCalendar(this)'  title='زمان بندی برنامه کاری' tabIndex='12' type='button' >"
				
				
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(4).style.display="none"	
			oGrid.rows(newrowindex).cells(4).style.visibility="Hidden"	
				oGrid.rows(newrowindex).cells(0).style.width="120px"
				oGrid.rows(newrowindex).cells(1).style.width="70px"
				oGrid.rows(newrowindex).cells(2).style.width="90px"
				oGrid.rows(newrowindex).cells(3).style.width="34px"
				oGrid.rows(newrowindex).cells(5).style.width="34px"
									
				oGrid.rows(newrowindex).cells(0).style.border=0
				oGrid.rows(newrowindex).cells(1).style.border=0
				oGrid.rows(newrowindex).cells(2).style.border=0
				oGrid.rows(newrowindex).cells(3).style.border=0
				oGrid.rows(newrowindex).cells(4).style.border=0	
				oGrid.rows(newrowindex).cells(5).style.border=0	
									
				if ((newrowindex%2)==0)
				{
					oGrid.rows(newrowindex).cells(0).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssItemStyle"
					
				}
				else
				{
					oGrid.rows(newrowindex).cells(0).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssAlternatingItemStyle"
					
				}
				
			}
						
			Form1.SId.value =SId
			var xmlNodes1;
			xmlNodes1=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/Sakhtar[scheduleId="+SId+"]")
			var k=0
			for(k=0;k<=xmlNodes1.length-1;k++)
			{
				optionEl=document.createElement("OPTION")
				Form1.lstSelected.options.add(optionEl)
				document.all('lstSelected').all(optionId).innerText=xmlNodes1.item(k).selectSingleNode('sequence').text+"_"+xmlNodes1.item(k).selectSingleNode('Name').text
				document.all('lstSelected').all(optionId).value=xmlNodes1.item(k).selectSingleNode('DetailcollectionId').text 
				optionId=optionId+1
			}
			
			var xmlNodes2;
			xmlNodes2=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDefineWorkTimes[ScheduleId="+SId+"]")
			Form1.txtProgramName.value=xmlNodes2.item(0).selectSingleNode('PName').text;
			Form1.txtlength.value=xmlNodes2.item(0).selectSingleNode('cyclelength').text;
			Form1.txtGroupNumber.value=xmlNodes2.item(0).selectSingleNode('cnt').text;
			var Sd=xmlNodes2.item(0).selectSingleNode('StartDate').text;
			
			Form1.StartDate_txtDay.value=Sd.substr(0,2);
			Form1.StartDate_txtMonth.value=Sd.substr(3,2);
			Form1.StartDate_txtYear.value=Sd.substr(6,4);
			
//			var Ed=xmlNodes2.item(0).selectSingleNode('EndDate').text;
//			Form1.EndDate_txtDay.value=Ed.substr(0,2);
//			Form1.EndDate_txtMonth.value=Ed.substr(3,2);
			//			Form1.EndDate_txtYear.value=Ed.substr(6,4);
			var hf=xmlNodes2.item(0).selectSingleNode('HolidayFollow').text
			if (hf!="") {
			    Form1.chkHoliday.checked = xmlNodes2.item(0).selectSingleNode('HolidayFollow').text == "" ? false : true;
				var h=""
				h=hf.split(',')
				o=h.length
				for(i=0;i<o;i++)
				{
//					if (h[i]==0)
//					{
//						//Form1.chkWeekly.checked=true
////						Form1.rdbSat.checked =true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==1)
//					{
//						//Form1.chkWeekly.checked=true
//						Form1.rdbSun.checked=true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==2)
//					{
//						//Form1.chkWeekly.checked=true
//						Form1.rdbMon.checked =true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==3)
//					{	
//						//Form1.chkWeekly.checked=true
//						Form1.rdbTus.checked =true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==4)
//					{
//						//Form1.chkWeekly.checked=true
//						Form1.rdbWed.checked =true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==5)
//					{
//						//Form1.chkWeekly.checked=true
//						Form1.rdbTur.checked=true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==6)
//					{
//						//Form1.chkWeekly.checked=true
//						Form1.rdbFri.checked =true
//						document.all.item('Week').style.display='inline'
//					}
//					else if (h[i]==7)
//						Form1.chkHoliday.checked =true
				}
			}
			/*var Str="<ReportsEntity><GetExtendedOverTime>"
			Str+="<PersonID>"+Form1.Name.value+"</PersonID>";
			Str+="<FromDate>"+Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value+"</FromDate>"
			Str+="<ToDate>"+Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value+"</ToDate>"
			Str+="<Value>"+Form1.Acronym.value+"</Value>"
			Str+="</GetExtendedOverTime></ReportsEntity>"
			Form1.txtLastXML.value=Str;
			*/
				
		}
		/****************************************************************/
		function onClickbtnEdit()
		{
		    if (LastSelectedRowgrd == null)
		        alert("براي اصلاح بايد يک سطر را انتخاب نماييد")
		    else {
		        //***********غیرفعال کردن نام برنامه کاری در حالت ویرایش******
		        Form1.txtProgramName.disabled="disabled"
                //*****************************************************************
		        ViewDownRow()
		        Form1.txtmodify.value = "Update"
		        Form1.Active.value = "DownRow"
		        LoadData(LastSelectedRowgrd)
		    }
		}
		/****************************************************************/
		function ondblclickgrd()
		{
		    if (LastSelectedRowgrd == null)
		        alert("براي اصلاح بايد يک سطر را انتخاب نماييد")
		    else {
		        //***********غیرفعال کردن نام برنامه کاری در حالت ویرایش******
		        Form1.txtProgramName.disabled = "disabled"
		        //*****************************************************************
		        ViewDownRow()
		        Form1.txtmodify.value = "Update"
		        Form1.Active.value = "DownRow"
		        Form1.cmbSchedulePresent.value = 0
		        Form1.txtTempXmlSchedulePresent.value = ""
		        LoadData(LastSelectedRowgrd);
		    }
			
			
		}
		/****************************************************************/
		function onClickbtnDelete()
		{
			if(LastSelectedRowgrd==null)
			{
				alert("به منظور حذف يک سطر بايد انتخاب شده باشد .")
			}
			else {
			    Form1.SId.value = LastSelectedRowgrd.ScheduleId;
				if (confirm("آيا براي حذف مطمئن هستيد")==true)
				{
					Form1.txtSubmit.value="Delete"
					Form1.submit()
				}
			}
		}
		/****************************************************************/
		function tblImgStor()
		{
			var oGrid=document.all.item("lstExist")
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.lstXML.value);
			
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDetailCollection")
			var i=0
			
			for(i=0;i<=xmlNodes.length-1;i++)
			{
				oGrid.insertRow()
				oGrid.rows(i).insertCell()
				//oGrid.rows(i).cells(0).innerHTML="<IMG title='نمايش جزئيات' onClick='onClickIMG()' style='CURSOR: hand; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
				oGrid.rows(i).cells(0).innerHTML = "<IMG title='نمايش جزئيات' style='CURSOR: hand; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
				oGrid.rows(i).insertCell()
				oGrid.rows(i).cells(1).innerText=xmlNodes.item(i).selectSingleNode('Name').text
				oGrid.rows(i).insertCell()
				oGrid.rows(i).cells(2).innerText=xmlNodes.item(i).selectSingleNode('DetailCollectionID').text
				oGrid.rows(i).cells(2).style.display="none"
				oGrid.rows(i).align="Right"
			}
		}
		/****************************************************************/
		function onClickIMG()
		{
			onclicklstExist()
			if (lastob!=null)
			{
				var url="reportDayStructure.aspx?DId=" + lastob.cells(2).innerText
				window.showModalDialog(url,"","dialogHeight: 390px;dialogWidth: 470px;center: Yes;help: no;status:no")
			
			//alert(lastob.cells(2).innerText)	
			}
		}
		/****************************************************************/
		var lastob
		function onclicklstExist()
		{
			
			var ob=window.event.srcElement
			while (ob.tagName!="TR")
			{
				ob=ob.parentElement
			}
			
			if (ob.tagName=="TR")
			{
				if(ob.parentElement.parentElement.id=="lstExist")
				{
					if (lastob!=null)
						lastob.bgColor=""
					ob.bgColor="#ccffff"
					lastob=ob
					Form1.lstSelected.value=""
				}
			}
		}
		/****************************************************************/
		function onclickchkWeekly()
		{
			if (Form1.chkWeekly.checked)
			 
				document.all.item('Week').style.display='inline'
			else
			{
				document.all.item('Week').style.display='none'
				Form1.rdbSat.checked =false	
				Form1.rdbSun.checked =false	
				Form1.rdbMon.checked =false	
				Form1.rdbTus.checked =false	
				Form1.rdbTur.checked =false	
				Form1.rdbWed.checked =false	
				Form1.rdbFri.checked =false	
			}
		}
		/****************************************************************/
		function OnClickbtnTOPCancel()
		{
			//alert("Col")
			window.close()
		}
		/****************************************************************/
		function onblurtxtGroupNumber() {
		    if (Form1.txtProgramName.value == "") {
		        alert("براي وارد نمودن تعداد گروههاي شيفتي ، ابتدا بايد نام برنامه کاري را وارد نمائيد.")
		        Form1.txtGroupNumber.value = "";
		        Remove_row();
		    }
		    else {
		        var oGrid = document.all.item("XTabTable")
		        if (Form1.txtGroupNumber.value != "") {
		            var count = Form1.txtGroupNumber.value
		            var l = oGrid.rows.length
		            if (l < count && count != 0)
		                add_row()
		            else if (l > count && count != 0) {
		                if (confirm("تعداد گروه از تعداد گروههاي شيفتي موجود کمتر است ،با حذف " + (l - count) + "گروه از گروههاي موجود موافقيد ؟") == true)
		                    Remove_row()
		            }
		            else if (count == 0) {
		                alert("تعداد گروه نمي تواند 0 باشد");
		                Form1.txtGroupNumber.value = "";
		                Remove_row();
		                Form1.txtGroupNumber.focus();
		            }
		            setSequence()
		        }
		        else {
		            alert("تعداد گروه نمي تواند 0 باشد");
		            Form1.txtGroupNumber.value = "";
		            Remove_row();
		            Form1.txtGroupNumber.focus();
		        }
		    }
		}
		/****************************************************************/
		function onblurtxtLength() {
		    if (Form1.txtlength.value == "0") {
		        alert("طول چرخه نمي تواند 0 باشد");
		        Form1.txtlength.value = "";
		        Form1.txtlength.focus();
		    }
		    setSequence()
		}
		/*****************************************************************/
		function onclicktxtGroupNumber()
		{
			
			if (Form1.txtProgramName.value=="")
				alert("براي وارد نمودن تعداد گروههاي شيفتي ، ابتدا بايد نام برنامه کاري را وارد نمائيد.")
			
		}
		/****************************************************************/
		function add_one_row()
		{
			
			var oGrid=document.all.item("XTabTable")
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(0).innerHTML="<INPUT class='txtControls' type='text' tabIndex='10' value='"+Form1.txtProgramName.value+"' style='WIDTH: 100px; HEIGHT: 20px'>"
			
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(1).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' style='WIDTH: 50px; HEIGHT: 20px'>"
			
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(2).innerHTML="<INPUT class='txtControls' type='text' tabIndex='12' value='"+0+"' style='WIDTH: 70px; HEIGHT: 20px'>"//  value='"+lll+"' runat='server'>"
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(3).innerHTML="<input onclick='onclickbtnSelectGroup(this)' class='CssBtnbtnAddNode' style='WIDTH: 20px; HEIGHT: 20px' type='button'	title='انتخاب گروههاي شيفتي'>"
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(4).innerText="-1"
			
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(5).innerHTML="<INPUT class='CssBtnShowCal' title='زمان بندی برنامه کاری' tabIndex='12' type='button' >"
				
			
			oGrid.rows(newrowindex).align="center"
			
			
			
			
			oGrid.rows(newrowindex).cells(4).style.display="none"	
			oGrid.rows(newrowindex).cells(4).style.visibility="Hidden"	
			oGrid.rows(newrowindex).cells(0).style.width="120px"
			oGrid.rows(newrowindex).cells(1).style.width="70px"
			oGrid.rows(newrowindex).cells(2).style.width="90px"
			oGrid.rows(newrowindex).cells(3).style.width="34px"
			oGrid.rows(newrowindex).cells(5).style.width="34px"
								
			oGrid.rows(newrowindex).cells(0).style.border=0
			oGrid.rows(newrowindex).cells(1).style.border=0
			oGrid.rows(newrowindex).cells(2).style.border=0
			oGrid.rows(newrowindex).cells(3).style.border=0
			oGrid.rows(newrowindex).cells(4).style.border=0
			oGrid.rows(newrowindex).cells(5).style.border=0							
			oGrid.rows(newrowindex).cells(0).className="CssItemStyle"
			oGrid.rows(newrowindex).cells(1).className="CssItemStyle"
			oGrid.rows(newrowindex).cells(2).className="CssItemStyle"
			oGrid.rows(newrowindex).cells(3).className="CssItemStyle"
			oGrid.rows(newrowindex).cells(5).className="CssItemStyle"
			
			newrowindex=newrowindex+1
		}
		/****************************************************************/
		function add_multiple_row()
		{
			var oGrid=document.all.item("XTabTable")
			var count=Form1.txtGroupNumber.value
			//var newrowindex
			asciii=65
			var ln=parseInt(Form1.txtlength.value)/parseInt(Form1.txtGroupNumber.value)
			for (newrowindex=0;newrowindex<count;newrowindex++)
			{
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "XItemStyle";
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(0).innerHTML="<INPUT class='txtControls' tabIndex='"+10+(newrowindex*3)+"' type='text' value='"+Form1.txtProgramName.value+String.fromCharCode(asciii)+"' style='WIDTH: 100px; HEIGHT: 20px'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(1).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' style='WIDTH: 50px; HEIGHT: 20px'>"
				
				oGrid.rows(newrowindex).insertCell()
			
				var lll=ln*newrowindex
				if(parseInt(lll)!=lll)
					lll=parseInt(lll)+1
				oGrid.rows(newrowindex).cells(2).innerHTML="<INPUT class='txtControls' tabIndex='"+12+(newrowindex*3)+"' type='text' value='"+lll+"' style='WIDTH: 70px; HEIGHT: 20px'>"//  value='"+lll+"' runat='server'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(3).innerHTML="<input onclick='onclickbtnSelectGroup(this)' class='CssBtnbtnAddNode' style='WIDTH: 20px; HEIGHT: 20px' type='button'	title='انتخاب گروههاي شيفتي'>"
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(4).innerText="-1"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(5).innerHTML="<INPUT class='CssBtnShowCal' onclick='onclickCalendar(this)' title='زمان بندی برنامه کاری' tabIndex='13' type='button' >"
				oGrid.rows(newrowindex).align="center"
				
				
				
			oGrid.rows(newrowindex).cells(4).style.display="none"	
			oGrid.rows(newrowindex).cells(4).style.visibility="Hidden"	
				oGrid.rows(newrowindex).cells(0).style.width="120px"
				oGrid.rows(newrowindex).cells(1).style.width="70px"
				oGrid.rows(newrowindex).cells(2).style.width="90px"
				oGrid.rows(newrowindex).cells(3).style.width="34px"
				oGrid.rows(newrowindex).cells(5).style.width="34px"
									
				oGrid.rows(newrowindex).cells(0).style.border=0
				oGrid.rows(newrowindex).cells(1).style.border=0
				oGrid.rows(newrowindex).cells(2).style.border=0
				oGrid.rows(newrowindex).cells(3).style.border=0
				oGrid.rows(newrowindex).cells(4).style.border=0	
				oGrid.rows(newrowindex).cells(5).style.border=0	
									
				if ((newrowindex%2)==0)
				{
					oGrid.rows(newrowindex).cells(0).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssItemStyle"
					
				}
				else
				{
					oGrid.rows(newrowindex).cells(0).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssAlternatingItemStyle"
				}
				asciii=asciii+1											
				
			}
		}
		/****************************************************************/
		function add_one_rows()
		{
			var oGrid=document.all.item("XTabTable")
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(0).innerHTML="<INPUT class='txtControls' type='text' tabIndex='10' value='"+Form1.txtProgramName.value+"' style='WIDTH: 100px; HEIGHT: 20px'>"
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(1).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' style='WIDTH: 50px; HEIGHT: 20px'>"
			oGrid.rows(newrowindex).insertCell()
			
			oGrid.rows(newrowindex).cells(2).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' value='"+(Form1.txtGroupNumber.value -1)+"' style='WIDTH: 70px; HEIGHT: 20px'>"//  value='"+lll+"' runat='server'>"
			oGrid.rows(newrowindex).insertCell()
			
			oGrid.rows(newrowindex).cells(3).innerHTML="<input onclick='onclickbtnSelectGroup(this)' class='CssBtnbtnAddNode' style='WIDTH: 20px; HEIGHT: 20px' type='button'	title='انتخاب گروههاي شيفتي'>"
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(4).innerText="-1"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(5).innerHTML="<INPUT class='CssBtnShowCal' onclick='onclickCalendar(this)' title='زمان بندی برنامه کاری' tabIndex='13' type='button' >"
				oGrid.rows(newrowindex).align="center"
			
			
					
			oGrid.rows(newrowindex).cells(4).style.display="none"	
			oGrid.rows(newrowindex).cells(4).style.visibility="Hidden"	
				oGrid.rows(newrowindex).cells(0).style.width="120px"
				oGrid.rows(newrowindex).cells(1).style.width="70px"
				oGrid.rows(newrowindex).cells(2).style.width="90px"
				oGrid.rows(newrowindex).cells(3).style.width="34px"
				oGrid.rows(newrowindex).cells(5).style.width="34px"
									
				oGrid.rows(newrowindex).cells(0).style.border=0
				oGrid.rows(newrowindex).cells(1).style.border=0
				oGrid.rows(newrowindex).cells(2).style.border=0
				oGrid.rows(newrowindex).cells(3).style.border=0
				oGrid.rows(newrowindex).cells(4).style.border=0	
				oGrid.rows(newrowindex).cells(5).style.border=0	
									
				if ((newrowindex%2)==0)
				{
					oGrid.rows(newrowindex).cells(0).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssItemStyle"
					
				}
				else
				{
					oGrid.rows(newrowindex).cells(0).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssAlternatingItemStyle"
				}
			
			newrowindex=newrowindex+1
		}
		/****************************************************************/
		function add_multiple_rows()
		{
			var oGrid=document.all.item("XTabTable")
			var count=Form1.txtGroupNumber.value 
			//var newrowindex
			
			//var ln=parseInt(Form1.txtlength.value)/parseInt(Form1.txtGroupNumber.value)
			var r=newrowindex
			var l=oGrid.rows.length
			var count1=count-l
			
			for (newrowindex=r;newrowindex<count;newrowindex++)
			{
				
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "XItemStyle";
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(0).innerHTML="<INPUT class='txtControls' tabIndex='"+10+(newrowindex*3)+"' type='text' value='"+Form1.txtProgramName.value+String.fromCharCode(asciii)+"' style='WIDTH: 100px; HEIGHT: 20px'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(1).innerHTML="<INPUT class='txtControls' type='text' tabIndex='11' style='WIDTH: 50px; HEIGHT: 20px'>"
			
				oGrid.rows(newrowindex).insertCell()
				
				oGrid.rows(newrowindex).cells(2).innerHTML="<INPUT class='txtControls' tabIndex='"+11+(newrowindex*3)+"' type='text' value='"+((Form1.txtlength.value)-1)+"' style='WIDTH: 70px; HEIGHT: 20px'>"//  value='"+lll+"' runat='server'>"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(3).innerHTML="<input onclick='onclickbtnSelectGroup(this)' class='CssBtnbtnAddNode' style='WIDTH: 20px; HEIGHT: 20px' type='button'	title='انتخاب گروههاي شيفتي'>"
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(4).innerText="-1"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(5).innerHTML="<INPUT class='CssBtnShowCal' onclick='onclickCalendar(this)' title='زمان بندی برنامه کاری' tabIndex='13' type='button' >"
				oGrid.rows(newrowindex).align="center"
				
				
				
			oGrid.rows(newrowindex).cells(4).style.display="none"	
			oGrid.rows(newrowindex).cells(4).style.visibility="Hidden"	
				oGrid.rows(newrowindex).cells(0).style.width="120px"
				oGrid.rows(newrowindex).cells(1).style.width="70px"
				oGrid.rows(newrowindex).cells(2).style.width="90px"
				oGrid.rows(newrowindex).cells(3).style.width="34px"
				oGrid.rows(newrowindex).cells(5).style.width="34px"
									
				oGrid.rows(newrowindex).cells(0).style.border=0
				oGrid.rows(newrowindex).cells(1).style.border=0
				oGrid.rows(newrowindex).cells(2).style.border=0
				oGrid.rows(newrowindex).cells(3).style.border=0
				oGrid.rows(newrowindex).cells(4).style.border=0	
				oGrid.rows(newrowindex).cells(5).style.border=0	
									
				if ((newrowindex%2)==0)
				{
					oGrid.rows(newrowindex).cells(0).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssItemStyle"
					
				}
				else
				{
					oGrid.rows(newrowindex).cells(0).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(1).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(2).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(3).className="CssAlternatingItemStyle"
					oGrid.rows(newrowindex).cells(5).className="CssAlternatingItemStyle"
				}
				asciii=asciii+1											
			
			}		
		}
		/****************************************************************/
		function add_row()
		{
			var oGrid=document.all.item("XTabTable")
			var count=Form1.txtGroupNumber.value 
			var l=oGrid.rows.length
			if (l==0)
			{
				if (count==1)
					add_one_row()
				else
					add_multiple_row()
			}
			else if (l>0)
			{
				count=count-l
				if (count==1)
					add_one_rows()
				else
					add_multiple_rows()
			}	
		}
		/****************************************************************/
		function Remove_row()
		{
			
			var oGrid=document.all.item("XTabTable")
			var count=Form1.txtGroupNumber.value 
			var l=oGrid.rows.length
			var a 
			for (a=newrowindex-1;a>=count;a--)
			{
				newrowindex=newrowindex-1
				oGrid.deleteRow(a)
			}
			
		}
		/****************************************************************/
		function onblurlstExist()
		{
			if (Form1.txtGroupNumber.value=="")
			{	
				alert("براي انتخاب يک ساختار ، ابتدا بايد تعداد گروههاي شيفتي را وارد نمائيد.")
				//Form1.lstExist.value=""
				if(lastob!=null)
					lastob.bgColor=""
			}
		}
		/****************************************************************/
		function checkEmptyAcronym()
		{
			var oGrid=document.all.item("XTabTable")
			var lll=oGrid.rows.length 
			
			for(i=0;i<lll;i++)
			{
				
				if((oGrid.rows(i).cells(1).childNodes(0).value=="")&&(oGrid.rows(i).cells(1).childNodes(0).disabled==false))
				{
					alert("لطفا نام مخفف گروه '"+oGrid.rows(i).cells(0).childNodes(0).value+"' را وارد کنيد.")
					return true;
				}
			}
		}
		/****************************************************************/
		function onclickCalendar(obj)
		{
			while(obj.tagName!="TR")
			{
				obj=obj.parentElement 
			}
			if (obj.childNodes(4).innerText!=-1)
			{
				url="../SpecialCal/SpecialCal.aspx?GroupId="+obj.childNodes(4).innerText+"&PersonId="+"0"+"&SessionID="+Form1.txtSessionID.value
				window.showModalDialog(url,window,"dialogHeight: 700px;dialogWidth: 892px;center: Yes;help: no;status: no")
			}
		}
		/****************************************************************/
		
        </script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<FORM id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<TBODY>
					<tr>
						<td vAlign="middle" align="center">
							<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
								border="0">
								<tr>
									<td vAlign="middle" align="center">
										<TABLE class="CssPage" id="Layer3" cellSpacing="1" cellPadding="1" align="center" border="0">
											<TR>
												<TD id="TopRow" style="DISPLAY: inline" vAlign="top" align="center">
													<TABLE id="Table2" style="WIDTH: 531px; HEIGHT: 378px" cellSpacing="0" cellPadding="0"
														width="531" border="0">
														<TR>
															<TD dir="rtl" style="SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 202px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
																vAlign="top" align="center"><cc1:automationgrid id="grdPerson" runat="server" 
                                                                    AutoGenerateColumns="False" SendXML="DoNotSend" SelectRowOnClick="False"
																	ClientPageSize="0" Scrolling="True" EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False"
																	CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" " Height="370px" Width="516px" ClientPagerCssClass="" 
                                                                    FunctionNameOnClick="" LinkPagerCssClass=""><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																	<HEADERSTYLE CssClass="CssHeaderStyle" Wrap="False"></HEADERSTYLE>
																	<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																	<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																	<PAGERSTYLE Wrap="False"></PAGERSTYLE>
																	<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																	<COLUMNS>
																		<ASP:BOUNDCOLUMN DataField="PName" HeaderText="نام برنامه کاري">
																			<HEADERSTYLE Width="150px" HorizontalAlign="Center"></HEADERSTYLE>
																			<ITEMSTYLE Width="150px" HorizontalAlign="Center"></ITEMSTYLE>
																		</ASP:BOUNDCOLUMN>
																		<ASP:BOUNDCOLUMN DataField="cyclelength" HeaderText="طول چرخه">
																			<HEADERSTYLE Width="80px" HorizontalAlign="Center"></HEADERSTYLE>
																			<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
																		</ASP:BOUNDCOLUMN>
																		<ASP:BOUNDCOLUMN DataField="cnt" HeaderText="تعداد گروه">
																			<HEADERSTYLE Width="80px"></HEADERSTYLE>
																			<ITEMSTYLE Width="80px"></ITEMSTYLE>
																		</ASP:BOUNDCOLUMN>
																		<ASP:BOUNDCOLUMN DataField="StartDate" HeaderText="تاريخ شروع">
																			<HEADERSTYLE Width="80px"></HEADERSTYLE>
																			<ITEMSTYLE Width="80px"></ITEMSTYLE>
																		</ASP:BOUNDCOLUMN>
																		<ASP:BOUNDCOLUMN DataField="ScheduleId" HeaderText="ScheduleId" Visible="False">
																			<HEADERSTYLE Width="1px"></HEADERSTYLE>
																			<ITEMSTYLE Width="1px"></ITEMSTYLE>
																		</ASP:BOUNDCOLUMN>
																	</COLUMNS>
																</cc1:automationgrid></TD>
														</TR>
													</TABLE>
													<HR class="CssHorizontalLine" style="WIDTH: 498px; HEIGHT: 2px" SIZE="2">
													<TABLE id="Table3" style="WIDTH: 493px; HEIGHT: 40px" cellSpacing="1" cellPadding="1" width="493"
														border="0">
														<TR>
															<TD align="center"><INPUT class="CssBtnNew" id="btnTopNew" title="" onclick="onClickbtnNew()" type="button">
																<INPUT class="CssbtnEdit" id="btnEdit" onclick="onClickbtnEdit()" type="button">
																<INPUT class="CssBtnDelete" id="btnDelete" onclick="onClickbtnDelete()" type="button">
																<INPUT class="CssBtnCancel" id="btnTOPCancel" style="DISPLAY: none" onclick="OnClickbtnTOPCancel()"
																	type="button" name="btnTOPCancel"></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<td id="DownRow" style="DISPLAY: none" vAlign="top" align="center">
													<TABLE id="Table4" style="WIDTH: 899px; HEIGHT: 365px" cellSpacing="0" cellPadding="0"
														align="center" border="0">
														<TR>
															<TD style="WIDTH: 400px" vAlign="top" align="center">
																<TABLE id="Table9" style="WIDTH: 903px; HEIGHT: 30px" cellSpacing="1" cellPadding="1" width="903"
																	border="0">
																	<TR id="rrrr">
																		<TD style="WIDTH: 84px" align="left">نام برنامه کاري</TD>
																		<TD style="WIDTH: 101px"><INPUT class="txtControls" id="txtProgramName" style="WIDTH: 147px; FONT: messagebox; HEIGHT: 20px"
																				tabIndex="0" size="19" name="txtProgramName" runat="server"></TD>
																		<TD style="WIDTH: 46px" align="left">از تاريخ</TD>
																		<TD style="WIDTH: 162px"><uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
																		<%--<TD style="WIDTH: 52px" align="left">تا تاريخ</TD>
																		<TD style="WIDTH: 160px"><uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>--%>
																		<TD style="WIDTH: 51px" align="left">طول چرخه</TD>
																		<TD style="WIDTH: 59px"><INPUT class="txtControls" id="txtlength" onkeydown="OnKeyDownNum('integer',this.value)" onblur="onblurtxtLength()" 
																				style="WIDTH: 39px; FONT: messagebox; HEIGHT: 20px" tabIndex="1" size="1" name="txtlength" runat="server"></TD>
																		<TD style="WIDTH: 81px" align="left">تعداد گروه
																		</TD>
																		<TD style="WIDTH: 40px"><INPUT class="txtControls" id="txtGroupNumber" onkeydown="OnKeyDownNum('integer',this.value)"
																				onblur="onblurtxtGroupNumber()" style="WIDTH: 39px; FONT: messagebox; HEIGHT: 20px" 
																				tabIndex="2" size="1" name="txtGroupNumber" runat="server"></TD>
																		<TD></TD>
																	</TR>
																</TABLE>
																<HR class="CssHorizontalLine" style="WIDTH: 895px; HEIGHT: 2px" align="center" SIZE="2">
																<TABLE id="Table5" style="WIDTH: 885px; HEIGHT: 66.79%" cellSpacing="1" cellPadding="1"
																	width="885" align="center" border="0">
																	<TR>
																		<TD style="WIDTH: 131px" vAlign="top" align="center">
																			<fieldset style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 164px; HEIGHT: 293px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"><legend style="COLOR: #ff6699">ساختارهاي 
																					موجود</legend>
																				<TABLE id="tbl" style="BORDER-LEFT: gray 2px solid; BACKGROUND-COLOR: white; WIDTH: 160px; HEIGHT: 240px; BORDER-TOP: gray 2px solid">
																					<TR id="tr" vAlign="top">
																						<TD id="td">
																							<div style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 100%; BORDER-COLLAPSE: separate; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 224px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto">
																								<TABLE id="lstExist" onblur="onblurlstExist()" ondblclick="onclickbtnback()" onclick="onclicklstExist()"
																									width="100%">
																								</TABLE>
																							</div>
																						</TD>
																					</TR>
																				</TABLE>
																			</fieldset>
																		</TD>
																		<TD style="WIDTH: 20px" vAlign="middle">
																			<TABLE id="Table6" style="WIDTH: 11px; HEIGHT: 87px" cellSpacing="1" cellPadding="1" width="11"
																				border="0">
																				<TR>
																					<TD><INPUT class="btnNext" id="btnback" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Left.gif); BACKGROUND-COLOR: transparent; WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px"
																							onclick="onclickbtnback()" type="button">
																					</TD>
																				</TR>
																				<TR>
																					<TD>
																						<INPUT class="btnNext" id="btnNext" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Right.gif); WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px"
																							onclick="onclickbtnNext()" type="button">
																					</TD>
																				</TR>
																				<TR>
																					<TD><INPUT class="btnNext" id="btnnNext" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Left2.gif); WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px"
																							onclick="onclickbtnnNext()" type="button">
																					</TD>
																				</TR>
																			</TABLE>
																		</TD>
																		<TD style="WIDTH: 147px" vAlign="top" align="center">
																			<FIELDSET style="WIDTH: 162px; HEIGHT: 220px"><LEGEND style="COLOR: #ff6699">ساختارهاي 
																					انتخاب شده</LEGEND>
																				<table style="WIDTH: 157px; HEIGHT: 188px">
																					<tr>
																						<td style="WIDTH: 119px; FONT: messagebox; HEIGHT: 200px"><SELECT id="lstSelected" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 100%; BORDER-COLLAPSE: separate; FONT: messagebox; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 192px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
																								onclick="onclicklstSelected(this)" tabIndex="4" size="12">
																								<OPTION></OPTION>
																							</SELECT>
																						</td>
																						<td>
																							<TABLE style="WIDTH: 26px; HEIGHT: 57px" cellSpacing="1" cellPadding="1" width="26" border="0">
																								<TR>
																									<TD><INPUT class="CssbtnUP" id="btnUP" style="WIDTH: 21px; HEIGHT: 23px" onclick="onclickbtnUP()"
																											type="button"></TD>
																								</TR>
																								<TR>
																									<TD><INPUT class="CssBtnDown" id="btnDown" style="WIDTH: 21px; HEIGHT: 23px" onclick="onclickbtnDown()"
																											type="button"></TD>
																								</TR>
																							</TABLE>
																						</td>
																					</tr>
																				</table>
																			</FIELDSET>
																			<TABLE style="display :none" id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
																				<TR>
																					<TD>درصد شيفت</TD>
																				</TR>
																				<TR>
																					<TD>
																						<cc1:LCombo id="cmbSchedulePresent" onchange="cmbSchedulePresentOnChange(this)" runat="server"
																							Width="120px" CssClass="txtControls" ConnectionName="GenCnn" LookupName="SchedulePresent"></cc1:LCombo></TD>
																				</TR>
																			</TABLE>
																		</TD>
																		<td style="WIDTH: 20px"></td>
																		<TD style="WIDTH: 336px" vAlign="top" align="center">
																			<fieldset class="CssPage" style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 324px; HEIGHT: 293px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"
																				align="top"><legend style="COLOR: #ff6699">گروههاي شيفتي</legend>
																				<TABLE id="xTabTable_header" dir="rtl" style="WIDTH: 317px; HEIGHT: 25px" cellSpacing="1"
																					cellPadding="1" border="0">
																					<TR>
																						<TD class="CssHeaderStyle" style="WIDTH: 120px" align="center">نام گروه</TD>
																						<TD class="CssHeaderStyle" style="WIDTH: 70px" vAlign="top" align="center">نام مخفف</TD>
																						<TD class="CssHeaderStyle" style="WIDTH: 90px" vAlign="top" align="center">اختلاف 
																							با چرخه</TD>
																						<TD class="CssHeaderStyle" style="WIDTH: 34px" align="center"></TD>
																						<TD class="CssHeaderStyle" style="WIDTH: 34px" align="center"></TD>
																					</TR>
																				</TABLE>
																				<div id="divTB" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 100%; BORDER-COLLAPSE: separate; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 224px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
																					align="center">
																					<table id="XTabTable" align="center">
																					</table>
																				</div>
																			</fieldset>
																			&nbsp;&nbsp;
																		</TD>
																		<TD vAlign="top" align="center">
																			<TABLE id="Table7" style="WIDTH: 160px; HEIGHT: 48px" cellSpacing="3" cellPadding="1" width="160"
																				border="0">
																				<TR>
																					<TD style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; HEIGHT: 25px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"><INPUT id="chkHoliday" tabIndex="5" type="checkbox" name="chkHoliday">&nbsp; 
																						تبعيت از تعطيلات رسمي
																					</TD>
																				</TR>
																				<%--<TR>
																					<TD style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"><INPUT id="chkWeekly" onclick="onclickchkWeekly()" tabIndex="6" type="checkbox" name="chkWeekly">&nbsp; 
																						تبعيت از تعطيلات هفتگي
																					</TD>
																				</TR>
																				<TR>
																					<TD id="Week" style="DISPLAY: none" vAlign="top">
																						<TABLE class="CssPage" id="Table8" style="WIDTH: 157px; HEIGHT: 113px" cellSpacing="1"
																							cellPadding="1" width="157" border="0">
																							<TR>
																								<TD style="WIDTH: 74px"><INPUT id="rdbSat" type="checkbox" name="rdbSat">شنبه</TD>
																								<TD><INPUT id="rdbSun" type="checkbox" name="rdbSun">يکشنبه</TD>
																							</TR>
																							<TR>
																								<TD style="WIDTH: 74px"><INPUT id="rdbMon" type="checkbox" name="rdbMon">دو شنبه</TD>
																								<TD><INPUT id="rdbTus" type="checkbox" name="rdbTus">سه شنبه</TD>
																							</TR>
																							<TR>
																								<TD style="WIDTH: 74px"><INPUT id="rdbWed" type="checkbox" name="rdbWed">جهار شنبه</TD>
																								<TD><INPUT id="rdbTur" type="checkbox" name="rdbTur">پنج شنبه</TD>
																							</TR>
																							<TR>
																								<TD align="center" colSpan="2"><INPUT id="rdbFri" type="checkbox" name="rdbFri">جمعه</TD>
																							</TR>
																						</TABLE>
																					</TD>
																				</TR>--%>
																			</TABLE>
																		</TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD style="DISPLAY: none" vAlign="middle" align="center"><input id="txtSubmit" name="txtSubmit" runat="server">
																<input id="txtXML" name="txtXML" runat="server"> <input id="txtSDate" name="txtSDate" runat="server">
																<input id="txtEDate" name="txtEDate" runat="server"> <input id="RptFlag" name="RptFlag" runat="server">
																<input id="Active" name="Active" runat="server">
																<cc1:mysecurity id="onlineUser" runat="server"></cc1:mysecurity>
																<input id="txtScheduleXML" runat="server"><input id="txtGroupXML" runat="server">
																<input id="txtmodify" runat="server"><input id="XML1" runat="server"> <input id="SId" runat="server"><input id="txtAlert" runat="server">
																<input id="txtSakhtarXML" runat="server"> <input id="txtconfirmdelete" runat="server">
																<input id="lstXML" runat="server"><input id="txtModalflag" name="txtModalflag" runat="server">
																<input id="txtXmlSchedulePresent" name="txtXmlSchedulePresent" runat="server"> <input id="txtTempXmlSchedulePresent" name="txtXmlSchedulePresent" runat="server">
																<input id="txtXmlSaveScheduleProperty" name="txtXmlSaveScheduleProperty" runat="server">
																<input id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server">
																<input id="txtSessionID" name="txtSessionID" runat="server">
															</TD>
														</TR>
													</TABLE>
													<HR class="CssHorizontalLine" style="WIDTH: 907px; HEIGHT: 2px" align="center" SIZE="2">
													
													<INPUT class="cssbtnNew"  id="btnDownNew" onclick="onClickbtnNew()" tabIndex="6" type="button"
														name="btnDownNew" >
														
														
														
														<INPUT class="CssbtnSave" id="btnDownSave" onclick="onclickbtnDownSave()" tabIndex="7"
														type="button" name="btnDownSave"><INPUT class="CssBtnCancel" id="BtnCancel" onclick="onclickCssBtnCancel()" type="button"
														name="BtnCancel">
												</td>
											</TR>
										</TABLE>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</FORM>
	</body>
</HTML>
