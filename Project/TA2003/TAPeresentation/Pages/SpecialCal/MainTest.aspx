<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MainTest.aspx.vb" Inherits="TA.MainTest" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>MainTest</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function onclickbtnCalender()
		{
			url="SpecialCal.aspx?SessionID="+Form1.txtSessionID.value
			window.showModalDialog(url,window,"dialogHeight: 616px;dialogWidth: 592px;center: Yes;help: no;status: no")
		}
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" 
		rightMargin="0">
		<FORM id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" style="WIDTH: 100%; HEIGHT: 100%" height="664" cellSpacing="0"
							cellPadding="0" width="994" border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" cellSpacing="1" cellPadding="1" border="0" style="WIDTH: 394px; HEIGHT: 203px">
										<TR>
											<TD id="TopRow" vAlign="middle" align="center"><INPUT id="btnCalender" onclick="onclickbtnCalender()" type="button" value="Calender">
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</FORM>
	</body>
</HTML>
