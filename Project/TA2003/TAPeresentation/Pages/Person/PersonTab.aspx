<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PersonTab.aspx.vb" Inherits="TA.XTab" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>------------------------------------------------------------انتخاب 
			پرسنل------------------------------------------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/FrameWork/Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="XTab.css" type="text/css" rel="stylesheet">
		<LINK href="XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="Paging.css" type="text/css" rel="stylesheet">
		<LINK href="/FrameWork/Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="General.js"></script>
		<script language="javascript">
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP") 
		////______________________________________________________________________________
		var flag
		function OnClickBtnOK()
		{
		    var strxml = window.frames("MainFrame").document.all.item("txtTmpXMLX").value
		    strxml = ReplaceAll(strxml, '&', '');
		    flag = 1
		    window.returnValue = "<UserEntity>" + strxml + "</UserEntity>"
		    window.close()
		}
		////______________________________________________________________________________
		function OnClickBtnCancel()
		{
			if (flag!=1)
				window.returnValue=''
			window.close()
		}
		////______________________________________________________________________________
		function onkeydownESC()
		{
			var key=window.event.keyCode
			if (key==27)
				window.close()
		}
		////______________________________________________________________________________
		function XTabSearch()
		{
			//alert("XTabSearch")	
			var parmPersonID='';
			var parmPersonName='';
			var parmDeptID='';
			var paramRoleType='';
			var ParamCardNo='';			
			//PersoID Param
			if (Form1.XTabPersonID.value!="")
			{
				parmPersonID=Form1.LXTabPersonIDSearchType.value+Form1.XTabPersonID.value
				/*if (Form1.LXTabPersonIDSearchType.value==0) //با شود شروع
					parmPersonID="Like '"+Form1.XTabPersonID.value+"%" 
				else if (Form1.LXTabPersonIDSearchType.value==1) //داراي
					parmPersonID="Like '%"+Form1.XTabPersonID.value+"%" 
				else if (Form1.LXTabPersonIDSearchType.value==2) //برابر
					parmPersonID="='"+Form1.XTabPersonID.value
				else if (Form1.LXTabPersonIDSearchType.value==3) //مخالف
					parmPersonID="<>'"+Form1.XTabPersonID.value*/
			}
			
			
			//PersoName Param
			if (Form1.XTabLastName.value!="")
			{
				parmPersonName=Form1.LXTabPersonNameSearchType.value+Form1.XTabLastName.value
			}
			//DeptID Param
			if (Form1.XTabDeptID.value!="")
			{
				parmDeptID=Form1.LXTabDeptSearchType.value+Form1.XTabDeptID.value
			}
			//paramRoleType Param
			if (Form1.XTabRoleType.value!="")
			{
				paramRoleType=Form1.LXTabRoleTypeSearchType.value+Form1.XTabRoleType.value
			}
			if (Form1.txtCardNo.value!="")
			{
				ParamCardNo=Form1.txtCardNo.value
			}
			
			window.frames("MainFrame").document.all.item("txtSubmit").value="Search"
			window.frames("MainFrame").document.all.item("txtPID").value=parmPersonID
			window.frames("MainFrame").document.all.item("txtPName").value=parmPersonName
			window.frames("MainFrame").document.all.item("txtDeptID").value=parmDeptID
			window.frames("MainFrame").document.all.item("txtRoleType").value=paramRoleType
			window.frames("MainFrame").document.all.item("txtCardNo").value=ParamCardNo
			
			//alert(Form1.LXTabPersonIDSearchType.value)
			//alert(parmPersonID)
			window.frames("MainFrame").document.all.item("Form1").submit()
		
			
		}
		////_________________________________________________________________________
		function AjaxFunction()
		{
			//alert("AjaxFunction")			
			if (oRequst.readyState==4)
			{
				if(oRequst.status==200)
				{
					window.frames("MainFrame").document.all.item("XMLX").value=oRequst.responseText
					window.frames("MainFrame").XTabSearch()
				}
			}
		}
		////______________________________________________________________________________
		function XTabShowAll()
		{
			//alert("XTabShowAll")
			
			Form1.LXTabPersonIDSearchType.value=0
			Form1.LXTabPersonNameSearchType.value=0
			Form1.LXTabDeptSearchType.value=0
			Form1.LXTabRoleTypeSearchType.value=0
			
			Form1.XTabPersonID.value=""
			Form1.XTabLastName.value=""
			Form1.XTabDeptID.value =""
			Form1.XTabRoleType.value=""
			Form1.txtCardNo.value=""
			
			window.frames("MainFrame").document.all.item("txtSubmit").value="Search"
			window.frames("MainFrame").document.all.item("txtPID").value=""
			window.frames("MainFrame").document.all.item("txtPName").value=""
			window.frames("MainFrame").document.all.item("txtDeptID").value=""
			window.frames("MainFrame").document.all.item("txtRoleType").value=""
			window.frames("MainFrame").document.all.item("txtCardNo").value=""
			window.frames("MainFrame").document.all.item("Form1").submit()
		}
		////______________________________________________________________________________
		function pageLoad()
		{
			//alert("pageLoad")
			//alert(Form1.txtFlag.value)
			Form1.LXTabPersonIDSearchType.value=0
			Form1.LXTabPersonNameSearchType.value=0
			Form1.LXTabDeptSearchType.value =0
			Form1.LXTabRoleTypeSearchType.value=0
			
			//window.frames("MainFrame").document.all.item("txtFlag").value=Form1.txtFlag.value 
			
			document.all.item('MainFrame').src =  "FramePersonTab.aspx?flag="+Form1.txtFlag.value+"&CategoryId="+Form1.txtCategoryId.value +"&SDate="+Form1.txtSDate.value +"&EDate="+Form1.txtEDate.value +"&FlagAccess="+Form1.txtAccessflag.value +"&MenuItemID=" +Form1.txtMenuItemID.value +'&SessionID='+Form1.txtSessionID.value 
			
		}
		////______________________________________________________________________________
		</script>
	</HEAD>
	<body id="body" dir="rtl" onkeydown="onkeydownESC()" bottomMargin="0" leftMargin="0" topMargin="0"
		scroll="no" onload="pageLoad()" rightMargin="0" onunload="OnClickBtnCancel()">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="1">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssPage" id="Table1" style="WIDTH: 615px; HEIGHT: 504px" height="504" cellSpacing="1"
							cellPadding="1" width="615" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table2" style="WIDTH: 606px; HEIGHT: 378px" cellSpacing="1" cellPadding="1"
										width="606" align="right" border="0">
										<TR>
											<TD style="HEIGHT: 454px" vAlign="top" align="center">
												<TABLE class="XTabConditionTable" id="XTabConditionTable" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 645px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 56px"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 1px" align="right" colSpan="4">
															<TABLE id="Table3" style="WIDTH: 634px; HEIGHT: 8px" cellSpacing="1" cellPadding="1" width="634"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 56px">کد پرسنلي</TD>
																	<TD style="WIDTH: 92px"><cc1:lcombo id="LXTabPersonIDSearchType" runat="server" CssClass="txtControls" FirstSelect="False"
																			ConnectionName="GenCnn" Width="115px">
																			<ASP:LISTITEM Selected="True" Value="0">شروع شود 
                              با</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">داراي</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">برابر</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">مخالف</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabPersonID" style="WIDTH: 132px; HEIGHT: 25px" type="text"
																			size="16" name="XTabPersonID"></TD>
																	<TD style="WIDTH: 62px">نام خانوادگي</TD>
																	<TD><cc1:lcombo id="LXTabPersonNameSearchType" runat="server" CssClass="txtControls" FirstSelect="False"
																			ConnectionName="GenCnn" Width="115px">
																			<ASP:LISTITEM Selected="True" Value="0">شروع شود 
                              با</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">داراي</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">برابر</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">مخالف</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabLastName" style="WIDTH: 132px; HEIGHT: 25px" type="text"
																			size="16" name="XTabLastName"></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 56px">واحد</TD>
																	<TD style="WIDTH: 92px">
																		<cc1:lcombo id="LXTabDeptSearchType" runat="server" Width="115px" ConnectionName="GenCnn" FirstSelect="False"
																			CssClass="txtControls">
																			<ASP:LISTITEM Selected="True" Value="0">شروع شود 
                              با</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">داراي</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">برابر</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">مخالف</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabDeptID" style="WIDTH: 132px; HEIGHT: 25px" type="text"
																			size="16" name="XTabDeptID"></TD>
																	<TD style="WIDTH: 62px">سمت</TD>
																	<TD>
																		<cc1:lcombo id="LXTabRoleTypeSearchType" runat="server" Width="115px" ConnectionName="GenCnn"
																			FirstSelect="False" CssClass="txtControls">
																			<ASP:LISTITEM Selected="True" Value="0">شروع شود 
                              با</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">داراي</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">برابر</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">مخالف</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabRoleType" style="WIDTH: 132px; HEIGHT: 25px" type="text"
																			size="16" name="XTabRoleType"></TD>
																</TR>
																<tr>
																<td style="HEIGHT: 20px">کد کارت</td>
																<td><INPUT class="txtControls" id="txtCardNo" style="WIDTH: 115px; HEIGHT: 20px" type="text"
																			size="16" name="txtCardNo"></td>
																</tr>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="center" colSpan="4"><INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" style="WIDTH: 102px; HEIGHT: 32px"
																onclick="XTabSearch()" type="button" name="XTabRestrictedSearchBtn"> <INPUT class="CssBtnShow" id="XTabShowAllBtn" onclick="XTabShowAll()" type="button" name="XTabShowAllBtn">
														</TD>
													</TR>
												</TABLE>
												<IFRAME id="MainFrame" dir="rtl" style="WIDTH: 645px; HEIGHT: 400px" name="LFrame" align="middle"
													src="" frameBorder="0" scrolling="no"></IFRAME>
											</TD>
										</TR>
										<TR>
											<TD align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 64.91%; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table5" cellSpacing="1" cellPadding="1" border="0">
													<TR>
														<TD><INPUT class="CssBtnOK" id="btnOk" onclick="OnClickBtnOK()" type="button" name="btnOk"></TD>
														<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<tr>
											<td style="DISPLAY: none">
												<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <input type="text" id="txtFlag" runat="server">
												<input type="text" id="txtCategoryId" runat="server"> <input type="text" id="txtAccessflag" runat="server" NAME="txtAccessflag">
												<input type="text" id="txtSDate" runat="server"> <input type="text" id="txtEDate" runat="server"><input type="text" id="txtMenuItemID" runat="server" NAME="txtMenuItemID">
											</td>
										</tr>
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
