<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MainFrame.aspx.vb" Inherits="FrameWork.MainFrame" validateRequest="false"  %>
<%@ Register TagPrefix="cc2" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>MainFrame</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles/TreePopupMenuStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/MainFrameStyle.css" type="text/css" rel="stylesheet">
		<script src="../../Includes/MainFrameJS.js"></script>
		<SCRIPT type="text/javascript">
		var SESSIONURL = "";
		var IMGDIR_MISC = "images/misc"
		</SCRIPT>
		<script language="javascript">
		var newRowIndex=1
		var varMenuItemID=0
		var varChangeText=""
		var varrowIndex=0
		var varrowLabelIndex=0
		var varFullUrl=""
		var strreturn
		var varDesktopID=0		
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		var varCaptionMenuItem	
		var shortcutImage=new String()
		shortcutSrc="Images/redo.gif"
			var oPopup = window.createPopup()
			function contextMenu(){
				if(window.event.srcElement.tagName=='A' || window.event.srcElement.tagName=='IMG'){
					Form1.recID.value=window.event.srcElement.MenuItemId
					var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
					xmlDoc.loadXML(Form1.XMLMenu.value)
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					var x
					var xmlNodes=xmlDoc.documentElement.selectNodes("/MenuEntity/TreeMainMenu[ID="+Form1.recID.value+"]")					
					varCaptionMenuItem=xmlNodes.item(0).selectSingleNode('Caption').text
					if(xmlNodes.item(0).selectSingleNode('ContentPageID').text!=0){					
						var lefter = event.screenX
						var topper = event.screenY
						if(xmlNodes.item(0).selectSingleNode('DeskTopId').text!=0){
							document.all.item('DelFromDescktopDiv').disabled=false
							document.all.item('SendToDescktopDiv').disabled=true}
						else{
							document.all.item('DelFromDescktopDiv').disabled=true
							document.all.item('SendToDescktopDiv').disabled=false}
						oPopup.document.body.innerHTML = oContextHTML.innerHTML; 
						oPopup.show(lefter, topper, 109, 61)}}}
			function changeToShortCut(){
				var NodeName
				var Node=document.all.item("Node"+Form1.recID.value)
				NodeName=Node.parentElement.childNodes[1].innerHTML	
				var shortcutImage
				shortcutImage='<IMG src="http://'+Form1.hServerName.value+shortcutSrc+'">'
				Node.parentElement.childNodes[1].innerHTML=shortcutImage + NodeName}
			function DelIcon(){
			   var NodeName=new String()
				var shortcutImage
				var Node=document.all.item("Node"+Form1.recID.value)
				var indexSrc
				var indexSrc2
				var indexSrc3
				var src
				var src2
				var src3
				var srclength
				var NodeNamelength				
				NodeName=Node.parentElement.childNodes[1].innerHTML				
				NodeNamelength=NodeName.length				
				indexSrc=NodeName.indexOf("<A")
				src=NodeName.substring(0,indexSrc)
				srclength=src.length
				src2=NodeName.substring(srclength,NodeNamelength)
				Node.parentElement.childNodes[1].innerHTML=src2				
				indexSrc2=NodeName.indexOf("<IMG")
				indexSrc3=NodeName.indexOf(">&nbsp;")				
				if (Form1.b.value==1){
					src3=NodeName.substring(indexSrc2,indexSrc3+1)
					Form1.b.value=""}
				else{
					src3=NodeName.substring(0,indexSrc2);
					Node.parentElement.childNodes[1].innerHTML=src3 + "&nbsp" + varCaptionMenuItem +"</A>"}				
				Form1.t.value=NodeName}
			function ChangeXml(flag){
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc.loadXML(Form1.XMLMenu.value)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var x
				var xmlNodes=xmlDoc.documentElement.selectNodes("/MenuEntity/TreeMainMenu[ID="+Form1.recID.value+"]")				
				if(flag==1)
					xmlNodes.item(0).selectSingleNode('DeskTopId').text=Form1.recID.value					
				else
					xmlNodes.item(0).selectSingleNode('DeskTopId').text=0
				Form1.XMLMenu.value=xmlDoc.xml}
			function AddDesktopOnclick(){
				oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+Form1.recID.value+"&flag=1 &DesktopID=0"+"&SessionID="+Form1.txtSessionID.value,true)
				oRequst.onreadyStateChange=AjaxFunction
			    oRequst.send(null)
			    Form1.b.value=1
				changeToShortCut()
				ChangeXml(1)
				oPopup.hide()}
			function DelDesktopinMenuOnclick(){
				DelIcon()
				oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+Form1.recID.value+"&flag=2 &DesktopID=0"+"&SessionID="+Form1.txtSessionID.value,true)
				oRequst.onreadyStateChange=AjaxFunction
			    oRequst.send(null)
				ChangeXml(0)
				oPopup.hide()}
			function InsertOnLineMenu(MenuItemId){
									
				oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+MenuItemId+"&flag=6 &DesktopID=0 &PersonID="+Form1.txtonlineUser.value+"&SessionID="+Form1.txtSessionID.value,true)
				oRequst.onreadyStateChange=AjaxFunction
			    oRequst.send(null)}
			function nodeClick(obj){
				Form1.txtAjaxFlag.value="1"				
				InsertOnLineMenu(Form1.recID.value)}
			function ss(){return false;}
		function Moveup(){
			oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+varMenuItemID+"&flag=4 &DesktopID="+varDesktopID+"&SessionID="+Form1.txtSessionID.value,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
			Form1.txtSubmit.value="inDesktop"
			Form1.submit()}
		function MoveDown(){			
			oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+varMenuItemID+"&flag=5 &DesktopID="+varDesktopID+"&SessionID="+Form1.txtSessionID.value,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
			Form1.txtSubmit.value="inDesktop"
			Form1.submit()}
		function  XTabTableOnclick(){
			Form1.txtAjaxFlag.value="2"
			var k
			for(k=0;k<newRowIndex;++k){
				if (XTabTable.rows(k).className=="CssSelectedItemStyle")
					XTabTable.rows(k).className=""}
			if (window.event.srcElement.tagName=="Label"){
				Form1.txtRowIndex.value=window.event.srcElement.parentElement.parentElement.rowIndex				
				varFullUrl=window.event.srcElement.parentElement.parentElement.FullUrl		
				//alert(varFullUrl)
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).className="CssSelectedItemStyle"
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).cells(1).style.color='#660033'
				InsertOnLineMenu(XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).MenuItemID)}
			else if (window.event.srcElement.parentElement.tagName=="TR"){
				Form1.txtRowIndex.value=varrowIndex
				varFullUrl=window.event.srcElement.parentElement.FullUrl
				//alert(varFullUrl)
				XTabTable.rows(varrowIndex).className="CssSelectedItemStyle"
				XTabTable.rows(varrowIndex).cells(1).style.color='#660033'
				InsertOnLineMenu(XTabTable.rows(varrowIndex).MenuItemID)}
			else if (window.event.srcElement.tagName=="IMG"){
				Form1.txtRowIndex.value=window.event.srcElement.parentElement.parentElement.rowIndex
				varFullUrl=window.event.srcElement.parentElement.parentElement.FullUrl
				//alert(varFullUrl)
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).className="CssSelectedItemStyle"
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).cells(1).style.color='#660033'
				InsertOnLineMenu(XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).MenuItemID)}}
		function AjaxFunction(){		
			var varAjaxReturn
			if (oRequst.readyState==4){
				if(oRequst.status==200){
					varAjaxReturn=oRequst.responseText
					
					if (varAjaxReturn=="1" || varAjaxReturn=="3"){
					
						if (Form1.txtAjaxFlag.value=="1"){
							Form1.txtAjaxFlag.value=""
							var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
							
							xmlDoc.loadXML(Form1.XMLMenu.value)
							xmlDoc.setProperty("SelectionLanguage", "XPath")
							var x
							var xmlNodes=xmlDoc.documentElement.selectNodes("/MenuEntity/TreeMainMenu[ID="+Form1.recID.value+"]")									
							
									var LeftUrl=xmlNodes.item(0).selectSingleNode('LeftUrl').text	
									var MID=xmlNodes.item(0).selectSingleNode('ID').text					
									if(xmlNodes.item(0).selectSingleNode('_flag').text!=0) 
										window.open(LeftUrl ,"","toolbar=no,resizable=yes,fullscreen=no,status=yes" )
									else{
										var s=new String()
										s=xmlNodes.item(0).selectSingleNode('Caption').text
										if (s.substring(s.length-1,s.length)=='>' )
											window.parent.document.all.item("TdPageName").innerHTML=s.substring(0,s.length-23)//left(obj.caption,len(obj.caption)-23)
										else
											window.parent.document.all.item("TdPageName").innerHTML=s	
																
								//alert(LeftUrl+"?ToPersonID="+Form1.txttoPersonId.value+" &SessionID="+Form1.txtSessionID.value )
								//R.h
								window.parent.frames('Left').location=LeftUrl+"?ToPersonID="+Form1.txttoPersonId.value+"&SessionID="+Form1.txtSessionID.value+" "+"&MenuItemID="+MID
								document.all.item('CurrentRecID').value=Form1.recID.value}
								}
						else if (Form1.txtAjaxFlag.value=="2"){
							if (Form1.txtRowIndex.value=="")
								Form1.txtRowIndex.value="0"
							var MID=XTabTable.rows(parseInt(Form1.txtRowIndex.value)).MenuItemID 
							window.parent.document.all.item("tdPageName").innerHTML=XTabTable.rows(parseInt(Form1.txtRowIndex.value)).PageTitle
							//alert(varFullUrl+"?ToPersonID="+Form1.txttoPersonId.value+" &SessionID="+Form1.txtSessionID.value)
							//R.h
							window.parent.frames('Left').location=varFullUrl+"?ToPersonID="+Form1.txttoPersonId.value+"&SessionID="+Form1.txtSessionID.value+"&MenuItemID="+MID }}}}}
		function RenameOnclick(){
			var url
			var Strwin
			strreturn=''
			url="../MainDesktop/FramesItemRename.aspx?MenuItemtitle=" +Form1.txtMenuItemtitle.value+ "&MenuItemID=" +varMenuItemID
			strreturn=window.showModalDialog(url,"","dialogHeight: 300px;dialogWidth: 350px;center: Yes;help: no;status: no,top=150,left=300")
			if (strreturn!='')
				XTabTable.rows(varrowLabelIndex).cells(1).innerText=strreturn
			XTabTable.rows(varrowIndex).cells(1).innerText=varChangeText
			Form1.txtSubmit.value="inDesktop"
			Form1.submit()}
		function XTabTableOnmouseover(){
			varrowIndex=window.event.srcElement.parentElement.rowIndex
			if (window.event.srcElement.tagName=="Label")
				varrowLabelIndex=window.event.srcElement.parentElement.parentElement.rowIndex
			else if ( window.event.srcElement.parentElement.tagName=="TR")
				varrowLabelIndex=varrowIndex
			else if (window.event.srcElement.tagName=="IMG")
				varrowLabelIndex=window.event.srcElement.parentElement.parentElement.rowIndex}
		function DelDesktopOnclick(){
			oRequst.open("post","MainFrame.aspx?AjaxSend=Ajax &MenuItemID="+varMenuItemID+"&flag=2 &DesktopID=0"+"&SessionID="+Form1.txtSessionID.value,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
		    Form1.txtSubmit.value="inDesktop"
			Form1.submit()}
		var oPopup = window.createPopup()
		function contextMenuinDesctop(){
		if(window.event.srcElement.parentElement.tagName=="TR"){
		varMenuItemID=window.event.srcElement.parentElement.MenuItemID
		varDesktopID=window.event.srcElement.parentElement.DesktopID
		Form1.txtMenuItemtitle.value=window.event.srcElement.parentElement.PageTitle}
		if(window.event.srcElement.parentElement.tagName=="TD"){
		varDesktopID=window.event.srcElement.parentElement.parentElement.DesktopID
		varMenuItemID=window.event.srcElement.parentElement.parentElement.MenuItemID
		Form1.txtMenuItemtitle.value=window.event.srcElement.parentElement.parentElement.PageTitle}
			var lefter = event.screenX
			var topper =event.screenY
			if(varrowLabelIndex==1){
				document.all.item('MoveupMenuSpan').disabled=true
				document.all.item('MoveDownMenuSpan').disabled=false}
			else if(varrowLabelIndex==newRowIndex-1){
				document.all.item('MoveDownMenuSpan').disabled=true
				document.all.item('MoveupMenuSpan').disabled=false}
			else{
				document.all.item('MoveupMenuSpan').disabled=false
				document.all.item('MoveDownMenuSpan').disabled=false}
			oPopup.document.body.innerHTML = ocontextTable.innerHTML
			oPopup.show(lefter, topper,136, 146)}
		function XTableInitialize(){		
			document.all.item('DesSendToDescktopDiv').disabled=true
			FillDesktop()}
		function FillDesktop(){
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
			xmlDoc.async="false"
			xmlDoc.loadXML(Form1.XMLDesktop.value)					
			var xmlFillDesktop
			xmlFillDesktop=xmlDoc.documentElement.selectNodes("/DesktopEntity/PrepareDesktopMenu")			
			for(var x=0;x<xmlFillDesktop.length;++x){
				Param='"'+xmlFillDesktop.item(x).selectSingleNode('Title').text+'"#'
				TitleParam='"'+xmlFillDesktop.item(x).selectSingleNode('FullTitle').text+'"#'
				AddRow(XTabTable,"MenuItemID",xmlFillDesktop.item(x).selectSingleNode('MenuItemID').text,"FullUrl",xmlFillDesktop.item(x).selectSingleNode('FullUrl').text,"PageTitle",xmlFillDesktop.item(x).selectSingleNode('PageTitle').text,"DesktopID",xmlFillDesktop.item(x).selectSingleNode('DesktopID').text,x,Param,xmlFillDesktop.item(x).selectSingleNode('IconUrl').text,TitleParam)}}
				function AddRow(oGrid,AttrName,AttrValue,AttrName2,AttrValue2,AttrName3,AttrValu3,AttrName4,AttrValu4,cntRow,Param,IconUrl,TitleParam){
					oGrid.insertRow()
					oGrid.rows(newRowIndex).setAttribute(AttrName ,AttrValue)
					oGrid.rows(newRowIndex).setAttribute(AttrName2 ,AttrValue2)
					oGrid.rows(newRowIndex).setAttribute(AttrName3 ,AttrValu3)
					oGrid.rows(newRowIndex).setAttribute(AttrName4 ,AttrValu4)
					oGrid.rows(newRowIndex).insertCell()
					oGrid.rows(newRowIndex).cells(0).innerHTML="<IMG style='CURSOR: hand' src='"+IconUrl+"'>"								
					var cell=1
					var Title=new String
					var p=new String
					var x=0
					while (x<getCntChar('#',Param)){
						p=getArray(Param,x,'#')
						Title=getArray(TitleParam,x,'#')
						oGrid.rows(newRowIndex).insertCell();
						oGrid.rows(newRowIndex).cells(cell).innerHTML = "<asp:Label style='CURSOR: hand' width='200px' dir='rtl' onclick='XTabTableOnclick()' title='" + Title.substring(1, Title.length - 1) + "' >" + p.substring(1, p.length - 1) + "</asp:Label>"
						cell=cell+1	
						x=x+1}
					oGrid.rows(newRowIndex).align="right"
					oGrid.rows(newRowIndex).cells(0).style.width="20px"
					oGrid.rows(newRowIndex).cells(1).style.width="180px"					
					var c
					for (c=0;c<oGrid.rows(newRowIndex).cells.length;c++){
						oGrid.rows(newRowIndex).style.borderLeftWidth="0"
						oGrid.rows(newRowIndex).style.borderTopWidth="0"
						oGrid.rows(newRowIndex).style.borderBottomWidth="0"
						oGrid.rows(newRowIndex).style.borderRightWidth="0"}
					switch (newRowIndex % 12)
					{
						case 0:
							oGrid.rows(newRowIndex).bgColor='#ffffd9'
							break
						case 1:
							oGrid.rows(newRowIndex).bgColor='#f3ffcc'
							break
						case 2:
							oGrid.rows(newRowIndex).bgColor='#dfffdf'
							break
						case 3:
							oGrid.rows(newRowIndex).bgColor='#ddfff9'
							break
						case 4:
							oGrid.rows(newRowIndex).bgColor='#e1f7ff'
							break
						case 5:
							oGrid.rows(newRowIndex).bgColor='#f0f0ff'
							break
						case 6:
							oGrid.rows(newRowIndex).bgColor='#ffe8fc'
							break
						case 7:
							oGrid.rows(newRowIndex).bgColor='#ffdfe7'
							break
						case 8:
							oGrid.rows(newRowIndex).bgColor='#fff1e8'
							break
						case 9:
							oGrid.rows(newRowIndex).bgColor='#fffae6'
							break
						case 10:
							oGrid.rows(newRowIndex).bgColor='#fbffe8'
							break
						case 11:
							oGrid.rows(newRowIndex).bgColor='#e6ffe8'
							break}
					newRowIndex=newRowIndex+1}
				function onLoadPage(){
				//alert(Form1.txtonlineUser.value)
				if (Form1.txtSubmit.value=="inDesktop"){
					XTableInitialize()
					document.all.item("DesktopTD").style.display="inline"
					document.all.item("MainMenuTD").style.display="none"}
				else{
					Form1.txtSubmit.value=""
					document.all.item("DesktopTD").style.display="none"
					document.all.item("MainMenuTD").style.display="inline"}			
				if(window.parent.document.all.item("txtMainDesktop").value=="Menu"){
				window.parent.document.all.item("txtMainDesktop").value=""
				document.all.item("DesktopTD").style.display="none"
				document.all.item("MainMenuTD").style.display="inline"}
				else if(window.parent.document.all.item("txtMainDesktop").value=="Desktop"){
				window.parent.document.all.item("txtMainDesktop").value=""
				XTableInitialize()
				document.all.item("DesktopTD").style.display="inline"
				document.all.item("MainMenuTD").style.display="none"}}//
		</script>
	</HEAD>
	<BODY oncontextmenu="contextMenu(); return false;" id="body" dir="rtl" style="BACKGROUND-IMAGE: url(../../Images/Backgrounds/Alt.bmp); SCROLLBAR-HIGHLIGHT-COLOR: white; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de"
		scroll="no" onload="onLoadPage()">
		<FORM id="Form1" method="post" runat="server">
			<P>
				<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 944px; POSITION: absolute; TOP: 8px; HEIGHT: 720px"
					height="720" cellSpacing="1" cellPadding="1" width="944" border="0">
					<TR>
						<TD>
							<TABLE id="MainDesktop" height="100%" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<TR>
									<TD id="MainMenuTD" dir="rtl" style="DISPLAY: none" vAlign="top" align="left">
										<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 693px" vAlign="top">
													<DIV class="vbmenu_popup" id="Archive_Menu" style="DISPLAY: none">
														<DIV id="oContextHTML" style="DISPLAY: none">
															<DIV id="SendToDescktopDiv" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-TOP: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 109px; HEIGHT: 29px; BACKGROUND-COLOR: #ffffff"
																onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.AddDesktopOnclick()">«—”«· 
																	»Â „Ì“ò«—</SPAN><SPAN><IMG height="17" src="../MainDesktop/Images/New.gif" width="17"></SPAN>
															</DIV>
															<DIV id="DelFromDescktopDiv" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 109px; BORDER-BOTTOM: dimgray 1px solid; HEIGHT: 31px; BACKGROUND-COLOR: #ffffff"
																onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.DelDesktopinMenuOnclick()">Õ–› 
																	«“ „Ì“ ò«—</SPAN><SPAN><IMG height="22" src="../MainDesktop/Images/Cross.gif"></SPAN>
															</DIV>
														</DIV>
													</DIV>
												</TD>
												<TD>
													<DIV class="DivStyle" id="DivTree" dir="rtl" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 253px; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 644px"
													align="right">
														<cc2:tree id="Tree1" dir="rtl" runat="server" Height="24px" Width="57.3%"></cc2:tree>
													</DIV>
												</TD>
											</TR>
										</TABLE>
										<input type="text" id="txtonlineUser" runat="server" NAME="txtonlineUser">
										<DIV style="DISPLAY: none; BACKGROUND-COLOR: #ffff66"><INPUT id="parent" type="hidden" name="parent">
											<INPUT id="recID" type="hidden" size="1" name="recID"> <INPUT id="PrevrecID" type="hidden" size="1" name="PrevrecID">
											<INPUT id="BeforePrevStyle" type="hidden" size="1" name="BeforePrevStyle"> <INPUT id="PageName" type="hidden" size="1" value="MainMenu" name="PageName">
											<INPUT id="contentPageID" style="DISPLAY: none" type="text" name="contentPageID" runat="server">
											<INPUT id="txtMenuItemID" type="text" size="20" name="txtMenuItemID" runat="server">
											<INPUT id="btnAddDeskTop" type="button" value="AddDesktop" name="btnAddDeskTop" runat="server">
											<INPUT id="txtt" type="hidden" name="txtt" runat="server"> <INPUT id="XMLMenu" style="DISPLAY: none" type="text" name="XMLMenu" runat="server">
											<INPUT id="CurrentRecID" type="hidden" name="CurrentRecID"> <INPUT id="LetterNO" type="hidden" name="LetterNO">
											<input id="hServerName" style="DISPLAY: none" type="text" name="hServerName" runat="server">
											<input id="t" style="DISPLAY: none" type="text" name="t" runat="server"> <input id="b" style="DISPLAY: none" type="text" name="b" runat="server">
											<input id="FromPersonId1" type="text" name="FromPersonId1" runat="server"><input id="ToPersonId1" type="text" name="ToPersonId1" runat="server">
											<input id="Flag" type="text" name="Flag" runat="server">
										</DIV>
									</TD>
								</TR>
								<TR>
									<TD id="DesktopTD" dir="rtl" style="DISPLAY:inline" vAlign="top">
										<DIV id="ocontextTable" style="DISPLAY: none; BACKGROUND-IMAGE: url(../../Images/Backgrounds/Alt.bmp); WIDTH: 140px">
											<DIV id="DivTemp" style="BORDER-TOP: dimgray 0px solid; WIDTH: 140px; BORDER-BOTTOM: dimgray 1px solid; HEIGHT: 128px; BACKGROUND-COLOR: transparent">
												<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-TOP: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 27px; BACKGROUND-COLOR: #ffffff"
													onmouseout="this.style.background='#ffffff';" align="right"><SPAN id="DesSendToDescktopDiv" style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'">«÷«›Â 
														ò—œ‰ »Â „Ì“ ò«—</SPAN><SPAN><IMG src="Images/New.gif"> </SPAN>
												</DIV>
												<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 31px; BACKGROUND-COLOR: #ffffff"
													onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.DelDesktopOnclick()">Õ–› 
														«“ „Ì“ ò«—</SPAN><SPAN><IMG height="22" src="Images/Cross.gif"></SPAN>
												</DIV>
												<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 16px; BACKGROUND-COLOR: #ffffff"
													onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.RenameOnclick()"> €ÌÌ— 
														‰«„ </SPAN><SPAN><IMG height="17" src="Images/wordtemplate.gif" width="17"> </SPAN>
												</DIV>
												<DIV id="MoveupMenuSpan" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-TOP: darkgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 16px; BACKGROUND-COLOR: #ffffff"
													onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.Moveup()">Õ—ò  
														»Â »«·«</SPAN> <SPAN><IMG height="17" src="Images/Up.gif" width="17"> </SPAN>
												</DIV>
												<DIV id="MoveDownMenuSpan" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; BORDER-BOTTOM: dimgray 1px solid; HEIGHT: 24px; BACKGROUND-COLOR: #ffffff"
													onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.MoveDown()">Õ—ò  
														»Â Å«∆Ì‰</SPAN> <SPAN><IMG height="17" src="Images/Down.gif" width="17"> </SPAN>
												</DIV>
											</DIV>
										</DIV>
										<TABLE id="Layer1" style="BACKGROUND-IMAGE: url(../../Images/Backgrounds/Alt.bmp);HEIGHT: 12px"
											height="12" cellSpacing="0" cellPadding="10" width="100%" align="right" border="0">
											<TR>
												<TD vAlign="top" align="left">
													<DIV class="DivStyle" dir="rtl" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 232px; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 618px"
														align="right">
														<TABLE oncontextmenu="contextMenuinDesctop(); return false;" id="XTabTable" onmouseover="XTabTableOnmouseover()"
													      style="CURSOR: hand" onclick="XTabTableOnclick()" cellSpacing="1" cellPadding="1" border="0"
															dir="rtl" align="right">
															<THEAD style="DISPLAY: none">
																<TR height="30">
																	<TD align="center"></TD>
																	<TD align="center"></TD>
																</TR>
															</THEAD>
														</TABLE>
													</DIV>
												</TD>
											</TR>
											<TR>
												<TD style="DISPLAY: none">
													<INPUT id="txtTagName1" type="text" name="txtTagName1" runat="server"> <INPUT id="txtRowIndex" type="text" name="txtRowIndex" runat="server">
													<INPUT id="txtAjaxFlag" type="text" name="txtAjaxFlag" runat="server"> <INPUT id="XMLDesktop" type="hidden" name="XMLDesktop" runat="server">
													<INPUT id="txtxmlRename" type="text" name="txtxmlRename" runat="server"> <INPUT id="txtMenuItemtitle" type="text" name="txtMenuItemtitle" runat="server">
													<INPUT id="Text1" type="text" name="txtMenuItemID" runat="server"> <INPUT id="txtClientIP" type="text" name="txtClientIP" runat="server">
													<INPUT id="txtAjaxReturn" type="text" name="txtAjaxReturn" runat="server"><INPUT id="txtSubmit" type="text" name="txtSubmit" runat="server">
													<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <input type="text" id="txttoPersonId" runat="server" NAME="txttoPersonId">
													<cc2:mysecurity id="OnLineUser" runat="server"></cc2:mysecurity>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</P>
		</FORM>
	</BODY>
</HTML>
