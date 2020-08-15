<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FramePersonTab.aspx.vb" Inherits="TA.FramePersonTab" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FramePersonTab</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Toolbar.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../../../Includes/Script/General.js"></script>
		<script src="../../../Includes/Script/WaitShow.js"></script>
		<script language="javascript">
			var newrowindex=0,currentPage_X = 0,root='/UserEntity/Person',strXPathConditions = "",selectFlag=0
			function OnClickNextBtn(){
				if (parseInt(Form1.CurPage1.value)<parseInt(Form1.Totalpage1.value)){
					if (Form1.ShowSelectedX.checked==true){
						clientPaging('Next')}
					else if (Form1.ShowSelectedX.checked==false){
						Form1.txtPagingFlag.value="Next"
						Form1.submit()}}}
			function OnClickPrevBtn(){	
				if (parseInt(Form1.CurPage1.value)>1){
					if (Form1.ShowSelectedX.checked==true){
						clientPaging('Previous')}
					else if (Form1.ShowSelectedX.checked==false){
						Form1.txtPagingFlag.value="Previous"
						Form1.submit()}}}
			function OnClickFirstBtn(){
				if (parseInt(Form1.CurPage1.value)>1){
					if (Form1.ShowSelectedX.checked==true){
						clientPaging('First')}
					else if (Form1.ShowSelectedX.checked==false){
						Form1.txtPagingFlag.value="First"
						Form1.submit()}}}
			function OnClickLastBtn(){
				if (parseInt(Form1.CurPage1.value)!=parseInt(Form1.Totalpage1.value)){
					if (Form1.ShowSelectedX.checked==true){
						clientPaging('Last')}
					else if (Form1.ShowSelectedX.checked==false){
						Form1.txtPagingFlag.value="Last"
						Form1.submit()}}}
			function clientPaging(direction){
				var str="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				var PageSize=parseInt(Form1.txtPageSize.value)
				Cleargrd(XTabTable)
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc.loadXML(str)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var xmlNodes,x=0,xPath=''
				xmlNodes=xmlDoc.documentElement.selectNodes(root)
				var totalRecords= xmlNodes.length
				Form1.Totalpage1.value =Math.ceil(totalRecords / PageSize)
				if (totalRecords > 0)
				{
					currentPage_X =parseInt(Form1.CurPage1.value)
					switch (direction)
					{
						case "Const":
							currentPage_X = currentPage_X
							break
						case "Next":
							currentPage_X = parseInt(currentPage_X)+1
							break
						case "Previous":
							currentPage_X =parseInt(currentPage_X)-1
							break
						case "First":
							currentPage_X = 1
							break
						case "Last":
							currentPage_X = parseInt(Form1.Totalpage1.value)
							break
					}
					Form1.CurPage1.value = currentPage_X
					var endFor 
					if(currentPage_X*PageSize-1 < 0)
						return
					if(totalRecords <= currentPage_X*PageSize-1)
						endFor =totalRecords-1
					else
						endFor = parseInt(Form1.CurPage1.value)*PageSize-1
              		x=(currentPage_X-1)*PageSize
				document.getElementById("lblFrom").innerText=((currentPage_X - 1) * (Form1.txtPageSize.value)) + 1
				if (parseInt(Form1.Totalpage1.value)> parseInt(currentPage_X))
					document.getElementById("lblTo").innerText = parseInt(document.getElementById("lblFrom").innerText) +parseInt(Form1.txtPageSize.value) - 1
				else
					document.getElementById("lblTo").innerText = parseInt(document.getElementById("lblFrom").innerText )+ (totalRecords - (parseInt(Form1.txtPageSize.value) * (currentPage_X - 1)) )- 1            
				document.getElementById("lblTotal").innerText=totalRecords		
				var Param,j=1
				for(;x<=endFor;++x){
					if(j>PageSize)
						j=1
					Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('Family').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTitle').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'",'
					AddRow(XTabTable,"PersonID",xmlNodes.item(x).selectSingleNode('PersonID').text,j,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
					j++}}}
			function ChkAll_Onclick(){
				if(Form1.txtFlag.value=="Report")
						return
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc.loadXML(Form1.AllXMLX.value)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var xmlNodes=xmlDoc.documentElement.selectNodes(root)
				var i,j
				for(var j=0;j<xmlNodes.length;j++){
					if (Form1.ChkAll.checked==true){
						xmlNodes.item(j).selectSingleNode('Selected').text=1
						Form1.txtAllTikFlag.value="1"}
					else if (Form1.ChkAll.checked==false){
						xmlNodes.item(j).selectSingleNode('Selected').text=0
						Form1.txtAllTikFlag.value="0"}}
				if (Form1.ChkAll.checked==true){
					Form1.SelectAllChk.checked=true
					for(var i=0;i<XTabTable.rows.length;i++){	
						XTabTable.rows(i).cells(0).firstChild.checked=true}}
				else if (Form1.ChkAll.checked==false){
					Form1.SelectAllChk.checked=false
					for(var i=0;i<XTabTable.rows.length;i++){	
						XTabTable.rows(i).cells(0).firstChild.checked=false}}				
				var str=xmlDoc.xml
				var s1=str.substring(0,(str.length)-15)
				var s2=s1.substring(12,(s1.length))
				str=s2
				Form1.txtTmpXMLX.value=str}
			function CorrcetCharK(val){
				return(ReplaceAll(val,'ک','ك'))}
			function XTableInitialize(){
				if (parseInt(Form1.CurPage1.value)>parseInt(Form1.Totalpage1.value))
					Form1.CurPage1.value=parseInt((document.getElementById("lblFrom").innerText)/(Form1.txtPageSize.value))+1
				var i,j;
				FillTabTable('Next')
				if (Form1.txtAllTikFlag.value=="1"){
					Form1.ChkAll.checked=true
					Form1.SelectAllChk.checked=true
					for(var i=0;i<XTabTable.rows.length;i++){	
						XTabTable.rows(i).cells(0).firstChild.checked=true}}
				else{
					Form1.ChkAll.checked=false
					Form1.SelectAllChk.checked = false
					
					var xmlStr="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
					xmlDoc = new ActiveXObject("MsXml2.DomDocument")
					xmlDoc.loadXML(xmlStr)
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					var xmlNodes=xmlDoc.documentElement.selectNodes(root+"[Selected=1]");
					var chkCount = 0
					
					if (xmlNodes.length!=0){
					if (Form1.txtCheckFlag.value=="1"){
							for(var i=0;i<XTabTable.rows.length;i++){
							    for (var j = 0; j < xmlNodes.length; j++) {

									if(xmlNodes.item(j).selectSingleNode('PersonID').text==XTabTable.rows(i).cells(1).innerText){
										XTabTable.rows(i).cells(0).firstChild.checked=true
										chkCount=chkCount+1}}}}}
					if (chkCount==XTabTable.rows.length){
						Form1.SelectAllChk.checked=true
						chkCount=0}
					else{
						Form1.SelectAllChk.checked=false
						chkCount=0}}}
			function XTabSearch(){FillTabTable('First')}
			function ShowSelectedX_Onclick(){
				if (Form1.ShowSelectedX.checked==true){
					selectFlag=1
					Form1.tmpCurPage1.value=Form1.CurPage1.value
					Form1.tmpTotalPage.value=Form1.Totalpage1.value
					Form1.txtTmpFrom.value=document.getElementById("lblFrom").innerText
					Form1.txtTmpTo.value=document.getElementById("lblTo").innerText
					Form1.txtTmpTotal.value=document.getElementById("lblTotal").innerText
					Form1.CurPage1.value="0"
					clientPaging('Next')
					if (Form1.CurPage1.value=="1" && Form1.Totalpage1.value=="1"){
						Form1.NextBtn.disabled=true
						Form1.PrevBtn.disabled=true
						Form1.FirstBtn.disabled=true
						Form1.LastBtn.disabled=true}}
				else if (Form1.ShowSelectedX.checked==false){
					selectFlag=0
					Form1.CurPage1.value=Form1.tmpCurPage1.value
					Form1.Totalpage1.value=Form1.tmpTotalPage.value
					document.getElementById("lblFrom").innerText=Form1.txtTmpFrom.value
					document.getElementById("lblTo").innerText=Form1.txtTmpTo.value
					document.getElementById("lblTotal").innerText=Form1.txtTmpTotal.value
					Form1.NextBtn.disabled=false
					Form1.PrevBtn.disabled=false
					Form1.FirstBtn.disabled=false
					Form1.LastBtn.disabled=false
					Cleargrd(XTabTable)
					FillTabTable('First')
					xmlDoc = new ActiveXObject("MsXml2.DomDocument")
					xmlDoc.loadXML("<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>")
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					var xmlNodes=xmlDoc.documentElement.selectNodes(root+"[Selected=1]")
					if (xmlNodes.length!=0)
							for(var i=0;i<XTabTable.rows.length;i++)
								for(var j=0;j<xmlNodes.length;j++)
									if(xmlNodes.item(j).selectSingleNode('PersonID').text==XTabTable.rows(i).cells(1).innerText)
										XTabTable.rows(i).cells(0).firstChild.checked=true}}
			function SelectAllChk_Onclick(obj){
				if(Form1.txtFlag.value=="Report")
					return
				for(var j=0;j<obj.rows.length;j++){
					obj.rows(j).cells(0).firstChild.checked=Form1.SelectAllChk.checked
					chkOnClick(obj.rows(j).cells(0).firstChild)}}
			function chkOnClick(chk){
				if (Form1.txtFlag.value=="Report"){
					Form1.txtTmpXMLX.value=""
					xmlDoc = new ActiveXObject("MsXml2.DomDocument")
					xmlDoc.loadXML(Form1.XMLX.value);
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[Selected=1]")
					var len1=xmlNodes.length
					for(var i=0;i<len1;i++)
						xmlNodes.item(i).selectSingleNode('Selected').text=0
					Form1.XMLX.value=xmlDoc.xml}
				var PersonID=chk.parentElement.parentElement.PersonID
				xmlDoc = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc.loadXML(Form1.XMLX.value)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]")
				if (xmlNodes.length==0){
					var xmlStr="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
					xmlDoc = new ActiveXObject("MsXml2.DomDocument")
					xmlDoc.loadXML(xmlStr)
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]")}	
				var str="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc2.loadXML(str)
				xmlDoc2.setProperty("SelectionLanguage", "XPath")
				var xmlNodes2=xmlDoc2.documentElement.selectNodes(root+"[PersonID="+PersonID+"]")
				if (chk.checked){
					xmlNodes.item(0).selectSingleNode('Selected').text=1
					if (xmlNodes2.length==0){
						Form1.txtTmpXMLX.value+="<Person>"
						Form1.txtTmpXMLX.value+="<PersonID>"+xmlNodes.item(0).selectSingleNode('PersonID').text+"</PersonID>"
						Form1.txtTmpXMLX.value+="<Family>"+xmlNodes.item(0).selectSingleNode('Family').text+"</Family>"
						Form1.txtTmpXMLX.value+="<DepartmentTitle>"+xmlNodes.item(0).selectSingleNode('DepartmentTitle').text+"</DepartmentTitle>"
						Form1.txtTmpXMLX.value+="<sDepartmentTitle>"+xmlNodes.item(0).selectSingleNode('sDepartmentTitle').text+"</sDepartmentTitle>"
						Form1.txtTmpXMLX.value+="<fDepartmentTitle>"+xmlNodes.item(0).selectSingleNode('fDepartmentTitle').text+"</fDepartmentTitle>"
						Form1.txtTmpXMLX.value+="<DepartmentType>"+xmlNodes.item(0).selectSingleNode('DepartmentType').text+"</DepartmentType>"
						Form1.txtTmpXMLX.value+="<DepartmentTypeDscr>"+xmlNodes.item(0).selectSingleNode('DepartmentTypeDscr').text+"</DepartmentTypeDscr>"
						Form1.txtTmpXMLX.value+="<RoleTitle>"+xmlNodes.item(0).selectSingleNode('RoleTitle').text+"</RoleTitle>"
						Form1.txtTmpXMLX.value+="<sRoleTitle>"+xmlNodes.item(0).selectSingleNode('sRoleTitle').text+"</sRoleTitle>"
						Form1.txtTmpXMLX.value+="<fRoleTitle>"+xmlNodes.item(0).selectSingleNode('fRoleTitle').text+"</fRoleTitle>"
						Form1.txtTmpXMLX.value+="<RoleType>"+xmlNodes.item(0).selectSingleNode('RoleType').text+"</RoleType>"
						Form1.txtTmpXMLX.value+="<RoleTypeDscr>"+xmlNodes.item(0).selectSingleNode('RoleTypeDscr').text+"</RoleTypeDscr>"
						Form1.txtTmpXMLX.value+="<RoleID>"+xmlNodes.item(0).selectSingleNode('RoleID').text+"</RoleID>"
						Form1.txtTmpXMLX.value+="<Selected>1</Selected>"
						Form1.txtTmpXMLX.value+="<IsGroup>0</IsGroup>"
						Form1.txtTmpXMLX.value+="<UserFlag>P</UserFlag>"
						Form1.txtTmpXMLX.value+="</Person>"}
					else{
						xmlNodes2.item(0).selectSingleNode('Selected').text=1
						var str=xmlDoc2.xml
						var s1=str.substring(0,(str.length)-15)
						var s2=s1.substring(12,(s1.length))
						str=s2
						Form1.txtTmpXMLX.value=str}}
				else{
					xmlNodes2.item(0).selectSingleNode('Selected').text=0
					var str=xmlDoc2.xml
					var s1=str.substring(0,(str.length)-15)
					var s2=s1.substring(12,(s1.length))
					str=s2
					Form1.txtTmpXMLX.value=str
					if (xmlNodes.length!=0)
						xmlNodes.item(0).selectSingleNode('Selected').text=0}
				Form1.XMLX.value=xmlDoc.xml				
				if (Form1.ShowSelectedX.checked)
					ShowSelectedX_Onclick(XTabTable)}
			function Cleargrd(obj){
				j=obj.rows.length-1
				for(;j>=0;--j)
					obj.deleteRow(j)
				newrowindex=0}
			function FillTabTable(direction){
				var strFill=""
				if (selectFlag==1)
					strFill="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				else
					strFill=Form1.XMLX.value
				Cleargrd(XTabTable)
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
				xmlDoc.loadXML(strFill)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var xmlNodes=xmlDoc.documentElement.selectNodes(root)
				Form1.totalRecords.value=xmlNodes.length
				var Param,x=0
				for(;x<xmlNodes.length;++x){
					Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('Family').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTitle').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'",'
					AddRow(XTabTable,"PersonID",xmlNodes.item(x).selectSingleNode('PersonID').text,x+1,xmlNodes.item(x).selectSingleNode('Selected').text,xmlNodes.item(x).selectSingleNode('sDepartmentTitle').text,Param)}
				
				if(document.getElementById("CurPage1").value<=1)
					Form1.PrevBtn.disabled=true
				else
					Form1.PrevBtn.disabled=false
					
				if(document.getElementById("CurPage1").value==document.getElementById("Totalpage1").value)
					Form1.NextBtn.disabled=true
				else
					Form1.NextBtn.disabled=false}
			function AddRow(oGrid,AttrName,AttrValue,cntRow,Selected,sDepartmentTitle,Param){
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "XItemStyle"
				oGrid.rows(newrowindex).setAttribute(AttrName ,AttrValue)			
				oGrid.rows(newrowindex).insertCell()
				if (Form1.txtFlag.value=="Report"){
					if (Selected==1)
						oGrid.rows(newrowindex).cells(0).innerHTML="<input type=radio name='Person' checked onclick='chkOnClick(this)' >"
					else
						oGrid.rows(newrowindex).cells(0).innerHTML="<input type=radio name='Person' onclick='chkOnClick(this)' >"}
				else{
					if (Selected==1)
						oGrid.rows(newrowindex).cells(0).innerHTML="<input type='checkbox' checked onclick='chkOnClick(this)'/>"
					else
						oGrid.rows(newrowindex).cells(0).innerHTML="<input type='checkbox' onclick='chkOnClick(this)'/>"}					
				var cell=1,x=0
				var p=new String
				while (x<getCntChar(',',Param)){
						p=getArray(Param,x,',')
						oGrid.rows(newrowindex).insertCell()
						if(cell==4)
						{
							if((p.substring(1,p.length-1)).length>20)
								oGrid.rows(newrowindex).cells(cell).innerText=(p.substring(1,p.length-1)).substr(0,20)+'...'
							else
								oGrid.rows(newrowindex).cells(cell).innerText=(p.substring(1,p.length-1)).substr(0,20)
							oGrid.rows(newrowindex).cells(cell).title=p.substring(1,p.length-1)
						}
						else if(cell==3)
						{
							oGrid.rows(newrowindex).cells(cell).innerHTML="<DIV align='right' ms_positioning='FlowLayout' title='"+p.substring(1,p.length-1)+"'>"+sDepartmentTitle+"</DIV>"
						}
						else
						{
							oGrid.rows(newrowindex).cells(cell).innerText=p.substring(1,p.length-1)
						}
						cell=cell+1	
						x=x+1}
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(0).style.width="40px"
				oGrid.rows(newrowindex).cells(1).style.width="150px"
				oGrid.rows(newrowindex).cells(2).style.width="250px"
				oGrid.rows(newrowindex).cells(3).style.width="200px"
				oGrid.rows(newrowindex).cells(4).style.width="100px"									
				newrowindex=newrowindex+1}
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0"
		onload="XTableInitialize()" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Page" style="WIDTH: 686px; HEIGHT: 517px; BACKGROUND-COLOR: #e7eeff" height="517"
				cellSpacing="1" cellPadding="1" width="686" border="0">
				<TR>
					<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 511px" vAlign="top" align="right">
						<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 600px; HEIGHT: 24px">
							<TR>
								<TD>
									<TABLE id="Table6" style="WIDTH: 593px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="593"
										align="right" border="0">
										<TR>
											<TD style="WIDTH: 241px"><INPUT class="ShoperTabChk" id="ShowSelectedX" onclick="ShowSelectedX_Onclick()" type="checkbox"
													name="ShowSelectedX"> نمايش کليه پرسنل انتخاب شده</TD>
											<TD style="DISPLAY: none;WIDTH: 171px" id="chkAllTD"><INPUT class="ShoperTabChk" id="ChkAll" onclick="ChkAll_Onclick()" type="checkbox" name="ChkAll">انتخاب 
												همه</TD>
											<TD style="WIDTH: 216px"></TD>
											<TD id="CntX" style="FONT-SIZE: 12pt; COLOR: dimgray" width="120" runat="server"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD align="center">
									<TABLE id="Table5" style="WIDTH: 41px; HEIGHT: 39px" cellSpacing="1" cellPadding="1" align="center"
										border="0">
										<TR>
											<TD>
												<asp:label id="lblFrom" runat="server"></asp:label></TD>
											<TD>تا</TD>
											<TD>
												<asp:label id="lblTo" runat="server"></asp:label></TD>
											<TD>از</TD>
											<TD>
												<asp:label id="lblTotal" runat="server"></asp:label>
											</TD>
											<TD style="WIDTH: 17px"><INPUT class="CssLastPage" id="LastBtn" title="آخرين" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="OnClickLastBtn()" type="button" name="LastBtn" runat="server"></TD>
											<TD style="WIDTH: 19px" align="right"><INPUT class="CssNextPage" id="NextBtn" title="بعدي" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="OnClickNextBtn()" type="button" name="NextBtn" runat="server"></TD>
											<TD style="WIDTH: 54px" vAlign="middle" align="right"><asp:textbox id="CurPage1" onkeydown="OnKeyDownNum('integer',this.value)" tabIndex="1" runat="server"
													Height="20px" BorderStyle="Groove" CssClass="txtControls" Width="40px" AutoPostBack="True"></asp:textbox></TD>
											<TD dir="rtl" style="WIDTH: 29px" vAlign="middle" align="right">&nbsp;از</TD>
											<TD style="WIDTH: 43px" vAlign="middle"><asp:textbox id="Totalpage1" runat="server" Height="20px" BorderStyle="Groove" CssClass="txtControls"
													Width="40px" BackColor="Transparent" ReadOnly="True"></asp:textbox></TD>
											<TD style="WIDTH: 35px"><INPUT class="CssPrevPage" id="PrevBtn" title="قبلي" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="OnClickPrevBtn()" type="button" name="PrevBtn" runat="server"></TD>
											<TD style="WIDTH: 29px"><INPUT class="CssFirstPage" id="FirstBtn" title="اولين" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="OnClickFirstBtn()" type="button" name="FirstBtn" runat="server"></TD>
											<TD style="DISPLAY: none"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<DIV class="DivStyle" style="WIDTH: 601px; HEIGHT: 400px">
							<TABLE id="XTabTable_Header">
								<THEAD style="DISPLAY: inline">
									<TR class="ShoperHeaderStyle">
										<TD class="Headerstyle" align="center" width="35"><INPUT class="ShoperTabChk" id="SelectAllChk" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
												onclick="SelectAllChk_Onclick(XTabTable)" type="checkbox" name="SelectAllChk"></TD>
										<TD class="Headerstyle" align="center" width="150">&nbsp;شماره پرسنلي</TD>
										<TD class="Headerstyle" align="center" width="250">عنوان</TD>
										<TD class="Headerstyle" align="center" width="200">پست سازماني</TD>
										<TD class="Headerstyle" align="center" width="100">نوع پست</TD>
									</TR>
								</THEAD>
							</TABLE>
							<DIV class="DivStyle">
								<TABLE id="XTabTable">
									<THEAD style="DISPLAY: none">
										<TR>
											<TD align="center"></TD>
											<TD align="center"></TD>
											<TD align="center"></TD>
											<TD align="center"></TD>
											<TD align="center"></TD>
											<TD align="center"></TD>
										</TR>
									</THEAD>
								</TABLE>
							</DIV>
						</DIV>
					</TD>
				</TR>
				<TR>
					</TD></TR>
				<TR>
					<TD style="DISPLAY: none"><INPUT id="XMLSelected" style="DISPLAY: none" size="1" name="XMLSelected" runat="server">
						<INPUT id="txtCheckFlag" style="DISPLAY: none; WIDTH: 1px" name="txtCheckFlag" runat="server">
						<INPUT id="XMLX" style="DISPLAY: none; WIDTH: 1px" name="XMLX" runat="server"> <INPUT id="txtTmpXMLX" style="DISPLAY: none; WIDTH: 1px" name="txtTmpXMLX" runat="server">
						<INPUT id="txtPID" style="DISPLAY: none; WIDTH: 1px" name="txtPID" runat="server">
						<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" name="txtSubmit" runat="server">
						<INPUT id="txtPName" style="DISPLAY: none; WIDTH: 1px" name="txtPName" runat="server">
						<INPUT id="txtDeptID" style="DISPLAY: none; WIDTH: 1px" name="txtDeptID" runat="server">
						<INPUT id="txtRoleType" style="DISPLAY: none; WIDTH: 1px" name="txtRoleType" runat="server">
						<INPUT id="txtCardNo" style="DISPLAY: none; WIDTH: 1px" name="txtCardNo" runat="server">
						<INPUT id="TmpXMLX" style="DISPLAY: none; WIDTH: 1px" name="TmpXMLX" runat="server">
						<INPUT id="TmpFilter" style="DISPLAY: none; WIDTH: 1px" name="TmpFilter" runat="server">
						<INPUT id="txtAllTikFlag" style="DISPLAY: none; WIDTH: 1px" name="txtAllTikFlag" runat="server">
						<input id="AllXMLX" name="AllXMLX" runat="server"> <input id="txtPagingFlag" name="txtPagingFlag" runat="server">
						<input id="txtPageSize" name="txtPageSize" runat="server"> <input id="totalRecords" name="totalRecords" runat="server">
						<input id="tmpCurPage1" name="tmpCurPage1" runat="server"> <input id="tmpTotalPage" name="tmpTotalPage" runat="server">
						<input id="txtFlag" runat="server" name="txtFlag"> <input id="txtTmpFrom" name="txtTmpFrom" runat="server">
						<input id="txtTmpTo" runat="server" name="txtTmpTo"> <input id="txtTmpTotal" runat="server" name="txtTmpTotal">
						<input id="txtSessionID" name="txtSessionID" runat="server"> <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
							runat="server"><input id="txtMenuItemID" name="txtMenuItemID" runat="server">
					</TD>
				</TR>
			</TABLE>
			<cc1:MySecurity id="onlineUser" runat="server"></cc1:MySecurity>
		</form>
	</body>
</HTML>
