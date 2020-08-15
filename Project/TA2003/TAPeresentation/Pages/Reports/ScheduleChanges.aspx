<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ScheduleChanges.aspx.vb" Inherits="TA.ScheduleChanges" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>----------------------------------------------------------------------------------------------------------------------------------------</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/KeySorting.js"></script>
		<script language="javascript">
		var LastSelectedRowgrd=null;
		var LastSelectedRowClassgrd="";
		
		function onclickgrdSchacule(SelectedRow)
		{
			
			if(LastSelectedRowgrd!=null)
			{
				LastSelectedRowgrd.className=LastSelectedRowClassgrd;
				
			}
			LastSelectedRowClassgrd=SelectedRow.className;
			LastSelectedRowgrd=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			Form1.ReplacementID.value=SelectedRow.ReplacementID	
			Form1.txtType.value=SelectedRow.Type
		}
			////___________________________________________________________________________
		function dbclickgrdSchacule(SelectedRow)
		{
			
		}
		////___________________________________________________________________________
		function onLoad()
		{
		window.name="ScheduleChanges"
		Form1.target=window.name
		}
		////___________________________________________________________________________

		function OnClickbtnCancel()
		{
			window.close()
		}
		/****************************************************************/
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Layer3" style="WIDTH: 615px; HEIGHT: 400px" height="400" cellSpacing="0"
										cellPadding="0" width="615" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 433px" vAlign="top" align="center">
												<TABLE id="Table1" style="WIDTH: 550px; HEIGHT: 464px" height="350" cellSpacing="1" cellPadding="1"
													width="610" border="0">
													<TBODY>
														<tr>
											</TD>
										</TR>
									</TABLE>
									<TABLE id="Table3" style="WIDTH: 620px; HEIGHT: 432px" cellSpacing="1" cellPadding="1"
										width="620" border="0">
										<TR>
											<TD></TD>
											<TD vAlign="top" align="center">
												<cc1:automationgrid id="grdSchedule" runat="server" Width="589px" AutoGenerateColumns="False" SendXML="DoNotSend"
													SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False" ShowHeader="False"
													SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False" ClientSorting="False"
													HtcAddress=" " Height="392px">
													<ItemStyle CssClass="CssItemStyle"></ItemStyle>
													<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
													<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
													<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
													<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="äæÚ ÊÛííÑ">
															<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
															<ItemTemplate>
																<asp:Label runat="server" Text='<%#SEtTitle( DataBinder.Eval(Container, "DataItem.Type")) %>' ID="Label1" NAME="Label1">
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="ãÊÞÇÖí">
															<HeaderStyle HorizontalAlign="Center" Width="140px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="140px"></ItemStyle>
															<ItemTemplate>
																<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FPerson") %>' title='<%# DataBinder.Eval(Container, "DataItem.FPersonelID") %>' ID="Label2" NAME="Label2">
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="ÌÇäÔíä">
															<HeaderStyle HorizontalAlign="Center" Width="140px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="140px"></ItemStyle>
															<ItemTemplate>
																<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SPerson") %>' title='<%# DataBinder.Eval(Container, "DataItem.SPersonelID") %>' ID="Label3" NAME="Label3">
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="SDate" HeaderText="ÊÇÑíÎ">
															<HeaderStyle HorizontalAlign="Center" Width="70px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="70px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="ReplacementID" HeaderText="ReplacementID">
															<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="1px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="Descr" HeaderText="ÊæÖíÍÇÊ">
															<HeaderStyle HorizontalAlign="Center" Width="160px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="160px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="Type" HeaderText="Type">
															<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="1px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="FPersonelID">
															<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="1px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn Visible="False" DataField="SPersonelID">
															<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="1px"></ItemStyle>
														</asp:BoundColumn>
													</Columns>
												</cc1:automationgrid></TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<tr>
								<td align="center">
									<TABLE id="Table2" style="WIDTH: 60px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="60"
										border="0">
										<TR>
											<TD><INPUT class="CssBtnCancel" id="btnCancel" style="DISPLAY: inline" onclick="OnClickbtnCancel()"
													type="button" name="btnTOPCancel"></TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<TR>
					<TD style="DISPLAY: none"><input id="txtPersonID" type="text" name="txtPersonID" runat="server">
						<input type="text" id="txtType" runat="server"><input id="txtTmpDate" type="text" name="txtTmpDate" runat="server">
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity><input type="text" id="ReplacementID" runat="server"></TD>
				</TR>
			</table>
			</TD></TR></TBODY></TABLE>
		</form>
	</body>
</HTML>
