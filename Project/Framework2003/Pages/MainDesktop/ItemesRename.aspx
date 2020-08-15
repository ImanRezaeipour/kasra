<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ItemesRename.aspx.vb" Inherits="FrameWork.ItemesRename" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>____________ ›ÌÌ— ‰«„____________________</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			var falg
			////_______________________________________________________________________________
			function OnClickBtnCancel()
			{
				if(Form1.txtAlertSave.value=='')
					window.returnValue=''
				else
					window.returnValue=Form1.txtItemName.value
				window.close()
			}
			////________________________________________________________________________________
			function btnSaveOnclick()
			{
				if(Form1.txtItemName.value!='')
				{
					MakeXmlRenameMenuItem()
					Form1.btnServerSave.click()
				}
			}
			////________________________________________________________________________________
			function MakeXmlRenameMenuItem()
			{
				var strxml="<DesktopEntity><DesktopMenu>"
				strxml+="<MenuItemID>"+Form1.txtMenuItemID.value+"</MenuItemID>"
				strxml+="<Title>"+Form1.txtItemName.value+"</Title>"
				//strxml+="<IconUrl>"++"</IconUrl>"
				//strxml+="<SelIconUrl>"++"</SelIconUrl>"
				//strxml+="<Style>"++"</Style>"
				strxml+="</DesktopMenu></DesktopEntity>"
				Form1.txtxmlRename.value=strxml
				
			}
		</script>
	</HEAD>
	<body dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onunload="OnClickBtnCancel()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="right" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" dir="rtl" style="WIDTH: 235px; HEIGHT: 122px" height="122"
										cellSpacing="1" cellPadding="1" width="235" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 52px" vAlign="top" align="right">
												<TABLE id="Table1" style="WIDTH: 266px; HEIGHT: 32px" height="32" cellSpacing="1" cellPadding="1"
													width="266" align="right" border="0">
													<TR>
														<TD style="WIDTH: 64px" align="center">‰«„</TD>
														<TD><asp:textbox id="txtItemName" runat="server" Width="170px" CssClass="txtControls"></asp:textbox></TD>
													</TR>
													<TR>
														<TD vAlign="bottom" align="center" colSpan="2">
															<HR class="CssHorizontalLine" style="WIDTH: 76.99%; HEIGHT: 2px" SIZE="2">
															<TABLE id="Table2" style="WIDTH: 158px; HEIGHT: 46px" cellSpacing="2" cellPadding="2" width="158"
																border="0">
																<TR>
																	<TD style="WIDTH: 65px"><INPUT class="CssbtnSave" id="btnSave" onclick="btnSaveOnclick()" type="button" name="btnSave"
																			runat="server"></TD>
																	<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
																</TR>
															</TABLE>
															&nbsp;</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none" align="right"><asp:button id="btnServerSave" runat="server"></asp:button><input id="txtxmlRename" type="text" name="txtxmlRename" runat="server">
						<input id="txtMenuItemID" type="text" name="txtMenuItemID" runat="server"> <input id="txtAlertSave" type="text" name="txtAlertSave" runat="server">
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
