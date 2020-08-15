<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SchedulePresent.aspx.vb" Inherits="TA.SchedulePresent" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>SchedulePresent</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function pageLoad()
		{
			returnValue=0
		}
		function btnCancelOnClick()
		{
			
			returnValue=0
			window.close()
		}
		function btnOkOnClick()
		{
			
			returnValue=Form1.cmbSchedulePresent.value
			window.close()
		}
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" onload=pageLoad() rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Layer1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD align="center">
						<TABLE class="CssLayer2" id="Layer2" height="98%" cellSpacing="1" cellPadding="1" width="98%"
							border="0">
							<TR>
								<TD align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 300px; HEIGHT: 130px" cellSpacing="1" cellPadding="1"
										width="300" border="0">
										<TR>
											<TD style="HEIGHT: 91px" align="center">
												<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="0">
													<TR>
														<TD>œ—’œ ‘Ì› </TD>
														<TD>
															<cc1:LCombo id="cmbSchedulePresent" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
																LookupName="SchedulePresent" Width="120px"></cc1:LCombo></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD align="center">
												<HR class="CssHorizontalLine" width="100%" SIZE="1">
												<INPUT class="CssBtnOk" onclick="btnOkOnClick()" id="btnOk" type="button">
                                               <%-- <INPUT class="CssBtnCancel" onclick="btnCancelOnClick()" id="btnCancel" type="button" name="Button1">--%>
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
