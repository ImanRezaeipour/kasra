<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FillSession.aspx.vb" Inherits="TA.FillSession" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FillSession</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<SCRIPT language="jscript">
		function PageLoad()
		{
			var url="/ReportGen/FillSession.aspx?OnlineUserID="+Form1.txtonlineUser.value
			window.open(url)	
			window.close()
		}
		</SCRIPT>
	</HEAD>
	<body MS_POSITIONING="GridLayout" onload="PageLoad()">
		<form id="Form1" method="post" runat="server">
			<table>
				<tr>
					<td>
						<input id="txtonlineUser" runat="server" NAME="txtonlineUser">
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
