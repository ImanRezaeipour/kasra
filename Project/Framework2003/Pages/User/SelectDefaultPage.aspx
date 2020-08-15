<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SelectDefaultPage.aspx.vb" Inherits="FrameWork.SelectDefaultPage"  validateRequest="false"%>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>SelectDefaultPage</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function pageLoad()
		{
//			document.body.scroll="no"
			if (Form1.txtMSG.value!="")
			{
				alert(Form1.txtMSG.value)
				Form1.txtMSG.value=""
			}
		}
		////_____________________________________________________________________________________
		function nodeClick(obj) 
		{						
			//define TreeLevel variable
			var objCollection=document.all("Tree1")(1).all	
			var t;
			Form1.Selected.value = Form1.recID.value
			
		}
		////_____________________________________________________________________________________
		function onclickbtnSave(){
			if((Form1.recID.value=="")||(Form1.recID.value==0))
			{
				alert("ÂÌç ‰ÊœÌ »Â „‰ŸÊ— –ŒÌ—Â «‰ Œ«» ‰‘œÂ «” ")
			}
			else
			{
				Form1.txtSubmit.value="Save"
				Form1.submit();
			}/**/
		}
		////_____________________________________________________________________________________
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="yes" onload="pageLoad()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 515px; HEIGHT: 342px" height="342" cellSpacing="1"
										cellPadding="1" width="515" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 383px" vAlign="top" align="center">
												<DIV id="DivTree" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 340px; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 528px"
													runat="server">
													<DIV style="scrolling: yes"><cc1:tree id="Tree1" runat="server" Width="124px" Height="78px"></cc1:tree></DIV>
												</DIV>
												<table width="50" align="center">
													<tr>
														<td><input class="CssBtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" runat="server"
																NAME="btnSave">
														</td>
													</tr>
												</table>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
                <tr>
                    <td style="display: none">
                        <input id="DepartmentId" style="width: 1px" type="text" name="DepartmentId" runat="server">
                        <input id="parent" style="width: 1px" type="text" name="parent">
                        <input id="BeforePrevStyle" style="width: 1px" type="text" size="1" name="BeforePrevStyle">
                        <input id="PrevrecID" style="width: 1px" type="text" size="1" name="PrevrecID">
                        <input id="recID" style="width: 1px" type="text" size="1" name="recID">
                        <input id="PageName" style="width: 1px" type="text" size="1" value="SelectDefaultPage"
                            name="PageName">
                        <input id="hServerName" type="text" name="hServerName" runat="server">
                        <input id="ToPersonId1" type="text" name="ToPersonId1" runat="server">
                        <input id="XMLMenu" type="text" name="XMLMenu" runat="server">
                        <input id="FromPersonId1" type="text" name="FromPersonId1" runat="server">
                        <input id="Selected" type="text" name="Selected" runat="server">
                        <cc1:mysecurity id="onlineUser" runat="server">
                        </cc1:mysecurity>
                        <input type="text" id="txtSubmit" runat="server" name="txtSubmit">
                        <input type="text" id="txtMSG" runat="server" name="txtMSG">
                    </td>
                </tr>
			</table>
		</form>
	</body>
</HTML>
