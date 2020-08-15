<%@ Page Language="vb" AutoEventWireup="false" Codebehind="TableOffice.aspx.vb" Inherits="TA.TableOffice" validateRequest="false" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx"  %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>TableOffice</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/General.js"></script>
		<script language="javascript">
		var LastSelectedRowgrd=null;
		var LastSelectedRowClassgrd="";
		var root = '/UserEntity/Person'


		/****************************************************************/
		var stateNode;
		function offState(rootCell) {
		    var tallyLeft = document.getElementById(rootCell).offsetLeft;
		    var tallyTop = document.getElementById(rootCell).offsetTop;
		    if (document.getElementById(rootCell).offsetParent) {
		        var rootNodeFound = false;
		        var offsetStart = document.getElementById(rootCell).offsetParent;
		        while (!rootNodeFound) {
		            tallyLeft += offsetStart.offsetLeft;
		            tallyTop += offsetStart.offsetTop;
		            if (offsetStart.offsetParent)
		                offsetStart = offsetStart.offsetParent;
		            else
		                rootNodeFound = true;
		        }
		    }
		    var shadow = document.createElement('div');
		    shadow.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=90)';
		    shadow.style.MozOpacity = 0.85;
		    shadow.setAttribute('id', 'shadow_' + rootCell);
		    shadow.style.position = 'absolute';
		    shadow.style.left = tallyLeft + 'px';
		    shadow.style.top = tallyTop + 'px';
		    shadow.style.width = document.getElementById(rootCell).offsetWidth.toString() + 'px';
		    shadow.style.height = document.getElementById(rootCell).offsetHeight.toString() + 'px';
		    shadow.style.background = '#e7eeff';
		    document.body.appendChild(shadow);
		    var shadowMessage = document.createElement('div');
		    shadowMessage.setAttribute('id', 'shadowMessage');
		    shadowMessage.style.position = 'absolute';
		    shadowMessage.innerHTML =
				'<table>' +
					'<tr>' +
						'<td valign=middle style="color:#006699;">' +
								'لطفا منتظر بمانيد' +
						'</td>' +
						'<td valign=middle>' +
							'<object type="application/x-shockwave-flash" data="/TA/Includes/Images/Please Wait/throbber-bars1.swf" width="40" height="40">' +
								'<param name="movie" value="/TA/Includes/Images/Please Wait/throbber-bars1.swf" />' +
								'<param name="BGCOLOR" value="#ffffff" />' +
								'<param name="wmode" value="transparent" />' +
							'</object>' +
						'</td>' +
					'</tr>' +
				'</table>';
		    shadow.appendChild(shadowMessage);
		    shadowMessage.style.left = ((shadowMessage.offsetParent.offsetWidth / 2) - (shadowMessage.offsetWidth / 2)).toString() + 'px';
		    shadowMessage.style.top = ((shadowMessage.offsetParent.offsetHeight / 2) - (shadowMessage.offsetHeight / 2)).toString() + 'px';
		    stateNode = 'shadow_' + rootCell;
		}
		/****************************************************************/
		function onState() {
		    document.getElementById(stateNode).parentNode.removeChild(document.getElementById(stateNode));
		}
		/****************************************************************/
		function onLoad() {

		    if (Form1.Active.value == "DownRow")
		        ViewDownRow()
		    if (Form1.txtMsg.value != "") {
		        LoadData()
		        alert(Form1.txtMsg.value)
		        Form1.txtMsg.value = ""
		    }
		    //Form1.btnDownDelete.style.display='inline'
		}
		/****************************************************************/
		function ViewTopRow() {
		    document.all.item('TopRow').style.display = 'inline'
		    document.all.item('DownRow').style.display = 'none'
		    Form1.Active.value = 'TopRow'
		}
		/****************************************************************/
		function ViewDownRow() {
		    document.all.item('DownRow').style.display = 'inline'
		    document.all.item('TopRow').style.display = 'none'
		}
		/****************************************************************/
		function ClearAll() {
		    Form1.txtName.value = "";
		    Form1.txtDesc.value = "";
		    Form1.rdbPerson.checked = true

		    Cleargrd(XTabTable)
		    Form1.SelectAllChk.checked = false

		}
		/****************************************************************/
		function onclickgrd(SelectedRow) {
		    if (LastSelectedRowgrd != null) {
		        LastSelectedRowgrd.className = LastSelectedRowClassgrd;
		    }
		    LastSelectedRowClassgrd = SelectedRow.className;
		    LastSelectedRowgrd = SelectedRow;
		    SelectedRow.className = "CssSelectedItemStyle";
		    ClearAll()
		    Form1.txtName.value = SelectedRow.cells(0).innerText;

		    Form1.txtDesc.value = SelectedRow.cells(1).innerText;

		    Form1.txtOfficeId.value = SelectedRow.TableOfficeId;

		    LoadData()
		}
		/****************************************************************/
		function LoadData() {


		    //---------------------------------------------------
		    xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		    var xmlNodes;
		    xmlDoc.loadXML(Form1.txtMember.value);
		    xmlDoc.setProperty("SelectionLanguage", "XPath");
		    xmlNodes = xmlDoc.documentElement.selectNodes("/OfficeEntity/GetTableOfficeMember[TableOfficeId=" + Form1.txtOfficeId.value + "]");
		    var ll = xmlNodes.length
		    var oGrid = document.all.item("XTabTable")
		    AddRow(oGrid, ll, 0)
		    for (i = 0; i < ll; i++) {
		        oGrid.rows(i).setAttribute("ItemID", xmlNodes.item(i).selectSingleNode('MemberId').text);
		        oGrid.rows(i).setAttribute("PID", xmlNodes.item(i).selectSingleNode('PID').text);
		        oGrid.rows(i).cells(0).firstChild.checked = true
		        oGrid.rows(i).cells(2).innerText = xmlNodes.item(i).selectSingleNode('MemberId').text
		        oGrid.rows(i).cells(3).innerText = xmlNodes.item(i).selectSingleNode('Name').text
		        oGrid.rows(i).cells(4).innerText = xmlNodes.item(i).selectSingleNode('MemberType').text
		        if (xmlNodes.item(i).selectSingleNode('MemberType').text == 'D')
		            oGrid.rows(i).cells(1).innerHTML = "<img src='/TA/Includes/Images/Icons/allowusertoeditrenge.gif' title='واحد سازماني' >"
		        else if (xmlNodes.item(i).selectSingleNode('MemberType').text == 'G')
		            oGrid.rows(i).cells(1).innerHTML = "<img src='../../../Images/Icons/uoGroup2.gif' title='گروه' >"
		        else if (xmlNodes.item(i).selectSingleNode('MemberType').text == 'U')
		            oGrid.rows(i).cells(1).innerHTML = "<img src='../../../Images/Icons/uoNewYesterday.gif'  title='پرسنل' >"

		    }

		}

		/****************************************************************/
		function ondblclickgrd() {
		    ViewDownRow()
		    //Form1.btnDownDelete.style.display='inline'
		    Form1.txtmodify.value = "Update"
		    Form1.Active.value = "DownRow"
		}
		/****************************************************************/
		function onClickbtnNew() {
		    ClearAll()
		    //Form1.btnDownDelete.style.display='none'
		    Form1.txtmodify.value = "Insert"
		    Form1.Active.value = "DownRow"
		    ViewDownRow()
		}
		/****************************************************************/
		function onClickbtnEdit() {
		    if (LastSelectedRowgrd != null) {
		        //Form1.btnDownDelete.style.display='inline'
		        onclickgrd(LastSelectedRowgrd)
		        ViewDownRow()
		        Form1.txtmodify.value = "Update"
		    }
		    else
		        alert("ابتدا يک سطر انتخاب نماييد")
		}
		/****************************************************************/
		function onClickbtnDelete() {
		    if (LastSelectedRowgrd != null) {
		        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
		            onclickgrd(LastSelectedRowgrd)
		            if (XTabTable.rows.length > 0) {
		                if (confirm("آيا براي حذف اين دفتر تابل و اعضاي آن مطمئن هستيد؟")) {
		                    offState('TopRow')
		                    Form1.txtSubmit.value = "Delete"
		                    Form1.submit()
		                }
		            }
		            else {
		                offState('TopRow')
		                Form1.txtSubmit.value = "Delete"
		                Form1.submit()
		            }
		        }
		    }
		    else {
		        alert("ابتدا يک سطر انتخاب نماييد")
		    }
		}
		/****************************************************************/
		function onClickbtnCancel() {
		    ViewTopRow()

		}
		/****************************************************************/
		function MakeXML() {
		    var Str = "<OfficeEntity><GetTableOffice>"
		    Str += "<Name>" + Form1.txtName.value + "</Name>";
		    Str += "<Desc>" + Form1.txtDesc.value + "</Desc>"
		    Str += "</GetTableOffice></OfficeEntity>"
		    Form1.txtGroupXML.value = Str;
		    var oGrid = document.all.item("XTabTable")
		    var ll = oGrid.rows.length
		    str = "<root>"
		    if (ll > 0) {
		        for (i = 0; i < ll; i++) {
		            if (oGrid.rows(i).cells(0).firstChild.checked == true) {
		                str += "<tree>"
		                str += "<ID>" + ((oGrid.rows(i).cells(4).innerText=='U')? oGrid.rows(i).getAttribute("PID"):oGrid.rows(i).getAttribute("ItemID")) + "</ID>"
		                str += "<Type>" + oGrid.rows(i).cells(4).innerText + "</Type>"
		                str += "</tree>"
		            }
		        }
		    }
		    str += "</root>"
		    Form1.txtAccessXML.value = str

		}
		/****************************************************************/
		function onClickbtnSave() {
		    if (CheckNotEmptyData() == true) {
		        offState('DownRow')
		        MakeXML()
		        Form1.txtSubmit.value = "Save"
		        Form1.submit()
		    }
		}
		/****************************************************************/
		function CheckNotEmptyData() {
		    if (Form1.txtName.value == "") {
		        alert('نام را وارد نماييد')
		        document.all.item('txtName').focus()
		        return false
		    }
		    else
		        return true
		}
		/****************************************************************/
		function onclickbtnSelectPerson() {
		    var url
		    var retval
		    xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		    var xmlNodes;
		    if (Form1.rdbPerson.checked) {
		        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value;
		        retval = window.showModalDialog(url, "", "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no")
		        if (retval != "" && retval != undefined) {
		            Form1.PersonXML.value = retval
		            Form1.txtType.value = "U"
		            xmlDoc.loadXML(Form1.PersonXML.value);
		            xmlDoc.setProperty("SelectionLanguage", "XPath");
		            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
		            var ll = xmlNodes.length
		            var oGrid = document.all.item("XTabTable")
		            var index = oGrid.rows.length

		            AddRow(oGrid, ll, index)
		            for (i = index; i < index + ll; i++) {
		                oGrid.rows(i).setAttribute("ItemID", xmlNodes.item(i - index).selectSingleNode('PID').text);
		                oGrid.rows(i).setAttribute("PID", xmlNodes.item(i - index).selectSingleNode('PID').text);
		                oGrid.rows(i).cells(2).innerText = xmlNodes.item(i - index).selectSingleNode('PCode').text
		                oGrid.rows(i).cells(4).innerText = "U"
		                oGrid.rows(i).cells(3).innerText = (xmlNodes.item(i - index).selectSingleNode('PName').text)//+" "+(xmlNodes.item(i-index).selectSingleNode('FirstName').text)	
		                oGrid.rows(i).cells(1).innerHTML = "<img src='../../../Images/Icons/uoNewYesterday.gif' title='پرسنل' >"
		            }
		        }
		        //--------------------------------------------------------
		    }
		    else if (Form1.rdbGroup.checked) {
		        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value;
		        retval = window.showModalDialog(url, "", "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no")
		        if (retval != "" && retval != undefined) {
		            Form1.GroupXML.value = retval
		            Form1.txtType.value = "G"

		            xmlDoc.loadXML(Form1.GroupXML.value);
		            xmlDoc.setProperty("SelectionLanguage", "XPath");
		            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
		            var ll = xmlNodes.length
		            var oGrid = document.all.item("XTabTable")
		            var index = oGrid.rows.length
		            AddRow(oGrid, ll, index)
		            for (i = index; i < index + ll; i++) {
		                oGrid.rows(i).setAttribute("ItemID", xmlNodes.item(i - index).selectSingleNode('GroupId').text);
		                oGrid.rows(i).cells(2).innerText = xmlNodes.item(i - index).selectSingleNode('GroupId').text
		                oGrid.rows(i).cells(4).innerText = "G"
		                oGrid.rows(i).cells(3).innerText = xmlNodes.item(i - index).selectSingleNode('GroupName').text
		                oGrid.rows(i).cells(1).innerHTML = "<img src='../../../Images/Icons/uoGroup2.gif' title='گروه' >"
		            }


		        }
		        //--------------------------------------------------------
		    }
		    else if (Form1.rdbVahed.checked) {
		        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + Form1.txtSessionID.value
		        var retval = ''
		        retval = window.showModalDialog(url, "", "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no")

		        if (retval != "" && retval != undefined) {
		            Form1.DepartmentXML.value = "<Root>" + retval.split("<Root>")[1]

		            Form1.txtType.value = "D"

		            xmlDoc.loadXML(Form1.DepartmentXML.value);
		            xmlDoc.setProperty("SelectionLanguage", "XPath");
		            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");

		            var ll = xmlNodes.length
		            var oGrid = document.all.item("XTabTable")
		            var index = oGrid.rows.length
		            AddRow(oGrid, ll, index)
		            for (i = index; i < index + ll; i++) {
		                oGrid.rows(i).setAttribute("ItemID", xmlNodes.item(i - index).selectSingleNode('DID').text);
		                oGrid.rows(i).cells(2).innerText = xmlNodes.item(i - index).selectSingleNode('DID').text;
		                oGrid.rows(i).cells(4).innerText = "D"
		                oGrid.rows(i).cells(3).innerText = (xmlNodes.item(i - index).selectSingleNode('DName').text)
		                oGrid.rows(i).cells(1).innerHTML = "<img src='/TA/Includes/Images/Icons/allowusertoeditrenge.gif' title='واحد سازماني' >"
		            }

		        }
		        //--------------------------------------------------------
		    }
		    if (retval != "" && retval != undefined) {
		        retval = ''
		        var le = oGrid.rows.length
		        for (i = 0; i < oGrid.rows.length; i++) {
		            for (j = oGrid.rows.length - 1; j >= 0; j--) {
		                if ((oGrid.rows(j).getAttribute("ItemID") == oGrid.rows(i).getAttribute("ItemID")) && (oGrid.rows(j).cells(4).innerText == oGrid.rows(i).cells(4).innerText) && (i != j)) {

		                    oGrid.deleteRow(j)

		                }
		            }
		        }
		    }
		}

		/****************************************************************/
		function AddRow(oGrid, cntRow, index) {

		    for (i = index; i < index + cntRow; i++) {
		        oGrid.insertRow()
		        oGrid.rows(i).className = "XItemStyle";
		        oGrid.rows(i).insertCell()
		        oGrid.rows(i).insertCell()
		        oGrid.rows(i).insertCell()
		        oGrid.rows(i).insertCell()
		        oGrid.rows(i).insertCell()
		        oGrid.rows(i).cells(4).style.display = "none"
		        oGrid.rows(i).cells(4).style.visibility = "Hidden"
		        oGrid.rows(i).align = "center"
		        oGrid.rows(i).cells(0).style.width = "35px"
		        oGrid.rows(i).cells(1).style.width = "30px"
		        oGrid.rows(i).cells(2).style.width = "60px"
		        oGrid.rows(i).cells(3).style.width = "180px"
		        oGrid.rows(i).cells(0).style.border = 0
		        oGrid.rows(i).cells(1).style.border = 0
		        oGrid.rows(i).cells(2).style.border = 0
		        oGrid.rows(i).cells(3).style.border = 0
		        oGrid.rows(i).cells(0).innerHTML = "<INPUT class='ShoperTabChk'  style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px'  type='checkbox' checked >"
		    }
		    setStyle(oGrid)
		}
		/****************************************************************/
		function Cleargrd(obj) {
		    j = obj.rows.length - 1
		    for (; j >= 0; --j)
		        obj.deleteRow(j)
		}

		/****************************************************************/
		function setStyle(oGrid) {
		    for (i = 0; i < oGrid.rows.length; i++) {
		        oGrid.rows(i).className = "XItemStyle";
		        oGrid.rows(i).align = "center"
		        /*if ((i%2)==0)
		        {
		        oGrid.rows(i).cells(0).className="CssItemStyle"
		        oGrid.rows(i).cells(1).className="CssItemStyle"
		        oGrid.rows(i).cells(2).className="CssItemStyle"
		        oGrid.rows(i).cells(3).className="CssItemStyle"
		        }
		        else
		        {
		        oGrid.rows(i).cells(0).className="CssAlternatingItemStyle"
		        oGrid.rows(i).cells(1).className="CssAlternatingItemStyle"
		        oGrid.rows(i).cells(2).className="CssAlternatingItemStyle"
		        oGrid.rows(i).cells(3).className="CssAlternatingItemStyle"
		        }*/
		    }
		}
		/****************************************************************/
		function onClickbtnDownDelete() {

		    MakeXML()
		    if (Form1.txtAccessXML.value == '<root></root>') {
		        alert("سطري براي حذف انتخاب نشده است.")
		        return;
		    }
		    if (confirm("آيا با حذف موارد انتخاب شده موافقيد؟")) {
		        Form1.txtSubmit.value = "DeleteMember"
		        Form1.submit()
		    }
		}
		/****************************************************************/
		function OnclickAllChk(obj) {
		    var oGrid = document.all.item("XTabTable")
		    var ll = oGrid.rows.length
		    for (i = 0; i < ll; i++)
		        oGrid.rows(i).cells(0).firstChild.checked = obj.checked

		}
		/****************************************************************/
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Layer3" cellSpacing="0" cellPadding="0" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; WIDTH: 100px" vAlign="top" align="center">
												<TABLE id="Table1" border="0" style="WIDTH: 409px; HEIGHT: 368px">
													<TR>
														<TD vAlign="top" align="left" style="HEIGHT: 325px"><cc1:automationgrid id="grdGroup" runat="server" HtcAddress=" " ClientSorting="False" CreateClientSideScripts="False"
																UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False" Scrolling="True" ClientPageSize="0" SelectRowOnClick="False"
																SendXML="DoNotSend" AutoGenerateColumns="False" Height="296px" Width="351px"><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle" HorizontalAlign="Center" VerticalAlign="Middle"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:TEMPLATECOLUMN HeaderText="نام">
																		<HEADERSTYLE Width="100px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label1 title='<%# DataBinder.Eval(Container, "DataItem.BTableOfficeName") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.STableOfficeName") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="شرح">
																		<HEADERSTYLE Width="250px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="250px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label2 title='<%# DataBinder.Eval(Container, "DataItem.STableOfficeDescr") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.STableOfficeDescr") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="TableOfficeId" Visible="False" DataField="TableOfficeId">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid></TD>
													</TR>
													<tr>
														<td align="center">
															<INPUT class="CssBtnNew" id="btnTopNew" title="ايجاد" style="CURSOR: hand" onclick="onClickbtnNew()"
																type="button" name="btnNewDown"><INPUT class="CssbtnEdit" id="btnEdit" title="اصلاح" style="CURSOR: hand" onclick="onClickbtnEdit()"
																type="button" name="btnEdit"><INPUT class="CssBtnDelete" id="btnDelete" title="حذف" style="CURSOR: hand" onclick="onClickbtnDelete()"
																type="button" name="btnDelete">
														</td>
													</tr>
												</TABLE>
											</TD>
										</TR>
										<tr>
											<TD id="DownRow" style="DISPLAY: none; HEIGHT: 426px" vAlign="top" align="center">
												<table style="WIDTH: 359px; HEIGHT: 422px">
													<tr>
														<td style="HEIGHT: 41px">
															<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="100%" border="0">
																<TR>
																	<TD align="left" style="WIDTH: 32px">نام :</TD>
																	<TD style="WIDTH: 108px"><INPUT class="txtcontrols" id="txtName" style="WIDTH: 93px; HEIGHT: 22px" type="text" size="10"
																			name="txtName" runat="server"></TD>
																	<TD style="WIDTH: 57px" align="right">شرح :</TD>
																	<TD style="WIDTH: 57px" align="right"><TEXTAREA class="txtcontrols" id="txtDesc" style="WIDTH: 213px; HEIGHT: 24px" name="txtDesc"
																			rows="1" cols="24" runat="server">															</TEXTAREA></TD>
																</TR>
															</TABLE>
															<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
																<TR>
																	<TD style="WIDTH: 54px"><INPUT id="rdbPerson" type="radio" CHECKED value="rdbPerson" name="Member">پرسنل</TD>
																	<TD style="WIDTH: 54px"><INPUT id="rdbGroup" type="radio" value="rdbGroup" name="Member">گروه</TD>
																	<TD style="WIDTH: 89px"><INPUT id="rdbVahed" type="radio" value="rdbVahed" name="Member">واحد 
																		سازماني</TD>
																	<TD align="left"><INPUT class="btnSelectPerson" id="btnSelectPerson" onclick="onclickbtnSelectPerson()"
																			type="button" name="btnSelectPerson"></TD>
																</TR>
															</TABLE>
														</td>
													</tr>
													<tr>
														<td style="HEIGHT: 290px" align="center">
															<HR style="WIDTH: 99.68%; COLOR: #ccccff; HEIGHT: 2px" align="center">
															<TABLE id="Table3" style="BORDER-RIGHT: #6666cc thin inset; BORDER-TOP: #6666cc thin solid; BORDER-LEFT: #6666cc thin outset; BORDER-BOTTOM: #6666cc thin solid"
																cellSpacing="0" cellPadding="0" border="0">
																<THEAD style="DISPLAY: inline">
																	<TR>
																		<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 35px; BACKGROUND-COLOR: #83afe5"
																			align="center"><INPUT class="ShoperTabChk" id="SelectAllChk" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																				onclick="OnclickAllChk(this)" type="checkbox" name="SelectAllChk"></TD>
																		<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 30px; BACKGROUND-COLOR: #83afe5"
																			align="center">نوع</TD>
																		<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 60px; BACKGROUND-COLOR: #83afe5"
																			align="center">کد</TD>
																		<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 180px; BACKGROUND-COLOR: #83afe5"
																			align="center">نام</TD>
																	</TR>
																</THEAD>
															</TABLE>
															<div style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 87.33%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 89.03%"
																align="center">
																<TABLE id="XTabTable">
																</TABLE>
															</div>
														</td>
													</tr>
													<tr>
														<td align="center"><HR style="WIDTH: 99.68%; COLOR: #ccccff; HEIGHT: 2px" align="center">
															<INPUT class="CssBtnNew" id="btnDownNew" title="ÇíÌÇÏ" style="CURSOR: hand" onclick="onClickbtnNew()"
																type="button" name="btnDownNew"><INPUT class="CssbtnSave" id="btnSave" title="ÐÎíÑå" style="CURSOR: hand" onclick="onClickbtnSave()"
																type="button" name="btnSave"><INPUT class="CssBtnCancel" id="btnCancel" title="ÇäÕÑÇÝ" style="CURSOR: hand" onclick="onClickbtnCancel()"
																type="button" name="btnCancel"></td>
													</tr>
												</table>
											</TD>
										</tr>
										<tr>
											<td style="DISPLAY: none">
												<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <input id="txtMsg" type="text" name="txtMsg" runat="server"><input id="txtSubmit" type="text" name="txtSubmit" runat="server"><input id="txtmodify" type="text" name="txtmodify" runat="server">
												<input id="Active" type="text" name="Active" runat="server"> <input id="txtGroupXML" type="text" name="txtGroupXML" runat="server"><input id="txtOfficeId" type="text" name="txtOfficeId" runat="server">
												<input id="txtAccessXML" type="text" name="txtAccessXML" runat="server"> <input id="txtType" type="text" name="txtType" runat="server">
												<input id="PersonXML" type="text" name="PersonXML" runat="server"> <input id="GroupXML" type="text" name="GroupXML" runat="server">
												<input id="DepartmentXML" type="text" name="DepartmentXML" runat="server"> <input id="txtSelectedGroup" type="text" name="txtSelectedGroup" runat="server">
												<input id="txtSelectedPerson" type="text" name="txtSelectedPerson" runat="server">
												<input id="txtSelectedRole" type="text" name="txtSelectedRole" runat="server"> <input id="txtMember" type="text" name="txtMember" runat="server"><input id="txtSQL" type="text" name="txtSQL" runat="server">
											</td>
										</tr>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
