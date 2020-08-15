<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FlowDoc.aspx.vb" Inherits="TA.FlowDoc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>—Ê‰œ  «ÌÌœ ”‰œ </title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/Framework/Includes/StyleForPages.css" type="text/css"
			rel="stylesheet">
		<script language="javascript">
			
			function OnClickBtnCancel()
				{
					window.close()
				}
			
			//-----------------------------------------------
			function OnLoadPage()
				{
					var j;
					var c;
					for(j=0;j<grdFlow.rows.length;++j)
					{
						if (grdFlow.rows(j).ActionType!=0 & grdFlow.rows(j).ActionType!=50) // €Ì— «“  «ÌÌœ 
							grdFlow.rows(j).style.backgroundColor='#ffdbeb' // ’Ê— Ì
						if (grdFlow.rows(j).Do==0 ) // «‰Ã«„ ‰‘œÂ
						{
							grdFlow.rows(j).style.backgroundColor='#ffffff' // ”›Ìœ
							for (c=0;c<grdFlow.rows(j).cells.length;c++)
							{
								grdFlow.rows(j).cells(c).style.borderBottomWidth="1"
								grdFlow.rows(j).cells(c).style.borderBottomColor="#d3d3d3"
							}
						}
					}
				}
				
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0" onload="OnLoadPage()">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<TR>
								<TD vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" dir="rtl" style="HEIGHT: 385px" cellSpacing="0" cellPadding="0"
										width="875" border="2">
										<TR>
											<TD id="DownRow" style="DISPLAY: inline" vAlign="top" align="center" height="352">
												<TABLE id="Table5" style="HEIGHT: 331px" height="331" cellSpacing="2" cellPadding="2" width="100%"
													align="right" border="0">
													<TR>
														<TD vAlign="top" align="center" style="HEIGHT: 337px"><cc1:automationgrid id="grdFlow" dir="rtl" runat="server" Height="299px" HtcAddress=" " ClientSorting="True"
																CreateClientSideScripts="False" UsingKeyBoard="False" AutoGenerateColumns="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False"
																Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" SelectRowOnClick="False" CssClass="CssBackColor" Width="865px"><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssFooterStyle"></FOOTERSTYLE>
																<COLUMNS>
																	<ASP:TEMPLATECOLUMN>
																		<HEADERSTYLE Width="20px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="20px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG 
                        title='<%#DataBinder.Eval(Container.DataItem,"ActionTitle")%>' 
                        src='<%#DataBinder.Eval(Container.DataItem,"IconUrl")%>' 
                        align=middle border=0>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="òœ Å—”‰·Ì" DataField="PersonId">
																		<HEADERSTYLE Width="60px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="60px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰«„" DataField="PersonelName">
																		<HEADERSTYLE Width="150px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="150px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="”„ " DataField="RoleName">
																		<HEADERSTYLE Width="190px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="190px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «ÌÌœ" DataField="ToPersonId">
																		<HEADERSTYLE Width="50px" HorizontalAlign="left"></HEADERSTYLE>
																		<ITEMSTYLE Width="50px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="ò‰‰œÂ Ã«‰‘Ì‰" DataField="ToPersonelName">
																		<HEADERSTYLE Width="100px" HorizontalAlign="right"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="”«⁄ " DataField="ActionTime">
																		<HEADERSTYLE Width="60px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="60px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «—ÌŒ" DataField="ActionDate">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Ê÷⁄Ì " DataField="StatusTitle">
																		<HEADERSTYLE Width="100px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText=" Ê÷ÌÕ« ">
																		<HEADERSTYLE Width="115px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="115px" HorizontalAlign="Right"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label1 title='<%# DataBinder.Eval(Container, "DataItem.Descr") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DescrSummery") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN DataField="ActionType" Visible="False">
																		<HEADERSTYLE Width="2px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="2px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="Do" Visible="False">
																		<HEADERSTYLE Width="2px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="2px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
																<EDITITEMSTYLE CssClass="CssEditItemStyle "></EDITITEMSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
															</cc1:automationgrid></TD>
													</TR>
													<TR>
														<TD vAlign="top" align="center">
															<TABLE id="Table9" cellSpacing="5" cellPadding="2" border="0">
																<TR height="30">
																	<TD style="WIDTH: 6px" vAlign="middle" align="center" width="6"><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel();" type="button"></TD>
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
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
