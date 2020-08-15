<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ModifyPerson.aspx.vb" Inherits="FrameWork.ModifyPerson" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../Calendar/TextDate.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>ModifyPerson</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../Includes/StyleForPages.css">
		<script language="javascript" src="General.js"></script>
		<script src="../../Includes/Scripts/KeySorting.js"></script>
		<script language="javascript">
        ///////////////////////////////////////////////////////////////////////
       
        function LoadForm()
         {
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       
         if(document.getElementById("txtFlagAccess").value=="0")
         document.getElementById("btnBatchNew").style.display="none"
			
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		  OnClickBtnNew()
			document.all.item('body').scroll="no"
			var grdName='<%=request("grdName")%>'
			var strCells='<%=request("strCells")%>'
			var strType='<%=request("strType")%>'	
		

			onLoadGrdHeaderForSort(grdName,strCells,strType)
			if(Form1.txtAlert.value!='')
			{
			
				alert(Form1.txtAlert.value)
				Form1.txtAlert.value=''
				OnClickBtnNew()
			}			
        }
        ///////////////////////////////////////////////////////////////////////////////////////
		function grdPersonOnClick(SelectedRow)
		{  
			//alert(SelectedRow)	
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length)
			{ 
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = SelectedRow.rowIndex
			SelectedRow.style.backgroundColor = '#FFD599'
			Form1.PersonId.value=SelectedRow.cells(0).innerText
			
		
			LoadData()
		}
		///////////////////////////////////////////////////////////////////////////////////////
		function  ondblclickgrdPerson(SelectedRow)
		{
			grdPersonOnClick(SelectedRow)
		
		}
        ///////////////////////////////////////////////////////////////////////////////////////
		function LoadData()
		{
		
			document.getElementById("txtPersonelNewID").disabled=false
			var xmlDoc
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			//alert(document.all.item("XMLPersonInfo").value)
			xmlDoc.loadXML(document.all.item("XMLPersonInfo").value);
			
			var XMLNodes
			XMLNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/PersonInfo [PersonId="+Form1.PersonId.value+"]");
			 
			Form1.FatherName.value = XMLNodes.item(0).selectSingleNode('FatherName').text
			Form1.FirstName.value = XMLNodes.item(0).selectSingleNode('FirstName').text
			Form1.LastName.value = XMLNodes.item(0).selectSingleNode('LastName').text
			
			if(XMLNodes.item(0).selectSingleNode('Sex').text=='1' )
				document.getElementById("optMan").checked = true
			else
				document.getElementById("optWoman").checked = true
				
			Form1.selMarriage.value = XMLNodes.item(0).selectSingleNode('Marriage').text
			
			var BD
			BD=XMLNodes.item(0).selectSingleNode('BirthDate').text
			if(BD!='')
			{
			Form1.BirthDate_txtDay.value = BD.substr(8,2)
			Form1.BirthDate_txtMonth.value =  BD.substr(5,2)
			Form1.BirthDate_txtYear.value = BD.substr(0,4)
			//alert(document.all.item("XMLPersonInfo").value)
			}
			var ED
			//alert(XMLNodes.item(0).selectSingleNode('EmployeeDate').text)
			ED=XMLNodes.item(0).selectSingleNode('EmployeeDate').text
			
			if(ED!=''||ED!=null)
			{
			Form1.EmployeeDate_txtDay.value = ED.substr(8,2)
			Form1.EmployeeDate_txtMonth.value = ED.substr(5,2)
			Form1.EmployeeDate_txtYear.value = ED.substr(0,4)
			}
			var OD
			
			OD=XMLNodes.item(0).selectSingleNode('OccupationStartDate').text
			
			if(OD!=''||OD!=null)
			{			
			Form1.OccupationStartDate_txtDay.value = OD.substr(8,2)
			Form1.OccupationStartDate_txtMonth.value = OD.substr(5,2)
			Form1.OccupationStartDate_txtYear.value = OD.substr(0,4)
			}
			OD=XMLNodes.item(0).selectSingleNode('ExitDate').text
			if(OD!=''||OD!=null)
			{
			
			Form1.ExitDate_txtDay.value = OD.substr(8,2)
			Form1.ExitDate_txtMonth.value = OD.substr(5,2)
			Form1.ExitDate_txtYear.value = OD.substr(0,4)
			}
			
			Form1.PersonId.readOnly=true
			Form1.PersonId.style.backgroundColor='lightGrey'
			
			
			Form1.txtCardNo.value=XMLNodes.item(0).selectSingleNode('PersonelCardID').text
			
			if(XMLNodes.item(0).selectSingleNode('Deactive').text == '0' )
				document.getElementById("optActive").checked = true
			else
				document.getElementById("optNoActive").checked = true
		 
			document.getElementById("TxtAddress").value=XMLNodes.item(0).selectSingleNode('Address').text
			document.getElementById("TxtPhone").value=XMLNodes.item(0).selectSingleNode('Phone').text
		}
        ///////////////////////////////////////////////////////////////////////
		 function OnClickBtnNew()
		 { 
			Form1.PersonId.value = ""
			Form1.PersonId.readOnly=false
			Form1.PersonId.style.backgroundColor=''
			Form1.LastName.value = "" 
			Form1.FirstName.value = ""
			Form1.FatherName.value = ""
			Form1.selMarriage.value = 0
			document.getElementById("optMan").checked = true
			document.getElementById("optActive").checked=true
			Form1.BirthDate_txtDay.value = ''
			Form1.BirthDate_txtMonth.value = ''
			Form1.BirthDate_txtYear.value = ''
			Form1.EmployeeDate_txtDay.value = ''
			Form1.EmployeeDate_txtMonth.value =''
			Form1.EmployeeDate_txtYear.value = ''
			Form1.OccupationStartDate_txtDay.value = ''
			Form1.OccupationStartDate_txtMonth.value = ''
			Form1.OccupationStartDate_txtYear.value =''
			document.getElementById("TxtAddress").value=''
			document.getElementById("TxtPhone").value=''
			Form1.txtPersonelNewID.value=''  
			Form1.txtCardNo.value=''
			
			document.getElementById("txtPersonelNewID").disabled=true
			Form1.ExitDate_txtDay.value = ''
			Form1.ExitDate_txtMonth.value = ''
			Form1.ExitDate_txtYear.value = ''
			
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length )
			{ 
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = ''
		 }
		  //////////////////////////////////////////////////////////
		 function OnClickBtnBatchNew()
		 {
	
		 var url = "/FrmPresentation/App_Pages/DataEntry/EnterData.aspx?BatchEnterDataType=Personel&SessionID=0&ToPersonId="+Form1.txtOnLineUser.value;
			//alert(url)
            var StrFeatur = "dialogHeight: 900px;dialogWidth: 1250px;center: Yes;help: no;status: no"
            var returnValue = window.showModalDialog(url, window, StrFeatur)
		 }
		 //////////////////////////////////////////////////////////
		 function onClickBtnSave() 
		 { 
   		    Form1.xmlText.value=''
		    if(Form1.PersonId.value == '' || Form1.LastName.value == '')
		    {
		        alert("·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ")
		        return
		    }
		   
			var BD
			BD=Form1.BirthDate_txtYear.value+'/'+Form1.BirthDate_txtMonth.value+'/'+Form1.BirthDate_txtDay.value 
			if(BD>=Form1.CurDate.value)
			{
				alert(' «—ÌŒ  Ê·œ „⁄ »— ‰Ì” ')
				return
			}
		    //œ«œÂ Â«Ì  ò—«—Ì —« çò „Ìò‰œ      
		    var xmlDoc
		    xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(document.all.item("XMLPersonInfo").value);
			
			var XMLNodes
			XMLNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/PersonInfo [PersonId="+Form1.PersonId.value+"]");
		    if(XMLNodes.length>0 & Form1.LastSelectedgrdPerson.value == '')
		    {
		        if (confirm(" ‘Œ’Ì »« «Ì‰ ‘„«—Â Å—”‰·Ì ÊÃÊœ œ«—œ «Ì« „Ì ŒÊ«ÂÌœ Ã«Ìê“Ì‰ ‘Êœ"))
					MakeXml()
			}
			else
			{
				MakeXml()				
			}	
			 if(Form1.xmlText.value!='')
			 {
				if(Form1.txtPersonelNewID.value!='')
				{
					if(confirm("¬Ì« „Ì ŒÊ«ÂÌœ òœ Å—”‰·Ì ÃœÌœ Ã«Ìê“Ì‰ ‘Êœ ø"))
					{						
						Form1.Flag_PersonelNewID.value=1 
					}
					else
					{
						Form1.Flag_PersonelNewID.value=0
					}
				}
				//alert(Form1.xmlText.value)
				Form1.txtSumbit.value = "save"
				Form1.submit()	
				
		     }					
		}
		 //////////////////////////////////////////////////////////
		 function MakeXml()
		 {
		    var sex
		    if(Form1.optMan.checked)
		      sex = 1
		    else
		      sex = 2
		      ////////////////////////////////////////
		      var Activation
		    if(Form1.optActive.checked==true)
		      Activation = 0
		    else
		      Activation = 1
		      ///////////////////////////////////////
		    var BD
			BD=Form1.BirthDate_txtDay.value+'/'+Form1.BirthDate_txtMonth.value+'/'+Form1.BirthDate_txtYear.value 
			if (BD=='//')
				BD=''
			var OD
			OD=Form1.OccupationStartDate_txtDay.value+'/'+Form1.OccupationStartDate_txtMonth.value+'/'+Form1.OccupationStartDate_txtYear.value 
			if (OD=='//')
				OD=''
			var ED
			ED=Form1.EmployeeDate_txtDay.value+'/'+Form1.EmployeeDate_txtMonth.value+'/'+Form1.EmployeeDate_txtYear.value 
			if (ED=='//')
				ED=''
			
			var ExitDate
			ExitDate=Form1.ExitDate_txtDay.value+'/'+Form1.ExitDate_txtMonth.value+'/'+Form1.ExitDate_txtYear.value 
			if (ExitDate=='//')
				ExitDate=''
				
		    var strXMLPerson = '<PersonEntity><PersonInfo>'  
		    strXMLPerson += '<PersonId>'+Form1.PersonId.value+'</PersonId>'
		    strXMLPerson += '<NewPersonId>'+Form1.txtPersonelNewID.value+'</NewPersonId>'
		    strXMLPerson += '<LastName>'+Form1.LastName.value+'</LastName>'
		    strXMLPerson += '<FirstName>'+Form1.FirstName.value+'</FirstName>'
		    strXMLPerson += '<FatherName>'+Form1.FatherName.value+'</FatherName>'
		    strXMLPerson += '<Sex>'+sex+'</Sex>'
		    //alert(document.all.item("selMarriage").value)
		    strXMLPerson += '<Marriage>'+document.all.item("selMarriage").value+'</Marriage>'
		    strXMLPerson += '<BirthDate>'+BD+'</BirthDate>'
		    strXMLPerson += '<EmployeeDate>'+ED+'</EmployeeDate>'
		    strXMLPerson += '<OccupationStartDate>'+OD+'</OccupationStartDate>'
		    strXMLPerson += '<PersonelCardID>'+Form1.txtCardNo.value+'</PersonelCardID>'
		    strXMLPerson += '<Deactive>'+Activation+'</Deactive>'
		    
		    if(document.getElementById("TxtAddress").value!="")
				strXMLPerson += '<Address>'+document.getElementById("TxtAddress").value+'</Address>'
		    
		    if(document.getElementById("TxtPhone").value!="")
				strXMLPerson += '<Phone>'+document.getElementById("TxtPhone").value+'</Phone>'
				
		    strXMLPerson += '<ExitDate>'+ExitDate+'</ExitDate>'
		    strXMLPerson += '</PersonInfo></PersonEntity>'
		    Form1.xmlText.value = strXMLPerson
		    
		 
		 }
		////////////////////////////////////////////////////////////////////////////////
		function onClickBtnDelete()
		{  
			
		      if( Form1.PersonId.value=='' )
		          alert("ÂÌç ¬Ì „ »—«Ì Õ–› «‰ Œ«» ‰‘œÂ «” .")
		      else if(confirm('¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø'))
		      {
				Form1.txtSumbit.value = "delate"
				Form1.submit()
		      }
		}
		///////////////////////////////////////////////////////////////////////////////
		function onBlurTxtPersonID()
		{
				
			if (Form1.fPersonId.value=="")
				Form1.Names.value="0"
			else
			{
				Form1.Names.value=Form1.fPersonId.value
				if (Form1.Names.value=="")
				{
				alert("‘„«—Â Å—”‰·Ì ‰« „⁄ »— «” !")
					return
				
				}
			}
		         //*********************************************
			if (Form1.Names.value==0)
			{
			
				Form1.fFullName.value=""
			}
			else
			{
				Form1.fFullName.value=Form1.Names.value
				Form1.fFullName.value=Form1.Names(Form1.Names.selectedIndex).text
				}
			/*********************************************/
			
		}
		////////////////////////////////////////////////////////////////////////////////
		function cmbName_onchange()
			{	
				if ((Form1.Names.selectedIndex!=-1)&&(Form1.Names.selectedIndex!=0))
				{
					var mytxt=document.all.item("fPersonId")
					var mycmb=document.all.item("Names")
					document.all.item("fPersonId").value=mycmb.options(mycmb.selectedIndex).value
					Form1.fFullName.value=Form1.Names(Form1.Names.selectedIndex).text
				}
				else
				{
					Form1.fFullName.value=""
					Form1.fPersonId.value =""
				}
			}
			//////////////////////////////////////////////////////////////////////////////
			function onclickbtnSearch()
			{
			if((Form1.chkActive.checked==true && Form1.chkInActive.checked==true)|| 
			(Form1.chkActive.checked==false && Form1.chkInActive.checked==false))
			Form1.txtChkStatus.value=""
			
			else if(Form1.chkActive.checked==true)
			Form1.txtChkStatus.value="1"
			
			else if(Form1.chkInActive.checked==true)
			Form1.txtChkStatus.value="2"
			
			
		
			
			
			Form1.txtSumbit.value = "LimitSerach"
			Form1.submit()
			}
			function onclickbtnShow()
			{
			Form1.txtChkStatus.value=""
			Form1.Names.value="0"
			Form1.fPersonId.value=""
			Form1.fFullName.value=""
			Form1.txtSumbit.value = "Show"
			Form1.submit()
			
			
			}
			///////////////////////////////////////////////////////////////////////////////
			function onblurLName()
			{
			cmbName_onchange()
			}
		
			//////////////////////////////////////////////////////////////////////////////
		
		
			
			
		</script>
	</HEAD>
	<body dir="ltr" id="body" onclick="onclickBodyForSort('ModifyPerson.aspx','grdPerson')"
		onload="LoadForm()" bottomMargin="0" leftMargin="0" rightMargin="0" scroll="yes" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" class="CssLayer1" border="0" cellSpacing="1" cellPadding="1" width="100%"
				align="center" height="100%" >
				<TR>
					<TD valign="top">
						<TABLE id="Table2" class="CssLayer2" border="0" cellSpacing="1" cellPadding="1" width="100%"
							align="center" height="100%">
							<TR>
								<TD vAlign="middle" align="center">
									<TABLE style="WIDTH: 616px; " id="Page" class="CssPage" border="2" cellSpacing="1"
										cellPadding="1" width="616" align="center" >
										<TR>
											<TD style="DISPLAY: inline" id="DownRow" height="352" vAlign="top" align="center">
												<TABLE style="WIDTH: 609px; HEIGHT: 450px" id="Table6" border="0" cellSpacing="1" cellPadding="1"
													width="609" align="right" >
													<TR>
														<TD vAlign="top" align="center" style="HEIGHT: 20px">
															<TABLE style="WIDTH: 600px; HEIGHT: 20px" id="Table11" border="0" cellSpacing="0" cellPadding="0"
																width="600" align="right">
																<TR>
																	<TD style="WIDTH: 100px" vAlign="middle" align="right"><INPUT style="WIDTH: 32px; CURSOR: pointer; HEIGHT: 32px" dir="rtl" id="btnShow" class="CssBtnShow"
																			title="‰„«Ì‘" tabIndex="4" onclick="onclickbtnShow()" type="button" runat="server"><INPUT style="WIDTH: 32px; CURSOR: pointer; HEIGHT: 32px" dir="rtl" id="btnSearch" class="CssBtnLimitSerach"
																			title="‰„«Ì‘ „ÕœÊœ" tabIndex="5" onclick="onclickbtnSearch()" type="button" name="btnSearch" runat="server"></TD>
																	<TD dir="rtl" vAlign="middle" align="right"><cc1:lcombo onblur="onblurLName()" id="Names" tabIndex="3" onkeypress="return KeySort(this,false)"
																			runat="server" Height="24px" CssClass="TxtControls" Width="115px" LookupName="Personel" ConnectionName="GenCnn" DataTextField="title"
																			onchange="cmbName_onchange()" DataValueField="val"></cc1:lcombo></TD>
																	<TD style="WIDTH: 117px" vAlign="middle"><INPUT style="WIDTH: 122px; HEIGHT: 19px" dir="rtl" id="fFullName" class="TxtControls"
																			tabIndex="2" size="15" name="fFullName" runat="server"></TD>
																	<TD vAlign="middle" style="WIDTH: 100px">
																		‰«„ Ê ‰«„ Œ«‰Ê«œêÌ
																	</TD>
																	<TD style="WIDTH: 90px; HEIGHT: 24px" dir="rtl" vAlign="middle"><INPUT onblur="onBlurTxtPersonID()" style="WIDTH: 78px; HEIGHT: 19px" onkeydown="OnKeyDownNum('integer',this.value)"
																			id="fPersonId" class="TxtControls" tabIndex="1" size="6" name="fPersonId" runat="server"></TD>
																	<TD style="HEIGHT: 24px" width="100" vAlign="middle">‘„«—Â Å—”‰·Ì</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<tr>
														<td style="HEIGHT: 27px">
															<table align="right" cellpadding="0" cellspacing="0">
																<tr>
																	<td>Å—”‰· €Ì—›⁄«·</td>
																	<td><input id="chkInActive" type="checkbox" name="chkInActive" runat="server"></td>
																	<td>Å—”‰· ›⁄«·</td>
																	<td><input id="chkActive" type="checkbox" name="chkActive" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		&nbsp;</td>
																</tr>
															</table>
														</td>
													</tr>
													<TR valign="top" height="150px">
														<TD style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 150px"
															dir="rtl" vAlign="top" align="center"><cc1:automationgrid dir="rtl" id="grdPerson" tabIndex="6" runat="server" Height="120px" CssClass="CssBackColor"
																Width="481px" HtcAddress=" " ClientSorting="True" CreateClientSideScripts="False" UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False"
																EnableClientPager="False" Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" AutoGenerateColumns="False" SelectRowOnClick="False"
																PageSize="20"><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssFooterStyle"></FOOTERSTYLE>
																<EDITITEMSTYLE CssClass="CssEditItemStyle "></EDITITEMSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:BOUNDCOLUMN DataField="PersonId" HeaderText="‘„«—Â Å—”‰·Ì">
																		<HEADERSTYLE Width="110px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="110px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="FirstName" HeaderText="‰«„">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="LastName" HeaderText="‰«„ Œ«‰Ê«œêÌ ">
																		<HEADERSTYLE Width="160px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="160px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="PersonelCardID" HeaderText="‘„«—Â ò«— ">
																		<HEADERSTYLE Width="110px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="110px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="›⁄«·">
																		<HEADERSTYLE Width="30px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="30px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG 
                        id=image 
                        title='<%#SetTitle(DataBinder.Eval(Container.DataItem,"Deactive"))%>' 
                        src='<%#SetSrc(DataBinder.Eval(Container.DataItem,"Deactive"))%>' 
                        align=middle border=0>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN DataField="Deactive" HeaderText="Deactive" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid>&nbsp;</TD>
													</TR>													
													<TR valign="top">
														<TD style="HEIGHT: 280px" vAlign="top" align="center">
															<TABLE style="WIDTH: 509px; HEIGHT: 280px" id="Table13" class="CssPage" border="0" cellSpacing="1"
																cellPadding="1" width="509">
																<TR>
																	<TD style="WIDTH: 170px; HEIGHT: 20px" dir="rtl" align="right"><INPUT style="DISPLAY: inline; WIDTH: 126px; HEIGHT: 21px" dir="rtl" onkeydown="OnKeyDownNum('integer',this.value)"
																			id="txtPersonelNewID" class="TxtControls" tabIndex="9" size="15" name="Text1" runat="server"></TD>
																	<TD style="WIDTH: 95px; HEIGHT: 25px">‘.Å—”‰·Ì ÃœÌœ</TD>
																	<TD style="WIDTH: 155px; HEIGHT: 25px" dir="rtl" vAlign="bottom" align="right"><INPUT style="WIDTH: 126px; HEIGHT: 21px" onkeydown="OnKeyDownNum('integer',this.value)"
																			id="PersonId" class="TxtControls" tabIndex="7" size="14" name="PersonId" runat="server"></TD>
																	<TD style="HEIGHT: 25px" vAlign="bottom" align="left">‘„«—Â Å—”‰·Ì</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 170px" dir="rtl" align="right"><INPUT style="WIDTH: 126px; HEIGHT: 21px" id="LastName" class="TxtControls" tabIndex="9"
																			size="15" name="Text1" runat="server"></TD>
																	<TD style="WIDTH: 95px" align="left">‰«„ Œ«‰Ê«œêÌ</TD>
																	<TD style="WIDTH: 155px" dir="rtl" align="right"><INPUT style="WIDTH: 126px; HEIGHT: 21px" id="FirstName" class="TxtControls" tabIndex="8"
																			size="14" name="FirstName" runat="server"></TD>
																	<TD align="left">‰«„</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 170px; HEIGHT: 16px" dir="rtl" align="right"><cc1:lcombo id="selMarriage" tabIndex="11" runat="server" CssClass="TxtControls" Width="128"
																			LookupName="Marriage" ConnectionName="GenCnn"></cc1:lcombo></TD>
																	<TD style="WIDTH: 95px; HEIGHT: 16px" align="left">Ê÷⁄Ì   √Â·</TD>
																	<TD style="WIDTH: 155px; HEIGHT: 16px" dir="rtl" align="right"><INPUT style="WIDTH: 126px; HEIGHT: 21px" id="FatherName" class="TxtControls" tabIndex="10"
																			size="15" name="FatherName"></TD>
																	<TD style="HEIGHT: 16px" align="left">‰«„ Åœ—</TD>
																</TR>
																<TR>
																	<TD align="right" style="WIDTH: 170px; HEIGHT: 27px">›⁄«· <INPUT id="optNoActive" tabIndex="14" value="optNoActive" type="radio" name="State">
																		€Ì—&nbsp;›⁄«·<INPUT id="optActive" tabIndex="13" value="optActive" CHECKED type="radio" name="State">
																	</TD>
																	<TD style="WIDTH: 95px; HEIGHT: 27px" align="left">Ê÷⁄Ì  ò«— </TD>
																	<TD style="WIDTH: 155px; HEIGHT: 27px" vAlign="top" align="right"><div align="right"><INPUT align="right" style="WIDTH: 126px; HEIGHT: 22px" dir="ltr" onkeydown="OnKeyDownNum('integer',this.value)"
																				id="txtCardNo" class="TxtControls" tabIndex="12" size="15"></div>
																	</TD>
																	<TD style="HEIGHT: 27px" align="left">‘„«—Â ò«— </TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 170px" align="right">„–ò—<INPUT id="optWoman" tabIndex="16" value="optWoman" type="radio" name="sex">&nbsp;„Ê‰À<INPUT id="optMan" tabIndex="15" value="optMan" CHECKED type="radio" name="sex"></TD>
																	<TD style="WIDTH: 95px" align="left">Ã‰”Ì </TD>
																	<TD align="right" style="WIDTH: 155px"><uc1:textdate id="BirthDate" runat="server"></uc1:textdate></TD>
																	<TD align="left"> «—ÌŒ  Ê·œ</TD>
																</TR>
																<TR>
																	<TD align="right" style="WIDTH: 170px; HEIGHT: 41px"><uc1:textdate id="OccupationStartDate" runat="server"></uc1:textdate></TD>
																	<TD align="left" style="HEIGHT: 41px"> «—ÌŒ ‘—Ê⁄ »ò«—</TD>
																	<TD align="right" style="WIDTH: 155px; HEIGHT: 41px"><uc1:textdate id="EmployeeDate" runat="server"></uc1:textdate></TD>
																	<TD align="left" style="HEIGHT: 41px"> «—ÌŒ «” Œœ«„</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 170px; HEIGHT: 18px" align="right"><uc1:textdate id="ExitDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 95px; HEIGHT: 18px" align="left"> «—ÌŒ Œ« „Â ò«—</TD>
																	<TD style="WIDTH: 155px; HEIGHT: 18px" align="right"><INPUT style="WIDTH: 126px; HEIGHT: 22px" id="TxtPhone" class="TxtControls" tabIndex="18"></TD>
																	<TD style="HEIGHT: 18px" align="left"> ·›‰</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 426px" colSpan="3" align="right"><TEXTAREA style="WIDTH: 390px; HEIGHT: 30px" dir="rtl" id="TxtAddress" class="TxtControls"
																			tabIndex="17" rows="3" cols="50" name="TxtAddress">																					</TEXTAREA></TD>
																	<TD align="left">¬œ—”</TD>
																</TR>
															</TABLE>
															<TABLE style="WIDTH: 239px; HEIGHT: 46px" id="Table10" border="0" cellSpacing="2" cellPadding="3"
																width="239">
																<TR>
																	<TD style="WIDTH: 312px"><INPUT style="DISPLAY: none; CURSOR: pointer" id="btnDelet" class="CssBtnDelete" title="Õ–›"
																			tabIndex="21" onclick="onClickBtnDelete()" type="button" name="btnDelete">
																	</TD>
																	<TD><INPUT style="CURSOR: pointer" id="btnSave" class="CssBtnSave" title="–ŒÌ—Â" tabIndex="20"
																			onclick="onClickBtnSave()" type="button" name="btnSave">
																	</TD>
																	<TD><INPUT style="CURSOR: pointer" id="btnNew" class="CssBtnNew" title="«ÌÃ«œ" tabIndex="19"
																			onclick="OnClickBtnNew()" type="button" name="btnNew"></TD>
																	<TD><INPUT style="CURSOR: pointer" id="btnBatchNew" class="CssBtnNew" title="«ÌÃ«œœ” Â «Ì" tabIndex="20"
																			onclick="OnClickBtnBatchNew()" type="button" name="btnBatchNew"></TD>
																	<TD style="DISPLAY: none"><INPUT id="txtChkStatus" name="txtChkStatus" runat="server">
																		<INPUT id="txtFlagAccess" name="txtFlagAccess" runat="server">
																		<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity><INPUT style="WIDTH: 76px; HEIGHT: 22px" id="txtSumbit" size="7" name="txtSumbit" runat="server">
																		<INPUT style="WIDTH: 76px; HEIGHT: 22px" id="xmlText" size="7" name="xmlText" runat="server">
																		<input id="txtSessionID" name="txtSessionID" runat="server"> <INPUT style="WIDTH: 76px; HEIGHT: 22px" id="LastSelectedgrdPerson" size="7" name="LastSelectedgrdPerson">
																		<INPUT style="WIDTH: 73px; HEIGHT: 22px" id="txtAlert" size="6" name="txtAlert" runat="server">
																		<INPUT style="WIDTH: 73px; HEIGHT: 22px" id="CurDate" size="6" name="CurDate" runat="server">
																		<INPUT style="WIDTH: 81px; HEIGHT: 22px" id="XMLPersonInfo" size="8" name="XMLPersonInfo"
																			runat="server"> <INPUT style="WIDTH: 81px; HEIGHT: 22px" id="Flag_PersonelNewID" size="8" name="XMLPersonInfo"
																			runat="server"> <input id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server">
																		<input id="txtOnLineUser" name="txtOnLineUser" runat="server"><input id="txtAccess" name="txtAccess" runat="server" value="12">
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
