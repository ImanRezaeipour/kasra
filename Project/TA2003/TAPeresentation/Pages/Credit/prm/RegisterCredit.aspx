<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RegisterCredit.aspx.vb" Inherits="TA.RegisterCredit1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>RegisterCredit</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../Includes/TabBar/Style/SpryTabbedPanels.css" type="text/css" rel="stylesheet">
		<script src="../../../../Includes/TabBar/Script/SpryTabbedPanels.js" type="text/javascript"></script>
		<script language="javascript">
		
		//______________________________________________________________________
		function onclickTabClockCredit()
		{
			window.frames("FrClockCredit").location ="Frames/ClockCredit.aspx"
		}
		//______________________________________________________________________
		function onclickTabFrDailyCredit()
		{
			window.frames("FrDailyCredit").location ="Frames/DailyCredit.aspx"
		}
		//______________________________________________________________________
		function onclickTabFrExteraWork()
		{
			window.frames("FrExteraWork").location ="Frames/ExteraWork.aspx"
		}
		//______________________________________________________________________
		function onclickTabFrInOutCard()
		{
			window.frames("FrInOutCard").location ="Frames/InOutCard.aspx"
		}
		//________________________________________________________________________
		function pageload()
		{
		    onclickTabClockCredit()
			
		}
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" onload="pageload()" rightMargin="0"
		MS_POSITIONING="GridLayout" scroll="no">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="95%" cellSpacing="0" cellPadding="0" width="95%"
							border="0" align="center">
							<tr>
								<td dir="rtl" vAlign="middle" align="center">
									<table id="page" width="95%" height="95%" border="0" align="center" style="" >
										<tr>
											<td vAlign="middle" align="right">
												<div class="TabbedPanels" id="TabbedPanels1" dir="rtl" style="WIDTH: 100%; HEIGHT: 2094px"
													align="center">
													<ul class="TabbedPanelsTabGroup" dir="rtl">
														<li class="TabbedPanelsTab" id="ClockCredit" dir="rtl" style="TEXT-ALIGN: right" onclick="onclickTabClockCredit()"
															tabIndex="0">
															<font face="tahoma" style="FONT-WEIGHT: bold"  color="#2d2d90" size="2">„ÃÊ“ ”«⁄ Ì</font>
														</li>
														<li class="TabbedPanelsTab" id="DailyCredit" dir="rtl" style="TEXT-ALIGN: right" onclick="onclickTabFrDailyCredit()"
															tabIndex="0">
															<font face="tahoma" color="#2d2d90" size="2">„ÃÊ“ —Ê“«‰Â</font>
														</li>
														<li class="TabbedPanelsTab" id="ExteraWork" dir="rtl" style="TEXT-ALIGN: right" onclick="onclickTabFrExteraWork()"
															tabIndex="0">
															<font face="tahoma" color="#2d2d90" size="2">&nbsp;«÷«›Â ò«—</font>
														</li>
														<li class="TabbedPanelsTab" id="InOutCard" dir="rtl" style="TEXT-ALIGN: right" onclick="onclickTabFrInOutCard()"
															tabIndex="0">
															<font face="tahoma" color="#2d2d90" size="2">&nbsp;ò«—   —œœ</font>
														</li>
													</ul>
													<div class="TabbedPanelsContentGroup" dir="rtl" align="center">
														<div class="TabbedPanelsContent" align="center">
															<IFRAME id="FrClockCredit" dir="rtl" style="WIDTH:97%; HEIGHT:600px" name="FrClockCredit"
																align="middle" frameBorder="0" scrolling="no"></IFRAME>
														</div>
														<div class="TabbedPanelsContent" dir="rtl" align="center"><IFRAME id="FrDailyCredit" dir="rtl" style="WIDTH: 97%; HEIGHT: 600px" name="FrDailyCredit"
																align="middle" frameBorder="0" scrolling="no"></IFRAME>
														</div>
														<div class="TabbedPanelsContent" dir="rtl" align="center"><IFRAME id="FrExteraWork" dir="rtl" style="WIDTH: 97%; HEIGHT: 600px" name="FrExteraWork"
																align="middle" frameBorder="0" scrolling="no"></IFRAME>
														</div>
														<div class="TabbedPanelsContent" dir="rtl" align="center"><IFRAME id="FrInOutCard" dir="rtl" style="WIDTH: 97%; HEIGHT: 600px" name="FrInOutCard"
																align="middle" frameBorder="0" scrolling="no"></IFRAME>
														</div>
													</div>
												</div>
												<script type="text/javascript">
										<!--
										var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
										//-->
												</script>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
