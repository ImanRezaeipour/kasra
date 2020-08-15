<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MyCartableAccessRole.aspx.vb" Inherits="FrameWork.MyCartableAccessRole" validateRequest=false%>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>MyCartableAccessRole</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var root='/UserEntity/Person'
		//////////////////////////////////////////////////////////////////////////////////
		function onLoad()
		{
		
			if(Form1.txtSubmit.value!='')
			{
				Form1.txtSubmit.value=''
				
				xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(window.parent.frames('FrameGridPersons').document.all.item('XMLX').value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
		
				var xmlNodes;
				if(window.parent.frames('FrameGridPersons').document.all.item('ToPersonId').value!='')
				{
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+window.parent.frames('FrameGridPersons').document.all.item('ToPersonId').value+"]");
					if (Form1.cnt.value=='0')
						xmlNodes.item(0).selectSingleNode('Selected').text=0
					else
						xmlNodes.item(0).selectSingleNode('Selected').text=1					
				}
				//alert(xmlNodes.item(0).selectSingleNode('Selected').text)
				window.parent.frames('FrameGridPersons').document.all.item('XMLX').value=xmlDoc.xml
				window.parent.frames('FrameGridPersons').ShowSelectedX_Onclick('XTabTable')
				//window.parent.frames('FrameGridPersons').location='ToPersonTab.aspx'
				alert('⁄„·Ì«  «‰Ã«„ ‘œ')
				
			}				
			if(Form1.txtSD.value!="")
			{				
				window.parent.document.all.item("StartDate_txtDay").value=Form1.txtSD.value.substr(8,2) 
				window.parent.document.all.item("StartDate_txtMonth").value=Form1.txtSD.value.substr(5,2)    
				window.parent.document.all.item("StartDate_txtYear").value=Form1.txtSD.value.substr(0,4)   
				
				window.parent.document.all.item("EndDate_txtDay").value=Form1.txtED.value.substr(8,2) 
				window.parent.document.all.item("EndDate_txtMonth").value=Form1.txtED.value.substr(5,2)    
				window.parent.document.all.item("EndDate_txtYear").value=Form1.txtED.value.substr(0,4)  
			}
		}
		/////////////////////////////////////////////////////////////////////////////////
		function ManageCheck(chk)
		{
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLConfermentAccess.value);
						
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/AccessRole[id="+chk.accID+"]");
			if(chk.checked==true)			
				xmlNodes.item(0).selectSingleNode('type').text='1'				
			else
				xmlNodes.item(0).selectSingleNode('type').text='0'
			Form1.XMLConfermentAccess.value=xmlDoc.xml
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnSave()
		{
		//«Ì‰  €ÌÌ—«   Ê”ÿ „Õ„œ ⁄»œ«··ÂÌ œ—  «—ÌŒ 26 ¬–— 1385 ’Ê—  ê—› Â «” 
		//****************** Âœ› : –ŒÌ—Â „ÕœÊœÂ  «—ÌŒÌ  ›ÊÌ÷ «Œ Ì«— *******
		//***************************** ‘—Ê⁄  €ÌÌ—«  *********************
			var ParentForm = window.parent.Form1
			var strFromDate = ParentForm.StartDate_txtYear.value + "/" + ParentForm.StartDate_txtMonth.value + "/" + ParentForm.StartDate_txtDay.value
			var strToDate = ParentForm.EndDate_txtYear.value + "/" + ParentForm.EndDate_txtMonth.value + "/" + ParentForm.EndDate_txtDay.value
			if(strFromDate>strToDate)
			{
				alert(" «—ÌŒ ‘—Ê⁄ ‰„Ì  Ê«‰œ «“  «—ÌŒ Å«Ì«‰ »“—ê — »«‘œ")
				return;
			}
			Form1.StartDate.value = strFromDate
			Form1.EndDate.value = strToDate
			
		//***************************** Å«Ì«‰  €ÌÌ—«  ********************
			Form1.txtSubmit.value="save"
			Form1.submit()
		}
		
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0"
		scroll="no" onload="onLoad()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table4" style="WIDTH: 191px; HEIGHT: 524px" cellSpacing="1" cellPadding="1"
				width="191" align="right" border="0">
				<TR>
					<TD vAlign="top">
						<DIV style="OVERFLOW: auto; WIDTH: 249px; HEIGHT: 460px" align="right"><cc1:tree id="TreeAccess" runat="server" Width="213px" Height="364px"></cc1:tree></DIV>
					</TD>
				</TR>
				<tr>
					<TD style="DISPLAY: none"><INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent">
						<INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
						<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
						<INPUT id="recID" style="WIDTH: 1px" type="hidden" size="1" name="recID"> <INPUT id="PageName" style="WIDTH: 1px" type="hidden" size="1" value="AccessRole" name="PageName">
						<INPUT id="FromPersonId" type="text" name="FromPersonId" runat="server"> <INPUT id="ToPersonId" type="text" name="ToPersonId" runat="server">
						<INPUT id="txtSubmit" type="text" name="txtSubmit" runat="server"> <INPUT id="XMLConfermentAccess" type="text" name="XMLConfermentAccess" runat="server">
						<input id="cnt" type="text" name="cnt" runat="server"> 
						<!-- «Ì‰  €ÌÌ—«   Ê”ÿ „Õ„œ ⁄»œ«··ÂÌ œ—  «—ÌŒ 26 ¬–— 1385 ’Ê—  ê—› Â «”  -->
						<!-- *************************** Âœ› : –ŒÌ—Â „ÕœÊœÂ  «—ÌŒÌ  ›ÊÌ÷ «Œ Ì«— ***** -->
						<!-- ******************************** ‘—Ê⁄  €ÌÌ—«  ************************* -->
						<input type="hidden" id="MyXMLConfermentAccess" name="MyXMLConfermentAccess" runat="server">
						<input type="hidden" id="StartDate" name="StartDate" runat="server"> <input type="hidden" id="EndDate" name="EndDate" runat="server">
						<!-- ******************************** Å«Ì«‰  €ÌÌ—«  ************************ -->
					</TD>
				</tr>
			</TABLE>
			<asp:TextBox id="txtSD" runat="server"></asp:TextBox>
			<asp:TextBox id="txtED" runat="server"></asp:TextBox>
		</form>
	</body>
</HTML>
