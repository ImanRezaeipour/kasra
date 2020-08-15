<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FramesItemRename.aspx.vb" Inherits="FrameWork.FramesItemRename" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FramesItemRename</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function OnLoadPage()
			{
				url="ItemesRename.aspx?MenuItemID=" +Form1.txtMenuItemID.value+ "&ItemName=" +Form1.txtItemName.value
				document.all.item("Report").src=url
			}
		</script>
	</HEAD>
	<body onload="OnLoadPage()" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<IFRAME id="Report" dir="rtl" width="100%" scrolling="no" height="100%"></IFRAME>
			<input id="txtMenuItemID" style="DISPLAY: none" type="text" name="txtMenuItemID" runat="server">
			<input id="txtItemName" style="DISPLAY: none" type="text" name="txtItemName" runat="server">
		</form>
	</body>
</HTML>
