<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RegisterTrafficCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RegisterTrafficCredit" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" LoadScriptsBeforeUI="false" runat="server"
        AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <table width="1220px">
        <%--<table>--%>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle" align="middle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                از تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td>
                                شماره پرسنلی :
                            </td>
                            <td>
                                <uc2:ComboBox ID="cmbPerson" runat="server" />
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td>
                                <asp:DropDownList class="TxtControls" ID="cmbGroup" runat="server" Width="100px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                واحد سازماني :
                            </td>
                            <td>                            
                                <uc2:ComboBox ID="cmbDepartment" runat="server" />

                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="Table27" style="width: 280px; height: 14px" cellspacing="1" cellpadding="1"
                    align="center" border="0">
                    <tr>
                        <td align="right">
                            <input class="CssLastPage" id="LastBtn_X" style="width: 35px; height: 35px" onclick="LastBtn_XClick(1)"
                                type="button" name="LastBtn_X" />
                        </td>
                        <td align="right">
                            <input class="CssNextPage" id="NextBtn_X" style="width: 35px; height: 35px" onclick="NextBtn_XClick(1)"
                                type="button" name="NextBtn_X" />
                        </td>
                        <td valign="middle" align="right">
                            <input id="CurPage_X" style="border-bottom-style: groove; border-right-style: groove;
                                width: 50px; border-top-style: groove; height: 25px; border-left-style: groove"
                                onchange="CurPage_XTextChanged(1)" name="CurPage_X" runat="server" />
                        </td>
                        <td dir="rtl" valign="middle" align="right">
                            &nbsp;از
                        </td>
                        <td valign="middle">
                            <input id="TotalPage_X" style="border-bottom-style: groove; border-right-style: groove;
                                width: 50px; border-top-style: groove; height: 25px; border-left-style: groove"
                                size="6" name="TotalPage_X" readonly="readonly" disabled="disabled" />
                        </td>
                        <td>
                            <input class="CssPrevPage" id="PrevBtn_X" style="width: 35px; height: 35px" onclick="PrevBtn_XClick(1)"
                                type="button" name="PrevBtn_X" />
                        </td>
                        <td>
                            <input class="CssFirstPage" id="FirstBtn_X" style="width: 35px; height: 35px" onclick="FirstBtn_XClick(1)"
                                type="button" name="FirstBtn_X" />
                        </td>
                        <td style="display: none">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                align="right">
                <table style="width: 1045px" dir='rtl'>
                    <tr id="test">
                        <td class="CssHeaderStyle" align='center' style='width: 80px'>
                            تاريخ
                        </td>
                        <td class="CssHeaderStyle" align='center' style='width: 50px'>
                            روز
                        </td>
                        <td class="CssHeaderStyle" align='center' style='width: 130px'>
                            نام پرسنلی
                        </td>
                        <td class="CssHeaderStyle" align='center' style='width: 810px'>
                        </td>
                    </tr>
                </table>
                <div style="overflow: auto; width: 1065; height: 300px">
                    <table id="GrdTrafficCredit" style="width: 1045px;" onclick="onClickGrdTrafficCredit()">
                    </table>
                </div>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtStationIDSearch" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtDoorID" runat="server" />
                        <asp:HiddenField ID="txtLocationID" runat="server" />
                        <asp:HiddenField ID="txtParentID" runat="server" />
                        <asp:HiddenField ID="txtTrafficXML" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtDeptID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <select class='TxtControls' id="cmbCode" style='width: 100px' runat="server">
            <option></option>
        </select>
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /><%----%>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtAlertPerson" name="txtAlertPerson" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtIdentity" name="txtIdentity" runat="server" />
        <input type="text" id="txtNode" name="txtNode" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtPersonID" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <input type="text" id="txtMenueItemID" name="txtMenueItemID" runat="server" />
        <input type="text" id="txtCalSDate" runat="server" />
        <input type="text" id="txtCalEDate" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <asp:HiddenField ID="lblFrom" runat="server" />
        <asp:HiddenField ID="lblTo" runat="server" />
        <asp:HiddenField ID="Totalpage" runat="server" />
        <asp:HiddenField ID="txtCurPage" runat="server" />
        <asp:HiddenField ID="lblTotal" runat="server" />
        <asp:HiddenField ID="txtPageSize" runat="server" />
        <asp:HiddenField ID="txtPageNumber" runat="server" />
        <asp:TextBox runat="server" ID="tets"></asp:TextBox>
    </div>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script language="javascript" type="text/javascript">
        //=================================add row to client grid=====================       
        document.body.style.overflowY = "hidden";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var str = "";
        var PageSize = 10
        var ISDeleteTime = 0;
        //===========================================================================================
        BindGrid()
        //===========================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //===========================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //---------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal != "") {
                if ($get(MasterObj + "txtAlert").value != "") {
                    window.returnValue = "1";
                    if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                        if ($get(MasterObj + "txtValidate").value != "1")
                            alert($get(MasterObj + "txtAlert").value);
                        else
                            SetMsg($get(MasterObj + "txtAlert").value);

                    if (ISDeleteTime == 1) {
                        document.getElementById(MasterObj + "txtXmlSave").value = "<Root>" + str + "</Root>"
                        ISDeleteTime = 0;
                    }
                    else {
                        document.getElementById(MasterObj + "txtXmlSave").value = "";
                        str = "";
                    }
                }
                $get(MasterObj + "txtAlert").value = ""
                LastSelectedRow = null;
                LastSelectedRowClass = "";
                BindGrid()
                $get(MasterObj + "txtSubmit").value = "";
            }
        }
        //============================BindGrid===========================
        function BindGrid() {
            clearGrid();

            if ($get(MasterObj + "txtTrafficXML").value != "<DataEntryEntity></DataEntryEntity>" && $get(MasterObj + "txtTrafficXML").value != "<DataEntryEntity />") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + "txtTrafficXML").value);


                var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc2.async = "false";
                oXmlDoc2.loadXML("<Root>" + str + "</Root>");


                var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/TrafficCredit");
                var XmlNodesTime = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GetTime");

                //--------------------Fill TotalRec-----------------------------
                totalRecords = XmlNodes.item(0).selectSingleNode('TotalPage').text
                $get("TotalPage_X").value = Math.ceil(totalRecords / PageSize)
                $get(MasterObj + "CurPage_X").value = $get(MasterObj + "CurPage_X").value == "" ? "1" : $get(MasterObj + "CurPage_X").value
                //------------------------------------------------------            
                var endFor = XmlNodes.length;
                for (var i = 0; i < endFor; i++) {
                    addrow(GrdTrafficCredit, XmlNodes.item(i).selectSingleNode('RowNumber').text.toString().trim()
                            , XmlNodes.item(i).selectSingleNode('date').text.toString()
                            , XmlNodes.item(i).selectSingleNode('Day').text.toString()
                            , XmlNodes.item(i).selectSingleNode('Name').text.toString()
                            , XmlNodes.item(i).selectSingleNode('PersonID').text.toString().trim()
                            , XmlNodes.item(i).selectSingleNode('Code').text.toString().trim()
                            , XmlNodes.item(i).selectSingleNode('PageNumber').text.toString().trim()
                            );
                }
                for (var j = 0; j < endFor; j++) {
                    XmlNodesTime = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GetTime[PersonID=" + GrdTrafficCredit.rows(j).PersonID + "and Date='" + GrdTrafficCredit.rows(j).cells(0).innerText + "']");
                    Xmlsave = oXmlDoc2.documentElement.selectNodes("/Root/TbCode[PersonID=" + GrdTrafficCredit.rows(j).PersonID + " and Date='" + GrdTrafficCredit.rows(j).cells(0).innerText + "']");
                    if (Xmlsave.length > 0)
                        for (var k = 0; k < Xmlsave.length; k++)
                            addTime(j, Xmlsave[k]);
                    else
                        for (var k = 0; k < XmlNodesTime.length; k++) {
                            addTime(j, XmlNodesTime[k]);
                        }
                }
            }
        }
        //------------------------------------------------------------------------
        function NextBtn_XClick(flagGrid) {
            if (parseInt($get(MasterObj + "CurPage_X").value) < parseInt($get("TotalPage_X").value)) {
                $get(MasterObj + "CurPage_X").value = parseInt($get(MasterObj + "CurPage_X").value) + 1
                document.getElementById(MasterObj + "txtSubmit").value = "Filter"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //----------------------------------------------------------------------------------------
        function PrevBtn_XClick(flagGrid) {
            if ($get(MasterObj + "CurPage_X").value > 1) {
                $get(MasterObj + "CurPage_X").value = parseInt($get(MasterObj + "CurPage_X").value) - 1
                document.getElementById(MasterObj + "txtSubmit").value = "Filter"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //----------------------------------------------------------------------------------------
        function FirstBtn_XClick(flagGrid) {
            $get(MasterObj + "CurPage_X").value = "1"
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //----------------------------------------------------------------------------------------
        function LastBtn_XClick(flagGrid) {
            $get(MasterObj + "CurPage_X").value = $get("TotalPage_X").value
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //-----------------------------------------تغییر مقدار curpage_x به صورت دستی-----------
        function CurPage_XTextChanged(flagGrid) {

            document.getElementById(MasterObj + "CurPage_X").value = document.getElementById(MasterObj + "CurPage_X").value.replace(" ", "");
            var TotalPage = parseInt(document.getElementById("TotalPage_X").value);

            if (document.getElementById(MasterObj + "CurPage_X").value != "" && document.getElementById(MasterObj + "CurPage_X").value != "0") {
                if (parseInt(document.getElementById(MasterObj + "CurPage_X").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById(MasterObj + "CurPage_X").value
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }
            }
        }
        //---------------------------------------------End Paging--------------------------------
        //============================================clearGrid==============================================
        function clearGrid() {
            var oGrid = document.getElementById("GrdTrafficCredit");
            while (oGrid.rows.length > 0)
                oGrid.deleteRow();
        }
        //=========================================addTime===================================================
        function addTime(i, xmlNode) {
            if (xmlNode != undefined && xmlNode != null) {
                var Obj = GrdTrafficCredit.rows(i).cells(3).childNodes[GrdTrafficCredit.rows(i).cells(3).childNodes.length - 1];
                Obj.value = xmlNode.selectSingleNode("Time").text;
                Obj.setAttribute("PrevTime", Obj.value);
                chkEmty(Obj);
                Obj = GrdTrafficCredit.rows(i).cells(3).childNodes[GrdTrafficCredit.rows(i).cells(3).childNodes.length - 2];
                Obj.value = xmlNode.selectSingleNode("Code").text.toString();
            }
        }
        //============================================addrow================================================
        function addrow(GrdTrafficCredit, RowNumber, date, Day, Name, PersonID, Code, PageNumber) {
            var Row = GrdTrafficCredit.insertRow();
            Row.className = "CssItemHeader4"
            Row.setAttribute("PersonID", PersonID);
            Row.setAttribute("Code", Code);
            Row.setAttribute("Date", date);
            Row.setAttribute("RowNumber", RowNumber);
            Row.setAttribute("PageNumber", PageNumber);

            Row.insertCell()
            Row.cells(0).innerText = date
            Row.cells(0).style.width = "80px"

            Row.insertCell()
            Row.cells(1).innerText = Day
            Row.cells(1).style.width = "50px"

            Row.insertCell()
            Row.cells(2).innerText = Name
            Row.cells(2).style.width = "130px"

            Row.insertCell()
            Row.cells(3).innerHTML = "<input type='text' PrevTime='00:00' class='TxtControls' style='width:50px' onblur='MakeXml(this)'  value='00:00' onfocus='OnFocuseTxt(this)' onkeydown='OnKeyDownTime(this)'>";
            Row.cells(3).style.width = "810px"
        }
        //============================================OnFocuseTxt===============================================}
        function OnFocuseTxt(obj) {
            obj.select();
        }
        //============================================chkEmty===============================================
        function chkEmty(obj) {
            if (obj.value != "" && obj.value != "00:00" && obj.nextSibling == null) {
                obj.parentElement.innerHTML = obj.parentElement.innerHTML + "<select PrevcmbTime='00:00' onblur='MakeXml(this)' class='TxtControls' style='width:150px'>" + document.getElementById(MasterObj + "cmbCode").innerHTML + "</select><input type='text' PrevTime='00:00' class='TxtControls' style='width:50px' onblur='MakeXml(this)' value='00:00' onfocus='OnFocuseTxt(this)' onkeydown='OnKeyDownTime(this)'>"
            }
        }
        //===========================================OnClickBtnDel================================================
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                if (confirm("آيا براي حذف مطمئن هستید?")) {
                    LastSelectedRow.cells[3].innerText = "";
                    LastSelectedRow.cells[3].innerHTML = "<input type='text'  class='TxtControls' style='width:50px' onblur='MakeXml(this)'  value='00:00' onfocus='OnFocuseTxt(this)' onkeydown='OnKeyDownTime(this)'>"
                    $get(MasterObj + "txtXmlSave").value = "<Root>	<TbCode><Date>" + LastSelectedRow.Date + "</Date><Time>00:00</Time><Code>0</Code><PersonID>" + LastSelectedRow.PersonID + "</PersonID></TbCode></Root>";
                    ISDeleteTime = 1;
                    //----------------حذف از صفحه
                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML("<Root>" + str + "</Root>");

                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[PersonID=" + LastSelectedRow.PersonID + " and Date='" + LastSelectedRow.Date + "']");
                    if (oXmlNodes.length > 0) {
                        for (var i = 0; i <= oXmlNodes.length - 1; i++) {
                            oXmlDoc.documentElement.removeChild(oXmlNodes[i])
                        }
                        str = oXmlDoc.xml;
                        str = str.replace("</Root>", "");
                        str = str.replace("<Root>", "");
                        str = str.replace("<Root/>", "");

                    }
                    //----------------------------------
                    $get(MasterObj + "txtSubmit").value = "Modify";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("به منظور حذف يک سطر را انتخاب کنيد");
        }
        //=====================================chkchange======================================================
        function chkchange(obj) {
            for (var i = 0; i < obj.parentElement.childNodes.length - 1; i++)
                if (obj.parentElement.childNodes(i).tagName == "INPUT")
                    if (obj.parentElement.childNodes.length - 1 >= (i + 2)) {
                        if (obj.parentElement.childNodes(i + 2).value != "00:00")
                            if (obj.parentElement.childNodes(i).value >= obj.parentElement.childNodes(i + 2).value) {
                                alert("زمان وارد شده بایستی بیشتر از زمان قبلی باشد")
                                obj.parentElement.childNodes(i + 2).select();
                                return false;
                            }
                    }
            return true;
        }
        //======================================chkchangecmb=====================================================
        function chkchangecmb(obj) {
            for (var i = 0; i <= obj.parentElement.childNodes.length - 1; i++) {
                if (obj.parentElement.childNodes(i).tagName == "SELECT")

                    if (obj.parentElement.childNodes.length - 1 >= (i + 2)) {
                        if (obj.parentElement.childNodes(i).value == obj.parentElement.childNodes(i + 2).value) {
                            alert("مقادیر کمبوها یکسان است")
                            obj.parentElement.childNodes(i + 2).setActive();
                            return false;
                        }
                    }
            }
            return true;
        }
        //==============================Style on click Grid=====
        function onClickGrdTrafficCredit(obj) {
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "GrdTrafficCredit") {
                for (i = 0; i < GrdTrafficCredit.rows.length; i++) {
                    if (GrdTrafficCredit.rows(i).className == "CssSelectedItemStyle") {
                        GrdTrafficCredit.rows(i).className = "CssItemHeader4"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
        }
        //=========================================OnClickBtnFilter=============================================
        function OnClickBtnFilter() {
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
            if ($get(MasterObj + "txtSDate").value == "//") $get(MasterObj + "txtSDate").value = "";
            if ($get(MasterObj + "txtEDate").value == "//") $get(MasterObj + "txtEDate").value = "";
            if ($get(MasterObj + "txtSDate").value > $get(MasterObj + "txtEDate").value)
                alert("تاريخ شروع بزرگتر از تاريخ پايان است");
            else {
                $get(MasterObj + "CurPage_X").value = "1"
                var PCode = $get(MasterObj + "cmbPerson_txtCode").value;
                $get(MasterObj + "txtID").value = PCode

                var deptPCode = $get(MasterObj + "cmbDepartment_txtCode").value;
                $get(MasterObj + "txtDeptID").value = deptPCode

                document.getElementById(MasterObj + "txtSubmit").value = "Filter"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //===================================MakeXml=========================================================
        function MakeXml(obj) {
            if (obj.tagName == "INPUT") {
                if (IsvalidTime(obj.value) == false) {
                    Timechk(obj);
                    return
                }
                Timechk(obj);
                if (chkchange(obj) == false)
                    return
            }
            else
                if (chkchangecmb(obj) == false)
                    return
            var oRow = obj.parentElement.parentElement;
            //========================================================           
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            if (str == "<Root/>") str = ""
            oXmlDoc.loadXML("<Root>" + str + "</Root>");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[PersonID=" + oRow.PersonID + " and Date='" + oRow.Date + "']");
            if (oXmlNodes.length > 0) {
                for (var i = 0; i <= oXmlNodes.length - 1; i++) {
                    oXmlDoc.documentElement.removeChild(oXmlNodes[i])
                    str = oXmlDoc.xml;
                    str = str.replace("</Root>", "");
                    str = str.replace("<Root>", "");
                    str = str.replace("<Root/>", "");
                }
            }
            //========================================================
            str = str.replace("</Root>", "");
            str = str.replace("<Root>", "");
            for (var i = 0; i <= obj.parentElement.childNodes.length - 1; i++) {
                if (obj.parentElement.childNodes(i).nodeName == "INPUT") {
                    str += "<TbCode>"
                    str += "<Date>" + oRow.Date + "</Date>";
                    str += "<Time>" + obj.parentElement.childNodes(i).value + "</Time>";
                    if (obj.parentElement.childNodes(i).nextSibling == null)
                        str += "<Code>10101</Code>";
                    else
                        str += "<Code>" + obj.parentElement.childNodes(i).nextSibling.value + "</Code>";
                    str += "<PersonID>" + oRow.PersonID + "</PersonID>";
                    str += "</TbCode>"
                }
            }
            if (obj.tagName == "INPUT")
                chkEmty(obj)

            document.getElementById(MasterObj + "txtXmlSave").value = "<Root>" + str + "</Root>"
        }
        //--------------------------------------------------------------
        function OnClickBtnSave() {
            if (confirm("با ذخيره تردد و مجوزهای وارده کلیه ترددها و مجوزهای روزانه و ساعتی قبلی پرسنل مورد نظر حذف خواهد شد \n آيا براي ادامه مطمئن هستيد؟")) {
                document.getElementById(MasterObj + "txtSubmit").value = "Modify"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
          
    </script>
</asp:Content>
