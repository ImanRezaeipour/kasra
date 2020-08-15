<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ModifyLogs.aspx.vb" Inherits="FrameWork.ModifyLogs" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ModifyLogs</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
			<input type="text" id="MenuItemId" name="MenuItemId" runat="server">
		</form>
	</body>
</HTML>
