<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OrganizationChart.aspx.vb"
    Inherits="FrameWork.OrganizationChart" ValidateRequest="false" %>
<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html dir="rtl">
	<head>
		<title>OrganizationChart</title> 
		<!--test-->
		<!--test2-->
		<!--test2-->
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../../Includes/Styles/OrganizationChartStyle.css" type="text/css" rel="stylesheet"/>
		<script src="OrganizationChart.js"></script>
		<script src="../../Includes/Scripts/KeySorting.js"></script>
	</head>
	<body onmousedown="onmousedowngrdRole()" dir="rtl" ondblclick="ondblclickgrdRole()" bottommargin="0"
		leftmargin="0" topmargin="0" scroll="no" onload="onLoad();GetAccessBtn()" rightmargin="0"
		ms_positioning="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellspacing="0" cellpadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td valign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellspacing="0" cellpadding="0" width="100%"
							border="0">
							<tr>
								<td valign="middle" align="center">
									<table class="CssPage" id="Page" style="WIDTH: 984px; HEIGHT: 462px" height="462" cellspacing="1"
										cellpadding="1" width="984" border="0">
										<tr>
											<td id="TopRow" style="DISPLAY: inline; HEIGHT: 383px" valign="top" align="right">
												<table id="Table1" style="WIDTH: 508px; HEIGHT: 36px" cellspacing="1" cellpadding="1" width="508"
													align="center" border="0">
													<tr>
														<td style="WIDTH: 89px" align="left">
															òœ Å—”‰·Ì
														</td>
														<td style="WIDTH: 81px">
															<input class="TxtControls" id="PersonIdTree" onkeydown="OnKeyDownNum('integer',this.value)"
																onblur="onblurPersonIdTree()" style="WIDTH: 80px; HEIGHT: 23px" size="8" name="PersonIdTree"
																runat="server">
														</td>
														<td style="WIDTH: 135px" align="right">
															<img id="ImgRefresh" style="WIDTH: 18px; DISPLAY: none; HEIGHT: 18px" onclick="onClickImgRefresh()"
																height="18" alt="»Â —Ê“ —”«‰Ì ‰«„" src="../../Images/Icons/u6.gif" width="18" name="ImgRefresh">
															<asp:TextBox ID="txtSearchName" runat="server" Height="23" CssClass="TxtControls"></asp:TextBox>
														</td>
														<td><INPUT style="Z-INDEX: 0; WIDTH: 25px; HEIGHT: 22px; CURSOR: hand" id="btnGrdSearchPerson"
																class="HeaderStyle" onclick="onclickbtnGrdSearchPerson()" value="..." type="button"
																name="btnSearchPerson" dir="rtl"></td>
														<td>
															<input class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="WIDTH: 99px; HEIGHT: 32px"
																onclick="btnSearchOnClick()" type="button" name="btnSearch"><input class="CssBtnShow" id="btnShow" style="WIDTH: 70px; HEIGHT: 32px" onclick="btnShowOnClick()"
																type="button" name="btnShow">
														</td>
													</tr>
												</table>
												<hr style="WIDTH: 99.68%; HEIGHT: 2px; COLOR: #ccccff" align="center">
												<table id="Table2" style="WIDTH: 975px; HEIGHT: 506px" cellspacing="1" cellpadding="1"
													width="975" border="0">
													<tr>
														<td style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 173px; HEIGHT: 388px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"
															valign="top" align="right">
															<table>
																<tr>
																	<td align="left">
																		<img id="ImgDepartmentFilter" title="›Ì· — Ê«Õœ ”«“„«‰Ì" onclick="onClickImgDepartmentFilter()"
																			src="/TA/Includes/Images/Icons/PairCard.jpg" border="0" name="ImgDepartmentFilter">
																	</td>
																</tr>
																<tr>
																	<td>
																		<div id="DivTree" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 198px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 542px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
																			runat="server">
																			<cc1:tree id="TreeLevel" runat="server" Height="144px" Width="129px"></cc1:tree></div>
																	</td>
																</tr>
															</table>
														</td>
														<td valign="top" align="right">
															<table id="Table3" style="WIDTH: 764px; HEIGHT: 26px" cellspacing="1" cellpadding="1" width="764"
																border="0">
																<tr>
																	<td style="WIDTH: 25px">
																		‰Ê⁄
																	</td>
																	<td style="WIDTH: 106px">
																		<cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbDepartmentType" runat="server" CssClass="TxtControls"
																			Width="96px" LookupName="DepartmentType"></cc1:lcombo>
																	</td>
																	<td style="WIDTH: 47px">
																		‰«„ Ê«Õœ
																	</td>
																	<td style="WIDTH: 181px">
																		<input class="TxtControls" id="DepartmentName" style="WIDTH: 175px; HEIGHT: 20px" size="23"
																			name="DepartmentName" runat="server">
																	</td>
																	<td style="WIDTH: 86px">
																		òœ Ê«Õœ ”«“„«‰Ì
																	</td>
																	<td style="WIDTH: 73px">
																		<input class="txtControls" id="txtDepartmentCode" onkeydown="OnKeyDownNum('integer',this.value)"
																			style="WIDTH: 71px; HEIGHT: 20px" size="6" name="txtDepartmentCode" runat="server">
																	</td>
																	<td style="WIDTH: 63px">
																		Ê«Õœ „«›Êﬁ
																	</td>
																	<td id="TDParentName">
																	</td>
																</tr>
															</table>
															<hr style="WIDTH: 99.09%; HEIGHT: 2px; COLOR: #ccccff" align="center">
															<table id="Table4" style="WIDTH: 763px; HEIGHT: 378px" cellspacing="1" cellpadding="1"
																width="763" border="0">
																<tr>
																	<td style="WIDTH: 420px; HEIGHT: 2px" valign="top" align="right">
																		<table id="Table8" style="WIDTH: 328px; HEIGHT: 29px" cellspacing="1" cellpadding="1" width="328"
																			align="right" border="0">
																			<tr>
																				<td>
																					”„ 
																				</td>
																				<td style="WIDTH: 64px">
																					<cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbRoleType" runat="server" Height="46px"
																						CssClass="TxtControls" Width="100px" LookupName="OrganizationalRole"></cc1:lcombo>
																				</td>
																				<td style="WIDTH: 42px">
																					⁄‰Ê«‰
																				</td>
																				<td style="WIDTH: 138px">
																					<input class="txtControls" id="RoleName" style="WIDTH: 111px; HEIGHT: 88%" size="13" name="RoleName"
																						runat="server">
																				</td>
																				<td style="WIDTH: 30px">
																					 ⁄œ«œ
																				</td>
																				<td>
																					<input class="TxtControls" id="txtCount" onkeydown="OnKeyDownNum('integer',this.value)"
																						style="WIDTH: 44px; HEIGHT: 88%" size="2" name="txtCount" runat="server">
																				</td>
																				<td>
																					<input class="CssBtnTarefeMojadad" id="btnNewRole" title="Å”  ”«“„«‰Ì ÃœÌœ" style="WIDTH: 25px;
                                                                                HEIGHT: 25px" onclick="onclickbtnNewRole()" type="button" name="btnNewRole">
																				</td>
																				<td>
																					<input class="CssbtnDown" id="btnAddToGrdRole" title="«÷«›Â »Â ê—Ìœ Å”  ”«“„«‰Ì" style="WIDTH: 25px; HEIGHT: 25px"
																						onclick="onclickbtnAddToGrdRole()" type="button" name="btnAddToGrdRole">
																				</td>
																			</tr>
																		</table>
																	</td>
																	<td style="HEIGHT: 2px" valign="top" align="right">
																		<input id="ChkSelectedPerson" onclick="OnClickChkAllSelected(this,grdPerson)" type="checkbox"
																			name="ChkSelectedPerson">‰„«Ì‘ «‰ Œ«» ‘œÂ 
																		Â«&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="HeaderStyle" id="btnShowAllPerson" style="WIDTH: 25px; HEIGHT: 23px; CURSOR: hand"
																			onclick="onClickBtnShowAllPerson()" type="button" value="..." name="btnShowAllPerson">&nbsp;‰„«Ì‘ 
																		Å—”‰·<input class="HeaderStyle" style="WIDTH: 25px; DISPLAY: none; HEIGHT: 23px; CURSOR: hand"
																			type="button" value="..." name="btnShowAllPerson">
																	</td>
																</tr>
																<tr>
																	<td style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 420px; SCROLLBAR-BASE-COLOR: #b0c4de; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: hidden">
																		<cc1:automationgrid id="grdRole" runat="server" Height="322px" Width="392px" AutoGenerateColumns="False"
																			SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
																			ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
																			ClientSorting="False" HtcAddress=" ">
																			<ITEMSTYLE cssclass="CssItemStyle"></ITEMSTYLE>
																			<HEADERSTYLE cssclass="CssHeaderStyle" verticalalign="Middle" horizontalalign="Center"></HEADERSTYLE>
																			<ALTERNATINGITEMSTYLE cssclass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																			<FOOTERSTYLE cssclass="CssEditItemStyle "></FOOTERSTYLE>
																			<SELECTEDITEMSTYLE cssclass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																			<COLUMNS>
																				<ASP:TEMPLATECOLUMN>
																					<HEADERSTYLE Width="5px"></HEADERSTYLE>
																					<ITEMSTYLE Width="5px" HorizontalAlign="Center"></ITEMSTYLE>
																					<HEADERTEMPLATE>
																						<INPUT id="AllRole" onclick="ManageChecks(this,grdRole)" type="checkbox" runat="server">
																					</HEADERTEMPLATE>
																					<ITEMTEMPLATE>
																						<INPUT id=ChkRole 
                              onclick=ChkRoleOnClick(this) type=checkbox 
                              runat="server" 
                              RoleID='<%#DataBinder.Eval(Container.DataItem,"RoleID")%>'>
																					</ITEMTEMPLATE>
																				</ASP:TEMPLATECOLUMN>
																				<ASP:BOUNDCOLUMN HeaderText="‰Ê⁄" DataField="RoleTypeTitle">
																					<HEADERSTYLE Width="100px"></HEADERSTYLE>
																					<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:BOUNDCOLUMN HeaderText="‰«„ Å”  ”«“„«‰Ì" DataField="Title">
																					<HEADERSTYLE Width="200px"></HEADERSTYLE>
																					<ITEMSTYLE Width="200px" HorizontalAlign="Center"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:BOUNDCOLUMN DataField="RoleID" Visible="False">
																					<HEADERSTYLE Width="1px"></HEADERSTYLE>
																					<ITEMSTYLE Width="1px"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:BOUNDCOLUMN DataField="RoleType" Visible="False">
																					<HEADERSTYLE Width="1px"></HEADERSTYLE>
																					<ITEMSTYLE Width="1px"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:TEMPLATECOLUMN>
																					<HEADERSTYLE Width="5px"></HEADERSTYLE>
																					<ITEMSTYLE Width="5px"></ITEMSTYLE>
																					<ITEMTEMPLATE>
																						<INPUT id="Checkbox1" onclick="chkGrdRolePersonIDOnClick(this,grdRole)" type="checkbox"
																							name="Checkbox1" runat="server">
																					</ITEMTEMPLATE>
																				</ASP:TEMPLATECOLUMN>
																				<ASP:TEMPLATECOLUMN HeaderText="‘„«—Â Å—”‰·Ì">
																					<HEADERSTYLE Width="80px"></HEADERSTYLE>
																					<ITEMSTYLE Width="80px"></ITEMSTYLE>
																					<ITEMTEMPLATE>
																						<asp:Label style="COLOR: blue; CURSOR: hand; TEXT-DECORATION: underline" dir=ltr id=Label3 runat="server" NAME="Label3" Text='<%# DataBinder.Eval(Container, "DataItem.PersonID") %>'>
																						</asp:Label>
																					</ITEMTEMPLATE>
																				</ASP:TEMPLATECOLUMN>
																			</COLUMNS>
																		</cc1:automationgrid>
																	</td>
																	<td style="SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: hidden">
																		<cc1:automationgrid id="grdPerson" runat="server" Height="323px" Width="286px" AutoGenerateColumns="False"
																			SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
																			ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
																			ClientSorting="False" HtcAddress=" ">
																			<ITEMSTYLE cssclass="CssItemStyle"></ITEMSTYLE>
																			<HEADERSTYLE cssclass="CssHeaderStyle" verticalalign="Middle" horizontalalign="Center"></HEADERSTYLE>
																			<ALTERNATINGITEMSTYLE cssclass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																			<FOOTERSTYLE cssclass="CssEditItemStyle "></FOOTERSTYLE>
																			<SELECTEDITEMSTYLE cssclass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																			<COLUMNS>
																				<ASP:TEMPLATECOLUMN>
																					<HEADERSTYLE Width="5px"></HEADERSTYLE>
																					<ITEMSTYLE Width="5px" HorizontalAlign="Center"></ITEMSTYLE>
																					<HEADERTEMPLATE>
																						<INPUT id="AllPerson" onclick="ManageChecks(this,grdPerson)" type="checkbox" runat="server">
																					</HEADERTEMPLATE>
																					<ITEMTEMPLATE>
																						<INPUT id=ChkPerson 
                              onclick=ChkPersonOnClick(this,grdPerson) 
                              type=checkbox runat="server" 
                              PersonId='<%#DataBinder.Eval(Container.DataItem,"PersonId")%>'>
																					</ITEMTEMPLATE>
																				</ASP:TEMPLATECOLUMN>
																				<ASP:BOUNDCOLUMN HeaderText="òœ Å—”‰·Ì" DataField="PersonId">
																					<HEADERSTYLE Width="80px"></HEADERSTYLE>
																					<ITEMSTYLE Width="80px"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:BOUNDCOLUMN HeaderText="‰«„ Ê ‰«„ Œ«‰Ê«œêÌ" DataField="Family">
																					<HEADERSTYLE Width="200px"></HEADERSTYLE>
																					<ITEMSTYLE Width="200px"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																				<ASP:BOUNDCOLUMN HeaderText="RoleId" DataField="RoleId" Visible="False">
																					<HEADERSTYLE Width="1px"></HEADERSTYLE>
																					<ITEMSTYLE Width="1px"></ITEMSTYLE>
																				</ASP:BOUNDCOLUMN>
																			</COLUMNS>
																		</cc1:automationgrid>
																	</td>
																</tr>
															</table>
															<hr style="WIDTH: 99.86%; HEIGHT: 2px; COLOR: #ccccff" align="center">
															<table id="Table5" style="WIDTH: 42px; HEIGHT: 38px" align="center" border="0">
																<tr>
																	<td width="33%">
																		<input class="CssbtnNew" id="btnNew" style="CURSOR: default" onclick="onclickbtnNew()"
																			type="button" name="btnNew">
																	</td>
																	<td width="33%">
																		<input class="CssbtnSave" id="btnSave" style="CURSOR: default" onclick="onclickbtnSave()"
																			type="button" name="btnSave">
																	</td>
																	<td width="33%">
																		<input class="CssbtnDelete" id="btnDelete" style="CURSOR: default" onclick="onclickbtnDelete()"
																			type="button" name="btnDelete">
																	</td>
																	<td width="33%">
																		<input class="CssBtnPrint" id="BtnPrint" title="·Ì”  «›—«œ »œÊ‰ ”„ " style="CURSOR: hand"
																			onclick="OnClickBtnPrint()" type="button" name="BtnPrint">
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none">
						<input id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server">
						<input id="txtSessionID" runat="server"> <input id="txtAccessBtn" name="txtAccessBtn" runat="server">
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity><input id="DepartmentId" name="DepartmentId" runat="server">
						<input id="SearchDeptID" name="SearchDeptID" runat="server"><input id="parent" style="WIDTH: 1px" type="hidden" name="parent">
						<input id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
						<input id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
						<input id="recID" style="WIDTH: 1px" type="hidden" size="1" name="recID"> <input id="PageName" style="WIDTH: 1px" type="hidden" size="1" value="OrganizationChart"
							name="PageName"> <input id="RoleId" style="WIDTH: 1px; DISPLAY: none" name="RoleId">
						<input id="txtSubmit" name="txtSubmit" runat="server"> <input id="XMLDepartment" size="42" name="XMLDepartment" runat="server">
						<input id="MaxRoleId" name="MaxRoleId" runat="server"> <input id="txtTempPersonID" name="txtTempPersonID" runat="server">
						<input id="MaxDepartmentId" name="MaxDepartmentId" runat="server"> <input id="FlagLimit" name="FlagLimit" runat="server">
						<input id="SelectedMamber" name="SelectedMamber" runat="server"> <input id="SelectRoleGrdID" name="SelectRoleGrdID" runat="server">
						<input id="txtTreeDepartmentType" name="txtTreeDepartmentType" runat="server"><input id="txtRefreshRoleID" name="txtRefreshRoleID" runat="server">
						<input id="txtIntvalDepartmentType" name="ttxtIntvalDepartmentType" runat="server">
						<input id="RptFlag" name="RptFlag" runat="server"> <input id="txtRefreshDepartmentID" name="txtRefreshDepartmentID" runat="server"><input id="txtXmlDepartmentId" name="txtXmlDepartmentId" runat="server">
						<input id="txtXmlTree" name="txtXmlTree" runat="server"><input id="XMLDefTemplate" name="XMLDefTemplate" runat="server">
						<input id="txtHasFlow" name="txtHasFlow" runat="server"><input id="txtMsg" name="txtMsg" runat="server">
						<input id="XMLChDept" name="XMLChDept" runat="server"><input id="XMLRoles" name="XMLRoles" runat="server">
						<input id="txtXmlPerson" name="txtXmlPerson" runat="server"> <input id="txtDepartmentParentId" name="txtDepartmentParentId" runat="server">
					</td>
				<tr>
				</tr>
			</table>
		</form>
		<script language="javascript">
        /*<body onmousedown="onmousedowngrdRole()" dir="rtl" ondblclick="ondblclickgrdRole()" bottomMargin="0"
        leftMargin="0" topMargin="0" scroll="no" onload="onLoad();GetAccessBtn()" rightMargin="0"
        */

        var LastSelectedRowgrdRole = null, LastSelectedRowClassgrdRole = "", FlagEditRole = false, LastActiveNode = 0, oReqHttp, oRequst = new ActiveXObject("Microsoft.XMLHTTP"), AjaxMode = 0
        //----------------
        function onclickbtnGrdSearchPerson(){
        //" &MenuItemID="+Form1.txtMenuItemID.value+
				var url="/TA/TAPeresentation/Pages/Person/PersonTab.aspx?flag="+'Report &TypeAccess='+1+'&SessionID='+Form1.txtSessionID.value 
				
				var StrReturn="";
				StrReturn=window.showModalDialog(url,"","dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no")
				if (StrReturn!=""){
					//document.all.item('txtXMLPersonTab').value=StrReturn;
					var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
					xmlDoc.loadXML(StrReturn);
					xmlDoc.setProperty("SelectionLanguage", "XPath");
					var xmlNodes;
					
					xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/Person");
					if (xmlNodes.length!=0){
						var PId;
						PId=xmlNodes.item(0).selectSingleNode('PersonID').text
						Form1.PersonIdTree.value=PId
						Form1.txtSearchName.value=xmlNodes.item(0).selectSingleNode('Family').text
						}
						}
						}
		//*************************************************************
        //---------------
        function onClickImgRefresh() {
            if (Form1.PersonIdTree.value == "")
                return
            oRequst.open("post", "OrganizationChart.aspx?AjaxSend=Ajax &PersonID=" + Form1.PersonIdTree.value, true)
            oRequst.onreadyStateChange = AjaxFunction
            oRequst.send(null)
        }
        function AjaxFunction() {
            if (oRequst.readyState == 4) {
                if (oRequst.status == 200) {
                    var str = new String()
                    var str = oRequst.responseText
                    var ar = str.split('&')
                    document.getElementById("txtSearchName").innerText = ar[0]
                    Form1.DepartmentId.value = ar[1]
                    Form1.SearchDeptID.value = ar[1]
                }
            }
        }
        function onLoad() {
            //alert(Form1.txtMsg.value)
            Form1.XMLDefTemplate.value = "";
            Form1.txtTempPersonID.value = "0";
                        
            if (Form1.txtSubmit.value == "Refresh") {
                Form1.txtSubmit.value = ""
                Cleargrd(grdPerson)
                if (LastActiveNode != 0) {
                    objCollection.item(LastActiveNode).style.backgroundColor = "transparent"
                    objCollection.item(LastActiveNode).style.color = "#663300"
                }
                Form1.DepartmentId.value = Form1.txtRefreshDepartmentID.value
                FlagEditRole = false
                LoadData()
                Form1.FlagLimit.value = true
            }
            else if (Form1.txtSubmit.value == "Print") {
                var ShowafterPrint = 0
                if (Form1.RptFlag.value == 1) {
                    Form1.RptFlag.value = 0
                    window.open("../PersonelWRole2.pdf")
                    Form1.FlagLimit.value = 'True'
                    ShowafterPrint = 1
                }
            }
            Form1.txtSubmit.value = ""
            Form1.SelectedMamber.value='';
            if (Form1.txtMsg.value != "") {
                alert(Form1.txtMsg.value)
                Form1.txtMsg.value = ""
                LoadData()
            }
            else {
                if (Form1.FlagLimit.value == 'True') {
                    LoadData()
                    if (ShowafterPrint == 1) {
                        Form1.FlagLimit.value = 'False'
                        ShowafterPrint = 0
                    }
                    return
                }
                else if (Form1.FlagLimit.value == 'False') {
                    onclickbtnNew()
                    return
                }
            }
            Form1.btnNewRole.disabled = false
            Form1.btnAddToGrdRole.disabled = false
            Form1.btnShowAllPerson.disabled = false
        }
        function onmousedowngrdRole() {
            try {
                if (window.event.srcElement.parentElement.parentElement.parentElement.id != '') {
                    if (window.event.srcElement.parentElement.parentElement.parentElement.id == 'grdRole') {
                        onclickgrdRole(window.event.srcElement.parentElement)
                    }
                }
            } catch (ex) { }
        }
        function GetAccessBtn() {
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(Form1.txtAccessBtn.value)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/OrganizationEntity/SurveyAccess")
            if (xmlNodes.length != 0) {
                if (xmlNodes.item(0).selectSingleNode('BtnNew').text == 1) {
                    Form1.btnNew.disabled = false
                    document.all.item('btnNew').style.cursor = 'hand'
                    Form1.btnSave.disabled = false
                    document.all.item('btnSave').style.cursor = 'hand'
                }
                else if (xmlNodes.item(0).selectSingleNode('BtnNew').text == 2) {
                    Form1.btnNew.disabled = true
                    document.all.item('btnNew').style.cursor = 'default'
                    Form1.btnSave.disabled = true
                    document.all.item('btnSave').style.cursor = 'default'
                }
                if (xmlNodes.item(0).selectSingleNode('BtnEdit').text == 1 && xmlNodes.item(0).selectSingleNode('BtnNew').text == 2) {
                    Form1.btnSave.disabled = false
                    document.all.item('btnSave').style.cursor = 'hand'
                }
                else if (xmlNodes.item(0).selectSingleNode('BtnEdit').text == 2 && xmlNodes.item(0).selectSingleNode('BtnNew').text == 2) {
                    Form1.btnSave.disabled = true
                    document.all.item('btnSave').style.cursor = 'default'
                }
                if (xmlNodes.item(0).selectSingleNode('BtnDel').text == 1) {
                    Form1.btnDelete.disabled = false
                    document.all.item('btnDelete').style.cursor = 'hand'
                }
                else if (xmlNodes.item(0).selectSingleNode('BtnDel').text == 2) {
                    Form1.btnDelete.disabled = true
                    document.all.item('btnDelete').style.cursor = 'default'
                }
            }
        }
        function onblurPersonIdTree() {
            onClickImgRefresh()
        }
        function btnSearchOnClick() {
            if (Form1.txtSearchName.value != '') {
                Form1.DepartmentId.value = Form1.SearchDeptID.value
                Form1.txtSubmit.value = "Search"
                Form1.submit()
            }
            else alert('Û‘„«—Â Å—”‰·Ì ‰«„⁄ »— «” ')
        }
        function btnShowOnClick() {
            Form1.txtSubmit.value = "Show"
            Form1.submit()
        }
        function Cleargrd(obj) {
			
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
           
        }
        function onclickbtnNewRole() {
            FlagEditRole = false
            Form1.RoleId.value = "0"
            Form1.cmbRoleType.value = "0"
            Form1.RoleName.value = ""
            Form1.txtCount.value = ""
            Form1.txtTempPersonID.value = "0"
        }
        function onclickbtnAddToGrdRole() {
            if (Form1.txtCount.value != "" && Form1.cmbRoleType.value != 0 && Form1.RoleName.value != "") {
                var cnt = Form1.txtCount.value
                for (var x = 0; x < cnt; ++x) {
                    var RoleID = ((FlagEditRole) ? Form1.RoleId.value : Form1.MaxRoleId.value)
                    if (!FlagEditRole)
                        Form1.MaxRoleId.value = parseInt(Form1.MaxRoleId.value) + 1
                    ModifyXMLDepartment("DepartmentPosition", Form1.DepartmentId.value, 0, "", RoleID, Form1.cmbRoleType.value, Form1.RoleName.value, Form1.cmbRoleType.item(Form1.cmbRoleType.selectedIndex).text)
                    Param = '' + Form1.cmbRoleType.item(Form1.cmbRoleType.selectedIndex).text + ','
								+ Form1.RoleName.value + ',,'
                    AddRow_grdRole(grdRole, "RoleID", RoleID, "RoleType", Form1.cmbRoleType.value, "PersonID", "0", Param)
                }
                KeepChangeDept()
            }
            else
                alert('·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ.')
        }
        function AddRow_grdRole(oGrid, AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, Param) {

            if (FlagEditRole) {
                LastSelectedRowgrdRole.cells(1).innerText = Form1.cmbRoleType.item(Form1.cmbRoleType.selectedIndex).text
                LastSelectedRowgrdRole.cells(1).title = Form1.cmbRoleType.item(Form1.cmbRoleType.selectedIndex).text

                LastSelectedRowgrdRole.RoleType = Form1.cmbRoleType.value
                LastSelectedRowgrdRole.cells(2).innerText = ((Form1.RoleName.value.length > 20) ? Form1.RoleName.value.substr(0, 20) + '...' : Form1.RoleName.value)
                LastSelectedRowgrdRole.cells(2).title = Form1.RoleName.value
                FlagEditRole = false
            }
            else {

                var oRow = oGrid.insertRow();
                var newrowindex = oGrid.rows.length;
                oRow.align = "center"
                oRow.setAttribute(AttrName1, AttrValue1)
                oRow.setAttribute(AttrName2, AttrValue2)
                oRow.setAttribute(AttrName3, AttrValue3)
                if (newrowindex == 1)
                    oRow.className = "CssItemStyle"
                else if (oGrid.rows(parseInt(newrowindex) - 2).className == "CssItemStyle")
                    oRow.className = "CssAlternatingItemStyle"
                else if (oGrid.rows(parseInt(newrowindex) - 2).className == "CssAlternatingItemStyle")
                    oRow.className = "CssItemStyle"
                var oCell0 = oRow.insertCell()
                oCell0.innerHTML = "<Input type='checkbox' onclick=" + ((oGrid.id == "grdRole") ? 'ChkRoleOnClick(this) checked ' : 'ChkPersonOnClick(this,grdPerson)') + ">"
                oCell0.style.width = "5px"
                var x = 0
                var p = new String
                var val = ""
                while (x < getCntChar(',', Param)) {
                    val = getArray(Param, x, ',')

                    switch (x) {
                        case 0:
                            var oCell1 = oRow.insertCell()
                            oCell1.innerText = ((val.length > 20) ? val.substring(0, 20) + "..." : val);
                            oCell1.title = val
                            oCell1.style.width = "100px"
                            break
                        case 1:
                            var oCell2 = oRow.insertCell()
                            oCell2.innerText = ((val.length > 20) ? val.substring(0, 20) + "..." : val);
                            oCell2.title = val
                            oCell2.style.width = "150px"
                            break
                        case 2:
                            var oCell3 = oRow.insertCell(); //Chk	
                            oCell3.innerHTML = "<Input type='checkbox' onclick='chkGrdRolePersonIDOnClick(this,grdRole)'" + ((AttrValue3 != 0 & AttrValue3 != "") ? " checked>" : " >");
                            oCell3.style.width = "5px"
                            var oCell4 = oRow.insertCell();
                            oCell4.innerText = ((val.length > 20) ? val.substring(0, 20) + "..." : val);
                            //oCell4.title=val;
                            oCell4.style.width = "80px"
                            break
                        case 3:
                            oCell4.title = val;
                            break
                    }
                    x++
                }
                setGridStyle(oGrid, oGrid.rows.length - 1)
            }
        }
        function setGridStyle(oGrid, newrowindex) {
            if (newrowindex % 2 == 0)
                oGrid.rows(newrowindex).className = "CssItemStyle"
            else
                oGrid.rows(newrowindex).className = "CssAlternatingItemStyle"
            var c
            if (newrowindex > 0) {
                newrowindex = newrowindex - 1
                oGrid.rows(newrowindex).align = "center"
                for (c = 0; c < oGrid.rows(newrowindex).cells.length; c++) {
                    oGrid.rows(newrowindex).cells(c).style.borderLeftWidth = "0"
                    oGrid.rows(newrowindex).cells(c).style.borderTopWidth = "0"
                    oGrid.rows(newrowindex).cells(c).style.borderBottomWidth = "0"
                    oGrid.rows(newrowindex).cells(c).style.borderRightWidth = "1"
                    oGrid.rows(newrowindex).cells(c).style.borderRightColor = "gray"
                }
                newrowindex = newrowindex + 1
            }
            oGrid.rows(newrowindex).align = "center"
            for (c = 0; c < oGrid.rows(newrowindex).cells.length; c++) {
                oGrid.rows(newrowindex).cells(c).style.borderLeftWidth = "0"
                oGrid.rows(newrowindex).cells(c).style.borderTopWidth = "0"
                oGrid.rows(newrowindex).cells(c).style.borderBottomWidth = "1"
                oGrid.rows(newrowindex).cells(c).style.borderBottomColor = "gray"
                oGrid.rows(newrowindex).cells(c).style.borderRightWidth = "1"
                oGrid.rows(newrowindex).cells(c).style.borderRightColor = "gray"
            }
        }
        function nodeClick(obj) {
            //alert("44")
            Form1.btnNewRole.disabled = false;
            Form1.btnAddToGrdRole.disabled = false;
            Form1.btnShowAllPerson.disabled = false;
            //alert("1")
            nodeClickTree(obj)
            //alert("2")
            ModifyXMLDepartment("Department", Form1.DepartmentId.value, 0, '', 0, 0, '', '')
        }
        //alert("3")	
        function nodeClickTree(obj) {
            var objCollection = document.all("TreeLevel")(1).all
            if (LastActiveNode != 0) {
                objCollection.item(LastActiveNode).style.backgroundColor = "transparent"
                objCollection.item(LastActiveNode).style.color = "#663300"
            }
            Form1.DepartmentId.value = obj.DepartmentID
            Form1.txtTreeDepartmentType.value = obj.DepType
            Form1.RoleId.value = ""
            FlagEditRole = false
            LoadData()
        }
        function LoadData() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(Form1.XMLDepartment.value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/Department[DepartmentID=" + document.getElementById("DepartmentId").value + "]")
            if (xmlNodes.length != 0) {
                Form1.DepartmentName.value = xmlNodes.item(0).selectSingleNode('Name').text
                Form1.cmbDepartmentType.value = xmlNodes.item(0).selectSingleNode('Type').text
                Form1.txtDepartmentParentId.value = xmlNodes.item(0).selectSingleNode('ParentID').text
                Form1.txtDepartmentCode.value = xmlNodes.item(0).selectSingleNode('DepartmentCode').text
                oGrid = grdRole
                Cleargrd(grdRole)
                var oXmlDocDPos = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocDPos.async = "false"
                var xmlNodesDPos
                var oXmlDocDPers = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocDPers.async = "false"
                var xmlNodesDPers
                oXmlDocDPos.loadXML(Form1.XMLDepartment.value)
                xmlNodesDPos = oXmlDocDPos.documentElement.selectNodes("/OrganizationEntity/DepartmentPosition [DepartmentID=" + document.getElementById("DepartmentId").value + "]")
                if (xmlNodesDPos.length != 0) {
                    oXmlDocDPers.loadXML(Form1.XMLDepartment.value)
                    for (var i = 0; i < xmlNodesDPos.length; i++) {
                        var RoleID = xmlNodesDPos.item(i).selectSingleNode('RoleID').text
                        var PersonID = ""
                        var PersonName = "";
                        xmlNodesDPers = oXmlDocDPers.documentElement.selectNodes("/OrganizationEntity/DepartmentPersonel[RoleID=" + RoleID + "]")
                        if (xmlNodesDPers.length != 0) {
                            PersonID = xmlNodesDPers.item(0).selectSingleNode('PersonID').text
                            PersonName = xmlNodesDPers.item(0).selectSingleNode('PersonName').text
                        }
                        Param = '' + xmlNodesDPos.item(i).selectSingleNode('RoleTypeTitle').text + ','
							+ xmlNodesDPos.item(i).selectSingleNode('Title').text + ',' + PersonID + ',' + PersonName + ','
                        AddRow_grdRole(grdRole, "RoleID", RoleID, "RoleType", xmlNodesDPos.item(i).selectSingleNode('RoleType').text, "PersonID", PersonID, Param)
                        if (PersonID == Form1.PersonIdTree.value) {
                            onclickgrdRole(grdRole.rows(grdRole.rows.length - 1))
                        }
                    }
                }
            }
            xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/Department[DepartmentID=" + Form1.txtDepartmentParentId.value + "]")
            if (xmlNodes.length != 0) {
                document.getElementById('TDParentName').innerHTML = '<font color=maroon>' + ((xmlNodes.item(0).selectSingleNode('Name').text.length > 25) ? xmlNodes.item(0).selectSingleNode('Name').text.substr(0, 25) + '...' : xmlNodes.item(0).selectSingleNode('Name').text) + '</font>'
                document.getElementById('TDParentName').title = xmlNodes.item(0).selectSingleNode('Name').text;
            }
        }
        function ManageChecks(HeaderChk, obj) {
            SetChecks(HeaderChk, obj)
            if (obj == 'grdPerson') {
                Chk = document.all.item("ChkSelectedPerson")
                OnClickChkAllSelected(Chk, obj)
            }
        }
        function SetChecks(HeaderChk, obj) {
            for (var j = 0; j < obj.rows.length; ++j)
                obj.rows(j).cells(0).firstChild.checked = HeaderChk.checked
        }
        function chkGrdRolePersonIDOnClick(obj, GrdObj) {
			
            try {
					KeepChangeDept()
					var oRoleRow = obj.parentElement.parentElement.rowIndex
					Form1.SelectRoleGrdID.value = obj.parentElement.parentElement.rowIndex
					
					//Cleargrd(grdPerson)
					var PersonID = grdRole.rows(oRoleRow).cells(4).innerText
					PersonID = ((PersonID == "") ? "0" : PersonID)
					var RoleID = grdRole.rows(oRoleRow).RoleID
					RoleID = ((RoleID == "") ? "0" : RoleID)
					grdRole.rows(oRoleRow).cells(4).innerText = ""
					grdRole.rows(oRoleRow).cells(4).title = ""
					var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
					oXmlDoc.async = "false"
					oXmlDoc.loadXML(Form1.XMLDepartment.value)
					var xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/DepartmentPersonel[RoleID=" + RoleID + "]");
					if (xmlNodes.length != 0) {
						xmlNodes.item(0).selectSingleNode('RoleID').text = "0"
						Form1.XMLDepartment.value = oXmlDoc.xml
                }
                if (!obj.checked) {
					
                    if (PersonID == Form1.txtTempPersonID.value) {
                        oXmlDoc = new ActiveXObject("MsXml2.DomDocument")
                        oXmlDoc.loadXML(Form1.SelectedMamber.value)
                        oXmlDoc.setProperty("SelectionLanguage", "XPath")
                        var Param
                        var xmlNodes = oXmlDoc.documentElement.selectNodes("/UserEntity/PersonWithOutRole[Selected=1 and PersonID=" + PersonID + "]");
                        var xmlNodesRole = oXmlDoc.documentElement.selectNodes("/UserEntity/Role")
                        if (xmlNodes.length != 0 & xmlNodesRole.length != 0) {
                            ModifySelectedMamber(PersonID)
                            Form1.SelectRoleGrdID.value = ""
                        }
                        else {
                            var url = "OrganizationChart.aspx?AjaxSend=GetPersonName &PersonID=" + PersonID;
                            Form1.txtSubmit.value = "GetPersonName"
                            oReqHttp = new ActiveXObject("Microsoft.XMLHTTP")
                            oReqHttp.onreadystatechange = RequestProcessor
                            oReqHttp.open("Post", url, true)
                            oReqHttp.send(null)
                        }
                    }
                    else {
						
                        var url = "OrganizationChart.aspx?AjaxSend=GetPersonName &PersonID=" + PersonID;
                        Form1.txtSubmit.value = "GetPersonName"
                        oReqHttp = new ActiveXObject("Microsoft.XMLHTTP")
                        oReqHttp.onreadystatechange = RequestProcessor
                        oReqHttp.open("Post", url, true)
                        oReqHttp.send(null)
                    }
                }
            }
            catch (ex) {}
        }
        
        //==================================================================
        function RequestProcessor() {
            if (oReqHttp.readyState == 4 || oReqHttp.readyState == 'complete')
                if (oReqHttp.status == 200) {
                if (oReqHttp.responseText != "") {
                    var StrReq = oReqHttp.responseText.split("<!")[0]
                    if (StrReq.indexOf("#") != -1) {
                        var StrSel = '<PersonWithOutRole>'
                        StrSel += '<PersonID>' + StrReq.split("#")[0] + '</PersonID>'
                        StrSel += '<FirstName>' + StrReq.split("#")[1] + '</FirstName>'
                        StrSel += '<LastName>' + StrReq.split("#")[2] + '</LastName>'
                        StrSel += '<DepartmentTitle />'
                        StrSel += '<sDepartmentTitle />'
                        StrSel += '<fDepartmentTitle />'
                        StrSel += '<DepartmentType>0</DepartmentType>'
                        StrSel += '<DepartmentTypeDscr />'
                        StrSel += '<RoleTitle />'
                        StrSel += '<sRoleTitle />'
                        StrSel += '<fRoleTitle />'
                        StrSel += '<RoleType>0</RoleType>'
                        StrSel += '<RoleTypeDscr />'
                        StrSel += '<RoleID>0</RoleID>'
                        StrSel += '<Selected>1</Selected>'
                        StrSel += '</PersonWithOutRole>'

                        ModifyXMLDepartment("DepartmentPersonel", Form1.DepartmentId.value, StrReq.split("#")[0], StrReq.split("#")[1] + ' ' + StrReq.split("#")[2], 0, 0, "", "")
                        if (grdPerson.rows.length > 0) {
                            Cleargrd(grdPerson)
                            if (confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø'))
                                Form1.SelectedMamber.value = "<UserEntity>" + StrSel + "</UserEntity>"
                            else {
                                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                                oXmlDoc.async = "false";
                                oXmlDoc.loadXML(Form1.SelectedMamber.value);
                                var xmlNodes = oXmlDoc.documentElement.selectNodes("/UserEntity/PersonWithOutRole [PersonID=" + StrReq.split("#")[0] + "]")

                                if (xmlNodes.length == 0)
                                    Form1.SelectedMamber.value = Form1.SelectedMamber.value.replace("</UserEntity>", StrSel + "</UserEntity>")
                            }
                        }
                        else {
                            if (Form1.SelectedMamber.value == "")
                                Form1.SelectedMamber.value = "<UserEntity>" + StrSel + "</UserEntity>"
                            else {
                                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                                oXmlDoc.async = "false"
                                oXmlDoc.loadXML(Form1.SelectedMamber.value)
                                var xmlNodes = oXmlDoc.documentElement.selectNodes("/UserEntity/PersonWithOutRole [PersonID=" + StrReq.split("#")[0] + "]")
                                if (xmlNodes.length == 0)
                                    Form1.SelectedMamber.value = Form1.SelectedMamber.value.replace("</UserEntity>", StrSel + "</UserEntity>")
                            }
                        }
                        GetDataPerson()
                    }
                }
            }
            Form1.txtSubmit.value = ""
            
            return true
           
        }
        function ModifyXMLDepartment(Type, DepartmentID, PersonID, PersonName, RoleID, RoleType, RoleTitle, RoleTypeTitle) {
            var StrXML = ""
            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(Form1.XMLDepartment.value)
            var xmlNodes
            if (Type == "Department") {
                xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/Department [DepartmentID=" + DepartmentID + "]")
                if (xmlNodes.length != 0) {
                    StrXML = '<Department>'
                    StrXML += '<DepartmentID>' + Form1.DepartmentId.value + '</DepartmentID>'
                    StrXML += '<Name>' + Form1.DepartmentName.value + '</Name>'
                    StrXML += '<ParentID>' + Form1.txtDepartmentParentId.value + '</ParentID>'
                    StrXML += '<Type>' + Form1.cmbDepartmentType.value + '</Type>'
                    StrXML += '<DepartmentCode>' + Form1.txtDepartmentCode.value + '</DepartmentCode>'
                    StrXML += '</Department>'
                    Form1.XMLDepartment.value = Form1.XMLDepartment.value.replace('</OrganizationEntity>', StrXML + '</OrganizationEntity>')
                }
            }
            else if (Type == "DepartmentPosition") {
                xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/DepartmentPosition [DepartmentID=" + DepartmentID + " and RoleID=" + RoleID + "]")

                if (xmlNodes.length != 0) {
                    xmlNodes.item(0).selectSingleNode('RoleType').text = RoleType
                    xmlNodes.item(0).selectSingleNode('Title').text = RoleTitle
                    xmlNodes.item(0).selectSingleNode('RoleTypeTitle').text = RoleTypeTitle
                    Form1.XMLDepartment.value = oXmlDoc.xml
                }
                else {
                    StrXML = "<DepartmentPosition>"
                    StrXML += "<RoleID>" + RoleID + "</RoleID>"
                    StrXML += "<DepartmentID>" + DepartmentID + "</DepartmentID>"
                    StrXML += "<RoleType>" + RoleType + "</RoleType>"
                    StrXML += "<Title>" + RoleTitle + "</Title>"
                    StrXML += "<RoleTypeTitle>" + RoleTypeTitle + "</RoleTypeTitle>"
                    StrXML += "</DepartmentPosition>"
                    Form1.XMLDepartment.value = Form1.XMLDepartment.value.replace('</OrganizationEntity>', StrXML + '</OrganizationEntity>')
                }
            }
            else if (Type == "DepartmentPersonel") {
                xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/DepartmentPersonel [PersonID=" + PersonID + "]")
                if (xmlNodes.length != 0) {
                    xmlNodes.item(0).selectSingleNode('RoleID').text = RoleID
                    Form1.XMLDepartment.value = oXmlDoc.xml
                }
                else {
                    StrXML = "<DepartmentPersonel>"
                    StrXML += "<RoleID>" + RoleID + "</RoleID>"
                    StrXML += "<PersonID>" + PersonID + "</PersonID>"
                    StrXML += "<PersonName>" + PersonName + "</PersonName>"
                    StrXML += "</DepartmentPersonel>"
                    Form1.XMLDepartment.value = Form1.XMLDepartment.value.replace('</OrganizationEntity>', StrXML + '</OrganizationEntity>')
                }
                
                if (RoleID != "0") {
                    if (Form1.txtHasFlow.value == "1")
                        ShowDefaultTemplate(PersonID, RoleID)
                }
            }
        }
        function GetDataPerson() {
        
            oXmlDoc = new ActiveXObject("MsXml2.DomDocument")
            oXmlDoc.loadXML(Form1.SelectedMamber.value)
            oXmlDoc.setProperty("SelectionLanguage", "XPath")
            var Param
            
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/UserEntity/PersonWithOutRole[Selected=1]")
            var xmlNodesRole = oXmlDoc.documentElement.selectNodes("/UserEntity/Role")
            
            if (xmlNodes.length != 0) {
                for (var i = 0; i < xmlNodes.length; i++) {
                    if (xmlNodesRole.length != 0) {
                        var PersonID = xmlNodes.item(i).selectSingleNode('PersonID').text
                        var RoleTypeTitle = xmlNodesRole.item(0).selectSingleNode('RoleTypeTitle').text
                        var RoleName = xmlNodesRole.item(0).selectSingleNode('RoleName').text
                        var RoleType = xmlNodesRole.item(0).selectSingleNode('RoleType').text
                        
						Param = '' + RoleTypeTitle + ',' + RoleName + ',' + PersonID + ','
						AddRow_grdRole(grdRole, "RoleID", Form1.MaxRoleId.value, "RoleType", RoleType, "PersonID", PersonID, Param)
						
							ModifyXMLDepartment("DepartmentPosition", Form1.DepartmentId.value, PersonID, "", Form1.MaxRoleId.value, RoleType, RoleName, RoleTypeTitle)
						ModifyXMLDepartment("DepartmentPersonel", Form1.DepartmentId.value, PersonID, xmlNodes.item(i).selectSingleNode('FirstName').text + ' '
								+ xmlNodes.item(i).selectSingleNode('LastName').text, Form1.MaxRoleId.value, RoleType, RoleName, RoleTypeTitle)
						Form1.MaxRoleId.value = parseInt(Form1.MaxRoleId.value) + 1
                    }
                    else {
                        var PersonID = xmlNodes.item(i).selectSingleNode('PersonID').text
                        Param = '' + PersonID + ',' + xmlNodes.item(i).selectSingleNode('FirstName').text + ' '
								+ xmlNodes.item(i).selectSingleNode('LastName').text + ','
                        AddRow_grdRole(grdPerson, "RoleID", "0", "RoleType", "0", "PersonID", PersonID, Param)
                    }
                }
            }
        }
        function onClickBtnShowAllPerson() {
            //alert(Form1.txtSessionID.value)
            var url = "../Person/PersonWithoutRole.aspx?SessionID=" + Form1.txtSessionID.value
            Form1.SelectedMamber.value = window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            if (Form1.SelectedMamber.value != '') {
                if (grdPerson.rows.length > 0)
                    if (confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø')) {
                    Cleargrd(grdPerson)
                }
                GetDataPerson()
            }
        }
        function OnClickChkAllSelected(Chk, obj) {
            for (var j = 0; j < obj.rows.length; ++j)
                obj.rows(j).style.display = "inline"
            if (Chk.checked == true)
                for (j = 0; j < obj.rows.length; ++j)
                if (obj.rows(j).cells(0).firstChild.checked == false)
                obj.rows(j).style.display = "none"
            RestoreStyle(obj)
        }
        function RestoreStyle(obj) {
            var FlagClass = "CssAlternatingItemStyle"
            for (var j = 0; j < obj.rows.length; ++j)
                if (obj.rows(j).style.display == 'inline')
                if (FlagClass == "CssItemStyle") {
                obj.rows(j).className = "CssAlternatingItemStyle"
                FlagClass = "CssAlternatingItemStyle"
            }
            else {
                obj.rows(j).className = "CssItemStyle"
                FlagClass = "CssItemStyle"
            }
        }
        function onclickgrdRole(SelectedRow) {
        
            Form1.SelectRoleGrdID.value = SelectedRow.rowIndex
            Form1.txtCount.value = "1"
            Form1.RoleId.value = SelectedRow.RoleID
            if (SelectedRow.parentElement.tagName != 'INPUT') {
                if (LastSelectedRowgrdRole != null)
                    LastSelectedRowgrdRole.className = LastSelectedRowClassgrdRole
                LastSelectedRowClassgrdRole = SelectedRow.className
                LastSelectedRowgrdRole = SelectedRow
                SelectedRow.className = "CssSelectedItemStyle"
               
            }
        }
        function ChkRoleOnClick(obj) {
            var SelectedRow = obj.parentElement.parentElement
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(Form1.XMLDepartment.value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/OrganizationEntity/DepartmentPosition[RoleID=" + SelectedRow.RoleID + "]");
            if (xmlNodes.length != 0) {
                if (obj.checked) {
                    xmlNodes.item(0).selectSingleNode('DepartmentID').text = Form1.DepartmentId.value
                    Form1.XMLDepartment.value = oXmlDoc.xml
                    KeepChangeDept()
                }
                else {
                    xmlNodes.item(0).selectSingleNode('DepartmentID').text = 0
                    Form1.XMLDepartment.value = oXmlDoc.xml
                    SelectedRow.cells(3).firstChild.checked = false;
                    chkGrdRolePersonIDOnClick(SelectedRow.cells(3).firstChild, 'grdPerson')
                }
            }
        }
        function ChkPersonOnClick(obj, GrdObj) {
            KeepChangeDept()
            var oRoleRow
            var oPersonRow = obj.parentElement.parentElement.rowIndex
            var PersonID
            if (Form1.SelectRoleGrdID.value != "") {
                oRoleRow = parseInt(Form1.SelectRoleGrdID.value)
                if (grdRole.rows(oRoleRow) == null) {
                    alert('·ÿ›« «» œ« Ìò ”„  «‰ Œ«» ò‰Ìœ')
                    return
                }
                if (obj.checked == false) {
                    grdRole.rows(oRoleRow).cells(4).innerText = ""
                    grdRole.rows(oRoleRow).cells(3).firstChild.checked = false
                }
                else {
                    PersonID = grdPerson.rows(oPersonRow).cells(1).innerText;
                    for (var i = 0; i < grdRole.rows.length; i++) {
                        if (PersonID == grdRole.rows(i).cells(4).innerText) {
                            alert("Ìò ‰›— ‰„Ì  Ê«‰œ »Ì‘ «“ Ìò ”„  œ«‘ Â »«‘œ.")
                            grdPerson.rows(oPersonRow).cells(0).firstChild.checked = false
                            return
                        }
                    }
                    if (grdRole.rows(oRoleRow).cells(4).innerText == "") {
                        grdRole.rows(oRoleRow).cells(4).innerText = PersonID
                        grdRole.rows(oRoleRow).cells(3).firstChild.checked = true
                        grdPerson.deleteRow(oPersonRow)
                        RestoreStyle(grdPerson)
                    }
                    else if (obj.checked == true && grdRole.rows(oRoleRow).cells(4).innerText != "") {
                        alert("«Ì‰ ”„  œ«—«Ì Å—”‰· „Ì »«‘œ!!!")
                        obj.checked = false
                        return
                    }
                }
                PersonID = grdRole.rows(oRoleRow).cells(4).innerText
                if (PersonID == "")
                    PersonID = "0"
                ModifyXMLDepartment("DepartmentPersonel", Form1.DepartmentId.value, PersonID, "", grdRole.rows(oRoleRow).RoleID, grdRole.rows(oRoleRow).RoleType, '', '')
                ModifySelectedMamber(PersonID)
            }
        }
        function ModifySelectedMamber(PersonID) {
            var StrSel = '<PersonID>' + PersonID + '</PersonID>'
            var iIndex, jIndex
            var StrTemp1, StrTemp2
            iIndex = Form1.SelectedMamber.value.indexOf(StrSel)
            if (iIndex != -1) {
                StrTemp1 = Form1.SelectedMamber.value.substr(0, iIndex);
                StrTemp1 = StrTemp1.substr(0, StrTemp1.lastIndexOf('<PersonWithOutRole>'))
                StrTemp2 = Form1.SelectedMamber.value.substr(iIndex + 1, Form1.SelectedMamber.value.length);
                jIndex = StrTemp2.indexOf('</PersonWithOutRole>')
                StrTemp2 = StrTemp2.substr(jIndex, StrTemp2.length)
                StrTemp2 = StrTemp2.replace('</PersonWithOutRole>', '')
                Form1.SelectedMamber.value = StrTemp1 + StrTemp2
            }
        }
        function onClickImgDepartmentFilter() {
            var url = "Role/Rolechart.aspx?SessionID=" + Form1.txtSessionID.value
            var StrReturn = window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            if (StrReturn != "")
                if (StrReturn != undefined) {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                xmlDoc.loadXML(StrReturn)
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                var xmlNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/Role [Selected=1]")
                if (xmlNodes.length != 0) {
                    Form1.txtRefreshDepartmentID.value = xmlNodes.item(0).selectSingleNode("DepartmentID").text
                }
                else {
                    Form1.txtRefreshDepartmentID.value = "0"
                }
                Form1.txtSubmit.value = "Refresh"
                Form1.submit()
            }
        }
        function ondblclickgrdRole() {
            if (window.event.srcElement.parentElement.parentElement.parentElement.id == 'grdRole') {
                LoadDataRole(window.event.srcElement.parentElement)
                FlagEditRole = true
            }
        }
        function LoadDataRole(SelectedRow) {
            Form1.RoleId.value = SelectedRow.RoleID
            Form1.cmbRoleType.value = SelectedRow.RoleType
            Form1.RoleName.value = SelectedRow.cells(2).title
        }
        function onclickbtnNew() {
            LastSelectedRowgrdRole = null
            LastSelectedRowClassgrdRole = ""
            FlagEditRole = false
            LastActiveNode = 0
            Form1.txtDepartmentCode.value = ""
            Form1.txtCount.value = "1"
            Form1.PersonIdTree.value = ""
            Form1.cmbDepartmentType.value = 0
            document.getElementById('TDParentName').innerHTML = '<font color=maroon>' + ((Form1.DepartmentName.value.length > 25) ? Form1.DepartmentName.value.substr(0, 25) + '...' : Form1.DepartmentName.value) + '</font>'
            document.getElementById('TDParentName').title = Form1.DepartmentName.value
            Form1.DepartmentName.value = ""
            Form1.txtDepartmentParentId.value = Form1.DepartmentId.value
            Form1.DepartmentId.value = Form1.MaxDepartmentId.value
            Form1.cmbRoleType.value = 0
            Form1.RoleName.value = ""
            Form1.RoleId.value = 0
            Cleargrd(grdPerson)
            Cleargrd(grdRole)
            Form1.SelectedMamber.value = ""
            Form1.btnNewRole.disabled = true
            Form1.btnAddToGrdRole.disabled = true
            Form1.btnShowAllPerson.disabled = true
        }
        function KeepChangeDept() {
            if (Form1.XMLChDept.value == "") {
                var StrXML = "<Root><Department>"
                StrXML += "<DepartmentID>" + Form1.DepartmentId.value + "</DepartmentID>"
                StrXML += "</Department></Root>"
                Form1.XMLChDept.value = StrXML               
            }
            else {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false"
                oXmlDoc.loadXML(Form1.XMLChDept.value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Department[DepartmentID=" + Form1.DepartmentId.value + "]");
                if (xmlNodes.length == 0) {
                    var StrXML = "<Department>"
                    StrXML += "<DepartmentID>" + Form1.DepartmentId.value + "</DepartmentID>"
                    StrXML += "</Department>"
                    Form1.XMLChDept.value = Form1.XMLChDept.value.replace("</Root>", StrXML + "</Root>")
                }
            }
        }
        function onclickbtnDelete() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(Form1.XMLDepartment.value)
            var xml1
            var x1
            if (Form1.DepartmentId.value != Form1.MaxDepartmentId.value) {
                xml1 = xmlDoc.documentElement.selectNodes("/OrganizationEntity/Department[ParentID=" + Form1.DepartmentId.value + "]")
                if (xml1.length == 0) {
                    if (confirm("‘„« œ— Õ«· Õ–› Ê«Õœ ”«“„«‰Ì «‰ Œ«» ‘œÂ Ê  „«„ ”„ Â«Ì ¬‰ „Ì »«‘Ìœ° ¬Ì« «ÿ„Ì‰«‰ œ«—Ìœø")) {
                        Form1.txtSubmit.value = "Del"
                        Form1.submit()
                    }
                }
                else
                    alert('‘„« „Ã«“ »Â Õ–› Ê«ÕœÂ«Ì “Ì—„Ã„Ê⁄Â œ«— ‰„ÌÌ«‘Ìœ.')
            }
            else
                alert("ÂÌÃ Ê«ÕœÌ «‰ Œ«» ‰‘œÂ «” .")
        }
        function OnClickBtnPrint() {
            Form1.txtSubmit.value = "Print"
            Form1.submit()
        }
        function MakeXML() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(Form1.XMLChDept.value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Department")
            var StrDepartment = ""
            var StrDepartmentPosition = ""
            var StrDepartmentPersonel = ""
            var oXmlDocDept = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocDept.async = "false"
            oXmlDocDept.loadXML(Form1.XMLDepartment.value)
            if (xmlNodes.length != 0) {
                for (var i = 0; i < xmlNodes.length; i++) {
                    var DepartmentID = xmlNodes.item(i).selectSingleNode('DepartmentID').text;
                    var xmlNodesDept = oXmlDocDept.documentElement.selectNodes("/OrganizationEntity/Department [DepartmentID=" + DepartmentID + "]");
                    if (xmlNodesDept.length != 0) {
                        if (Form1.DepartmentId.value == DepartmentID) {
                            StrDepartment += '<Department>'
                            StrDepartment += '<DepartmentID>' + Form1.DepartmentId.value + '</DepartmentID>'
                            StrDepartment += '<Name>' + Form1.DepartmentName.value + '</Name>'
                            StrDepartment += '<ParentID>' + Form1.txtDepartmentParentId.value + '</ParentID>'
                            StrDepartment += '<Type>' + Form1.cmbDepartmentType.value + '</Type>'
                            StrDepartment += '<DepartmentCode>' + Form1.txtDepartmentCode.value + '</DepartmentCode>'
                            StrDepartment += '</Department>'
                        }
                        else {
                            StrDepartment += '<Department>'
                            StrDepartment += '<DepartmentID>' + xmlNodesDept.item(0).selectSingleNode('DepartmentID').text + '</DepartmentID>'
                            StrDepartment += '<Name>' + xmlNodesDept.item(0).selectSingleNode('Name').text + '</Name>'
                            StrDepartment += '<ParentID>' + xmlNodesDept.item(0).selectSingleNode('ParentID').text + '</ParentID>'
                            StrDepartment += '<Type>' + xmlNodesDept.item(0).selectSingleNode('Type').text + '</Type>'
                            StrDepartment += '<DepartmentCode>' + xmlNodesDept.item(0).selectSingleNode('DepartmentCode').text + '</DepartmentCode>'
                            StrDepartment += '</Department>'
                        }
                    }
                    else {
                        if (Form1.DepartmentId.value == DepartmentID) {
                            StrDepartment += '<Department>'
                            StrDepartment += '<DepartmentID>' + Form1.DepartmentId.value + '</DepartmentID>'
                            StrDepartment += '<Name>' + Form1.DepartmentName.value + '</Name>'
                            StrDepartment += '<ParentID>' + Form1.txtDepartmentParentId.value + '</ParentID>'
                            StrDepartment += '<Type>' + Form1.cmbDepartmentType.value + '</Type>'
                            StrDepartment += '<DepartmentCode>' + Form1.txtDepartmentCode.value + '</DepartmentCode>'
                            StrDepartment += '</Department>'
                        }
                    }
                    xmlNodesDept = oXmlDocDept.documentElement.selectNodes("/OrganizationEntity/DepartmentPosition [DepartmentID=" + DepartmentID + "]");
                    if (xmlNodesDept.length != 0) {
                        for (var j = 0; j < xmlNodesDept.length; j++) {
                            var RoleID = xmlNodesDept.item(j).selectSingleNode('RoleID').text
                            StrDepartmentPosition += '<DepartmentPosition>'
                            StrDepartmentPosition += '<RoleID>' + xmlNodesDept.item(j).selectSingleNode('RoleID').text + '</RoleID>'
                            StrDepartmentPosition += '<DepartmentID>' + xmlNodesDept.item(j).selectSingleNode('DepartmentID').text + '</DepartmentID>'
                            StrDepartmentPosition += '<RoleType>' + xmlNodesDept.item(j).selectSingleNode('RoleType').text + '</RoleType>'
                            StrDepartmentPosition += '<Title>' + xmlNodesDept.item(j).selectSingleNode('Title').text + '</Title>'
                            StrDepartmentPosition += '</DepartmentPosition>'
                            var xmlNodePerson = oXmlDocDept.documentElement.selectNodes("/OrganizationEntity/DepartmentPersonel [RoleID=" + RoleID + "]")
                            if (xmlNodePerson.length != 0) {
                                StrDepartmentPersonel += '<DepartmentPersonel>'
                                StrDepartmentPersonel += '<PersonID>' + xmlNodePerson.item(0).selectSingleNode('PersonID').text + '</PersonID>'
                                StrDepartmentPersonel += '<RoleID>' + xmlNodePerson.item(0).selectSingleNode('RoleID').text + '</RoleID>'
                                StrDepartmentPersonel += '</DepartmentPersonel>'
                            }
                        }
                    }
                }
                Form1.XMLDepartment.value = '<OrganizationEntity>' + StrDepartment + StrDepartmentPosition + StrDepartmentPersonel + '</OrganizationEntity>'
            }
            else
                Form1.XMLDepartment.value = '<OrganizationEntity><Department></Department></OrganizationEntity>'
        }
        function onclickbtnSave() {
            if (Form1.DepartmentName.value == "" || Form1.cmbDepartmentType.value == "0")
                alert('·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ. ')
            else {
                if (Form1.DepartmentId.value==Form1.txtDepartmentParentId.value)   
                {
					alert("‰Êœ Åœ— Â‰Ê“ –ŒÌ—Â ‰‘œÂ")
					return
                }         
                var xmlDocIDT = new ActiveXObject("Microsoft.XMLDOM")
                xmlDocIDT.async = "false"
                xmlDocIDT.loadXML(Form1.txtIntvalDepartmentType.value)

                var xmlNodesxmlDocIDT
                xmlNodesxmlDocIDT = xmlDocIDT.documentElement.selectNodes("/NewDataSet/DepartmentTypeIntval[ID=" + Form1.cmbDepartmentType.value + "]")
                var selDepartmentType
                if (xmlNodesxmlDocIDT.length != 0)
                    selDepartmentType = xmlNodesxmlDocIDT.item(0).selectSingleNode('IntVal').text
                var xmlNodesTreeIntval
                if (Form1.txtTreeDepartmentType.value == "")
                    Form1.txtTreeDepartmentType.value = 0
                xmlNodesTreeIntval = xmlDocIDT.documentElement.selectNodes("/NewDataSet/DepartmentTypeIntval[ID=" + Form1.txtTreeDepartmentType.value + "]")
                var TreeIntval
                if (xmlNodesTreeIntval.length != 0)
                    TreeIntval = xmlNodesTreeIntval.item(0).selectSingleNode('IntVal').text
                if (xmlNodesxmlDocIDT.length != 0) {
                    if (selDepartmentType < TreeIntval) {
                        alert(" — Ì» ”«Œ «— Â«Ì ”«“„«‰Ì —⁄«Ì  ‰‘œÂ «” !")
                        return
                    }
                    else
                        ModifyXMLDepartment("Department", Form1.DepartmentId.value, 0, '', 0, 0, '', '')
                }
                KeepChangeDept()
                MakeXML()
                Form1.txtSubmit.value = "Save"
                Form1.submit()                
            }
        }
        function ShowDefaultTemplate(PersonId, RoleId) {
            Form1.txtTempPersonID.value = "0"

            if (RoleId != undefined) {
                var url = "../WorkFlow/Template/DefaultTemplateShow.aspx?PersonID=" + PersonId + "&SessionID=" + Form1.txtSessionID.value

                var StrFeature = "dialogHeight: 570px;dialogWidth: 750px;center: Yes;help: no;status: no"

                //url=encodeURI(url)

                var ReturnValue = window.showModalDialog(url, "", StrFeature)
                if (ReturnValue != "") {
                    if (Form1.XMLDefTemplate.value == "")
                        Form1.XMLDefTemplate.value = "<Root>" + ReturnValue + "</Root>"
                    else {

                        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                        oXmlDoc.async = "false"
                        oXmlDoc.loadXML(Form1.XMLDefTemplate.value)
                        var xmlNode = oXmlDoc.documentElement.selectNodes("/Root/DefaultTemplate[PersonID='" + PersonId + "']");

                        if (xmlNode.length != 0) {
                            var StrXML = ""
                            var iIndex, jIndex
                            var StrTemp1, StrTemp2
                            iIndex = Form1.XMLDefTemplate.value.indexOf("<DefaultTemplate><PersonID>" + PersonId)
                            StrTemp1 = Form1.XMLDefTemplate.value.substr(0, iIndex)
                            StrTemp2 = Form1.XMLDefTemplate.value.substr(iIndex++, Form1.XMLDefTemplate.value.length)
                            jIndex = StrTemp2.indexOf("</DefaultTemplate>")
                            StrTemp2 = StrTemp2.substr(jIndex, StrTemp2.length)
                            StrTemp2 = StrTemp2.replace("</DefaultTemplate>", "")
                            while (StrTemp2.search("<DefaultTemplate><PersonID>" + PersonId) != -1) {
                                iIndex = StrTemp2.indexOf("<DefaultTemplate><PersonID>" + PersonId)
                                StrTemp2 = StrTemp2.substr(iIndex++, StrTemp2.length)
                                jIndex = StrTemp2.indexOf("</DefaultTemplate>")
                                StrTemp2 = StrTemp2.substr(jIndex, StrTemp2.length)
                                StrTemp2 = StrTemp2.replace("</DefaultTemplate>", "")
                            }
                            Form1.XMLDefTemplate.value = StrTemp1 + ReturnValue + StrTemp2
                        }

                        else {
                            Form1.XMLDefTemplate.value = Form1.XMLDefTemplate.value.replace("</Root>", ReturnValue + "</Root>")
                        }

                    }
                }


                else {
                    var RowIndex = ((Form1.SelectRoleGrdID.value != "") ? Form1.SelectRoleGrdID.value : grdRole.rows.length - 1);
                    Form1.txtTempPersonID.value = grdRole.rows(parseInt(RowIndex)).cells(4).innerText
                    var obj = grdRole.rows(parseInt(RowIndex)).cells(3).firstChild
                    obj.checked = false
                    chkGrdRolePersonIDOnClick(obj, grdRole)
                }

            }

        }
					
		</script>
	</body>
</HTML>
