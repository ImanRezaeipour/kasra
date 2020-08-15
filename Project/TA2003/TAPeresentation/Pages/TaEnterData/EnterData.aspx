<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EnterData.aspx.vb" Inherits="TA.EnterData" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>Ê—Êœ «ÿ·«⁄« </title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/TA/Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="/TA/Includes/EnterData/Shdate.inc" type="text/css" rel="stylesheet">
		<script language="javascript" src="/TA/Include/EnterData/General.js"></script>
		<script language="javascript">
	//----------------------------------------------------------------------/
		function Onclick_Input()
		{
			Form1.txtSubmit.value="Upload"
			if (Form1.txtFile.value=="" && Form1.Flags.value=="1")
			{
				
				var fso = new ActiveXObject("Scripting.FileSystemObject");
				alert(document.all.item('lblPath').innerText)				
				fso.copyFile(document.all.item('lblPath').innerText, Form1.ExistsFile.value+"\\IOS.txt",1)
			}	
			
			Form1.submit()
			
		}
	//----------------------------------------------------------------------/FolderExists
		function CheckExistsFile()
		{
			var fso = new ActiveXObject("Scripting.FileSystemObject");
			
			if (!fso.FolderExists(Form1.ExistsFile.value))
				Form1.Flags.value="0"
			else if(fso.FolderExists(Form1.ExistsFile.value))
				Form1.Flags.value="1"
		}
	//----------------------------------------------------------------------/
		function LoadForm()
		{
	
			Form1.Flags.value=""
			Form1.txtUpLoad.value=""
			CheckExistsFile()
			///alert(Form1.ExistsFile.value)
			if (Form1.txtSubmit.value=="Submit")
			{
				/*(var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.loadXML(Form1.TxtReturnSP.value);
				var xmlNodes;
				var x;
					xmlNodes=xmlDoc.documentElement.selectNodes("/EnterDataEntity/EnterData");  
					
					if(xmlNodes.length>0)
					{					
						for(x=0;x<xmlNodes.length;++x)
						{											
							if (xmlNodes.item(x).selectSingleNode('Status').text=="0")
								alert("«Ì‰ «ÿ·«⁄«  ﬁ»·« Ê«—œ ‘œÂ «” ")
							else 
							if (xmlNodes.item(x).selectSingleNode('Status').text.lastIndexOf("/")==-1)
								alert(xmlNodes.item(x).selectSingleNode('Status').text+"—òÊ—œ œ— Ì«›  ê—œÌœ")
						}
					}*/
				if(Form1.TxtReturnSP.value==0 )
					alert("«Ì‰ «ÿ·«⁄«  ﬁ»·« Ê«—œ ‘œÂ «” ")
				else
					alert(Form1.TxtReturnSP.value+"—òÊ—œ œ— Ì«›  ê—œÌœ")
					
				Form1.txtSubmit.value=""
			}
			
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
												<TABLE id="Table1" style="WIDTH: 601px; HEIGHT: 196px" cellSpacing="2" cellPadding="2"
													width="601" border="0">
													<TR>
														<TD id="Td7" style="HEIGHT: 105px" vAlign="top" align="center" runat="server">&nbsp;
															<FIELDSET class="CssPage" style="WIDTH: 567px; HEIGHT: 48px"><LEGEND><FONT color="maroon">&nbsp; €ÌÌ—„”Ì— 
																		›«Ì·&nbsp;Text&nbsp; ÃÂ  œ—Ì«›  «ÿ·«⁄« &nbsp;&nbsp;:&nbsp;</FONT></LEGEND>
																<TABLE id="Table2" style="WIDTH: 562px; HEIGHT: 80px" cellSpacing="2" cellPadding="2" width="562"
																	border="0">
																	<TR>
																		<TD>
																			&nbsp;&nbsp;„”Ì—&nbsp;›«Ì·&nbsp;Text:
																			<asp:label id="lblPath" dir="rtl" runat="server" Width="455px" Font-Size="X-Small"></asp:label></TD>
																	</TR>
																	<TR>
																		<TD align="left"> €ÌÌ— „”Ì—:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <INPUT id="txtFile" dir="rtl" style="WIDTH: 462px; HEIGHT: 22px" type="file" size="57"
																				name="txtFile" runat="server"></TD>
																	</TR>
																</TABLE>
															</FIELDSET>
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 10px" vAlign="middle" align="center">
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 1px" vAlign="middle" align="center">&nbsp;
															<asp:button id="btnServerInput" style="DISPLAY: none" runat="server" Text="Button"></asp:button>
															<FIELDSET class="CssPage" style="WIDTH: 563px; HEIGHT: 66px"><LEGEND><FONT color="maroon">&nbsp;⁄„·Ì«  
																		œ—Ì«›  «ÿ·«⁄« &nbsp;:&nbsp;</FONT></LEGEND><input class="CssBtnImportData" id="btnInput" style="WIDTH: 109px; HEIGHT: 35px" onclick="Onclick_Input()"
																	type="button" name="btnInput" Width="109px" Height="32px"></FIELDSET>
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 1px" vAlign="middle" align="center"></TD>
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
