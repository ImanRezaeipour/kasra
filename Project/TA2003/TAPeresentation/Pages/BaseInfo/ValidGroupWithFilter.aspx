<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ValidGroupWithFilter.aspx.vb" Inherits="TA.ValidGroupWithFilter" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>---------------------------------------------���� �� 
			--------------------------------------------</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../Person/General.js"></script>
		<script language="javascript">
		
		var newrowindex=0 //(last row )
		var PageSize  = 10
		var currentPage_X = 0
		var root='/BaseInfoEntity/GetGroup'
		var strXPathConditions = ""
		/////////////////////////////////////////////////////////////////////////////////  
		function CorrcetCharK(val)
		{
			return(ReplaceAll(val,'�','�'))
		}
		////////////////////////////////////////////////////////////////////////////////
		function XTableInitialize()
		{
			
			//alert(Form1.XMLX.value)
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
			var strGroupID =Form1.XTabGroupID.value
			var strLastName =CorrcetCharK(Form1.XTabLastName.value)
			//------
			if(strLastName=="" & strGroupID=="")
			{
				alert("��� ���� ���� ����� ����� �� �� ����� �� ���� ���� .")
				return;
			}
			//------
			strXPathConditions = ""

			//------
			if(strGroupID!="")
			{
				var strXTabGroupIDSearchType = Form1.XTabGroupIDSearchType.value;
				strXPathConditions = strXTabGroupIDSearchType.replace("<!--GroupID-->" ,strGroupID);
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
		//////////////////////////////////////////////////////////////////////////////
		function ChkAll_Onclick()
			{
		
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.XMLX.value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				var xmlNodes;
		
				xmlNodes=xmlDoc.documentElement.selectNodes(root);
				var i;
				var j;
				for(var j=0;j<xmlNodes.length;j++)
				{
					if (Form1.ChkAll.checked==true)
					{
			
						xmlNodes.item(j).selectSingleNode('Selected').text=1
						Form1.XMLX.value=xmlDoc.xml
					}
					else if (Form1.ChkAll.checked==false)
					{
				      xmlNodes.item(j).selectSingleNode('Selected').text=0
					  	Form1.XMLX.value=xmlDoc.xml
					}
							
				}
				////////////Tik Grid
		
				if (Form1.ChkAll.checked==true)
				{
		
					Form1.SelectAllChk.checked=true
			
					for(var i=0;i<XTabTable.rows.length;i++)
					{	
						XTabTable.rows(i).cells(1).firstChild.checked=true
					}
				}
				else if (Form1.ChkAll.checked==false)
				{
					Form1.SelectAllChk.checked=false
					for(var i=0;i<XTabTable.rows.length;i++)
					{	
						XTabTable.rows(i).cells(1).firstChild.checked=false
					}
				}
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
			var GroupID
			GroupID=chk.parentElement.parentElement.GroupID
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLX.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
	
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes(root+"[GroupID="+GroupID+"]");
			
			if (chk.checked)
				xmlNodes.item(0).selectSingleNode('Selected').text=1
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
			/*if (xPath!='' || strXPathConditions!='')
			{
				if(xPath!='' && strXPathConditions!='')
					xPath=strXPathConditions+' and '+xPath
				if(xPath=='' && strXPathConditions!='')
					xPath=strXPathConditions
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"["+xPath+"]");
			}
			else*/
			if(Form1.cmbCategory.value!=0)
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[CategoryID="+Form1.cmbCategory.value+"]");
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
				Param='"'+xmlNodes.item(x).selectSingleNode('Groupname').text+'",'
				AddRow(XTabTable,"GroupID",xmlNodes.item(x).selectSingleNode('GroupID').text,x+1,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
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
				//� ��� ����� ����
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "XItemStyle";
				//����� ��� �� �� ����
				oGrid.rows(newrowindex).setAttribute(AttrName ,AttrValue)
				//���� ����� ���� �� �� ������ ����� ����					
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(0).innerText=cntRow
				//���� ������ �� ����� ����
				oGrid.rows(newrowindex).insertCell()
				if (Selected==1)
					oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' checked onclick='chkOnClick(this)'/>"
				else
					oGrid.rows(newrowindex).cells(1).innerHTML="<input type='checkbox' onclick='chkOnClick(this)'/>"

				//�� ����� ������� ����� ����� ���� �� ��������� ����� ����								
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
													
				newrowindex=newrowindex+1
			}
		////////////////////////////////////////////////////////////////////////////////
		var flag
		function OnClickBtnOK()
		{
			flag=1
			
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
		function cmbCategoryOnChange(obj)
		{
			FillTabTable('First')
		}
		</script>
	</HEAD>
	<body id="body" dir="rtl" onkeydown="onkeydownESC()" bottomMargin="0" leftMargin="0" topMargin="0"
		scroll="no" onload="XTableInitialize()" onunload="OnClickBtnCancel()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="1">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssPage" id="Table1" style="WIDTH: 467px; HEIGHT: 472px" height="472" cellSpacing="1"
							cellPadding="1" width="467" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table2" style="WIDTH: 457px; HEIGHT: 464px" cellSpacing="1" cellPadding="1"
										width="457" align="right" border="0">
										<TR>
											<TD style="HEIGHT: 386px" vAlign="top" align="center">
												<TABLE class="ShoperTabResultHeader" id="ShoperTabResultHeader" style="WIDTH: 453px; HEIGHT: 119px"
													align="center">
													<TR>
														<TD>
															<TABLE id="Table6" style="WIDTH: 447px; HEIGHT: 49px" cellSpacing="1" cellPadding="1" width="447"
																align="right" border="0">
																<TR>
																	<TD style="WIDTH: 446px"><INPUT class="ShoperTabChk" id="ShowSelectedX" onclick="ShowSelectedX_Onclick()" type="checkbox"
																			name="ShowSelectedX"> ����� ���� ������� ������ ���</TD>
																	<TD style="WIDTH: 216px">�����&nbsp;�������&nbsp;�� ��� �����:</TD>
																	<TD id="CntX" style="FONT-SIZE: 12pt; COLOR: dimgray" width="120"></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 446px">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																		&nbsp;
																		<cc1:LCombo id="cmbCategory" onchange="cmbCategoryOnChange(this)" runat="server" CssClass="txtControls"
																			Width="120px" LookupName="Category" ConnectionName="GenCnn"></cc1:LCombo></TD>
																	<TD style="WIDTH: 216px"></TD>
																	<TD style="FONT-SIZE: 12pt; COLOR: dimgray" width="120"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="center">
															<TABLE id="Table4" style="WIDTH: 394px; HEIGHT: 49px" cellSpacing="1" cellPadding="1" align="center"
																border="0">
																<TR>
																	<td style="WIDTH: 274px"><INPUT class="ShoperTabChk" id="ChkAll" onclick="ChkAll_Onclick()" type="checkbox" name="ChkAll">������ 
																		���</td>
																	<TD><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
																			type="button" name="LastBtn_X"></TD>
																	<TD align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
																			type="button" name="NextBtn_X"></TD>
																	<TD vAlign="middle" align="right" style="WIDTH: 91px"><INPUT id="CurPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
																			type="text" onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
																	<TD dir="rtl" vAlign="middle" align="right">&nbsp;��</TD>
																	<TD vAlign="middle" style="WIDTH: 87px"><INPUT id="ToatalPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
																			type="text" size="6" name="ToatalPage_X"></TD>
																	<TD style="WIDTH: 20px"><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
																			type="button" name="PrevBtn_X"></TD>
																	<TD><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 34px; HEIGHT: 35px" onclick="FirstBtn_XClick()"
																			type="button" name="FirstBtn_X"></TD>
																	<TD style="DISPLAY: none"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<DIV class="DivStyle" style="WIDTH: 254px; HEIGHT: 100px">
													<TABLE id="XTabTable_Header">
														<THEAD style="DISPLAY: inline">
															<TR class="ShoperHeaderStyle">
																<TD class="Headerstyle" align="center" width="30">*</TD>
																<TD class="Headerstyle" align="center" width="35"><INPUT class="ShoperTabChk" id="SelectAllChk" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																		onclick="SelectAllChk_Onclick(XTabTable)" type="checkbox" name="SelectAllChk"></TD>
																<Td width="150" align="center" class="Headerstyle">��� ����</Td>
															</TR>
														</THEAD>
													</TABLE>
													<DIV class="DivStyle" style="WIDTH: 250px; HEIGHT: 48px">
														<TABLE id="XTabTable">
															<THEAD style="DISPLAY: none">
																<TR>
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
												<HR class="CssHorizontalLine" style="WIDTH: 67.39%; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table5" cellSpacing="1" cellPadding="1" border="0">
													<TR>
														<TD><INPUT class="CssBtnOK" id="btnOk" onclick="OnClickBtnOK()" type="button" name="btnOk"></TD>
														<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
														<td style="DISPLAY: none"><INPUT id="XMLSelected" style="DISPLAY: none" type="text" size="1" name="XMLSelected" runat="server">
															<INPUT id="XMLX" style="DISPLAY: none; WIDTH: 1px" type="text" name="XMLX" runat="server">
														</td>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<tr>
                    <td style="display: none">
                        <input id="txtCategoryId" name="txtCategoryId" type="text" runat="server" />
                        <cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
                        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
                    </td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
