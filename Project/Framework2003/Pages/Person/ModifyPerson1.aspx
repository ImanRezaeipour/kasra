<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ModifyPerson1.aspx.vb" Inherits="FrameWork.ModifyPerson1" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="Calendar/TextDate.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>ModifyPerson</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="General.js"></script>
		<script language="javascript">
		function LoadForm()
        {
			document.all.item('body').scroll="no"
			if(Form1.txtAlert.value!='')
			{
				alert(Form1.txtAlert.value)
				Form1.txtAlert.value=''
				OnClickBtnNew()
			}	
			var grdName='<%=request("grdName")%>'
			var strCells='<%=request("strCells")%>'
			var strType='<%=request("strType")%>'
			onLoadGrdHeaderForSort(grdName,strCells,strType)		
        }
        ///////////////////////////////////////////////////////////////////////////////////////
		function grdPersonOnClick(SelectedRow)
		{  
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length)
			{ 
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = SelectedRow.rowIndex
			SelectedRow.style.backgroundColor = '#FFD599'
			Form1.PersonId.value=SelectedRow.cells(0).innerText
			LoadData()
		}
        ///////////////////////////////////////////////////////////////////////////////////////
		function LoadData()
		{	     
			var xmlDoc
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(document.all.item("XMLPersonInfo").value);
			//xmlDoc.setProperty("SelectionLanguage", "XPath");

			var XMLNodes
			XMLNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/PersonInfo [PersonId="+Form1.PersonId.value+"]");
			 
			Form1.FatherName.value = XMLNodes.item(0).selectSingleNode('FatherName').text
			Form1.FirstName.value = XMLNodes.item(0).selectSingleNode('FirstName').text
			Form1.LastName.value = XMLNodes.item(0).selectSingleNode('LastName').text
			if(XMLNodes.item(0).selectSingleNode('Sex').text=='2' )
				Form1.optMan.checked = true
			else
				Form1.optWoman.checked = true
			Form1.selMarriage.value = XMLNodes.item(0).selectSingleNode('Marriage').text
			var BD
			BD=XMLNodes.item(0).selectSingleNode('BirthDate').text
			Form1.BirthDate_txtDay.value = BD.substr(0,2)
			Form1.BirthDate_txtMonth.value = BD.substr(3,2)
			Form1.BirthDate_txtYear.value = BD.substr(6,4)
			Form1.PersonId.readOnly=true
			Form1.PersonId.style.backgroundColor='lightGrey'
		}
        ///////////////////////////////////////////////////////////////////////
		 function OnClickBtnNew()
		 { 
			Form1.PersonId.value = ""
			Form1.PersonId.readOnly=false
			Form1.PersonId.style.backgroundColor=''
			Form1.LastName.value = "" 
			Form1.FirstName.value = ""
			Form1.FatherName.value = ""
			Form1.selMarriage.value = 0
			Form1.optMan.checked = true
			Form1.optWoman.checked = false
			Form1.BirthDate_txtDay.value = ''
			Form1.BirthDate_txtMonth.value = ''
			Form1.BirthDate_txtYear.value = ''
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length )
			{ 
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = ''
		 }
		 //////////////////////////////////////////////////////////
		 function onClickBtnSave() 
		 { 
   		    Form1.xmlText.value=''
		    if( Form1.PersonId.value == '' || Form1.LastName.value == '')
		    {
		        alert("·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ")
		        return
		    }
		    var BD
			BD=Form1.BirthDate_txtYear.value+'/'+Form1.BirthDate_txtMonth.value+'/'+Form1.BirthDate_txtDay.value 
			if(BD>=Form1.CurDate.value)
			{
				alert('”«·  Ê·œ „⁄ »— ‰Ì” ')
				return
			}
		    //œ«œÂ Â«Ì  ò—«—Ì —« çò „Ìò‰œ      
		    var xmlDoc
		    xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(document.all.item("XMLPersonInfo").value);
			
			var XMLNodes
			XMLNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/PersonInfo [PersonId="+Form1.PersonId.value+"]");
		    if(XMLNodes.length>0 & Form1.LastSelectedgrdPerson.value == '')
		    {
		        if (confirm(" ‘Œ’Ì »« «Ì‰ ‘„«—Â Å—”‰·Ì ÊÃÊœ œ«—œ «Ì« „Ì ŒÊ«ÂÌœ Ã«Ìê“Ì‰ ‘Êœ"))
					MakeXml()
			}
			else
				MakeXml()
			 if(Form1.xmlText.value!='')
			 {
				Form1.txtSumbit.value = "save"
				Form1.submit()
		     }					
		}
		 //////////////////////////////////////////////////////////
		 function MakeXml()
		 {
		    var sex
		    if(Form1.optMan.checked)
		      sex = 2
		    else
		      sex = 1
		    var BD
			BD=Form1.BirthDate_txtDay.value+'/'+Form1.BirthDate_txtMonth.value+'/'+Form1.BirthDate_txtYear.value 
			if (BD=='//')
				BD=''
				
		    var strXMLPerson = '<PersonEntity><PersonInfo>'  
		    strXMLPerson += '<PersonId>'+Form1.PersonId.value+'</PersonId>'
		    strXMLPerson += '<LastName>'+Form1.LastName.value+'</LastName>'
		    strXMLPerson += '<FirstName>'+Form1.FirstName.value+'</FirstName>'
		    strXMLPerson += '<FatherName>'+Form1.FatherName.value+'</FatherName>'
		    strXMLPerson += '<Sex>'+sex+'</Sex>'
		    strXMLPerson += '<Marriage>'+document.all.item("selMarriage").value+'</Marriage>'
		    strXMLPerson += '<BirthDate>'+BD+'</BirthDate>'
		    strXMLPerson += '</PersonInfo></PersonEntity>'
		    Form1.xmlText.value = strXMLPerson
		 }
		////////////////////////////////////////////////////////////////////////////////
		function onClickBtnDelete()
		{  
		      if( Form1.PersonId.value=='' )
		          alert("ÂÌç ¬Ì „ »—«Ì Õ–› «‰ Œ«» ‰‘œÂ «” .")
		      else
		      {
				Form1.txtSumbit.value = "delate"
				Form1.submit()
		      }
		}
		///////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" dir="ltr" onclick="onclickBodyForSort('ModifyPerson1.aspx','grdPerson')"
		bottomMargin="0" leftMargin="0" topMargin="0" scroll="yes" onload="LoadForm()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				align="center" border="0">
				<TR>
					<TD>
						<TABLE class="CssLayer2" id="Table2" height="98%" cellSpacing="1" cellPadding="1" width="98%"
							align="center" border="0">
							<TR>
								<TD align="center">
									<p>&nbsp;</p>
									<TABLE class="CssPage" id="Page" style="WIDTH: 591px; HEIGHT: 557px" height="557" cellSpacing="0"
										cellPadding="0" width="591" align="center" border="2">
										<TR>
											<TD id="DownRow" style="DISPLAY: inline" vAlign="top" align="center" height="352">
												<TABLE id="Table6" style="WIDTH: 584px; HEIGHT: 461px" height="461" cellSpacing="2" cellPadding="2"
													width="584" align="right" border="0">
													<TR>
														<TD style="HEIGHT: 33px" vAlign="top" align="center" height="33">
															<TABLE id="Table11" style="WIDTH: 575px; HEIGHT: 8px" cellSpacing="1" cellPadding="1" width="575"
																align="right" border="0">
																<TR>
																	<TD style="DISPLAY: none"><INPUT id="XMLPersonInfo" style="WIDTH: 491px; HEIGHT: 22px" type="text" size="76" name="XMLPersonInfo"
																			runat="server"></TD>
																	<TD style="WIDTH: 58px"><INPUT class="CssBtnShow" id="btnShow" dir="rtl" type="button" name="btnSearch" runat="server">
																	</TD>
																	<TD style="WIDTH: 82px"><INPUT class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="WIDTH: 99px; HEIGHT: 32px"
																			type="button" name="btnSearch" runat="server"></TD>
																	<TD dir="rtl" style="WIDTH: 75px"><INPUT class="TxtControls" id="fFullName" style="WIDTH: 120px; HEIGHT: 22px" type="text"
																			size="14" name="fFullName" runat="server">
																	</TD>
																	<TD>‰«„ Œ«‰Ê«œêÌ Ê ‰«„</TD>
																	<TD dir="rtl" style="WIDTH: 34px"><INPUT class="TxtControls" id="fPersonId" onkeydown="OnKeyDownNum('integer',this.value)"
																			style="WIDTH: 100px; HEIGHT: 22px" type="text" size="20" name="fPersonId" runat="server"></TD>
																	<TD>‘„«—Â Å—”‰·Ì</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														&nbsp;
														<TD dir="ltr" style="HEIGHT: 340px" vAlign="top" align="center" height="340">
															<P><cc1:automationgrid id="grdPerson" dir="rtl" runat="server" Width="310px" CssClass="CssBackColor" Height="336px"
																	SelectRowOnClick="False" AutoGenerateColumns="False" SendXML="DoNotSend" ClientPageSize="0" Scrolling="True"
																	EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False"
																	CreateClientSideScripts="False" ClientSorting="True" HtcAddress=" ">
																	<ItemStyle CssClass="CssItemStyle"></ItemStyle>
																	<HeaderStyle CssClass="CssHeaderStyle"></HeaderStyle>
																	<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
																	<FooterStyle CssClass="CssFooterStyle"></FooterStyle>
																	<Columns>
																		<asp:BoundColumn DataField="PersonId" HeaderText="‘„«—Â Å—”‰·Ì">
																			<HeaderStyle Width="100px"></HeaderStyle>
																			<ItemStyle Width="100px"></ItemStyle>
																		</asp:BoundColumn>
																		<asp:BoundColumn Visible="False" DataField="FirstName" HeaderText="‰«„">
																			<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
																			<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
																		</asp:BoundColumn>
																		<asp:BoundColumn DataField="LastName" HeaderText="‰«„ Œ«‰Ê«œêÌ ">
																			<HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
																			<ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
																		</asp:BoundColumn>
																	</Columns>
																	<EditItemStyle CssClass="CssEditItemStyle "></EditItemStyle>
																	<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
																</cc1:automationgrid></P>
														</TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 88px" vAlign="top" align="center" height="88">
															<HR class="CssHorizontalLine" style="WIDTH: 94.61%; HEIGHT: 2px" width="94.61%" SIZE="2">
															<TABLE id="Table13" dir="ltr" style="WIDTH: 474px; HEIGHT: 56px" cellSpacing="1" cellPadding="1"
																width="474" border="0">
																<TR>
																	<TD></TD>
																	<TD style="WIDTH: 67px"></TD>
																	<TD dir="rtl" style="WIDTH: 162px" align="right"><INPUT class="TxtControls" id="PersonId" onkeydown="OnKeyDownNum('integer',this.value)"
																			style="WIDTH: 150px" type="text" size="16" name="PersonId" runat="server"></TD>
																	<TD align="right">‘„«—Â Å—”‰·Ì</TD>
																</TR>
																<TR>
																	<TD dir="rtl" align="right"><INPUT class="TxtControls" id="LastName" style="WIDTH: 150px" type="text" size="16" name="Text1"
																			runat="server"></TD>
																	<TD style="WIDTH: 67px" align="right">‰«„ Œ«‰Ê«œêÌ</TD>
																	<TD dir="rtl" style="WIDTH: 162px" align="right"><INPUT class="TxtControls" id="FirstName" style="WIDTH: 150px" type="text" size="16" name="FirstName"
																			runat="server"></TD>
																	<TD align="right">‰«„</TD>
																</TR>
																<TR>
																	<TD dir="rtl" style="HEIGHT: 16px" align="right"><cc1:lcombo id="selMarriage" runat="server" Width="150px" CssClass="TxtControls" ConnectionName="GenCnn"
																			LookupName="Marriage"></cc1:lcombo></TD>
																	<TD style="WIDTH: 67px; HEIGHT: 16px" align="right">Ê÷⁄Ì   √Â·</TD>
																	<TD dir="rtl" style="WIDTH: 162px; HEIGHT: 16px" align="right"><INPUT class="TxtControls" id="FatherName" style="WIDTH: 150px" type="text" size="16" name="FatherName"></TD>
																	<TD style="HEIGHT: 16px" align="right">‰«„ Åœ—</TD>
																</TR>
																<TR>
																	<TD dir="rtl" align="right"><uc1:textdate id="BirthDate" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 67px" align="right"> «—ÌŒ  Ê·œ</TD>
																	<TD style="WIDTH: 162px" align="right">„–ò—<INPUT id="optWoman" type="radio" value="optWoman" name="sex">„Ê‰À<INPUT id="optMan" type="radio" value="optMan" name="sex"></TD>
																	<TD align="right">Ã‰”Ì </TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="top" align="center" height="60%">
															<HR class="CssHorizontalLine" style="WIDTH: 94.61%; HEIGHT: 2px" width="94.61%" SIZE="2">
															<TABLE id="Table10" cellSpacing="1" cellPadding="1" width="120" border="0">
																<TR>
																	<TD style="WIDTH: 312px"><INPUT class="CssBtnDelete" id="btnDelet" onclick="onClickBtnDelete()" type="button" name="btnDelete"></TD>
																	<TD><INPUT class="CssBtnSave" id="btnSave" onclick="onClickBtnSave()" type="button" name="btnSave">
																	</TD>
																	<TD><INPUT class="CssBtnNew" id="btnNew" onclick="OnClickBtnNew()" type="button" name="btnNew"></TD>
																	<TD style="DISPLAY: none"><INPUT id="txtSumbit" type="text" name="txtSumbit" runat="server">
																		<INPUT id="xmlText" type="text" name="xmlText" runat="server"> <INPUT id="LastSelectedgrdPerson" type="text" size="17" name="LastSelectedgrdPerson">
																		<INPUT id="txtAlert" type="text" name="txtAlert" runat="server"> <INPUT id="CurDate" type="text" name="CurDate" runat="server">
																		<INPUT id="OrderField1" type="text" name="OrderField1" runat="server">
																	</TD>
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
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
