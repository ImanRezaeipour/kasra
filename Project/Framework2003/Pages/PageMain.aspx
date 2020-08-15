<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PageMain.aspx.vb" Inherits="FrameWork.PageMain" buffer="False" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>”Ì” „ Ã«„⁄ ò‰ —·  —œœ</title>
        <%--ie10--%>
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="VBScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/FrameWork/Includes/StyleSheetSearch.css" type="text/css" rel="stylesheet">
		<LINK href="../Includes/PageMainStyle.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../Includes/Scripts/Js/PageMainGeneral.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../Includes/Scripts/Js/PageMainWindow.js" type="text/javascript"></SCRIPT>
		<SCRIPT language="jscript">
		
	
	var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
	function f1(){
		oRequst.open("post","PageMain.aspx?AjaxSend=Ajax &lastNoOfDoc="+Form1.lastNoOfDoc.value,true)
		oRequst.onreadyStateChange=AjaxFunction
		oRequst.send(null)}
	function AjaxFunction(){		
		if (oRequst.readyState==4){
			if(oRequst.status==200){
				var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc2.loadXML(oRequst.responseText);
				xmlDoc2.setProperty("SelectionLanguage", "XPath");
				var xmlNodes = xmlDoc2.documentElement.selectNodes('/NewDataSet/Doc')
				Form1.lastNoOfDoc.value = xmlNodes.length				
				var xmlNodes2 = xmlDoc2.documentElement.selectNodes('/NewDataSet/Table1')
				var NumOfLastDocs = xmlNodes2.item(0).selectSingleNode('cnt').text
				if(xmlNodes.length > NumOfLastDocs)
					alert(" ⁄œ«œ «”‰«œ ÃœÌœ œ— ò«— «»· Õ÷Ê— Ê €Ì«» : "  + (xmlNodes.length -  NumOfLastDocs))}}}
	function Startup(){window.setInterval("f1()",3000)}
	function pageLoad(){ 
	
	//alert(document.getElementById("txtSessionID").value)
	if(document.getElementById("txtShowDesktop").value==0){
	document.all.item("TBlright").style.display="none"}
	
	
		tdVersion.innerText="ÊÌ—«Ì‘ "+Form1.txtVersion.value+" Õ÷Ê— Ê €Ì«»"
		if (Form1.ShowMsgForPerson.value!="")// && Form1.CountMsg.value!=0)
		{
			alert(Form1.ShowMsgForPerson.value)
			Form1.ShowMsgForPerson.value=""
		}
		
		if(parseInt(Form1.FromPersonId.value)==parseInt(Form1.ToPersonId.value))
				if((Form1.DefaultPage.value != "null") && (Form1.DefaultPage.value != ''))
				{//alert(Form1.DefaultPage.value.split('#')[0]+"?ToPersonID="+Form1.txtonlineUser.value+"&SessionID="+Form1.txtSessionID.value)
					
					document.all.item('Left').src =  Form1.DefaultPage.value.split('#')[0]+"?ToPersonID="+Form1.txtonlineUser.value+"&SessionID="+Form1.txtSessionID.value
					}
		else
			document.all.item('Left').src = "Welcome.aspx"
		else
			document.all.item('Left').src = "Welcome.aspx"
		
		var ToUserName
		var FromUserName
		if(parseInt(Form1.FromPersonId.value)!=parseInt(Form1.ToPersonId.value)){
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
			//alert(Form1.txtGetAllPersonIDAndName.value)
			xmlDoc.loadXML(Form1.txtGetAllPersonIDAndName.value)			
			xmlDoc.setProperty("SelectionLanguage", "XPath")			
			var xmlNodes=xmlDoc.documentElement.selectNodes("/PersonEntity/GetAllPersonIDAndName"+"[PersonId="+parseInt(Form1.ToPersonId.value)+"]");	
			if (xmlNodes.length!=0)
				ToUserName=xmlNodes.item(0).selectSingleNode('title').text				
			var xmlNodesFrom=xmlDoc.documentElement.selectNodes("/PersonEntity/GetAllPersonIDAndName"+"[PersonId="+parseInt(Form1.FromPersonId.value)+"]");	
			if (xmlNodesFrom.length!=0)
				FromUserName=xmlNodesFrom.item(0).selectSingleNode('title').text
			document.all.item('TdUserName').innerHTML=ToUserName+"<font color='white'>  ›ÊÌ÷ «“ </font>"+FromUserName}
		else{
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
			xmlDoc.loadXML(Form1.txtGetAllPersonIDAndName.value)
			xmlDoc.setProperty("SelectionLanguage", "XPath")			
			var xmlNodes=xmlDoc.documentElement.selectNodes("/PersonEntity/GetAllPersonIDAndName"+"[PersonId="+parseInt(Form1.ToPersonId.value)+"]");	
			if (xmlNodes.length!=0)
				{
						FinatialActiveYear=xmlNodes.item(0).selectSingleNode('FinatialActiveYear').text
						ToUserName=xmlNodes.item(0).selectSingleNode('title').text	
					}			
			document.all.item('TdUserName').innerHTML=ToUserName
			document.all.item('TdFinance').innerHTML=FinatialActiveYear}
		var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
		xmlDoc.async="false"
		xmlDoc.loadXML(Form1.XMLDesktop.value)				
		var xmlCheckDesktop
		xmlCheckDesktop=xmlDoc.documentElement.selectNodes("/DesktopEntity/PrepareDesktopMenu")
		if(xmlCheckDesktop.length!=0 & parseInt(Form1.FromPersonId.value)==parseInt(Form1.ToPersonId.value))
			ShowTab(2)
		else
			ShowTab(1)
		//var url="/ReportGen/FillSession.aspx?OnlineUserID="+Form1.txtonlineUser.value
		//window.open(url)
		//var url="/TA/TAPeresentation/Pages/FillSession.aspx?OnlineUserID="+Form1.txtonlineUser.value
		//window.open(url)
		
	
			}
		
	function ShowTab(flag){
	
		if(flag==2 & parseInt(Form1.FromPersonId.value)!=parseInt(Form1.ToPersonId.value))
			return
		if (flag==1){
			document.all.item("txtMainDesktop").value="Menu"
			//alert("MainDesktop/MainFrame.aspx?FromPersonId=" + Form1.FromPersonId.value + " &ToPersonId=" + Form1.ToPersonId.value+" &SessionID="+Form1.txtSessionID.value )
			document.all.item("MainFrame").src="MainDesktop/MainFrame.aspx?FromPersonId=" + Form1.FromPersonId.value + "&ToPersonId=" + Form1.ToPersonId.value+"&SessionID="+Form1.txtSessionID.value 
			
			tab1.style.display="inline"
			document.all.item("btnMenu").style.color='white'
			document.all.item("btnDeskTop").style.color='black'		
			return}	
		if (flag==2){
			document.all.item("txtMainDesktop").value="Desktop"
			//document.all.item("MainFrame").src="MainDesktop/MainFrame.aspx"+"?SessionID="+Form1.txtSessionID.value 
			//alert("MainDesktop/MainFrame.aspx?FromPersonId=" + Form1.FromPersonId.value + "&ToPersonId=" + Form1.ToPersonId.value+"&SessionID="+Form1.txtSessionID.value )
			document.all.item("MainFrame").src="MainDesktop/MainFrame.aspx?FromPersonId=" + Form1.FromPersonId.value + "&ToPersonId=" + Form1.ToPersonId.value+"&SessionID="+Form1.txtSessionID.value 
			//alert(document.all.item("MainFrame").src)
			tab1.style.display="inline"
			document.all.item("btnDeskTop").style.color='white'
			document.all.item("btnMenu").style.color='black'}} 
	function HomeOnClick(){
	
		Form1.txtSubmit.value="SignOut"
		Form1.submit()
		//window.open("/FrmPresentation/Login.aspx","_self")
	}
	function HelpOnClick(){window.open("Doc_Help.pdf")}
	function onclickCloseTree(){
		document.all.item("TBlright").style.display="none"
		document.all.item("ImgRestore").style.display="inline"}
	function onclickShowTree(){
		document.all.item("TBlright").style.display="inline"
		document.all.item("ImgRestore").style.display="none"}
	function OnKeyDown(){}
		</SCRIPT>
	</HEAD>
	<body language="vbscript" id="body" dir="rtl" bottomMargin="0" onbeforeunload="signout(0)"
		bgColor="#336699" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()" rightMargin="0"
		onunload="HomeOnClick()" name="PageMain">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<TD class="VertGradient1" style="HEIGHT: 8px" vAlign="top" bgColor="#6aa8ff" height="8">
						<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="right" border="0">
							<TR style="FONT-FAMILY: tahoma,Tahoma; FONT-SIZE: 10pt">
								<TD width="2%"><IMG id="ImgRestore" style="DISPLAY: none" onclick="onclickShowTree()" src="../Images/BackTab/Restore.gif"
										border="0"></TD>
								<TD id="tdVersion" style="COLOR: yellow" align="right" width="15%" runat="server"></TD>
								<TD id="UserName" align="left" width="7%">‰«„ ò«—»—:</TD>
								<TD id="TDTest" align="right" width="30%"><SPAN id="TdUserName" style="COLOR: yellow" runat="server"></SPAN></TD>
								<TD id="TdPageName" style="WIDTH: 201px; COLOR: yellow" align="center" width="201" runat="server"></TD>
								<TD align="right" width="10%"><SPAN id="TdFinance" style="COLOR: yellow"></SPAN><IMG id="U6" onclick="OnClickBtnFinance()" alt="»—Ê“ —”«‰Ì ò«—‰«„Â „«·Ì  " src="../Images/Icons/u6.gif"></TD>
								<TD align="left" width="10%">“„«‰ Ê—Êœ :</TD>
								<TD align="right" width="15%"><SPAN dir="ltr" style="COLOR: yellow">
										<%=GetCurDate()+"   "+onlineUser.EnterTime  %>
									</SPAN>
								</TD>
								<td style="DISPLAY: none">
									<input id="txtProjectName" name="txtProjectName" runat="server"> <input id="txtSessionID" name="txtSessionID" runat="server">
									<input id="XMLDesktop" name="XMLDesktop" runat="server"> <input id="ToPersonId" name="ToPersonId" runat="server">
									<input id="FromPersonId" name="FromPersonId" runat="server"> <input id="txtMainDesktop" name="txtMainDesktop" runat="server">
									<input id="txtGetAllPersonIDAndName" name="txtGetAllPersonIDAndName" runat="server">
									<INPUT id="ShEnterDate" style="WIDTH: 1px" name="ShEnterDate" runat="server"> <input id="DefaultPage" type="hidden" name="DefaultPage" runat="server">
									<input id="txtSubmit" type="hidden" name="txtSubmit" runat="server"> <input id="XMLMenu" type="hidden" name="XMLMenu" runat="server">
									<input id="lastNoOfDoc" style="Z-INDEX: 103; POSITION: absolute; TOP: 72px; LEFT: 56px"
										type="hidden" name="lastNoOfDoc" runat="server"><input id="txtVersion" name="txtVersion" runat="server">
								</td>
								<td></td>
							</TR>
						</TABLE>
					</TD>
				</tr>
				<tr>
					<td>
						<TABLE id="MainDefultTable" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<TD id="TBlright" style="WIDTH: 276px; DISPLAY: inline" vAlign="top" height="100%">
									<TABLE id="Table2" style="WIDTH: 298px; HEIGHT: 696px" height="696" cellSpacing="1" cellPadding="1"
										width="298" border="0">
										<TR>
											<TD style="HEIGHT: 41px" vAlign="top" align="right">
												<TABLE class="BackTDUp1" id="Table7" style="HEIGHT: 35px" cellSpacing="0" cellPadding="0"
													width="100%" align="center" border="0">
													<TR>
														<TD style="WIDTH: 1px; HEIGHT: 36px"></TD>
														<TD style="WIDTH: 1px; HEIGHT: 36px">&nbsp;</TD>
														<TD onmousedown="jscript:OnKeyDown()" id="HeaderTab1" style="WIDTH: 70px; HEIGHT: 36px"><INPUT id="btnMenu" style="BORDER-BOTTOM: 0px outset; BORDER-LEFT: 0px outset; BACKGROUND-COLOR: transparent; WIDTH: 100%; FONT-FAMILY: Tahoma; HEIGHT: 100%; FONT-SIZE: 11pt; BORDER-TOP: 0px outset; FONT-WEIGHT: bold; BORDER-RIGHT: 0px outset"
																onclick="ShowTab(1)" type="button" value="„‰ÊÌ «’·Ì" name="btnMenu"></TD>
														<TD style="WIDTH: 8px; HEIGHT: 36px">&nbsp;</TD>
														<TD onmousedown="jscript:OnKeyDown()" id="HeaderTab2" style="WIDTH: 70px; HEIGHT: 36px"><INPUT id="btnDeskTop" style="BORDER-BOTTOM: 0px outset; BORDER-LEFT: 0px outset; BACKGROUND-COLOR: transparent; WIDTH: 100%; BACKGROUND-REPEAT: no-repeat; FONT-FAMILY: Tahoma; HEIGHT: 100%; FONT-SIZE: 11pt; BORDER-TOP: 0px outset; FONT-WEIGHT: bold; BORDER-RIGHT: 0px outset"
																onclick="ShowTab(2)" type="button" value="„Ì“ ò«—" name="btnDeskTop"></TD>
														<td style="WIDTH: 100px; HEIGHT: 36px"></td>
														<TD style="HEIGHT: 36px" vAlign="top"></TD>
														<TD vAlign="bottom">
															<TABLE id="Table3" height="36" cellSpacing="0" cellPadding="0">
																<TR>
																	<TD><IMG id="Img4" onclick="HomeOnClick()" src="../Images/BackTab/home1.gif" border="0">&nbsp;
																	</TD>
																</TR>
																<TR height="20%">
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
														<TD vAlign="bottom">
															<TABLE id="Table9" height="36" cellSpacing="0" cellPadding="0">
																<TR>
																	<TD style="HEIGHT: 29px"><IMG id="Img2" onclick="onclickCloseTree()" src="../Images/BackTab/close1.png" border="0">
																	</TD>
																</TR>
																<TR height="20%">
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
														<TD vAlign="bottom">
															<TABLE id="Table8" height="36" cellSpacing="0" cellPadding="0">
																<TR>
																	<TD><IMG id="Img1" onclick="HelpOnClick()" src="../Images/BackTab/help1.gif" border="0">
																	</TD>
																</TR>
																<TR height="20%">
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="tab1" style="DISPLAY: none" vAlign="top" colSpan="2">
												<div style="DISPLAY: none">
													<input id="txtonlineUser" runat="server" NAME="txtonlineUser"> <input id="txtFromPersonId" runat="server" NAME="txtFromPersonId">
													<INPUT id="txtShowDesktop" name="txtShowDesktop" runat="server"> <INPUT id="ShowMsgForPerson" name="ShowMsgForPerson" runat="server">
													<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
												</div>
												<IFRAME id="MainFrame" style="WIDTH: 95.53%; HEIGHT: 100%" name="MainFrame" frameBorder="0"
													width="100%" height="100%"></IFRAME>
											</TD>
										</TR>
									</TABLE>
								</TD>
								<td id="LeftTD" style="FILTER: progid: DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr='#70000000', EndColorStr='#00000000')"
									vAlign="top" height="100%"><IFRAME id="Left" style="BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; WIDTH: 99.99%; BORDER-TOP-STYLE: none; HEIGHT: 99.38%; COLOR: blue; FONT-SIZE: 3pt; BORDER-LEFT-STYLE: none; FONT-WEIGHT: normal"
										src="" width="100%" height="100%"></IFRAME>
								</td>
							</tr>
						</TABLE>
					</td>
				</tr>
			</TABLE>
			<!-- ** «Ì‰  €ÌÌ—«   Ê”ÿ „Õ„œ ⁄»œ«··ÂÌ œ—  «—ÌŒ 3  Ì— 86 ’Ê—  ê—› Â «”  ** -->
			<!-- ***** Âœ› : «‰ Œ«» ’›ÕÂ ÅÌ‘ ›—÷ Â—ò«—»— »Â Â‰ê«„ Ê—Êœ »Â ”Ì” „ ***** -->
			<!-- ******************************* ‘—Ê⁄  €ÌÌ—«  *********************** -->
			<!-- ******************************* Å«Ì«‰  €ÌÌ—«  ********************** --></form>
		<script language="vbscript">
		
		
		'/////////////////////////////////////////////////////////////////////////////
		sub signout(kind)
			
			IF KIND =1 THEN
				form1.action=form1.action &" &cmd=1"
				form1.submit
			ELSE
				dim xmlhttp
				set xmlhttp = createObject("Microsoft.XMLHTTP")
				xmlhttp.Open "POST",WINDOW.location.href & " &cmd=2", false
				xmlhttp.Send()
			END IF			 
		end sub 
		sub OnClickBtnFinance()
				dim retVal
				retVal=window.showModalDialog("/FrmPresentation/App_Pages/Finance/FinatialCompany.aspx?FromPersonId="+Form1.txtFromPersonId.value,"","dialogWidth:300px;dialogHeight:420px;center: Yes;help: no;status:no")	
		       document.all.item("TdFinance").innerHTML=retVal
		        
		end sub
		</script>
		<script id="Script1" runat="server">
			Function GetCurDate()
				
				return ShEnterDate.value	
			End Function
		</script>
	</body>
</HTML>
