<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SingleRoleTabOnTa.aspx.vb" Inherits="TA.SingleRoleTabOnTa" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SingleRoleTabOnTa</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../../../../Includes/Script/General.js"></script>
		<script language="javascript">
		var newrowindex=0 //(last row )
		var PageSize  = 12
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
	
			Form1.CurPage_X.value=0
			FillTabTable('Next')
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTabShowAll()
		{
			strXPathConditions=''
			Form1.fDepartmentTitle.value=''
			Form1.fRoleTitle.value=''
			Form1.ShowSelectedX.checked=false
			FillTabTable('First')
			window.parent.frames('FTree').location='FrameTreeOnTa.aspx?DepartmentId=0'+'&SessionID='+Form1.txtSessionID.value ;
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTabSearch()
		{
			//------
			var strRoleType =Form1.selRoleType.value
			var strfDepartmentTitle =CorrcetCharK(Form1.fDepartmentTitle.value)
			var strfRoleTitle =""
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
			
			if(strRoleType!=0)
			{
				if (strXPathConditions=='')
					strXPathConditions = 'DepartmentType='+strRoleType
				else
					strXPathConditions += ' and DepartmentType='+strRoleType
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
			Form1.RoleId.value=SelectedRow.DepartmentID
			/************************************************************/
			xmlNodes=xmlDoc.documentElement.selectNodes(root+" [Selected=1]");
			if (xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;i++)
					xmlNodes.item(i).selectSingleNode('Selected').text="0";
				Form1.XMLX.value=xmlDoc.xml	
			}
			/************************************************************/
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[DepartmentID="+Form1.RoleId.value+"]");
			if (xmlNodes.length!=0)
			{
				if (chk.checked)
				{
					xmlNodes.item(0).selectSingleNode('Selected').text=1
					
					window.parent.frames('FTree').location='FrameTreeOnTa.aspx?DepartmentId='+Form1.RoleId.value+'&SessionID='+Form1.txtSessionID.value ;
				}	
				else
					xmlNodes.item(0).selectSingleNode('Selected').text=0
				Form1.XMLX.value=xmlDoc.xml
			}
			
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
				TextParam='"'+xmlNodes.item(x).selectSingleNode('sDepartmentTitle').text+'"#"'+xmlNodes.item(x).selectSingleNode('DepartmentTypeDscr').text+'"#'
				TitleParam='"'+xmlNodes.item(x).selectSingleNode('fDepartmentTitle').text+'"#"'+''+''+'"#'
				AddRow(XTabTable,"DepartmentID",xmlNodes.item(x).selectSingleNode('DepartmentID').text,x,xmlNodes.item(x).selectSingleNode('Selected').text,TextParam,TitleParam)
			  }
			}
		}
		////////////////////////////////////////////////////////////////////////////////
		 function CurPage_XTextChanged()
		 {
			if (parseInt(Form1.CurPage_X.value) <= parseInt(Form1.ToatalPage_X.value) && parseInt(Form1.CurPage_X.value) > 0)
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
				oGrid.rows(newrowindex).cells(1).innerHTML="<input type='radio' name='opSelBtn' checked onclick='chkOnClick(this)'/>"
				//oGrid.rows(newrowindex).style.backgroundColor = '#FFD599'
				Form1.LastSelectedgrdRole.value = newrowindex
			}
			else
				oGrid.rows(newrowindex).cells(1).innerHTML="<input type='radio' name='opSelBtn' onclick='chkOnClick(this)'/>"
				
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
			//width
			oGrid.rows(newrowindex).cells(0).style.width="40px"
			oGrid.rows(newrowindex).cells(1).style.width="30px"
			oGrid.rows(newrowindex).cells(2).style.width="200px"
			oGrid.rows(newrowindex).cells(3).style.width="100px"
												
			newrowindex=newrowindex+1
		}
		////////////////////////////////////////////////////////////////////////////////
		function SelRowGrid()
		{
			//alert("ookk")
			var StrXml=document.all.item("XMLX").value;
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(StrXml);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes=xmlDoc.documentElement.selectNodes(root);
			
			var tempVar=""
			for(var i=0;i<xmlNodes.length;i++)
				if (xmlNodes.item(i).selectSingleNode("DepartmentID").text==window.parent.document.all.item('DepartmentId').value)
				{
					tempVar=i;
					i=xmlNodes.length;
				}
			//alert(tempVar)
			if (tempVar!="")
			{
				var k=Math.ceil(tempVar / PageSize);
				document.all.item("CurPage_X").value=(((tempVar%PageSize)==0)? k+1:k);
				Cleargrd(XTabTable)
				FillTabTable('Const')	
				
				var LastSelectedgrdRole=document.all.item("LastSelectedgrdRole").value;
				if(LastSelectedgrdRole != '' & LastSelectedgrdRole<XTabTable.rows.length)
				{ 
					XTabTable.rows(parseInt(LastSelectedgrdRole)).style.backgroundColor =''
				}
				LastSelectedgrdRole = (tempVar % PageSize)
				try {
					XTabTable.rows(LastSelectedgrdRole).style.backgroundColor = '#FFD599'
				}
				catch(e)
				{}
				document.all.item("LastSelectedgrdRole").value=LastSelectedgrdRole
			}
		}
		////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0"
		scroll="no" onload="XTableInitialize()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD style="HEIGHT: 462px" vAlign="top" align="center">
						<TABLE id="Table2" style="WIDTH: 416px; HEIGHT: 304px" cellSpacing="1" cellPadding="1"
							width="416" align="center" border="0">
							<TR>
								<TD style="HEIGHT: 454px" vAlign="top" align="center">
									<TABLE class="XTabConditionTable" id="XTabConditionTable" style="WIDTH: 423px; HEIGHT: 96px"
										align="center" border="0">
										<TR>
											<TD style="WIDTH: 1px" align="right" colSpan="4">
												<TABLE id="Table3" style="WIDTH: 421px; HEIGHT: 46px" cellSpacing="1" cellPadding="1" width="421"
													align="right" border="0">
													<TR>
														<TD style="WIDTH: 83px">‰«„ Ê«Õœ</TD>
														<TD style="WIDTH: 99px"><SELECT class="txtControls" id="fDepartmentTitleSearchType" style="WIDTH: 88px" tabIndex="1"
																name="fDepartmentTitleSearchType">
																<OPTION value="starts-with(DepartmentTitle , '<!--DepartmentTitle-->')" selected>‘—Ê⁄ 
																	‘Êœ »«</OPTION>
																<OPTION value="DepartmentTitle='<!--DepartmentTitle-->'">»—«»—</OPTION>
																<OPTION value="DepartmentTitle!='<!--DepartmentTitle-->'">„Œ«·›</OPTION>
																<OPTION value="contains(DepartmentTitle , '<!--DepartmentTitle-->')">œ«—«Ì</OPTION>
																<OPTION value="not(contains(DepartmentTitle , '<!--DepartmentTitle-->'))">»œÊ‰</OPTION>
															</SELECT></TD>
														<TD style="WIDTH: 120px"><INPUT class="txtControls" id="fDepartmentTitle" style="WIDTH: 98px; HEIGHT: 25px" size="11"
																name="fDepartmentTitle"></TD>
														<TD style="WIDTH: 79px">‰Ê⁄ Ê«Õœ</TD>
														<TD dir="rtl"><cc1:lcombo id="selRoleType" runat="server" CssClass="txtControls" LookupName="DepartmentType"></cc1:lcombo></TD>
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
									<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 382px; HEIGHT: 45px"
										align="center">
										<TR>
											<TD>
												<TABLE id="Table4" style="WIDTH: 404px; HEIGHT: 39px" cellSpacing="1" cellPadding="1" width="404"
													align="right" border="0">
													<TR>
														<TD style="WIDTH: 181px" width="181"><INPUT id="ShowSelectedX" onclick="ShowSelectedX_Onclick()" type="checkbox" name="ShowSelectedX">‰„«Ì‘ 
															«‰ Œ«» ‘œÂ</TD>
														<TD style="WIDTH: 33px"><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
																type="button" name="LastBtn_X"></TD>
														<TD style="WIDTH: 29px" align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
																type="button" name="NextBtn_X"></TD>
														<TD style="WIDTH: 55px" vAlign="middle" align="right"><INPUT id="CurPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
														<TD dir="rtl" style="WIDTH: 15px" vAlign="middle" align="right">&nbsp;«“</TD>
														<TD style="WIDTH: 47px" vAlign="middle"><INPUT id="ToatalPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
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
									<DIV class="DivStyle" style="WIDTH: 336px; HEIGHT: 104px">
										<TABLE id="XTabTable_Header" style="WIDTH: 343px; HEIGHT: 35px">
											<THEAD style="DISPLAY: inline">
												<TR class="ShoperHeaderStyle">
													<TD class="Headerstyle" align="center" width="30">*</TD>
													<TD class="Headerstyle" align="center" width="34" style="WIDTH: 34px">..</TD>
													<TD class="Headerstyle" align="center" width="250">‰«„ Ê«Õœ</TD>
													<TD class="Headerstyle" align="center" width="100">‰Ê⁄ Ê«Õœ</TD>
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
								<TD style="DISPLAY: none">
									<input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
										runat="server" /> <input id="txtSessionID" runat="server" NAME="txtSessionID">
									<INPUT id="XMLSelected" style="DISPLAY: none" size="1" name="XMLSelected" runat="server">
									<INPUT id="XMLX" style="WIDTH: 1px; DISPLAY: none" name="XMLX" runat="server"> <INPUT id="RoleId" style="WIDTH: 1px; DISPLAY: none" name="RoleId" runat="server">
									<INPUT id="LastSelectedgrdRole" name="LastSelectedgrdRole" runat="server"><cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
									<INPUT id="fRoleTitle" style="WIDTH: 1px; DISPLAY: none" name="fRoleTitle" runat="server">
									<input id="TypeAccess" runat="server">
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
