<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Rolechart.aspx.vb" Inherits="FrameWork.Rolechart" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML 
dir=rtl>
  <HEAD>
		<title>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href='../../../Includes/Styles/StyleLib.css"' type="text/css" rel="stylesheet"?>
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css"
			rel="stylesheet">
		<script language="javascript">
		////____________________________________________________________________________
		var root='/PersonEntity/Role'
		////____________________________________________________________________________
		function onLoad()
		{
			document.all("Body").scroll="no"
			document.getElementById("FTree").src="FrameTree.aspx?"+Form1.txtSessionID.value 
			document.getElementById("FrameGridPersons").src="SingleRoleTab1.aspx?"+Form1.txtSessionID.value 
			
		}
		////____________________________________________________________________________
		function onclickbtnCancel()
		{
			if (flag!=1)
				window.returnValue=''
			window.close()
		}
		////____________________________________________________________________________
		var flag;
		function onclickbtnOK()
		{
			flag=1
			window.returnValue=window.frames("FrameGridPersons").document.all.item("XMLX").value 
			window.close()
		}
		////________________________________________________________________________
		function ModifyGrid()
		{
			var StrXml=window.frames("FrameGridPersons").document.all.item("XMLX").value;
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(StrXml);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
	
			var xmlNodes;
			/************************************************************/
			xmlNodes=xmlDoc.documentElement.selectNodes(root+" [Selected=1]");
			if (xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;i++)
					xmlNodes.item(i).selectSingleNode('Selected').text="0";
				StrXml=xmlDoc.xml	
			}
			/************************************************************/
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[DepartmentID="+Form1.DepartmentId.value+"]");
			if (xmlNodes.length!=0)
			{	
				xmlNodes.item(0).selectSingleNode('Selected').text="1"
				StrXml=xmlDoc.xml
			}
			window.frames("FrameGridPersons").document.all.item("XMLX").value=StrXml;
			window.frames("FrameGridPersons").SelRowGrid()	
		}
		////________________________________________________________________________
		</script>
</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Table2" style="WIDTH: 706px; HEIGHT: 625px" height="625" cellSpacing="1"
										cellPadding="1" width="706" align="center" border="0">
										<TR>
											<TD style="HEIGHT: 547px" vAlign="top" align="right">
												<TABLE id="Table4" height="100%" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR>
														<TD style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 200px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 388px"
															vAlign="top" align="right">
															<IFRAME id="FTree" style="WIDTH: 100.56%; HEIGHT: 99.98%" align="right" marginWidth="0"
																marginHeight="0"  frameBorder="no" width="100%" scrolling="no" height="100%">
															</IFRAME>
														</TD>
														<TD><IFRAME id="FrameGridPersons" style="WIDTH: 100.56%; HEIGHT: 99.98%" align="right" marginWidth="0"
																marginHeight="0"  frameBorder="no" width="100%" scrolling="no"
																height="100%"></IFRAME>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 350px; HEIGHT: 2px" width="350" SIZE="2">
												<TABLE id="Table6" style="WIDTH: 15px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="15"
													border="0">
													<TR>
														<TD><INPUT class="CssbtnOK" id="btnOK" onclick="onclickbtnOK()" type="button" name="btnOK"></TD>
														<TD><INPUT class="CssbtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button" name="btnCancel"></TD>
														<TD style="DISPLAY: none"><INPUT id="RoleId" type="text" name="RoleId" runat="server">
															<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<TR>
								<TD vAlign="middle" align="center" style="DISPLAY:none">
									<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
									<input id="DepartmentId" type="text" name="DepartmentId" runat="server"><input id="FrmDeptId" type="text" name="FrmDeptId" runat="server">
									<INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent"> <INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
									<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
									<INPUT id="recID" style="WIDTH: 1px" type="hidden" size="1" name="recID">
									<input type="text" id="txtSessionID" runat="server" >
								</TD>
							</TR>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
