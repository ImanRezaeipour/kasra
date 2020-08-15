<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RptOnLineUser.aspx.vb" Inherits="FrameWork.RptOnLineUser" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>RptOnLineUser</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body id="body" topmargin="0" rightmargin="0" leftmargin="0" bottommargin="0" scroll="no">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="middle" align="center">
						&nbsp;
						<TABLE class="CssLayer2" id="Table2" height="98%" cellSpacing="1" cellPadding="1" width="98%"
							border="0">
							<TR>
								<TD  align="center">
									<br />
									<TABLE class="CssPage" id="Table3" height="475" cellSpacing="1" cellPadding="1" width="681"
										border="0" style="WIDTH: 681px; HEIGHT: 475px">
										<TR>
											<TD vAlign="top" align="right">
												<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="661" border="0" style="WIDTH: 661px; HEIGHT: 467px"
													align="right">
													<TR>
														<TD vAlign="top" style="HEIGHT: 18px">
															<TABLE id="Table15" style="WIDTH: 706px; HEIGHT: 43px" cellSpacing="5" cellPadding="0"
																width="706" align="right" bgColor="#91b7df" border="0">
																<TR>
																	<TD class="VertGradient1" id="TdGridGroup" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 33px"
																		align="center">ê“«—‘ ò«—»—«‰ ›⁄«·</TD>
																	<TD style="FONT-WEIGHT: bold; FONT-SIZE: 13pt; COLOR: #ffffff" align="left"> ⁄œ«œ 
																		ò· ò«—»—«‰ ›⁄«· :
																	</TD>
																	<TD style="FONT-WEIGHT: bold; FONT-SIZE: 13pt; COLOR: red" align="right" id="AllActiveUser"
																		runat="server">534</TD>
																	<TD style="FONT-WEIGHT: bold; FONT-SIZE: 13pt; WIDTH: 252px; COLOR: #ffffff" align="left"> ⁄œ«œ 
																		ò«—»—«‰ ›⁄«· œ—&nbsp;Õ«· ‰„«Ì‘&nbsp;:
																	</TD>
																	<TD id="CurActiveUser" runat="server" style="FONT-WEIGHT: bold; FONT-SIZE: 13pt; COLOR: red"
																		align="right">333</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="top">
															<TABLE id="Table5" style="WIDTH: 440px; HEIGHT: 40px" cellSpacing="1" cellPadding="1" width="440"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 56px">‰«„ ”Ì” „</TD>
																	<TD style="WIDTH: 199px">
																		<cc1:LCombo id="selSubSys" runat="server" Width="200px" ConnectionName="GenCnn" FirstSelect="True"
																			LookupName="SubSys" CssClass="TxtControls"></cc1:LCombo></TD>
																	<TD style="WIDTH: 175px"><INPUT class="CssBtnLimitSerach" id="btnLimitSerach" style="WIDTH: 100px; HEIGHT: 32px"
																			type="button" name="btnLimitSerach" runat="server">&nbsp; <INPUT class="CssBtnShow" id="btnShow" style="WIDTH: 67px; HEIGHT: 32px" type="button"
																			name="btnShow" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="top">
															<cc1:automationgrid id="grdRptOnLineUser" runat="server" Width="508px" CssClass="CssbackColor" AutoGenerateColumns="False"
																SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
																ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
																ClientSorting="False" HtcAddress=" " Height="352px">
																<ItemStyle CssClass="CssItemStyle"></ItemStyle>
																<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
																<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
																<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
																<Columns>
																	<asp:BoundColumn DataField="PersonId" HeaderText="òœ Å—”‰·Ì">
																		<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="FullName" HeaderText="‰«„ Œ«‰Ê«œêÌ Ê ‰«„">
																		<HeaderStyle HorizontalAlign="Center" Width="180px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="180px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="SysTitle" HeaderText="‰«„ ”Ì” „">
																		<HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="MenuTitle" HeaderText="‰«„ „‰Ê">
																		<HeaderStyle HorizontalAlign="Center" Width="180px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Right" Width="180px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="HitDate" HeaderText=" «—ÌŒ">
																		<HeaderStyle HorizontalAlign="Center" Width="70px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="70px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="HitTime" HeaderText="“„«‰">
																		<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
																	</asp:BoundColumn>
																</Columns>
																<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
															</cc1:automationgrid></TD>
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
