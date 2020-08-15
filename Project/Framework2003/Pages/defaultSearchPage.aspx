<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="defaultSearchPage.aspx.vb" Inherits="FrameWork.defaultSearchPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<TITLE>defaultSearchPage</TITLE> 
		<!-- #include file="../includes/asplib.inc" -->
		<META http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="<%=Onlineuser.commonLib.StyleLibURL%>" 
type=text/css rel=stylesheet>
		<script language="javascript">
		function LoadRec(id)
		{
			id='0'+id
			try
			{
				var obj = top.window.frames("Left").window.document.all("_SearchID");
			}
			catch(e)
			{
				var obj = parent.document.all("_SearchID");
			}
			if (obj!=null)
			{
				obj.DocID=id;
				obj.click();
				
			}
		}
		</script>
	</HEAD>
	<body dir=rtl bottomMargin=0 leftMargin=0 background="<%=RightBackground%>" 
topMargin=0 scroll=yes rightMargin=0 align="center">
		<FORM id="Form1" method="post" runat="server">
			<TABLE class="label" id="Table2" dir="rtl" height="100%" cellSpacing="0" cellPadding="4"
				width="100%" border="0">
				<TBODY>
				</TBODY>
			</TABLE>
			<IMG style="WIDTH: 31px; HEIGHT: 28px" onclick='vbscript:showserach("inline")' height="28"
				alt="" src="../images/buttons/btn_search.gif" width="31">
			<table id="search" style="DISPLAY: none;WIDTH: 100%">
				<TR>
					<TD style="HEIGHT: 447px" vAlign="middle" noWrap>
						<div class="ScrollBar" style="SCROLLBAR-FACE-COLOR: #204b7e; OVERFLOW: auto; WIDTH: 100%; SCROLLBAR-3DLIGHT-COLOR: #204b7e; SCROLLBAR-ARROW-COLOR: white; SCROLLBAR-BASE-COLOR: #204b7e; HEIGHT: 99.8%">
							<table style="WIDTH: 100%; HEIGHT: 129px" width="799" border="0">
								<tr>
									<td id="label0" style="WIDTH: 704px"><SPAN class="label">
											<%=searchObj.Templete("param0Label")%>
										</SPAN>
									</td>
								</tr>
								<tr>
									<td style="WIDTH: 704px"><INPUT class="input" id="Param0" style="WIDTH: 100%; HEIGHT: 25px" type="text" size="83"
											name="Param0" runat="server">
									</td>
								</tr>
								<TR>
									<td id="label1" style="WIDTH: 704px"><SPAN class="label">
											<%=searchObj.Templete("param1Label")%>
										</SPAN>
									</td>
								</TR>
								<TR>
									<TD style="WIDTH: 704px"><INPUT class="input" id="param1" style="WIDTH: 100%; HEIGHT: 25px" type="text" size="83"
											name="Param0" runat="server"></TD>
									<TD width="30"></TD>
								</TR>
								<TR>
									<td id="label2" style="WIDTH: 704px"><SPAN class="label">
											<%=searchObj.Templete("param2Label")%>
										</SPAN>
									</td>
								</TR>
								<TR>
									<TD style="WIDTH: 704px"><INPUT class="input" id="param2" style="WIDTH: 100%; HEIGHT: 25px" type="text" size="83"
											name="Param0" runat="server"></TD>
									<TD width="30"></TD>
								</TR>
								<TR>
									<td id="label3" style="WIDTH: 704px"><SPAN class="label">
											<%=searchObj.Templete("param3Label")%>
										</SPAN>
									</td>
								</TR>
								<TR>
									<TD style="WIDTH: 704px"><INPUT class="input" id="param3" style="WIDTH: 100%; HEIGHT: 25px" type="text" size="83"
											name="Param0" runat="server"></TD>
									<TD width="30"></TD>
								</TR>
								<TR>
									<td id="label4" style="WIDTH: 704px"><SPAN class="label">
											<%=searchObj.Templete("param4Label")%>
										</SPAN>
									</td>
								</TR>
								<TR>
									<TD style="WIDTH: 704px"><INPUT class="input" id="param4" style="WIDTH: 100%; HEIGHT: 25px" type="text" size="83"
											name="Param0" runat="server"></TD>
									<TD width="30"></TD>
								</TR>
							</table>
						</div>
				<tr>
					<td width="30"><asp:button id="btnSearch" runat="server" BackColor="#FFFFC0" CssClass="btnsave" Text="شروع جستجو"
							ForeColor="#000040"></asp:button></td>
				</tr>
				</TD></TR></table>
			<TR height="90%">
				<TD>
					<div class="ScrollBar" style="SCROLLBAR-FACE-COLOR: #204b7e;  WIDTH: 100%;  SCROLLBAR-3DLIGHT-COLOR: #204b7e;  SCROLLBAR-ARROW-COLOR: white;  SCROLLBAR-BASE-COLOR: #204b7e;  HEIGHT: 100%">
						<asp:datagrid id="ResultGrid" runat="server" CellPadding="2" AutoGenerateColumns="False" Width="100%"
							Height="100%" HorizontalAlign="Center">
							<AlternatingItemStyle CssClass="GAlternateItem"></AlternatingItemStyle>
							<ItemStyle CssClass="GNormalItem"></ItemStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="GHeader" VerticalAlign="Middle"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderStyle Wrap="False" HorizontalAlign="Right" Width="100%"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<HeaderTemplate>
										<%# searchObj.Templete("resultCaption")%>
									</HeaderTemplate>
									<ItemTemplate>
										<span  DocID='<%#DataBinder.Eval(Container.DataItem, searchObj.Templete("IDfieldname")) %>' >
											<%#DataBinder.Eval(Container.DataItem, searchObj.Templete("ItemFieldname")) %>
										</span>
									</ItemTemplate>
									<FooterStyle Wrap="False"></FooterStyle>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid></div>
				</TD>
			</TR>
			</TBODY></TABLE><cc1:mysecurity id="Onlineuser" runat="server"></cc1:mysecurity>
			<script language="vbscript">
				if document.all("label1").innertext="" then 
					document.all("label1").style.display="none"
					document.all("param1").style.display="none"
				end if
				if document.all("label2").innertext="" then 
					document.all("label2").style.display="none"
					document.all("param2").style.display="none"
				end if
				if document.all("label3").innertext="" then 
					document.all("label3").style.display="none"
					document.all("param3").style.display="none"
				end if
				if document.all("label4").innertext="" then 
					document.all("label4").style.display="none"
					document.all("param4").style.display="none"
				end if
				sub showserach(state)
					document.all("search").style.display=state
				end sub
			</script>
		</FORM>
	</body>
</HTML>
