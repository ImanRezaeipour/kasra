<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RptAccessRole.aspx.vb" Inherits="FrameWork.RptAccessRole" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>RptAccessRole</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		/////////////////////////////////////////////////////////////////////////////////////
		function ManageInnerHTMLAccessRole()
		{
			if (Form1.selSubSys.value=='')
				Form1.selSubSys.value=0
				
			document.all('selAccess').innerHTML=""
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLAccessRole.value);
					
			var xml1;
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/AccessRole[subsysID="+Form1.selSubSys.value+"]");    
			
			var optionEl
			
			document.all('selAccess').innerHTML=""	
			optionEl=document.createElement("OPTION")
			document.all('selAccess').options.add(optionEl)
			document.all('selAccess').all(0).innerText='«‰ Œ«» ‰‘œÂ'
			document.all('selAccess').all(0).value=0
			for(x1=0;x1<xml1.length;++x1)
			{
				i=x1+1
				optionEl=document.createElement("OPTION")
				document.all('selAccess').options.add(optionEl)
				document.all('selAccess').all(i).innerText=xml1.item(x1).selectSingleNode('caption').text
				document.all('selAccess').all(i).value=xml1.item(x1).selectSingleNode('id').text			
			}	
			if (Form1.recID.value!='')
				document.all('selAccess').value=Form1.recID.value
		}
		////////////////////////////////////////////////////////////////////
	    function loadForm()
	    {
			document.all.item('body').scroll = "no"
			RefreshGrid()
			if(Form1.txtSubmit.value!='')
				Form1.recID.value=document.all('selAccess').value
			ManageInnerHTMLAccessRole()
	    }
		 /////////////////////////////////////////////////////////////////////////
		 function onchangeSelPerson()
		 {
		   Form1.fPersonId.value = Form1.selPerson.value
		 }
		 ////////////////////////////////////////////////////////////////////////////////
		  function onchangefPersonId()
		 {
		  Form1.selPerson.value = Form1.fPersonId.value
		 }
		 ////////////////////////////////////////////////////////////////////////////////
		  function onchangeSelSubSys()
		 {
		  ManageInnerHTMLAccessRole()
		 }
		 //////////////////////////////////////////////////////////////////////////////////
		 
		 function onclickBtnSearch()
		 {
			Form1.txtSubmit.value='Search'
			Form1.submit()
		 }
 		 //////////////////////////////////////////////////////////////////////////////////
		 function onclickBtnShow()
		 {
			Form1.selSubSys.value=0
			Form1.selAccess.value=0
			Form1.selPerson.value = 0
			Form1.fPersonId.value=''
			Form1.txtSubmit.value=''
			Form1.submit()
		 }
 		 //////////////////////////////////////////////////////////////////////////////////
		 function RefreshGrid()
		 {
			var PersonId
			var AccessId
			
			if (Form1.recID.value=='')
				AccessId=Form1.selAccess.value
			else	
				AccessId=Form1.recID.value
				
			if (Form1.fPersonId.value=='')
				PersonId='0'
			else
				PersonId=Form1.fPersonId.value
			if(Form1.optAll.checked)
			{ 
				document.all.item('FrameGrid').src="GridRptAccessRole.aspx?PersonId="+PersonId+" &AccessId="+AccessId,"","dialogHeight: 450px;dialogWidth: 950px;center: Yes;help: no;status: no"
				return
			}	
			if(Form1.optGroup.checked)
			{ 
				document.all.item('FrameGrid').src="GridGroupRptAccessRole.aspx?PersonId="+PersonId+" &AccessId="+AccessId,"","dialogHeight: 450px;dialogWidth: 950px;center: Yes;help: no;status: no"
				return
			}
			if(Form1.optPerson.checked)		  
			{
				document.all.item('FrameGrid').src="GridPersonRptAccessRole.aspx?PersonId="+PersonId+" &AccessId="+AccessId,"","dialogHeight: 450px;dialogWidth: 950px;center: Yes;help: no;status: no"
				return
			}
			if(Form1.optRole.checked)		  
			{
				document.all.item('FrameGrid').src="GridRoleRptAccessRole.aspx?PersonId="+PersonId+" &AccessId="+AccessId,"","dialogHeight: 450px;dialogWidth: 950px;center: Yes;help: no;status: no"
				return
			}
		 }
		 //////////////////////////////////////////////////////////////////////////////////////////////////
		 function nodeClick(obj)
		 {
		   RefreshGrid()
		 }
 		 //////////////////////////////////////////////////////////////////////////////////////////////////
		 function rootClick()
		 {
			Form1.recID.value='0'
			RefreshGrid()
		 }
		</script>
	</HEAD>
	<body id="body" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="loadForm()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				align="right" border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<P>&nbsp;</P>
						<TABLE class="CssPage" id="Table3" style="WIDTH: 1009px; HEIGHT: 427px" height="427" cellSpacing="1"
							cellPadding="1" width="1009" border="0">
							<TR>
								<TD style="HEIGHT: 100%" vAlign="top" align="right"><TABLE id="Table2" style="WIDTH: 1001px; HEIGHT: 548px" cellSpacing="1" cellPadding="1"
										width="1001" align="right" border="0">
										<TR>
											<TD vAlign="top">
												<TABLE id="Table5" height="100%" cellSpacing="1" cellPadding="1" width="100%" align="right"
													border="0">
													<TR>
														<TD>
															<TABLE id="Table4" dir="rtl" style="WIDTH: 672px; HEIGHT: 8px" cellSpacing="1" cellPadding="1"
																width="672" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 55px" align="right">òœ Å—”‰·Ì</TD>
																	<TD style="WIDTH: 109px" align="right"><INPUT class="TxtControls" id="fPersonId" dir="rtl" style="WIDTH: 120px; HEIGHT: 22px"
																			type="text" onchange="onchangefPersonId()" size="16" name="fPersonId" runat="server"></TD>
																	<TD style="WIDTH: 87px" align="right">‰«„ Œ«‰Ê«œêÌ Ê‰«„</TD>
																	<TD align="right"><cc1:lcombo id="selPerson" runat="server" FirstSelect="True" ConnectionName="SysCnn" LookupName="PersonInfo"
																			onchange="onchangeSelPerson()" FarsiEntryMach="True" Width="200px" CssClass="TxtControls"></cc1:lcombo></TD>
																	<TD align="right"><INPUT id="optPerson" onclick="RefreshGrid()" type="radio" value="optPerson" name="RadioGroup"
																			runat="server"></TD>
																	<TD align="right">‘Œ’Ì</TD>
																	<TD align="right"><INPUT id="optRole" onclick="RefreshGrid()" type="radio" value="optPerson" name="RadioGroup"
																			runat="server"></TD>
																	<TD align="right">”«“„«‰Ì</TD>
																	<TD align="right"><INPUT id="optGroup" onclick="RefreshGrid()" type="radio" value="optGroup" name="RadioGroup"
																			runat="server"></TD>
																	<TD align="right">ê—ÊÂÌ</TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 55px" align="right">”Ì” „</TD>
																	<TD style="WIDTH: 109px" align="right"><cc1:lcombo id="selSubSys" runat="server" FirstSelect="True" ConnectionName="SysCnn" LookupName="SubSys"
																			onchange="onchangeSelSubSys()" FarsiEntryMach="True" Width="120px" CssClass="TxtControls"></cc1:lcombo></TD>
																	<TD style="WIDTH: 87px" align="right">œ” —”Ì</TD>
																	<TD align="right"><cc1:lcombo id="selAccess" runat="server" FirstSelect="True" ConnectionName="SysCnn" LookupName="AccessRole"
																			FarsiEntryMach="True" Width="200px" CssClass="TxtControls"></cc1:lcombo></TD>
																	<TD align="right"><INPUT id="optAll" onclick="RefreshGrid()" type="radio" CHECKED value="optAll" name="RadioGroup"
																			runat="server"></TD>
																	<TD align="right">ò·Ì</TD>
																	<TD align="left" colSpan="4"><INPUT class="CssBtnLimitSerach" id="bntSreach" dir="rtl" style="WIDTH: 35px; HEIGHT: 32px"
																			onclick="onclickBtnSearch()" type="button" name="btnSearch" runat="server">&nbsp;
																		<INPUT class="CssBtnShow" id="btnShow" dir="rtl" style="WIDTH: 35px; HEIGHT: 32px" onclick="onclickBtnShow()"
																			type="button" name="btnShow" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD style="WIDTH: 100%; HEIGHT: 100%"><IFRAME id="FrameGrid" dir="rtl" style="WIDTH: 100%; HEIGHT: 100%; dir: rtl" align="middle"
																scrolling="no"></IFRAME>
														</TD>
													</TR>
												</TABLE>
											</TD>
											<TD class="CssPage">
												<DIV id="tree" dir="rtl" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 310px; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 579px"
													align="right"><cc1:tree id="TreeAccessRole" runat="server"></cc1:tree></DIV>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<tr>
								<td style="DISPLAY: none"><input id="BeforePrevStyle" type="hidden" size="1" name="BeforePrevStyle">
									<input id="PageName" type="hidden" value="MainPage" name="PageName"> <input id="parent" type="hidden" name="parent">
									<input id="PrevrecID" type="hidden" size="1" name="PrevrecID"> <input id="recID" type="hidden" size="1" name="recID">
									<input id="PersonIdForFilterTree" type="text" runat="server"> <input id="RoleUdforFilterTree" type="text" runat="Server">
									<input id="txtSubmit" type="text" name="txtSubmit" runat="server"> <input id="XMLAccessRole" type="text" name="XMLAccessRole" runat="server">
								</td>
							</tr>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
