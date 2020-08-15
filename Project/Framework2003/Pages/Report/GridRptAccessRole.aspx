<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GridRptAccessRole.aspx.vb" Inherits="FrameWork.GridRptAccessRole"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>GridRptAccessRole</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		////////////////////////////////////////////////////////////////////////////////////
		function onclickgrdGroup(SelectedRow)
		{
			var obj
			obj=grdGroup
			if(Form1.LastSelectedRowgrdGroup.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdGroup.value)).style.backgroundColor=''
			Form1.LastSelectedRowgrdGroup.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			Form1.GroupId.value=SelectedRow.GroupId
		}
		////////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssPage" id="Table5" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="0">
				<TR>
					<TD dir="rtl" vAlign="top" align="center">
						<TABLE id="Table11" style="WIDTH: 205px; HEIGHT: 16px" cellSpacing="1" cellPadding="1"
							align="center" border="0">
							<TR>
								<TD><asp:button id="LastBtn1" runat="server" CssClass="CssLastPage" Height="30px" Width="30px" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÂÎÑíä"></asp:button></TD>
								<TD align="right"><asp:button id="NextBtn1" runat="server" CssClass="CssNextPage" Height="30px" Width="30px" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÈÚÏí"></asp:button></TD>
								<TD style="WIDTH: 35px" vAlign="middle" align="right"><asp:textbox id="CurPage1" tabIndex="1" runat="server" CssClass="txtControls" Height="20px" Width="40px"
										BorderStyle="Groove" AutoPostBack="True"></asp:textbox></TD>
								<TD dir="rtl" vAlign="middle" align="center">&nbsp;ÇÒ</TD>
								<TD style="WIDTH: 40px" vAlign="middle" align="left"><asp:textbox id="Totalpage1" runat="server" CssClass="txtControls" Height="20px" Width="40px"
										BorderStyle="Groove" BackColor="White" ReadOnly="True"></asp:textbox></TD>
								<TD><asp:button id="PrevBtn1" runat="server" CssClass="CssPrevPage" Height="30px" Width="30px" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÞÈáí"></asp:button></TD>
								<TD><asp:button id="FirstBtn1" runat="server" CssClass="CssFirstPage" Height="30px" Width="30px"
										BorderStyle="None" BackColor="Transparent" BorderColor="Transparent" ToolTip="Çæáíä"></asp:button></TD>
								<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" type="text" name="txtReturnMessage1" runat="server">
									<asp:button id="Button1" style="DISPLAY: none" runat="server" Width="1px" Text="Button"></asp:button><asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
							</TR>
						</TABLE>
						<cc1:automationgrid id="grdAccess" dir="rtl" runat="server" CssClass="CssBackColor" Height="464px" SelectRowOnClick="False"
							AutoGenerateColumns="False" SendXML="DoNotSend" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
							ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
							ClientSorting="True" HtcAddress=" " Width="432px">
							<ItemStyle CssClass="CssItemStyle"></ItemStyle>
							<HeaderStyle CssClass="CssHeaderStyle"></HeaderStyle>
							<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
							<FooterStyle CssClass="CssFooterStyle"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="AccessTitle" HeaderText="äÇã ÏÓÊÑÓí">
									<HeaderStyle HorizontalAlign="Center" Width="200px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="PersonId" HeaderText="˜Ï ÑÓäáí">
									<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Family" HeaderText="äÇã ÎÇäæÇÏí æ äÇã ">
									<HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right" Width="150px"></ItemStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn>
									<HeaderStyle HorizontalAlign="Center" Width="20px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="20px"></ItemStyle>
									<ItemTemplate>
										<IMG id="image" align="middle" border="0" src='<%#SetSrc(DataBinder.Eval(Container.DataItem,"Type"))%>' title='<%#SetTitle(DataBinder.Eval(Container.DataItem,"Type"))%>'>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="FromTitle" HeaderText="ÇÒ ">
									<HeaderStyle HorizontalAlign="Center" Width="160px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right" Width="160px"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
							<EditItemStyle CssClass="CssEditItemStyle "></EditItemStyle>
							<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
						</cc1:automationgrid></TD>
					<td style="DISPLAY: none"><input id="LastSelectedRowgrdGroup" type="text" name="LastSelectedRowgrdGroup" runat="server">
						<input id="GroupId" type="text" name="GroupId" runat="server">
					</td>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
