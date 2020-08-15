<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ItmesRounding.aspx.vb" Inherits="TA.ItmesRounding" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>ItmesRounding</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		var newrowindex=0
		var UserFlag=0
		var LastSelectedRow=null
		var LastSelectedRowClass=""
		function chkParamOnclick()
		{
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			var xmlNodes;
			var optionEl;
			var j;
			xmlDoc.loadXML(Form1.txtXmlGetCalculatedParameters.value);
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/GetCalculatedParameters");
			document.all('LCombo2').innerHTML=""
			optionEl=document.createElement("OPTION")
			document.all('LCombo2').options.add(optionEl)
			document.all('LCombo2').all(0).innerText='«‰ Œ«» ‰‘œÂ'
			document.all('LCombo2').all(0).value=0
			var i=1
			
			for(j=0;j<xmlNodes.length;j++)
			{
				optionEl=document.createElement("OPTION")
				document.all('LCombo2').options.add(optionEl)
				document.all('LCombo2').all(i).innerText=xmlNodes.item(j).childNodes(1).text
				document.all('LCombo2').all(i).value=xmlNodes.item(j).childNodes(0).text
				
				i++
			}
		}
		//============================================================================================
		function chkCreditOnclick()
		{
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			var xmlNodes;
			var optionEl;
			var j;
			xmlDoc.loadXML(Form1.txtXml.value);
			//alert(Form1.txtXml.value)
			
			//var root='/UserEntity/GetCode';
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/GetCode");
			//xmlNodes=xmlDoc.documentElement.selectNodes(root);
			
			document.all('LCombo2').innerHTML=""
			optionEl=document.createElement("OPTION")
			document.all('LCombo2').options.add(optionEl)
			document.all('LCombo2').all(0).innerText='«‰ Œ«» ‰‘œÂ'
			document.all('LCombo2').all(0).value=0
			var i=1
			
			for(j=0;j<xmlNodes.length;j++)
			{
				optionEl=document.createElement("OPTION")
				document.all('LCombo2').options.add(optionEl)
				document.all('LCombo2').all(i).innerText=xmlNodes.item(j).childNodes(1).text
				document.all('LCombo2').all(i).value=xmlNodes.item(j).childNodes(0).text
				
				i++
			}
		}
		//____________________________________________________________________________________________
		function onclickgrdgrdItems(SelectedRow)
		{	
			//====================
				if(LastSelectedRow!=null)
				{
					LastSelectedRow.className=LastSelectedRowClass;
				}
				LastSelectedRowClass=SelectedRow.className;
				LastSelectedRow=SelectedRow;
				SelectedRow.className="CssSelectedItemStyle";
		}
		//============================================================================================
		function ondblclickgrdgrdItems(SelectedRow)
		{
		
		}
		//============================================================================================
		function onclickbtnNew()
		{
			document.getElementById("DownRow").style.display="inline"
			document.getElementById("TopRow").style.display="none"
			
		}
		//============================================================================================
		function onclickbtnCancel()
		{
			document.getElementById("DownRow").style.display="none"
			document.getElementById("TopRow").style.display="inline"
			
		}
		//============================================================================================
		</script>
	</HEAD>
	<body dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0"
		MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="463" cellSpacing="0" cellPadding="0" width="839"
							align="center" border="0" style="WIDTH: 839px; HEIGHT: 463px">
							<tr>
								<td vAlign="middle" align="center" dir="rtl">
									<TABLE class="CssPage" id="Page" dir="rtl" cellSpacing="0" cellPadding="0" align="center"
										border="0" style="WIDTH: 622px; HEIGHT: 230px">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 262px" vAlign="middle" align="center">
												<cc1:automationgrid id="grdItems" dir="rtl" runat="server" Height="265px" SelectRowOnMouseMove="False"
													SelectRowOnClick="True" HtcAddress=" " ClientPageSize="0" SendXML="DoNotSend" CreateClientSideScripts="False"
													ClientSorting="False" EnableClientPager="False" Scrolling="True" UsingKeyBoard="False" ShowHeader="False"
													AutoGenerateColumns="False" name="grdNumResult" Width="497px">
													<ItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssItemStyle"></ItemStyle>
													<HeaderStyle Font-Size="8.5pt" Font-Names="tahoma" Font-Bold="True" HorizontalAlign="Right" CssClass="CssHeaderStyle"></HeaderStyle>
													<AlternatingItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
													<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
													<EditItemStyle Font-Size="8.5pt" Font-Names="tahoma"></EditItemStyle>
													<SelectedItemStyle Font-Size="8.5pt" Font-Names="tahoma" CssClass="CssSelectedItemStyle"></SelectedItemStyle>
													<Columns>
														<asp:BoundColumn HeaderText="‰«„ ¬Ì „">
															<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText="‰Ê⁄ ¬Ì „">
															<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText="«“ „ﬁœ«—">
															<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText=" « „ﬁœ«—">
															<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText="„ﬁœ«— ÃœÌœ">
															<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText=" »œÌ· »Â „ÃÊ“">
															<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText="—Ê“«‰Â/„«Â«‰Â">
															<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
														<asp:BoundColumn HeaderText=" Ê÷ÌÕ« ">
															<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
															<FooterStyle HorizontalAlign="Center"></FooterStyle>
														</asp:BoundColumn>
													</Columns>
												</cc1:automationgrid>
												<HR style="WIDTH: 585px; COLOR: black; HEIGHT: 1px" align="center" SIZE="1">
												<TABLE id="Table2" style="WIDTH: 191px; HEIGHT: 34px" cellSpacing="3" cellPadding="2" width="191"
													align="center" border="0">
													<TR>
														<TD align="center"><INPUT class="CssBtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew"></TD>
														<TD align="center"><INPUT class="CssBtnEdit" id="btnEdit" type="button" name="btnEdit"></TD>
														<TD align="center"><INPUT class="CssBtnDelete" id="btnDelete" type="button" name="btnDelete"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="DownRow" style="DISPLAY: none" vAlign="middle" align="center">
												<TABLE id="Table1" style="WIDTH: 613px; HEIGHT: 202px" cellSpacing="0" cellPadding="0"
													width="613" align="center" border="0">
													<TR>
														<TD style="WIDTH: 268px; HEIGHT: 87px" colSpan="2">
															<TABLE id="Table7" style="WIDTH: 616px; HEIGHT: 115px" cellSpacing="0" cellPadding="0"
																width="616" align="center" border="0">
																<TR>
																	<TD style="WIDTH: 181px; HEIGHT: 94px">
																		<FIELDSET class="CssPage" dir="rtl" style="WIDTH: 173px; HEIGHT: 80px" align="middle"><LEGEND>‰Ê⁄ 
																				¬Ì „</LEGEND>
																			<TABLE id="Table4" style="WIDTH: 157px; HEIGHT: 48px" cellSpacing="0" cellPadding="0" width="157"
																				border="0">
																				<TR>
																					<TD style="WIDTH: 17px" align="left"><INPUT type="radio" name="chkParamG" id="chkParam" onclick="chkParamOnclick()"></TD>
																					<TD align="right">Å«—«„ — Â«Ì Õ÷Ê— €Ì«»</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 17px" align="left"><INPUT type="radio" name="chkParamG" id="chkCredit" onclick="chkCreditOnclick()"></TD>
																					<TD align="right">„ÃÊ“</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 17px" align="left"><INPUT type="radio" name="g1"></TD>
																					<TD align="right">¬Ì „ Â«Ì ò«—ò—œÌ</TD>
																				</TR>
																			</TABLE>
																		</FIELDSET>
																	</TD>
																	<TD style="WIDTH: 324px; HEIGHT: 94px" vAlign="middle" align="center">
																		<TABLE id="Table6" style="WIDTH: 419px; HEIGHT: 32px" cellSpacing="0" cellPadding="0" width="419"
																			border="0">
																			<TR>
																				<TD style="WIDTH: 43px">‰«„ ¬Ì „:</TD>
																				<TD style="WIDTH: 185px">
																					<cc1:LCombo id="LCombo2" runat="server" Width="180px" CssClass="TxtControls" LookupName="full"
																						ConnectionName="GenCnn"></cc1:LCombo></TD>
																				<TD style="WIDTH: 69px">»«“œÂ ⁄„·ò—œ:</TD>
																				<TD style="WIDTH: 20px"><INPUT type="radio" CHECKED name="G2"></TD>
																				<TD style="WIDTH: 29px">—Ê“«‰Â</TD>
																				<TD style="WIDTH: 20px"><INPUT type="radio" name="G2"></TD>
																				<TD>„«Â«‰Â</TD>
																			</TR>
																		</TABLE>
																		<TABLE id="Table9" style="WIDTH: 425px; HEIGHT: 59px" cellSpacing="0" cellPadding="0" width="425"
																			border="0">
																			<TR>
																				<TD style="WIDTH: 63px">«“ „ﬁœ«—:</TD>
																				<TD style="WIDTH: 77px"><INPUT class="TxtControls" id="Text4" style="WIDTH: 57px; HEIGHT: 22px" type="text" size="7"
																						name="txtName"></TD>
																				<TD style="WIDTH: 49px" align="left"> « „ﬁœ«—:</TD>
																				<TD><INPUT class="TxtControls" id="Text5" style="WIDTH: 57px; HEIGHT: 22px" type="text" size="7"
																						name="txtName"></TD>
																			</TR>
																			<TR>
																				<TD style="WIDTH: 63px">„ﬁœ«— ÃœÌœ:</TD>
																				<TD style="WIDTH: 77px"><INPUT class="TxtControls" id="Text6" style="WIDTH: 57px; HEIGHT: 22px" type="text" size="7"
																						name="txtName"></TD>
																				<TD style="WIDTH: 49px" align="left">„ÃÊ“:</TD>
																				<TD>
																					<cc1:LCombo id="LCombo4" runat="server" Width="118px" CssClass="TxtControls"></cc1:LCombo></TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
															</TABLE>
															<TABLE id="Table8" cellSpacing="0" cellPadding="0" width="100%" border="0">
																<TR>
																	<TD> Ê÷ÌÕ« :
																	</TD>
																	<TD><INPUT class="TxtControls" id="Text3" style="WIDTH: 528px; HEIGHT: 64px" type="text" size="82"
																			name="txtName"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<HR style="WIDTH: 496px; COLOR: black; HEIGHT: 1px" align="center" SIZE="1">
												<INPUT class="CssBtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button" name="btnCancel">
												<INPUT class="CssBtnSave" id="BtnSave" type="button" name="BtnSave">
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</TR>
				<TR>
					<td style="DISPLAY: none">
						<INPUT id="txtXml" type="text" runat="server" name="txtXml"> <INPUT id="txtXmlGetCalculatedParameters" type="text" runat="server" name="txtXmlGetCalculatedParameters">
					</td>
				<tr>
				</tr>
			</table>
		</form>
	</body>
</HTML>
