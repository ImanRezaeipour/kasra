<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PersonTab.aspx.vb" Inherits="FrameWork.XTab" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>«‰ Œ«» Å—”‰·</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="XTab.css" type="text/css" rel="stylesheet">
		<LINK href="XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="General.js"></script>
		<script language="javascript">
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		////______________________________________________________________________________
		var flag
		function OnClickBtnOK()
		{
			flag=1 
			window.returnValue="<UserEntity>"+window.frames("MainFrame").document.all.item("txtTmpXMLX").value+"</UserEntity>"
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
			var parmPersonID='';
			var parmPersonName='';
						
			//PersoID Param
			if (Form1.XTabPersonID.value!="")
			{
				parmPersonID=Form1.LXTabPersonIDSearchType.value+Form1.XTabPersonID.value
				/*if (Form1.LXTabPersonIDSearchType.value==0) //»« ‘Êœ ‘—Ê⁄
					parmPersonID="Like '"+Form1.XTabPersonID.value+"%" 
				else if (Form1.LXTabPersonIDSearchType.value==1) //œ«—«Ì
					parmPersonID="Like '%"+Form1.XTabPersonID.value+"%" 
				else if (Form1.LXTabPersonIDSearchType.value==2) //»—«»—
					parmPersonID="='"+Form1.XTabPersonID.value
				else if (Form1.LXTabPersonIDSearchType.value==3) //„Œ«·›
					parmPersonID="<>'"+Form1.XTabPersonID.value*/
			}
			
			//PersoName Param
			if (Form1.XTabLastName.value!="")
			{
				parmPersonName=Form1.LXTabPersonNameSearchType.value+Form1.XTabLastName.value
			}
			window.frames("MainFrame").document.all.item("txtSubmit").value="Search"
			window.frames("MainFrame").document.all.item("txtPID").value=parmPersonID
			window.frames("MainFrame").document.all.item("txtPName").value=parmPersonName
			window.frames("MainFrame").document.all.item("Form1").submit()
		
			
		}
		////_________________________________________________________________________
		function AjaxFunction()
		{
						
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
			window.frames("MainFrame").document.all.item("txtSubmit").value="Search"
			window.frames("MainFrame").document.all.item("txtPID").value=""
			window.frames("MainFrame").document.all.item("txtPName").value=""
			window.frames("MainFrame").document.all.item("Form1").submit()
		}
		////______________________________________________________________________________
		function pageLoad()
		{
			Form1.LXTabPersonIDSearchType.value=0
			Form1.LXTabPersonNameSearchType.value=0
		}
		////______________________________________________________________________________
		</script>
	</HEAD>
	<body id="body" dir="rtl" onkeydown="onkeydownESC()" bottomMargin="0" leftMargin="0" onload="pageLoad()"
		topMargin="0" scroll="no" rightMargin="0" onunload="OnClickBtnCancel()">
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
												<TABLE class="XTabConditionTable" id="XTabConditionTable" style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 214px; HEIGHT: 29px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 1px" align="right" colSpan="4">
															<TABLE id="Table3" style="WIDTH: 634px; HEIGHT: 8px" cellSpacing="1" cellPadding="1" width="634"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 56px">òœ Å—”‰·Ì</TD>
																	<TD style="WIDTH: 92px">
																		<cc1:lcombo id="LXTabPersonIDSearchType" runat="server" Width="115px" ConnectionName="GenCnn"
																			FirstSelect="False" CssClass="txtControls">
																			<ASP:LISTITEM Selected="True" Value="0">‘—Ê⁄ ‘Êœ »«</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">œ«—«Ì</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">»—«»—</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">„Œ«·›</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabPersonID" style="WIDTH: 132px; HEIGHT: 25px" size="16"
																			name="XTabPersonID"></TD>
																	<TD style="WIDTH: 62px">‰«„ Œ«‰Ê«œêÌ</TD>
																	<TD>
																		<cc1:lcombo id="LXTabPersonNameSearchType" runat="server" Width="115px" ConnectionName="GenCnn"
																			FirstSelect="False" CssClass="txtControls">
																			<ASP:LISTITEM Selected="True" Value="0">‘—Ê⁄ ‘Êœ »«</ASP:LISTITEM>
																			<ASP:LISTITEM Value="1">œ«—«Ì</ASP:LISTITEM>
																			<ASP:LISTITEM Value="2">»—«»—</ASP:LISTITEM>
																			<ASP:LISTITEM Value="3">„Œ«·›</ASP:LISTITEM>
																		</cc1:lcombo></TD>
																	<TD><INPUT class="txtControls" id="XTabLastName" style="WIDTH: 132px; HEIGHT: 25px" size="16"
																			name="XTabLastName"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="center" colSpan="4"><INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" style="WIDTH: 102px; HEIGHT: 32px"
																onclick="XTabSearch()" type="button" name="XTabRestrictedSearchBtn"> <INPUT class="CssBtnShow" id="XTabShowAllBtn" onclick="XTabShowAll()" type="button" name="XTabShowAllBtn">
														</TD>
													</TR>
												</TABLE>
												<IFRAME id="MainFrame" dir="rtl" style="WIDTH: 645px; HEIGHT: 482px" name="LFrame" align="middle"
													src='FramePersonTab.aspx?SessionID=<%=request("SessionID")%>' frameBorder="0" scrolling="no">
												</IFRAME>
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
