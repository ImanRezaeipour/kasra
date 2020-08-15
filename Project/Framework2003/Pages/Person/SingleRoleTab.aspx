<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SingleRoleTab.aspx.vb" Inherits="FrameWork.SingleRoleTab" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>«‰ Œ«» Å”  ”«“„«‰Ì</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="XTab.css" type="text/css" rel="stylesheet">
		<LINK href="XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="General.js"></script>
		<script language="javascript">
		var newrowindex=0 //(last row )
		var PageSize  = 14
		var currentPage_X = 0
		var root='/PersonEntity/Role'
		var strXPathConditions = ""
		/////////////////////////////////////////////////////////////////////////////////  
		function CorrcetCharK(val)
		{
			return(ReplaceAll(val,'ò','ﬂ'))
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTableInitialize()
		{
			/*Form1.RoleId.value	=window.parent.document.all.item('RoleId').value
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLX.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
	
			var xmlNodes;
			if(Form1.RoleId.value!='')
			{
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[RoleID="+Form1.RoleId.value+"]");
				xmlNodes.item(0).selectSingleNode('Selected').text=1
				Form1.XMLX.value=xmlDoc.xml
			}*/
			Form1.CurPage_X.value=0
			FillTabTable('Next')
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTabShowAll()
		{
			strXPathConditions=''
			Form1.selRoleType.value=0
			Form1.fDepartmentTitle.value=''
			Form1.fRoleTitle.value=''
			Form1.ShowSelectedX.checked=false
			FillTabTable('First')
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTabSearch()
		{
			//------
			var strRoleType =Form1.selRoleType.value
			var strfDepartmentTitle =CorrcetCharK(Form1.fDepartmentTitle.value)
			var strfRoleTitle =CorrcetCharK(Form1.fRoleTitle.value)
			//------
			if(strfDepartmentTitle=="" & strfRoleTitle=="" & strRoleType==0)
			{
				alert("‘„« »«Ìœ »—«Ì Ã” ÃÊ Õœ«ﬁ· ÌòÌ «“ ‘—ÿÂ« —« „‘Œ’ ò‰Ìœ .")
				return;
			}
			//------
			strXPathConditions = ""

			//------
			if(strfDepartmentTitle!="")
			{
				var strfDepartmentTitleSearchType = Form1.fDepartmentTitleSearchType.value;
				strXPathConditions = strfDepartmentTitleSearchType.replace("<!--DepartmentTitle-->" ,strfDepartmentTitle);
			}
			if(strfRoleTitle!="")
			{
				var strfRoleTitleSearchType = Form1.fRoleTitleSearchType.value;
				if (strXPathConditions=='')
					strXPathConditions = strfRoleTitleSearchType.replace("<!--RoleTitle-->" ,strfRoleTitle);
				else
					strXPathConditions += ' and '+strfRoleTitleSearchType.replace("<!--RoleTitle-->" ,strfRoleTitle);
			}
			if(strRoleType!=0)
			{
				if (strXPathConditions=='')
					strXPathConditions = 'RoleType='+strRoleType
				else
					strXPathConditions += ' and RoleType='+strRoleType
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
		function chkOnClick(chk)
		{
			var SelectedRow=chk.parentElement.parentElement
			if(Form1.LastSelectedgrdRole.value != '' & Form1.LastSelectedgrdRole.value<XTabTable.rows.length)
			{ 
				XTabTable.rows(parseInt(Form1.LastSelectedgrdRole.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdRole.value = SelectedRow.rowIndex
			SelectedRow.style.backgroundColor = '#FFD599'
			
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLX.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
	
			var xmlNodes;
			if(Form1.RoleId.value!='')
			{
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[RoleID="+Form1.RoleId.value+"]");
				xmlNodes.item(0).selectSingleNode('Selected').text=0
			}
			Form1.RoleId.value=SelectedRow.RoleID
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[RoleID="+Form1.RoleId.value+"]");
			if (chk.checked)
				xmlNodes.item(0).selectSingleNode('Selected').text=1
			else
				xmlNodes.item(0).selectSingleNode('Selected').text=0
			Form1.XMLX.value=xmlDoc.xml
			if (Form1.ShowSelectedX.checked)
				ShowSelectedX_Onclick(XTabTable)
			window.parent.document.all.item('RoleId').value=Form1.RoleId.value	
			window.parent.frames('FrameAccessRole').ChangeColorcmbSubSys(Form1.RoleId.value,'R')
			window.parent.frames('FrameAccessRole').LoadDataTreeRole(Form1.RoleId.value,'R')
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

              var TextParam
              var TitleParam
              for(;x<=endFor;++x)
              {
				TextParam='"'+xmlNodes.item(x).selectSingleNode('sDepartmentTitle').text+'"#"'+xmlNodes.item(x).selectSingleNode('DepartmentTypeDscr').text+'"#"'+xmlNodes.item(x).selectSingleNode('sRoleTitle').text+'"#"'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'"#'
				TitleParam='"'+xmlNodes.item(x).selectSingleNode('fDepartmentTitle').text+'"#"'+''+'"#"'+xmlNodes.item(x).selectSingleNode('fRoleTitle').text+'"#"'+''+'"#'
				AddRow(XTabTable,"RoleID",xmlNodes.item(x).selectSingleNode('RoleID').text,x,xmlNodes.item(x).selectSingleNode('Selected').text,TextParam,TitleParam)
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
		function AddRow(oGrid,AttrName,AttrValue,cntRow,Selected,TextParam,TitleParam)
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
				{
					oGrid.rows(newrowindex).cells(1).innerHTML="<input type='radio' name='radio1' checked onclick='chkOnClick(this)'/>"
					oGrid.rows(newrowindex).style.backgroundColor = '#FFD599'
					Form1.LastSelectedgrdRole.value = newrowindex
				}
				else
					oGrid.rows(newrowindex).cells(1).innerHTML="<input type='radio' name='radio1' onclick='chkOnClick(this)'/>"
				//»Â  ⁄œ«œ ¬Ì „Â«Ì „ €Ì— Å«—«„ ” Ê‰ »« „ﬁ«œÌ—‘«‰ «ÌÃ«œ „Ìò‰œ								
				var cell
				cell=2
				var Text=new String
				var Title=new String
				var x=0
				while (x<getCntChar('#',TextParam))
				{
					 Text=getArray(TextParam,x,'#')
					 Title=getArray(TitleParam,x,'#')
					 oGrid.rows(newrowindex).insertCell()
					 oGrid.rows(newrowindex).cells(cell).innerHTML="<asp:Label title='"+Title.substring(1,Title.length-1)+"' >"+Text.substring(1,Text.length-1)+"</asp:Label>"
					 cell=cell+1	
					 x=x+1
				}
				//align
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(2).align="right"
				oGrid.rows(newrowindex).cells(4).align="right"
				//width
				oGrid.rows(newrowindex).cells(0).style.width="40px"
				oGrid.rows(newrowindex).cells(1).style.width="30px"
				oGrid.rows(newrowindex).cells(2).style.width="200px"
				oGrid.rows(newrowindex).cells(3).style.width="100px"
				oGrid.rows(newrowindex).cells(4).style.width="200px"
				oGrid.rows(newrowindex).cells(5).style.width="100px"
													
				newrowindex=newrowindex+1
			}
		////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="XTableInitialize()"
		rightMargin="0" bgColor="#e7eeff">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Layer1" height="392" cellSpacing="0" cellPadding="0" width="638" align="right"
				border="0" style="WIDTH: 638px; HEIGHT: 392px">
				<TR>
					<TD vAlign="top" align="right" style="HEIGHT: 462px">
						<TABLE id="Table1" style="WIDTH: 631px; HEIGHT: 425px" height="425" cellSpacing="1" cellPadding="1"
							width="631" border="0" align="right" background="#e7eeff">
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
															<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="605" align="right" border="0"
																style="WIDTH: 605px; HEIGHT: 46px">
																<TR>
																	<TD style="WIDTH: 42px">‰«„ Ê«Õœ</TD>
																	<TD><SELECT class="XTabSel" id="fDepartmentTitleSearchType" tabIndex="1" name="fDepartmentTitleSearchType"
																			style="WIDTH: 75px">
																			<OPTION value="starts-with(DepartmentTitle , '<!--DepartmentTitle-->')" selected>‘—Ê⁄ 
																				‘Êœ »«</OPTION>
																			<OPTION value="DepartmentTitle='<!--DepartmentTitle-->'">»—«»—</OPTION>
																			<OPTION value="DepartmentTitle!='<!--DepartmentTitle-->'">„Œ«·›</OPTION>
																			<OPTION value="contains(DepartmentTitle , '<!--DepartmentTitle-->')">œ«—«Ì</OPTION>
																			<OPTION value="not(contains(DepartmentTitle , '<!--DepartmentTitle-->'))">»œÊ‰</OPTION>
																		</SELECT></TD>
																	<TD><INPUT class="XTabTxt" id="fDepartmentTitle" style="WIDTH: 90px; HEIGHT: 25px" size="16"
																			name="fDepartmentTitle"></TD>
																	<TD style="WIDTH: 49px">‰«„&nbsp; Å” </TD>
																	<TD><SELECT class="XTabSel" id="fRoleTitleSearchType" style="WIDTH: 75px" tabIndex="1" name="fRoleTitleSearchType">
																			<OPTION value="starts-with(RoleTitle , '<!--RoleTitle-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
																			<OPTION value="RoleTitle='<!--RoleTitle-->'">»—«»—</OPTION>
																			<OPTION value="RoleTitle!='<!--RoleTitle-->'">„Œ«·›</OPTION>
																			<OPTION value="contains(RoleTitle , '<!--RoleTitle-->')">œ«—«Ì</OPTION>
																			<OPTION value="not(contains(RoleTitle , '<!--RoleTitle-->'))">»œÊ‰</OPTION>
																		</SELECT></TD>
																	<TD><INPUT class="XTabTxt" id="fRoleTitle" style="WIDTH: 90px; HEIGHT: 25px" size="16" name="fRoleTitle"></TD>
																	<TD style="WIDTH: 54px">‰Ê⁄ Å” </TD>
																	<TD dir="rtl">
																		<cc1:LCombo id="selRoleType" runat="server" LookupName="RoleType"></cc1:LCombo></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="center" colSpan="4">&nbsp;&nbsp; <INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" style="WIDTH: 102px; HEIGHT: 32px"
																onclick="XTabSearch()" type="button" name="XTabRestrictedSearchBtn"> &nbsp; <INPUT class="CssBtnShow" id="XTabShowAllBtn" onclick="XTabShowAll()" type="button" name="XTabShowAllBtn">
														</TD>
													</TR>
												</TABLE>
												<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 619px; HEIGHT: 45px"
													align="center">
													<TR>
														<TD>
															<TABLE id="Table4" style="HEIGHT: 8px" cellSpacing="1" cellPadding="1" align="right" border="0"
																width="100%">
																<TR>
																	<TD style="WIDTH: 181px" width="181"><INPUT type="checkbox" onclick="ShowSelectedX_Onclick()" id="ShowSelectedX" name="ShowSelectedX">‰„«Ì‘ 
																		«‰ Œ«» ‘œÂ</TD>
																	<TD style="WIDTH: 33px"><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
																			type="button" name="LastBtn_X"></TD>
																	<TD align="right" style="WIDTH: 29px"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
																			type="button" name="NextBtn_X"></TD>
																	<TD vAlign="middle" align="right" style="WIDTH: 55px"><INPUT id="CurPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																			onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
																	<TD dir="rtl" vAlign="middle" align="right" style="WIDTH: 15px">&nbsp;«“</TD>
																	<TD vAlign="middle" style="WIDTH: 47px"><INPUT id="ToatalPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																			size="6" name="ToatalPage_X"></TD>
																	<TD style="WIDTH: 29px"><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
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
													<TABLE id="XTabTable_Header" style="WIDTH: 617px; HEIGHT: 35px">
														<THEAD style="DISPLAY: inline">
															<TR class="ShoperHeaderStyle">
																<TD class="Headerstyle" align="center" width="30">*</TD>
																<TD class="Headerstyle" align="center" width="35">..</TD>
																<Td width="250" align="center" class="Headerstyle">‰«„ Ê«Õœ</Td>
																<TD class="Headerstyle" align="center" width="100">‰Ê⁄ Ê«Õœ</TD>
																<Td width="250" align="center" class="Headerstyle">Å”  ”«“„«‰Ì</Td>
																<Td width="100" align="center" class="Headerstyle">‰Ê⁄ Å” </Td>
															</TR>
														</THEAD>
													</TABLE>
													<DIV class="DivStyle" style="WIDTH: 102.64%; HEIGHT: 48px">
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
											<td style="DISPLAY: none">
											<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
												<input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
													runat="server" /> <INPUT id="XMLSelected" style="DISPLAY: none" size="1" name="XMLSelected" runat="server">
												<INPUT id="XMLX" style="WIDTH: 1px; DISPLAY: none" name="XMLX" runat="server"> <INPUT id="RoleId" style="WIDTH: 1px; DISPLAY: none" name="RoleId" runat="server">
												<input id="LastSelectedgrdRole" name="LastSelectedgrdRole" runat="server"> <input id="txtSessionID" name="txtSessionID" runat="server">
											</td>
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
