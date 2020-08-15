<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Role.aspx.vb" Inherits="FrameWork.Role" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>Role</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		//////////////////////////////////////////////////////////////////////////////////
			function onLoad()
			{
				document.all("Body").scroll="no"
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onclickbtnSave()
			{
				window.frames('FrameAccessRole').onclickbtnSave()
			}
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="top" align="center">
						<P>&nbsp;</P>
						<TABLE class="CssPage" id="Table1" style="WIDTH: 954px; HEIGHT: 630px" height="630" cellSpacing="1"
							cellPadding="1" border="0" align="center">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table2" height="100%" cellSpacing="1" cellPadding="1" width="100%" align="right"
										border="0">
										<TR>
											<TD style="HEIGHT: 517px" vAlign="top" align="right">
												<TABLE id="Table3" style="HEIGHT: 542px" cellSpacing="1" cellPadding="1" width="100%" align="right"
													border="0">
													<TR>
														<TD style="WIDTH: 630px"><IFRAME id="FrameGridPersons" style="WIDTH: 100%; HEIGHT: 99.29%" align="right" marginWidth="0"
																marginHeight="0" src="../Person/SingleRoleTab.aspx?SessionID=<%=request("SessionID")%>" frameBorder="no" width="100%" scrolling="no" height="100%"></IFRAME>
														</TD>
														<TD class="CssPage"><IFRAME id="FrameAccessRole" style="WIDTH: 100%; HEIGHT: 100%" align="right" marginWidth="0"
																marginHeight="0" src="AccessRole.aspx" frameBorder="no" width="100%" scrolling="no" height="100%"></IFRAME>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 873px; HEIGHT: 2px" width="873" SIZE="2">
												<TABLE id="Table6" style="WIDTH: 15px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="15"
													border="0">
													<TR>
														<TD><INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"></TD>
														<TD style="DISPLAY: none">
															<input type="text" id="txtSessionID" runat="server"> <INPUT id="RoleId" type="text" name="RoleId" runat="server">
															<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
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
