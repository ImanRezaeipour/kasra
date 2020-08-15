<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ConfermentAccess.aspx.vb" Inherits="FrameWork.ConfermentAccess" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title> ›ÊÌ÷ «Œ Ì«—</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			//////////////////////////////////////////////////////////////////////////////////
			function onLoad()
			{
				document.all("Body").scroll="no"				
			}
			//////////////////////////////////////////////////////////////////////////////////
			function RefreshFrameAccessRole()
			{
				Form1.ToPersonId.value=window.frames('FrameGridPersons').document.all.item('ToPersonId').value
				if (Form1.ToPersonId.value=='')
					Form1.ToPersonId.value='0'
				var url
				url='MyCartableAccessRole.aspx?FromPersonId='+Form1.FromPersonId.value+' &ToPersonId='+Form1.ToPersonId.value
				window.frames('FrameAccessRole').location=url
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onclickbtnSave()
			{
				if (Form1.ToPersonId.value=='')
					Form1.ToPersonId.value='0'
				if (Form1.ToPersonId.value=='0')
				{
					alert('ÂÌç ¬Ì „Ì «“ ê—Ìœ «‰ Œ«» ‰‘œÂ «” ')
					return
				}
				else
				{
					var myStartDate = Form1.StartDate_txtYear.value + Form1.StartDate_txtMonth.value + Form1.StartDate_txtDay.value
					var now= Form1.ToDay.value.substr(0,4)+Form1.ToDay.value.substr(5,2)+Form1.ToDay.value.substr(8,2)
					
					if(myStartDate < Form1.ToDay.value)
					{
						alert(" «—ÌŒ ‘—Ê⁄ ‰„Ì Ê«‰œ ÅÌ‘ «“ «„—Ê“ »«‘œ ")
						return;
					}
					else
					window.frames('FrameAccessRole').onclickbtnSave()
				}
			}
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssPage" id="Table1" style="POSITION: relative; TOP: 10px; HEIGHT: 620px"
							height="620" cellSpacing="1" cellPadding="1" width="95" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table2" style="HEIGHT: 612px" height="612" cellSpacing="1" cellPadding="1" width="100%"
										align="right" border="0">
										<TR>
											<TD style="HEIGHT: 504px" vAlign="top" align="right">
												<TABLE id="Table3" style="WIDTH: 952px; HEIGHT: 532px" cellSpacing="1" cellPadding="1"
													width="952" align="right" border="0">
													<TR>
														<TD id="TdFrame" style="WIDTH: 706px" vAlign="top" width="706"><IFRAME id="FrameGridPersons" style="WIDTH: 99.31%; HEIGHT: 100%" align="right" marginWidth="0"
																marginHeight="0" src="ToPersonTab.aspx" frameBorder="no" width="100%" scrolling="no" height="100%">
															</IFRAME>
														</TD>
														<TD vAlign="top">
															<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="right" border="0">
																<TR>
																	<TD>
																		<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="right" border="0">
																			<TR>
																				<TD> «—ÌŒ ‘—Ê⁄ :</TD>
																				<TD><uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
																			</TR>
																			<TR>
																				<TD> «—ÌŒ Å«Ì«‰ :</TD>
																				<TD><uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
																<TR>
																	<TD><IFRAME id="FrameAccessRole" style="WIDTH: 100.41%; HEIGHT: 293.18%" align="right" marginWidth="0"
																			marginHeight="0" src="MyCartableAccessRole.aspx" frameBorder="no" width="100%" scrolling="no"
																			height="100%"></IFRAME>
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 873px; HEIGHT: 2px" width="873" SIZE="2">
												<TABLE id="Table6" style="WIDTH: 15px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="15"
													border="0">
													<TR>
														<TD><INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave" style="cursor:hand"></TD>
														<TD style="DISPLAY: none"><INPUT id="ToPersonId" type="text" name="ToPersonId" runat="server">
															<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
															<INPUT id="FromPersonId" type="text" name="FromPersonId" runat="server"> <input id="XMLConfermentAccess" type="text" name="XMLConfermentAccess" runat="server">
															<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity></TD>
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
			<input type="hidden" id="ToDay" name="ToDay" runat="server">
		</form>
	</body>
</HTML>
