<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GetTableOffice.aspx.vb" Inherits="TA.GetTableOffice" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>-----------------------------------œ›« — 
			 «»·----------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var LastSelectedRow=null
		var LastSelectedRowClass=""
		//============================================================================================
		function onclickgrdGroup(SelectedRow)
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
		function ondblclickgrdGroup(SelectedRow)
		{
		
		}
		//====================================================================
		function OnClickBtnOK()
		{
			returnValue=document.getElementById("txtXML").value
			window.close()
		}
		//====================================================================
		function chkOnClick(chk)
		{
			var TablID
			TablID=chk.parentElement.parentElement.TableOfficeId
			xmlDoc = new ActiveXObject("MsXml2.DomDocument")
			xmlDoc.loadXML(document.getElementById("txtXML").value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/OfficeEntity/GetOfficeTable"+"[TableOfficeId="+TablID+"]");

			if (chk.checked)
				xmlNodes.item(0).selectSingleNode('selected').text=1
			else
				xmlNodes.item(0).selectSingleNode('selected').text=0
			document.getElementById("txtXML").value=xmlDoc.xml
		}
		//====================================================================
		function pageLoad()
		{
			returnValue=""
			window.name="GetTableOffice"
			document.getElementById("Form1").target=window.name
		}
		//=======================================================================
		function OnClickBtnCancel()
		{
			returnValue=""
			window.close()
		}
		//=======================================================================
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="20" width="100%"
				align="center" border="0">
				<tr>
					<td style="HEIGHT: 509px" vAlign="top" align="center">
						<TABLE class="CssPage" id="Layer3" dir="rtl" style="WIDTH: 361px; HEIGHT: 313px" cellSpacing="0"
							cellPadding="8" align="center" border="0">
							<TR>
								<TD id="TopRow" dir="rtl" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; TOP: 5px; HEIGHT: 182px"
									vAlign="top" align="left">
									<TABLE id="Table16" style="WIDTH: 257px; HEIGHT: 40px" cellSpacing="1" cellPadding="1"
										align="center" border="0">
										<TR>
											<TD><asp:button id="LastBtn1" runat="server" Width="39px" Height="31px" CssClass="CssLastPage" BackColor="Transparent"
													BorderStyle="None" BorderColor="Transparent" ToolTip="¬Œ—Ì‰"></asp:button></TD>
											<TD align="right"><asp:button id="NextBtn1" runat="server" Width="42px" Height="26px" CssClass="CssNextPage" BackColor="Transparent"
													BorderStyle="None" BorderColor="Transparent" ToolTip="»⁄œÌ"></asp:button></TD>
											<TD style="WIDTH: 35px" vAlign="middle" align="right"><asp:textbox id="CurPage1" tabIndex="1" runat="server" Width="40px" Height="20px" CssClass="txtControls"
													BorderStyle="Groove" AutoPostBack="True"></asp:textbox></TD>
											<TD dir="rtl" vAlign="middle" align="center">«“</TD>
											<TD style="WIDTH: 40px" vAlign="middle" align="left"><asp:textbox id="Totalpage1" runat="server" Width="40px" Height="20px" CssClass="txtControls"
													BackColor="White" BorderStyle="Groove" ReadOnly="True"></asp:textbox></TD>
											<TD style="WIDTH: 39px"><asp:button id="PrevBtn1" runat="server" Width="33px" Height="27px" CssClass="CssPrevPage" BackColor="Transparent"
													BorderStyle="None" BorderColor="Transparent" ToolTip="ﬁ»·Ì"></asp:button></TD>
											<TD>
												<asp:button id="FirstBtn1" runat="server" Width="34px" Height="31px" CssClass="CssFirstPage"
													BackColor="Transparent" BorderStyle="None" BorderColor="Transparent" ToolTip="«Ê·Ì‰"></asp:button></TD>
											<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" type="text" name="txtReturnMessage1" runat="server">
												<asp:button id="Button1" style="DISPLAY: none" runat="server" Width="1px" Text="Button"></asp:button>
												<asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
										</TR>
									</TABLE>
									<cc1:automationgrid id="grdGroup" runat="server" HtcAddress=" " ClientSorting="False" CreateClientSideScripts="False"
										UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False"
										Scrolling="True" ClientPageSize="0" SelectRowOnClick="False" SendXML="DoNotSend" AutoGenerateColumns="False"
										Height="184px" Width="276px">
										<ItemStyle CssClass="CssItemStyle"></ItemStyle>
										<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
										<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
										<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
										<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="TableOfficeId" HeaderText="TableOfficeId">
												<HeaderStyle Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="25px"></HeaderStyle>
												<ItemStyle Width="25px"></ItemStyle>
												<ItemTemplate>
													<input type="checkbox" onclick="chkOnClick(this)">
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="‰«„">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.STableOfficeName") %>' title='<%# DataBinder.Eval(Container, "DataItem.BTableOfficeName") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="‘—Õ">
												<HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.STableOfficeDescr") %>' title='<%# DataBinder.Eval(Container, "DataItem.STableOfficeDescr") %>' >
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
									</cc1:automationgrid></TD>
							</TR>
							<TR>
								<TD style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; TOP: 5px"
									vAlign="top" align="center">
									<HR class="CssHorizontalLine" style="WIDTH: 67.39%; HEIGHT: 2px" SIZE="2">
									<TABLE id="Table5" cellSpacing="2" cellPadding="3" border="0">
										<TR>
											<TD><INPUT class="CssBtnOK" id="btnOk" onclick="OnClickBtnOK()" type="button" name="btnOk"></TD>
											<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
											<TD style="DISPLAY: none">
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<TR>
					<TD vAlign="top" style="DISPLAY:none" align="center">
						<input id="txtXML" type="text" name="txtXML" runat="server">
					</TD>
				</TR>
			</table>
		</form>
	</body>
</HTML>
