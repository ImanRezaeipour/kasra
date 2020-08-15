<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ValidUserCredit.aspx.vb" Inherits="TA.ValidUserCredit" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>ValidUserCredit</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		////////////////////////////////////for grid 
		var LastSelectedRow=null;
		var LastSelectedRowClass="";
		var newrowindex=0;
		///-------------------
		var UserFlag=0;
		var SelectFlag;
		
		
		
		function OnClickSubNode(SelectedImage)	
		{
		try{
			var j;
			var i;
			var oRow=SelectedImage.parentElement.parentElement
			for(j=oRow.rowIndex;j<GrdTypeCredit.rows.length;++j)
				if (GrdTypeCredit.rows(j).cells(0).firstChild==SelectedImage)
					{
						if (GrdTypeCredit.rows(j+1).style.display!="none")
							SelectedImage.src="../../../Includes/Images/Icons/btnSubNodes.gif"
						else
							SelectedImage.src="../../../Includes/Images/Icons/btnNodes.gif"
						
						for(i=j+1;i<GrdTypeCredit.rows.length;++i)
							if (GrdTypeCredit.rows(i).cells(0).firstChild.style.visibility!='hidden')
								{
									RestoreStyle(GrdTypeCredit)
									return;
								}
							else
								{
									if (GrdTypeCredit.rows(i).style.display=="none")
										GrdTypeCredit.rows(i).style.display="inline"
									else
										GrdTypeCredit.rows(i).style.display="none"
								}
					}
			RestoreStyle(GrdTypeCredit)
			}
			catch(e){}
		}
		////_______________________________________________________________________
		// ê—Ìœ ”ÿ—Â«Ì —‰ê ò—œ‰ œ—” 
		function RestoreStyle(objGrid)
		{
			var j;
			var FlagClass;
			var oRowGrid;
			FlagClass="CssAlternatingItemStyle"
			for(j=0;j<objGrid.rows.length;++j)
				{
					oRowGrid=objGrid.rows(j)
					if (oRowGrid.style.display=='inline' || oRowGrid.style.display=='')
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
		////_______________________________________________________________________
		//ê—Ìœ Border ò—œ‰ ” 
		function SetBorderWidthGrid(objGrid)
		{
			var i;
			var j;
			for(j=0;j<objGrid.rows.length;++j)
				{
					for(i=0;i<objGrid.rows(j).cells.length;++i)
						{
							objGrid.rows(j).cells(i).style.borderBottomWidth="1"
							objGrid.rows(j).cells(i).style.borderTopWidth="0"
							objGrid.rows(j).cells(i).style.borderBottomColor="#ffffff" // white
						}
				}
		}
		////_______________________________________________________________________
		function onClickGrdValidUser(obj)
		{
			var oRow;
			SelectFlag=1
			
			//alert(window.event.srcElement.parentElement.tagName)
			if (window.event.srcElement.parentElement.tagName=='TR')
			{
				oRow=window.event.srcElement.parentElement.rowIndex 
			}
			else if (window.event.srcElement.parentElement.tagName=='TD')
			{
				oRow=window.event.srcElement.parentElement.parentElement.rowIndex 
			}
			
			
			//Set Row Style
			for(i=0;i<GrdValidUser.rows.length;i++)
			{
				if (GrdValidUser.rows(i).className=="CssSelectedItemStyle")
				{
					GrdValidUser.rows(i).className="CssItemStyle"
				}
			}
			
			GrdValidUser.rows(oRow).className="CssSelectedItemStyle"
			
			
			Form1.txtValidUserID.value=GrdValidUser.rows(oRow).ID
			Form1.txtORow.value=oRow
			//alert(Form1.txtValidUserID.value)
			
		}
		////_______________________________________________________________________
		function OnClickBtnDel()
		{
			if (SelectFlag==1)
			{
				var c=window.confirm("«Ì« „ÿ„∆‰ »Â Õ–› „Ì »«‘Ìœ.")
				if (c==true)
				{
					SelectFlag=0
					var oRow=0;
					if (Form1.txtValidUserID.value=="0")
					{
						oRow=parseInt(Form1.txtORow.value)
						GrdValidUser.deleteRow(oRow)
					}
					else
					{
						Form1.txtSubmit.value="Delete"
						Form1.submit()
					}
				}
			}
			else
			{
				alert("Ìò ”ÿ— «‰ Œ«» ‰„«ÌÌœ.")
				return;
			}
		}
		////_______________________________________________________________________
		function OnClickBtnSave()
		{
			var strSave='';
			var i=0;
			var endFor=(GrdValidUser.rows.length)
			
			strSave+="<BaseInfoEntity>"
			
			for(;i<endFor;++i)
			{
				strSave+="<GetValidTypeForUser>"
				
				strSave+="<UserFlag>"+GrdValidUser.rows(i).UserFlag+"</UserFlag>"
				strSave+="<UserID>"+GrdValidUser.rows(i).UserID+"</UserID>"
				strSave+="<TypeCreditID>"+Form1.txtTypeCreditID.value+"</TypeCreditID>"
				
				strSave+="</GetValidTypeForUser>"
			}
			strSave+="</BaseInfoEntity>"
			
			Form1.txtXmlSave.value=strSave
			
			Form1.txtSubmit.value="Save"
			Form1.submit()
		}
		////_______________________________________________________________________
		function GetDataPerson()
		{
			var Username='';
			var SUsername='';
			
			
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.SelectedMamber.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/Person[Selected=1]");
			
			var strSelectedMamber//=Form1.tSelectedMamber.value
			
			Form1.tSelectedMamber.value="<BaseInfoEntity></BaseInfoEntity>"
			
			xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc2.loadXML(Form1.tSelectedMamber.value);
			xmlDoc2.setProperty("SelectionLanguage", "XPath");
			var xmlNodes2;
			
		
			
			
			if(xmlNodes.length!=0)
			{
				for(x=0;x<xmlNodes.length;x++)
				{
					
					xmlNodes2=xmlDoc2.documentElement.selectNodes("/BaseInfoEntity/GetValidTypeForUser[UserID="+xmlNodes.item(x).selectSingleNode('PersonID').text+" and UserFlag='U' and TypeCreditID='"+Form1.txtTypeCreditID.value+"']");
					
					if (xmlNodes2.length==0)
					{
						Username=xmlNodes.item(x).selectSingleNode('Family').text
					
					
					
						if (Username.length>25)
						{
							SUsername=Username.substr(0,25)+"..."
						}
						else
						{
							SUsername=Username
						}
						
						
						strSelectedMamber+='<GetValidTypeForUser>'
						
						
							strSelectedMamber+='<ID>0</ID>'
							strSelectedMamber+='<UserFlag>'+UserFlag+'</UserFlag>'
							strSelectedMamber+='<UserID>'+xmlNodes.item(x).selectSingleNode('PersonID').text+'</UserID>'
							strSelectedMamber+='<TypeCreditID>'+Form1.txtTypeCreditID.value+'</TypeCreditID>'
							strSelectedMamber+='<Username>'+Username+'</Username>'
							strSelectedMamber+='<UserPersonID>'+xmlNodes.item(x).selectSingleNode('PersonID').text+'</UserPersonID>'
							strSelectedMamber+='<SUsername>'+SUsername+'</SUsername>'
							
							
							
						strSelectedMamber+='</GetValidTypeForUser>'
					}
				}
			}
			Form1.tSelectedMamber.value=Form1.tSelectedMamber.value.replace("</BaseInfoEntity>",strSelectedMamber+"</BaseInfoEntity>")
			
			strSelectedMamber='<BaseInfoEntity>'+strSelectedMamber+'</BaseInfoEntity>'
			return(strSelectedMamber)
		}
		////_______________________________________________________________________
		function GetDataGroup()
		{
			var Username='';
			var SUsername='';
			
			
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.SelectedMamber.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetGroup[Selected=1]");
			
			var strSelectedMamber//=Form1.tSelectedMamber.value
			
			Form1.tSelectedMamber.value="<BaseInfoEntity></BaseInfoEntity>"
			
			xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc2.loadXML(Form1.tSelectedMamber.value);
			xmlDoc2.setProperty("SelectionLanguage", "XPath");
			var xmlNodes2;
			
			//alert(Form1.tSelectedMamber.value)	
			//alert(xmlNodes.length)					
			if(xmlNodes.length!=0)
			{
				for(x=0;x<xmlNodes.length;x++)
				{
					xmlNodes2=xmlDoc2.documentElement.selectNodes("/BaseInfoEntity/GetValidTypeForUser[UserID="+xmlNodes.item(x).selectSingleNode('GroupID').text+" and UserFlag='G' and TypeCreditID='"+Form1.txtTypeCreditID.value+"']");
					
					//alert(xmlNodes2.length)
					if (xmlNodes2.length==0)
					{
					
						Username=xmlNodes.item(x).selectSingleNode('Groupname').text
						
						
						if (Username.length>25)
						{
							SUsername=Username.substr(0,25)+"..."
						}
						else
						{
							SUsername=Username
						}
						
						
						strSelectedMamber+='<GetValidTypeForUser>'
						
							strSelectedMamber+='<ID>0</ID>'
							strSelectedMamber+='<UserFlag>'+UserFlag+'</UserFlag>'
							strSelectedMamber+='<UserID>'+xmlNodes.item(x).selectSingleNode('GroupID').text+'</UserID>'
							strSelectedMamber+='<TypeCreditID>'+Form1.txtTypeCreditID.value+'</TypeCreditID>'
							strSelectedMamber+='<Username>'+Username+'</Username>'
							strSelectedMamber+='<UserPersonID></UserPersonID>'
							strSelectedMamber+='<SUsername>'+SUsername+'</SUsername>'
							
						strSelectedMamber+='</GetValidTypeForUser>'
					}
				}
			}
			
			Form1.tSelectedMamber.value=Form1.tSelectedMamber.value.replace("</BaseInfoEntity>",strSelectedMamber+"</BaseInfoEntity>")
			
			//alert(Form1.tSelectedMamber.value)
			
			strSelectedMamber='<BaseInfoEntity>'+strSelectedMamber+'</BaseInfoEntity>'
			return(strSelectedMamber)
		}
		////_______________________________________________________________________
		function onClickBtnSelectPerson()
		{
			var url
			var strOptions
			
			if (Form1.chkPerson.checked==true)
			{
				url="../Person/PersonTab.aspx"	+'?SessionID='+Form1.txtSessionID.value 
				strOptions="dialogHeight: 800px;dialogWidth: 800px;center: Yes;help: no;status: no"
				UserFlag="U"
			}
			else if (Form1.chkGroup.checked==true)
			{
				url="ValidGroupWithFilter.aspx?CategoryId=0"	+'&SessionID='+Form1.txtSessionID.value 
				strOptions="dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no"
				UserFlag="G"
			}
			
			if (Form1.txtTypeCreditID.value!="" && Form1.txtTypeCreditID.value!="0")
				Form1.SelectedMamber.value=window.showModalDialog(url,"",strOptions)
			else
				alert("·ÿ›« Ìò „ÃÊ“ «‰ Œ«» ‰„«ÌÌœ.")
			if (Form1.SelectedMamber.value!='')
			{
				if(GrdValidUser.rows.length>0)
					if(confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø'))
					{
						Cleargrd(GrdValidUser)
						Form1.tSelectedMamber.value=''
					}
					//===============
					if (Form1.chkPerson.checked==true)
					{
						Form1.SelectedMamber.value=GetDataPerson()
					}
					else if (Form1.chkGroup.checked==true)
					{
						Form1.SelectedMamber.value=GetDataGroup()
					}
					//===============
					
				Form1.txtValidUserXml.value=Form1.SelectedMamber.value
				bindGrdValidUser()
			}
		}
		////_______________________________________________________________________
		function onclickGrdTypeCredit(SelectedRow)
		{
			if (Form1.txtLastSelectedRow.value=="")
				Form1.txtLastSelectedRow.value="0"
			var k=parseInt(Form1.txtLastSelectedRow.value)
			if (GrdTypeCredit.rows(k).className=="CssSelectedItemStyle")
				RestoreStyle(GrdTypeCredit)
			//====================
			if(LastSelectedRow!=null)
			{
				LastSelectedRow.className=LastSelectedRowClass;
			}
			LastSelectedRowClass=SelectedRow.className;
			LastSelectedRow=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			//===================
			Form1.txtLastSelectedRow.value=SelectedRow.rowIndex
			//===================
			LoadDataUser(SelectedRow)
		}
		////_______________________________________________________________________
		function Cleargrd(obj)
		{
			var j=obj.rows.length-1
			for(;j>=0;--j)
				obj.deleteRow(j)
			newrowindex=0
		}
		////_____________________________________________________________________
		function LoadDataUser(SelectedRow)
		{
			Cleargrd(GrdValidUser)
			//--------------

			Form1.txtTypeCreditID.value=SelectedRow.Val
			Form1.txtGrdTypeCreditORow.value=SelectedRow.rowIndex
			//------------------------
			Form1.txtValidUserXml.value=Form1.txtTempValidUserXml.value
			bindGrdValidUser()
		}	
		////_______________________________________________________________________
		function bindGrdValidUser()
		{
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.txtValidUserXml.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
								
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetValidTypeForUser"+"[TypeCreditID='"+Form1.txtTypeCreditID.value+"']");
				
					
			var x=0
			if (xmlNodes.length!=0)
			{	
				for(;x<xmlNodes.length;++x)
				{
					AddRow(GrdValidUser,"ID",xmlNodes.item(x).selectSingleNode('ID').text,xmlNodes.item(x).selectSingleNode('UserFlag').text,"UserID",xmlNodes.item(x).selectSingleNode('UserID').text,xmlNodes.item(x).selectSingleNode('UserPersonID').text,xmlNodes.item(x).selectSingleNode('Username').text,xmlNodes.item(x).selectSingleNode('SUsername').text)
				}
			}
		}
		////_______________________________________________________________________
		function AddRow(oGrid,AttrNameID,AttrValueID,UserFlag,AttrName,AttrValue,UserPersonID,Username,SUsername)
		{
			//oGrid="GrdValidUser"
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			
			//Set CreditID Attribute
			oGrid.rows(newrowindex).setAttribute(AttrNameID ,AttrValueID)
			oGrid.rows(newrowindex).setAttribute(AttrName ,AttrValue)
			oGrid.rows(newrowindex).setAttribute("UserFlag" ,UserFlag)
			
			
							
			//Create Ravand Cell
			oGrid.rows(newrowindex).insertCell()
		
			var tempSrc="";	
			var tempTitle="";
			
			if(UserFlag == "U") 
			{
				tempSrc = "../../../Includes/Images/Icons/Personel.gif"
				tempTitle=UserPersonID
				
			}
			if (UserFlag == "G")
			{
				tempSrc = "../../../Includes/Images/Icons/PGroup.gif"
				tempTitle="'ê—ÊÂÌ'"
			}
			oGrid.rows(newrowindex).cells(0).innerHTML="<IMG src="+tempSrc+" title="+tempTitle+"  border='0'>"						
			
			oGrid.rows(newrowindex).insertCell()
			oGrid.rows(newrowindex).cells(1).innerHTML="<DIV style='DISPLAY: inline; HEIGHT: 15px' ms_positioning='FlowLayout' title='"+Username+"'>"+SUsername+"</DIV>"
			
			
			oGrid.rows(newrowindex).align="center"
			oGrid.rows(newrowindex).cells(0).style.width="20px"
			oGrid.rows(newrowindex).cells(1).style.width="200px"
			
			newrowindex=newrowindex+1
				
		}
		////______________________________________________________________________________
		function pageLoad()
		{
			if (Form1.txtAlertSave.value=="" && Form1.txtDelAlert.value=="")
			{
				///==========================
				SetBorderWidthGrid(GrdTypeCredit)
				var j;
				for(j=0;j<GrdTypeCredit.rows.length;++j)
					if (GrdTypeCredit.rows(j).cells(0).firstChild.style.visibility=="hidden")
							GrdTypeCredit.rows(j).style.display="none"
				RestoreStyle(GrdTypeCredit)
				///==========================
			}
			///========================================
			if (Form1.txtGrdTypeCreditORow.value!="")
			{
				
				var oRow=parseInt(Form1.txtGrdTypeCreditORow.value)
				Form1.txtTypeCreditID.value=GrdTypeCredit.rows(oRow).Val
				
				bindGrdValidUser()
			}
			if (Form1.txtAlertSave.value=="1")
			{
				Form1.txtAlertSave.value=""
				//===============
				var k=0;
				k=parseInt(Form1.txtLastSelectedRow.value)
				GrdTypeCredit.rows(k).className="CssSelectedItemStyle";
				//===============
				alert("–ŒÌ—Â ‘œ.")
			}
			///-----------------
				if (Form1.txtDelAlert.value=="1")
			{
				Form1.txtDelAlert.value=""
				alert("Õ–› ‘œ.")
			}
		}
		
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 693px; HEIGHT: 393px" height="393" cellSpacing="1"
										cellPadding="1" width="693" border="0" DESIGNTIMEDRAGDROP="14">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 280px" vAlign="top" align="center">
												<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR>
														<TD align="center"><cc1:automationgrid id="GrdTypeCredit" dir="rtl" runat="server" Height="294px" SelectRowOnMouseMove="False"
																SelectRowOnClick="False" HtcAddress=" " ClientPageSize="0" SendXML="DoNotSend" CreateClientSideScripts="False"
																ClientSorting="False" EnableClientPager="False" Scrolling="True" UsingKeyBoard="False" ShowHeader="False" AutoGenerateColumns="False"
																name="grdNumResult" Width="331px"><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle" HorizontalAlign="Center"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:TEMPLATECOLUMN>
																		<HEADERSTYLE Width="30px"></HEADERSTYLE>
																		<ITEMSTYLE Width="30px"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG id="Img1" title="“Ì— „‰Ê" onclick="OnClickSubNode(this)" style= '<%# DataBinder.Eval(Container.DataItem,"MainGroup") %>' height="25" src="../../../Includes/Images/Icons/btnSubNodes.gif"
																				width="30" align="middle" border="0" runat="server">
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰Ê⁄ òœ" DataField="GrpName">
																		<HEADERSTYLE Width="150px"></HEADERSTYLE>
																		<ITEMSTYLE Width="150px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰«„ òœ" DataField="Title">
																		<HEADERSTYLE Width="200px"></HEADERSTYLE>
																		<ITEMSTYLE Width="200px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Val" DataField="Val" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid></TD>
														<TD vAlign="top" align="center">
															<TABLE id="GrdValidUser_Header" style="BORDER-RIGHT: #6666cc thin inset; BORDER-TOP: #6666cc thin solid; BORDER-LEFT: #6666cc thin outset; WIDTH: 212px; BORDER-BOTTOM: #6666cc thin solid; HEIGHT: 29px"
																cellSpacing="1" cellPadding="1" width="212" border="0">
																<TR>
																	<TD style="WIDTH: 20px; BACKGROUND-COLOR: #83afe5" align="center">‰Ê⁄</TD>
																	<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 200px; BACKGROUND-COLOR: #83afe5"
																		align="center">‰«„</TD>
																</TR>
															</TABLE>
															<DIV style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 66.03%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 219px">
																<TABLE id="GrdValidUser" onclick="onClickGrdValidUser(this)">
																	<THEAD style="DISPLAY: none">
																	</THEAD>
																</TABLE>
															</DIV>
															<TABLE id="Table2" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 313px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 38px"
																cellSpacing="1" cellPadding="1" width="313" border="0">
																<TR>
																	<TD style="WIDTH: 179px"><INPUT id="chkPerson" type="radio" CHECKED value="Radio1" name="Group" runat="server">Å—”‰· 
																		ÃœÌœ&nbsp; <INPUT id="chkGroup" type="radio" value="Radio1" name="Group" runat="server">ê—ÊÂ 
																		ÃœÌœ</TD>
																	<TD id="PersonIDTD" style="COLOR: #ff0000" runat="server"><INPUT class="btnSelectPerson" id="BtnSelectPerson" style="WIDTH: 125px; HEIGHT: 30px"
																			onclick="onClickBtnSelectPerson()" type="button" name="BtnSelectPerson"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 51.51%; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table3" style="WIDTH: 130px; HEIGHT: 42px" cellSpacing="3" cellPadding="2" width="130"
													border="0">
													<TR>
														<TD style="WIDTH: 114px"><INPUT class="CssBtnSave" id="BtnSave" title="–ŒÌ—Â" style="WIDTH: 67px; HEIGHT: 32px"
																onclick="OnClickBtnSave()" type="button" name="BtnSave"></TD>
														<TD style="WIDTH: 90px"><INPUT class="CssBtnDelete" id="BtnDel" title="«‰’—«›" style="WIDTH: 67px; HEIGHT: 32px"
																onclick="OnClickBtnDel()" type="button" name="BtnDel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<TR>
					</TD></TR>
				<TR>
					<TD style="DISPLAY: none">
						<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <input id="txtTypeCreditID" type="text" name="txtTypeCreditID" runat="server">
						<input id="txtValidUserXml" type="text" name="txtValidUserXml" runat="server"> <input id="SelectedMamber" type="text" name="SelectedMamber" runat="server">
						<input id="tSelectedMamber" type="text" name="tSelectedMamber" runat="server"> <input id="txtTempValidUserXml" type="text" name="txtTempValidUserXml" runat="server">
						<input id="txtSubmit" type="text" name="txtSubmit" runat="server"> <input id="txtXmlSave" type="text" name="txtXmlSave" runat="server">
						<input id="txtAlertSave" type="text" name="txtAlertSave" runat="server"> <input id="txtDelAlert" type="text" name="txtDelAlert" runat="server">
						<input id="txtValidUserID" type="text" name="txtValidUserID" runat="server"> <input id="txtORow" type="text" name="txtORow" runat="server">
						<input id="txtGrdTypeCreditORow" type="text" name="txtGrdTypeCreditORow" runat="server">
						<input id="txtLastSelectedRow" type="text" name="txtLastSelectedRow" runat="server">
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity></TD>
				</TR>
			</table>
		</form>
	</body>
</HTML>
