<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmEscoTransfer.aspx.vb" Inherits="TA.FrmEscoTransfer" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>FrmEscoTransfer</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="/TA/Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="/TA/Includes/EnterData/Shdate.inc" type="text/css" rel="stylesheet">
		<script language="javascript" src="/TA/Include/EnterData/General.js"></script>
		<script language="javascript">
	//----------------------------------------------------------------------/
		function Onclick_Input()
		{
			Form1.txtSubmit.value="RunJob"
			
			Form1.submit()
			
		}
	//----------------------------------------------------------------------/
		function LoadForm()
		{
	
			Form1.Flags.value=""
				
			if (Form1.txtAlert.value!="")
			{ 
				alert(Form1.txtAlert.value) 
				Form1.txtAlert.value="" 				
			}				
		}
	//----------------------------------------------------------------------/ 
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" onload="LoadForm()" scroll="no" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="90%" cellSpacing="0" cellPadding="0" width="90%"
							border="0" style="POSITION: relative; TOP: 20px">
							<tr>
								<td vAlign="middle" align="center">
									<table class="CssPage" id="Page" style="WIDTH: 608px; HEIGHT: 288px" height="288" cellSpacing="0"
										cellPadding="0" width="608" border="2">
										<tr id="RowGrid" vAlign="top">
											<td vAlign="middle" align="center">
												<TABLE id="Table1" style="WIDTH: 601px; HEIGHT: 28px" cellSpacing="2" cellPadding="2" width="601"
													border="0">
													<TR>
														<TD style="HEIGHT: 1px" vAlign="middle" align="center">&nbsp;
															<asp:button id="btnServerInput" style="DISPLAY: none" runat="server" Text="Button"></asp:button>
															<FIELDSET class="CssPage" style="WIDTH: 563px; HEIGHT: 66px"><LEGEND><FONT color="maroon"> &nbsp;⁄„·Ì« &nbsp;«‰ ﬁ«· 
																		«ÿ·«⁄« &nbsp;:&nbsp;</FONT></LEGEND><input class="CssBtnImportData" id="btnInput" style="WIDTH: 109px; HEIGHT: 35px" onclick="Onclick_Input()"
																	type="button" name="btnInput" Width="109px" Height="32px"></FIELDSET>
														</TD>
													</TR>
													<TR style="DISPLAY: none">
														<TD style="DISPLAY: none" vAlign="middle" align="center"><INPUT id="txtSubmit" type="text" name="txtSubmit" runat="server">
															<INPUT id="TxtReturnSP" type="text" name="TxtReturnSP" runat="server"> <INPUT id="ExistsFolder" type="text" name="ExistsFolder" runat="server">
															<INPUT id="Flags" type="text" name="Flags" runat="server"> <input id="txtUrlPath" type="text" size="1" name="txtUrlPath" runat="server">
															<INPUT id="txtUpLoad" type="text" name="txtUpLoad" runat="server"> <INPUT id="ExistsFile" type="text" name="ExistsFile" runat="server">
															<input id="txtAlert" type="text" size="1" name="txtAlert" runat="server">
															<asp:button id="hBtnRunJob" style="DISPLAY: none" runat="server" Text="Button"></asp:button>
														</TD>
													</TR>
												</TABLE>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		-
	</body>
</HTML>
