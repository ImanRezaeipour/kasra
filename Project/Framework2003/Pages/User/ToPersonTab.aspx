<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ToPersonTab.aspx.vb" Inherits="FrameWork.ToPersonTab" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>«‰ Œ«» Å—”‰·</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../Person/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../Person/General.js"></script>
		<script language="javascript">
		var newrowindex=0 //(last row )
		var PageSize  = 12
		var currentPage_X = 0
		var root='/UserEntity/Person'
		var strXPathConditions = ""
		/////////////////////////////////////////////////////////////////////////////////
		function onmousedownXTabTable()
		{
			//alert('onmousedownXTabTable')
			if (window.event.srcElement.parentElement.tagName=='TR')
			{
				var SelectedRow=window.event.srcElement.parentElement
				if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<XTabTable.rows.length)
				{ 
					XTabTable.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
				}
				Form1.LastSelectedgrdPerson.value = SelectedRow.rowIndex
				SelectedRow.style.backgroundColor = '#FFD599'
				
				/*xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.XMLX.value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
		
				var xmlNodes;
				if(Form1.ToPersonId.value!='')
				{
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+Form1.ToPersonId.value+"]");
					xmlNodes.item(0).selectSingleNode('Selected').text=0
				}*/
				Form1.ToPersonId.value=SelectedRow.PersonID
				/*xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+Form1.ToPersonId.value+"]");
				if (chk.checked)
					xmlNodes.item(0).selectSingleNode('Selected').text=1
				else
					xmlNodes.item(0).selectSingleNode('Selected').text=0
				
				Form1.XMLX.value=xmlDoc.xml*/
				/*if (Form1.ShowSelectedX.checked)
					ShowSelectedX_Onclick(XTabTable)*/
					
				window.parent.RefreshFrameAccessRole()
			}
		}
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
			Form1.XTabPersonID.value=''
			Form1.XTabLastName.value=''
			Form1.XTabDepartmentName.value=''
			Form1.ShowSelectedX.checked=false
			FillTabTable('First')
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTabSearch()
		{
			//------
			var strPersonID =Form1.XTabPersonID.value
			var strLastName =CorrcetCharK(Form1.XTabLastName.value)
			var strDepartmentName =CorrcetCharK(Form1.XTabDepartmentName.value)
			//------
			if(strLastName=="" & strPersonID=="" & strDepartmentName=="")
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
				strXPathConditions = strXTabPersonIDSearchType.replace("<!--PersonCode-->", strPersonID);
			}
			if(strLastName!="")
			{
				var strXTabLastNameSearchType = Form1.XTabLastNameSearchType.value;
				if (strXPathConditions=='')
					strXPathConditions = strXTabLastNameSearchType.replace("<!--LastName-->" ,strLastName);
				else
					strXPathConditions += ' and '+strXTabLastNameSearchType.replace("<!--LastName-->" ,strLastName);
			}
			if(strDepartmentName!="")
			{
				var strXTabDepartmentNameSearchType = Form1.XTabDepartmentNameSearchType.value;
				if (strXPathConditions=='')
					strXPathConditions = strXTabDepartmentNameSearchType.replace("<!--DepartmentName-->" ,strDepartmentName);
				else
					strXPathConditions += ' and '+strXTabDepartmentNameSearchType.replace("<!--DepartmentName-->" ,strDepartmentName);
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
		/*function SelectAllChk_Onclick(obj)
		{
			for(var j=0;j<obj.rows.length;j++)
			{
				obj.rows(j).cells(1).firstChild.checked=Form1.SelectAllChk.checked
				chkOnClick(obj.rows(j).cells(1).firstChild)
			}
		}*/
		////////////////////////////////////////////////////////////////////////////////
		function chkOnClick(chk)
		{
			/*var SelectedRow=chk.parentElement.parentElement
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<XTabTable.rows.length)
			{ 
				XTabTable.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = SelectedRow.rowIndex
			SelectedRow.style.backgroundColor = '#FFD599'
			
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLX.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
	
			var xmlNodes;
			if(Form1.ToPersonId.value!='')
			{
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+Form1.ToPersonId.value+"]");
				xmlNodes.item(0).selectSingleNode('Selected').text=0
			}
			Form1.ToPersonId.value=SelectedRow.PersonID
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+Form1.ToPersonId.value+"]");
			if (chk.checked)
				xmlNodes.item(0).selectSingleNode('Selected').text=1
			else
				xmlNodes.item(0).selectSingleNode('Selected').text=0
				
			Form1.XMLX.value=xmlDoc.xml
			if (Form1.ShowSelectedX.checked)
				ShowSelectedX_Onclick(XTabTable)
				
			window.parent.RefreshFrameAccessRole()*/
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
                  Param = '"' + xmlNodes.item(x).selectSingleNode('PersonCode').text + '"#"' + xmlNodes.item(x).selectSingleNode('FirstName').text + ' ' + xmlNodes.item(x).selectSingleNode('LastName').text + '"#"' + xmlNodes.item(x).selectSingleNode('sDepartmentTitle').text + '"#"' + xmlNodes.item(x).selectSingleNode('RoleTitle').text + '"#"' + xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text + '"#'
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
				{
					//oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' disabled checked onclick='chkOnClick(this)'/>"
					oGrid.rows(newrowindex).cells(1).innerHTML="<img border='0' src='Images/GreenTik.gif' onclick='chkOnClick(this)'/>"
					//oGrid.rows(newrowindex).style.backgroundColor = '#FFD599'
					//Form1.LastSelectedgrdPerson.value = newrowindex
				}
				else
					oGrid.rows(newrowindex).cells(1).innerHTML="<img border='0'src='Images/Blank.gif' onclick='chkOnClick(this)'/>"
					//oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' disabled onclick='chkOnClick(this)'/>"
				
				//»Â  ⁄œ«œ ¬Ì „Â«Ì „ €Ì— Å«—«„ ” Ê‰ »« „ﬁ«œÌ—‘«‰ «ÌÃ«œ „Ìò‰œ								
				var cell
				cell=2
				var p=new String
				var x=0
				while (x<getCntChar('#',Param))
				{
					 p=getArray(Param,x,'#')
					 oGrid.rows(newrowindex).insertCell()
					
					 if (p.substring(1, p.length - 1).length>20 && cell == 3)
					     oGrid.rows(newrowindex).cells(cell).innerText = (p.substring(1, p.length - 1)).substring(0, 20)
                     else
					    oGrid.rows(newrowindex).cells(cell).innerText=p.substring(1,p.length-1)
					 cell=cell+1	
					 x=x+1
				}
				//align
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(3).align="right"
				oGrid.rows(newrowindex).cells(4).align="right"
				oGrid.rows(newrowindex).cells(5).align="right"
				//width
				oGrid.rows(newrowindex).cells(0).style.width="35px"
				oGrid.rows(newrowindex).cells(1).style.width="30px"
				oGrid.rows(newrowindex).cells(2).style.width="40px"
				oGrid.rows(newrowindex).cells(3).style.width="150px"
				oGrid.rows(newrowindex).cells(4).style.width="200px"
				oGrid.rows(newrowindex).cells(5).style.width="200px"
				oGrid.rows(newrowindex).cells(6).style.width="100px"
													
				newrowindex=newrowindex+1
			}
		////////////////////////////////////////////////////////////////////////////////		
		</script>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="XTableInitialize()"
		rightMargin="0" bgColor="#e7eeff">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" style="WIDTH: 657px; HEIGHT: 458px" cellSpacing="1" cellPadding="1"
				width="657" align="right" border="0">
				<TR>
					<TD style="HEIGHT: 454px" vAlign="top" align="center">
						<TABLE class="XTabConditionTable" id="XTabConditionTable" style="WIDTH: 617px; HEIGHT: 96px"
							align="center" border="0">
							<TR>
								<TD style="WIDTH: 1px; HEIGHT: 15px" align="right" colSpan="4">
									<TABLE id="Table3" style="WIDTH: 683px; HEIGHT: 46px" cellSpacing="1" cellPadding="1" width="683"
										align="right" border="0">
										<TR>
											<TD>òœ Å—”‰·Ì</TD>
											<TD><SELECT class="XTabSel" id="XTabPersonIDSearchType" style="WIDTH: 75px" tabIndex="1" name="XTabPersonIDSearchType">
													<OPTION value="starts-with(PersonCode , '<!--PersonCode-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
													<OPTION value="PersonCode='<!--PersonCode-->'">»—«»—</OPTION>
													<OPTION value="PersonCode!='<!--PersonCode-->'">„Œ«·›</OPTION>
													<OPTION value="contains(PersonCode , '<!--PersonCode-->')">œ«—«Ì</OPTION>
													<OPTION value="not(contains(PersonCode , '<!--PersonCode-->'))">»œÊ‰</OPTION>
												</SELECT></TD>
											<TD style="WIDTH: 62px"><INPUT class="XTabTxt" id="XTabPersonID" style="WIDTH: 60px" type="text" size="10" name="XTabPersonID"></TD>
											<TD>‰«„ Œ«‰Ê«œêÌ</TD>
											<TD><SELECT class="XTabSel" id="XTabLastNameSearchType" style="WIDTH: 75px" tabIndex="1" name="XTabLastNameSearchType">
													<OPTION value="starts-with(LastName , '<!--LastName-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
													<OPTION value="LastName='<!--LastName-->'">»—«»—</OPTION>
													<OPTION value="LastName!='<!--LastName-->'">„Œ«·›</OPTION>
													<OPTION value="contains(LastName , '<!--LastName-->')">œ«—«Ì</OPTION>
													<OPTION value="not(contains(LastName , '<!--LastName-->'))">»œÊ‰</OPTION>
												</SELECT></TD>
											<TD><INPUT class="XTabTxt" id="XTabLastName" style="WIDTH: 100px" type="text" size="16" name="XTabLastName"></TD>
											<TD>‰«„ Ê«Õœ</TD>
											<TD><SELECT class="XTabSel" id="XTabDepartmentNameSearchType" style="WIDTH: 75px" tabIndex="1"
													name="XTabDepartmentNameSearchType">
													<OPTION value="starts-with(LastName , '<!--LastName-->')" selected>‘—Ê⁄ ‘Êœ »«</OPTION>
													<OPTION value="LastName='<!--LastName-->'">»—«»—</OPTION>
													<OPTION value="LastName!='<!--LastName-->'">„Œ«·›</OPTION>
													<OPTION value="contains(LastName , '<!--LastName-->')">œ«—«Ì</OPTION>
													<OPTION value="not(contains(LastName , '<!--LastName-->'))">»œÊ‰</OPTION>
												</SELECT></TD>
											<TD><INPUT class="XTabTxt" id="XTabDepartmentName" style="WIDTH: 100px" type="text" size="16"
													name="XTabDepartmentName"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD align="center" colSpan="4">
									<INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" style="WIDTH: 102px; HEIGHT: 32px;cursor:hand"
										onclick="XTabSearch()" type="button" name="XTabRestrictedSearchBtn"> &nbsp; <INPUT class="CssBtnShow" style="cursor:hand" id="XTabShowAllBtn" onclick="XTabShowAll()" type="button" name="XTabShowAllBtn">
								</TD>
							</TR>
						</TABLE>
						<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 664px; HEIGHT: 45px"
							width="664" align="center">
							<TR>
								<TD>
									<TABLE id="Table4" style="WIDTH: 692px; HEIGHT: 39px" cellSpacing="1" cellPadding="1" width="692"
										align="right" border="0">
										<TR>
											<TD style="WIDTH: 171px"><INPUT class="ShoperTabChk" id="ShowSelectedX" onclick="ShowSelectedX_Onclick()" type="checkbox"
													name="ShowSelectedX" CHECKED> ‰„«Ì‘ Å—”‰· «‰ Œ«» ‘œÂ</TD>
											<TD style="WIDTH: 34px"><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
													type="button" name="LastBtn_X"></TD>
											<TD style="WIDTH: 23px" align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
													type="button" name="NextBtn_X"></TD>
											<TD style="WIDTH: 38px" vAlign="middle" align="right"><INPUT id="CurPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
													type="text" onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
											<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
											<TD style="WIDTH: 44px" vAlign="middle"><INPUT id="ToatalPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
													type="text" size="6" name="ToatalPage_X"></TD>
											<TD style="WIDTH: 29px"><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
													type="button" name="PrevBtn_X"></TD>
											<TD style="WIDTH: 28px"><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick()"
													type="button" name="FirstBtn_X"></TD>
											<TD style="WIDTH: 218px" align="left"> ⁄œ«œÅ—”‰· œ— Õ«· ‰„«Ì‘:</TD>
											<TD id="CntX" style="FONT-SIZE: 12pt; COLOR: dimgray" width="40"></TD>
											<TD style="DISPLAY: none"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<DIV class="DivStyle" style="WIDTH: 683px; HEIGHT: 104px">
							<TABLE id="XTabTable_Header" style="WIDTH: 699px; HEIGHT: 35px" width="699">
								<THEAD style="DISPLAY: inline">
									<TR class="ShoperHeaderStyle">
										<TD class="Headerstyle" align="center" width="30">*</TD>
										<TD class="Headerstyle" align="center" width="35">&nbsp;</TD>
										<TD class="Headerstyle" style="WIDTH: 46px" align="center" width="46">&nbsp;‘„«—Â</TD>
										<TD class="Headerstyle" style="WIDTH: 147px" align="center" width="147">⁄‰Ê«‰</TD>
										<TD class="Headerstyle" align="center" width="200">‰«„ Ê«Õœ</TD>
										<TD class="Headerstyle" align="center" width="200">Å”  ”«“„«‰Ì</TD>
										<TD class="Headerstyle" align="center" width="100">‰Ê⁄ Å” </TD>
									</TR>
								</THEAD>
							</TABLE>
							<DIV class="DivStyle" style="WIDTH: 696px; HEIGHT: 48px">
								<TABLE id="XTabTable" onmousedown="onmousedownXTabTable()">
									<THEAD style="DISPLAY: none">
										<TR>
											<TD align="center"></TD>
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
					<TD style="DISPLAY: none"><INPUT id="XMLSelected" style="DISPLAY: none" type="text" size="1" name="XMLSelected" runat="server">
						<INPUT id="XMLX" style="DISPLAY: none; WIDTH: 1px" type="text" name="XMLX" runat="server">
						<INPUT id="LastSelectedgrdPerson" type="text" name="LastSelectedgrdPerson" runat="server">
						<INPUT id="ToPersonId" type="text" name="ToPersonId" runat="server"><cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
