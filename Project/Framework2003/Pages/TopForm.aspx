<%@ Page Language="vb" AutoEventWireup="false" Codebehind="TopForm.aspx.vb" Inherits="FrameWork.TopForm" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML 
dir=rtl>
  <HEAD>
		<title>TopForm</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="<%=onlineuser.commonLib.StyleLibURL%>" type=text/css rel=stylesheet>
		<LINK href="../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../Includes/Styles/PopupMenuStyle.css" type="text/css" rel="stylesheet">
		<!--#include file="../includes/asplib.inc"-->
		<SCRIPT src="../Includes/Scripts/Js/vbulletin_global.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../Includes/Scripts/Js/vbulletin_menu.js" type="text/javascript"></SCRIPT>
		<script language="vbscript" src="../includes/Shdate.inc"> </script>
</HEAD>
	<BODY bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0" bgColor="#336699">
		<P>
			<FORM id="Form1" method="post" runat="server">
				<TABLE id="Table1" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD vAlign="middle" align="center">
							<P>
								<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity></P>
							<P>
								<TABLE id="Table2" style="BORDER-RIGHT: 2px groove; BORDER-TOP: 2px groove; BORDER-LEFT: 2px groove; BORDER-BOTTOM: 2px groove; HEIGHT: 16px"
									height="16" cellSpacing="0" cellPadding="0" width="100%" background="../Images/TopForm/BackTop.gif"
									border="0">
									<TR>
										
										<TD vAlign="middle" align="center"><IMG alt="" src="../Images/TopForm/Send.gif"></TD>
										<TD vAlign="middle" align="center"><IMG alt="" src="../Images/TopForm/Send.gif"></TD>
										<TD vAlign="middle" align="center"><IMG alt="" src="../Images/TopForm/Reply.gif"></TD>
										<TD vAlign="middle" align="center"><IMG alt="" src="../Images/TopForm/Send.gif"></TD>
										<TD vAlign="middle" align="center"><IMG alt="" src="../Images/TopForm/Delete.gif"></TD>
										<TD class="vbmenu_control" ID="NewDropDown"  vAlign="middle" align="center"
											style="WIDTH: 37px"><IMG alt="" src="../Images/TopForm/DropDown.gif">
											<script>
											vbmenu_register("NewDropDown");
											</script>
										</TD>
										<TD vAlign="middle" align="right"><IMG alt="" src="../Images/TopForm/New.gif" style="WIDTH: 50px; HEIGHT: 41px"
												height="41" width="50"></TD>
									</TR>
								</TABLE>
							</P>
						</TD>
					</TR>
				</TABLE>
				<DIV class="vbmenu_popup" id="NewDropDown_Menu" >
					<TABLE cellSpacing="1" cellPadding="1" border="0">
						<TBODY>
							<TR>
								<TD class="thead">⁄„·Ì« <A name="goto_displaymodes"></A>
								</TD>
							</TR>
							<TR>
								<TD class="vbmenu_option" title="nohilite"><IMG class="inlineimg" alt="Linear Mode" src="Images/mode_linear.gif">
									<STRONG>ÅÊ‘Â ÃœÌœ «ÌÃ«œ</STRONG>
								</TD>
							</TR>
							<TR>
								<TD class="vbmenu_option"><IMG class="inlineimg" alt="Hybrid Mode" src="Images/mode_hybrid.gif">
									<A href="http://www.codeguru.com/forum/showthread.php?mode=hybrid&amp;t=287491">«’·«Õ
									</A>
								</TD>
							</TR>
							<TR>
								<TD class="vbmenu_option"><IMG class="inlineimg" alt="Threaded Mode" src="Images/mode_threaded.gif">
									<A href="http://www.codeguru.com/forum/showthread.php?p=916450&amp;mode=threaded#post916450">
										Õ–›</A>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</DIV>
			</FORM>
		<P></P>
		<SCRIPT type="text/javascript">

			vBulletin_init();

		</SCRIPT>
	</BODY>
</HTML>
