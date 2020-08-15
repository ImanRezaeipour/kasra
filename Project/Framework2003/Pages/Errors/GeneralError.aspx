<%@ Page Language="vb" AutoEventWireup="false" Codebehind="GeneralError.aspx.vb" Inherits="FrameWork.GeneralError" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>GeneralError</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../Includes/StyleForPages.css" type="text/css"
			rel="stylesheet">
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" scroll="no">
		<FORM id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="right" border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<TR>
								<TD vAlign="middle" align="center">
									<TABLE class="CssPage" id="Layer3" height="182" cellSpacing="0" cellPadding="0" width="401"
										border="0" style="WIDTH: 401px; HEIGHT: 182px">
										<TR>
											<TD class="VertGradientBlue1" style="HEIGHT: 53px" vAlign="middle" align="center"><IMG id="ImgError" alt="" src="../../Images/CustomError/attention.gif" name="ImgError"
													align="middle"><font color="maroon" size="5">&nbsp; ÊÃÂ </font>
											</TD>
										</TR>
										<TR>
											<TD id="Td2" vAlign="middle" align="center" runat="server">
												<P><font color="maroon" size="3"> Œÿ« œ— «‰Ã«„ ⁄„·Ì«  ! </font>
												</P>
												<P><font color="maroon" size="3"> ·ÿ›« „Ãœœ«  ·«‘ ‰„«ÌÌœ </font>
												</P>
											</TD>
										</TR>
									</TABLE>
									<P>
										<asp:Label id="lblMessage" runat="server"></asp:Label></P>
									<P>
										<asp:Label id="lblErrorInfoStr" runat="server"></asp:Label></P>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</body>
</HTML>
