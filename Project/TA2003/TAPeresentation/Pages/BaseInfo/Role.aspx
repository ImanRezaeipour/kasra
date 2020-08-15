<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Role.aspx.vb" Inherits="TA.Role" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>-----------------------------------------------------------------Ê«Õœ 
			”«“„«‰Ì------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			////____________________________________________________________________________
			function onLoad()
			{
				window.returnValue=''
				document.all("Body").scroll="no"
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
			////____________________________________________________________________________
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
									<TABLE class="CssPage" id="Table1" style="WIDTH: 421px; HEIGHT: 576px" height="576" cellSpacing="1"
										cellPadding="1" border="0" align="center">
										<TR>
											<TD vAlign="top" align="right">
												<TABLE id="Table2" height="568" cellSpacing="1" cellPadding="1" width="586" align="right"
													border="0" style="WIDTH: 586px; HEIGHT: 568px">
													<TR>
														<TD style="HEIGHT: 457px" vAlign="top" align="right">
															<TABLE id="Table3" style="WIDTH: 596px; HEIGHT: 488px" cellSpacing="1" cellPadding="1"
																width="596" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 630px" align="right"><IFRAME id="FrameGridPersons" style="WIDTH: 99.71%; HEIGHT: 99.26%" align="right" marginWidth="0"
																			marginHeight="0" src='../Person/SingleRoleTab.aspx?SessionID=<%=request("SessionID")%>' frameBorder="no" width="100%" scrolling="no" height="100%"></IFRAME>
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
																	<TD style="DISPLAY: none">
																		<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <INPUT id="RoleId" type="text" name="RoleId" runat="server">
																		<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
																		<INPUT id="txtFlag" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtFlag" runat="server">
																	</TD>
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
			</table>
		</form>
	</body>
</HTML>
