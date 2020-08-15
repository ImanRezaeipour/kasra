<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ScriptsNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptsNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssAlternatingItemStyle
        {
            direction: rtl;
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            background-color: OldLace;
            border-bottom-style: groove;
        }
        .CssItemStyle
        {
            direction: rtl;
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            background-color: #d5e1fd;
            border-bottom-style: groove;
        }
        .XItemStyle
        {
            background-color: #D5E1FD;
            font-family: tahoma Normal;
            font-size: 15px;
        }
        .style1
        {
            width: 126px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <table id="Toolbar">
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" PageName="ScriptsNew.aspx" />
                        </td>
                    </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        if ($get(MasterObj + "txtAlert").value != "") {

                            if ($get(MasterObj + "txtValidate").value == "1") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                returnValue = 1
                                if ($get(MasterObj + "txtValue").value == "1")
                                    $get(MasterObj + "txtCount").value = (parseInt($get(MasterObj + "txtCount").value) + 1).toString();
                            }
                            else {
                                alert($get(MasterObj + "txtAlert").value);
                                if ($get(MasterObj + "txtValidate").value == "5" && $get(MasterObj + "txtValue").value == "1")
                                    window.close();
                            }
                        }

                        if ($("#" + MasterObj + "txtSubmit").val() == "GetPriority") {
                            $("#" + MasterObj + "txtPriority").val($("#" + MasterObj + "txtGetPriority").val());
//                             if ($get( MasterObj + "txtSubmit").value == "GetPriority") {
//                            $get(MasterObj + "txtPriority").value = $get(MasterObj + "txtGetPriority").value
                        }

                        //-----------------------------------------------------------
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlertStatus").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtKeyaError").value = ""
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //                    alert(document.getElementById(MasterObj + "txtSystem"))
                    //                    if (document.getElementById(MasterObj + "txtSystem").value == "1")
                    //                        document.getElementById('OToolBar_BtnSave').disabled = true;
                </script>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td style="width: 65px">
                                        تاريخ شروع
                                    </td>
                                    <td align="right" style="width: 170px">
                                        <uc4:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 60px">
                                        تاريخ پايان
                                    </td>
                                    <td style="width: 170px">
                                        <uc4:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                    <td style="width: 55px">
                                        نام
                                    </td>
                                    <td style="width: 150px">
                                        <input type="text" name="txtName" id="txtName" runat="server" style="width: 150px"
                                            class="TxtControls" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        مرحله اجرا
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="150px" value="0"
                                            CssClass="TxtControls" onchange="OnChangeCmbStep()">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        اولويت
                                    </td>
                                    <td>
                                        <input type="text" id="txtPriority" style="width: 30px" onkeydown="OnKeyDownNum('integer',this.value)"
                                            runat="server" class="TxtControls" disabled="disabled" /><input id="BtnShowActive"
                                                name="BtnShowActive" class="HeaderStyle" onclick="onClickBtnShowActive()" style="width: 23px;
                                                cursor: pointer; height: 20px;" type="button" value="..." />
                                    </td>
                                    <td>
                                        دسته بندي
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbCategory" runat="server" Height="16px" Width="150px" value="0"
                                            CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        شرح
                                    </td>
                                    <td>
                                        <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 690px; height: 80px"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        متن
                                    </td>
                                    <td>
                                        <textarea id="txtSQLCommand" wrap="OFF" dir="ltr" cols="90" rows="18" style="scrollbar-highlight-color: white;
                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                            position: relative;" runat="server"></textarea>
                                        <%--<textarea dir="ltr" id="txtSQLCommand1" runat="server" class="TxtControls"
                                style="width:850px; overflow:scroll; height: 460px">
                        </textarea> --%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        شروط
                                    </td>
                                    <td>
                                        <textarea dir="ltr" onkeydown="onkeydownCondition()" runat="server" cols="84" rows="25"
                                            style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; position: relative; width: 690px; height: 30px"
                                            id="txtCondition"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        تعداد پارامتر
                                    </td>
                                    <td valign="top">
                                        <input type="text" onblur="onblurtxtParameters()" onkeydown="OnKeyDownNum('integer',this.value)"
                                            id="txtParameters" runat="server" style="width: 40px" class="TxtControls" />
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td valign="top">
                                        <input type="radio" checked runat="server" name="Active" id="rdbActive" />فعال
                                        <input type="radio" runat="server" name="Active" id="rdbMActive" />نيمه فعال
                                        <input type="radio" runat="server" name="Active" id="rdbNoActive" />غير فعال
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <table id="XTabTable_Header" style="width: 590px; height: 26px;">
                                                        <thead style="display: inline">
                                                            <tr>
                                                                <td align="center" class="CssHeaderStyle" width="100px">
                                                                    هشدار اولويت
                                                                </td>
                                                                <td align="center" class="CssHeaderStyle" style="width: 120px">
                                                                    نام پارامتر
                                                                </td>
                                                                <td align="center" class="CssHeaderStyle" width="250px">
                                                                    شرح پارامتر
                                                                </td>
                                                                <%--<td align="center" class="CssHeaderStyle" style="width: 120px">
                                                        مقدار پيش فرض
                                                    </td>--%>
                                                                <td align="center" class="CssHeaderStyle" style="width: 120px">
                                                                    مقدار
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <div style="scrollbar-arrow-color: black; width: 630; border-collapse: separate;
                                                        scrollbar-base-color: #b0c4de; height: 80px; scrollbar-highlight-color: white;
                                                        overflow: auto">
                                                        <table width="590" id="XTabTable">
                                                        </table>
                                                    </div>
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
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <input type="hidden" id="txtScriptID" runat="server" />
                            <input type="hidden" id="txtValue" runat="server" />
                            <input type="hidden" id="txtGetPriority" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divConditionTemplate" style="display: none">
                    <div dir="rtl" align="center" style="scrollbar-arrow-color: black; width: 210px;
                        scrollbar-base-color: #b0c4de; height: 300px; scrollbar-highlight-color: white;
                        overflow: auto; font-family: tahoma Normal;">
                        <table id="GrdConditionTemplate" style="border-style: solid; border-right-color: #6495ed;
                            border-top-color: #87cefa; border-bottom-color: #6495ed; border-left-color: #87cefa;
                            background: #e7eeff; font-family: tahoma Normal; font-weight: bold; font-size: 9pt;
                            border-width: 2px">
                        </table>
                    </div>
                </div>
                <div style="display: none">
                    <input type="text" id="txtConditionTemplate" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtUpdateXml" name="txtUpdateXml" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtUpdateTemplateName" runat="server" class="TxtControls" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id="txtScriptGroups" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtParamValue" name="txtParamValue" runat="server" />
                    <input type="text" id="txtParamDesc" name="txtParamDesc" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtCount" runat="server" />
                    <input type="text" id="txtKeyaCount" runat="server" />
                    <input type="text" id="txtKeyaError" runat="server" />
                    <input type="text" id="txtScriptIDKeya" runat="server" />
                    <input type="text" id="txtViewMode" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        if ($get(MasterObj + "txtViewMode").value == "1") {
            Toolbar.style.display = "none"
        }
        //        $get(MasterObj + "txtDesc").value = ""
        //        $get(MasterObj + "txtSQLCommand").value = ""
        var newrowindex = 0;
        //=======================Close Page Where Key has Problem===================
        if ($get(MasterObj + "txtValidate").value == "5" && $get(MasterObj + "txtValue").value == "1") {
            alert($get(MasterObj + "txtAlert").value);
            if ($get(MasterObj + "txtKeyaError").value == "0")
                window.close();
        }
        //===========================================================================
        BindPage();

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        if (document.getElementById(MasterObj + "txtSystem").value == "1")
            document.getElementById('OToolBar_BtnSave').style.display = "none";

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {

            if ($get(MasterObj + "txtUpdateXml").value != "") {
                var strXml = $get(MasterObj + "txtUpdateXml").value

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptDescription");

                if ($get(MasterObj + "txtScriptID").value != "0") {
                    if (oXmlNodes.length > 0) {
                        var Active = oXmlNodes.item(0).selectSingleNode("Active").text
                        if (Active == 1)
                            $get(MasterObj + "rdbActive").checked = true
                        else if (Active == 2)
                            $get(MasterObj + "rdbMActive").checked = true
                        else
                            $get(MasterObj + "rdbNoActive").checked = true

                        var SDate = oXmlNodes.item(0).selectSingleNode("StartDate").text
                        if (SDate != "") {
                            $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
                            $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
                            $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
                            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                        }
                        else {
                            $get(MasterObj + "KCalSDate_txtDay").value = "01";
                            $get(MasterObj + "KCalSDate_txtMonth").value = "01";
                            $get(MasterObj + "KCalSDate_txtYear").value = "1301";
                            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                        }

                        var EDate = oXmlNodes.item(0).selectSingleNode("EndDate").text
                        if (EDate != "") {
                            $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
                            $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
                            $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
                            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                        }
                        else {
                            $get(MasterObj + "KCalEDate_txtDay").value = "29";
                            $get(MasterObj + "KCalEDate_txtMonth").value = "12";
                            $get(MasterObj + "KCalEDate_txtYear").value = "1399";
                            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                        }

                        $get(MasterObj + "cmbStep").value = oXmlNodes.item(0).selectSingleNode("StepID").text
                        $get(MasterObj + "cmbCategory").value = oXmlNodes.item(0).selectSingleNode("CategoryId").text
                        $get(MasterObj + "txtPriority").value = oXmlNodes.item(0).selectSingleNode("Priority").text
                        $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Description").text
                        $get(MasterObj + "txtCondition").value = oXmlNodes.item(0).selectSingleNode("Condition").text
                        //$get(MasterObj + "txtSQLCommand").value = oXmlNodes.item(0).selectSingleNode("SQLCommand").text
                        $get(MasterObj + "txtName").value = oXmlNodes.item(0).selectSingleNode("Name").text;
                        //                    var Parameters = oXmlNodes.item(0).selectSingleNode("Parameters").text
                        //                    var ParamDescription = oXmlNodes.item(0).selectSingleNode("ParamDescription").text
                        //                    var arr = ParamDescription.split('$')
                        //                    document.getElementById(MasterObj + "txtParameters").value = arr.length - 1
                        document.getElementById(MasterObj + "txtParameters").value = oXmlNodes.length
                        if (document.getElementById(MasterObj + "txtParameters").value == "")
                            document.getElementById(MasterObj + "txtParameters").value = "0"

                        if ((oXmlNodes.length == 1) && (oXmlNodes.item(i).selectSingleNode("ParameterValue").text == "") && (oXmlNodes.item(i).selectSingleNode("ParameterDesc").text == ""))
                            document.getElementById(MasterObj + "txtParameters").value = "0"
                        add_row()
                        var oGrid = document.all.item("XTabTable")
                        var l = oGrid.rows.length
                        //                    for (var i = 0; i < l; i++) {
                        //                        oGrid.rows(i).cells(1).childNodes(0).value = ParamDescription.split('$')[i];
                        //                        oGrid.rows(i).cells(2).childNodes(0).value = Parameters.split('$')[i].substr(4,Parameters.split('$')[i].length-4);
                        //                    }
                        for (var i = 0; i < l; i++) {

                            if (oXmlNodes.item(i).selectSingleNode("Kind").text == "1")
                                oGrid.rows(i).cells(0).childNodes(0).checked = true
                            else
                                oGrid.rows(i).cells(0).childNodes(0).checked = false
                            oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("ParameterDesc").text;
                            oGrid.rows(i).cells(2).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("ParameterDescription").text;
                            oGrid.rows(i).cells(3).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("ParameterValue").text;
                        }
                    }
                }
                else {
                    //                    if (oXmlNodes.length > 0)
                    //                        $get(MasterObj + "txtCount").value = oXmlNodes.item(0).selectSingleNode('Cnt').text.toString();
                    $get(MasterObj + "KCalSDate_txtDay").value = "01";
                    $get(MasterObj + "KCalSDate_txtMonth").value = "01";
                    $get(MasterObj + "KCalSDate_txtYear").value = "1301";
                    $get(MasterObj + "KCalEDate_txtDay").value = "29";
                    $get(MasterObj + "KCalEDate_txtMonth").value = "12";
                    $get(MasterObj + "KCalEDate_txtYear").value = "1399";
                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

                }
            }
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnInsertParameterInstance() {
            var strUrl = "ScriptParameter.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=" + $get(MasterObj + "txtSystem").value
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 600px;dialogWidth: 950px;center: Yes;help: no;status: no;scroll:no')
            document.getElementById(MasterObj + "txtScriptGroups").value = rValue

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCodedifinition() {
            var strUrl = "DifinitionCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no;scroll:no')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById('OToolBar_BtnSave').style.display = "inline";
            document.getElementById(MasterObj + "txtSystem").value = ""
            $get(MasterObj + "txtScriptID").value = "0"

            $get(MasterObj + "KCalSDate_txtDay").value = "01";
            $get(MasterObj + "KCalSDate_txtMonth").value = "01";
            $get(MasterObj + "KCalSDate_txtYear").value = "1301";
            $get(MasterObj + "KCalEDate_txtDay").value = "29";
            $get(MasterObj + "KCalEDate_txtMonth").value = "12";
            $get(MasterObj + "KCalEDate_txtYear").value = "1399";
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            $get(MasterObj + "rdbActive").checked = true
            $get(MasterObj + "txtPriority").value = ""
            $get(MasterObj + "cmbStep").value = 0
            $get(MasterObj + "cmbCategory").value = 0
            $get(MasterObj + "txtName").value = ""
            $get(MasterObj + "txtDesc").value = ""
            $get(MasterObj + "txtSQLCommand").value = ""
            $get(MasterObj + "txtParameters").value = ""
            $get(MasterObj + "txtCondition").value = ""
            Cleargrd(XTabTable)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty() == true) {
                MakeXML()
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            if ($get(MasterObj + "txtScriptID").value == "")
                $get(MasterObj + "txtScriptID").value = "0"
            var Active = 1
            if (document.getElementById(MasterObj + "rdbNoActive").checked)
                Active = 0
            else if (document.getElementById(MasterObj + "rdbMActive").checked)
                Active = 2
            var XMLStr = "<Tb>"
            XMLStr = XMLStr + "<ID>" + document.getElementById(MasterObj + "txtScriptID").value + "</ID>"
            XMLStr = XMLStr + "<Step>" + document.getElementById(MasterObj + "cmbStep").value + "</Step>"
            if (document.getElementById(MasterObj + "cmbCategory").value != 0)
                XMLStr = XMLStr + "<Category>" + document.getElementById(MasterObj + "cmbCategory").value + "</Category>"
            XMLStr = XMLStr + "<Desc>" + document.getElementById(MasterObj + "txtDesc").value + "</Desc>"
            //XMLStr = XMLStr + "<SQLCommand>" + document.getElementById(MasterObj + "txtSQLCommand").value + "</SQLCommand>"
            XMLStr = XMLStr + "<Parameters>" + document.getElementById(MasterObj + "txtParameters").value + "</Parameters>"
            //            XMLStr = XMLStr + "<ParametersDesc>" + MakeParametersDesc() + "</ParametersDesc>"
            //            XMLStr = XMLStr + "<Parametersvalue>" + MakeParametersvalue() + "</Parametersvalue>"
            XMLStr = XMLStr + "<SDate>" + SDate + "</SDate>"
            XMLStr = XMLStr + "<EDate>" + EDate + "</EDate>"
            XMLStr = XMLStr + "<Name>" + $get(MasterObj + "txtName").value + "</Name>"
            XMLStr = XMLStr + "<Priority>" + $get(MasterObj + "txtPriority").value + "</Priority>"
            XMLStr = XMLStr + "<Active>" + Active + "</Active>"
            XMLStr = XMLStr + "<TemplateName></TemplateName>"
            XMLStr = XMLStr + "<Type>3</Type>"
            XMLStr = XMLStr + "</Tb>"
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + MakeParameters() + document.getElementById(MasterObj + "txtScriptGroups").value + "</Root>"
            //alert(document.getElementById(MasterObj + "txtXml").value)           
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeParameters() {
            var oGrid = document.all.item("XTabTable")
            var l = oGrid.rows.length
            var i, str = ""
            for (i = 0; i < l; i++) {
                str = str + "<Parameter>"
                str = str + "<ParameterName>" + oGrid.rows(i).cells(1).firstChild.value + "</ParameterName>"

                str = str + "<ParameterValue>" + oGrid.rows(i).cells(3).firstChild.value + "</ParameterValue>"
                if (oGrid.rows(i).cells(0).firstChild.checked)
                    str = str + "<PriorityHint>1</PriorityHint>"
                else
                    str = str + "<PriorityHint>0</PriorityHint>"
                str = str + "<Desc>" + oGrid.rows(i).cells(2).firstChild.value + "</Desc>"
                str = str + "<ParameterNO>" + oGrid.rows(i).ParameterNO + "</ParameterNO>"
                str = str + "</Parameter>"
            }
            return str;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
                alert("لطفا تاريخ شروع را انتخاب نمائيد")
                return false;
            }
            if ($get(MasterObj + "txtName").value.trim() == "") {
                alert("لطفا نام  را انتخاب نمائيد")
                $get(MasterObj + "txtName").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "") {
                alert("لطفا تاريخ خاتمه را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbStep").value == 0) {
                alert("لطفا مرحله اجرا را انتخاب نمائيد")
                document.getElementById(MasterObj + "cmbStep").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "txtPriority").value == "") {
                alert("لطفا اولويت را وارد نمائيد")
                document.getElementById(MasterObj + "txtPriority").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDesc").value.trim() == "") {
                alert("لطفا شرح را وارد نمائيد")
                document.getElementById(MasterObj + "txtDesc").focus()
                return false;
            }
            else if (checkEmptyParametersDesc()) {
                return false
            }
            //            else if ($get(MasterObj + "txtCount").value >= $get(MasterObj + "txtKeyaCount").value && $get(MasterObj + "txtScriptID").value == "0" && $get(MasterObj + "txtValue").value == "1") {
            //                alert(".تعداد قانون های ثبت شده بیشتر از حد مجاز است ");
            //                return false;
            //            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkEmptyParametersDesc() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length

            for (i = 0; i < lll; i++) {

                if ((oGrid.rows(i).cells(1).childNodes(0).value == "")) {
                    alert("لطفا نام پارامتر " + parseInt(parseInt(i) + 1) + " ام را وارد کنيد")
                    return true;
                }
                //                else if ((oGrid.rows(i).cells(2).childNodes(0).value == "")) {
                //                    alert("لطفا شرح پارامتر " + parseInt(i) + 1 + " ام را وارد کنيد")
                //                    
                //                    return true;
                //                }
                else if ((oGrid.rows(i).cells(3).childNodes(0).value == "")) {
                    alert("لطفا مقدار پارامتر " + parseInt(parseInt(i) + 1) + "ام را وارد کنيد")
                    return true;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurtxtParameters() {
            var oGrid = document.all.item("XTabTable")
            if (document.getElementById(MasterObj + "txtParameters").value == "")
                document.getElementById(MasterObj + "txtParameters").value = "0"
            var count = document.getElementById(MasterObj + "txtParameters").value
            var l = oGrid.rows.length
            if (l < count) {
                add_row()
            }
            else if (l > count) {
                if (confirm("تعداد پارامترها از تعداد پارامترهاي موجود کمتر است ،با حذف " + (l - count) + "پارامتر از پارامترهاي موجود موافقيد ؟") == true)
                    Remove_row()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Remove_row() {
            var oGrid = document.all.item("XTabTable")
            var count = document.getElementById(MasterObj + "txtParameters").value
            var l = oGrid.rows.length
            var a
            for (a = newrowindex - 1; a >= count; a--) {
                newrowindex = newrowindex - 1
                oGrid.deleteRow(a)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function add_row() {
            var oGrid = document.all.item("XTabTable")
            var count = document.getElementById(MasterObj + "txtParameters").value
            var r = newrowindex
            var l = oGrid.rows.length

            for (newrowindex = r; newrowindex < count; newrowindex++) {
                oGrid.insertRow()
                oGrid.rows(newrowindex).className = "XItemStyle";
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(0).innerHTML = "<INPUT  type='checkbox' >"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 110px;'>"//"پارامتر " + parseInt(parseInt(newrowindex) + 1) + ":"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(2).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 240px;'>"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(3).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 110px;'>"
                //                oGrid.rows(newrowindex).insertCell()
                //                oGrid.rows(newrowindex).cells(4).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 110px;'>"

                oGrid.rows(newrowindex).align = "center"
                oGrid.rows(newrowindex).cells(0).style.width = "100px"
                oGrid.rows(newrowindex).cells(1).style.width = "120px"
                oGrid.rows(newrowindex).cells(2).style.width = "250px"
                oGrid.rows(newrowindex).cells(3).style.width = "120px"
                //                oGrid.rows(newrowindex).cells(4).style.width = "120px"
                oGrid.rows(newrowindex).cells(0).style.border = 0
                oGrid.rows(newrowindex).cells(1).style.border = 0
                oGrid.rows(newrowindex).cells(2).style.border = 0
                oGrid.rows(newrowindex).cells(3).style.border = 0
                //                oGrid.rows(newrowindex).cells(4).style.border = 0

                if ((newrowindex % 2) == 0) {
                    oGrid.rows(newrowindex).cells(0).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(1).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(2).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(3).className = "CssItemStyle"
                    //                    oGrid.rows(newrowindex).cells(4).className = "CssItemStyle"
                }
                else {
                    oGrid.rows(newrowindex).cells(0).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(1).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(2).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(3).className = "CssAlternatingItemStyle"
                    //                    oGrid.rows(newrowindex).cells(4).className = "CssAlternatingItemStyle"
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectGroup() {
            var strUrl = "ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=" + $get(MasterObj + "txtSystem").value
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no;scroll:no')
            document.getElementById(MasterObj + "txtScriptGroups").value = rValue

        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnShowActive() {
            if (document.getElementById(MasterObj + "cmbStep").value == "" || document.getElementById(MasterObj + "cmbStep").value == "0")
                alert("مرحله اجرا را انتخاب کنيد")
            else {

                var strUrl = "ShowActiveScript.aspx?StepID=" + document.getElementById(MasterObj + "cmbStep").value
                   + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                             + "&Priority=" + $get(MasterObj + "txtGetPriority").value
                            + "&StepName=" + document.getElementById(MasterObj + "cmbStep")[document.getElementById(MasterObj + "cmbStep").selectedIndex].text
                             + "&ScriptName=" + $get(MasterObj + "txtName").value
                strUrl = encodeURI(strUrl)
                rr = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 600px;center: Yes;help: no;status: no;scroll:off')
                if (rr != undefined)
                    document.getElementById(MasterObj + "txtPriority").value = rr
            }
        }


        //==================================================================================================

        var oPopup = window.createPopup()
        var newrowindexGrd = 0

        //==================================================================================================
        function ShowPopUpcondition() {
            if (newrowindexGrd == 0)
                return
            var oPopupBody = oPopup.document.body
            oPopupBody.className = "CssPage"
            oPopupBody.style.backgroundColor = "#e7eeff"
            oPopupBody.dir = "rtl"
            oPopup.document.body.innerHTML = document.getElementById("divConditionTemplate").innerHTML

            oPopup.show(150, 300, 210, 200)
        }
        //==================================================================================================

        function AddRowCondition(Title) {
            var oGrid = document.getElementById("GrdConditionTemplate")
            oGrid.insertRow()

            if (newrowindexGrd % 2 == 0)
                oGrid.rows(newrowindexGrd).style.backgroundColor = "#d5e1fd"
            else
                oGrid.rows(newrowindexGrd).style.backgroundColor = "OldLace"

            oGrid.rows(newrowindexGrd).insertCell()
            oGrid.rows(newrowindexGrd).cells(0).innerText = Title
            oGrid.rows(newrowindexGrd).cells(0).align = "Right"
            oGrid.rows(newrowindexGrd).cells(0).style.width = "200px"
            newrowindexGrd++;
        }
        //==================================================================================================
        function CreateDivCondition() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            var strc = document.getElementById(MasterObj + "txtConditionTemplate").value
            oXmlDoc.loadXML(strc);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ConditionTemplate");

            for (var i = 0; i < oXmlNodes.length; i++)
                AddRowCondition(oXmlNodes.item(i).selectSingleNode("Title").text);
        }
        //==================================================================================================
        CreateDivCondition(); //ايجاد دیو مربوظ به راهنمای کلید ها
        function onkeydownCondition() {
            if (event.keyCode == 113) {
                ShowPopUpcondition()
            }
        }
        //==================================================================================================
        window.focus()
        //---------------------------------------------------------------------------------------------
        function OnChangeCmbStep() {
            $("#" + MasterObj + "txtSubmit").val("GetPriority")
            $("#" + MasterObj + "BtnSubmit").click();
        }
    </script>
</asp:Content>
