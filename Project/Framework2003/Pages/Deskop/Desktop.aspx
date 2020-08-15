<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Desktop.aspx.vb" Inherits="FrameWork.Desktop" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>Desktop</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/Paging.css" type="text/css" rel="stylesheet">
		<script src="../Person/General.js"></script>
		<SCRIPT language="JScript">
		////_________________________________________________________________
		//global Variable
		var newRowIndex=1
		var varMenuItemID=0
		var varChangeText=""
		var varrowIndex=0
		var varrowLabelIndex=0
		var varFullUrl=""
		var strreturn
		var varDesktopID=0
		
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		////__________________________________________________________________
		//OnLineUser:841024
			function InsertOnLineMenu(MenuItemId)
			{
				var url
				url="../OnLineUser/TempTransaction.aspx?MenuItemId="+MenuItemId
				window.parent.frames('Left').location=url
				window.parent.frames('Left').location=url
				window.parent.frames('Left').location=url
			}
		////__________________________________________________________________
		function Moveup()
		{
			var urlStr="TempDesktop.aspx?"
			urlStr=urlStr+"DesktopID="+varDesktopID+"&flag=4"
			window.parent.frames('TempDesktop').location=urlStr
			Form1.submit()
		}
		////__________________________________________________________________
		function MoveDown()
		{
			var urlStr="TempDesktop.aspx?"
			urlStr=urlStr+"DesktopID="+varDesktopID+"&flag=5"
			window.parent.frames('TempDesktop').location=urlStr
			Form1.submit()
		}
		////__________________________________________________________________
		function  XTabTableOnclick()
		{
			var k
			for(k=0;k<newRowIndex;++k)
			{
				if (XTabTable.rows(k).className=="CssSelectedItemStyle")
				{
					XTabTable.rows(k).className=""
				}
			}
			if (window.event.srcElement.tagName=="Label")
			{
				varFullUrl=window.event.srcElement.parentElement.parentElement.FullUrl
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).className="CssSelectedItemStyle"
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).cells(1).style.color='#660033'//'darkred'//'maroon'
				//alert(XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).MenuItemID)
				oRequst.open("post","Desktop.aspx?AjaxSend=Ajax &MenuItemID="+XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).MenuItemID,true)
			}
			else if ( window.event.srcElement.parentElement.tagName=="TR")
			{
				varFullUrl=window.event.srcElement.parentElement.FullUrl
				XTabTable.rows(varrowIndex).className="CssSelectedItemStyle"
				//alert()
				XTabTable.rows(varrowIndex).cells(1).style.color='#660033'
				oRequst.open("post","Desktop.aspx?AjaxSend=Ajax &MenuItemID="+XTabTable.rows(varrowIndex).MenuItemID,true)
				
			}
			else if (window.event.srcElement.tagName=="IMG")
			{
				varFullUrl=window.event.srcElement.parentElement.parentElement.FullUrl
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).className="CssSelectedItemStyle"
				XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).cells(1).style.color='#660033'
				oRequst.open("post","Desktop.aspx?AjaxSend=Ajax &MenuItemID="+XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).MenuItemID,true)
			}
			
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
						/** اين تغييرات توسط محمد عبداللهي در تاريخ 29 خرداد 86 صورت گرفته است **/
			/** هدف : نمايش نام صفحه در هدر صفحه به هنگام کليک بر روي آيتم متناظر آن در ميز کار **/
			/*********************************** شروع تغييرات ******************************/
			window.parent.document.all.item("tdPageName").innerHTML = XTabTable.rows(window.event.srcElement.parentElement.parentElement.rowIndex).PageTitle
			/*********************************** پايان تغييرات *****************************/
			
			
		}
		////_________________________________________________________________________
		function AjaxFunction()
		{		
			var varAjaxReturn
			//alert(oRequst.readyState)	
			if (oRequst.readyState==4)
			{
				//alert(oRequst.status)
				if(oRequst.status==200)
				{
					varAjaxReturn=oRequst.responseText
					if (varAjaxReturn=="1" || varAjaxReturn=="3")
					{
						//alert(varMenuItemID)
						InsertOnLineMenu(varMenuItemID)
						window.parent.frames('Left').location=varFullUrl				
			
					}
				}
			}
		}
		////_________________________________________________________________
		function RenameOnclick()
		{
			var url
			var Strwin
			strreturn=''
			url="FramesItemRename.aspx?MenuItemtitle=" +Form1.txtMenuItemtitle.value+ "&MenuItemID=" +varMenuItemID
			strreturn=window.showModalDialog(url,"","dialogHeight: 300px;dialogWidth: 350px;center: Yes;help: no;status: no,top=150,left=300")
			if (strreturn!='')
			{
				XTabTable.rows(varrowLabelIndex).cells(1).innerText=strreturn
			}
			XTabTable.rows(varrowIndex).cells(1).innerText=varChangeText
			Form1.submit()
		}
		////_________________________________________________________________
		function XTabTableOnmouseover()
		{
			varMenuItemID=window.event.srcElement.parentElement.parentElement.MenuItemID
			varDesktopID=window.event.srcElement.parentElement.parentElement.DesktopID
			Form1.txtMenuItemtitle.value=window.event.srcElement.parentElement.parentElement.PageTitle
			varrowIndex=window.event.srcElement.parentElement.rowIndex
			if (window.event.srcElement.tagName=="Label")
			{
				varrowLabelIndex=window.event.srcElement.parentElement.parentElement.rowIndex
			}
			else if ( window.event.srcElement.parentElement.tagName=="TR")
			{
				varrowLabelIndex=varrowIndex	
			}
			else if (window.event.srcElement.tagName=="IMG")
			{
				varrowLabelIndex=window.event.srcElement.parentElement.parentElement.rowIndex
			}
		}
		////___________________________________________________________________
		function DelDesktopOnclick()
		{
			var urlStr="TempDesktop.aspx?"
			urlStr=urlStr+"MenuItemId="+varMenuItemID+"&flag=2"
			window.parent.frames('TempDesktop').location=urlStr
			Form1.submit()
		}
		////_____________________________________________________________________
		var oPopup = window.createPopup();
		function contextMenu()
		{
			var lefter = event.screenX;
			var topper =event.screenY;
			if(varrowLabelIndex==1)
			{
				document.all.item('MoveupMenuSpan').disabled=true
				document.all.item('MoveDownMenuSpan').disabled=false
			}
			else if(varrowLabelIndex==newRowIndex-1)
			{
				document.all.item('MoveDownMenuSpan').disabled=true
				document.all.item('MoveupMenuSpan').disabled=false
			}
			else
			{
				document.all.item('MoveupMenuSpan').disabled=false
				document.all.item('MoveDownMenuSpan').disabled=false
			}
			oPopup.document.body.innerHTML = oContextHTML.innerHTML; 
			oPopup.show(lefter, topper,136, 146);
		}
			////_________________________________________________________________________
		function XTableInitialize()
		{
			document.all.item('SendToDescktopDiv').disabled=true
			FillDesktop()
		}
		////____________________________________________________________________________
		function FillDesktop()
		{
			
			/////////////////Define xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLDesktop.value);
					
			var xmlFillDesktop;
			xmlFillDesktop=xmlDoc.documentElement.selectNodes("/DesktopEntity/PrepareDesktopMenu");
			
			for(var x=0;x<xmlFillDesktop.length;++x)
			{
				Param='"'+xmlFillDesktop.item(x).selectSingleNode('Title').text+'"#'
				TitleParam='"'+xmlFillDesktop.item(x).selectSingleNode('FullTitle').text+'"#'
				AddRow(XTabTable,"MenuItemID",xmlFillDesktop.item(x).selectSingleNode('MenuItemID').text,"FullUrl",xmlFillDesktop.item(x).selectSingleNode('FullUrl').text,"PageTitle",xmlFillDesktop.item(x).selectSingleNode('PageTitle').text,"DesktopID",xmlFillDesktop.item(x).selectSingleNode('DesktopID').text,x,Param,xmlFillDesktop.item(x).selectSingleNode('IconUrl').text,TitleParam)
			}
		}
			////_________________________________________________________________________________________
			function AddRow(oGrid,AttrName,AttrValue,AttrName2,AttrValue2,AttrName3,AttrValu3,AttrName4,AttrValu4,cntRow,Param,IconUrl,TitleParam)
			{
					
					//يک سطر اضافه ميکند
					oGrid.insertRow()
					//شناسه سطر را ست ميکند
					oGrid.rows(newRowIndex).setAttribute(AttrName ,AttrValue)
					oGrid.rows(newRowIndex).setAttribute(AttrName2 ,AttrValue2)
					oGrid.rows(newRowIndex).setAttribute(AttrName3 ,AttrValu3)
					oGrid.rows(newRowIndex).setAttribute(AttrName4 ,AttrValu4)
					//آيکن 
					oGrid.rows(newRowIndex).insertCell()
					//alert(IconUrl)
					oGrid.rows(newRowIndex).cells(0).innerHTML="<IMG style='CURSOR: hand' src='"+IconUrl+"'>"
					//oGrid.rows(newRowIndex).cells(0).innerHTML="<IMG src='../../Images/TreeIMG/BD14792_.GIF'>"
					//به تعداد آيتمهاي متغير پارام ستون با مقاديرشان ايجاد ميکند								
					var cell
					cell=1
					var Title=new String
					var p=new String
					var x=0
					while (x<getCntChar('#',Param))
					{
						p=getArray(Param,x,'#')
						Title=getArray(TitleParam,x,'#')
						oGrid.rows(newRowIndex).insertCell()
						oGrid.rows(newRowIndex).cells(cell).innerHTML="<asp:Label style='CURSOR: hand' width='200px' dir='rtl' onclick='XTabTableOnclick()' title='"+Title.substring(1,Title.length-1)+"' >"+p.substring(1,p.length-1)+"</asp:Label>"
						
						
						cell=cell+1	
						x=x+1
					}
					//align
					oGrid.rows(newRowIndex).align="right"
					//width
					oGrid.rows(newRowIndex).cells(0).style.width="20px"
					oGrid.rows(newRowIndex).cells(1).style.width="180px"	
					
					var c
					for (c=0;c<oGrid.rows(newRowIndex).cells.length;c++)
					{
						//border
						oGrid.rows(newRowIndex).style.borderLeftWidth="0"
						oGrid.rows(newRowIndex).style.borderTopWidth="0"
						oGrid.rows(newRowIndex).style.borderBottomWidth="0"
						oGrid.rows(newRowIndex).style.borderRightWidth="0"
					}
					
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
							break
					}
					newRowIndex=newRowIndex+1
				}
		</SCRIPT>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="XTableInitialize()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<DIV id="oContextHTML" style="DISPLAY: none;BACKGROUND-IMAGE: url(../../Images/Backgrounds/Alt.bmp);WIDTH: 140px">
				<DIV id="DivTemp" style="BORDER-TOP: dimgray 0px solid; WIDTH: 140px; BORDER-BOTTOM: dimgray 1px solid; HEIGHT: 128px; BACKGROUND-COLOR: transparent">
					<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-TOP: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 27px; BACKGROUND-COLOR: #ffffff"
						onmouseout="this.style.background='#ffffff';" align="right"><SPAN id="DesSendToDescktopDiv" style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'">اضافه 
							کردن به ميز کار</SPAN><SPAN><IMG src="Images/New.gif"> </SPAN>
					</DIV>
					<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 31px; BACKGROUND-COLOR: #ffffff"
						onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.DelDesktopOnclick()">حذف 
							از ميز کار</SPAN><SPAN><IMG height="22" src="Images/Cross.gif"></SPAN>
					</DIV>
					<DIV onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 16px; BACKGROUND-COLOR: #ffffff"
						onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.RenameOnclick()">تغيير 
							نام </SPAN><SPAN><IMG height="17" src="Images/wordtemplate.gif" width="17"> </SPAN>
					</DIV>
					<DIV id="MoveupMenuSpan" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-TOP: darkgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; HEIGHT: 16px; BACKGROUND-COLOR: #ffffff"
						onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.Moveup()">حرکت 
							به بالا</SPAN> <SPAN><IMG height="17" src="Images/Up.gif" width="17"> </SPAN>
					</DIV>
					<DIV id="MoveDownMenuSpan" onmouseover="this.style.background='gold';" style="BORDER-RIGHT: dimgray 1px solid; BORDER-LEFT: dimgray 1px solid; WIDTH: 136px; BORDER-BOTTOM: dimgray 1px solid; HEIGHT: 24px; BACKGROUND-COLOR: #ffffff"
						onmouseout="this.style.background='#ffffff';" align="right"><SPAN style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: 'tahoma'" onclick="parent.MoveDown()">حرکت 
							به پائين</SPAN> <SPAN><IMG height="17" src="Images/Down.gif" width="17"> </SPAN>
					</DIV>
				</DIV>
			</DIV>
			<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
			<table id="Layer1" style="BACKGROUND-IMAGE: url(../../Images/Backgrounds/Alt.bmp);WIDTH: 959px;HEIGHT: 918px"
				height="918" cellSpacing="0" cellPadding="10" width="959" align="right" border="0">
				<tr>
					<td vAlign="top" align="right">
						<DIV class="DivStyle" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 230px; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 574px">
							<TABLE oncontextmenu="contextMenu(); return false;" style="CURSOR: hand" cellpadding="1"
								id="XTabTable" onmouseover="XTabTableOnmouseover()" onclick="XTabTableOnclick()" border="0"
								cellSpacing="1">
								<THEAD style="DISPLAY: none">
									<TR height="30">
										<TD align="center"></TD>
										<TD align="center"></TD>
									</TR>
								</THEAD>
							</TABLE>
						</DIV>
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none"><input id="XMLDesktop" type="hidden" name="XMLDesktop" runat="server">
						<input id="txtxmlRename" type="text" name="txtxmlRename" runat="server"> <input id="txtMenuItemtitle" type="text" name="txtMenuItemtitle" runat="server">
						<input id="txtMenuItemID" type="text" name="txtMenuItemID" runat="server"> <input id="txtClientIP" type="text" name="txtClientIP" runat="server">
						<input id="txtAjaxReturn" type="text" name="txtAjaxReturn" runat="server">
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
