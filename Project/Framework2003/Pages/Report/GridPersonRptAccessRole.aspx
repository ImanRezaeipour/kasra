<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GridPersonRptAccessRole.aspx.vb" Inherits="FrameWork.GridPersonRptAccessRole"%>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>GridPersonRptAccessRole</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		////////////////////////////////////////////////////////////////////////////////////
		function onclickgrdPerson(SelectedRow)
		{
			var obj
			obj=grdPerson
			if(Form1.LastSelectedRowgrdPerson.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdPerson.value)).style.backgroundColor=''
			Form1.LastSelectedRowgrdPerson.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			Form1.PersonId.value=SelectedRow.cells(2).innerText
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
						<cc1:automationgrid id="grdPerson" dir="rtl" runat="server" HtcAddress=" " ClientSorting="True" CreateClientSideScripts="False"
							UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False"
							Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" AutoGenerateColumns="False" SelectRowOnClick="False"
							Height="440px" CssClass="CssBackColor" Width="369px">
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
										<IMG id="image" align="middle" border="0" src="../User/Images/Personel.gif" title='ÔÎÕí'>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:BOUNDCOLUMN HeaderText="ÔãÇÑå ÑÓäáí" DataField="PersonId">
									<HEADERSTYLE Width="100px"></HEADERSTYLE>
									<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN HeaderText="äÇã" DataField="FirstName">
									<HEADERSTYLE Width="60px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="60px" HorizontalAlign="Center"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN HeaderText="äÇã ÎÇäæÇÏí " DataField="LastName">
									<HEADERSTYLE Width="150px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="150px" HorizontalAlign="Center"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
							</COLUMNS>
							<EDITITEMSTYLE CssClass="CssEditItemStyle "></EDITITEMSTYLE>
							<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
						</cc1:automationgrid>
					</TD>
					<td style="DISPLAY:none">
						<input type="text" id="LastSelectedRowgrdPerson" name="LastSelectedRowgrdPerson" runat="server">
						<input type="text" id="PersonId" name="PersonId" runat="server">
					</td>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
