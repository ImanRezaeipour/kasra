<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LogsView.aspx.vb" Inherits="FrameWork.LogsView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>LogsView</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../Includes/StyleForPages.css">
		<script language="javascript" src="../../Includes/Scripts/General.js"></script>
		<script language="javascript">
		/****************************************************************/
		function PageLoad() {

		    if (Form1.CmbSubSys.value == "")
		        Form1.CmbSubSys.value = "0"

		    if (Form1.CmbMenuItem.value == "")
		        Form1.CmbMenuItem.value = "0"

//		    Form1.txtCmbMenuItem.value = Form1.CmbMenuItem.value
//		    Form1.txtCmbSubSys.value = Form1.CmbSubSys.value

		    if (Form1.txtSubmitShow.value == "Show")
			{
				var strDate2=Form1.txtSDate1.value
				Form1.StartDate_txtDay.value=strDate2.substring(8,10)
				Form1.StartDate_txtMonth.value=strDate2.substring(5,7)
				Form1.StartDate_txtYear.value=strDate2.substring(0,4)
				var strDate3=Form1.txtEDate1.value	
				Form1.EndDate_txtDay.value=strDate3.substring(8,10)
				Form1.EndDate_txtMonth.value=strDate3.substring(5,7)
				Form1.EndDate_txtYear.value=strDate3.substring(0,4)		
				
				Form1.PersonId.value=Form1.txtPersonId.value
				Form1.CmbMenuItem.value=Form1.txtCmbMenuItem.value
				Form1.StartTime.value=Form1.txtStartTime.value
				Form1.EndTime.value=Form1.txtEndTime.value
				Form1.CmbSubSys.value=Form1.txtCmbSubSys.value

				Form1.txtSubmitShow.value == ""		
			}
			
			onblurPersonId()
		}
		/****************************************************************/
		function onClickBtnShowAll() {
		    Form1.PersonId.value = "";
		    Form1.CmbMenuItem.value = 0;
		    Form1.StartTime.value = "";
		    Form1.EndTime.value = "";
		    Form1.CmbSubSys.value = 0;

		    Form1.txtPersonId.value = "";
		    Form1.txtCmbMenuItem.value = "";
		    Form1.txtStartTime.value = "";
		    Form1.txtEndTime.value = "";
		    Form1.txtCmbSubSys.value = "";
		    
			Form1.txtSubmit.value="ShowAll";
			Form1.submit()
		}
		/****************************************************************/
		function onClickBtnShow()
		{
			Form1.txtSDate1.value=Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value;
			Form1.txtEDate1.value=Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value;
			
			Form1.txtCmbMenuItem.value=Form1.CmbMenuItem.value
			Form1.txtStartTime.value=Form1.StartTime.value
			Form1.txtEndTime.value=Form1.EndTime.value
			Form1.txtCmbSubSys.value=Form1.CmbSubSys.value
			Form1.txtPersonId.value = Form1.PersonId.value

			

			Form1.txtSubmit.value = "Show";
			Form1.txtSubmitShow.value = "Show";
			
			Form1.submit()
		}
		/****************************************************************/
		function onblurPersonId()
		{
			Form1.cmbPersonName.value=Form1.PersonId.value;
			if (Form1.cmbPersonName.value=="")
			{
				Form1.cmbPersonName.value="0";
				Form1.PersonId.value="";
			}	
		}
		/****************************************************************/
		function onChangecmbPersonName()
		{
			Form1.PersonId.value=Form1.cmbPersonName.value
		}
		/****************************************************************/
		
		</script>
	</HEAD>
	<body onload="PageLoad()" bottomMargin="0" leftMargin="0" rightMargin="0" scroll="no"
		topMargin="0">
		<FORM id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE style="POSITION: relative; TOP:10px; HEIGHT: 620px"id="Layer3" class="CssPage" border="0" cellSpacing="0"
							cellPadding="0" width="901" height="547">
							<TR>
								<TD id="Td2" vAlign="top" align="center" runat="server">
									<TABLE style="WIDTH: 908px; HEIGHT: 128px" id="Table3" class="Csspage" border="0" cellSpacing="1"
										cellPadding="1" width="908">
										<TR>
											<TD>
												<TABLE id="Table1" border="0" cellSpacing="5" cellPadding="2" width="100%">
													<TR>
														<TD style="WIDTH: 71px; HEIGHT: 18px">شماره پرسنلي</TD>
														<TD style="WIDTH: 139px; HEIGHT: 18px"><INPUT onblur="onblurPersonId()" style="WIDTH: 130px; HEIGHT: 20px" onkeydown="OnKeyDownNum('integer',this.value)"
																id="PersonId" class="txtControls" size="22" name="PersonId" runat="server"></TD>
														<TD style="WIDTH: 82px; HEIGHT: 18px">نام</TD>
														<TD style="WIDTH: 105px; HEIGHT: 18px"><cc1:lcombo id="cmbPersonName" runat="server" ConnectionName="GenCnn" LookupName="Personel"
																CssClass="txtControls" Width="130px" onchange="onChangecmbPersonName()"></cc1:lcombo></TD>
														<TD style="Z-INDEX: 0; WIDTH: 71px; HEIGHT: 18px">نام سيستم</TD>
														<TD style="WIDTH: 126px; HEIGHT: 18px"><cc1:lcombo style="Z-INDEX: 0" id="CmbSubSys" runat="server" ConnectionName="GenCnn" LookupName="SubSys"
																CssClass="txtControls" Width="130px"></cc1:lcombo></TD>
														<TD style="Z-INDEX: 0; WIDTH: 67px; HEIGHT: 18px">نام صفحه</TD>
														<TD style="HEIGHT: 18px"><cc1:lcombo style="Z-INDEX: 0" id="CmbMenuItem" runat="server" ConnectionName="GenCnn" LookupName="MenuItem"
																CssClass="txtControls" Width="130px"></cc1:lcombo></TD>
													</TR>
													<TR>
														<TD style="Z-INDEX: 0; WIDTH: 71px; HEIGHT: 18px">از ساعت</TD>
														<TD style="WIDTH: 139px; HEIGHT: 18px"><INPUT onblur="Timechk(this)" style="Z-INDEX: 0; WIDTH: 130px; HEIGHT: 20px" onkeydown="OnKeyDownTime(this.value)"
																id="StartTime" class="txtControls" size="15" name="StartTime" runat="server"></TD>
														<TD style="Z-INDEX: 0; WIDTH: 82px; HEIGHT: 18px">تا ساعت</TD>
														<TD style="WIDTH: 105px; HEIGHT: 18px"><INPUT onblur="Timechk(this)" style="Z-INDEX: 0; WIDTH: 130px; HEIGHT: 20px" onkeydown="OnKeyDownTime(this.value)"
																id="EndTime" class="txtControls" size="16" name="EndTime" runat="server"></TD>
														<TD style="Z-INDEX: 0; WIDTH: 71px; HEIGHT: 18px">وضعيت</TD>
														<TD style="WIDTH: 126px; HEIGHT: 18px"><INPUT type="radio" id="OpActive" name="OpActive" runat="server" CHECKED>فعال&nbsp;<INPUT type="radio" id="OpNoActive" name="OpActive" runat="server">غير 
															فعال</TD>
														<TD style="Z-INDEX: 0; WIDTH: 67px; HEIGHT: 18px"></TD>
														<TD style="HEIGHT: 18px"></TD>
													</TR>
												</TABLE>
												<TABLE id="Table2" border="0" cellSpacing="5" cellPadding="2" width="100%">
													<TR>
														<TD style="Z-INDEX: 0; WIDTH: 68px">از تاريخ</TD>
														<TD style="WIDTH: 140px"><uc1:textdate style="Z-INDEX: 0" id="StartDate" runat="server"></uc1:textdate></TD>
														<TD style="Z-INDEX: 0; WIDTH: 79px">تا تاريخ</TD>
														<TD style="WIDTH: 140px"><uc1:textdate style="Z-INDEX: 0" id="EndDate" runat="server"></uc1:textdate></TD>
														<TD dir="ltr"><INPUT id="BtnShowAll" class="CssBtnShow" onclick="onClickBtnShowAll()" type="button" name="BtnShowAll"><INPUT style="WIDTH: 94px; HEIGHT: 32px" id="BtnShow" class="CssBtnLimitSerach" onclick="onClickBtnShow()"
																type="button" name="BtnShow"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<TABLE style="WIDTH: 871px; HEIGHT: 310px" id="Table4" border="0" cellSpacing="1" cellPadding="1"
										width="871">
										<TR>
											<TD align="center">
												<TABLE style="WIDTH: 264px; HEIGHT: 32px" dir="ltr" id="Table11" border="0" cellSpacing="1"
													cellPadding="1" align="center">
													<TR>
														<TD style="WIDTH: 34px"><asp:button id="FirstBtn" runat="server" CssClass="CssFirstPage" Width="29px" Height="26px"
																BorderStyle="None" BorderColor="Transparent" ToolTip="اولين" BackColor="Transparent"></asp:button></TD>
														<TD align="right"><asp:button id="PrevBtn" runat="server" CssClass="CssPrevPage" Width="29px" Height="24px" BorderStyle="None"
																BorderColor="Transparent" ToolTip="قبلي" BackColor="Transparent"></asp:button></TD>
														<TD vAlign="middle" align="right"><asp:textbox id="Totalpage" runat="server" CssClass="txtControls" Width="40px" Height="24px"
																BorderStyle="Groove" BackColor="White" ReadOnly="True"></asp:textbox></TD>
														<TD dir="rtl" vAlign="top" align="right">&nbsp; از&nbsp;&nbsp;&nbsp;</TD>
														<TD vAlign="middle"><asp:textbox id="CurPage" tabIndex="1" runat="server" CssClass="txtControls" Width="40px" Height="24px"
																BorderStyle="Groove" AutoPostBack="True"></asp:textbox></TD>
														<TD><asp:button id="NextBtn" runat="server" CssClass="CssNextPage" Width="29px" Height="24px" BorderStyle="None"
																BorderColor="Transparent" ToolTip="بعدي" BackColor="Transparent"></asp:button></TD>
														<TD><asp:button id="LastBtn" runat="server" CssClass="CssLastPage" Width="29px" Height="24px" BorderStyle="None"
																BorderColor="Transparent" ToolTip="آخرين" BackColor="Transparent"></asp:button></TD>
														<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" name="txtReturnMessage1" runat="server">
															<asp:button style="DISPLAY: none" id="Button1" runat="server" Width="1px" Text="Button"></asp:button><asp:textbox style="DISPLAY: none" id="OrderField1" runat="server" Width="1px"></asp:textbox></TD>
													</TR>
												</TABLE>
												<cc1:automationgrid id="grdLogs" runat="server" Width="870px" Height="336px" AutoGenerateColumns="False"
													SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
													ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
													ClientSorting="False" HtcAddress=" ">
													<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
													<HEADERSTYLE CssClass="CssHeaderStyle" HorizontalAlign="Center" VerticalAlign="Middle"></HEADERSTYLE>
													<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
													<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
													<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
													<COLUMNS>
														<ASP:BOUNDCOLUMN DataField="PersonId" HeaderText="شماره پرسنلي">
															<HEADERSTYLE Width="80px"></HEADERSTYLE>
															<ITEMSTYLE Width="80px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN HeaderText="نام و نام خانوادگي">
															<HEADERSTYLE Width="180px" HorizontalAlign="Center"></HEADERSTYLE>
															<ITEMSTYLE Width="180px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<asp:Label id=Label4 title='<%# DataBinder.Eval(Container, "DataItem.PersonName") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PersonName1") %>'>
																</asp:Label>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														
														<ASP:BOUNDCOLUMN DataField="SubSysName" HeaderText="نام سيستم">
															<HEADERSTYLE Width="150px"></HEADERSTYLE>
															<ITEMSTYLE Width="150px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN HeaderText="نام صفحه">
															<HEADERSTYLE Width="175px" HorizontalAlign="Center"></HEADERSTYLE>
															<ITEMSTYLE Width="175px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<asp:Label id=Label4 title='<%# DataBinder.Eval(Container, "DataItem.MenuItemName") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MenuItemName1") %>'>
																</asp:Label>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>

														
														<ASP:BOUNDCOLUMN DataField="CreateDate" HeaderText="تاريخ ورود">
															<HEADERSTYLE Width="75px"></HEADERSTYLE>
															<ITEMSTYLE Width="75px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="CreateTime" HeaderText="زمان ورود">
															<HEADERSTYLE Width="65px"></HEADERSTYLE>
															<ITEMSTYLE Width="65px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="EndTime" HeaderText="زمان خروج">
															<HEADERSTYLE Width="65px"></HEADERSTYLE>
															<ITEMSTYLE Width="65px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="PageNumber" HeaderText="PageNumber" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
													</COLUMNS>
												</cc1:automationgrid></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD style="DISPLAY: none" vAlign="middle" align="center">
								    <INPUT id="txtSubmitShow" size="1" name="txtSubmitShow" runat="server">
									<INPUT id="txtPersonId" name="txtPersonId" runat="server"> <INPUT id="txtStartTime" name="txtStartTime" runat="server">
									<INPUT id="txtEndTime" name="txtEndTime" runat="server"> <INPUT id="txtCmbSubSys" name="txtCmbSubSys" runat="server">
									<INPUT id="txtPageSize" name="txtPageSize" runat="server"> <INPUT id="lblTotal" size="1" name="lblTotal" runat="server">
									<asp:label id="lblTo" runat="server"></asp:label><asp:label id="lblFrom" runat="server"></asp:label><cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity><INPUT id="XMLFilter" size="1" name="XMLFilter" runat="server">
									<INPUT id="txtCmbMenuItem" size="1" name="txtCmbMenuItem" runat="server"> <INPUT id="txtSDate" size="1" name="txtSDate" runat="server">
									<INPUT id="txtEDate" size="1" name="txtEDate" runat="server"> 
									<INPUT id="txtSDate1" size="1" name="txtSDate1" runat="server">
									<INPUT id="txtEDate1" size="1" name="txtEDate1" runat="server">
									<INPUT id="txtSubmit" size="1" name="txtSubmit" runat="server">
									<INPUT id="txtSubsysId" size="1" name="txtSubsysId" runat="server"> <INPUT id="txt" size="1" name="txtSubsysId" runat="server">
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</body>
</HTML>
