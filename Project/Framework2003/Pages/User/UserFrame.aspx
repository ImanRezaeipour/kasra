<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UserFrame.aspx.vb" Inherits="FrameWork.UserFrame" %>
<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%--<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>--%>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>UserFrame</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script src="../../Includes/General.js"></script>
		<script src="../../Includes/Scripts/KeySorting.js"></script>
		<script language="javascript">		
		
		///////////////////////////////////////
		var LastSelectedRowClassgrdUser="";
		///////////////////////////////////////
		function onclickgrdUser(SelectedRow)
		{
			var obj
			obj=grdUser
			if(Form1.LastSelectedRowgrdUser.value!='')
			{		
				obj.rows(parseInt(Form1.LastSelectedRowgrdUser.value)).style.backgroundColor=''
			}	
			Form1.LastSelectedRowgrdUser.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			window.parent.document.all.item("UserID").value=SelectedRow.UserID
		}
		////////////////////////////////////////
		function ondblclickgrdUser()
		{
			window.parent.onclickbtnEdit1()
		}		
			
		//////////////////////////////////////
		function ViewEdit() 
		{
			window.parent.ViewEdit()
		}
		///////////////////////////////////////
		function onload()
		{
		
		}
		//////////////////////////////////////////Tab Left///////////////////////////////
		</script>
	</HEAD>
	<body id="body" bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0" scroll="no"
		onload="onload()" rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 1034px; HEIGHT: 571px; TOP: 8px; LEFT: 0px"
				height="571" cellSpacing="1" cellPadding="1" width="1034" border="0">
				<TR>
					<TD style="WIDTH: 329px" vAlign="top" align="left"></TD>
					<TD vAlign="top" align="left">
						<TABLE id="Table11" cellSpacing="1" cellPadding="1" align="center" border="0">
							<TR>
								<TD><asp:button id="LastBtn1" runat="server" Width="35px" Height="29px" CssClass="CssLastPage" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÂÎÑíä" Runat="server"></asp:button></TD>
								<TD align="right"><asp:button id="NextBtn1" runat="server" Width="35px" Height="29px" CssClass="CssNextPage" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÈÚÏí"></asp:button></TD>
								<TD style="WIDTH: 35px" vAlign="middle" align="right"><asp:textbox id="CurPage1" tabIndex="1" runat="server" Width="40px" Height="20px" CssClass="txtControls"
										BorderStyle="Groove" AutoPostBack="True"></asp:textbox></TD>
								<TD dir="rtl" vAlign="middle" align="center">&nbsp;ÇÒ</TD>
								<TD style="WIDTH: 40px" vAlign="middle" align="left"><asp:textbox id="Totalpage1" runat="server" Width="40px" Height="20px" CssClass="txtControls"
										BorderStyle="Groove" BackColor="White" ReadOnly="True"></asp:textbox></TD>
								<TD><asp:button id="PrevBtn1" runat="server" Width="35px" Height="29px" CssClass="CssPrevPage" BorderStyle="None"
										BackColor="Transparent" BorderColor="Transparent" ToolTip="ÞÈáí"></asp:button></TD>
								<TD><asp:button id="FirstBtn1" runat="server" Width="35px" Height="29px" CssClass="CssFirstPage"
										BorderStyle="None" BackColor="Transparent" BorderColor="Transparent" ToolTip="Çæáíä"></asp:button></TD>
								<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" name="txtReturnMessage1" runat="server">
									<asp:button id="Button1" style="DISPLAY: none" runat="server" Width="1px" Text="Button"></asp:button><asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
							</TR>
						</TABLE>
						<cc1:automationgrid id="grdUser" runat="server" Width="772px" Height="440px" CssClass="CssBackColor"
							SelectRowOnMouseMove="False" SelectRowOnClick="False" HtcAddress=" " ClientPageSize="0" CreateClientSideScripts="False"
							AutoGenerateColumns="False" ClientSorting="False" SendXML="DoNotSend" EnableClientPager="False"
							Scrolling="True" ShowHeader="False" UsingKeyBoard="False">
							<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
							<HEADERSTYLE CssClass="CssHeaderStyle" HorizontalAlign="Center" VerticalAlign="Middle"></HEADERSTYLE>
							<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
							<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
							<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
							<COLUMNS>
								<ASP:BOUNDCOLUMN DataField="PersonId" HeaderText="˜Ï ÑÓäáí">
									<HEADERSTYLE Width="65px" HorizontalAlign="Center"></HEADERSTYLE>
									<ITEMSTYLE Width="65px" HorizontalAlign="Center"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:TEMPLATECOLUMN HeaderText="äÇã æ äÇã ÎÇäæÇÏí">
									<HEADERSTYLE Width="150px"></HEADERSTYLE>
									<ITEMSTYLE Width="150px"></ITEMSTYLE>
									<ITEMTEMPLATE>
										<asp:Label id=Label1 title='<%# DataBinder.Eval(Container, "DataItem.Family") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SFamily") %>'>
										</asp:Label>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:BOUNDCOLUMN DataField="UserName" HeaderText="äÇã ˜ÇÑÈÑí">
									<HEADERSTYLE Width="150px"></HEADERSTYLE>
									<ITEMSTYLE Width="150px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:TEMPLATECOLUMN HeaderText="æÇÍÏ ÓÇÒãÇäí">
									<HEADERSTYLE Width="200px"></HEADERSTYLE>
									<ITEMSTYLE Width="200px"></ITEMSTYLE>
									<ITEMTEMPLATE>
										<asp:Label id=Label2 title='<%# DataBinder.Eval(Container, "DataItem.DepartmentTitle") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SDepartmentTitle") %>'>
										</asp:Label>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:TEMPLATECOLUMN HeaderText="ÓÊ ÓÇÒãÇäí">
									<HEADERSTYLE Width="200px"></HEADERSTYLE>
									<ITEMSTYLE Width="200px"></ITEMSTYLE>
									<ITEMTEMPLATE>
										<asp:Label id=Label3 title='<%# DataBinder.Eval(Container, "DataItem.RoleTitle") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SRoleTitle") %>'>
										</asp:Label>
									</ITEMTEMPLATE>
								</ASP:TEMPLATECOLUMN>
								<ASP:BOUNDCOLUMN DataField="UserID" HeaderText="UserID" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="firstname" HeaderText="firstname" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="lastname" HeaderText="lastname" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Sex" HeaderText="Sex" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="DepartmentId" HeaderText="DepartmentId" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="RoleId" HeaderText="RoleId" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN DataField="Password" HeaderText="Password" Visible="False">
									<HEADERSTYLE Width="1px"></HEADERSTYLE>
									<ITEMSTYLE Width="1px"></ITEMSTYLE>
								</ASP:BOUNDCOLUMN>
							</COLUMNS>
						</cc1:automationgrid></TD>
					<td style="DISPLAY: none">
						<input id="txtSessionID" type="hidden" name="txtSessionID" runat="server"> <input id="PersonIdGrd" type="hidden" name="PersonIdGrd" runat="server">
                        <cc1:mysecurity id="onlineuser" runat="server"></cc1:mysecurity>
                        
                        <INPUT id="txtCompanyFinatialPeriodID" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtCompanyFinatialPeriodID" runat="server">
						<input id="txtSubmit" type="hidden" name="txtSubmit" runat="server"> <INPUT id="LastSelectedRowgrdUser" style="WIDTH: 1px; DISPLAY: none" type="hidden" name="LastSelectedRowgrdUser"
							runat="server"> <input id="txtCount" type="hidden" name="txtCount" runat="server">
					</td>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>




