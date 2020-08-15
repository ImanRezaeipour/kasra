<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EditWorkFlow.aspx.vb" Inherits="FrameWork.EditWorkFlow" validateRequest=false %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>EditWorkFlow</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Pages/WorkFlow/StyleWorkFlow.css" type="text/css" rel="stylesheet">
		<script src="Scripts/ManageObject.js"></script>
		<script src="Scripts/ManageEvents.js"></script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%" border="0">
				<TR>
					<TD class="CssLayer2" align="center">
						<TABLE class="CssPage" id="Table2" style="POSITION: relative; WIDTH: 644px; HEIGHT: 614px; TOP: 5px"
							height="614" cellSpacing="1" cellPadding="1" width="644" border="0">
							<TR>
								<TD vAlign="top">
									<TABLE id="Table3" style="WIDTH: 651px; HEIGHT: 606px" height="606" cellSpacing="1" cellPadding="1"
										width="651" align="right" border="0">
										<TR>
											<TD>
												<TABLE id="Table5" dir="rtl" style="WIDTH: 659px; HEIGHT: 8px" cellSpacing="1" cellPadding="1"
													width="659" align="right" border="0">
													<TR>
														<TD>Ê«Õœ ”«“„«‰Ì :</TD>
														<TD><cc1:lcombo id="selDepartment" runat="server" Width="150px" CssClass="TxtControls" onchange="onChangeselPerson()"
																FirstSelect="True"></cc1:lcombo></TD>
														<TD>òœ Å—”‰·Ì :</TD>
														<TD><INPUT class="TxtControls" id="fPersonId" style="WIDTH: 83px; HEIGHT: 20px" onchange="onChangefPersonId()"
																size="8" name="fPersonId" runat="server"></TD>
														<TD>‰«„ Ê ‰«„ Œ«‰Ê«œêÌ :</TD>
														<TD><cc1:lcombo id="selPerson" runat="server" Width="172px" CssClass="TxtControls" onchange="onChangeselPerson()"
																FirstSelect="True"></cc1:lcombo></TD>
													</TR>
													<TR>
														<TD>”Ì” „ :</TD>
														<TD><cc1:lcombo id="selSubSys" runat="server" Width="150px" CssClass="TxtControls" onchange="onChangeselSubSys()"
																FirstSelect="True" LookupName="SubSys" ConnectionName="SysCnn"></cc1:lcombo></TD>
														<TD>”‰œ:</TD>
														<TD colSpan="2"><cc1:lcombo id="selDoc" runat="server" Width="168px" CssClass="TxtControls" FirstSelect="True"></cc1:lcombo></TD>
														<TD align="right"><INPUT class="CssBtnLimitSerach" id="btnSearch" 
                                                                title="‰„«Ì‘ „ÕœÊœ" style="WIDTH: 99px; HEIGHT: 32px; cursor: pointer;"
																type="button" name="btnSearch" runat="server">&nbsp; 
                                                            <INPUT class="CssBtnShow" id="btnShow" title="‰„«Ì‘" style="WIDTH: 70px; HEIGHT: 32px; cursor: pointer;"
																type="button" name="btnShow" runat="server"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 459px" vAlign="top" align="center">
                                                <cc1:automationgrid id="grdWFDetail" runat="server" Width="616px" 
                                                    CssClass="CssbackColor" AutoGenerateColumns="False"
													SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False" 
                                                    ShowHeader="False" SelectRowOnMouseMove="False"
													UsingKeyBoard="False" CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" " Height="416px" 
                                                    ClientPagerCssClass="" FunctionNameOnClick="" LinkPagerCssClass=""><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
													<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
													<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
													<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
													<COLUMNS>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px" HorizontalAlign="Center"></ITEMSTYLE>
															<HEADERTEMPLATE>
																<INPUT id="AllEdit" onclick="ManageChecks(this,grdWFDetail)" type="checkbox" name="AllEdit"
																	runat="server">
															</HEADERTEMPLATE>
															<ITEMTEMPLATE>
																<INPUT id="ChkEdit" type="checkbox" name="ChkEdit" runat="server">
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="‰«„ ”Ì” „" DataField="SubSysTitle">
															<HEADERSTYLE Width="130px" HorizontalAlign="Center"></HEADERSTYLE>
															<ITEMSTYLE Width="130px" HorizontalAlign="Center"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<IMG 
                  title='<%#SetTitleTypeDoc(DataBinder.Eval(Container.DataItem,"HasFlow"))%>' 
                  border=0 name=IMG align=middle 
                  src='<%#SetSrcTypeDoc(DataBinder.Eval(Container.DataItem,"HasFlow"))%>'>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="‰«„ ”‰œ" DataField="DocTitle">
															<HEADERSTYLE Width="250px" HorizontalAlign="Center"></HEADERSTYLE>
															<ITEMSTYLE Width="130px" HorizontalAlign="Center"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<IMG 
                  title='<%#SetTitleFromType(DataBinder.Eval(Container.DataItem,"FromType"))%>' 
                  border=0 name=IMG align=middle 
                  src='<%#SetSrcFromType(DataBinder.Eval(Container.DataItem,"FromType"))%>'>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="„‘Œ’«  ‘—Ê⁄ " DataField="PersonId">
															<HEADERSTYLE Width="80px" HorizontalAlign="Left"></HEADERSTYLE>
															<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN HeaderText=" ò‰‰œÂ( ‘„«—Â Å—”‰·Ì&#9;° ⁄‰Ê«‰ ‘Œ’ " DataField="FromTitle">
															<HEADERSTYLE Width="200px" HorizontalAlign="Right"></HEADERSTYLE>
															<ITEMSTYLE Width="180px" HorizontalAlign="Right"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="° ‰«„ Ê«Õœ ”«“„«‰Ì)" DataField="DepartmentName">
															<HEADERSTYLE Width="200px" HorizontalAlign="Right"></HEADERSTYLE>
															<ITEMSTYLE Width="170px" HorizontalAlign="Right"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<IMG title="‰„«Ì‘ ê—œ‘" border="0" name="IMG" align="middle" src="../Images/btnNodes.gif">
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN DataField="DId" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="GroupId" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
													</COLUMNS>
													<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
												</cc1:automationgrid></TD>
										</TR>
										<TR>
											<TD vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 66.13%; HEIGHT: 3px" width="66.13%" SIZE="3">
												<TABLE id="Table4" style="WIDTH: 170px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="170"
													border="0">
													<TR>
														<TD style="DISPLAY: none"><INPUT class="CssBtnEditOne" id="btnEditOne" 
                                                                style="WIDTH: 99px; HEIGHT: 32px; cursor: pointer;" onclick="onclickbtnEditOne()"
																type="button" name="btnEditOne"></TD>
														<TD><INPUT class="CssHeaderStyle" value="‰„«Ì‘ ê—œ‘" id="btnEditAll" 
                                                                style="color:#000066;WIDTH: 81px; HEIGHT: 30px; cursor: pointer;" onclick="onclickbtnEditAll()"
																type="button" name="btnEditAll">
																<%--<INPUT class="CssBtnEditAll" id="btnEditAll" style="WIDTH: 81px; HEIGHT: 32px" onclick="onclickbtnEditAll()"
																type="button" name="btnEditAll">--%>
																</TD>
														<TD><INPUT class="CssHeaderStyle" id="btnDeleteAll" value="Õ–› ê—œ‘" 
                                                                style="color:#000066; WIDTH: 83px; HEIGHT: 30px; cursor: pointer;" onclick="onclickbtnDeleteAll()"
																type="button" name="btnDeleteAll">
																<%--<INPUT class="CssBtnDeleteAll" id="btnDeleteAll" style="WIDTH: 83px; HEIGHT: 32px" onclick="onclickbtnDeleteAll()"
																type="button" name="btnDeleteAll">--%></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD style="DISPLAY: none" vAlign="top">
												<input id="txtSessionID" runat="server" NAME="txtSessionID"> <INPUT id="XMLWFDoc" name="XMLWFDoc" runat="server">
												<INPUT id="LastSelectedRowgrdWFDetail" name="LastSelectedRowgrdWFDetail" runat="server">
												<INPUT id="DId" name="DId" runat="server"> <INPUT id="TxtConfirm" name="TxtConfirm" runat="server">
												<INPUT id="txtStrXml" name="txtStrXml" runat="server">
												<input id="txtGetCompanyFinatialPeriodID" runat="server" NAME="txtGetCompanyFinatialPeriodID">
												<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
