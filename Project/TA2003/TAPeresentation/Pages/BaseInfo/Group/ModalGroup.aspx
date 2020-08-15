<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ModalGroup.aspx.vb" Inherits="TA.ModalGroup" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>------------------------ œ«Œ· ê—ÊÂÂ«Ì ò«—Ì------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../Person/General.js"></script>
		<script language="javascript">
		var newrowindex=0	
		/**********************************************************************/
		function onLoad()
		{
			window.name="ModalGroup"
			Form1.target=window.name
			
			var oMyObject=window.dialogArguments
			Form1.txtOverlapXML.value=oMyObject.document.all.item('txtOverlapXML').value
			//alert(Form1.txtOverlapXML.value)
			FillTabTable()
				
		}
		/**********************************************************************/
		function FillTabTable()
		{
			//alert(Form1.txtOverlapXML.value)
			
			Cleargrd(XTabTablealert)
			Cleargrd(XTabTableVorody)
			//alert(Form1.txtOverlapXML.value)
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.txtOverlapXML.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodesalert;
			var xmlNodesVorody;
			var endFor 
			var Param
			var x;
			//alert(Form1.txtOverlapXML.value)
			xmlNodesalert=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/ModifyEmployeeGroup");
			xmlNodesVorody=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/vorody");
			
			var totalRecords 
			if (xmlNodesalert.length!=0)
			{
				totalRecords = xmlNodesalert.length
				
				endFor =totalRecords-1
				for(x=0;x<=endFor;x++)
				{
					Param='"'+xmlNodesalert.item(x).selectSingleNode('PersonID').text+'","'+xmlNodesalert.item(x).selectSingleNode('PName').text+'","'+xmlNodesalert.item(x).selectSingleNode('GroupName').text+'","'+xmlNodesalert.item(x).selectSingleNode('SDate').text+'","'+xmlNodesalert.item(x).selectSingleNode('EDate').text+'",'
					AddRow(XTabTablealert,x+1,Param)
				}
			}
			//----------------
			newrowindex=0	
			if (xmlNodesVorody.length!=0)
			{
				totalRecords = xmlNodesVorody.length
				
				endFor =totalRecords-1
				for(x=0;x<=endFor;x++)
				{
					Param='"'+xmlNodesVorody.item(x).selectSingleNode('PersonID').text+'","'+xmlNodesVorody.item(x).selectSingleNode('PName').text+'","'+xmlNodesVorody.item(x).selectSingleNode('GroupName').text+'","'+xmlNodesVorody.item(x).selectSingleNode('SDate').text+'","'+xmlNodesVorody.item(x).selectSingleNode('EDate').text+'",'
					AddRow(XTabTableVorody,x+1,Param)
				}
			}
			
		}
		/**********************************************************************/
		function AddRow(oGrid,cntRow,Param)
		{
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			var cell
			cell=0
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
			oGrid.rows(newrowindex).align="center"
			oGrid.rows(newrowindex).cells(0).style.width="70px"
			oGrid.rows(newrowindex).cells(1).style.width="120px"
			oGrid.rows(newrowindex).cells(2).style.width="80px"
			oGrid.rows(newrowindex).cells(3).style.width="80px"
			oGrid.rows(newrowindex).cells(4).style.width="80px"
			RestoreStyle(oGrid)	
			SetBorderWidthGrid(oGrid)											
			newrowindex=newrowindex+1
		}
		/**********************************************************************/
		function SetBorderWidthGrid(objGrid)
		{
			var i;
			var j;
			for(j=0;j<objGrid.rows.length;++j)
			{
				for(i=0;i<objGrid.rows(j).cells.length;++i)
				{
					objGrid.rows(j).cells(i).style.borderBottomWidth="0"
					objGrid.rows(j).cells(i).style.borderTopWidth="0"
					objGrid.rows(j).cells(i).style.borderLeftWidth="0"
					objGrid.rows(j).cells(i).style.borderRightWidth="1"
					objGrid.rows(j).cells(i).style.borderRightColor="Gray"
				}
			}
		}
		/**********************************************************************/
		function RestoreStyle(objGrid)
		{
			var j;
			var FlagClass;
			var oRowGrid;
			FlagClass="CssAlternatingItemStyle"
			for(j=0;j<objGrid.rows.length;++j)
			{
				oRowGrid=objGrid.rows(j)
				if (oRowGrid.style.display!='none')
				{
					if (FlagClass=="CssItemStyle")
					{
						oRowGrid.className="CssAlternatingItemStyle"
						FlagClass="CssAlternatingItemStyle"
					}
					else
					{
						oRowGrid.className="CssItemStyle"
						FlagClass="CssItemStyle"
					}
				}
			}
		}
		/**********************************************************************/
		function Cleargrd(obj)
		{
			j=obj.rows.length-1
			for(;j>=0;--j)
				obj.deleteRow(j)
			newrowindex=0
		}
		/**********************************************************************/
		
		function OnClickSubNodeGroup()
		{
			/*alert(1)*/
			if (document.all.item('tdGroup').style.display=="inline")
			{
				document.all.item('tdGroup').style.display='none'
				document.all.item('trGroup').style.display='none'
			}
			else
			{
				
				document.all.item('tdGroup').style.display='inline'
				document.all.item('trGroup').style.display='inline'
			}
		}
		/**********************************************************************/
		function OnClickSubNodeGroup1()
		{
			/*alert(1)*/
			if (document.all.item('tdGroup1').style.display=="inline")
			{
				document.all.item('tdGroup1').style.display='none'
				document.all.item('trGroup1').style.display='none'
			}
			else
			{
				
				document.all.item('tdGroup1').style.display='inline'
				document.all.item('trGroup1').style.display='inline'
			}
		}
		/****************************************************************/
		function onclickbtnOK()
		{
			var stralert="¬Ì« »—«Ì  ‰ŸÌ„  «—ÌŒ Â« Ê –ŒÌ—Â „ÿ„∆‰ Â” Ìœ!!!"
			if (confirm(stralert))
			{
				/*var oMyObject=window.dialogArguments
				Form1.txtOverlapXML.value=oMyObject.document.all.item('txtOverlapXML').value
				Form1.txtSubmit.value="Save"
				Form1.submit()*/
				returnValue="1"
				window.close()
			}
			
		}
		/****************************************************************/
		function onClickbtnCancel()
		{
			window.close()
		}
		/****************************************************************/
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<FORM id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" style="WIDTH: 100%; HEIGHT: 100%" height="664" cellSpacing="0"
							cellPadding="0" width="994" border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" cellSpacing="1" cellPadding="1" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline" vAlign="top" align="center">
												<TABLE cellSpacing="1" cellPadding="1" border="0">
													<TR>
														<TD align="center">„‘Œ’«  „‘«»Â œ— «Ì‰ »«“Â “„«‰Ì »Â ’Ê—  “Ì— „ÊÃÊœ «” :</TD>
													</TR>
													<tr>
														<td id="GridTD" vAlign="top" align="center">
															<TABLE id="xTabTable_header" dir="rtl" border="0">
																<TR>
																	<TD class="CssHeaderStyle" style="WIDTH: 19px; HEIGHT: 27px" align="center"><IMG onclick="OnClickSubNodeGroup()" src="/TA/Includes/Images/Icons/btnSubNodes.gif"></TD>
																	<TD class="CssHeaderStyle" style="HEIGHT: 27px" align="center">„‘Œ’«  „‘«»Â „ÊÃÊœ 
																		œ— »«“Â “„«‰Ì</TD>
																</TR>
																<tr>
																	<td id="tdGroup" style="DISPLAY: none"></td>
																	<td id="trGroup" style="DISPLAY: none">
																		<TABLE id="xTabTable_headeralert" dir="rtl" cellSpacing="1" cellPadding="1" border="0">
																			<TR>
																				<TD class="CssHeaderStyle" style="WIDTH: 70px" align="center">‘.Å—”‰·Ì</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 120px" align="center">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center">‰«„ ê—ÊÂ</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center"> «—ÌŒ ‘—Ê⁄</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center"> «—ÌŒ Œ« „Â</TD>
																			</TR>
																		</TABLE>
																		<div style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 100%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 98%">
																			<table id="XTabTablealert" align="center" border="1" cellSpacing="0" cellPadding="0">
																			</table>
																		</div>
																	</td>
																</tr>
															</TABLE>
															<TABLE id="xTabTable_header1" dir="rtl" border="0">
																<TR>
																	<TD class="CssHeaderStyle" style="WIDTH: 19px; HEIGHT: 27px" align="center"><IMG onclick="OnClickSubNodeGroup1()" src="/TA/Includes/Images/Icons/btnSubNodes.gif"></TD>
																	<TD class="CssHeaderStyle" style="HEIGHT: 27px" align="center">„‘Œ’«  &nbsp;«‰ Œ«» 
																		&nbsp;‘œÂ ÃÂ &nbsp; –ŒÌ—Â&nbsp;</TD>
																</TR>
																<tr>
																	<td id="tdGroup1" style="DISPLAY: none"></td>
																	<td id="trGroup1" style="DISPLAY: none">
																		<TABLE id="xTabTable_headerVorody" dir="rtl" cellSpacing="1" cellPadding="1" border="0">
																			<TR>
																				<TD class="CssHeaderStyle" style="WIDTH: 70px" align="center">‘.Å—”‰·Ì</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 120px" align="center">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center">‰«„ ê—ÊÂ</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center"> «—ÌŒ ‘—Ê⁄</TD>
																				<TD class="CssHeaderStyle" style="WIDTH: 80px" align="center"> «—ÌŒ Œ« „Â</TD>
																			</TR>
																		</TABLE>
																		<div style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 100%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 98%">
																			<table id="XTabTableVorody" align="center" border="1" cellSpacing="0" cellPadding="0">
																			</table>
																		</div>
																	</td>
																</tr>
															</TABLE>
														</td>
													</tr>
												</TABLE>
												<INPUT class="CssBtnAdjustDate" id="btnOK" style="WIDTH: 88px; HEIGHT: 34px" onclick="onclickbtnOK()"
													type="button" name="btnOK"><INPUT class="CssBtnCancel" id="btnCancel" onclick="onClickbtnCancel()" type="button" name="btnCancel">
											</TD>
										</TR>
										<tr>
											<td id="DownRow" style="DISPLAY: none">
												<input type="text" id="txtOverlapXML" runat="server" NAME="txtOverlapXML"> <input type="text" id="txtSubmit" runat="server">
												<input type="text" id="txtMsg" runat="server">
											</td>
										</tr>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</FORM>
	</body>
</HTML>
