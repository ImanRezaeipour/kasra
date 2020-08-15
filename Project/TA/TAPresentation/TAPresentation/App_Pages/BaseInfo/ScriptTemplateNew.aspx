<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ScriptTemplateNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptTemplateNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
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
            font-family: Kasra Traffic Normal;
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <table id="Toolbar" width="100%">
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptTemplateNew.aspx" />
                        </td>
                    </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">

                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {

                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        if ($get(MasterObj + "txtAlert").value != "") {
                            if ($get(MasterObj + "txtValidate").value == "1") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                returnValue = 1
                                $get(MasterObj + "txtCount").value = (parseInt($get(MasterObj + "txtCount").value) + 1).toString();
                            }
                            else {
                                alert($get(MasterObj + "txtAlert").value);
                                if ($get(MasterObj + "txtValue").value == "1")
                                    $get(MasterObj + "txtCount").value = (parseInt($get(MasterObj + "txtCount").value) + 1).toString();
                                if ($get(MasterObj + "txtValidate").value == "5" && $get(MasterObj + "txtValue").value == "1")
                                    window.close();
                            }

                        }
                        if ($get(MasterObj + "txtSubmit").value == "changecmbTemplateName") {

                            if ($get(MasterObj + "txtTemplateXML").value != "") {
                                var strXml = $get(MasterObj + "txtTemplateXML").value
                                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                                oXmlDoc.async = "false";
                                oXmlDoc.loadXML(strXml);
                                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/TemplateDescription");

                                if (oXmlNodes.length > 0) {

                                    $get(MasterObj + "cmbStep").value = oXmlNodes.item(0).selectSingleNode("StepID").text
                                    $get(MasterObj + "txtSQLCommand").value = oXmlNodes.item(0).selectSingleNode("TemplateCommand").text

                                    $get(MasterObj + "txtParameters").value = oXmlNodes.item(0).selectSingleNode("Parameters").text
                                    var ParamDescription = oXmlNodes.item(0).selectSingleNode("ParamDescription").text
                                    var oGrid = document.all.item("XTabTable")
                                    Cleargrd(oGrid)
                                    if (document.getElementById(MasterObj + "txtParameters").value == "")
                                        document.getElementById(MasterObj + "txtParameters").value = "0"

                                    var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetParameter");

                                    var l = oXmlNodes1.length
                                    for (var i = 0; i < l; i++) {

                                        $get(MasterObj + "txtParameterType").value = oXmlNodes1.item(i).selectSingleNode("ParameterType").text
                                        if ($get(MasterObj + "txtParameterType").value != "")
                                            add_row(oGrid, $get(MasterObj + "txtParameterType").value);
                                        else
                                            add_row(oGrid, "Text");

                                        oGrid.rows(i).setAttribute("ParameterNO", oXmlNodes1.item(i).selectSingleNode("ID").text)
                                        oGrid.rows(i).setAttribute("XMLType", oXmlNodes1.item(i).selectSingleNode("XMLType").text)

                                        //-------------------------مقدار دهی سلول0 -------------------------------------------------
                                        oGrid.rows(i).cells(0).title = oXmlNodes1.item(i).selectSingleNode("Name").text;
                                        if (oXmlNodes1.item(i).selectSingleNode("Name").text.length > 20)
                                            oGrid.rows(i).cells(0).innerText = oXmlNodes1.item(i).selectSingleNode("Name").text.substr(0, 20) + '...'
                                        else
                                            oGrid.rows(i).cells(0).innerText = oXmlNodes1.item(i).selectSingleNode("Name").text
                                        //-------------------------مقدار دهی سلول 1-------------------------------------------------
                                        if ($get(MasterObj + "txtParameterType").value != "") {
                                            if ($get(MasterObj + "txtParameterType").value == "Combo") {
                                                onchangeParamType(oGrid.rows(i).cells(1).childNodes(0), oXmlNodes1.item(i).selectSingleNode("XMLType").text)
                                                oGrid.rows(i).cells(1).childNodes(0).value = 0;

                                            }
                                            //                                            else if($get(MasterObj+"txtParameterType").value=="Time")
                                            //                                                oGrid.rows(i).cells(1).childNodes(0).value = "00:00";
                                            else
                                                oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes1.item(i).selectSingleNode("default").text;
                                        }
                                        //-------------------------مقدار دهی سلول 2-------------------------------------------------
                                        oGrid.rows(i).cells(2).title = oXmlNodes1.item(i).selectSingleNode("Desc").text;
                                        if (oXmlNodes1.item(i).selectSingleNode("Desc").text.length > 30)
                                            oGrid.rows(i).cells(2).innerText = oXmlNodes1.item(i).selectSingleNode("Desc").text.substr(0, 30) + '...';
                                        else
                                            oGrid.rows(i).cells(2).innerText = oXmlNodes1.item(i).selectSingleNode("Desc").text;
                                        //-------------------------مقدار دهی سلول 3-------------------------------------------------
                                        if ($get(MasterObj + "txtParameterType").value != "") {
                                            oGrid.rows(i).cells(3).title = oGrid.rows(i).cells(1).childNodes(0).value
                                            if (oGrid.rows(i).cells(1).childNodes(0).value.length > 20)
                                                oGrid.rows(i).cells(3).innerText = oGrid.rows(i).cells(1).childNodes(0).value.substr(0, 20) + '...'
                                            else
                                                oGrid.rows(i).cells(3).innerText = oGrid.rows(i).cells(1).childNodes(0).value
                                        }
                                        //------------------------------------------------------------------------------------------------
                                        if ($get(MasterObj + "txtParameterType").value == "Time")
                                            oGrid.rows(i).cells(1).childNodes(0).value = "00:00";
                                        //-------------------------مقدار دهی سلول 4-------------------------------------------------
                                        if (oXmlNodes1.item(i).selectSingleNode("Kind").text == "1")
                                            oGrid.rows(i).cells(4).childNodes(0).src = "../../App_Utility/Images/Icons/BlueTick.gif"
                                        else
                                            oGrid.rows(i).cells(4).childNodes(0).src = "../../App_Utility/Images/Icons/Cross.gif"
                                    }
                                }
                            }
                            //-------------------For Getting Priority---------------------------------
                            var oXmlNodesPrio = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetPriority");
                            if (oXmlNodesPrio.length > 0) {
                                $get(MasterObj + "txtPriority").value = oXmlNodesPrio.item(0).selectSingleNode("Priority").text
                                $get(MasterObj + "txtGetPriority").value = oXmlNodesPrio.item(0).selectSingleNode("Priority").text
                            }
                            //---------------------------------------------------------------------------
                        }

                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlertStatus").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtKeyaError").value = ""
                    }
                </script>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" style="border: 1px groove #4B0082; height: 25px;
                    background-color: #CCCCFF;">
                    <tr>
                        <td id="TabDifineRole" style="border: 1px groove #4B0082; width: 100px; height: 25px;"
                            align="center" class="TabSelect" onclick="onclcikTab(this,'TblDefineRole')">
                            تعريف قانون
                        </td>
                        <td style="border: 1px groove #4B0082; width: 100px; height: 25px;" align="center"
                            class="TabSelect" onclick="onclcikTab(this,'TblCondition')">
                            شروط
                        </td>
                        <td style="border: 1px groove #4B0082; width: 100px; height: 25px;" align="center"
                            class="TabSelect" onclick="onclcikTab(this,'TblRoleText')">
                            متن قانون
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #4B0082; height: 5px;">
            </td>
        </tr>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td>
                <!------------------------------------------------تعریف قانون------------------------------------------>
                <table id="TblDefineRole" style="display: inline; width: 840px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 65px">
                                        تاريخ شروع
                                    </td>
                                    <td align="right" style="width: 275px">
                                        <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 60px">
                                        تاريخ پايان
                                    </td>
                                    <td style="width: 170px">
                                        <uc2:KCalendar ID="KCalEDate" runat="server" />
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
                                        نام الگو
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbTemplateName" runat="server" onchange="onchangecmbTemplateName()"
                                            Height="16px" Width="310px" value="0" CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        مرحله اجرا
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="150px" value="0"
                                            CssClass="TxtControls" Enabled="false">
                                        </asp:DropDownList>
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
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="width: 77px">
                                        شرح
                                    </td>
                                    <td>
                                        <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 702px; height: 80px">
                                        </textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="width: 77px">
                                        اولويت
                                    </td>
                                    <td valign="top" style="width: 200px">
                                        <input type="text" id="txtPriority" style="width: 40px" onkeydown="OnKeyDownNum('integer',this.value)"
                                            runat="server" class="TxtControls" disabled="disabled" />
                                        <input id="BtnShowActive" name="BtnShowActive" class="HeaderStyle" onclick="onClickBtnShowActive()"
                                            style="width: 25px; cursor: pointer; height: 22px;" type="button" value="..." />
                                    </td>
                                    <td style="width: 75px">
                                        وضعيت
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbStatus" runat="server" CssClass="TxtControls" Width="150px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" align="center">
                                <tr>
                                    <td>
                                        <table id="XTabTable_Header" style="width: 770px; height: 26px;">
                                            <thead style="display: inline">
                                                <tr>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام پارامتر
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 205px">
                                                        مقدارنمايشی
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" width="250px">
                                                        شرح پارامتر
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        مقدار
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" width="100px">
                                                        هشدار اولويت
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <div style="scrollbar-arrow-color: black; width: 810; border-collapse: separate;
                                            scrollbar-base-color: #b0c4de; height: 300px; scrollbar-highlight-color: white;
                                            overflow: auto">
                                            <table width="770" id="XTabTable" onclick="onClickXTabTable()">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!------------------------------------------------شروط------------------------------------------------>
                <table id="TblCondition" style="display: inline; width: 830px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        شروط
                                    </td>
                                    <td>
                                        <textarea dir="ltr" id="txtCondition" onkeydown="onkeydownCondition()" runat="server"
                                            cols="90" rows="25" style="scrollbar-highlight-color: white; overflow: auto;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; position: relative;"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!------------------------------------------------متن قانون------------------------------------------------>
                <table id="TblRoleText" style="display: inline; width: 830px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        متن
                                    </td>
                                    <td>
                                        <textarea disabled dir="ltr" id="txtSQLCommand" runat="server" cols="90" rows="25"
                                            style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; position: relative;">
                                        </textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!------------------------------------------------------------------------------------------------------------->
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtTemplateXML" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <input type="hidden" id="txtScriptID" runat="server" />
                            <input type="hidden" id="txtValue" runat="server" />
                            <asp:HiddenField ID="ScriptXmlFromParent" runat="server" />
                            <asp:DropDownList ID="cmbXmlType" runat="server">
                            </asp:DropDownList>
                            <asp:HiddenField ID="txtGetPriority" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr id="test">
            <td>
                <div id="divConditionTemplate" style="display: none">
                    <div dir="rtl" align="center" style="scrollbar-arrow-color: black; width: 210px;
                        scrollbar-base-color: #b0c4de; height: 300px; scrollbar-highlight-color: white;
                        overflow: auto; font-family: Kasra Traffic Normal;">
                        <table id="GrdConditionTemplate" style="border-style: solid; border-right-color: #6495ed;
                            border-top-color: #87cefa; border-bottom-color: #6495ed; border-left-color: #87cefa;
                            background: #e7eeff; font-family: Kasra Traffic Normal; font-weight: bold; font-size: 9pt;
                            border-width: 2px">
                        </table>
                    </div>
                </div>
                <div style="display: none">
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
                    <input type="text" id="txtParameters" runat="server" />
                    <input type="text" id="txtPageID" runat="server" />
                    <input type="text" id="txtConditionTemplate" runat="server" />
                    <input type="text" id="txtParameterType" runat="server" />
                    <input type="text" id="txtXmlType" runat="server" />
                    <input type="text" id="txtCount" runat="server" />
                    <input type="text" id="txtKeyaCount" runat="server" />
                    <input type="text" id="txtKeyaError" runat="server" />
                    <input type="text" id="txtDLookUp" runat="server" />
                    <input type="text" id="txtScriptIDKeya" runat="server" />
                    <input type="text" id="txtCreditID" runat="server" />
                    <input type="text" id="txtScriptGroupXML" runat="server" />
                    <input type="text" id="txtScriptPersonXML" runat="server" />
                    <input type="text" id="txtViewMode" runat="server" />
                    <input type="text" id="txtPesonCode" runat="server" />
                    <input type="text" id="XmlAllPerson" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery.xmlDom.js"></script>
    <%--<script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>--%>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var SelectedTab;
        var StrG = "";
        onclcikTab(TabDifineRole, "TblDefineRole");
        document.getElementsByTagName("body")[0].scroll = "no";
        if ($get(MasterObj + "txtViewMode").value == "1") {
            Toolbar.style.display = "none"
        }
        //-------------------------------------------------------------------------------------
        $get(MasterObj + "txtDesc").value = ""
        $get(MasterObj + "txtSQLCommand").value = ""
        var newrowindex = 0;
        BindPage();
        if (document.getElementById(MasterObj + "txtSystem").value == "1")
            document.getElementById('OToolBar_BtnSave').style.display = "none";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //=======================Close Page Where Key has Problem===================
        if ($get(MasterObj + "txtValidate").value == "5" && $get(MasterObj + "txtValue").value == "1") {
            alert($get(MasterObj + "txtAlert").value);
            if ($get(MasterObj + "txtKeyaError").value == "0")
                window.close();
        }
        //===========================================================================
        function BindPage() {
            if ($get(MasterObj + "txtUpdateXml").value != "") {
                var strXml = $get(MasterObj + "txtUpdateXml").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptDescription");
                if ($get(MasterObj + "txtScriptID").value != "0") {

                    if (oXmlNodes.length > 0) {

                        $get(MasterObj + "cmbStatus").value = oXmlNodes.item(0).selectSingleNode("Active").text

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
                        $get(MasterObj + "cmbTemplateName").value = oXmlNodes.item(0).selectSingleNode("TemplateName").text
                        $get(MasterObj + "cmbStep").value = oXmlNodes.item(0).selectSingleNode("StepID").text
                        $get(MasterObj + "cmbCategory").value = oXmlNodes.item(0).selectSingleNode("CategoryId").text
                        $get(MasterObj + "txtPriority").value = oXmlNodes.item(0).selectSingleNode("Priority").text
                        $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Description").text
                        $get(MasterObj + "txtSQLCommand").value = oXmlNodes.item(0).selectSingleNode("SQLCommand").text
                        $get(MasterObj + "txtName").value = oXmlNodes.item(0).selectSingleNode("Name").text
                        //$get(MasterObj + "txtCondition").value = oXmlNodes.item(0).selectSingleNode("Condition").text
                        //                   var Parameters = oXmlNodes.item(0).selectSingleNode("Parameters").text
                        //                   var ParamDescription = oXmlNodes.item(0).selectSingleNode("ParamDescription").text
                        //                   var arr = ParamDescription.split('$')
                        //                   document.getElementById(MasterObj + "txtParameters").value = arr.length-1
                        document.getElementById(MasterObj + "txtParameters").value = oXmlNodes.length
                        if (document.getElementById(MasterObj + "txtParameters").value == "")
                            document.getElementById(MasterObj + "txtParameters").value = "0"
                        if ((oXmlNodes.length == 1) && (oXmlNodes.item(0).selectSingleNode("ParameterValue").text == "") && (oXmlNodes.item(0).selectSingleNode("ParameterDesc").text == ""))
                            document.getElementById(MasterObj + "txtParameters").value = "0"

                        LoadGrid(oXmlNodes)

                        //                    for (var i = 0; i < l; i++) {
                        //                        oGrid.rows(i).cells(1).innerText = oXmlNodes.item(i).selectSingleNode("ParameterDesc").text;
                        //                        oGrid.rows(i).cells(2).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("ParameterValue").text;
                        //                    }
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
        //-------------------------------------------------------------------------------
        function LoadGrid(oXmlNodes) {
            var l = oXmlNodes.length//oGrid.rows.length
            for (var i = 0; i < l; i++) {
                $get(MasterObj + "txtParameterType").value = oXmlNodes.item(i).selectSingleNode("ParameterType").text
                var oGrid = document.all.item("XTabTable")
                if ($get(MasterObj + "txtParameterType").value != "")
                    add_row(oGrid, $get(MasterObj + "txtParameterType").value)
                else {
                    add_row(oGrid, "Text")
                    $get(MasterObj + "txtParameterType").value = "Text";
                }
                oGrid.rows(i).setAttribute("ParameterNO", oXmlNodes.item(i).selectSingleNode("ParameterNO").text)
                oGrid.rows(i).setAttribute("XMLType", oXmlNodes.item(i).selectSingleNode("XMLType").text)
                //-------------------------مقدار دهی سلول0 -------------------------------------------------
                oGrid.rows(i).cells(0).title = oXmlNodes.item(i).selectSingleNode("ParameterDesc").text;
                if (oXmlNodes.item(i).selectSingleNode("ParameterDesc").text.length > 20)
                    oGrid.rows(i).cells(0).innerText = oXmlNodes.item(i).selectSingleNode("ParameterDesc").text.substr(0, 20) + '...';
                else
                    oGrid.rows(i).cells(0).innerText = oXmlNodes.item(i).selectSingleNode("ParameterDesc").text
                //-------------------------مقدار دهی سلول 1-------------------------------------------------
                if ($get(MasterObj + "txtParameterType").value != "") {
                    if ($get(MasterObj + "txtParameterType").value == "Combo") {
                        onchangeParamType(oGrid.rows(i).cells(1).childNodes(0), oXmlNodes.item(i).selectSingleNode("XMLType").text)
                        oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("Value").text
                        if (oXmlNodes.item(i).selectSingleNode("Value").text == "")
                            oXmlNodes.item(i).selectSingleNode("Value").text = "0"
                        oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("Value").text;
                    }
                    else {
                        oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes.item(i).selectSingleNode("ParameterValue").text;
                        oGrid.rows(i).cells(1).childNodes(0).title = oXmlNodes.item(i).selectSingleNode("ParameterValue").text;
                        if ($get(MasterObj + "txtParameterType").value == "Code/Int")
                            if (getCntChar(',', oGrid.rows(i).cells(1).childNodes(0).value) != 0)
                                oGrid.rows(i).cells(1).childNodes(0).disabled = true;
                        if ($get(MasterObj + "txtParameterType").value == "Time" && oXmlNodes.item(i).selectSingleNode("ParameterValue").text == "") {
                            oGrid.rows(i).cells(1).childNodes(0).value = "00:00"
                            oGrid.rows(i).cells(1).childNodes(0).title = "00:00"
                            oXmlNodes.item(i).selectSingleNode("Value").text = "00:00"
                        }
                        if ($get(MasterObj + "txtParameterType").value == "SelectPerson") {
                            oGrid.rows(i).cells(1).childNodes(1).value = (oXmlNodes.item(i).selectSingleNode("Value").text.trim().substr(0, 1) == "+" ? 0 : (oXmlNodes.item(i).selectSingleNode("Value").text.substr(0, 1) == "-" ? 1 : 2));
                            if (oGrid.rows(i).cells(1).childNodes(1).value == 2)
                                oGrid.rows(i).cells(1).childNodes(2).disabled = true;
                        }
                        if ($get(MasterObj + "txtParameterType").value == "SelectPerson/Group") {

                            oGrid.rows(i).cells(1).childNodes(1).value = (oXmlNodes.item(i).selectSingleNode("Value").text.trim().substr(0, 1) == "+" ? 0 : (oXmlNodes.item(i).selectSingleNode("Value").text.substr(0, 1) == "-" ? 1 : 2));
                            if (oGrid.rows(i).cells(1).childNodes(1).value == 2)
                                oGrid.rows(i).cells(1).childNodes(2).disabled = true;
                        }
                    }
                }
                //-------------------------مقدار دهی سلول 2-------------------------------------------------
                oGrid.rows(i).cells(2).title = oXmlNodes.item(i).selectSingleNode("ParameterDescription").text
                if (oXmlNodes.item(i).selectSingleNode("ParameterDescription").text.length > 30)
                    oGrid.rows(i).cells(2).innerText = oXmlNodes.item(i).selectSingleNode("ParameterDescription").text.substr(0, 30) + '...';
                else
                    oGrid.rows(i).cells(2).innerText = oXmlNodes.item(i).selectSingleNode("ParameterDescription").text
                //-------------------------مقدار دهی سلول 3-------------------------------------------------
                if ($get(MasterObj + "txtParameterType").value != "") {
                    oGrid.rows(i).cells(3).title = oXmlNodes.item(i).selectSingleNode("Value").text
                    if (oXmlNodes.item(i).selectSingleNode("Value").text.length > 20)
                        oGrid.rows(i).cells(3).innerText = oXmlNodes.item(i).selectSingleNode("Value").text.substr(0, 20) + '...';
                    else
                        oGrid.rows(i).cells(3).innerText = oXmlNodes.item(i).selectSingleNode("Value").text;

                }
                //-------------------------مقدار دهی سلول 4-------------------------------------------------
                if (oXmlNodes.item(i).selectSingleNode("Kind").text == "1")
                    oGrid.rows(i).cells(4).childNodes(0).src = "../../App_Utility/Images/Icons/BlueTick.gif"
                else
                    oGrid.rows(i).cells(4).childNodes(0).src = "../../App_Utility/Images/Icons/Cross.gif"

            }

        }
        //--------------------------------------------------------------------------------
        function onClickXTabTable() {
            var oGrid = document.all.item("XTabTable")
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "XTabTable") {
                for (i = 0; i < oGrid.rows.length; i++) {
                    if (oGrid.rows(i).className == "CssSelectedItemStyle") {
                        oGrid.rows(i).className = "CssItemHeader4"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
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
        //        function OnClickBtnNew() {
        //            document.getElementById('OToolBar_BtnSave').style.display = "inline";
        //            document.getElementById(MasterObj + "txtSystem").value = ""
        //            $get(MasterObj + "txtScriptID").value = "0"

        //            $get(MasterObj + "KCalSDate_txtDay").value = "01";
        //            $get(MasterObj + "KCalSDate_txtMonth").value = "01";
        //            $get(MasterObj + "KCalSDate_txtYear").value = "1301";
        //            $get(MasterObj + "KCalEDate_txtDay").value = "29";
        //            $get(MasterObj + "KCalEDate_txtMonth").value = "12";
        //            $get(MasterObj + "KCalEDate_txtYear").value = "1399";
        //            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
        //            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        //            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
        //            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
        //            $get(MasterObj + "rdbActive").checked = true
        //            $get(MasterObj + "txtPriority").value = ""
        //            $get(MasterObj + "cmbStep").value = 0
        //            $get(MasterObj + "cmbCategory").value = 0
        //            $get(MasterObj + "txtName").value = ""
        //            $get(MasterObj + "cmbTemplateName").value = "0"
        //            $get(MasterObj + "txtDesc").value = ""
        //            $get(MasterObj + "txtSQLCommand").value = ""
        //            $get(MasterObj + "txtParameters").value = ""
        //            $get(MasterObj + "txtCondition").value = ""
        //            Cleargrd(XTabTable)
        //        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty() == true) {
                MakeXML()
                //                alert(document.getElementById(MasterObj + "txtXml").value)
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
            //            var Active = 1
            //            if (document.getElementById(MasterObj + "rdbNoActive").checked)
            //                Active = 0
            //            else if (document.getElementById(MasterObj + "rdbMActive").checked)
            //                Active = 2
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
            XMLStr = XMLStr + "<Name>" + document.getElementById(MasterObj + "txtName").value + "</Name>"
            XMLStr = XMLStr + "<SDate>" + SDate + "</SDate>"
            XMLStr = XMLStr + "<EDate>" + EDate + "</EDate>"
            XMLStr = XMLStr + "<Priority>" + $get(MasterObj + "txtPriority").value + "</Priority>"
            XMLStr = XMLStr + "<Active>" + $get(MasterObj + "cmbStatus").value + "</Active>"
            XMLStr = XMLStr + "<TemplateName>" + $get(MasterObj + "cmbTemplateName").value + "</TemplateName>"
            XMLStr = XMLStr + "<Type>2</Type>"
            XMLStr = XMLStr + "</Tb>"
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + MakeParameters() + document.getElementById(MasterObj + "txtScriptGroups").value + "</Root>"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeParameters() {
            var oGrid = document.all.item("XTabTable")
            var l = oGrid.rows.length
            var i, str = ""

            for (i = 0; i < l; i++) {
                str = str + "<Parameter>"
                str = str + "<ParameterValue>" + oGrid.rows(i).cells(1).firstChild.value + "</ParameterValue>"
                str = str + "<Value>" + oGrid.rows(i).cells(3).title + "</Value>"
                str = str + "<ParameterNO>" + oGrid.rows(i).ParameterNO + "</ParameterNO>"
                str = str + "</Parameter>"
            }
            //alert(str)
            return str;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if ($get(MasterObj + "cmbTemplateName").value == "0") {
                alert("لطفا نام الگو را انتخاب نمائيد")
                $get(MasterObj + "cmbTemplateName").focus()
                return false;
            }
            if ($get(MasterObj + "txtName").value.trim() == "") {
                alert("لطفا نام  را انتخاب نمائيد")
                $get(MasterObj + "txtName").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
                alert("لطفا تاريخ شروع را انتخاب نمائيد")
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
            else if (checknotusemines()) {
                return false;
            }
            //            else if ($get(MasterObj + "txtCount").value >= $get(MasterObj + "txtKeyaCount").value && $get(MasterObj + "txtScriptID").value == "0" && $get(MasterObj + "txtValue").value == "1") {
            //                alert(".تعداد قانون های ثبت شده بیشتر از حد مجاز است ");
            //                return false;
            //            }
            else
                return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkEmptyParametersDesc() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length
            for (var i = 0; i < lll; i++) {
                if ((oGrid.rows(i).cells(4).childNodes(0).value == "")) {
                    alert("لطفا مقدار پارامتر " + parseInt(parseInt(i) + 1) + "ام را وارد کنيد")
                    return true;
                }
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
        function add_row(oGrid, Param) {

            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "XItemStyle";

            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            MakeObjParamType(oGrid, newrowindex, Param)
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()

            oGrid.rows(newrowindex).cells(4).innerHTML = "<img src='' />"

            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "150px"
            oGrid.rows(newrowindex).cells(1).style.width = "200px"
            oGrid.rows(newrowindex).cells(2).style.width = "250px"
            oGrid.rows(newrowindex).cells(3).style.width = "150px"
            oGrid.rows(newrowindex).cells(4).style.width = "100px"
            oGrid.rows(newrowindex).cells(0).style.border = 0
            oGrid.rows(newrowindex).cells(1).style.border = 0
            oGrid.rows(newrowindex).cells(1).align = "right";
            oGrid.rows(newrowindex).cells(2).style.border = 0
            oGrid.rows(newrowindex).cells(3).style.border = 0
            oGrid.rows(newrowindex).cells(4).style.border = 0

            oGrid.rows(newrowindex).cells(3).style.direction = "ltr"

            if ((newrowindex % 2) == 0) {
                oGrid.rows(newrowindex).cells(0).className = "CssItemStyle"
                oGrid.rows(newrowindex).cells(1).className = "CssItemStyle"
                oGrid.rows(newrowindex).cells(2).className = "CssItemStyle"
                oGrid.rows(newrowindex).cells(3).className = "CssItemStyle"
                oGrid.rows(newrowindex).cells(4).className = "CssItemStyle"
            }
            else {
                oGrid.rows(newrowindex).cells(0).className = "CssAlternatingItemStyle"
                oGrid.rows(newrowindex).cells(1).className = "CssAlternatingItemStyle"
                oGrid.rows(newrowindex).cells(2).className = "CssAlternatingItemStyle"
                oGrid.rows(newrowindex).cells(3).className = "CssAlternatingItemStyle"
                oGrid.rows(newrowindex).cells(4).className = "CssAlternatingItemStyle"
            }
            newrowindex = newrowindex + 1

        }
        //------------------------------------ساختن تابع انواع پارامترها------------------------
        function MakeObjParamType(oGrid, newrowindex, Param) {
            
            if (Param == "Code") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' id='txtTypeCode' type='text'  dir='rtl' style='WIDTH: 110px;' disabled='disabled'> <input class='HeaderStyle' onclick='onclickbtnCode(this)' style='width: 25px; cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />"
            }
            if (Param == "Code/Int") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' id='txtTypeCodeInt' dir='rtl' type='text' onblur='ChangeCodeFormat(this);txtChange(this)' onkeypress='getNumKey()'  dir='ltr' style='WIDTH: 110px;'> <input class='HeaderStyle' onclick='onclickbtnCodeInt()' style='width: 25px; cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />"
            }
            if (Param == "MultiCode") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' id='txtTypeCodeSelector' dir='rtl' type='text'  style='WIDTH: 110px;' disabled='disabled'> <input class='HeaderStyle' onclick='onclickbtnCodeSelector()' style='width: 25px; cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />"
            }
            if (Param == "MultiSelect") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' id='txtTypeMultiSelect' dir='rtl' type='text'  style='WIDTH: 110px;' disabled='disabled'> <input  class='HeaderStyle' onclick='onclickbtnMultiSelect(this)' style='width: 25px; cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />"
            }
            if (Param == "Int") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls'  type='text' dir='rtl' onkeypress='getNumKeyMines()' style='WIDTH: 135px;'  onblur=txtChange(this) >"
            }
            if (Param == "Text") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls'  type='text' dir='rtl'  style='WIDTH: 135px;' onblur=txtChange(this) >"
            }
            if (Param == "Time") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<input id='txtTime' type='text' class='TxtControls' style='width: 135px' onkeydown='OnKeyDownTime(this.value)'  onblur='Timechk(this);txtChange(this)' value='00:00'  onfocus='OnFocuseTxtSTime(this)' />"
            }
            if (Param == "Calender") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<input class='TxtControls' type='text' style='width :135px' OnKeyDown='OnKeyDownDate(this.value)' onblur='datechk(this)'  />"
            }
            if (Param == "Combo") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<select class='TxtControls' id='cmbParamType' style='width:135px' onchange='OnChangeCmbParamType(this)'><option></option></select>"
            }
            if (Param == "SelectPerson") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls'  dir='rtl' type='text'  style='WIDTH: 110px;' disabled='disabled'><select class='TxtControls' id='CmbSign' style='width:40px' onchange='OnChangeSign(this)'><option value=0>+</option><option value=1>-</option><option value=2>P</option><option value=3></option></select><input class='HeaderStyle' onclick='onclickSelectPerson(this)' style='width: 30px; cursor: hand; height: 22px' type='button' value='...' title='انتخاب پرسنل' />"
            }
            if (Param == "SinglePerson") {
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls'  dir='rtl' type='text'  style='WIDTH: 110px;' disabled='disabled'><input class='HeaderStyle' onclick='onclickSelectSinglePerson(this)' style='width: 30px; cursor: hand; height: 22px' type='button' value='...' title='انتخاب پرسنل' />"
            }

            if (Param == "SelectPerson/Group") {

                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls'  dir='rtl' type='text'  style='WIDTH: 110px;' disabled='disabled'><select class='TxtControls' id='CmbSelectPersonGroup' style='width:40px'  onchange='OnChangeSelectPersonGroup(this)'><option value=0>+</option><option value=1>-</option><option value=2>P</option><option value=3></option></select><input class='HeaderStyle' onclick='onclickSelectPersonGroup(this)' style='width: 30px; cursor: hand; height: 22px' type='button' value='...' title='انتخاب پرسنل و گروه' />"
            }
        }
        //--------------------------------------------------------------------------------------
        function onclickbtnCode() {
            onClickXTabTable()
            var strUrl = "CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=Code" + "&CodeVlue=" + LastSelectedRow.cells(3).innerText

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue != null) {
                LoadXMLCodeSelector(rValue, $get("txtTypeCode"))
            }
        }
        //--------------------------------------------------------------------------------------
        function onclickbtnCodeInt() {
            onClickXTabTable()
            var strUrl = "CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=Code/Int" + "&CodeVlue=" + LastSelectedRow.cells(3).title

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue != null && rValue != "") {
                LoadXMLCodeSelector(rValue, $get("txtTypeCodeInt"))
                $get("txtTypeCodeInt").disabled = true;
            }
            else {
                $get("txtTypeCodeInt").value = "";
                $get("txtTypeCodeInt").disabled = false;
            }

        }
        //-------------------------------------------------------------------------------------
        function onclickbtnCodeSelector() {
            onClickXTabTable()
            var strUrl = "CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + LastSelectedRow.cells(3).title

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue != null) {
                LoadXMLCodeSelector(rValue)
            }
        }
        //--------------------------------------------------------------------------------------
        function onclickbtnMultiSelect(obj) {
            onClickXTabTable()
            var Row = obj.parentElement.parentElement
            var XmlType = Row.getAttribute("XMLType")

            var strUrl = "ValueSelector.aspx?"
                    + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&CodeVlue=" + LastSelectedRow.cells(3).title + "&XmlCodeValue=" + XmlType   //<Root><Tb><Value>1</Value><title>مثبت</title></Tb><Tb><Value>2</Value><title>منفی</title></Tb></Root>"

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  500px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue != null) {
                LoadXMLCodeSelector(rValue)
            }
        }
        //--------------------------------------------------------------------------------------
        function LoadXMLCodeSelector(rValue) {
            var strXml = rValue;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //alert(oXmlDoc.xml)
            if (oXmlDoc.documentElement != null) {
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (XmlNodes.length != 0) {
                    LastSelectedRow.cells(1).firstChild.value = XmlNodes.item(0).selectSingleNode('Name').text;
                    LastSelectedRow.cells(1).firstChild.title = XmlNodes.item(0).selectSingleNode('Name').text;
                    LastSelectedRow.cells(3).title = XmlNodes.item(0).selectSingleNode('ID').text;
                    if (XmlNodes.item(0).selectSingleNode('ID').text.length > 20)
                        LastSelectedRow.cells(3).innerText = XmlNodes.item(0).selectSingleNode('ID').text.substr(0, 20) + '...';
                    else
                        LastSelectedRow.cells(3).innerText = XmlNodes.item(0).selectSingleNode('ID').text;
                }
            }
        }
        //--------------------------------------------------------------------------------------
        function ChangeCodeFormat(obj) {
            //            if (flagca == 1 && obj.value.length < 6) {
            //                alert("کد شما به همراه کاما باید پنج رقمی باشد")
            //                obj.value = "";
            //            }
        }
        //--------------------------------------------------------------------------------------
        function txtChange(obj) {
            var objTbl = obj.parentElement.parentElement.parentElement;
            var rowIndex = obj.parentElement.parentElement.rowIndex
            objTbl.rows(rowIndex).cells(3).innerText = obj.value;
            objTbl.rows(rowIndex).cells(3).title = obj.value;
            if (obj.value.length > 20)
                objTbl.rows(rowIndex).cells(3).innerText = obj.value.substr(0, 20) + '...'
            else
                objTbl.rows(rowIndex).cells(3).innerText = obj.value
            if (obj.id == "txtTime" && obj.value == "") {
                obj.value = "00:00";
                objTbl.rows(rowIndex).cells(3).title = obj.value
                objTbl.rows(rowIndex).cells(3).innerText = obj.value
            }
        }
        //---------------------------------------وارد کردن عدد---------------------------------
        function getNumKey() {
            var keyStroke
            keyStroke = window.event.keyCode
            if (((keyStroke >= 48) && (keyStroke <= 57)) || (keyStroke == 13))
                window.event.keyCode = keyStroke;
            else
                window.event.keyCode = null;

            window.event.returnValue = true
        }
        //---------------------------------------با علامت منفی وارد کردن عدد---------------------------------
        function getNumKeyMines() {
            var keyStroke
            keyStroke = window.event.keyCode
            if (((keyStroke >= 48) && (keyStroke <= 57)) || (keyStroke == 13) || (keyStroke == 45))
                window.event.keyCode = keyStroke;
            else
                window.event.keyCode = null;

            window.event.returnValue = true
        }
        //---------------------چک کردن نگذاشتن منفی در بین عدد------------------
        function checknotusemines() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length
            for (var i = 0; i < lll; i++) {
                if ($get(MasterObj + "txtParameterType").value == "Int") {
                    var number = oGrid.rows(i).cells(3).title;
                    number = number.substring(1);
                    if (number.search('-') != -1) {
                        alert('لطفا علامت منفی را در ابتدای عدد قرار دهید');
                        return true;
                    }
                }

            }
        }
        //-------------------------------------------------------------------------------------
        function OnChangeCmbParamType(obj) {
            var rowIndex = obj.parentElement.parentElement.rowIndex
            var objTbl = obj.parentElement.parentElement.parentElement
            objTbl.rows(rowIndex).cells(3).innerText = obj.value
            objTbl.rows(rowIndex).cells(3).title = obj.value
        }
        //--------------------------------------------------------------------------------------
        //        var flag = 0;
        //        var flagca=0
        //-------------------------------------------------------------------------------------
        //        function getNumKeyCodeInt(obj) {
        //           
        //            if (obj.value.substr(0, 1) == "," && obj.value.length == 6)
        //                flag = 1;
        //            else
        //                flag = 0;

        //            var keyStroke
        //            keyStroke = window.event.keyCode

        //            if (obj.value.length == 0) {
        //                if (((keyStroke >= 48) && (keyStroke <= 57)) || (keyStroke == 13) || (keyStroke == 44)) {
        //                    window.event.keyCode = keyStroke;
        //                    if (keyStroke == 44) {
        //                        flag = 1;
        //                        flagca = 1;
        //                    }
        //                    else {
        //                        flag = 0;
        //                        flagca = 0;
        //                    }
        //                }
        //                else
        //                    window.event.keyCode = null;
        //            }
        //            else if (obj.value.length >= 1) {
        //                if ((flag == 1 && obj.value.length < 6) || flag == 0) {
        //                    if (((keyStroke >= 48) && (keyStroke <= 57)) || (keyStroke == 13))
        //                        window.event.keyCode = keyStroke;
        //                    else
        //                        window.event.keyCode = null;
        //                }
        //                
        //                else
        //                    window.event.keyCode = null;
        //            }
        //            window.event.returnValue = true
        //        }
        //---------------------------------For Time---------------------------------------------
        function OnFocuseTxtSTime(obj) {
            obj.select();
        }
        //--------------------------------For Load Combo---------------------------------------
        function onchangeParamType(cmb, XmlTyp) {
            //XmlTyp = "<Root><Tb><IntVal>1</IntVal><Value>+</Value><Title>مثبت</Title></Tb></Root>"  //------For Test
            if (XmlTyp != "" && XmlTyp != null) {
                var strXml = XmlTyp
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                if (oXmlDoc.documentElement != null) {
                    var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");

                    if (XmlNodes.length != 0) {
                        cmb.innerHTML = "";
                        optionEl = document.createElement("OPTION");
                        cmb.options.add(optionEl);
                        cmb.all(0).innerText = "انتخاب نشده"
                        cmb.all(0).value = "0"
                        for (var i = 0; i < XmlNodes.length; i++) {
                            optionEl = document.createElement("OPTION");
                            cmb.options.add(optionEl)
                            cmb.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('title').text
                            cmb.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Value').text
                        }
                    }
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
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no')
            document.getElementById(MasterObj + "txtScriptGroups").value = rValue

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbTemplateName() {
            document.getElementById(MasterObj + "txtSubmit").value = "changecmbTemplateName";
            document.getElementById(MasterObj + "BtnSubmit").click();
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
                rr = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 600px;center: Yes;help: no;status: no')
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCodedifinition() {
            var strUrl = "DifinitionCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no;scroll:no')
        }
        //==================================================================================================
        window.focus()
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclcikTab(Obj, Sign) {
            Obj.className = "TabSelected";
            if (Obj.nextSibling != null) {
                Obj.nextSibling.className = "TabSelect";
                if (Obj.nextSibling.nextSibling != null) {
                    Obj.nextSibling.nextSibling.className = "TabSelect";
                }
            }
            if (Obj.previousSibling != null) {
                Obj.previousSibling.className = "TabSelect";
                if (Obj.previousSibling.previousSibling != null) {
                    Obj.previousSibling.previousSibling.className = "TabSelect";

                }
            }
            switch (Sign) {
                case "TblDefineRole":
                    SelectedTab = 1;
                    TblCondition.style.display = "none";
                    TblRoleText.style.display = "none";
                    TblDefineRole.style.display = "inline";
                    Obj.style.background = "#9999FF";
                    Obj.nextSibling.style.background = "#CCCCFF";
                    Obj.nextSibling.nextSibling.style.background = "#CCCCFF";
                    break;

                case "TblCondition":
                    SelectedTab = 2;
                    TblCondition.style.display = "inline";
                    TblRoleText.style.display = "none";
                    TblDefineRole.style.display = "none";
                    Obj.style.background = "#9999FF";
                    Obj.nextSibling.style.background = "#CCCCFF";
                    Obj.previousSibling.style.background = "#CCCCFF"
                    break;
                case "TblRoleText":
                    SelectedTab = 3;
                    TblCondition.style.display = "none";
                    TblRoleText.style.display = "inline";
                    TblDefineRole.style.display = "none";
                    Obj.style.background = "#9999FF";
                    Obj.previousSibling.style.background = "#CCCCFF";
                    Obj.previousSibling.previousSibling.style.background = "#CCCCFF";
                    break;
            }
        }
        //-----------------
        function onclickSelectPerson(SelectedBtn) {

            var RowIndex = SelectedBtn.parentElement.parentElement.rowIndex;
            var TbObj = SelectedBtn.parentElement.parentElement.parentElement.parentElement
            var strXML = ""
            var val = ""
           
            if ($get(MasterObj + "txtScriptID").value != "0") {
                var val = TbObj.rows(RowIndex).cells(3).title
                var Mname = TbObj.rows(RowIndex).cells(1).childNodes(0).value
                var Str = ""
                
                if (val.substr(0, 1) == "-" || val.substr(0, 1) == "+") {
                    for (var i = 0; i < val.split(",").length; i++) {
                        var Value = val.split(",")[i]
                        if (Value.substr(0, 1) == "+")
                            Value = Value.split("+")[1]
                        else if (Value.substr(0, 1) == "-")
                            Value = Value.split("-")[1]


                        Str += "<Tb>"
                        Str += "<MID>" + Value + "</MID>"
                        Str += "<MName>" + Mname.split(",")[i] + "</MName>"
                        Str += "<Type>U</Type>"
                        Str += "</Tb>"

                    }
                    
                    strXML = "<Root>" + Str + "</Root>"
                    SelectedBtn.setAttribute("StrXML", strXML)

                }
            }
            var ForScriptEdit = '0';
            if (strXML != '')
                ForScriptEdit = '1';
            $get(MasterObj + "ScriptXmlFromParent").value = SelectedBtn.getAttribute("StrXML", strXML)
            var strUrl = "/TAPresentation/App_Pages/DataEntry/CreditScriptGroup.aspx?SelectPerson=1&ScriptID=" + $get(MasterObj + "txtScriptID").value
                          + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                          + "&CreditScriptGroup=" 
                           + "&CreditID=0"
                           + "&ForScriptEdit=" + ForScriptEdit
                           + "&ForScript=1"
                           + "&Val=" + val
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, window, 'dialogHeight: 400px;dialogWidth:500px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            strXML = returnResult
            SelectedBtn.setAttribute("StrXML", strXML)
            if (returnResult != undefined && returnResult != "") {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(SelectedBtn.getAttribute("StrXML"));
                var Nodes = xmlSave.documentElement.selectNodes("/Root/Tb");
                var Str = "";
                var CmbSign = SelectedBtn.parentElement.childNodes(1);
                var Sign = CmbSign[CmbSign.selectedIndex].text;
                var StrPID = "";

                var PName = "";

                for (var i = 0; i < Nodes.length; i++) {

                    Str = Str == "" ? "" : Str + ",";
                    Str += Sign + Nodes[i].selectSingleNode("MPID").text;

                    PName = PName == "" ? "" : PName + ",";
                    PName += Nodes[i].selectSingleNode("MName").text;

                }
                SelectedBtn.parentElement.parentElement.cells(3).innerText = Str;
                SelectedBtn.parentElement.parentElement.cells(3).title = Str;
                SelectedBtn.parentElement.parentElement.cells(1).childNodes(0).value = PName;
                SelectedBtn.parentElement.parentElement.cells(1).title = PName;


            }

            if ($get(MasterObj + "txtScriptID").value == "0") {

                var val = TbObj.rows(RowIndex).cells(3).title
                var Mname = TbObj.rows(RowIndex).cells(1).childNodes(0).value
                var Str = ""
                if (val.substr(0, 1) == "-" || val.substr(0, 1) == "+") {
                    for (var i = 0; i < val.split(",").length; i++) {
                        var Value = val.split(",")[i]
                        if (Value.substr(0, 1) == "+")
                            Value = Value.split("+")[1]
                        else if (Value.substr(0, 1) == "-")
                            Value = Value.split("-")[1]
                        Str += "<Tb>"
                        Str += "<MID>" + Value + "</MID>"
                        Str += "<MName>" + Mname.split(",")[i] + "</MName>"
                        Str += "<Type>U</Type>"
                        Str += "</Tb>"

                    }
                    strXML = "<Root>" + Str + "</Root>"
                    SelectedBtn.setAttribute("StrXML", strXML)

                }
            }


        }
        //---------------------
        function onclickSelectPersonGroup(SelectedBtn) {
            var RowIndex = SelectedBtn.parentElement.parentElement.rowIndex;
            var TbObj = SelectedBtn.parentElement.parentElement.parentElement.parentElement
            var val = TbObj.rows(RowIndex).cells(3).title
            var Mname = TbObj.rows(RowIndex).cells(1).childNodes(0).value
            var StrXMLGroup = ""
            if ($get(MasterObj + "txtScriptID").value != "0") {
                var Str = ""
                if (val.substr(0, 1) == "-" || val.substr(0, 1) == "+") {
                    for (var i = 0; i < val.split(",").length; i++) {
                        var Value = val.split(",")[i]
                        if (Value.substr(0, 1) == "+")
                            Value = Value.split("+")[1]
                        else if (Value.substr(0, 1) == "-")
                            Value = Value.split("-")[1]
                        if (Value.substr(0, 1) == "G") {
                            var Type = "G"
                            Value = Value.split("G")[1]

                        }
                        else if (Value.substr(Value, 1) != "G")
                            Type = "U"

                        Str += "<Tb>"
                        Str += "<MID>" + Value + "</MID>"
                        Str += "<MName>" + Mname.split(",")[i] + "</MName>"
                        Str += "<MPID>" + Value + "</MPID>"
                        Str += "<Type>" + Type + "</Type>"
                        Str += "</Tb>"

                    }


                    StrXMLGroup = "<Root>" + Str + "</Root>"
                    SelectedBtn.setAttribute("StrXMLGroup", StrXMLGroup)
                }
            }
            if (StrXMLGroup != "")
                $get(MasterObj + "ScriptXmlFromParent").value = StrXMLGroup;
            var ForScriptEdit = '0';
            if (StrXMLGroup != '')
                ForScriptEdit = '1';

            var strUrl = "/TAPresentation/App_Pages/DataEntry/CreditScriptGroup.aspx?SelectPersonGroup=1&ScriptID=" + $get(MasterObj + "txtScriptID").value
                          + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                          + "&CreditScriptGroup=" //+ SelectedBtn.getAttribute("StrXMLGroup", StrXMLGroup)
                           + "&CreditID=0"
                           + "&ForScriptEdit=" + ForScriptEdit
                           + "&ForScript=1"
                           + "&Val=" + val
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, window, 'dialogHeight: 400px;dialogWidth:500px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            StrXMLGroup = returnResult

            SelectedBtn.setAttribute("StrXMLGroup", StrXMLGroup)
            if (returnResult != undefined && returnResult != "") {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(SelectedBtn.getAttribute("StrXMLGroup"));
                var Nodes = xmlSave.documentElement.selectNodes("/Root/Tb");
                var Str = "";
                var CmbSelectPersonGroup = SelectedBtn.parentElement.childNodes(1);
                var Sign = CmbSelectPersonGroup[CmbSelectPersonGroup.selectedIndex].text;
                var PName = "";
                for (var i = 0; i < Nodes.length; i++) {
                    var Type = Nodes[i].selectSingleNode('Type').text;
                    if (Type == "U") {
                        Str = Str == "" ? "" : Str + ",";
                        Str += Sign + Nodes[i].selectSingleNode("MPID").text;
                        PName = PName == "" ? "" : PName + ",";
                        PName += Nodes[i].selectSingleNode("MName").text;

                    }
                    else if (Type == "G") {
                        Str = Str == "" ? "" : Str + ",";
                        Str += Sign + "G" + Nodes[i].selectSingleNode("MPID").text;
                        PName = PName == "" ? "" : PName + ",";
                        PName += Nodes[i].selectSingleNode("MName").text;
                    }
                }
                SelectedBtn.parentElement.parentElement.cells(3).innerText = Str;
                SelectedBtn.parentElement.parentElement.cells(3).title = Str;
                SelectedBtn.parentElement.parentElement.cells(1).childNodes(0).value = PName;
                SelectedBtn.parentElement.parentElement.cells(1).title = PName;


            }


            if ($get(MasterObj + "txtScriptID").value == "0") {
                var val = TbObj.rows(RowIndex).cells(3).title
                var Mname = TbObj.rows(RowIndex).cells(1).childNodes(0).value
                var Str = ""

                if (val.substr(0, 1) == "-" || val.substr(0, 1) == "+") {
                    for (var i = 0; i < val.split(",").length; i++) {
                        var Value = val.split(",")[i]
                       
                        if (Value.substr(0, 1) == "+")
                            Value = Value.split("+")[1]
                        else if (Value.substr(0, 1) == "-")
                            Value = Value.split("-")[1]
                        if (Value.substr(0, 1) == "G") {
                            var Type = "G"
                            Value = Value.split("G")[1]

                        }
                        else if (Value.substr(Value, 1) != "G")
                            Type = "U"

                        Str += "<Tb>"
                        Str += "<MID>" + Value + "</MID>"
                        Str += "<MName>" + Mname.split(",")[i] + "</MName>"
                        Str += "<MPID>" + Value + "</MPID>"
                        Str += "<Type>" + Type + "</Type>"
                        Str += "</Tb>"

                    }

                    StrXMLGroup = "<Root>" + Str + "</Root>"
                    SelectedBtn.setAttribute("StrXMLGroup", StrXMLGroup)
                    $get(MasterObj + "ScriptXmlFromParent").value = StrXMLGroup;
                }
            }

        }
        //---------------------
        function OnChangeSelectPersonGroup(Combo) {
            var Str = Combo.parentElement.parentElement.cells(3).title;
            if (Combo.value != 2) {

                if (Str == "P") Str = "";
                if (Str.trim() != "") {

                    var StrArray = new Array();
                    StrArray = Str.split(",")
                    Str = "";
                    for (var Counter = 0; Counter < StrArray.length; Counter++) {
                        Str = Str == "" ? "" : Str + ",";
                        if (StrArray[Counter].split("G").length > 1)
                            StrArray[Counter] = "G" + Math.abs(StrArray[Counter].split("G")[1]);
                        else
                            StrArray[Counter] = Math.abs(StrArray[Counter]);
                        Str += Combo[Combo.selectedIndex].text + StrArray[Counter].toString();
                    }
                }
                Combo.parentElement.parentElement.cells(1).childNodes(2).disabled = false;
            }
            else {
                Str = "P";
                Combo.parentElement.parentElement.cells(1).childNodes(0).value = "";
                Combo.parentElement.parentElement.cells(1).childNodes(2).disabled = true;
            }
            Combo.parentElement.parentElement.cells(3).innerText = Str.substr(0, 20) + '...' ;
            Combo.parentElement.parentElement.cells(3).title = Str;
        }
        //------------------

        function OnChangeSign(Combo) {
            var Str = Combo.parentElement.parentElement.cells(3).title;
            if (Combo.value != 2) {
                if (Str == "P") Str = "";
                if (Str.trim() != "") {
                    var StrArray = new Array();
                    StrArray = Str.split(",");
                    Str = "";
                    for (var Counter = 0; Counter < StrArray.length; Counter++) {
                        Str = Str == "" ? "" : Str + ",";
                        StrArray[Counter] = Math.abs(StrArray[Counter]);
                        if (StrArray[Counter].toString() != 'NaN')
                           Str += Combo[Combo.selectedIndex].text + StrArray[Counter].toString();
                    }
                }
                Combo.parentElement.parentElement.cells(1).childNodes(2).disabled = false;
            }
            else {
                Str = "P";
                Combo.parentElement.parentElement.cells(1).childNodes(0).value = "";
                Combo.parentElement.parentElement.cells(1).childNodes(2).disabled = true;
            }
            Combo.parentElement.parentElement.cells(3).innerText = Str;
            Combo.parentElement.parentElement.cells(3).title = Str;
        }
        //------------------
        function onclickSelectSinglePerson(SelectedBtn) {
            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value;
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 600px;dialogWidth:900px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            if (returnResult != undefined && returnResult != "") {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(returnResult);
                var Nodes = xmlSave.documentElement.selectNodes("/Root/Tb");
                if (Nodes.length > 0) {
                    SelectedBtn.parentElement.parentElement.cells(3).innerText = Nodes[0].selectSingleNode("PID").text;
                    SelectedBtn.parentElement.parentElement.cells(3).title = Nodes[0].selectSingleNode("PID").text;
                    SelectedBtn.parentElement.parentElement.cells(1).childNodes(0).value = Nodes[0].selectSingleNode("PName").text;
                    SelectedBtn.parentElement.parentElement.cells(1).title = Nodes[0].selectSingleNode("PName").text;
                }
            }
        }
        //-----------------------------------------------------
      
    </script>
</asp:Content>
