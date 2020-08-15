<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DefineConfermenter.aspx.vb" Inherits="FrameWork.DefineConfermenter" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>DefineConfermenter</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">

			function pageLoad() {
				grdConfermentAccess.rows(0).cells(0).firstChild.checked=true	
				Form1.LastSelectedRowConfermentAccess.value=0
				Form1.FromPersonId.value = grdConfermentAccess.rows(0).FromPersonId
			    if(Form1.txtIsActive.value=="0")
			        alert('کاربر انتخاب انتخاب شده فعال نمی باشد')
			}
			////__________________________________________________________________________
			function onclickgrdConfermentAccess(SelectedRow)
				{
					var obj
					obj=grdConfermentAccess
					if(Form1.LastSelectedRowConfermentAccess.value!='')
					{
						obj.rows(parseInt(Form1.LastSelectedRowConfermentAccess.value)).style.backgroundColor=''
						obj.rows(parseInt(Form1.LastSelectedRowConfermentAccess.value)).cells(0).firstChild.checked=false
					}
					Form1.LastSelectedRowConfermentAccess.value=SelectedRow.rowIndex
					SelectedRow.style.backgroundColor='#FFD599'
					SelectedRow.cells(0).firstChild.checked=true
					Form1.FromPersonId.value = SelectedRow.FromPersonId

				}
			/////////////////////////////////////////////////////////
			function btnOKOnclick()
			{
				
				window.location.href=url
			}
			
		</script>
	</HEAD>
	<BODY dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="right" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" cellSpacing="1" cellPadding="1" width="324" border="0">
										<TR>
											<TD class="VertGradientBlue2" id="TopRow" style="DISPLAY: inline; HEIGHT: 42px" vAlign="top"
												align="center">لطفا شخص مورد نظر را انتخاب نماييد</TD>
										</TR>
										<TR>
											<TD id="DownRow" style="DISPLAY: inline; HEIGHT: 166px" vAlign="top" align="center"><ITEMSTYLE CssClass="CssItemStyle">
                                                <cc1:automationgrid id="grdConfermentAccess" dir="rtl" runat="server" 
                                                    Width="386px" Height="220px" SelectRowOnMouseMove="False"
														SelectRowOnClick="False" HtcAddress=" " ClientPageSize="0" SendXML="DoNotSend" CreateClientSideScripts="True" 
                                                    ClientSorting="False" EnableClientPager="False" Scrolling="True" 
                                                    UsingKeyBoard="False" ShowHeader="False"
														AutoGenerateColumns="False" name="grdNumResult" ClientPagerCssClass="" FunctionNameOnClick="" 
                                                    LinkPagerCssClass=""><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
														<HEADERSTYLE CssClass="CssHeaderStyle" HorizontalAlign="Center"></HEADERSTYLE>
														<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
														<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
														<COLUMNS>
															<ASP:TEMPLATECOLUMN>
																<HEADERSTYLE Width="5px"></HEADERSTYLE>
																<ITEMSTYLE Width="5px" HorizontalAlign="Center"></ITEMSTYLE>
																<ITEMTEMPLATE>
																	<INPUT id="ChkInfo" type="radio" name="ChkInfo" runat="server">
																</ITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:BOUNDCOLUMN DataField="PersonCode" HeaderText=" شماره پرسنلي ">
																<HEADERSTYLE Width="100px"></HEADERSTYLE>
																<ITEMSTYLE Width="100px"></ITEMSTYLE>
															</ASP:BOUNDCOLUMN>
															<ASP:BOUNDCOLUMN DataField="FullName" HeaderText=" تفويض کننده ">
																<HEADERSTYLE Width="200px"></HEADERSTYLE>
																<ITEMSTYLE Width="200px"></ITEMSTYLE>
															</ASP:BOUNDCOLUMN>
															<ASP:BOUNDCOLUMN DataField="RoleTitle" HeaderText=" پست سازماني ">
																<HEADERSTYLE Width="250px"></HEADERSTYLE>
																<ITEMSTYLE Width="250px"></ITEMSTYLE>
															</ASP:BOUNDCOLUMN>
															<ASP:BOUNDCOLUMN DataField="RoleTypeDscr" HeaderText=" نوع پست ">
																<HEADERSTYLE Width="150px"></HEADERSTYLE>
																<ITEMSTYLE Width="150px"></ITEMSTYLE>
															</ASP:BOUNDCOLUMN>
                                                            <asp:BoundColumn DataField="FromPersonId" Visible="False">
                                                                <HeaderStyle Width="0px" />
                                                            </asp:BoundColumn>
														</COLUMNS>
														<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
													</cc1:automationgrid></TD>
										</TR>
										<TR>
											<TD style="DISPLAY: inline" vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 61.1%; HEIGHT: 2px" SIZE="2">
												&nbsp;<INPUT class="CssbtnOK" id="btnOK" type="button" name="btnOK" runat="server"></TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none" align="right">
						<asp:button id="btnServerOK" runat="server"></asp:button>
						<INPUT id="FromPersonId" type="text" size="1" name="FromPersonId" runat="server">
						<INPUT id="ToPersonId" type="text" size="1" name="ToPersonId" runat="server"> <input id="LastSelectedRowConfermentAccess" type="text" name="LastSelectedRowConfermentAccess">
						<input type="text" id="txtSessionID" runat="server">
                        <input type="text" id="txtIsActive" runat="server">
					</td>
				</tr>
			</table>
		</form>
	</BODY>
</HTML>
