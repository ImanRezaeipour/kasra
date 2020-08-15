<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FramePersonTab.aspx.vb" Inherits="FrameWork.FramePersonTab" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FramePersonTab</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/Styles/Toolbar.css" type="text/css" rel="stylesheet">
		<script src="../../Includes/Scripts/General.js"></script>
		<script src="../../Includes/Scripts/WaitShow.js"></script>
		<script language="javascript">
		
			var newrowindex=0 //(last row )
			
			var currentPage_X = 0
			var root='/UserEntity/Person'
			var strXPathConditions = ""
			var selectFlag=0
			////================================
			function clientPaging(direction)
			{
				var str="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				
				var PageSize=parseInt(Form1.txtPageSize.value)
				Cleargrd(XTabTable)
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(str);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				
				var xmlNodes;
				var x;
				
				var xPath=''
				xPath=''
				/*if (Form1.ShowSelectedX.checked)
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
				else*/
					xmlNodes=xmlDoc.documentElement.selectNodes(root);
					
				var totalRecords 
				totalRecords = xmlNodes.length
				//document.all.item('CntX').innerText=totalRecords
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

				var Param
				
				for(;x<=endFor;++x)
				{
					Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('FirstName').text+' '+xmlNodes.item(x).selectSingleNode('LastName').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTitle').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'",'
					AddRow(XTabTable,"PersonID",xmlNodes.item(x).selectSingleNode('PersonID').text,x,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
				}
			  }
			}	
			////__________________________________________________________________________
			//Next Button For Paging
			function NextBtn_XClick()
			{
				if (parseInt(Form1.CurPage1.value)<parseInt(Form1.Totalpage1.value))
				{
					if (Form1.ShowSelectedX.checked==true)
					{
						clientPaging('Next')
					}
					else if (Form1.ShowSelectedX.checked==false)
					{
						Form1.txtPagingFlag.value="Next"
						Form1.submit()
					}
				}
			}
    		////_______________________________________________________________________________
    		//previous Button For Paging
			function PrevBtn_XClick()
			{	
				if (parseInt(Form1.CurPage1.value)>1)
				{
					if (Form1.ShowSelectedX.checked==true)
					{
						clientPaging('Previous')
					}
					else if (Form1.ShowSelectedX.checked==false)
					{
						Form1.txtPagingFlag.value="Previous"
						Form1.submit()
					}
				}
			}
    		////_______________________________________________________________________________
    		//First Button For Paging
			function FirstBtn_XClick()
			{
				if (parseInt(Form1.CurPage1.value)>1)
				{
					if (Form1.ShowSelectedX.checked==true)
					{
						clientPaging('First')
					}
					else if (Form1.ShowSelectedX.checked==false)
					{
						Form1.txtPagingFlag.value="First"
						Form1.submit()
					}
				}
			}
    		////_______________________________________________________________________________
    		//Last Button For Paging
			function LastBtn_XClick()
			{
				if (parseInt(Form1.CurPage1.value)!=parseInt(Form1.Totalpage1.value))
				{
					if (Form1.ShowSelectedX.checked==true)
					{
						clientPaging('Last')
					}
					else if (Form1.ShowSelectedX.checked==false)
					{
						Form1.txtPagingFlag.value="Last"
						Form1.submit()
					}
				}
			}
			////_______________________________________________________________________________
			function ChkAll_Onclick()
			{
				
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.AllXMLX.value);
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
						Form1.txtAllTikFlag.value="1"
					}
					else if (Form1.ChkAll.checked==false)
					{
						xmlNodes.item(j).selectSingleNode('Selected').text=0
						Form1.txtAllTikFlag.value="0"
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
				///////////////////////////////////////////
				
				var str=xmlDoc.xml
				var s1=str.substring(0,(str.length)-15)
				var s2=s1.substring(12,(s1.length))
				str=s2
				Form1.txtTmpXMLX.value=str
				//alert(Form1.txtTmpXMLX.value)
			}
			////______________________________________________________________________________
			function CorrcetCharK(val)
			{
				return(ReplaceAll(val,'ò','ﬂ'))
			}
			////////////////////////////////////////////////////////////////////////////////
			function XTableInitialize()
			{
			
				var i;
				var j;
				FillTabTable('Next')
				
				if (Form1.txtAllTikFlag.value=="1")
				{
					Form1.ChkAll.checked=true
					Form1.SelectAllChk.checked=true
					for(var i=0;i<XTabTable.rows.length;i++)
					{	
						XTabTable.rows(i).cells(1).firstChild.checked=true
					}
				}
				else
				{
					Form1.ChkAll.checked=false
					Form1.SelectAllChk.checked=false
					var xmlStr="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				
					xmlDoc = new ActiveXObject("MsXml2.DomDocument");
					xmlDoc.loadXML(xmlStr);
					xmlDoc.setProperty("SelectionLanguage", "XPath");
			
					var xmlNodes;
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[Selected=1]");
					var chkCount=0
					if (xmlNodes.length!=0)
					{
						if (Form1.txtCheckFlag.value=="1")
						{
							for(var i=0;i<XTabTable.rows.length;i++)
							{	
								for(var j=0;j<xmlNodes.length;j++)
								{
									if(xmlNodes.item(j).selectSingleNode('PersonID').text==XTabTable.rows(i).cells(2).innerText)
									{
										XTabTable.rows(i).cells(1).firstChild.checked=true
										chkCount=chkCount+1
									}
								}
							}
						}
						//else
							//Form1.SelectAllChk.checked=false
					}
					if (chkCount==XTabTable.rows.length)
					{
						Form1.SelectAllChk.checked=true
						chkCount=0;
					}
					else
					{
						Form1.SelectAllChk.checked=false
						chkCount=0;
					}
				}
			}
			////////////////////////////////////////////////////////////////////////////////
			function XTabSearch()
			{
				//alert(Form1.XMLX.value.length)
				FillTabTable('First')
			}
			////////////////////////////////////////////////////////////////////////////////
			function ShowSelectedX_Onclick()
			{
				if (Form1.ShowSelectedX.checked==true)
				{
					selectFlag=1
					
					Form1.tmpCurPage1.value=Form1.CurPage1.value
					Form1.tmpTotalPage.value=Form1.Totalpage1.value
					
					
					Form1.CurPage1.value="0"
					clientPaging('Next')
					if (Form1.CurPage1.value=="1" && Form1.Totalpage1.value=="1")
					{
						Form1.NextBtn_X.disabled=true
						Form1.PrevBtn_X.disabled=true
						Form1.FirstBtn_X.disabled=true
						Form1.LastBtn_X.disabled=true
					}
				}
				else if (Form1.ShowSelectedX.checked==false)
				{
					selectFlag=0
					
					Form1.CurPage1.value=Form1.tmpCurPage1.value
					Form1.Totalpage1.value=Form1.tmpTotalPage.value
					
					Form1.NextBtn_X.disabled=false
					Form1.PrevBtn_X.disabled=false
					Form1.FirstBtn_X.disabled=false
					Form1.LastBtn_X.disabled=false
					
					Cleargrd(XTabTable)
					FillTabTable('First')
				}
				
				
				
				
				
				//========================
				//totalRecords=parseInt(Form1.totalRecords.value)
				//Form1.Totalpage1.value=totalRecords
				//Form1.CurPage1.value=Math.ceil(totalRecords / parseInt(Form1.txtPageSize.value))
				//========================
				
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
		
				//alert(Form1.XMLX.value)
		
				var xmlNodes;
				var xmlNodes222;
				
				//xmlNodes222=xmlDoc.documentElement.selectNodes(root);
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]");
				//alert(xmlNodes.length)
				
				
				if (xmlNodes.length==0)
				{
					var xmlStr="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
					xmlDoc = new ActiveXObject("MsXml2.DomDocument");
					xmlDoc.loadXML(xmlStr);
					xmlDoc.setProperty("SelectionLanguage", "XPath");
					xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]");
				}	
				//alert(xmlNodes.length)
				
				
				
				var str="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
					
				var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc2.loadXML(str);
				xmlDoc2.setProperty("SelectionLanguage", "XPath");
		
				var xmlNodes;
				xmlNodes2=xmlDoc2.documentElement.selectNodes(root+"[PersonID="+PersonID+"]");
				
				//alert(xmlNodes2.length)
				
				if (chk.checked)
				{
					if (xmlNodes2.length==0)
					{
						xmlNodes.item(0).selectSingleNode('Selected').text=1
						//====================
						
						Form1.txtTmpXMLX.value+="<Person>"
						Form1.txtTmpXMLX.value+="<PersonID>"+xmlNodes.item(0).selectSingleNode('PersonID').text+"</PersonID>"
						Form1.txtTmpXMLX.value+="<FirstName>"+xmlNodes.item(0).selectSingleNode('FirstName').text+"</FirstName>"
						Form1.txtTmpXMLX.value+="<LastName>"+xmlNodes.item(0).selectSingleNode('LastName').text+"</LastName>"
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
						Form1.txtTmpXMLX.value+="</Person>"
					}
					else
					{
						xmlNodes2.item(0).selectSingleNode('Selected').text=1
					
						var str=xmlDoc2.xml
						var s1=str.substring(0,(str.length)-15)
						var s2=s1.substring(12,(s1.length))
						str=s2
						Form1.txtTmpXMLX.value=str
					}
					
				}
				else
				{
					xmlNodes2.item(0).selectSingleNode('Selected').text=0
					
					var str=xmlDoc2.xml
					var s1=str.substring(0,(str.length)-15)
					var s2=s1.substring(12,(s1.length))
					str=s2
					Form1.txtTmpXMLX.value=str
					//=======================
					if (xmlNodes.length!=0)
						xmlNodes.item(0).selectSingleNode('Selected').text=0
				}
				Form1.XMLX.value=xmlDoc.xml
				
				//Form1.txtTmpXMLX.value=xmlDoc.xml
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
				var strFill=""
				
				if (selectFlag==1)
					strFill="<UserEntity>"+Form1.txtTmpXMLX.value+"</UserEntity>"
				else
					strFill=Form1.XMLX.value
				
				Cleargrd(XTabTable)
				//alert("rrr")
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(strFill);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				
				//alert(Form1.XMLX.value.length)
				
				var xmlNodes;
				var x;
								
				xmlNodes=xmlDoc.documentElement.selectNodes(root);
				Form1.totalRecords.value=xmlNodes.length
				
				var Param
				x=0;
				for(;x<xmlNodes.length;++x)
				{
					Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('FirstName').text+' '+xmlNodes.item(x).selectSingleNode('LastName').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTitle').text+'","'+xmlNodes.item(x).selectSingleNode('RoleTypeDscr').text+'",'
					AddRow(XTabTable,"PersonID",xmlNodes.item(x).selectSingleNode('PersonID').text,x,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
				}
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
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="XTableInitialize()"
		rightMargin="0" MS_POSITIONING="GridLayout">
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
													name="ShowSelectedX"> ‰„«Ì‘ ò·ÌÂ Å—”‰· «‰ Œ«» ‘œÂ</TD>
											<TD style="WIDTH: 171px"><INPUT class="ShoperTabChk" id="ChkAll" onclick="ChkAll_Onclick()" type="checkbox" name="ChkAll">«‰ Œ«» 
												Â„Â</TD>
											<TD style="WIDTH: 216px"> ⁄œ«œÅ—”‰· œ— Õ«· ‰„«Ì‘:</TD>
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
											<TD style="WIDTH: 17px"><INPUT class="CssLastPage" id="LastBtn_X" title="¬Œ—Ì‰" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="LastBtn_XClick()" type="button" name="LastBtn_X"></TD>
											<TD style="WIDTH: 19px" align="right"><INPUT class="CssNextPage" id="NextBtn_X" title="»⁄œÌ" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="NextBtn_XClick()" type="button" name="NextBtn_X"></TD>
											<TD style="WIDTH: 54px" vAlign="middle" align="right"><asp:textbox id="CurPage1" tabIndex="1" runat="server" Height="20px" BorderStyle="Groove" CssClass="txtControls"
													Width="40px" AutoPostBack="True"></asp:textbox></TD>
											<TD dir="rtl" style="WIDTH: 29px" vAlign="middle" align="right">&nbsp;«“</TD>
											<TD style="WIDTH: 43px" vAlign="middle"><asp:textbox id="Totalpage1" runat="server" Height="20px" BorderStyle="Groove" BackColor="White"
													CssClass="txtControls" Width="40px" ReadOnly="True"></asp:textbox></TD>
											<TD style="WIDTH: 35px"><INPUT class="CssPrevPage" id="PrevBtn_X" title="ﬁ»·Ì" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="PrevBtn_XClick()" type="button" name="PrevBtn_X"></TD>
											<TD style="WIDTH: 29px"><INPUT class="CssFirstPage" id="FirstBtn_X" title="«Ê·Ì‰" style="WIDTH: 35px; HEIGHT: 35px"
													onclick="FirstBtn_XClick()" type="button" name="FirstBtn_X"></TD>
											<TD style="DISPLAY: none"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<DIV class="DivStyle" style="WIDTH: 601px; HEIGHT: 384px">
							<TABLE id="XTabTable_Header">
								<THEAD style="DISPLAY: inline">
									<TR class="ShoperHeaderStyle">
										<TD class="Headerstyle" align="center" width="30">*</TD>
										<TD class="Headerstyle" align="center" width="35"><INPUT class="ShoperTabChk" id="SelectAllChk" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
												onclick="SelectAllChk_Onclick(XTabTable)" type="checkbox" name="SelectAllChk"></TD>
										<TD class="Headerstyle" align="center" width="150">&nbsp;‘„«—Â Å—”‰·Ì</TD>
										<TD class="Headerstyle" align="center" width="250">⁄‰Ê«‰</TD>
										<TD class="Headerstyle" align="center" width="200">Å”  ”«“„«‰Ì</TD>
										<TD class="Headerstyle" align="center" width="100">‰Ê⁄ Å” </TD>
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
					<TD style="DISPLAY: none">
						<INPUT id="XMLSelected" style="DISPLAY: none" type="text" size="1" name="XMLSelected" runat="server">
						<INPUT id="txtCheckFlag" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtCheckFlag"
							runat="server"> <INPUT id="XMLX" style="DISPLAY: none; WIDTH: 1px" type="text" name="XMLX" runat="server">
						<INPUT id="txtTmpXMLX" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtTmpXMLX"
							runat="server"> <INPUT id="txtPID" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtPID" runat="server">
						<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
						<INPUT id="txtPName" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtPName" runat="server">
						<INPUT id="TmpXMLX" style="DISPLAY: none; WIDTH: 1px" type="text" name="TmpXMLX" runat="server">
						<INPUT id="TmpFilter" style="DISPLAY: none; WIDTH: 1px" type="text" name="TmpFilter" runat="server">
						<INPUT id="txtAllTikFlag" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtAllTikFlag"
							runat="server"> <input id="AllXMLX" name="AllXMLX" runat="server" type="text">
						<input id="txtPagingFlag" name="txtPagingFlag" runat="server" type="text"> <input id="txtPageSize" name="txtPageSize" runat="server" type="text">
						<input id="totalRecords" name="totalRecords" runat="server" type="text"> <input id="tmpCurPage1" name="tmpCurPage1" runat="server" type="text">
						<input id="tmpTotalPage" name="tmpTotalPage" runat="server" type="text">
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
