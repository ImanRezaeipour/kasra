<%@ Page Language="vb" AutoEventWireup="false" Codebehind="BasicInformation.aspx.vb" Inherits="FrameWork.BasicInformation"%>
<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>BasicInformation</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="<%=commonLib.StyleLibURL%>" type=text/css 
rel=stylesheet>
		<!-- #include file="../includes/asplib.inc" -->
	</HEAD>
	<BODY dir=rtl bottomMargin=0 leftMargin=0 background="<%=LeftBackground%>" 
topMargin=0 scroll=YES rightMargin=0>
		<FORM id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="WIDTH: 757px; HEIGHT: 236px" cellSpacing="1" cellPadding="1" width="757" border="0">
				<TR>
					<TD vAlign="center" align="middle">
						<TABLE id="Table4" style="WIDTH: 479px; HEIGHT: 38px" cellSpacing="1" cellPadding="1" width="479" align="center" border="1" DESIGNTIMEDRAGDROP="14">
							<TR>
								<TD>
									<DIV align="center"><cc2:xmlgrid id="Xmlgrid1" runat="server" BackColor="#CCCCCC" AutoBound="True" Width="538px" Height="90px" HorizontalAlign="Center" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
											<SelectedItemStyle Font-Bold="True" HorizontalAlign="Center" ForeColor="White" VerticalAlign="Middle" BackColor="DarkGray"></SelectedItemStyle>
											<EditItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditItemStyle>
											<AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" ForeColor="White" VerticalAlign="Middle" BackColor="Desktop"></HeaderStyle>
											<FooterStyle HorizontalAlign="Center" VerticalAlign="Top" BackColor="#CCCCCC"></FooterStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="LID" HeaderText="LookupID">
													<HeaderStyle Width="60px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="GrpID" HeaderText="GrpID">
													<HeaderStyle Width="60px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Title" HeaderText="⁄‰Ê«‰">
													<HeaderStyle Width="60px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="IntVal" HeaderText="„ﬁœ«— »«“ê‘ Ì ⁄œœÌ">
													<HeaderStyle Width="150px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="StrVal" HeaderText="„ﬁœ«— »«“ê‘ Ì ò«—«ò —Ì">
													<HeaderStyle Width="150px"></HeaderStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle VerticalAlign="Middle" HorizontalAlign="Center"></PagerStyle>
										</cc2:xmlgrid></DIV>
								</TD>
								<DIV></DIV>
							</TR>
						</TABLE>
						<p></p>
						<TABLE id="Table2" style="WIDTH: 436px; HEIGHT: 298px" cellSpacing="1" cellPadding="1" width="436" border="0" class="BlueGroove">
							<TR>
								<TD>
									<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="300" align="center" border="0">
										<TR>
											<TD style="WIDTH: 152px; HEIGHT: 18px">‰«„ ê—ÊÂ «ÿ·«⁄«  Å«ÌÂ</TD>
											<TD style="HEIGHT: 18px">
												<P align="right"><cc1:lcombo id="GrpID" runat="server" Width="150px" LookupName="BasicInformation" AutoPostBack="True" ConnectionName="GenConn"></cc1:lcombo></P>
											</TD>
										</TR>
										<TR>
											<TD style="WIDTH: 152px">⁄‰Ê«‰</TD>
											<TD>
												<P align="right"><asp:textbox id="Title" runat="server" Width="150px"></asp:textbox></P>
											</TD>
										</TR>
										<TR>
											<TD style="WIDTH: 152px">„ﬁœ«— »«“ê‘ Ì ⁄œœÌ</TD>
											<TD>
												<P align="right"><asp:textbox id="IntVal" runat="server" Width="150px"></asp:textbox></P>
											</TD>
										</TR>
										<TR>
											<TD style="WIDTH: 152px">„ﬁœ«— »«“ê‘ Ì Å«ÌÂ</TD>
											<TD>
												<P align="right"><asp:textbox id="StrVal" runat="server" Width="150px"></asp:textbox></P>
											</TD>
										</TR>
									</TABLE>
									<P>
										<HR style="BORDER-RIGHT: lightsteelblue thin groove; BORDER-TOP: lightsteelblue thin groove; BORDER-LEFT: lightsteelblue thin groove; BORDER-BOTTOM: lightsteelblue thin groove">
										<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
										<asp:textbox id="LID" style="DISPLAY: none" runat="server" Width="139px" Height="27px"></asp:textbox>
									<P></P>
									<P>
										<TABLE id="Table5" style="WIDTH: 220px; HEIGHT: 31px" height="31" cellSpacing="5" cellPadding="2" width="250" align="center" border="0">
											<TR height="30">
												<TD width="33%">
													<asp:button id="btnnew" runat="server" Height="100%" Width="100%" CssClass="btnSave" Text="«ÌÃ«œ"></asp:button></TD>
												<TD width="33%">
													<asp:button id="btnSave" runat="server" Height="100%" Width="100%" CssClass="btnSave" Text="–ŒÌ—Â"></asp:button></TD>
												<TD width="33%">
													<asp:button id="btnDelete" runat="server" Height="100%" Width="100%" CssClass="btnSave" Text="Õ–›"></asp:button></TD>
											</TR>
										</TABLE>
									</P>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
