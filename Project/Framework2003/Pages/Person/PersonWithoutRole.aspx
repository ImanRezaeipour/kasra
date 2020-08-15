<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PersonWithoutRole.aspx.vb" Inherits="FrameWork.PersonWithoutRole" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>----------------------------------------------------------------------------------------------------------------------------------------------------------------------</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="XTab.css" type="text/css" rel="stylesheet">
		<LINK href="XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="General.js"></script>
		<script language="javascript">
	var newrowindex=0 //(last row )
	var PageSize  = 10
	var currentPage_X = 0
	var root='/UserEntity/PersonWithOutRole'
	var strXPathConditions = ""
	/////////////////////////////////////////////////////////////////////////////////  
	function CorrcetCharK(val)
	{
		return(ReplaceAll(val,'ò','ﬂ'))
	}
	
	////////////////////////////////////////////////////////////////////////////////
	function XTableInitialize()
	{
		Form1.CurPage_X.value=0
		FillTabTable('Next')
	}
	////////////////////////////////////////////////////////////////////////////////
	function XTabShowAll()
	{
		strXPathConditions=''
		Form1.ShowSelectedX.checked=false
		FillTabTable('First')
	}
	////////////////////////////////////////////////////////////////////////////////
	function XTabSearch()
	{
		//------
		var strPersonID =Form1.XTabPersonID.value
		var strLastName =CorrcetCharK(Form1.XTabLastName.value)
		//------
		if(strLastName=="" & strPersonID=="")
		{
			alert("‘„« »«Ìœ »—«Ì Ã” ÃÊ Õœ«ﬁ· ÌòÌ «“ ‘—ÿÂ« —« „‘Œ’ ò‰Ìœ .")
			return;
		}
		//------
		strXPathConditions = ""

		//------
		if(strPersonID!="")
		{
			var strXTabPersonIDSearchType = Form1.XTabPersonIDSearchType.value;
			strXPathConditions = strXTabPersonIDSearchType.replace("<!--PersonID-->" ,strPersonID);
		}
		if(strLastName!="")
		{
			var strXTabLastNameSearchType = Form1.XTabLastNameSearchType.value;
			if (strXPathConditions=='')
				strXPathConditions = strXTabLastNameSearchType.replace("<!--LastName-->" ,strLastName);
			else
				strXPathConditions += ' and '+strXTabLastNameSearchType.replace("<!--LastName-->" ,strLastName);
		}
		//------
		FillTabTable('First')
	}
	////////////////////////////////////////////////////////////////////////////////
	function ShowSelectedX_Onclick()
	{
		Cleargrd(XTabTable)
		FillTabTable('First')
	}
	////////////////////////////////////////////////////////////////////////////////
	function SelectAllChk_Onclick(obj)
	{
		for(var j=0;j<obj.rows.length;j++)
		{
			obj.rows(j).cells(1).firstChild.checked=Form1.SelectAllChk.checked
			chkOnClick(obj.rows(j).cells(1).firstChild)
		}
	}
	////////////////////////////////////////////////////////////////////////////////
	function chkOnClick(chk)
	{
		var PersonID
		PersonID=chk.parentElement.parentElement.PersonID
		xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		xmlDoc.loadXML(Form1.XMLX.value);
		xmlDoc.setProperty("SelectionLanguage", "XPath");

		var xmlNodes;
		xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]");
		
		if (chk.checked)
		{
			xmlNodes.item(0).selectSingleNode('Selected').text=1
			//alert(xmlNodes.item(0).selectSingleNode('Selected').text)
		}
		else
			xmlNodes.item(0).selectSingleNode('Selected').text=0
		Form1.XMLX.value=xmlDoc.xml
		if (Form1.ShowSelectedX.checked)
			ShowSelectedX_Onclick(XTabTable)
	}
	
	////////////////////////////////////////////////////////////////////////////////
	function Cleargrd(obj)
	{
		j=obj.rows.length-1
		for(;j>=0;--j)
			obj.deleteRow(j)
		newrowindex=0
	}
	////////////////////////////////////////////////////////////////////////////////
	function FillTabTable(direction)
	{
		Cleargrd(XTabTable)
		var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		xmlDoc.loadXML(Form1.XMLX.value);
		xmlDoc.setProperty("SelectionLanguage", "XPath");
		
		var xmlNodes;
		var x;
		
		var xPath=''
		xPath=''
		if (Form1.ShowSelectedX.checked)
		{
			xPath=' Selected=1 '
		}
		if (xPath!='' || strXPathConditions!='')
		{
			if(xPath!='' && strXPathConditions!='')
				xPath=strXPathConditions+' and '+xPath
			if(xPath=='' && strXPathConditions!='')
				xPath=strXPathConditions
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"["+xPath+"]");
		}
		else
			xmlNodes=xmlDoc.documentElement.selectNodes(root);
			
		var totalRecords 
		totalRecords = xmlNodes.length
		document.all.item('CntX').innerText=totalRecords
		Form1.ToatalPage_X.value =Math.ceil(totalRecords / PageSize)
		if (totalRecords > 0)
		{
			currentPage_X =parseInt(Form1.CurPage_X.value)
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
					currentPage_X = parseInt(Form1.ToatalPage_X.value)
					break
			}
			Form1.CurPage_X.value = currentPage_X
            var endFor 
            if(currentPage_X*PageSize-1 < 0)
                return
            if(totalRecords <= currentPage_X*PageSize-1)
                endFor =totalRecords-1
            else
                endFor = parseInt(Form1.CurPage_X.value)*PageSize-1
            
            x=(currentPage_X-1)*PageSize

            var Param
            for(;x<=endFor;++x)
            {
			Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('FirstName').text+' '+xmlNodes.item(x).selectSingleNode('LastName').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTitle').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'",'
			AddRow(XTabTable,"PersonID",xmlNodes.item(x).selectSingleNode('PersonID').text,x,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////
		function CurPage_XTextChanged()
		{
		if (Form1.CurPage_X.value <= Form1.ToatalPage_X.value && Form1.CurPage_X.value > 0)
			FillTabTable('Const')
		}
    ////////////////////////////////////////////////////////////////////////////////
	function NextBtn_XClick()
	{
		if(parseInt(Form1.CurPage_X.value) < parseInt(Form1.ToatalPage_X.value))
			FillTabTable('Next')
	}
    ////////////////////////////////////////////////////////////////////////////////
	function PrevBtn_XClick()
	{
		if(parseInt(Form1.CurPage_X.value) > 1)
			FillTabTable('Previous')
	}
    ////////////////////////////////////////////////////////////////////////////////
	function FirstBtn_XClick()
	{
		FillTabTable('First')
	}
    ////////////////////////////////////////////////////////////////////////////////
	function LastBtn_XClick()
	{
		FillTabTable('Last')
	}
	////////////////////////////////////////////////////////////////////////////////
	function AddRow(oGrid,AttrName,AttrValue,cntRow,Selected,Param)
	{
			//Ìò ”ÿ— «÷«›Â „Ìò‰œ
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			//‘‰«”Â ”ÿ— —« ”  „Ìò‰œ
			oGrid.rows(newrowindex).setAttribute(AttrName ,AttrValue)
			//” Ê‰ ‘„«—Â —œÌ› —« »« „ﬁœ«—‘ «ÌÃ«œ „Ìò‰œ					
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(0).innerText=cntRow
			//” Ê‰ «‰ Œ«» —« «ÌÃ«œ „Ìò‰œ
			oGrid.rows(newrowindex).insertCell()
			if (Selected==1)
				oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' checked onclick='chkOnClick(this)'/>"
			else
				oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' onclick='chkOnClick(this)'/>"

			//»Â  ⁄œ«œ ¬Ì „Â«Ì „ €Ì— Å«—«„ ” Ê‰ »« „ﬁ«œÌ—‘«‰ «ÌÃ«œ „Ìò‰œ								
			var cell
			cell=2
			var p=new String
			var x=0
			while (x<getCntChar(',',Param))
			{
					p=getArray(Param,x,',')
					oGrid.rows(newrowindex).insertCell()
					oGrid.rows(newrowindex).cells(cell).innerText=p.substring(1,p.length-1)
					cell=cell+1	
					x=x+1
			}
			//align
			oGrid.rows(newrowindex).align="center"
			//oGrid.rows(newrowindex).cells(3).align="right"
			//width
			oGrid.rows(newrowindex).cells(0).style.width="40px"
			oGrid.rows(newrowindex).cells(1).style.width="40px"
			oGrid.rows(newrowindex).cells(2).style.width="150px"
			oGrid.rows(newrowindex).cells(3).style.width="250px"
			oGrid.rows(newrowindex).cells(4).style.width="200px"
			oGrid.rows(newrowindex).cells(5).style.width="100px"
												
			newrowindex=newrowindex+1
		}
	////////////////////////////////////////////////////////////////////////////////
	var flag
	function OnClickBtnOK()
	{
		flag=1
		
		if (Form1.chkNewRole.checked==true)
		{
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLX.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			
			var xmlNodes;
			var i;
			var str='';
			
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/PersonWithOutRole[Selected=1]");
			
			if (xmlNodes.length!=0)
			{
				str+="<Role>"
				str+="<RoleID>0</RoleID>"
				str+="<RoleName>"+Form1.RoleName.value+"</RoleName>"
				str+="<RoleTypeTitle>"+Form1.cmbRoleType(Form1.cmbRoleType.selectedIndex).text+"</RoleTypeTitle>"
				str+="<RoleType>"+Form1.cmbRoleType.value+"</RoleType>"
				str+="<RoleFlag>1</RoleFlag>"
				str+="</Role>"
			}
			//alert(str)
			//--------------
			var XMLXstr
			XMLXstr = Form1.XMLX.value
			XMLXstr = XMLXstr.replace('<UserEntity>','')
			XMLXstr = XMLXstr.replace('</UserEntity>','')
			
			XMLXstr=XMLXstr+str
			Form1.XMLX.value="<UserEntity>"+XMLXstr+"</UserEntity>"
			//--------------
			
		}
		
		window.returnValue=Form1.XMLX.value
		window.close()
	}
	////////////////////////////////////////////////////////////////////////////////
	function OnClickBtnCancel()
	{
		if (flag!=1)
			window.returnValue=''
		window.close()
	}
	////////////////////////////////////////////////////////////////////////////////
	function onkeydownESC()
	{
		var key=window.event.keyCode
		if (key==27)
			window.close()
	}
	////////////////////////////////////////////////////////////////////////////////
	
		</script>
	</HEAD>
	<body id="body" onkeydown="onkeydownESC()" bottomMargin="0" leftMargin="0" topMargin="0"
		scroll="no" onload="XTableInitialize()" onunload="OnClickBtnCancel()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="1">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssPage" id="Table1" style="WIDTH: 615px; HEIGHT: 504px" height="504" cellSpacing="1"
							cellPadding="1" width="615" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table2" style="WIDTH: 606px; HEIGHT: 378px" cellSpacing="1" cellPadding="1"
										width="606" align="right" border="0">
										<TR>
											<TD style="HEIGHT: 454px" vAlign="top" align="center">
												<TABLE class="XTabConditionTable" id="XTabConditionTable" style="WIDTH: 617px; HEIGHT: 96px"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 1px" align="right" colSpan="4">
															<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="634" align="right" border="0"
																style="WIDTH: 634px; HEIGHT: 46px">
																<TR>
																	<TD>òœ Å—”‰·Ì</TD>
																	<TD><SELECT class="XTabSel" id="XTabPersonIDSearchType" tabIndex="1" name="XTabPersonIDSearchType">
																			<OPTION value="starts-with(PersonID , '<!--PersonID-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
																			<OPTION value="PersonID='<!--PersonID-->'">»—«»—</OPTION>
																			<OPTION value="PersonID!='<!--PersonID-->'">„Œ«·›</OPTION>
																			<OPTION value="contains(PersonID , '<!--PersonID-->')">œ«—«Ì</OPTION>
																			<OPTION value="not(contains(PersonID , '<!--PersonID-->'))">»œÊ‰</OPTION>
																		</SELECT></TD>
																	<TD><INPUT class="XTabTxt" id="XTabPersonID" style="WIDTH: 132px; HEIGHT: 25px" size="16" name="XTabPersonID"></TD>
																	<TD>‰«„ Œ«‰Ê«œêÌ</TD>
																	<TD><SELECT class="XTabSel" id="XTabLastNameSearchType" tabIndex="1" name="XTabLastNameSearchType">
																			<OPTION value="starts-with(LastName , '<!--LastName-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
																			<OPTION value="LastName='<!--LastName-->'">»—«»—</OPTION>
																			<OPTION value="LastName!='<!--LastName-->'">„Œ«·›</OPTION>
																			<OPTION value="contains(LastName , '<!--LastName-->')">œ«—«Ì</OPTION>
																			<OPTION value="not(contains(LastName , '<!--LastName-->'))">»œÊ‰</OPTION>
																		</SELECT></TD>
																	<TD><INPUT class="XTabTxt" id="XTabLastName" style="WIDTH: 132px; HEIGHT: 25px" size="16" name="XTabLastName"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="center" colSpan="4">&nbsp;&nbsp; <INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" onclick="XTabSearch()" type="button"
																name="XTabRestrictedSearchBtn" style="WIDTH: 102px; HEIGHT: 32px"> &nbsp; <INPUT class="CssBtnShow" id="XTabShowAllBtn" onclick="XTabShowAll()" type="button" name="XTabShowAllBtn">
														</TD>
													</TR>
												</TABLE>
												<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 600px; HEIGHT: 24px"
													align="center">
													<TR>
														<TD>
															<TABLE id="Table6" style="WIDTH: 593px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="593"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 586px"><INPUT class="ShoperTabChk" id="ShowSelectedX" onclick="ShowSelectedX_Onclick()" type="checkbox"
																			name="ShowSelectedX"> ‰„«Ì‘ ò·ÌÂ Å—”‰· «‰ Œ«» ‘œÂ</TD>
																	<TD style="WIDTH: 216px"> ⁄œ«œÅ—”‰· œ— Õ«· ‰„«Ì‘:</TD>
																	<TD id="CntX" style="COLOR: dimgray; FONT-SIZE: 12pt" width="120"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD>
															<TABLE id="Table4" style="WIDTH: 264px; HEIGHT: 8px" cellSpacing="1" cellPadding="1" align="center"
																border="0">
																<TR>
																	<TD><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
																			type="button" name="LastBtn_X"></TD>
																	<TD align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
																			type="button" name="NextBtn_X"></TD>
																	<TD vAlign="middle" align="right"><INPUT id="CurPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																			onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
																	<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
																	<TD vAlign="middle"><INPUT id="ToatalPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																			size="6" name="ToatalPage_X"></TD>
																	<TD><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
																			type="button" name="PrevBtn_X"></TD>
																	<TD><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick()"
																			type="button" name="FirstBtn_X"></TD>
																	<TD style="DISPLAY: none"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<DIV class="DivStyle">
													<TABLE id="XTabTable_Header">
														<THEAD style="DISPLAY: inline">
															<TR class="ShoperHeaderStyle">
																<TD class="Headerstyle" align="center" width="30">*</TD>
																<TD class="Headerstyle" align="center" width="35"><INPUT class="ShoperTabChk" id="SelectAllChk" style="BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; BORDER-TOP: 0px; BORDER-RIGHT: 0px"
																		onclick="SelectAllChk_Onclick(XTabTable)" type="checkbox" name="SelectAllChk"></TD>
																<Td width="150" align="center" class="Headerstyle">&nbsp;‘„«—Â Å—”‰·Ì</Td>
																<Td width="250" align="center" class="Headerstyle">⁄‰Ê«‰</Td>
																<Td width="200" align="center" class="Headerstyle">Å”  ”«“„«‰Ì</Td>
																<Td width="100" align="center" class="Headerstyle">‰Ê⁄ Å” </Td>
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
											<TD align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 100%; HEIGHT: 2px" SIZE="1">
												<TABLE id="Table7" cellSpacing="1" cellPadding="1" width="471" border="0" style="WIDTH: 471px; HEIGHT: 1px">
													<TR>
														<TD vAlign="top" align="right">
															<TABLE id="Table8" style="WIDTH: 465px; HEIGHT: 6px" cellSpacing="1" cellPadding="1" width="465"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 139px"><INPUT class="ShoperTabChk" id="chkNewRole" type="checkbox" name="chkNewRole">«ÌÃ«œ 
																		”„ Â«Ì ÃœÌœ</TD>
																	<TD>”„ </TD>
																	<TD style="WIDTH: 64px">
																		<cc1:lcombo id="cmbRoleType" runat="server" Height="46px" Width="100px" LookupName="OrganizationalRole"
																			CssClass="TxtControls"></cc1:lcombo></TD>
																	<TD style="WIDTH: 42px">⁄‰Ê«‰</TD>
																	<TD style="WIDTH: 138px"><INPUT class="txtControls" id="RoleName" style="WIDTH: 135px; HEIGHT: 91.71%" size="17"
																			name="RoleName" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="top" align="center">
															<TABLE id="Table5" cellSpacing="1" cellPadding="1" border="0">
																<TR>
																	<TD><INPUT class="CssBtnOK" id="btnOk" onclick="OnClickBtnOK()" type="button" name="btnOk"></TD>
																	<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
																	<TD style="DISPLAY: none"><INPUT id="XMLSelected" style="DISPLAY: none" size="1" name="XMLSelected" runat="server">
																		<INPUT id="XMLX" style="WIDTH: 1px; DISPLAY: none" name="XMLX" runat="server">
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<tr>
														<td style="DISPLAY: none">
															<input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
																runat="server" /> <input id="txtSessionID" runat="server" NAME="txtSessionID">
															<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
														</td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
