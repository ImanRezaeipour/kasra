<%@ Page Title="-------------------------------------------------------------------------------------------------------کارتابل اسناد---------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="ShowCartable.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.ShowCartable" AsyncTimeout="1800" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../../App_Utility/Styles/BaseInfo/WorkFlow/ShowCartable.css" />
    <link href="../../../App_Utility/Calendar/skins/OwnCalendar.css" rel="stylesheet"
        type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <table id="TBLBase" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table align="right" cellpadding="0" cellspacing="0" style="border: 1px groove; height: 25px;
                    background-color: #CCCCFF;">
                    <tr>
                        <td id="TabFrm" style="border: 1px groove #4B0082; width: 150px; height: 25px;" align="center"
                            class="Tab" onclick="onclickTabSystem(this,'TblFrm')">
                            زير ساخت
                        </td>
                        <td id="TabTA" style="border: 1px groove #4B0082; width: 150px; height: 25px;" align="center"
                            class="Tab" onclick="onclickTabSystem(this,'TblTA')">
                            اتوماسيون تردد
                        </td>
                        <td id="TabRst" style="border: 1px groove #4B0082; width: 150px; height: 25px;" align="center"
                            class="Tab" onclick="onclickTabSystem(this,'TblRst')">
                            اتوماسيون تغذيه
                        </td>
                        <td id="TabGim" style="border: 1px groove #4B0082; width: 150px; height: 25px;" align="center"
                            class="Tab" onclick="onclickTabSystem(this,'TblGim')">
                            اتوماسيون بازرسي و انتظامات
                        </td>
                        <td id="TabTsh" style="border: 1px groove #4B0082; width: 150px; height: 25px;" align="center"
                            class="Tab" onclick="onclickTabSystem(this,'TblTsh')">
                            اتوماسيون تايم شيت
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #4B0082; height: 3px;">
            </td>
        </tr>
        <tr id="trSearch">
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <div id="tdAccepter" style="text-align: right; width:70px">
                                                    تاييد کننده :</div>
                                            </td>
                                            <td>
                                                <div id="tdCmbAccepter">
                                                    <asp:DropDownList ID="CmbAccepter" runat="server" Height="16px" Width="100px" value="0"
                                                        CssClass="TxtControls" onchange="OnChangeCmbAccepter()">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="lblTafviz" runat="server" Text="دارای کارتابل تفویضی" ForeColor="Red"></asp:Label>
                                                    <asp:Label ID="lblAccepter" runat="server" Style="color: green; border: 1px solid #6699FF;
                                                        width: 250px; height: 20px; text-align:center; background-color: White"></asp:Label>
                                                </div>
                                            </td>
                                            <td style="width: 450px">
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <div align="left">
                                <table align="left">
                                    <tr>
                                        <td id="TabList" align="center" style="width: 90px; height: 25px; overflow: auto;
                                            border: 1px solid" class="Tab" onclick="onclickTab(this,'1')">
                                            ليست
                                        </td>
                                        <td id="TabMonthly" align="center" style="width: 90px; height: 25px; overflow: auto;
                                            border: 1px solid" class="Tab" onclick="onclickTab(this,'2')" class="DataTable"
                                            valign="top">
                                            ماهانه
                                        </td>
                                        <td id="TabWeekly" align="center" style="width: 90px; height: 25px; overflow: auto;
                                            border: 1px solid; display: none" class="Tab" onclick="onclickTab(this,'3')"
                                            class="DataTable" valign="top">
                                            هفتگي
                                        </td>
                                        <td id="tabDaily" align="center" style="width: 90px; height: 25px; overflow: auto;
                                            border: 1px solid; display: none" class="Tab" onclick="onclickTab(this,'4')"
                                            class="DataTable" valign="top">
                                            روزانه
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trTabList" style="display: none;">
            <td align="center" class="DataTable" style="overflow: auto; width: 1120px; border: 1px solid #ffc83c;"
                valign="top">
                <iframe id="IfrmListTab" frameborder="0" width="1120px" height="500px"></iframe>
            </td>
        </tr>
        <tr id="TrTabDay" style="display: none">
            <td align="center" class="DataTable" style="overflow: auto; width: 950px; height: 450px;
                border: 1px solid #ffc83c;" runat="server" valign="top">
                <table align="right">
                    <tr>
                        <td id="Td1">
                            <table align="right">
                                <tr style="background-color: #FFF0C4;">
                                    <td id="TDTemp" runat="server">
                                        &nbsp;&nbsp; تاريخ :
                                    </td>
                                    <td>
                                        <input id="date_input_7" type="text" onfocus="onfocusCalendar()" onclick="onfocusCalendar()"
                                            onchange="onchangeDate(this)" name="date" class="TxtControls" />
                                    </td>
                                    <td>
                                        <img src="/FrmPresentation/App_Utility/Images/Icons/home_paging_next.gif" style="cursor: hand"
                                            onclick="onclickHideCalc(this)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <div id="flat_calendar_1">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <table id="TblDayDoc" height="100%">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trGrd">
            <td class="DataTable" style="overflow: auto; width: 950px; border: 1px solid #ffc83c;">
                <table align="right">
                    <tr id="trMonthDoc">
                        <td align="right">
                            <div align="right" id="DivMonthDoc" style="vertical-align: top; height: 20px; background-color: #FFD86F;">
                                <table align="right" id="TblMonthDoc" height="100%">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="center" id="DivDailyDoc" style="vertical-align: top;">
                                <table id="TblHeader" class="CssHeaderGrd" width="940px">
                                    <tr>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            شنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            يکشنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            دوشنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            سه شنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            چهارشنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            پنجشنبه
                                        </td>
                                        <td style="width: 130px; color: Black; font-weight: bold">
                                            جمعه
                                        </td>
                                    </tr>
                                </table>
                                <table id="TblDailyDoc" height="100%">
                                </table>
                                <table id="TblFooter" class="CssFooterGrd" width="940px">
                                    <tr>
                                        <td>
                                            <div>
                                                <table>
                                                    <tr>
                                                        <td style="width: 30px">
                                                            <img src="/FrmPresentation/App_Utility/Images/Icons/active_forward.gif" style="width: 20px;
                                                                height: 20px; cursor: pointer; vertical-align: middle" id="BtnNext" title="بعدي"
                                                                onclick="OnClickBtnNext()" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblWorkPeriod" runat="server" Style="text-align: center; border-style: solid;
                                                                border-width: 1px; border-color: #003366 #7EAACB #7EAACB #003366; background-color: #D3E2ED;
                                                                font-weight: bold; font-size: 12px; font-family: Traffic" Width="180px"></asp:Label>
                                                        </td>
                                                        <td style="width: 30px">
                                                            <img src="/FrmPresentation/App_Utility/Images/Icons/active_back.gif" style="width: 20px;
                                                                height: 20px; cursor: pointer; vertical-align: middle" id="BtnPrev" title="قبلي"
                                                                onclick="OnClickBtnPrev()" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtGridXml" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtWPID" name="txtWPID" runat="server" />
        <input type="text" id="txtWorkPeriodXml" name="txtWPID" runat="server" />
        <input type="text" id="txtCartablOwner" name="txtCartablOwner" runat="server" />
        <input type="text" id="txtTabMode" name="txtTabMode" runat="server" value="2" />
        <input type="text" id="txtWeekNo" name="txtWeekNo" runat="server" value="1" />
        <input type="text" id="txtDefaultWPID" name="txtDefaultWPID" runat="server" value="1" />
        <input type="text" id="txtToday" name="txtToday" runat="server" value="1" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtCmbAccess" name="txtCmbAccess" value="0" runat="server" />
        <input type="text" id="txtShowCatrableList" name="txtShowCatrableList" value="0" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="../../../App_Utility/Calendar/Script/KCalendar.js"
        type="text/javascript"></script>
    <script type="text/javascript" src="../../../App_Utility/Calendar/Script/CalScript.js"
        type="text/javascript"></script>
    <script type="text/javascript" src="../../../App_Utility/Calendar/Script/SPECIAL_DAYS.js"
        type="text/javascript"></script>
    <script>
        window.document.dir = "RTL";
        //document.body.style.overflowY = "hidden";
        //document.body.style.overflowX = "hidden";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var DateTableXml, MonthDocXml, DayDocXml, WorkPeriodXml, oXmlDoc, SDateWPID, EDateWPID, SelectedSystem = 0, AccepterCode;
        OnLoad();
        //------------------------------------------------------------------------------
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            var strVal = $("#" + MasterObj + "txtSubmit").val();
     
            switch (strVal) {
                case "Filter":
                    {
                        switch ($("#" + MasterObj + "txtTabMode").val()) {
                            case "2":
                                BindWorkPeriod();
                                DisplayActiveTab();
                                onclickTab(TabMonthly, "")
                                break;
                            case "3":
                                ClearHeaderAndGrid();
                                BindGrd();
                                break;
                            case "4":
                                ClearGrdDayDoc();
                                CreateGrdTblDayDoc();
                                break;
                        }
                    }
            }
        }
        //------------------------------------------------------------------------------
        function OnLoad() {
            //--------------------------------ایجاد تقویم 
            Calendar.setup({
                inputField: "date_input_7",
                displayArea: "display_area_1",
                flat: "flat_calendar_1",   // id of the input field
                ifFormat: "%d/%m/%Y",       // format of the input field
                dateType: 'jalali',
                showOthers: true,
                weekNumbers: true
            });
            //-----------------------مقدار دهی اولیه برای تاریخ
            $get("date_input_7").value = $get(MasterObj + "txtToday").value.substr(8, 2) + "/" + $get(MasterObj + "txtToday").value.substr(5, 2) + "/" + $get(MasterObj + "txtToday").value.substr(0, 4);
            $get("date_input_7").value = $get("date_input_7").value + "  " + F_adbsghh($get("date_input_7").value)
            BindWorkPeriod();
            //------------------------------------Display Active Tab--------------------------------------------------------
            DisplayActiveTab();
            //---------------------------------------------------------------------------------------------------------------
            if ($get(MasterObj + "txtShowCatrableList").value == "1")
                onclickTab(TabList, '1')
            else
                onclickTab(TabMonthly, "2")
        }
        //===============================================================================
        function DisplayActiveTab() {
            oXmlDoc = new ActiveXObject("MsXml2.DomDocument");
            oXmlDoc.loadXML($get(MasterObj + "txtGridXml").value)

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='111'] ").length > 0)
                onclickTabSystem(TabFrm, "TblFrm");
            else if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='361'] ").length > 0)
                onclickTabSystem(TabRst, "TblRst");
            else if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='20'] ").length > 0)
                onclickTabSystem(TabTsh, "TblTsh");
            else if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='14'] ").length > 0)
                onclickTabSystem(TabGim, "TblGim");
            else 
                onclickTabSystem(TabTA, "TblTA");
        }
        //===============================================================================
        function BindWorkPeriod() {
            oXmlDoc = new ActiveXObject("MsXml2.DomDocument");
            oXmlDoc.loadXML($get(MasterObj + "txtWorkPeriodXml").value)
            WorkPeriodXml = oXmlDoc.documentElement.selectNodes("/GeneralEntity/WorkPeriodInfo [W='" + $("#" + MasterObj + "txtWPID").val() + "'] ");
            if (WorkPeriodXml.length > 0) {

                $get(MasterObj + "lblWorkPeriod").innerText = WorkPeriodXml.item(0).selectSingleNode('N').text
                SDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).selectSingleNode('S').text, '/', '');
                EDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).selectSingleNode('E').text, '/', '');
            }
        }
        //===============================================================================
        function BindGrd() {
            oXmlDoc = new ActiveXObject("MsXml2.DomDocument");
            oXmlDoc.loadXML($get(MasterObj + "txtGridXml").value)
            MonthDocXml = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc[DocSubsysID='" + SelectedSystem + "']");
            DateTableXml = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDate");
            DayDocXml = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDayDoc[DocSubsysID='" + SelectedSystem + "']");

            DisplaySystemTab();

            CreateHeaderMonthlyDoc();
            CreateDailyDoc();
        }
        //===============================================================================
        function DisplaySystemTab() {
            var OtherTab = false;
            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='111'] ").length > 0) {
                OtherTab = true;
                $("#TabFrm").css("display", "inline");
            }
            else
                $("#TabFrm").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='14'] ").length > 0) {
                OtherTab = true;
                $("#TabGim").css("display", "inline");
            }
            else
                $("#TabGim").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='361'] ").length > 0) {
                OtherTab = true;
                $("#TabRst").css("display", "inline");
            }
            else
                $("#TabRst").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='20'] ").length > 0) {
                OtherTab = true;
                $("#TabTsh").css("display", "inline");
            }
            else
                $("#TabTsh").css("display", "none");
            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetMonthDoc [DocSubsysID='131'] ").length > 0) {
                if (OtherTab)
                    $("#TabTA").css("display", "inline");
                else
                    $("#TabTA").css("display", "none");
            }
            else
                $("#TabTA").css("display", "none");
        }
        //===============================================================================
        function CreateHeaderMonthlyDoc() {
            var XmlLen = MonthDocXml.length;
            if (XmlLen > 0) {
                var ORow = TblMonthDoc.insertRow();
                ORow.align = "right";
                for (var i = 0; i < XmlLen; i++) {
                    var OCell = ORow.insertCell();
                    var DocTypeID = MonthDocXml.item(i).selectSingleNode('DocTypeID').text
                    ORow.cells(i).innerHTML = "<div class='Style" + DocTypeID + "'  onclick='OnClickBtnLinkItem(" + DocTypeID + "," + SDateWPID + "," + EDateWPID + ")' >" + MonthDocXml.item(i).selectSingleNode('DocTypeName').text + "(" + MonthDocXml.item(i).selectSingleNode('Count').text + ")" + "</div>";
                    ORow.cells(i).className = "MonthlyDocs";
                }
            }
        }
        //===============================================================================
        function CreateDailyDoc() {
            var ORow, innerHTML, OCell, CurrDate, isHoliday, HolidayDescr, Active;
            var len = (DateTableXml.length) / 7;
            for (var i = 1; i <= len; i++) {
                {
                    ORow = TblDailyDoc.insertRow();
                    for (var j = 1; j <= 7; j++) {
                        OCell = TblDailyDoc.rows(i - 1).insertCell();
                        CurrDate = DateTableXml.item((((i - 1) * 7) + j) - 1).selectSingleNode('Date').text
                        isHoliday = DateTableXml.item((((i - 1) * 7) + j) - 1).selectSingleNode('IsHoliday').text
                        HolidayDesc = DateTableXml.item((((i - 1) * 7) + j) - 1).selectSingleNode('HolidayDesc').text
                        Active = DateTableXml.item((((i - 1) * 7) + j) - 1).selectSingleNode('Active').text

                        DayDocXml = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDayDoc[DocSubsysID='" + SelectedSystem + "' and Date='" + ReplaceAll(CurrDate, '/', '') + "'] ");

                        if ($("#" + MasterObj + "txtToday").val() == "13" + CurrDate)
                            color = "red";
                        else
                            color = "black";

                        if (Active == 0)
                            innerHTML = "<div dir='rlt' title='" + HolidayDesc + "' style='z-index:1;position:fixed; overflow: hidden;height:20px;background-color:#D7D7D7;text-align:center;color:" + color + "'>" + CurrDate.substr(6, 2) + "</div>";
                        else
                            innerHTML = "<div dir='rlt' title='" + HolidayDesc + "' class='CssHeaderStyle1' style='color:" + color + "' >" + CurrDate.substr(6, 2) + "</div>";
                        if (DayDocXml.length && Active != 0 > 0) {
                            innerHTML += "<div style='height:50px; scrollbar-hightlight-color: white;overflow: auto; scrollbar-arrow-color: black;scrollbar-base-color: #B1D3FF;' >";
                            for (var k = 0; k < DayDocXml.length; k++) {
                                var DocTypeID = DayDocXml.item(k).selectSingleNode('DocTypeID').text;
                                innerHTML += "<div style='padding-right:10px;' class='Style" + DocTypeID + "' onclick='OnClickBtnLinkItem(" + DocTypeID + "," + ReplaceAll("13" + CurrDate, '/', '') + "," + ReplaceAll("13" + CurrDate, '/', '') + ")' >" + DayDocXml.item(k).selectSingleNode('DocTypeName').text + "(" + DayDocXml.item(k).selectSingleNode('Count').text + ")" + "<br />" + "</div>";
                                //alert(DayDocXml.item(k).selectSingleNode('DocTypeName').text);
                            }
                            innerHTML += "</div>";

                        }
                        TblDailyDoc.rows(i - 1).cells(j - 1).innerHTML = innerHTML
                        if (isHoliday == "1" && Active == "1")
                            OCell.className = "HolidayGridClass";
                        else if (isHoliday == "1" && Active == "0")
                            OCell.className = "DeActiveDayGridClass";
                        else
                            OCell.className = "DayGridClass";
                    }
                }
            }
        }
        //================================================================================
        function CreateGrdTblDayDoc() {
            var ORow, innerHTML, OCell, CurrDate = $("#" + MasterObj + "txtDate").val().toString().substr(2, 10);
            var oXmlDoc = new ActiveXObject("MsXml2.DomDocument");
            oXmlDoc.loadXML($get(MasterObj + "txtGridXml").value)

            DayDocXml = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDayDoc[Date='" + ReplaceAll(CurrDate, '/', '') + "'] ");
            var len = DayDocXml.length;

            for (var i = 0; i < len; i++) {
                {

                    ORow = TblDayDoc.insertRow();
                    OCell = TblDayDoc.rows(i).insertCell();
                    var DocTypeID = DayDocXml.item(i).selectSingleNode('DocTypeID').text;
                    TblDayDoc.rows(i).cells(0).innerHTML = "<div class='Style" + DocTypeID + "' onclick='OnClickBtnLinkItem(" + DocTypeID + "," + ReplaceAll("13" + CurrDate, '/', '') + "," + ReplaceAll("13" + CurrDate, '/', '') + ")' >" + DayDocXml.item(i).selectSingleNode('DocTypeName').text + "(" + DayDocXml.item(i).selectSingleNode('Count').text + ")" + "<br />" + "</div>";
                }
            }
        }
        //================================کلیک روی هر تب=================================
        function onclickTab(Obj, TabNo) {
            $(".SelectedTab").addClass("Tab");
            $(".SelectedTab").removeClass("SelectedTab")
            Obj.className = "SelectedTab";
            if ($("#" + MasterObj + "txtCmbAccess").val() == "0")
                AccepterCode = $("#" + MasterObj + "txtCartablOwner").val();
            else
                AccepterCode = $("#" + MasterObj + "CmbAccepter").val()
            switch (TabNo) {
                case "1":
                    var resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/AcceptCartable.aspx";
                    url = resource + "?SDate="
                            + "&EDate="
                            + "&DocTypeID=0"
                            + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
                            + "&Accepter=" + AccepterCode
                            + "&SystemID=" + 0
                    $("#IfrmListTab").attr("src", url);
                    $("#trGrd").css("display", "none");
                    $("#trMonthDoc").css("display", "none");
                    $("#trTabList").css("display", "inline");
                    $("#TrTabDay").css("display", "none");
                    $("#tdAccepter").css("display", "none");
                    $("#tdCmbAccepter").css("display", "none");

                    break;
                case "2":
                    $("#trGrd").css("display", "inline");
                    $("#trMonthDoc").css("display", "inline");
                    $("#trTabList").css("display", "none");
                    $("#TrTabDay").css("display", "none");
                    $("#tdAccepter").css("display", "inline");
                    $("#tdCmbAccepter").css("display", "inline");
                    $("#" + MasterObj + "txtTabMode").val(TabNo);
                    $("#" + MasterObj + "txtWPID").val($("#" + MasterObj + "txtDefaultWPID").val());
                    ClearHeaderAndGrid();
                    OnClickBtnFilter();
                    break;
                case "3":
                    $("#trGrd").css("display", "inline");
                    $("#trMonthDoc").css("display", "inline");
                    $("#trTabList").css("display", "none");
                    $("#TrTabDay").css("display", "none");
                    $("#tdAccepter").css("display", "inline");
                    $("#tdCmbAccepter").css("display", "inline");
                    $("#" + MasterObj + "txtTabMode").val(TabNo);
                    $get(MasterObj + "lblWorkPeriod").innerText = "";
                    $get(MasterObj + "txtWeekNo").innerText = "1";
                    ClearHeaderAndGrid();
                    OnClickBtnFilter();
                    break;
                case "4":
                    $("#trGrd").css("display", "none");
                    $("#trMonthDoc").css("display", "none");
                    $("#trTabList").css("display", "none");
                    $("#TrTabDay").css("display", "inline");
                    $("#tdAccepter").css("display", "inline");
                    $("#tdCmbAccepter").css("display", "inline");
                    $("#" + MasterObj + "txtTabMode").val(TabNo);
                    break;
            }
        }
        //===============================================================================
        function OnClickBtnNext() {
            try {
                switch ($("#" + MasterObj + "txtTabMode").val()) {
                    case "2":
                        BindWorkPeriod();
                        findNextWPID();
                        OnClickBtnFilter();
                        break;
                    case "3":
                        $("#" + MasterObj + "txtWeekNo").val(parseInt($("#" + MasterObj + "txtWeekNo").val()) + 1);
                        OnClickBtnFilter();
                }
            }
            catch (e) {
            }
        }
        //===============================================================================
        function OnClickBtnPrev() {
            switch ($("#" + MasterObj + "txtTabMode").val()) {
                case "2":
                    BindWorkPeriod();
                    findPrevWPID();
                    OnClickBtnFilter();
                    break;
                case "3":
                    $("#" + MasterObj + "txtWeekNo").val(parseInt($("#" + MasterObj + "txtWeekNo").val()) - 1);
                    OnClickBtnFilter();
            }
        }
        //===============================================================================
        function findNextWPID() {
            $("#" + MasterObj + "txtWPID").val(WorkPeriodXml.item(0).nextSibling.selectSingleNode('W').text);
            $get(MasterObj + "lblWorkPeriod").innerText = WorkPeriodXml.item(0).nextSibling.selectSingleNode('N').text;
            SDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).nextSibling.selectSingleNode('S').text, '/', '');
            EDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).nextSibling.selectSingleNode('E').text, '/', '');
            $("#BtnPrev").attr("disabled", false);
            $("#BtnPrev").attr("cursor", "pointer");
            if (WorkPeriodXml.item(0).nextSibling.nextSibling == null) {
                $("#BtnNext").attr("disabled", true);
                $("#BtnNext").css("cursor", "");
            }
        }
        //===============================================================================
        function findPrevWPID() {
            $("#" + MasterObj + "txtWPID").val(WorkPeriodXml.item(0).previousSibling.selectSingleNode('W').text);
            $get(MasterObj + "lblWorkPeriod").innerText = WorkPeriodXml.item(0).previousSibling.selectSingleNode('N').text;
            SDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).previousSibling.selectSingleNode('S').text, '/', '');
            EDateWPID = ReplaceAll("13" + WorkPeriodXml.item(0).previousSibling.selectSingleNode('E').text, '/', '');
            $("#BtnNext").attr("disabled", false);
            $("#BtnNext").attr("cursor", "pointer");
            if (WorkPeriodXml.item(0).previousSibling.previousSibling == null) {
                $("#BtnPrev").attr("disabled", true);
                $("#BtnPrev").css("cursor", "");
            }
        }
        //===============================================================================
        function OnClickBtnFilter() {
            $("#" + MasterObj + "txtSubmit").val("Filter");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //===============================================================================
        function OnClickBtnLinkItem(DocTypeID, SDate, EDate) {
            if ($("#" + MasterObj + "txtCmbAccess").val() == "0")
                AccepterCode = $("#" + MasterObj + "txtCartablOwner").val();
            else
                AccepterCode = $("#" + MasterObj + "CmbAccepter").val()
            var resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/AcceptCartable.aspx";
            url = resource + "?SDate=" + SDate.toString().substr(0, 4) + "/" + SDate.toString().substr(4, 2) + "/" + SDate.toString().substr(6, 2)
                    + "&EDate=" + EDate.toString().substr(0, 4) + "/" + EDate.toString().substr(4, 2) + "/" + EDate.toString().substr(6, 2)
                    + "&DocTypeID=" + DocTypeID
                    + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
                    + "&Accepter=" + AccepterCode
                    + "&SystemID=" + SelectedSystem

            var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
            returnValue = window.showModalDialog(url, window, winPro)
            if (returnValue == 1)
                OnClickBtnFilter();
        }
        //===============================================================================
        function ClearHeaderAndGrid() {
            while (TblDailyDoc.rows.length > 0)
                TblDailyDoc.deleteRow(0);
            while (TblMonthDoc.rows.length > 0)
                TblMonthDoc.deleteRow(0);
        }
        //===============================================================================
        function ClearGrdDayDoc() {
            while (TblDayDoc.rows.length > 0)
                TblDayDoc.deleteRow(0);
        }
        //===============================================================================
        function onchangeDate(obj) {
            var objNow = document.getElementById(MasterObj + "txtToday").value
            var Year = objNow.substr(0, 4)
            var Month = objNow.substr(5, 2)
            var Day = objNow.substr(8, 2)
            var sal;
            if (obj.value != "") {
                var Date = "";
                var s = obj.value.split('/');
                if (s.length > 3) {
                    obj.value = "";
                    return;
                }
                if (s[2] != null) {

                    sal = s[2].split('  ');
                }
                if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
                    obj.value = "";
                    return;
                }
                if (s.length == 3) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    if (s[2] == null)
                        Date = Year + "/" + Date
                    if (s[2] != null) {
                        var sal;
                        sal = s[2].split('  ');
                        if (sal[0].length == 0)
                            Date = Year + "/" + Date
                        if (sal[0].length == 1)
                            Date = Year.substr(0, 3) + sal[0] + "/" + Date
                        if (sal[0].length == 2)
                            Date = Year.substr(0, 2) + sal[0] + "/" + Date
                        if (sal[0].length == 3)
                            Date = Year.substr(0, 1) + sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] != "0000")
                            Date = sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] == "0000")
                            Date = Year + "/" + Date
                    }
                }
                if (s.length == 2) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    Date = Year + "/" + Date
                }
                if (s.length == 1) {
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Year + "/" + Month + "/" + Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Year + "/" + Month + "/" + Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Year + "/" + Month + "/" + Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Year + "/" + Month + "/" + Date + "01"
                }
                $get(MasterObj + "txtDate").value = Date;
                Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
                obj.value = Date
                obj.value = obj.value + "  " + F_adbsghh(obj.value)
                OnClickBtnFilter();
            }
        }
        //===================================
        function onclickHideCalc(obj) {
            $("#TDCal").hide("fast");
            $("#TDShowImg").show("fast");
        }
        //===============================================================================
        function onfocusCalendar() {
            $get("date_input_7").select();
        }
        //============================================================================== 
        function onclickTabSystem(Obj, TabNo) {
            $(".SystemSelectedTab").addClass("Tab");
            $(".SystemSelectedTab").removeClass("SystemSelectedTab")
            Obj.className = "SystemSelectedTab";

            switch (TabNo) {
                case "TblFrm":
                    SelectedSystem = '111';
                    break;
                case "TblTA":
                    SelectedSystem = '131';
                    break;
                case "TblRst":
                    SelectedSystem = '361';
                    break;
                case "TblGim":
                    SelectedSystem = '14';
                    break;
                case "TblTsh":
                    SelectedSystem = '20';
                    break;
            }
            ClearGrdDayDoc();
            ClearHeaderAndGrid()
            BindGrd();
        }
        //*******************************************************************************
        function OnChangeCmbAccepter() {
            $("#" + MasterObj + "txtCartablOwner").val($("#" + MasterObj + "CmbAccepter").val());
            OnClickBtnFilter();
        }
      
    </script>
</asp:Content>
