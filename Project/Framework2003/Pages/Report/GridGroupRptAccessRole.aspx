<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GridGroupRptAccessRole.aspx.vb" Inherits="FrameWork.GridGroupRptAccessRole"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>GridGroupRptAccessRole</title>
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
	<body id="body" bottomMargin="0" leftMargin="0" topMargin="0" rightmargin="0" scroll="no">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table5" height="100%" cellSpacing="0" cellPadding="0" width="100%" align="right"
				border="0" class="CssPage">
				<TR>
					<TD dir="ltr" vAlign="top" align="center">
						<P>&nbsp;</P>
						<cc1:automationgrid id="grdGroup" dir="rtl" runat="server" Width="432px" HtcAddress=" " ClientSorting="True"
							CreateClientSideScripts="False" UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False"
							EnableClientPager="False" Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" AutoGenerateColumns="False"
							SelectRowOnClick="False" Height="464px" CssClass="CssBackColor">
							<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
							<HEADERSTYLE CssClass="CssHeaderStyle"></HEADERSTYLE>
							<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
							<FOOTERSTYLE CssClass="CssFooterStyle"></FOOTERSTYLE>
							<COLUMNS>
								<asp:BoundColumn DataField="AccessTitle" HeaderText="äÇã ÏÓÊÑÓí">
									<HeaderStyle HorizontalAlign="Center" Width="200px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>
								</asp:BoundColumn>
								<ASP:TEMPLATECOLUMN>
									<HEADERSTYLE Width="20px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="20px" HorizontalAlign="Center"></ITEMSTYLE>
									<ITEMTEMPLATE>
										<IMG id="image" align="middle" border="0" src='<%#SetSrc(DataBinder.Eval(Container.DataItem,"Type"))%>' title='<%#SetTitle(DataBinder.Eval(Container.DataItem,"Type"))%>'>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:BOUNDCOLUMN DataField="GroupName" HeaderText="äÇã Ñæå">
									<HEADERSTYLE Width="160px"></HEADERSTYLE>
									<ITEMSTYLE Width="160px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Descr" HeaderText="ÊæÖíÍÇÊ ">
									<HEADERSTYLE Width="240px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="240px" HorizontalAlign="Right"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN visible="false" DataField="Type">
									<HEADERSTYLE Width="1px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN visible="false" DataField="GroupId">
									<HEADERSTYLE Width="1px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
							</COLUMNS>
							<EDITITEMSTYLE CssClass="CssEditItemStyle "></EDITITEMSTYLE>
							<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
						</cc1:automationgrid>
					</TD>
					<td style="DISPLAY:none">
						<input type="text" id="LastSelectedRowgrdGroup" name="LastSelectedRowgrdGroup" runat="server">
						<input type="text" id="GroupId" name="GroupId" runat="server">
					</td>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
