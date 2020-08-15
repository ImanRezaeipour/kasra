<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Permission.aspx.vb" Inherits="TA.Permission" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>----------------------------------------------------------------------------------------------À»  
			„ÃÊ“--------------------------------------------------------------------------------------------------------------</title>
		<meta content="True" name="vs_snapToGrid">
		<meta content="True" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="/ta/Styles.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../../../Includes/Script/General.js"></script>
		<script src="../../../Includes/Script/KeySorting.js"></script>
		<SCRIPT language="javascript">
		var tt=0;
		var AjaxFlag=0;
		var fTmpPersonId="0";
		var tmpPersonId="0";
		///////////////////////////////////////////////////////////////
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		////__________________________________________________________________________
		function onclickbtnSearch()
		{
			Form1.txtSDate.value=Form1.SearchStartDate_txtYear.value+"/"+Form1.SearchStartDate_txtMonth.value+"/"+Form1.SearchStartDate_txtDay.value			
			Form1.txtEDate.value=Form1.SearchEndDate_txtYear.value+"/"+Form1.SearchEndDate_txtMonth.value+"/"+Form1.SearchEndDate_txtDay.value
			
			if (Form1.txtSDate.value=="//")
				Form1.txtSDate.value=""
			if (Form1.txtEDate.value=="//")
				Form1.txtEDate.value=""
			var EDTemp,SDTemp
			EDTemp=Form1.SearchEndDate_txtYear.value+Form1.SearchEndDate_txtMonth.value+Form1.SearchEndDate_txtDay.value
			SDTemp=Form1.SearchStartDate_txtYear.value+Form1.SearchStartDate_txtMonth.value+Form1.SearchStartDate_txtDay.value			
			if(	SDTemp>EDTemp)
			{
				alert(" «—ÌŒ ‘—Ê⁄ «“  «—ÌŒ Œ« „Â »“—ê — «” !")
			}
			else
			{
			Form1.txtSubmit.value="Search"
			Form1.submit()
			}
		}
		////__________________________________________________________________________
		function onClickBtnEdit()
		{
			ondblclickGridIssueBox()
		}
		////__________________________________________________________________________
		function onClickGardeshCredit(obj)
		{
			var oRow=window.event.srcElement.parentElement.parentElement.rowIndex 
			var WFDocId=grdIssueBox.rows(oRow).WfDocId;
			var CreditID=grdIssueBox.rows(oRow).CreditID;
					
			newrowindex=0
			
			window.showModalDialog("../Reports/FlowDoc.aspx?WFDocId="+WFDocId+"&DocId="+CreditID,"","dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
		}
		////__________________________________________________________________________
		function onClickBtnSaveAndNew()
		{
			Form1.txtSaveNewFlag.value="SaveNew"
			onClickBtnSave()
		}
		////__________________________________________________________________________
		//Clear Grids
		function Cleargrd(obj)
		{
			var j=obj.rows.length-1
			for(;j>=0;--j)
				obj.deleteRow(j)
			newrowindex=0
		}
		////__________________________________________________________________________
		function CreateBreifTable()
		{
			Cleargrd(BreifTable)
			var xmlStr=Form1.txtBreifKarkard.value
			root='/RationEntity/GetCardexShow'
			newrowindex=0
			
			if (xmlStr=="")
				xmlStr="<RationEntity></RationEntity>"
			
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(xmlStr);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+Form1.selPersonel.value+"]");
											
			var x=0
			if (xmlNodes.length!=0)
			{
				for(;x<xmlNodes.length;++x)
				{
					
					Param='"'+xmlNodes.item(x).selectSingleNode('CardexName').text+'"#"'
							 +xmlNodes.item(x).selectSingleNode('CardexPeriodName').text+'"#"'
								+xmlNodes.item(x).selectSingleNode('Remain').text+'"#'
							
								
					AddRowBreifTable(BreifTable,x+1,Param)
				}
			}
		}
		////__________________________________________________________________________
		function AddRowBreifTable(oGrid,cntRow,Param)
		{
			//Ìò ”ÿ— «÷«›Â „Ìò‰œ
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
						
			//»Â  ⁄œ«œ ¬Ì „Â«Ì „ €Ì— Å«—«„ ” Ê‰ »« „ﬁ«œÌ—‘«‰ «ÌÃ«œ „Ìò‰œ								
			var cell
			cell=0
			var p=new String
			var x=0
			var text=''
			var sText=''
			
			while (x<getCntChar('#',Param))
			{
				p=getArray(Param,x,'#')
				
				
				if (cell==2)
				{
					//Create TypeName Cell
					oGrid.rows(newrowindex).insertCell()
					oGrid.rows(newrowindex).cells(cell).innerHTML="<DIV dir='ltr' style='DISPLAY: inline; align='right'; HEIGHT: 15px'  ms_positioning='FlowLayout'>"+p.substring(1,p.length-1)+"</DIV>"
					cell=cell+1	
					x=x+1
				}
				else
				{
					oGrid.rows(newrowindex).insertCell()
					
					text=p.substring(1,p.length-1)
					if (text.length>8)
						sText=text.substr(0,8)
					else
						sText=text
					
					
					oGrid.rows(newrowindex).cells(cell).innerText=sText
					oGrid.rows(newrowindex).cells(cell).title=text
					cell=cell+1	
					x=x+1
				}
				
								
			}
						
											
			//align
			oGrid.rows(newrowindex).cells(2).align="center"
			oGrid.rows(newrowindex).cells(0).style.width="65px"
			oGrid.rows(newrowindex).cells(1).style.width="65px"
			oGrid.rows(newrowindex).cells(2).style.width="70px"
											
			newrowindex=newrowindex+1
		}
		////__________________________________________________________________________
		/////////////////////////////////////////////////////////////////////////////////
		function OnChangefSelCreditType()
		{
			Form1.tempSelCreditType.value=Form1.fSelCreditType.value
			if(Form1.fSelCreditType.value.length==2)
				Form1.tempSelCreditType.value="0"+Form1.tempSelCreditType.value
		}
		///////////////////////////////////////////////////////////////
			function OnChangefSelsType()
				{
					var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
					var xmlNodes;
					var optionEl;
					var j;
					xmlDoc.loadXML(Form1.XMLCreditType.value);
					xmlNodes=xmlDoc.documentElement.selectNodes("/Cartable/GetCreditType[GrpID='"
																		+Form1.fselType.value+"']");
					document.all('fSelCreditType').innerHTML=""
					optionEl=document.createElement("OPTION")
					document.all('fSelCreditType').options.add(optionEl)
					document.all('fSelCreditType').all(0).innerText='«‰ Œ«» ‰‘œÂ'
					document.all('fSelCreditType').all(0).value=0
					
					var i=1
					var flag=false
					for(j=0;j<xmlNodes.length;j++)
						{
							optionEl=document.createElement("OPTION")
							document.all('fSelCreditType').options.add(optionEl)
							document.all('fSelCreditType').all(i).innerText=xmlNodes.item(j).childNodes(1).text
							document.all('fSelCreditType').all(i).value=xmlNodes.item(j).childNodes(0).text
							if(flag==false & Form1.tempSelCreditType.value==xmlNodes.item(j).childNodes(0).text)
								flag=true
							i++
						}
					if (flag=true & Form1.tempSelCreditType.value!='')
						Form1.fSelCreditType.value=Form1.tempSelCreditType.value
					else	
					{
						Form1.fSelCreditType.value=0
						Form1.tempSelCreditType.value=Form1.fSelCreditType.value
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
			///////////////////////////////////////////////////////////////
			function ModifyRest(obj)
			{
				var x=getCntChar('-',obj.innerText)
				var flag
				if(x>0)
					flag=true
				else
					flag=false
				var s=new String()
				s=ReplaceAll(obj.innerText,'-','')
				if(flag==true)
				{
					obj.innerText=s+' („‰›Ì)  '
					obj.style.color='red'
				}
				else
				{
					obj.innerText=s
					obj.style.color='black'
				}
			}
			//------------------------------------------------------------------------------
			function ClickbtnCart()
				{
					document.all.item("TopRow").style.display="none"
					document.all.item("DownRow").style.display="none"
					document.all.item("TaradodRow").style.display="inline"
					
					strDate=Form1.CurDate.value
					Form1.TStartDate_txtYear.value=strDate.substr(0,4)
					Form1.TStartDate_txtMonth.value=strDate.substr(5,2)
					Form1.TStartDate_txtDay.value=strDate.substr(8,2)
					
					//Form1.TPersonelCode.value =""
					//Form1.selTPersonel.value="0"
					if (Form1.fPersonelCode.value!="")
					{
						Form1.TPersonelCode.value =Form1.fPersonelCode.value;
						Form1.selTPersonel.value=Form1.fPersonelCode.value;
					}
					else
					{
						Form1.TPersonelCode.value =Form1.txtUserPersonelID.value;
						Form1.selTPersonel.value=Form1.txtUserPersonelID.value;
					}
					Form1.RowIndexGrid.value=""
					
					Form1.TDes.value=''
					Form1.TStartTime.value = ''
				}
			//------------------------------------------------------------------------------
			// «› œ „Ì « ›«ﬁ ’›ÕÂ ·Êœ Â‰ê«„
			function OnLoadPage()
			{	
				//alert(1)
				window.name="Permission"
				Form1.target=window.name
				if (Form1.EndDate_txtYear.value=="")
				{
					Form1.EndDate_txtYear.value=Form1.StartDate_txtYear.value
					Form1.EndDate_txtMonth.value=Form1.StartDate_txtMonth.value
					Form1.EndDate_txtDay.value=Form1.StartDate_txtDay.value
				}
				if (Form1.txtfordisable.value=="0")
				{
					document.all.item ("cmbJPersonelDown").disabled=false
					document.all.item ("cmbJPersonel").disabled=false
					TD1.disabled=false
				}
				else
				{
					document.all.item ("cmbJPersonelDown").disabled=true
					document.all.item ("cmbJPersonel").disabled=true
					TD1.disabled=true
				}
				//BGH---------
				
				if(Form1.RowFlag.value =="2")
				{
					Form1.Active.value="DownRow"
					document.getElementById("PersonelCode").value=document.getElementById("fPersonelCode").value
				}
				//------------
				//--«ÌÃ«œ Ê –ŒÌ—Â
				if (Form1.txtSaveNewFlag.value=="SaveNew")
				{
					Form1.txtSaveNewFlag.value=""
					ClickbtnNew()
				}
				//OnChangefSelsType()
				if(Form1.fSelCreditType.selectedIndex<0)
					OnChangefSelsType()
				
				OnChangeSelsType()
				ViewGrid()
				
				if (Form1.txtReturnMessage.value!="")
				{
					OnChangeSelsType()
					Form1.selCreditType.value=Form1.txtCreditType.value
					
					if(Form1.txtAlertMSG.value!="")
						{
							alert(Form1.txtAlertMSG.value)
							Form1.Active.value="TopRow"
							ViewGrid()
						}
					//else
					//{	alert(Form1.txtReturnMessage.value)
						
					//	}
					Form1.txtReturnMessage.value=""
					Form1.txtAlertMSG.value=""
				}
				else
				{
					OnBlurTPersonelCode()
				}
				
				if (Form1.selType.value==4)
				{
					Form1.OpDaily.checked=true 
				}
				if (Form1.txtCreditType.value!="")
					Form1.selCreditType.value=Form1.txtCreditType.value
				OnClickOptions()
				//===================
				//LoadCardex();
				if (Form1.txtfordisable.value=="0")
					if (Form1.Active.value=="TopRow" | Form1.Active.value=="")
						ShowjPersonel("jPersonel")
					else if (Form1.Active.value=="DownRow" & Form1.OpDaily.checked)	
						ShowjPersonel("jPersonelDown")
				
				
				if (Form1.txtSaveAlert.value!="")
				{
					alert(Form1.txtSaveAlert.value)
					Form1.txtSaveAlert.value=""
					if (Form1.txtfordisable.value=="0" && Form1.OpDaily.checked)
						document.all.item("cmbJPersonelDown").value=document.all.item("tmpJPersonel").value;
					CreateBreifTable();	
				}
				
				var SDate=Form1.txtSDate.value
				Form1.SearchStartDate_txtYear.value=SDate.substr(0,4)
				Form1.SearchStartDate_txtMonth.value=SDate.substr(5,2)
				Form1.SearchStartDate_txtDay.value=SDate.substr(8,2)
				
				var EDate=Form1.txtEDate.value
				Form1.SearchEndDate_txtYear.value=EDate.substr(0,4)
				Form1.SearchEndDate_txtMonth.value=EDate.substr(5,2)
				Form1.SearchEndDate_txtDay.value=EDate.substr(8,2)
			}
			//------------------------------------------------------------------------------
			function ViewGrid()
			{	
				BodyID.scroll="no"
				//___________________________________________________
				// Edit „œ
				if (Form1.Active.value=="DownRow")
					{
						document.all.item("TopRow").style.display="none"
						document.all.item("TaradodRow").style.display="none"
						document.all.item("DownRow").style.display="inline"
						return
					}
				//___________________________________________________
				// Edit „œ
				if (Form1.Active.value=="TaradodRow")
					{
						document.all.item("TopRow").style.display="none"
						document.all.item("DownRow").style.display="none"
						document.all.item("TaradodRow").style.display="inline"
						return
					}
					
				//___________________________________________________
				// View „œ 
				document.all.item("DownRow").style.display="none"
				document.all.item("TaradodRow").style.display="none"
				document.all.item("TopRow").style.display="inline"
			}
			//------------------------------------------------------------------------------
			function OnClickOptions()
			{
				if (Form1.OpDaily.checked==true) 	//—Ê“«‰Â
				{
					if(Form1.txtfordisable.value==0)
					{
						document.all.item ("cmbJPersonelDown").disabled=false
						TD1.disabled=false
					}
					if(Form1.StartTime.value!="")
					{
						Form1.StartTime.value=""	
					}
					if(Form1.EndTime.value!="")
					{
						Form1.EndTime.value=""
					}
					Form1.StartTime.disabled=true
					Form1.EndTime.disabled=true
					
					Form1.EndDate_txtYear.disabled=false
					Form1.EndDate_txtMonth.disabled=false
					Form1.EndDate_txtDay.disabled=false
				}
				if (Form1.OpHourly.checked==true) //”«⁄ Ì	
				{
					document.all.item ("cmbJPersonelDown").disabled=true
					TD1.disabled=true
					
					
					Form1.EndDate_txtYear.disabled=true
					Form1.EndDate_txtMonth.disabled=true
					Form1.EndDate_txtDay.disabled=true
					
					Form1.StartTime.disabled=false
					Form1.EndTime.disabled=false
				}
				
				if (document.all.item('selType').value!=0)
				{
					document.all.item('selType').value="0"
					//=========================
					document.all('selCreditType').innerHTML=""	
					optionEl=document.createElement("OPTION")
					document.all('selCreditType').options.add(optionEl)
					document.all('selCreditType').all(0).innerText="·ÿ›« „‰ Ÿ— »„«‰Ìœ"
					document.all('selCreditType').all(0).value=0
					//=========================
					
					Form1.selCreditType.disabled=true
					//loadSelCreditType()
				}	
			}
			////_______________________________________________________________________________________
			function loadSelCreditType()
			{
				Form1.txtSubmit.value="Ajax";
				var SD;
				var ED;
				var TSD;
				var TED;
				
				TSD=Form1.StartDate_txtYear.value
				TSD=TSD.substr(2,2)
				
				TED=Form1.EndDate_txtYear.value
				TED=TED.substr(2,2)
				
				
				SD=TSD+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value
				ED=TED+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
								
				if (SD=="//")
					SD=""
				if (ED=="//")
					ED=""
				
				var PersonId=((Form1.PersonelCode.value=="")? "0":Form1.PersonelCode.value);
				oRequst.open("post","Permission.aspx?AjaxSend=Ajax &SDate="+SD+" &EDate="+ED+" &PersonID="+parseInt(PersonId),false)
				oRequst.onreadyStateChange=AjaxFunction
				oRequst.send(null)
			
			}
			//------------------------------------------------------------------------------
			function LoadCardex()
			{
				Form1.txtCreditType.value="";
				Cleargrd(BreifTable)
				
				Form1.txtSubmit.value="ShowCardex";
				oRequst.open("post","Permission.aspx?AjaxSend=ShowCardex &PersonID="+parseInt(Form1.PersonelCode.value),false)
				oRequst.onreadyStateChange=AjaxFunction
				oRequst.send(null)
			}		
			//------------------------------------------------------------------------------
			function ShowjPersonel(Type)
			{
				Form1.txtXmljPersonel.value="";
				Form1.txtSubmit.value=Type;
				if (Type=="jPersonel")
					document.all.item("cmbJPersonel").disabled=true
				else
					document.all.item("cmbJPersonelDown").disabled=true
				var PersonId=((Type=="jPersonel")? Form1.fPersonelCode.value:Form1.PersonelCode.value)
				PersonId=((PersonId=="")? "0":PersonId)
				
				oRequst.open("post","Permission.aspx?AjaxSend="+Type+" &PersonID="+PersonId,false)
				oRequst.onreadyStateChange=AjaxFunction
				oRequst.send(null)
			}		
			////_______________________________________________________________________________________
			function AjaxFunction()
			{	
				if (oRequst.readyState==4)
				{
					if(oRequst.status==200)
					{
						if (Form1.txtSubmit.value=="Ajax")
						{
							AjaxFlag=1
							var DT;
							var T=0;
							var D=0;
							var GrpID;
							
							if (Form1.OpDaily.checked==true) 	//—Ê“«‰Â
							{
								//DT=602
								D=1
							}
							else if (Form1.OpHourly.checked==true) //”«⁄ Ì	
							{
								T=1
							}
							
							var XmlCredit=''
							XmlCredit=oRequst.responseText
							
							var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
							xmlDoc.loadXML(XmlCredit);
							
							
							xmlDoc.setProperty("SelectionLanguage", "XPath");
							var xmlNodes
							var selTypeVal;
							selTypeVal=Form1.selType.value
							
							//GrpID=selTypeVal.substr(0,2)
							GrpID=selTypeVal
							
							if (D==1)
								xmlNodes=xmlDoc.documentElement.selectNodes("/PermissionEntity/GetTypePermissionAll[Daily="+D+" and CodeGroupID="+parseInt(GrpID)+"]")
							else if (T==1)	
								xmlNodes=xmlDoc.documentElement.selectNodes("/PermissionEntity/GetTypePermissionAll[Timely="+T+" and CodeGroupID="+parseInt(GrpID)+"]");   
							
							
							document.all('selCreditType').innerHTML=""	
							
							////‰‘œÂ «‰ Œ«» ›—⁄Ì ê—ÊÂ
							optionEl=document.createElement("OPTION")
							document.all('selCreditType').options.add(optionEl)
							document.all('selCreditType').all(0).innerText="«‰ Œ«» ‰‘œÂ"
							document.all('selCreditType').all(0).value=0
							//-----------------
							Form1.selCreditType.disabled=false
							
							//Create Items For LSorgeon2
							var i;
							if (xmlNodes.length!=0)
							{
								for(i=0;i<xmlNodes.length;++i)
								{
									optionEl=document.createElement("OPTION")
									document.all('selCreditType').options.add(optionEl)
									document.all('selCreditType').all(i+1).innerText=xmlNodes.item(i).childNodes(1).text
									document.all('selCreditType').all(i+1).value=xmlNodes.item(i).childNodes(0).text			
								}
							}
							if (tt!=0)
								Form1.selCreditType.value=parseInt(tt)
						}
						if (Form1.txtSubmit.value=="ShowCardex")
						{
							Form1.txtSubmit.value="";
							Form1.txtBreifKarkard.value=oRequst.responseText;
							//alert(Form1.txtBreifKarkard.value)
							CreateBreifTable()
						}	
						if (Form1.txtSubmit.value=="jPersonel" | Form1.txtSubmit.value=="jPersonelDown")
						{
							Form1.txtXmljPersonel.value=oRequst.responseText;
							InItcmbJPersonel(Form1.txtSubmit.value);
							Form1.txtSubmit.value="";
						}		
					}
				}
			}
			////_______________________________________________________________________________________
			function InItcmbJPersonel(Type)
			{
				var id=((Type=="jPersonelDown")? "cmbJPersonelDown":"cmbJPersonel")
				
				document.all.item(id).innerHTML="";
				////
				var optionEl;
				optionEl=document.createElement("OPTION")
				document.all(id).options.add(optionEl)
				document.all(id).all(0).innerText="«‰ Œ«» ‰‘œÂ"
				document.all(id).all(0).value=0	
				//=========================
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.txtXmljPersonel.value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				var xmlNodes;
			
				xmlNodes=xmlDoc.documentElement.selectNodes("/NewDataSet/GetParentPersonelDepartment");	
				if (xmlNodes.length!=0)
					for (var i=0;i<xmlNodes.length;i++)
					{
						optionEl=document.createElement("OPTION")
						document.all(id).options.add(optionEl)
						document.all(id).all(i+1).innerText=xmlNodes.item(i).selectSingleNode("PersonelName").text;
						document.all(id).all(i+1).value=xmlNodes.item(i).selectSingleNode("PersonID").text;
					}
				
				document.all.item(id).disabled=false;	
			}
			////_______________________________________________________________________________________
			function OnChangeSelsType()
			{
				//=========================
				document.all('selCreditType').innerHTML=""	
				optionEl=document.createElement("OPTION")
				document.all('selCreditType').options.add(optionEl)
				document.all('selCreditType').all(0).innerText="·ÿ›« „‰ Ÿ— »„«‰Ìœ"
				document.all('selCreditType').all(0).value=0
				//=========================
				
				Form1.selCreditType.disabled=true
				loadSelCreditType()
				if (Form1.selType.value==0)
					Form1.selCreditType.value=0
				if (Form1.selType.value==4)
				{
					Form1.OpDaily.checked=true 
					OnClickOptions() 
				}
			}
			//------------------------------------------------------------------------------
			function OnClickBtnCancel()
			{
				Form1.Active.value="TopRow"
				ViewGrid()
				//if (Form1.txtfordisable.value=="0")
					//ShowjPersonel("jPersonel")
			}
			//------------------------------------------------------------------------------
			function ClickbtnNew()
			{
			
				if (Form1.fPersonelCode.value!="")
				{
					Form1.PersonelCode.value =Form1.fPersonelCode.value;
					Form1.selPersonel.value=Form1.fPersonelCode.value;
				}
				else
				{
					Form1.PersonelCode.value =Form1.txtUserPersonelID.value;
					Form1.selPersonel.value=Form1.txtUserPersonelID.value;
				}
				
				
				Form1.selType.value='0'
				//OnChangeSelsType()
				LoadCardex()
				
				Form1.selCreditType.value=0
				Form1.OpDaily.checked=true
				OnClickOptions()
				Form1.txtCreditID.value="0"
				Form1.RowIndexGrid.value=""
				Form1.Des.value=''
				Form1.StartTime.value = ''
				Form1.EndTime.value = ''
				document.all.item("tmpJPersonel").value="0";
				document.all.item("cmbJPersonelDown").value="0";
				document.all.item("cmbJPersonelDown").disabled=true;
				if (Form1.txtfordisable.value=="0")
					ShowjPersonel("jPersonelDown")
				
				if (Form1.SearchStartDate_txtYear.value=="")
				{
					strDate=Form1.CurDate.value
					Form1.StartDate_txtYear.value=strDate.substr(0,4)
					Form1.StartDate_txtMonth.value=strDate.substr(5,2)
					Form1.StartDate_txtDay.value=strDate.substr(8,2)
					
					Form1.EndDate_txtYear.value=strDate.substr(0,4)
					Form1.EndDate_txtMonth.value=strDate.substr(5,2)
					Form1.EndDate_txtDay.value=strDate.substr(8,2)
				}
				else
				{
					Form1.StartDate_txtYear.value=Form1.SearchStartDate_txtYear.value
					Form1.StartDate_txtMonth.value=Form1.SearchStartDate_txtMonth.value
					Form1.StartDate_txtDay.value=Form1.SearchStartDate_txtDay.value
					
					Form1.EndDate_txtYear.value=Form1.SearchEndDate_txtYear.value
					Form1.EndDate_txtMonth.value=Form1.SearchEndDate_txtMonth.value
					Form1.EndDate_txtDay.value=Form1.SearchEndDate_txtDay.value
				}
				
				Form1.Active.value="DownRow"
				//Cleargrd(BreifTable)
				ViewGrid()
			}
			//------------------------------------------------------------------------------
			function OnBlurfPersonelCode()
			{
				if (fTmpPersonId!=Form1.fPersonelCode.value)
				{
					fTmpPersonId=Form1.fPersonelCode.value;
					Form1.fselPersonel.value=Form1.fPersonelCode.value;
					if (Form1.txtfordisable.value=="0")
						ShowjPersonel("jPersonel")
				}		
			}	
			//------------------------------------------------------------------------------
			function OnBlurPersonelCode()
			{
				
					tmpPersonId=Form1.PersonelCode.value;
					Form1.selPersonel.value=Form1.PersonelCode.value
					if (Form1.selPersonel.value!="")
					{
						LoadCardex()
						if (Form1.txtfordisable.value=="0"  && Form1.OpDaily.checked)
							ShowjPersonel("jPersonelDown")
					}
					else
					{
						Form1.PersonelCode.value=""
					}
				
			}		
			//------------------------------------------------------------------------------
			function OnBlurTPersonelCode()
			{
				Form1.selTPersonel.value=Form1.TPersonelCode.value
			}	
			//------------------------------------------------------------------------------
			function OnChangefSelPersonel()
			{
				if (fTmpPersonId!=Form1.fselPersonel.value)
				{
					fTmpPersonId=Form1.fselPersonel.value;
					Form1.fPersonelCode.value=Form1.fselPersonel.value
					if (Form1.txtfordisable.value=="0")
						ShowjPersonel("jPersonel")
				}		
			}				
			//------------------------------------------------------------------------------
			function OnChangeSelPersonel()
			{
				if (tmpPersonId!=Form1.selPersonel.value)
				{
					tmpPersonId=Form1.selPersonel.value;
					Form1.PersonelCode.value=Form1.selPersonel.value
					LoadCardex()
					if (Form1.txtfordisable.value=="0"  && Form1.OpDaily.checked)
						ShowjPersonel("jPersonelDown")
				}	
			}	
			//------------------------------------------------------------------------------
			function OnChangeTSelPersonel()
				{
					Form1.TPersonelCode.value=Form1.selTPersonel.value
				}			
			//------------------------------------------------------------------------------
			function ClickGridIssueBox(SelectedRow)
			{	
				if (Form1.RowIndexGrid.value!="")
					grdIssueBox.rows(parseInt(Form1.RowIndexGrid.value)).style.backgroundColor=''
				
				SelectedRow.style.backgroundColor='#ffd599'
				Form1.RowIndexGrid.value=SelectedRow.rowIndex
				Form1.txtPersonID.value=SelectedRow.cells(2).innerText
				Form1.txtType.value=SelectedRow.Type
				Form1.txtCreditID.value=SelectedRow.CreditID
				
				var SD=SelectedRow.cells(5).innerText
				var ED=SelectedRow.cells(6).innerText
				
				Form1.StartDate_txtDay.value=SD.substr(0,2)
				Form1.StartDate_txtMonth.value=SD.substr(3,2)
				Form1.StartDate_txtYear.value=SD.substr(6,4)
				
				Form1.EndDate_txtDay.value=ED.substr(0,2)
				Form1.EndDate_txtMonth.value=ED.substr(3,2)
				Form1.EndDate_txtYear.value=ED.substr(6,4)
				
				
				Form1.StartTime.value=SelectedRow.cells(7).innerText
				Form1.EndTime.value=SelectedRow.cells(8).innerText
				var ST=Form1.StartTime.value
				var ET=Form1.EndTime.value
				
				if (ST=="")
					ST="00:00"
				if (ET=="")
					ET="00:00"
				if (ST!="00:00" && ET!="00:00") //”«⁄ Ì
				{
					Form1.OpHourly.checked=true
					Form1.OpDaily.checked=false
					//========
					Form1.StartTime.disabled=false
					Form1.EndTime.disabled=false
					///========
					Form1.StartDate_txtYear.disabled=false
					Form1.StartDate_txtMonth.disabled=false
					Form1.StartDate_txtDay.disabled=false
					
					Form1.EndDate_txtYear.disabled=false
					Form1.EndDate_txtMonth.disabled=false
					Form1.EndDate_txtDay.disabled=false
				}
				else if (ST=="00:00" && ET=="00:00")//—Ê“«‰Â
				{
					Form1.OpHourly.checked=false
					Form1.OpDaily.checked=true
					//========
					Form1.StartTime.disabled=true
					Form1.EndTime.disabled=true
					///========
					Form1.EndDate_txtYear.disabled=true
					Form1.EndDate_txtMonth.disabled=true
					Form1.EndDate_txtDay.disabled=true
				}
				
				
				Form1.PersonelCode.value=SelectedRow.cells(2).innerText
				Form1.selPersonel.value=SelectedRow.cells(2).innerText
				var SType=SelectedRow.Type
				
				if (SType==4 || SType==32)
					SType="53"+SType
				else if (SType==8)
					SType="52"+SType
				
				Form1.selType.value=SType
				Form1.Des.value=SelectedRow.Des
						
				
				if (Form1.Des.value=="&nbsp;")
				{
					 Form1.Des.value=''
				
				}
				
				// —œœ
				Form1.TPersonelCode.value=SelectedRow.cells(2).innerText
				Form1.selTPersonel.value=SelectedRow.cells(2).innerText
				Form1.TStartTime.value=SelectedRow.cells(7).innerText
				Form1.TDes.value=SelectedRow.Des
				Form1.TStartDate_txtDay.value=SD.substr(0,2)
				Form1.TStartDate_txtMonth.value=SD.substr(3,2)
				Form1.TStartDate_txtYear.value=SD.substr(6,4)
				OnClickOptions()
				if (document.all.item ("cmbJPersonelDown").disabled==true)
				{
					document.all.item ("cmbJPersonelDown").disabled==false
					document.all.item ("cmbJPersonelDown").value=SelectedRow.jPersonelID
					document.all.item ("cmbJPersonelDown").disabled==true
				}
				else
					document.all.item ("cmbJPersonelDown").value=SelectedRow.jPersonelID
					
				tt=SelectedRow.CreditType
			}	
			////_____________________________________________________________________________
			function ondblclickGridIssueBox()
			{
				//CreateBreifTable()
				if(Form1.RowIndexGrid.value!="")
				{
					LoadData()	
					
					if (Form1.txtType.value!="16")
					{
						document.all.item("SelTypeCreditTD").style.display="inline"
						Form1.Active.value="DownRow"
						document.all.item("TopRow").style.display="none"
						document.all.item("DownRow").style.display="inline"
						document.all.item("TaradodRow").style.display="none"
						LoadCardex()
					}
					else
					{
						document.all.item("SelTypeCreditTD").style.display="none"
						document.all.item("TopRow").style.display="none"
						document.all.item("DownRow").style.display="none"
						document.all.item("TaradodRow").style.display="inline"
					}
					
					/*if (Form1.txtType.value!="16")
						OnChangeSelsType()
					else
						document.all('selCreditType').innerHTML=""	*/
					//OnClickOptions()
					}
					else alert("«» œ« ”ÿ— „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ!")
				
			}	
			//------------------------------------------------------------------------------
			// ò‰œ „Ì ·Êœ „—»ÊÿÂ ò‰ —·Â«Ì œ— —« Â« œ«œÂ
			function LoadData()
				{
					var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
					var xmlNodes;
					var strDate=''
					//___________________________________________________													
					Form1.Des.value=''
					Form1.StartTime.value=''
					Form1.EndTime.value=''
					//___________________________________________________													
					//œ—ŒÊ«”  «Ê·ÌÂ „‘Œ’«  
					xmlDoc.loadXML(Form1.XMLCredit.value);
					xmlNodes=xmlDoc.documentElement.selectSingleNode("/Cartable/GetIssueBox[CreditID="
					+grdIssueBox.rows(parseInt(Form1.RowIndexGrid.value)).CreditID+"]");
					if(xmlNodes.selectSingleNode("Type").text==16)
					{
						Form1.TDes.value = xmlNodes.selectSingleNode("Des").text
						Form1.TStartTime.value = xmlNodes.selectSingleNode("StartTime").text
						Form1.TPersonelCode.value = xmlNodes.selectSingleNode("PersonelNo").text
						Form1.selTPersonel.value = xmlNodes.selectSingleNode("PersonelNo").text
						strDate=xmlNodes.selectSingleNode("SDate").text
						Form1.TStartDate_txtYear.value=strDate.substr(6,4)
						Form1.TStartDate_txtMonth.value=strDate.substr(3,2)
						Form1.TStartDate_txtDay.value=strDate.substr(0,2)
						Form1.Active.value="TaradodRow"
					}
					else
					{
						Form1.Des.value = xmlNodes.selectSingleNode("Des").text
						Form1.StartTime.value = xmlNodes.selectSingleNode("StartTime").text
						Form1.EndTime.value = xmlNodes.selectSingleNode("EndTime").text
						Form1.PersonelCode.value = xmlNodes.selectSingleNode("PersonelNo").text
						Form1.selPersonel.value = xmlNodes.selectSingleNode("PersonelNo").text
						strDate=xmlNodes.selectSingleNode("SDate").text
						Form1.StartDate_txtYear.value=strDate.substr(6,4)
						Form1.StartDate_txtMonth.value=strDate.substr(3,2)
						Form1.StartDate_txtDay.value=strDate.substr(0,2)
						
						strDate=xmlNodes.selectSingleNode("EDate").text
						Form1.EndDate_txtYear.value=strDate.substr(6,4)
						Form1.EndDate_txtMonth.value=strDate.substr(3,2)
						Form1.EndDate_txtDay.value=strDate.substr(0,2)
						
						if (xmlNodes.selectSingleNode("StartTime").text=='' | xmlNodes.selectSingleNode("StartTime").text=='00:00')
							Form1.OpDaily.checked=true
						else
							Form1.OpHourly.checked=true
						OnClickOptions()
						
						var Type=((xmlNodes.selectSingleNode("Type").text=="8")? "52"+xmlNodes.selectSingleNode("Type").text:"53"+xmlNodes.selectSingleNode("Type").text)
						Form1.selType.value = Type;//xmlNodes.selectSingleNode("Type").text
						OnChangeSelsType()
						Form1.selCreditType.value = xmlNodes.selectSingleNode("CreditType").text
						
						Form1.Active.value="DownRow"
					}
					
				}	
			//------------------------------------------------------------------------------
			function onClickBtnSave()
			{
				if(Form1.PersonelCode.value=="" || Form1.PersonelCode.value==0 )
				{
					alert("·ÿ›« Å—”‰· „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ")
					return
				}
				if (   (Form1.OpHourly.checked==true) 
					&& (Form1.StartTime.value=='' 
						||  Form1.EndTime.value=='' 
						|| Form1.StartTime.value=='00:00' 
						||  Form1.EndTime.value=='00:00' 
						)
					)
				{
				
					alert('Ê«—œ ﬂ—œ‰ “„«‰ ‘—Ê⁄ Ê Œ« „Â «·“«„Ì „Ì »«‘œ')
					return;
				}	
				
				if (   (Form1.OpHourly.checked==true) 
					&& (Form1.StartTime.value>Form1.EndTime.value)
					)
				{	
					if(!confirm("¬Ì« „‰ŸÊ— «‰ „œ«Ê„  ò«—Ì œ— —Ê“ »⁄œ «” ø"))
						{
							alert("!”«⁄  ‘—Ê⁄ »«Ìœ òÊçò — «“ ”«⁄  Å«Ì«‰ »«‘œ")
							return;
						}
				}	
				
				if (Form1.selType.value==8 && Form1.selCreditType.value==31 && Form1.Des.value=='')
				{
					alert('Ê«—œ ﬂ—œ‰  Ê÷ÌÕ«  «·“«„Ì „Ì »«‘œ')
					return;
				}	
				
				Form1.txtCreditType.value=document.all('selCreditType').value
				document.all.item("tmpJPersonel").value=document.all.item("cmbJPersonelDown").value;
				
				if (Form1.OpHourly.checked==true)
				{
					Form1.EndDate_txtYear.value=Form1.StartDate_txtYear.value
					Form1.EndDate_txtMonth.value=Form1.StartDate_txtMonth.value
					Form1.EndDate_txtDay.value=Form1.StartDate_txtDay.value
				}
				//============================================
				//Chek Date
				var SD=Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value
				var ED=Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
				
				SD=ReplaceAll(SD,'/','')
				ED=ReplaceAll(ED,'/','')
				
				if (parseInt(ED)<parseInt(SD))
				{
					alert(" «—ÌŒ ‘—Ê⁄ «“  «—ÌŒ Œ« „Â »“—ê — «” !")
					return;
				}
				//============================================
				//Chek Time
				var ST=Form1.StartTime.value
				var ET=Form1.EndTime.value
				
				//============================================
				
				if (Form1.selType.value==0)
				{
					alert("„ÃÊ“ —« Ê«—œ ‰„«ÌÌœ.")
					return;
				}
				if (Form1.selCreditType.value==0)
				{
					alert("‰Ê⁄ „ÃÊ“ —« Ê«—œ ‰„«ÌÌœ.")
					return;
				}
				
				
				var Type='';
				var SD='';
				var ED='';
				var SaveXml='';
				
				ED=Form1.EndDate_txtDay.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtYear.value
				SD=Form1.StartDate_txtDay.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtYear.value
			
				Type=Form1.selType.value//.substr(2,Form1.selType.value.length)
							
				SaveXml+="<ReportsEntity><Credit>"
				
				SaveXml+="<Type>"+Type+"</Type>"
				SaveXml+="<StartDate>"+SD+"</StartDate>"
				SaveXml+="<EndDate>"+ED+"</EndDate>"
				SaveXml+="<CreditType>"+Form1.selCreditType.value+"</CreditType>"
				SaveXml+="<StartTime>"+Form1.StartTime.value+"</StartTime>"
				SaveXml+="<EndTime>"+Form1.EndTime.value+"</EndTime>"
				SaveXml+="<PersonID>"+Form1.PersonelCode.value+"</PersonID>"
				SaveXml+="<Des>"+Form1.Des.value+"</Des>"
				SaveXml+="<UserPersonelID>"+Form1.txtUserPersonelID.value+"</UserPersonelID>"
				SaveXml+="<CreditID>"+Form1.txtCreditID.value+"</CreditID>"
				var Jcmb=document.all.item ("cmbJPersonelDown")
				SaveXml+="<JPersonelID>"+((Form1.OpDaily.checked)? Jcmb.value:"0")+"</JPersonelID>"
				
				
				
				if (Form1.OpHourly.checked==true) //”«⁄ Ì
				{
					SaveXml+="<Daily>2</Daily>"
				}
				else if (Form1.OpDaily.checked==true) //—Ê“«‰Â
				{
					SaveXml+="<Daily>1</Daily>"
				}
				
				SaveXml+="</Credit></ReportsEntity>"
				//-----
				Form1.txtSaveXml.value=SaveXml
				
				
				Form1.txtSubmit.value="Save"
				Form1.submit()
					
			}
			//------------------------------------------------------------------------------
			function CheckForSaveT()
			{
				if (Form1.selTPersonel.value=="")	
				{
					alert("òœ Å—”‰·Ì „⁄ »— ‰Ì” !")
					Form1.TPersonelCode.focus()
					return;
				}
				if ((Form1.TStartTime.value=='00:00') || (Form1.TStartTime.value==''))
				{
					alert("”«⁄  ’ÕÌÕ —« Ê«—œ ò‰Ìœ !")
					Form1.TStartTime.focus()
					return;
				}
				
				Form1.TDate.value=Form1.TStartDate_txtDay.value+"/"+Form1.TStartDate_txtMonth.value+"/"+Form1.TStartDate_txtYear.value
				
				Form1.TbtnSave.click()
			}
			//------------------------------------------------------------------------------
		</SCRIPT>
	</HEAD>
	<body id="BodyID" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="yes"
		onload="OnLoadPage()" rightMargin="0" ms_positioning="GridLayout">
		<FORM id="Form1" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" height="8" cellSpacing="1" cellPadding="1" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline" vAlign="top">
												<TABLE id="Table2" cellSpacing="2" cellPadding="2" align="center" border="0">
													<TR>
														<TD style="HEIGHT: 65px" align="left"><TABLE id="Table15" style="WIDTH: 750px; HEIGHT: 83px" cellSpacing="0" cellPadding="0"
																align="center" border="0">
																<TR>
																	<TD style="WIDTH: 54px">«“  «—ÌŒ</TD>
																	<TD style="WIDTH: 133px"><uc1:textdate id="SearchStartDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 40px; HEIGHT: 33px" align="left"> «  «—ÌŒ</TD>
																	<TD style="WIDTH: 147px">
																		<uc1:textdate id="SearchEndDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 60px; HEIGHT: 33px" align="left">„ÃÊ“
																	</TD>
																	<TD style="WIDTH: 112px; HEIGHT: 33px" align="center"><cc1:lcombo id="fselType" runat="server" DataValueField="val" DataTextField="title" Width="128px"
																			CssClass="txtControls" ConnectionName="GenCnn" onchange="OnChangefSelsType()" Height="24px" FirstSelect="True"></cc1:lcombo></TD>
																	<TD style="WIDTH: 54px; HEIGHT: 33px" align="left">‰Ê⁄ „ÃÊ“</TD>
																	<TD style="WIDTH: 93px; HEIGHT: 33px" align="right"><cc1:lcombo id="fSelCreditType" runat="server" Width="103px" CssClass="txtControls" ConnectionName="GenCnn"
																			onchange="OnChangefSelCreditType()" Height="24px" FirstSelect="True" LookupName="ExtraVac"></cc1:lcombo></TD>
																	<TD align="center"></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 54px">‘.Å—”‰·Ì</TD>
																	<TD style="WIDTH: 133px"><INPUT class="txtControls" id="fPersonelCode" onblur="OnBlurfPersonelCode()" style="WIDTH: 83px; HEIGHT: 21px"
																			size="8" name="fPersonelCode" runat="server"></TD>
																	<TD style="WIDTH: 40px; HEIGHT: 33px" align="left">‰«„</TD>
																	<TD style="WIDTH: 147px"><cc1:lcombo onkeypress="return KeySort(this,false)" id="fselPersonel" onblur="OnChangefSelPersonel()"
																			runat="server" DataValueField="PersonelNo" DataTextField="PersonelName" Width="128px" CssClass="txtControls"
																			ConnectionName="GenCnn" onchange="OnChangefSelPersonel()"></cc1:lcombo></TD>
																	<TD style="WIDTH: 60px; HEIGHT: 33px" align="left">‰«„ Ã«‰‘Ì‰</TD>
																	<TD style="WIDTH: 112px; HEIGHT: 33px" align="center"><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbJPersonel" runat="server" Width="128px"
																			CssClass="txtControls" ConnectionName="GenCnn"></cc1:lcombo></TD>
																	<TD style="WIDTH: 54px; HEIGHT: 33px" align="left"></TD>
																	<TD style="WIDTH: 93px; HEIGHT: 33px" align="left">
																		<INPUT class="CssBtnLimitSerach" id="btnSearch" onclick="onclickbtnSearch()" dir="rtl"
																			title="‰„«Ì‘ „ÕœÊœ" style="WIDTH: 100px; CURSOR: hand; HEIGHT: 32px" type="button"
																			name="btnSearch" runat="server">
																	</TD>
																	<TD align="center"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 434px" vAlign="top" align="center">
															<cc1:automationgrid id="grdIssueBox" dir="rtl" runat="server" Width="936px" Height="416px" AutoGenerateColumns="False"
																SendXML="DoNotSend" SelectRowOnClick="True" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
																ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="True" CreateClientSideScripts="False"
																ClientSorting="False" HtcAddress=" ">
																<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Right"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="EditItemStyle "></FOOTERSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:TEMPLATECOLUMN HeaderText="‰Ê⁄ „ÃÊ“">
																		<HEADERSTYLE Width="65px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="65px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG title=" „ÃÊ“ ”«⁄ Ì" src="../../../Includes/Images/Icons/time.gif" width="15" align="middle"
																				border="0">
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="—Ê‰œ">
																		<HEADERSTYLE Width="65px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="65px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG title="„‘«ÂœÂ ê—œ‘" onclick="onClickGardeshCredit(this)" src="../../../Includes/Images/Icons/btnNodes.gif"
																				align="middle" border="0">
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‘„«—Â Å—”‰·Ì" DataField="PersonelNo">
																		<HEADERSTYLE Width="90px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="90px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰«„" DataField="PersonelName">
																		<HEADERSTYLE Width="120px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="120px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰«„ Ã«‰‘Ì‰" DataField="jPersonelName">
																		<HEADERSTYLE Width="120px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="120px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «—ÌŒ ‘—Ê⁄" DataField="SDate">
																		<HEADERSTYLE Width="90px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="90px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «—ÌŒ Å«Ì«‰" DataField="EDate">
																		<HEADERSTYLE Width="90px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="90px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="”«⁄  ‘—Ê⁄" DataField="StartTime">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="”«⁄  Å«Ì«‰" DataField="EndTime">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="„ÃÊ“">
																		<HEADERSTYLE Width="80px"></HEADERSTYLE>
																		<ITEMSTYLE Width="80px"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label5 title='<%# DataBinder.Eval(Container, "DataItem.TypeName") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.STypeName") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰Ê⁄ „ÃÊ“" DataField="CreditTypeName">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="CreditID" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="WfDocId" DataField="WfDocId" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Type" DataField="Type" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Des" DataField="Des" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="CreditType" DataField="CreditType" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="jPersonelID" DataField="jPersonelID" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid></TD>
													</TR>
													<TR>
														<TD>
															<HR class="CssHorizontalLine">
															<TABLE id="Table7" style="WIDTH: 61px; HEIGHT: 46px" height="46" cellSpacing="5" cellPadding="2"
																width="61" align="center" border="0">
																<TR height="30">
																	<TD style="WIDTH: 97px" width="97"><INPUT class="CssBtnCart" id="BtnCart" style="WIDTH: 90px" onclick="ClickbtnCart()" type="button"></TD>
																	<TD width="33%"><INPUT class="CssBtnNew" id="btnNew" onclick="ClickbtnNew()" type="button"></TD>
																	<TD width="33%"><INPUT class="CssBtnEdit" id="BtnEdit" onclick="onClickBtnEdit()" type="button" name="BtnEdit"></TD>
																	<TD width="33%"><asp:button id="btnDelete" runat="server" CssClass="CssBtnDelete" Height="100%"></asp:button></TD>
																	<TD width="33%"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="DownRow" style="DISPLAY: inline" vAlign="top" align="center">
												<TABLE id="Table9" style="WIDTH: 535px; HEIGHT: 377px" cellSpacing="1" cellPadding="1"
													width="535" align="center" border="0">
													<TR>
														<TD>
															<TABLE id="Table10" style="WIDTH: 503px; HEIGHT: 154px" cellSpacing="2" cellPadding="2"
																width="503" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 66px; HEIGHT: 23px" align="left">‘.Å—”‰·Ì
																	</TD>
																	<TD style="WIDTH: 168px; HEIGHT: 23px" align="right"><INPUT class="txtControls" id="PersonelCode" onblur="OnBlurPersonelCode()" style="WIDTH: 150px; HEIGHT: 20px"
																			size="19" name="PersonelCode" runat="server"></TD>
																	<TD style="WIDTH: 58px; HEIGHT: 23px" align="left">‰«„ Å—”‰·</TD>
																	<TD style="HEIGHT: 23px" align="right"><cc1:lcombo onkeypress="return KeySort(this,false)" id="selPersonel" onblur="OnChangeSelPersonel()"
																			runat="server" DataValueField="PersonelNo" DataTextField="PersonelName" Width="150px" CssClass="txtControls" ConnectionName="GenCnn"
																			onchange="OnChangeSelPersonel()" FirstSelect="True"></cc1:lcombo></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 66px; HEIGHT: 22px" align="left">‰Ê⁄</TD>
																	<TD style="WIDTH: 168px; HEIGHT: 22px" align="right"><INPUT id="OpDaily" onclick="OnClickOptions()" type="radio" CHECKED value="OpDaily" name="RadioGroup"
																			runat="server">—Ê“«‰Â <INPUT id="OpHourly" onclick="OnClickOptions()" type="radio" value="OpHourly" name="RadioGroup"
																			runat="server">”«⁄ Ì</TD>
																	<TD id="TD1" style="WIDTH: 58px; HEIGHT: 22px" align="left" runat="server">‰«„ 
																		Ã«‰‘Ì‰</TD>
																	<TD style="HEIGHT: 22px" align="right"><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbJPersonelDown" runat="server" Width="150px"
																			CssClass="txtControls" ConnectionName="GenCnn"></cc1:lcombo></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 66px; HEIGHT: 3px" align="left"> «—ÌŒ ‘—Ê⁄</TD>
																	<TD style="WIDTH: 168px; HEIGHT: 3px" align="right"><uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 58px; HEIGHT: 3px" align="left"> «—ÌŒ « „«„</TD>
																	<TD style="HEIGHT: 3px" align="right"><uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 66px; HEIGHT: 13px" align="left">„ÃÊ“</TD>
																	<TD style="WIDTH: 168px; HEIGHT: 13px" align="right">
																		<cc1:lcombo id="selType" runat="server" Width="150px" CssClass="txtControls" ConnectionName="GenCnn"
																			onchange="OnChangeSelsType()" Height="24px" FirstSelect="False"></cc1:lcombo>
																	</TD>
																	<TD style="WIDTH: 58px; HEIGHT: 13px" align="left">‰Ê⁄ „ÃÊ“</TD>
																	<TD id="SelTypeCreditTD" style="HEIGHT: 13px" align="right">
																		<cc1:lcombo id="selCreditType" runat="server" Width="150px" CssClass="txtControls" ConnectionName="GenCnn"
																			Height="24px" FirstSelect="False"></cc1:lcombo>
																	</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 66px" align="left">”«⁄  ‘—Ê⁄
																	</TD>
																	<TD style="WIDTH: 168px" align="right"><input class="txtControls" id="StartTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
																			style="WIDTH: 150px" maxLength="5" name="StartTime" runat="server"></TD>
																	<TD style="WIDTH: 58px" align="left">”«⁄  « „«„</TD>
																	<TD align="right"><input class="txtControls" id="EndTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
																			style="WIDTH: 150px" maxLength="5" name="EndTime" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD>
															<TABLE id="Table11" style="WIDTH: 521px; HEIGHT: 136px" cellSpacing="1" cellPadding="1"
																width="521" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 72px" align="left"> Ê÷ÌÕ« </TD>
																	<TD style="WIDTH: 141px" vAlign="top" align="right"><asp:textbox id="Des" runat="server" Width="153px" CssClass="txtControls" Height="104px"></asp:textbox></TD>
																	<TD style="WIDTH: 74px" align="left">Å«—«„ —Â«Ì œ«—«Ì „«‰œÂ</TD>
																	<TD align="right">
																		<TABLE id="BreifTable_Header" style="WIDTH: 170px; HEIGHT: 29px" cellSpacing="1" cellPadding="1"
																			width="170" border="0">
																			<TR>
																				<TD class="Headerstyle" style="WIDTH: 52px" align="center">ò«—œò”</TD>
																				<TD class="Headerstyle" style="WIDTH: 43px" align="center">œÊ—Â</TD>
																				<TD class="Headerstyle" align="center">„ﬁœ«—</TD>
																			</TR>
																		</TABLE>
																		<DIV style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 81.54%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 72.36%">
																			<TABLE id="BreifTable">
																				<THEAD style="DISPLAY: none">
																				</THEAD>
																			</TABLE>
																		</DIV>
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD>
															<HR class="CssHorizontalLine" SIZE="2">
															<TABLE id="Table5" style="WIDTH: 224px; HEIGHT: 40px" height="40" cellSpacing="2" cellPadding="2"
																width="224" align="center" border="0">
																<TR height="30">
																	<TD width="33%"><INPUT class="CssBtnSaveAndNew" id="BtnSaveAndNew" title="–ŒÌ—Â Ê «ÌÃ«œ" style="WIDTH: 107px; HEIGHT: 32px"
																			onclick="onClickBtnSaveAndNew()" type="button" name="BtnSaveAndNew"></TD>
																	<TD width="33%"><INPUT class="CssbtnSave" id="BtnSave" onclick="onClickBtnSave()" type="button" name="BtnSave"></TD>
																	<TD width="33%"><INPUT class="CssbtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button"></TD>
																</TR>
															</TABLE>
															<cc1:mysecurity id="OnlineUser" runat="server"></cc1:mysecurity></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="TaradodRow" style="DISPLAY: inline; HEIGHT: 2px" vAlign="top" align="center">
												<TABLE id="Table1" style="WIDTH: 431px; HEIGHT: 229px" cellSpacing="1" cellPadding="1"
													width="431" align="center" border="0">
													<TR>
														<TD>
															<TABLE id="Table3" style="WIDTH: 432px; HEIGHT: 64px" cellSpacing="2" cellPadding="2" width="432"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 54px; HEIGHT: 1px" align="left">òœ Å—”‰·</TD>
																	<TD style="WIDTH: 150px; HEIGHT: 1px" align="right"><INPUT class="txtControls" id="TPersonelCode" onblur="OnBlurTPersonelCode()" style="WIDTH: 129px; HEIGHT: 22px"
																			size="16" name="TPersonelCode" runat="server"></TD>
																	<TD style="WIDTH: 51px; HEIGHT: 1px" align="left">‰«„ Å—”‰·</TD>
																	<TD style="HEIGHT: 1px" align="right"><cc1:lcombo onkeypress="return KeySort(this,false)" id="selTPersonel" onblur="OnChangeTSelPersonel()"
																			runat="server" DataValueField="PersonelNo" DataTextField="PersonelName" Width="150px" CssClass="txtControls" ConnectionName="GenCnn"
																			onchange="OnChangeTSelPersonel()" FirstSelect="False"></cc1:lcombo></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 54px" align="left"> «—ÌŒ</TD>
																	<TD style="WIDTH: 150px" align="right"><uc1:textdate id="TStartDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 51px" align="left">”«⁄ 
																	</TD>
																	<TD align="right"><INPUT class="txtControls" id="TStartTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
																			style="WIDTH: 150px" maxLength="5" name="TStartTime" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD>
															<TABLE id="Table12" style="WIDTH: 427px; HEIGHT: 72px" cellSpacing="1" cellPadding="1"
																width="427" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 56px" align="left"> Ê÷ÌÕ« </TD>
																	<TD><asp:textbox id="TDes" runat="server" Width="364px" CssClass="txtControls" Height="66px"></asp:textbox></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD>
															<HR class="CssHorizontalLine" SIZE="2">
															<TABLE id="Table13" style="WIDTH: 66px; HEIGHT: 46px" height="46" cellSpacing="2" cellPadding="2"
																width="66" align="center" border="0">
																<TR height="30">
																	<TD><INPUT class="CssbtnSave" id="TSaveBtn" onclick="CheckForSaveT()" type="button"></TD>
																	<TD><INPUT class="CssbtnCancel" id="BtnTCancel" onclick="OnClickBtnCancel()" type="button"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none">
						<input id="txtSessionID" name="txtSessionID" runat="server"> <input id="txtSDate" runat="server" NAME="txtSDate">
						<input id="txtEDate" runat="server" NAME="txtEDate"> <input id="txtUserPersonelID" size="1" name="txtUserPersonelID" runat="server"><input id="txtSubmit" size="1" name="txtSubmit" runat="server">
						<input id="txtSaveAlert" size="1" name="txtSaveAlert" runat="server"> <input id="TDate" size="1" name="TSDate" runat="server">
						<INPUT id="txtReturnMessage" size="1" name="txtReturnMessage" runat="server"> <INPUT id="Active" size="1" name="Active" runat="server">
						<INPUT id="XMLCreditType" size="1" name="XMLCreditType" runat="server"> <INPUT id="txtCreditType" size="1" name="txtCreditType" runat="server">
						<input id="RowIndexGrid" size="1" name="RowIndexGrid" runat="server"> <input id="XMLCredit" size="1" name="XMLCredit" runat="server">
						<input id="txtSaveNewFlag" size="1" name="txtSaveNewFlag" runat="server"> <input id="txtXmlWfLog" size="1" name="txtXmlWfLog" runat="server">
						<input id="txtfordisable" runat="server" NAME="txtfordisable"> <input id="txtPersonID" name="txtPersonID" runat="server">
						<input id="txtType" name="txtType" runat="server"><input id="txtCreditID" name="txtCreditID" runat="server">
						<input id="RowFlag" name="RowFlag" runat="server"> <INPUT id="txtXmljPersonel" size="1" name="txtXmljPersonel" runat="server"><INPUT id="tmpJPersonel" size="1" name="tmpJPersonel" runat="server">
						<input id="txtBreifKarkard" name="txtBreifKarkard" runat="server"> <INPUT id="CurDate" style="WIDTH: 1px" name="CurDate" runat="server">
						<INPUT id="tempSelCreditType" name="tempSelCreditType" runat="server"><INPUT id="txtSaveXml" name="txtSaveXml" runat="server">
						<asp:button id="TbtnSave" runat="server" CssClass="btnSave"></asp:button>
						<input type="text" id="txtAlertMSG" runat="server">
					</td>
				</tr>
			</table>
		</FORM>
	</body>
</HTML>
