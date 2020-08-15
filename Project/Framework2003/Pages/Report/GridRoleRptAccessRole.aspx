<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GridRoleRptAccessRole.aspx.vb" Inherits="FrameWork.GridRoleRptAccessRole"%>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>GridRoleRptAccessRole</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		////////////////////////////////////////////////////////////////////////////////////
		function onclickgrdRole(SelectedRow)
		{
			var obj
			obj=grdRole
			if(Form1.LastSelectedRowgrdRole.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdRole.value)).style.backgroundColor=''
			Form1.LastSelectedRowgrdRole.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			Form1.RoleId.value=SelectedRow.RoleId
		}
		////////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" bottomMargin="0" leftMargin="0" topMargin="0" rightmargin="0" scroll="no">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssPage" id="Table5" height="100%" cellSpacing="2" cellPadding="2" width="100%"
				align="right" border="0">
				<TR>
					<TD dir="ltr" vAlign="top" align="center">
						<P>&nbsp;</P>
						<cc1:automationgrid id="grdRole" dir="rtl" runat="server" HtcAddress=" " ClientSorting="True" CreateClientSideScripts="False"
							UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False"
							Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" AutoGenerateColumns="False" SelectRowOnClick="False"
							Height="480px" CssClass="CssBackColor" Width="450px">
							<ItemStyle CssClass="CssItemStyle"></ItemStyle>
							<HeaderStyle CssClass="CssHeaderStyle"></HeaderStyle>
							<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
							<FooterStyle CssClass="CssFooterStyle"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="AccessTitle" HeaderText="äÇã ÏÓÊÑÓí">
									<HeaderStyle HorizontalAlign="Center" Width="200px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>
								</asp:BoundColumn>
								<ASP:TEMPLATECOLUMN>
									<HEADERSTYLE Width="20px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="20px" HorizontalAlign="Center"></ITEMSTYLE>
									<ITEMTEMPLATE>
										<IMG id="image" align="middle" border="0" src="../User/Images/Role.gif" title='ÓÇÒãÇäí'>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<asp:BoundColumn DataField="Title" HeaderText=" äÇã ÓÊ ÓÇÒãÇäí">
									<HeaderStyle HorizontalAlign="Center" Width="250px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="250px"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="RoleTypeTitle" HeaderText=" äæÚ ÓÊ ">
									<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn Visible="False" DataField="RoleId">
									<HeaderStyle Width="1px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="1px"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
							<EditItemStyle CssClass="CssEditItemStyle "></EditItemStyle>
							<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
						</cc1:automationgrid>
					<td style="DISPLAY:none">
						<input type="text" id="LastSelectedRowgrdRole" name="LastSelectedRowgrdRole" runat="server">
						<input type="text" id="RoleId" name="RoleId" runat="server">
					</td>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
