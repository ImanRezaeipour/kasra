<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrameTreeOnTa.aspx.vb" Inherits="TA.FrameTreeOnTa" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrameTreeOnTa</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var LastActiveNode=0	//(last
		////____________________________________________________________________________
		function nodeClick(obj) 
		{
			var objCollection=document.all("TreeLevel")(1).all	
			var t;
			
			if (LastActiveNode!=0)
			{
				objCollection.item(LastActiveNode).style.backgroundColor="transparent"
				objCollection.item(LastActiveNode).style.color="#663300"
			}
						
			for(t=objCollection.length-1;t>0;--t)
				if (objCollection.item(t).tagName=='A')
					if (objCollection.item(t).DepartmentId==obj.DepartmentID)
						LastActiveNode=t
							
			Form1.DepartmentId.value=obj.DepartmentID
			window.parent.document.all.item('DepartmentId').value=obj.DepartmentID
			//alert(window.parent.document.all.item('DepartmentId').value)
			window.parent.ModifyGrid()
		}
		////________________________________________________________________________
		function SelTree()
		{
			var objCollection=document.all("TreeLevel")(1).all	
			var t;
			
			
			var obj=null;			
			
			for(t=objCollection.length-1;t>0;--t)
				if (objCollection.item(t).DepartmentID==window.frames("FrameGridPersons").document.all.item('RoleId').value)
				{
					objCollection.item(t).style.backgroundColor="#C0C0FF"
					objCollection.item(t).style.color="#FFFFFF"
					obj=objCollection
				}
				else
				{
					objCollection.item(t).style.backgroundColor='transparent'   
					objCollection.item(t).style.color="#000000"
				}	
			
		}
		////________________________________________________________________________
		////________________________________________________________________________
		</script>
	</HEAD>
	<body dir="rtl"  bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0" scroll="no"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Page" style="BACKGROUND-COLOR: #e7eeff; WIDTH: 100%; HEIGHT: 554px" height="554"
				cellSpacing="1" cellPadding="1" width="974" border="0">
				<TR>
					<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 568px" vAlign="top" align="right">
						<TABLE id="Table1" style="HEIGHT: 572px" cellSpacing="1" cellPadding="1" width="100%" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<DIV id="DivTree" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 200px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 525px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
										runat="server"><cc1:tree id="TreeLevel" runat="server" Width="100px" Height="100px"></cc1:tree></DIV>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td style="DISPLAY: none" vAlign="top"><INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" name="BeforePrevStyle">
						<INPUT id="PageName" style="WIDTH: 1px" type="hidden" name="PageName"> <INPUT id="recID" type="hidden" size="1" name="recID">
						<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
						<INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent"> <input id="DepartmentId" name="DepartmentId" runat="server">
						<input id="FrmDeptId" name="FrmDeptId" runat="server"> <input id="TypeAccess" runat="server">
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
						<input id="txtSessionID" name="txtSessionID" runat="server"> <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
							runat="server" />
					</td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
