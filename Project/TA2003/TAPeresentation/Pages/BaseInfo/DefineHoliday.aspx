<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DefineHoliday.aspx.vb" Inherits="TA.DefineHoliday" validateRequest="false" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>DefineHoliday</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Include/Btn.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" type="text/javascript">
/**********************************************************************************/
		var LastSelectedRowgrdItems=null;
		var LastSelectedRowClassgrdItems="";
		var Flag=0
	
		/**********************************************************************************/
		function pageLoad()
		{
			Form1.txtHolidayID.value=""
			if(Form1.txtDown.value==1)
			{
				Form1.txtDown.value=0
				ViewDownRow()
			}
			else
			{
			ViewTopRow()
			}
			if(Form1.txtMsg.value!="")
			{
				alert(Form1.txtMsg.value)
				Form1.txtMsg.value=""
			}
			//clearData()
		}
		/**********************************************************************************/
		function ViewTopRow()
		{
			document.all.item('DownRow').style.display="none"
			document.all.item('TopRow').style.display="inline"
			
		}
		/**********************************************************************************/
		function ViewDownRow()
		{
			document.all.item('TopRow').style.display="none"
			document.all.item('DownRow').style.display="inline"
		}
		/**********************************************************************************/
		function btnNewOnclick()
		{
			clearData()
			ViewDownRow()
		}
		/**********************************************************************************/
		function btnEditOnclick()
		{
		
			if((Form1.txtHolidayID.value!=0)||(Form1.txtHolidayID.value!=""))
			  {
				Flag=1
				ViewDownRow()
		   	  }
		   	  
			else
				alert("«» œ« Ìò ”ÿ— «“ ê—Ìœ —« «‰ Œ«» ‰„«∆Ìœ!")
			
		}
		/**********************************************************************************/
		function btnCancelOnclick()
		{
			ViewTopRow()
		}
		/**********************************************************************************/

		function onclickGrdHoliday(SelectedRow)
		{
			if(LastSelectedRowgrdItems!=null)
				{
					LastSelectedRowgrdItems.className=LastSelectedRowClassgrdItems;
				}
				LastSelectedRowClassgrdItems=SelectedRow.className;
				LastSelectedRowgrdItems=SelectedRow;
				SelectedRow.className="CssSelectedItemStyle";
					
				Form1.txtHolidayID.value=SelectedRow.HolidayID
						
		}
		/**********************************************************************************/
		function ondblclickGrdHoliday(SelectedRow)
		{
			if(LastSelectedRowgrdItems!=null)
				{
					LastSelectedRowgrdItems.className=LastSelectedRowClassgrdItems;
				}
				LastSelectedRowClassgrdItems=SelectedRow.className;
				LastSelectedRowgrdItems=SelectedRow;
				SelectedRow.className="CssSelectedItemStyle";
				LoadData(SelectedRow)
				if((Form1.txtHolidayID.value!=0)||(Form1.txtHolidayID.valu!=""))
				ViewDownRow()
		}
		/**********************************************************************************/
		function LoadData(obj)
		{

			Flag=1//Update
			Form1.txtHolidayID.value=obj.HolidayID
			//Form1.txtType.value=obj.Type
			Form1.txtDescrNew.value=obj.cells(3).innerText
			
			/*if(	Form1.txtType.value==1)
			{
			}*/
			var startDate
			var day
			var month
			var year
			
			if(obj.cells(1).innerText!=" ")
			{
				startDate=obj.cells(1).innerText
				day=startDate.substr(0,2)
				month=startDate.substr(3,2)
				year=startDate.substr(6,4)
			}
			/*else
			{
				startDate=Form1.txtCurDate.value
				year=startDate.substr(0,4)
				month=startDate.substr(5,2)
				day=startDate.substr(8,2)
			}*/
			
			Form1.HolidayDate_txtDay.value=day
			Form1.HolidayDate_txtMonth.value=month
			Form1.HolidayDate_txtYear.value="13"+year

			if(obj.Type==1)
			{
				
				Form1.SelDownHoliday.value=1
			}
			else if(obj.Type==2)
			{
				
				Form1.SelDownHoliday.value=2
			}
			else
			{
				Form1.SelDownHoliday.value=0
			}
			
		}
		/**********************************************************************************/
		function btnDeleteOnclick()
		{
			
			if((Form1.txtHolidayID.value!=0)||(Form1.txtHolidayID.value!=""))
			{
				if(confirm("¬Ì« „ÿ„∆‰ Â” Ìœø"))
				{
					Form1.txtDescr.value=""
					Form1.txtHolidayDescr.value=""
					Form1.txtSDate.value=""
					Form1.txtEDate.value=""
					Form1.SelHoliday.value=""
					Form1.SDate_txtYear.value=""
					Form1.SDate_txtMonth.value=""
					Form1.SDate_txtDay.value=""
					Form1.EDate_txtYear.value=""
					Form1.EDate_txtMonth.value=""
					Form1.EDate_txtDay.value=""
					Form1.txtSubmit.value="Delete"
					Form1.submit()
				}
					
			}
			else
				alert("«» œ« Ìò ”ÿ— «“ ê—Ìœ —« «‰ Œ«» ‰„«∆Ìœ!")
		}
		/**********************************************************************************/
		function clearData()
		{
			if(LastSelectedRowgrdItems!=null)
			{
				LastSelectedRowgrdItems.className=LastSelectedRowClassgrdItems;
			}
			Form1.txtDescrNew.value=""
			Form1.SelDownHoliday.value=0
			Form1.HolidayDate_txtDay.value=""
			Form1.HolidayDate_txtMonth.value=""
			Form1.HolidayDate_txtYear.value=""
		}
		/**********************************************************************************/
		function btnSaveOnclick()
		{
			Form1.txtDescr.value=""
			Form1.txtHolidayDescr.value=""
			Form1.txtSDate.value=""
			Form1.txtEDate.value=""
			Form1.SelHoliday.value=""
			Form1.SDate_txtYear.value=""
			Form1.SDate_txtMonth.value=""
			Form1.SDate_txtDay.value=""
			Form1.EDate_txtYear.value=""
			Form1.EDate_txtMonth.value=""
			Form1.EDate_txtDay.value=""
			
			if(Flag==0)
			{
			  Form1.txtHolidayID.value=0
			  Form1.txtFlag.value=0
			}
			if(Flag==1)
			{
			   Form1.txtFlag.value=1
			   Flag=0
			}
		
			if(Form1.SelDownHoliday.value==1)
			{
			Form1.txtTypeNew.value=1
			}
			else if(Form1.SelDownHoliday.value==2)
			{
			Form1.txtTypeNew.value=2
			}
	
			Form1.txtDate.value=Form1.HolidayDate_txtYear.value+"/"+Form1.HolidayDate_txtMonth.value+"/"+Form1.HolidayDate_txtDay.value
				
			if(Form1.txtDate.value=="//")
			{
			Form1.txtDate.value=""
			}
			else
			{
			Form1.txtDate.value=Form1.txtDate.value.substr(2,8)
			}
			if(Form1.SelDownHoliday.value==0 || Form1.txtDate.value=="")
			{
			alert("«ÿ·«⁄«  —« ò«„· ò‰Ìœ")
			return
			}
			Form1.txtDescrN .value=Form1.txtDescrNew.value
			Form1.txtSubmit.value="Save"
			Down=1
			 
			Form1.submit()
		 
		}
		/***********************************************************************************/
		function onClickbtnShow()
		{
			Form1.txtDescr.value=""
			Form1.txtSDate.value=""
			Form1.txtEDate.value=""
			Form1.SelHoliday.value=0
			Form1.SDate_txtYear.value=""
			Form1.SDate_txtMonth.value=""
			Form1.SDate_txtDay.value=""
			Form1.EDate_txtYear.value=""
			Form1.EDate_txtMonth.value=""
			Form1.EDate_txtDay.value=""
			
			Form1.txtType.value=0
			Form1.txtDescr.Value=""	
			Form1.txtHolidayDescr.value=""
			Form1.txtSDate.value=""
			Form1.txtEDate.value=""
			Form1.txtSubmit.value="ShowAll"
			Form1.submit()
		}
		/***********************************************************************************/
		function onClickBtnSearch()
		{
		
			Form1.txtSDate.value=Form1.SDate_txtYear.value+"/"+Form1.SDate_txtMonth.value+"/"+Form1.SDate_txtDay.value
			if (Form1.txtSDate.value=="//")
			{
				Form1.txtSDate.value=""
			}
			else
			{
			Form1.txtSDate.value=Form1.txtSDate.value.substr(2,8)
			}
	
			Form1.txtEDate.value=Form1.EDate_txtYear.value+"/"+Form1.EDate_txtMonth.value+"/"+Form1.EDate_txtDay.value
			if (Form1.txtEDate.value=="//")
			{
				Form1.txtEDate.value=""
			}
			else
			{
			Form1.txtEDate.value=Form1.txtEDate.value.substr(2,8)
			}
			Form1.txtType.value=Form1.SelHoliday.value
			if(Form1.txtType.value=="")
			{
			Form1.txtType.value=0
			}
			
			Form1.txtDescr.value=Form1.txtHolidayDescr.value 
			Form1.txtSubmit.value="Search"
			Form1.submit()
		}
			function onblurCurPage()
		{
			Form1.txtSubmit.value="OnTextChangedCurPage"
			Form1.submit()
		}
	
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 424px; HEIGHT: 192px" height="192" cellSpacing="1"
										cellPadding="1" width="424" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 280px" vAlign="top" align="center">
												<TABLE id="Table6" style="WIDTH: 653px; HEIGHT: 567px" cellSpacing="1" cellPadding="1"
													width="653" border="0">
													<TR>
														<TD style="HEIGHT: 52px" vAlign="top" align="center">
															<TABLE id="Table7" style="WIDTH: 588px; HEIGHT: 8px" cellSpacing="1" cellPadding="1" width="588"
																border="0">
																<TR>
																	<TD style="WIDTH: 141px; HEIGHT: 28px">«“  «—ÌŒ</TD>
																	<TD style="WIDTH: 222px; HEIGHT: 28px"><uc1:textdate id="SDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 49px; HEIGHT: 28px"> « «—ÌŒ</TD>
																	<TD style="WIDTH: 206px; HEIGHT: 28px"><uc1:textdate id="EDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 116px; HEIGHT: 28px" align="left">‰Ê⁄</TD>
																	<TD style="WIDTH: 23px; HEIGHT: 28px"><cc1:lcombo id="SelHoliday" runat="server" CssClass="txtControls" Width="121px" DataValueField="val"
																			DataTextField="Title" LookupName="HolidayType" ConnectionName="GenCnn"></cc1:lcombo></TD>
																</TR>
															</TABLE>
															<TABLE id="Table12" style="WIDTH: 592px; HEIGHT: 48px" cellSpacing="1" cellPadding="1"
																width="592" border="0">
																<TR>
																	<TD style="WIDTH: 190px">‘—Õ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	</TD>
																	<TD style="WIDTH: 539px"><asp:textbox id="txtHolidayDescr" tabIndex="8" runat="server" CssClass="txtControls" TextMode="MultiLine"
																			Width="326px" Height="31px"></asp:textbox></TD>
																	<TD style="WIDTH: 83px"><INPUT class="Cssbtnlimitserach" id="btnSearch" style="BORDER-LEFT-COLOR: #788bc2; BORDER-BOTTOM-COLOR: #788bc2; WIDTH: 96px; CURSOR: hand; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #788bc2; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; HEIGHT: 33px; BORDER-RIGHT-COLOR: #788bc2; BORDER-BOTTOM-STYLE: solid"
																			onclick="onClickBtnSearch()" type="button" name="btnSearch"></TD>
																	<TD><INPUT class="CssBtnShow" id="btnShow" style="BORDER-LEFT-COLOR: #788bc2; BORDER-BOTTOM-COLOR: #788bc2; CURSOR: hand; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #788bc2; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; HEIGHT: 33px; BORDER-RIGHT-COLOR: #788bc2; BORDER-BOTTOM-STYLE: solid"
																			onclick="onClickbtnShow()" type="button" name="btnShow"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 499px" vAlign="top" align="center">
															<TABLE id="Table9" dir="ltr" cellSpacing="1" cellPadding="1" width="260" border="0" style="WIDTH: 260px; HEIGHT: 34px">
																<TBODY>
																	<TR>
																		<TD style="WIDTH: 37px" align="right">
																			<asp:button id="FirstBtn1" runat="server" Width="29px" CssClass="CssFirstPage" BorderStyle="None"
																				BorderColor="Transparent" ToolTip="«Ê·Ì‰" BackColor="Transparent"></asp:button></TD>
																		<TD style="WIDTH: 26px" align="right">
																			<asp:button id="PrevBtn1" runat="server" Width="29px" CssClass="CssPrevPage" BorderStyle="None"
																				BorderColor="Transparent" ToolTip="ﬁ»·Ì" BackColor="Transparent"></asp:button></TD>
																		<TD style="WIDTH: 64px" vAlign="middle" align="right">
																			<asp:textbox id="Totalpage1" runat="server" Width="40px" CssClass="txtControls" BorderStyle="Groove"
																				BackColor="White" ReadOnly="True" Height="24px"></asp:textbox></TD>
																		<TD dir="rtl" style="WIDTH: 28px" vAlign="middle" align="right">&nbsp; «“</TD>
																		<TD style="WIDTH: 43px" vAlign="middle" align="right">
																			<asp:textbox id="CurPage" onblur="onblurCurPage()" tabIndex="1" runat="server" Width="40px" CssClass="txtControls"
																				BorderStyle="Groove" Height="24px" AutoPostBack="True"></asp:textbox></TD>
																		<TD style="WIDTH: 33px" align="right">
																			<asp:button id="NextBtn1" runat="server" Width="29px" CssClass="CssNextPage" BackColor="Transparent"
																				ToolTip="»⁄œÌ" BorderColor="Transparent" BorderStyle="None"></asp:button></TD>
																		<TD style="WIDTH: 38px">
																			<asp:button id="LastBtn1" runat="server" Width="29px" CssClass="CssLastPage" BorderStyle="None"
																				BorderColor="Transparent" ToolTip="¬Œ—Ì‰" BackColor="Transparent"></asp:button>
																			<asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
																	</TR>
														</TD>
													</TR>
												</TABLE>
												<div style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 100.29%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 300px">
													<cc1:automationgrid id="GrdHoliday" dir="rtl" runat="server" Width="442px" Height="280px" name="grdNumResult"
														UsingKeyBoard="False" ShowHeader="False" Scrolling="True" EnableClientPager="False" SendXML="DoNotSend"
														ClientSorting="False" AutoGenerateColumns="False" CreateClientSideScripts="False" ClientPageSize="0"
														HtcAddress=" " SelectRowOnClick="True" SelectRowOnMouseMove="False">
														<ItemStyle CssClass="CssItemStyle"></ItemStyle>
														<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle"></HeaderStyle>
														<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
														<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
														<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
														<Columns>
															<asp:BoundColumn DataField="Day" HeaderText="—Ê“ Â› Â">
																<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="FDate" HeaderText=" «—ÌŒ">
																<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="TypeHoly" HeaderText="‰Ê⁄ ">
																<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
															</asp:BoundColumn>
															<asp:TemplateColumn HeaderText="‘—Õ">
																<HeaderStyle Width="200px"></HeaderStyle>
																<ItemStyle Width="200px"></ItemStyle>
																<ItemTemplate>
																	<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SDescr") %>' Title='<%# DataBinder.Eval(Container, "DataItem.LDescr") %>' id='lbl1'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn Visible="False" DataField="HolidayID" HeaderText="HolidayID">
																<HeaderStyle Width="1px"></HeaderStyle>
																<ItemStyle Width="1px"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="Type" HeaderText="Type">
																<HeaderStyle Width="1px"></HeaderStyle>
																<ItemStyle Width="1px"></ItemStyle>
															</asp:BoundColumn>
														</Columns>
													</cc1:automationgrid>
												</div>
												<HR style="WIDTH: 53.03%; HEIGHT: 1px" width="53.03%" color="#000000" SIZE="1">
												<TABLE id="Table3" cellSpacing="2" cellPadding="1" width="20%" border="0">
													<TR>
														<TD><INPUT class="CssBtnNew" id="btnNew" style="CURSOR: hand" onclick="btnNewOnclick()" type="button"
																name="btnNew"></TD>
														<TD style="WIDTH: 74px"><INPUT class="CssBtnEdit" id="btnEdit" style="CURSOR: hand" onclick="btnEditOnclick()"
																type="button" name="btnEdit"></TD>
														<TD><INPUT class="CssBtnDelete" id="btnDelete" style="CURSOR: hand" onclick="btnDeleteOnclick()"
																type="button" name="btnDelete"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<TR>
								<TD id="DownRow" style="DISPLAY: inline" align="center">
									<TABLE id="Table2" style="WIDTH: 415px; HEIGHT: 158px" height="158" cellSpacing="1" cellPadding="1"
										width="415" border="0">
										<TR>
											<TD vAlign="top" align="center" width="15%" colSpan="4">
												<TABLE id="Table11" style="WIDTH: 410px; HEIGHT: 78px" cellSpacing="1" cellPadding="1"
													width="410" border="0">
													<TR>
														<TD>
															<TABLE id="Table10" style="WIDTH: 405px; HEIGHT: 44px" cellSpacing="1" cellPadding="1"
																width="405" border="0">
																<TR>
																	<TD style="WIDTH: 25px; HEIGHT: 27px">‰Ê⁄</TD>
																	<TD style="WIDTH: 169px; HEIGHT: 27px"><cc1:lcombo id="SelDownHoliday" runat="server" CssClass="txtControls" Height="15px" Width="121px"
																			DataValueField="val" DataTextField="Title" LookupName="HolidayType" ConnectionName="GenCnn"></cc1:lcombo></TD>
																	<TD style="WIDTH: 41px; HEIGHT: 27px" align="left"> «—ÌŒ</TD>
																	<TD style="HEIGHT: 27px"><uc1:textdate id="HolidayDate" runat="server"></uc1:textdate></TD>
																</TR>
															</TABLE>
															<TABLE id="Table13" cellSpacing="1" cellPadding="1" width="300" border="0">
																<TR>
																	<TD style="WIDTH: 32px">‘—Õ</TD>
																	<TD><asp:textbox id="txtDescrNew" tabIndex="8" runat="server" CssClass="txtControls" TextMode="MultiLine"
																			Width="350px" Height="42px"></asp:textbox></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<HR style="HEIGHT: 1px" width="50%" color="#000000" SIZE="1">
												<TABLE id="Table5" cellSpacing="2" cellPadding="1" width="20%" border="0">
													<TR>
														<TD><INPUT class="CssBtnNew" id="btnDownNew" style="CURSOR: hand" onclick="btnNewOnclick()"
																type="button" name="btnNew"></TD>
														<TD style="WIDTH: 74px"><INPUT class="CssBtnSave" id="btnSave" style="CURSOR: hand" onclick="btnSaveOnclick()"
																type="button" name="Button1"></TD>
														<TD style="WIDTH: 74px"><INPUT class="CssBtnCancel" id="btnCancel" style="CURSOR: hand" onclick="btnCancelOnclick()"
																type="button" name="Button2"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</table>
						<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="50%" border="0">
							<TBODY>
								<TR>
									<TD style="DISPLAY: none">
										<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
										<input id="txtMsg" type="text" name="txtMsg" runat="server">
										<input id="txtSubmit" type="text" name="txtSubmit" runat="server"> <input id="txtSDate" type="text" name="txtSDate" runat="server">
										<input id="txtEDate" type="text" name="txtEDate" runat="server"> <input id="txtPagingFlag" type="text" name="txtPagingFlag" runat="server"><input id="txtHolidayID" type="text" name="txtHolidayID" runat="server">
										<input id="txtType" type="text" name="txtType" runat="server"> <input id="txtDescr" type="text" name="txtDescr" runat="server">
										<input id="txtDate" type="text" name="txtDate" runat="server"> <input id="txtFlag" type="text" name="txtFlag" runat="server"><input id="txtTypeNew" type="text" name="txtTypeNew" runat="server">
										<input id="txtDown" type="text" name="txtDown" runat="server"> <input id="txtDescrN" type="text" name="txtDescrN" runat="server">
									</TD>
								</TR>
					</td>
				</tr>
			</table>
			</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></form>
		</TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
