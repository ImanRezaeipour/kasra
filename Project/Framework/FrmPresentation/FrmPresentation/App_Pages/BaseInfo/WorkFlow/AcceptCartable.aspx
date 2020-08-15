<%@ Page Title="-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="AcceptCartable.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.AcceptCartable"
    AsyncTimeout="1800" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../../App_Utility/Styles/BaseInfo/WorkFlow/ShowCartable.css" />
    <style>
        .Tab
        {
            background-color: #000000;
            color: White;
            width: 180px;
            border-left-color: #FFFFFF;
            border-left-width: 2px;
            border-left-style: solid;
            border-bottom-color: #FFFFFF;
            border-bottom-width: 2px;
            border-bottom-style: solid;
            cursor: hand; /*filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#DFFFBF, EndColorStr=#33CC33);*/
            background-repeat:repeat-x;
        }
        .SelectedTab
        {
            background-color: #666660;
            color: #FFC0CB;
            width: 150px;
            border-left-color: #FFFFFF;
            border-left-width: 2px;
            border-left-style: solid;
            cursor: hand; /* filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#666666, EndColorStr=white);*/
        }
        .AlarmTxt
        {
            background-color: #e2b4f3;
            color: #f8090e;
            font-size:18;
            font-weight:bold;
            width: 20px;
            border:1px solid #b606f8;
            text-align:center;
            direction:ltr;
            height:20px;
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <div style="display: none">
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
    <table id="TBLBase" width="100%" align="center">
        <tr>
            <td>
                <table align="right" cellpadding="0" cellspacing="0" style="border: 1px groove; height: 25px;
                    background-color: #CCCCFF;">
                    <tr>
                        <td id="TabFrm" style="border: 1px groove #4B0082; width: 150px; height: 25px; color: #000066"
                            align="center" class="Tab" onclick="onclickTabSystem(this,'TblFrm')">
                            &nbsp;&nbsp;&nbsp;زير ساخت&nbsp;&nbsp;&nbsp;
                            <input type="text" id="txtFrmAlarm"  class="AlarmTxt" style="display: inline" />
                        </td>
                        <td id="TabTA" style="border: 1px groove #4B0082; width: 150px; height: 25px; color: #000066"
                            align="center" class="Tab" onclick="onclickTabSystem(this,'TblTA')">
                            &nbsp;&nbsp;&nbsp;اتوماسيون تردد&nbsp;&nbsp;&nbsp;
                            <input type="text" id="txtTAAlarm"  class="AlarmTxt" style="display: none" />
                        </td>
                        <td id="TabRst" style="border: 1px groove #4B0082; width: 150px; height: 25px; color: #000066"
                            align="center" class="Tab" onclick="onclickTabSystem(this,'TblRst')">
                            اتوماسيون تغذيه
                            <input type="text" id="txtRstAlarm"   class="AlarmTxt" style="display: none" />
                        </td>
                        <td id="TabGim" style="border: 1px groove #4B0082; width: 180px; height: 25px; color: #000066"
                             class="Tab" onclick="onclickTabSystem(this,'TblGim')">
                            <span >اتوماسيون بازرسي و انتظامات</span>
                            <span><input type="text" id="txtGimAlarm"  class="AlarmTxt" style="display: none;" /></span>
                        </td>
                        <td id="TabTsh" style="border: 1px groove #4B0082; width: 150px; height: 25px; color: #000066"
                            align="center" class="Tab" onclick="onclickTabSystem(this,'TblTsh')">
                            اتوماسيون تايم شيت
                            <input type="text" id="txtTshAlarm"  class="AlarmTxt"  style="display: none" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #4B0082; height: 3px;">
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td id="TDFilterItem">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table align="right" style="width: 670px" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="text-align: right">
                                                    تاييد کننده :
                                                </td>
                                                <td>
                                                    <div id="tdCmbAccepter">
                                                        <asp:DropDownList ID="CmbCartablOwner" runat="server" Height="16px" Width="100px"
                                                            value="0" CssClass="TxtControls" onchange="OnChangeCmbCartablOwner()">
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblTafviz" runat="server" Text="دارای کارتابل تفویضی" ForeColor="Red"></asp:Label>
                                                    </div>
                                                    <div id="tdlblAccepter">
                                                        <asp:Label ID="lblAccepters" runat="server" Style="color: green; border: 1px solid #6699FF;
                                                            width: 205px; height: 20px; text-align: right; background-color: White"></asp:Label>
                                                    </div>
                                                </td>
                                                <td style="text-align: right">
                                                    از :
                                                </td>
                                                <td id="TDKCal" style="text-align: right">
                                                    <uc2:KCalendar ID="KCalSDate" runat="server" />
                                                </td>
                                                <td style="text-align: right">
                                                    نوع سند :
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:DropDownList ID="CmbDocType" name="CmbDocType" Width="142px" class="TxtControls"
                                                        runat="server" onchange="onchangeCmbDocType(1)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    متقاضي :
                                                </td>
                                                <td style="text-align: right">
                                                    <select class="TxtControls" id="CmbRequestor" style="width: 210px;" onkeypress="return KeySort(this,false)"
                                                        runat="server" onchange="OnChangeCmbOneFilter()">
                                                    </select>
                                                </td>
                                                <td style="text-align: right">
                                                    تا :
                                                </td>
                                                <td style="text-align: right">
                                                    <uc2:KCalendar ID="KCalEDate" runat="server" />
                                                </td>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="TdDepartment" style="text-align: right">
                                                    واحد سازماني :
                                                </td>
                                                <td id="TdCmbDepartment" style="text-align: right">
                                                    <asp:DropDownList ID="CmbDepartment" runat="server" Width="210px" CssClass="TxtControls"
                                                        onkeypress="return KeySort(this,false)" onchange="OnChangeCmbOneFilter()">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right">
                                                    &nbsp; گروه :
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:DropDownList ID="CmbGroup" name="CmbGroup" Width="142px" class="TxtControls"
                                                        onchange="OnChangeCmbOneFilter()" onkeypress="return KeySort(this,false)" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <div align="right">
                                                        <input type="checkbox" id="ChkShwAll" runat="server" onclick="OnClickChkShwAll(this)" />
                                                        انتخاب همه
                                                    </div>
                                                </td>
                                                <td align="right" id="TdErjaStatus" style="display: none">
                                                    <div align="right">
                                                        <input type="checkbox" id="chkErjaStatus" runat="server" onclick="OnChangeCmbOneFilter()" />
                                                        نمايش مجوزهاي ارجاع جهت اطلاع
                                                    </div>
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
                                <table valign="top">
                                    <tr>
                                        <td id="TDEX" style="width: 100%" valign="top">
                                            <div id="DivEX" style="float: right" valign="top">
                                                <table id="TBEX">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table align="left">
                                    <tr>
                                        <td valign="middle">
                                            <input type="button" id="BtnFilter" class="BothFilter" onclick="OnClickBtnBothFilter()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%-- <td>
                                <table>
                                    <tr>
                                        <td valign="middle">
                                            <input type="text" id="txtAlarm" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>--%>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <table class="DivStyle1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top">
                            <div align="center" id="DivHeaderGrd" style="vertical-align: top; height: 30px">
                                <table id="TblHeaderGrd" cellspacing="0" style="width: 100%">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div align="center" id="DivDocGrd" style="vertical-align: top; height: 30px">
                                <table id="TblDocGrd" cellspacing="0" onclick="onClickGrdDoc(this)" ondblclick="OndbClickGrd()"
                                    style="width: 100%">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr id="TrFooter">
                        <td align="center" valign="top">
                            <table id="TblFooter" class="CssHeaderPageMain" style="border-color: Gray; border-style: solid;
                                border-width: 1px">
                                <tr>
                                    <td>
                                        <img src="/FrmPresentation/App_Utility/Images/Icons/active_last.gif" onclick="OnClickBtnLast()"
                                            style="cursor: pointer; vertical-align: middle" title='آخرين' />
                                        <img src="/FrmPresentation/App_Utility/Images/Icons/active_forward.gif" onclick="OnClickBtnNext()"
                                            id="BtNext" style="cursor: pointer; vertical-align: middle" title='بعدي' />
                                        <input type="text" onchange="OnBlurtxtCurPage(this)" style="width: 30px; alignment: center;
                                            text-align: center; vertical-align: middle" id="txtCurPage" onfocus="onfocusItem(this)"
                                            class="TxtControls" />
                                        از <span style="width: 30px" id="TotalPage">0</span>
                                        <img src="/FrmPresentation/App_Utility/Images/Icons/active_back.gif" onclick="OnClickBtnPrv()"
                                            id="BtnPrv" style="cursor: pointer; vertical-align: middle" title='قبلي' />
                                        <img src="/FrmPresentation/App_Utility/Images/Icons/active_first.gif" onclick="OnClickBtnFirst()"
                                            style="cursor: pointer; vertical-align: middle" title='اولين' />
                                        <span style="width: 30px" id="txtFrom">0</span> تا <span style="width: 30px" id="txtTo">
                                            0</span> از<span style="width: 30px" id="txtTotalRow">0</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="display: none">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtTotalPage" runat="server" />
                        <asp:HiddenField ID="txtDocAction" runat="server" />
                        <asp:HiddenField ID="txtXmlGrd" runat="server" />
                        <asp:HiddenField ID="txtPageNumberAccept" runat="server" />
                        <input type="text" id="txtXmlCombo" runat="server" />
                        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
                        <input type="text" id="txtXmlFilter" name="txtXmlFilter" runat="server" />
                        <input type="text" id="txtErjaStatus" name="txtErjaStatus" runat="server" />
                        <input type="text" id="txtOwnerAbsent" name="txtOwnerAbsent" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <div id="DivDesc" style="background-color: White; border: 2px solid Black; display: inline;
        position: absolute; top: 200; left: 200;">
        <table cellpadding="0" cellspacing="0">
            <tr style="background-color: Black; height: 10px">
                <td style='width: 17px; height: 10px'>
                    <img src="/FrmPresentation/App_Utility/Images/Icons/close1.png" style="background-color: Black;"
                        onclick="onclickBtnCloseDesc()" width="15px" height="15px" />
                </td>
                <td style="width: 150px; background-color: Black; color: White">
                    -------توضيحات-------
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <asp:TextBox ID="txtDescript" CssClass="TxtControls" onblur="onblurtxtDescript()"
                        Width="167" Height="150" TextMode="MultiLine" Wrap="true" Style="direction: rtl"
                        runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
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
        <input type="text" id="txtRequesterID" name="txtCreatorPersonID" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
        <input type="text" id="txtCartablOwner" name="txtCartablOwner" runat="server" />
        <input type="text" id="txtHoliday" />
        <input type="text" id="txtStrFilter" name="txtStrFilter" runat="server" />
        <input type="text" id="txtChangeVal" name="txtChangeVal" value="1" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" value="15" />
        <input type="text" id="txtPageNumber" name="txtPageNumber" value="1" runat="server" />
        <input type="text" id="txtAction" name="txtAction" runat="server" />
        <input type="text" id="txtSortStr" name="txtSortStr" runat="server" />
        <input type="text" id="txtDocType" name="txtDocType" value="0" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" value="0" runat="server" />
        <input type="text" id="txtShowErja" name="txtShowErja" value="0" runat="server" />
        <input type="text" id="txtModeSaveShwAll" name="txtModeSaveShwAll" runat="server" />
        <input type="text" id="txtRemoveXml" name="txtRemoveXml" runat="server" />
        <input type="text" id="txtXmlShareWorkTabl" name="txtXmlShareWorkTabl" runat="server" />
        <input type="text" id="txtFilterDate" name="txtFilterDate" runat="server" />
         <input type="text" id="txtFilterTime" name="txtFilterTime" runat="server" />
    </div>
    <script language="javascript" type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/KeySorting.js"></script>
    <script src="/FrmPresentation/App_Utility/Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    <script>


        document.dir = "RTL";
        window.name = "AcceptCartable";
        aspnetForm.target = "AcceptCartable";
        WidthScreen = window.screen.width;
        document.body.style.overflow = "auto";
        //        document.body.style.overflowY = "hidden";
        window.document.dir = "RTL";
        //        $get("GridViewCountainer").style.width = WidthScreen - 20;
        //        TBLBase.style.width = WidthScreen - 20;
        $get("OToolBar_TDTopToolBar").style.display = "none"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var AccessEdit = true;
        var StrChk = "";
        var colCounts = 0;
        var newrowindex = 0;
        var PageSize = parseInt($("#" + MasterObj + "txtPageSize").val());
        var LastSelectedRow;
        var DynamicGrid = 0;
        var ActorDescrCellIndex = 0;
        var ChangeDocType = false;
        var TimeOut = null;
        var TimeoutObj = null;
        var ISClose = false;
        var txtFocusText = null;
        var TblFooterWidth = 0;
        var BothFilter = 1;
        var XmlRemove = '';
        var oInterval = "";
        var Counter = 0;
        var TimeCount = 0
        var RowCount = 0;

        $("#" + MasterObj + "KCalSDate_txtOnChangeFunc").val("onchangeElem()");
        $("#" + MasterObj + "KCalEDate_txtOnChangeFunc").val("onchangeElem()");

        $("document").ready(function () {
            if ($("#" + MasterObj + "txtErjaStatus").val().toString().trim() == "1")
                $("#TdErjaStatus").css("display", "inline");
            $('#txtHoliday').val($("#" + MasterObj + "KCalSDate_txtXmlHoliday").val());
            $("#DivEX").hide();
            $("#TDEX").hide();
            $("#TDFilterItem").width = "100%";
            $('#DivDesc').draggable();
            $('#DivDesc').bind('dragstop', function (event, ui) {
                Top = ui.offset.top;
                Left = ui.offset.left;
            });
            $("#DivDesc").hide();

            onchangeCmbDocType(0);
            SetValuCombo();
            SetAttribFilter();

            if ($("#" + MasterObj + "CmbDocType").val() != 0)
                DynamicGrid = 1;
            CreateGridHeader(DynamicGrid);
            CreateGrid();

            SetPagingInfo();
            $("#" + MasterObj + "txtXmlGrd").val("");
            //--------Set Selected Tab-----------------
            $(".SystemSelectedTab").addClass("Tab");
            $(".SystemSelectedTab").removeClass("SystemSelectedTab")
           
            switch ($("#" + MasterObj + "txtSystemID").val()) {
                case "111":
                    TabFrm.className = "SystemSelectedTab";
                    break;
                case "131":
                    TabTA.className = "SystemSelectedTab";
                    break;
                case "361":
                    TabRst.className = "SystemSelectedTab";
                    break;
                case "20":
                    TabTsh.className = "SystemSelectedTab";
                    break;
                case "14":
                    TabGim.className = "SystemSelectedTab";
                    break;
            }
            //-----------------------------------------
            setInterval('RefreshCartablAlarm()', 300000)
            //setInterval('RefreshCartablAlarm()', 10000)
        });
        OnLoad();
        //--------------TimerForClient------
        fnStartInterval();
        function fnStartInterval() {
            if (oInterval == "")
                oInterval = window.setInterval("fnRecycle()", 9000);
            else {
                fnStopInterval();
            }
        }
        function fnStopInterval() {
            if (oInterval != "") {
                window.clearInterval(oInterval);
                resetVariable();
            }
        }
        function fnRecycle() {
            RefreshCartablAlarm();
        }
        function resetVariable() {
            oInterval = "";
            Counter = 0;
            TimeCount = 0;
        }
        //---------------------------------
        function OnLoad() {
            if ($("#" + MasterObj + "txtShowErja").val() == "0") {
                $get("OToolBar_BtnErja").style.display = "none";
            }

        }

        function SetAttribFilter() {
            $("#" + MasterObj + "txtChangeVal").val("0");
            $("#" + MasterObj + "CmbCartablOwner").attr("ChangeElem", "0");
            $("#" + MasterObj + "CmbDocType").attr("ChangeElem", "0");
            $("#" + MasterObj + "KCalSDate_txtCalendar").attr("ChangeElem", "0");
            $("#" + MasterObj + "KCalEDate_txtCalendar").attr("ChangeElem", "0");
            $get(MasterObj + "KCalSDate_txtCalendar").attachEvent("onchange", onchangeElem);
            $get(MasterObj + "KCalEDate_txtCalendar").attachEvent("onchange", onchangeElem);
        }
        //--------------------------------------------------------------------------------------------
        function onchangeElem() {
            $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
            $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
            $("#" + MasterObj + "KCalSDate_txtCalendar").attr("ChangeElem", "1");
            $("#" + MasterObj + "KCalEDate_txtCalendar").attr("ChangeElem", "1");
            if ($get(MasterObj + "txtKCalSDate").value <= $get(MasterObj + "txtKCalEDate").value)
                OnClickBtnFilter();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //--------------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "FilterValue")
                document.getElementById("ctl00_ProgressState").value = 1
        }
        //--------------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            var StrVal = $("#" + MasterObj + "txtSubmit").val();
            if (StrVal != "") {
                //----------------------------------------------------------------------------------------       
                if ($get(MasterObj + "txtAlert").value != "") {
                    if ($get(MasterObj + "txtValidate").value == "1") {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        window.returnValue = 1;
                        $("#" + MasterObj + "ChkShwAll").attr("checked", false)
                    }
                    else {
                        window.returnValue = 0;

                    }
                }

                if ($get(MasterObj + "txtSubmit").value != "") {
                    if ($("#" + MasterObj + "txtChangeVal").val() == "1") {
                        onchangeCmbDocType(0);
                        SetValuCombo();
                    }
                    SetAttribFilter();
                }
                if (StrVal != "FilterValue") {
                    if ($("#" + MasterObj + "CmbDocType").val() != 0)
                        DynamicGrid = 1;
                    else
                        DynamicGrid = 0;

                    if (ChangeDocType)
                        CreateGridHeader(DynamicGrid);
                    CreateGrid();
                    SetPagingInfo();
                    ChangeDocType = false;
                    $("#" + MasterObj + "txtXmlGrd").val("");
                }

                if (StrVal == "First" || StrVal == "Next" || StrVal == "Last" || StrVal == "Previous" || StrVal == "Const" || StrVal == "Filter") {
                    if (TblDocGrd.rows.length > 0) {
                        SetChk();
                        //=============اگرانتخاب همه تیک خورده باشد=========
                        if ($("#" + MasterObj + "ChkShwAll").attr("checked") == true)
                            OnClickChkShwAll($get(MasterObj + "ChkShwAll"), 1)
                    }
                    else
                        StrChk = "";
                    if (StrVal == "Filter") {
                        //----------------------برای عدم نمایش آلارم تب مورد نظر-----------
                        switch ($("#" + MasterObj + "txtSystemID").val()) {
                            case "111":
                                $("#txtFrmAlarm").css("display", "none")
                                $("#txtFrmAlarm").val("")
                                break;
                            case "131":
                                $("#txtTAAlarm").css("display", "none")
                                $("#txtTAAlarm").val("")
                                break;
                            case "361":
                                $("#txtRstAlarm").css("display", "none")
                                $("#txtRstAlarm").val("")
                                break;
                            case "20":
                                $("#txtGimAlarm").css("display", "none")
                                $("#txtGimAlarm").val("")
                                break;
                            case "14":
                                $("#txtTshAlarm").css("display", "none")
                                $("#txtTshAlarm").val("")
                                break;
                        }
                        //--------------------------------------------------------------------
                    }
                }
                else {
                    StrChk = "";
                    $("#" + MasterObj + "ChkShwAll").attr("checked", false)
                    $("#" + MasterObj + "txtModeSaveShwAll").val("");
                }


                if ($("#" + MasterObj + "txtErjaStatus").val().toString().trim() == "1")
                    $("#TdErjaStatus").css("display", "inline");

                if ($("#" + MasterObj + "txtOwnerAbsent").val() == "1")
                    alert("پرسنل تفويض دهنده آنلاين است، امکان مشاهده ي کارتابل وي وجود ندارد.");

                $("#" + MasterObj + "txtSubmit").val("");
                $("#" + MasterObj + "txtAlert").val("");
                $("#" + MasterObj + "txtDocType").val("0");
                $("#" + MasterObj + "txtDocAction").val("");
                $("#" + MasterObj + "txtStrFilter").val("");
                $("#" + MasterObj + "txtErjaStatus").val("0");
                $("#" + MasterObj + "txtOwnerAbsent").val("0");

            }

        }
        //--------------------------------------------------------------------------------------------
        function MakeXmlAction(Action, RPID, RPType) {
            StrChk += "<ActionTb>"
            StrChk += "<Action>" + Action + "</Action>"
            if (RPID != "")
                StrChk += "<R_P_ID>" + RPID + "</R_P_ID>"
            if (RPType != "")
                StrChk += "<R_P_Type>" + RPType + "</R_P_Type>"
            StrChk += "</ActionTb>"
            return StrChk;
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnAccept() {
            if (StrChk.toString().trim() != "" || $("#" + MasterObj + "ChkShwAll").attr("checked") == true) {
                GetPageNumber();
                $get(MasterObj + "txtAction").value = "1";
                $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(1, "", "") + "</Root>";
                $get(MasterObj + "txtRemoveXml").value = "<Root>" + XmlRemove + "</Root>";
                GetData('Const');
                $get(MasterObj + "txtSubmit").value = "Action";
                $get(MasterObj + "BtnSubmit").click();
            }
            else if ($("#" + MasterObj + "ChkShwAll").attr("checked") != true && StrChk.toString().trim() == "")
                alert("هيچ موردي جهت تاييد انتخاب نشده است");
        }
        //--------------------------------------------------------------------------------------------
        function GetPageNumber() {
            var PageSizeAccept = TblDocGrd.rows.length;
            var ChkCount;
            var PageSize;
            var PageNumberAccess;
            var PageNumberMain
            var strXml = "<Root>" + StrChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[PageNumber<=" + $get("txtCurPage").value + "]");
            ChkCount = oXmlNodes.length;
            PageSize = parseInt($get(MasterObj + "txtPageSize").value)
            PageNumberAccess = parseInt($get("txtCurPage").value)
            if ((PageNumberAccess == parseInt($("#TotalPage").text())) && parseInt(PageSizeAccept) < PageSize) {
                PageNumberMain = 1;
            }
            else {
                PageNumberMain = ((PageSize * PageNumberAccess) - ChkCount) / PageSize;
            }
            $get("txtCurPage").value = Math.ceil(PageNumberMain).toString();
            if ($get("txtCurPage").value == "0")
                $get("txtCurPage").value = "1";
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNotAccept() {
            if (StrChk.toString().trim() != "" || $("#" + MasterObj + "ChkShwAll").attr("checked") == true) {
                var Msg = "آیا برای عدم تاييد مطمئنید؟"
                if (confirm(Msg)) {
                    $get(MasterObj + "txtAction").value = "2";
                    $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(2, "", "") + "</Root>";
                    $get(MasterObj + "txtRemoveXml").value = "<Root>" + XmlRemove + "</Root>";
                    GetData('Const');
                    $get(MasterObj + "txtSubmit").value = "Action";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
            else if ($("#" + MasterObj + "ChkShwAll").attr("checked") != true && StrChk.toString().trim() == "")
                alert("هيچ موردي جهت عدم تاييد انتخاب نشده است");
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnErja() {
            if (StrChk.toString().trim() != "") {
                var DialogProperty = "dialogHeight:180px;dialogWidth:600px;center: Yes;help: no;status: no;resizable=1";
                var oRow = window.event.srcElement.parentElement
                while (oRow.tagName != "TR")
                    oRow = oRow.parentElement

                var url = "ErjaCartable.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&ErjaXml=" + StrChk;

                returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
                if (returnValue == 1) {
                    StrChk = "";
                    GetData('First')
                    $("#" + MasterObj + "txtSubmit").val('First');
                    $("#" + MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("هيچ موردي جهت ارجاع انتخاب نشده است");
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = TblDocGrd;
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;

            for (var i = 0; i < PageSize; i++) {
                if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
                    OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                    OnClickChk(OGrid.rows(i).cells(0).firstChild);
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex

            //========================================================
            var RemoveChkXML = "<Root>" + XmlRemove + "</Root>"
            var removeoXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            removeoXmlDoc.async = "false";
            removeoXmlDoc.loadXML(RemoveChkXML);
            //========================================================
            var DocID = oGrid.rows(oIndex).DocID;
            var DocTypeID = oGrid.rows(oIndex).DocTypeID;
            //========================================================
            var strXml = "<Root>" + StrChk + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));

                strXml = oXmlDoc.xml;
                StrChk = strXml.replace("<Root>", "");
                StrChk = StrChk.replace("</Root>", "");
                StrChk = StrChk.replace("<Root/>", "");

            }
            else {
                StrChk += "<Tb>"
                StrChk += "<RowNo>" + oGrid.rows(oIndex).RowNumber + "</RowNo>";
                StrChk += "<DocID>" + DocID + "</DocID>"
                StrChk += "<DocTypeID>" + DocTypeID + "</DocTypeID>"
                StrChk += "<ActorDesc>" + oGrid.rows(oIndex).cells(ActorDescrCellIndex).firstChild.getAttribute("Descr") + "</ActorDesc>"
                StrChk += "<PageNumber>" + $get("txtCurPage").value + "</PageNumber>"
                StrChk += "</Tb>"
            }
            //--------------XMLآنهایی که تیکشان برداشته می شود----------
            var removeoXmlNodes = removeoXmlDoc.documentElement.selectNodes("/Root/Tb [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");
            if (removeoXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    var D = removeoXmlDoc.documentElement.removeChild(removeoXmlNodes.item(0));

                RemoveChkXML = removeoXmlDoc.xml;
                XmlRemove = RemoveChkXML.replace("<Root>", "");
                XmlRemove = XmlRemove.replace("</Root>", "");
                XmlRemove = XmlRemove.replace("<Root/>", "");

            }
            else {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false) {
                    XmlRemove += "<Tb>"
                    XmlRemove += "<DocID>" + DocID + "</DocID>"
                    XmlRemove += "<DocTypeID>" + DocTypeID + "</DocTypeID>"
                    XmlRemove += "</Tb>"
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd(obj) {
            if (LastSelectedRow.Action == -4)
                AccessEdit = false;
            if (AccessEdit == true && LastSelectedRow.StatusId != "205" && LastSelectedRow.StatusId != "204") {
                var url = "", DialogProperty = "", DocTable = "";
                if (LastSelectedRow.DocTable == 'att.StaticCodeValue' && LastSelectedRow.DocTypeID == '12')
                    DocTable = 'Att.KaranePack';
                else
                    DocTable = LastSelectedRow.DocTable;

                switch (LastSelectedRow.DocTable) {
                    case "att.attendance":
                        url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "att.Attendance":
                        url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "atf.credit":
                        switch (LastSelectedRow.IsCredit) {
                            case "0":
                                var url = "/TAPresentation/App_Pages/Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
                                break;

                            case "1":
                                url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
                                DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no;resizable=1"
                                break;
                        }
                        break;
                    case "att.StaticCodeValue":
                        switch (LastSelectedRow.DocTypeID) {
                            case "4":
                                url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                                break;
                            case "5":
                                url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                                break;
                            case "6":
                                url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                                break;
                            case "12":
                                url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                                break;
                        }
                        break;
                    case "att.DayContinuation":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
                        DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "Att.ReplaceDetail":
                        url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;

                    case "Att.PackInstance":
                        url = "/TAPresentation/App_Pages/DataEntry/SchedulingProg.aspx";
                        DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                        break;

                    case "Att.ScheduleChanges":
                        url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
                        DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "TSH.TimeSheetCell":
                        var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
                        var DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1"
                        break;
                    case "att.DutyGeneral":
                        var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
                        var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                        break;
                    case "Att.KaranePack":
                        url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                        DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "Gim.Request":
                        url = "/GimPresentation/App_Pages/Requisition/RegisterRequestion.aspx";
                        DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                        break;
                }
                url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&TableName=" + DocTable
                    + "&FieldName=ID"
                    + "&FieldValue=" + LastSelectedRow.DocID
                returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);

                if (returnValue == 1)
                    OnClickBtnFilter();
            }
            else if (LastSelectedRow.StatusId == "205" || LastSelectedRow.StatusId == "204")
                alert("امکان ويرايش مجوز حذف شده وجود ندارد");
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) {
                OndbClickGrd();
            }
            else
                alert("لطفا به منظور ويرايش یک سطر را انتخاب کنید")
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
            $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
            $("#" + MasterObj + "txtDocType").val($("#" + MasterObj + "CmbDocType").val());
            if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
                alert("تاريخ شروع بزرگتر از تاريخ پايان است");
            else {
                $get(MasterObj + "txtAction").value = "";
                //-------------------------------------------------------------------------------------------------
                $("#" + MasterObj + "txtCartablOwner").val($("#" + MasterObj + "CmbCartablOwner").val());
                MakeStrExtended();
                if ($("#" + MasterObj + "CmbDocType").attr("ChangeElem") == 1)
                    $("#" + MasterObj + "txtSortStr").val("");
                if ($("[ChangeElem=1]").length > 0)
                    $("#" + MasterObj + "txtChangeVal").val("1");
                else
                    $("#" + MasterObj + "txtChangeVal").val("0");

                GetData('First');

                if (BothFilter == "1")
                    $("#" + MasterObj + "txtSubmit").val("Filter");
                else
                    $("#" + MasterObj + "txtSubmit").val("FilterValue");
                $("#" + MasterObj + "BtnSubmit").click();
                
            }
        }
        //-----------------------------------------------------------------------------------------------------------
        function OnClickImgFlow(obj) {
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var DocID = oRow.getAttribute('DocID')
            var DocTypeID = oRow.getAttribute('DocTypeID')
            window.showModalDialog("DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickRequestDate(obj) {
            var url = "", DialogProperty = "", DocTable = "";
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            if (oRow.DocTable == 'att.StaticCodeValue' && oRow.DocTypeID == '12')
                DocTable = 'Att.KaranePack';
            else
                DocTable = oRow.DocTable;
            switch (oRow.DocTable) {
                case "att.attendance":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "att.Attendance":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "atf.credit":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
                    DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no;resizable=1"
                    break;
                case "att.StaticCodeValue":
                    switch (oRow.DocTypeID) {
                        case "4":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                            break;
                        case "5":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                            break;
                        case "6":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                            break;
                        case "12":
                            url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                            DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                            break;
                    }
                    break;
                case "att.DayContinuation":
                    url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
                    DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "Att.ReplaceDetail":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "Att.PackInstance":
                    url = "/TAPresentation/App_Pages/DataEntry/SchedulingProg.aspx";
                    DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "Att.ScheduleChanges":
                    url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
                    DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                    break;
                case "TSH.TimeSheetCell":
                    var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
                    var DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1"
                    break;
                case "att.DutyGeneral":
                    var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
                    var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                    break;
                case "Att.KaranePack":
                    url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                    DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                    break;
            }
            url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
                + "&TableName=" + DocTable
                + "&FieldName=ID"
                + "&FieldValue=" + oRow.DocID
                + "&ModifyFlag=0";
            window.showModalDialog(encodeURI(url), "", DialogProperty);
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangeCmbDocType(Filter) {
            $("#DivEX").show();
            $("#TDEX").show();
            $("#TDFilterItem").width = "100%";

            var oXml = new ActiveXObject("Microsoft.XMLDOM")
            oXml.async = "false";
            oXml.loadXML($get(MasterObj + "txtXmlFilter").value)
            DisplaySystemTab(oXml);

            var oxmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/DocTypeValue[Type='D' and DocTypeID=" + $get(MasterObj + "CmbDocType").value + "]");
            if (oxmlNode.length > 0) {
                var Flag = MakeItems(oxmlNode[0].selectSingleNode("Extended").text);
                if (Flag) {
                    $("#TDEX").show()
                    $("#DivEX").show()
                }
            }
            if (Filter == 1) {
                ChangeDocType = true;
                $("#" + MasterObj + "CmbDocType").attr("ChangeElem", "1");
                OnClickBtnFilter();
            }
        }
        //===============================================================================
        function DisplaySystemTab(oXmlDoc) {
            var OtherTab = false;
           
            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/SystemValue [DocSubsysID='111'] ").length > 0) {
                OtherTab = true;
                $("#TabFrm").css("display", "inline");
            }
            else
                $("#TabFrm").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/SystemValue [DocSubsysID='14'] ").length > 0) {
                OtherTab = true;
                $("#TabGim").css("display", "inline");
            }
            else
                $("#TabGim").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/SystemValue [DocSubsysID='361'] ").length > 0) {
                OtherTab = true;
                $("#TabRst").css("display", "inline");
            }
            else
                $("#TabRst").css("display", "none");

            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/SystemValue [DocSubsysID='20'] ").length > 0) {
                OtherTab = true;
                $("#TabTsh").css("display", "inline");
            }
            else
                $("#TabTsh").css("display", "none");
            if (oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/SystemValue [DocSubsysID='131'] ").length > 0) {
//                if (OtherTab)
                    $("#TabTA").css("display", "inline");
//                else
//                    $("#TabTA").css("display", "none");
            }
            else
                $("#TabTA").css("display", "none");

        }
        //===============================================================================
        //=======================================
        function MakeItems(Str) {
            ClearTableExtended();
            var oXml = new ActiveXObject("Microsoft.XMLDOM")
            oXml.async = "false";
            oXml.loadXML(Str)
            if (Str != "") {
                var oxmlNode = oXml.documentElement.selectNodes("/Root/Item");

                if (oxmlNode.length == 0)
                    return false;
                var i = 0;
                while (i < oxmlNode.length) {
                    var ORow = TBEX.insertRow();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.cells(0).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";

                    ORow.cells(1).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
                    ORow.cells(1).style.textAlign = "right";

                    i++;
                    if (i < oxmlNode.length) {
                        ORow.insertCell();
                        ORow.insertCell();
                        ORow.cells(2).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";
                        ORow.cells(3).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
                        ORow.cells(3).style.textAlign = "right";
                        i++;
                    }
                }
            }
            else
                return false;
            return true;
        }
        //=======================================
        function ClearTableExtended() {
            while (TBEX.rows.length > 0)
                TBEX.deleteRow();
        }
        //=========================================ساختن آیتم های تکمیلی
        function CreateItem(XmlNode, Constractor) {
            var ReturnV = "";
            var Type = XmlNode.selectSingleNode("Type").text;
            switch ((Type).toLowerCase()) {
                case "string":
                    ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px' class='TxtControls' type='text' onchange='OnChangeCmbOneFilter()'/>";
                    break;
                case "time":
                    ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:50px;text-align:right' onblur='TimechkNew(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text'  />";
                    break;
                case "bit":
                    ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "  class='TxtControls' type='checkbox' onchange='OnChangeCmbOneFilter()'/>";
                    break;
                case "int":
                    ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px;text-align:center' onkeydown='OnKeyDownInt(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text' onchange='OnChangeCmbOneFilter()'/>";
                    break;
                case "date":
                    ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' type='text' style='display:none' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "/> <input  style='width:130px;text-align:right' onchange='onchangeDate(this),OnChangeCmbOneFilter()' onfocus='onfocusItem(this)' class='TxtControls' type='text'/><img src='/FrmPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' onclick='onclickImgDate(this)'/>";
                    break;
                case "select":
                    ReturnV = "<select name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "'  Default=" + XmlNode.selectSingleNode("Default").text + " style='width:150px' TYPE='Creator' class='TxtControls'  onchange='OnChangeCmbOneFilter()'><option value='0'>انتخاب همه</option></select>";
                    break;
                default:
                    ReturnV = "<select   name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' style='width:150px' Default=" + XmlNode.selectSingleNode("Default").text + " Const='" + Constractor + "' class='TxtControls' onchange='OnChangeCmbOneFilter()'>" + MakeCombo(XmlNode.selectSingleNode("Type").xml) + "</select>";
                    break;
            }
            return ReturnV;

        }
        //=======================================
        function MakeCombo(XmlData) {
            var oXml = new ActiveXObject("Microsoft.XMLDOM")
            oXml.async = "false";
            oXml.loadXML(XmlData)
            var Str = "";
            var oxmlNode = oXml.documentElement.selectNodes("/Type/N");
            for (var i = 0; i < oxmlNode.length; i++) {
                Str = Str + "<option value='" + oxmlNode[i].selectSingleNode("V").text + "'>" + oxmlNode[i].selectSingleNode("T").text + "</option>";
            }
            return Str;
        }
        //=======================================
        function onfocusItem(obj) {
            if (obj.tagName != "select")
                obj.select();
            else obj.setActive();
            obj.focus();
        }
        //================================تغییر کنترل تاریخ تکمیلی
        function onchangeDate(obj) {
            var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value;
            var Year = objNow.substr(0, 4)
            var Month = objNow.substr(5, 2)
            var Day = objNow.substr(8, 2)
            var RealVal = "";
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
                RealVal = Date;
                Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
                obj.value = Date
                obj.value = obj.value + "  " + F_adbsghh(obj.value)
            }
            obj.parentElement.firstChild.value = RealVal;
            // OnChangeCmbOneFilter();
        }
        //====================================ساخت جدول فیلد تکمیلی 
        function MakeStrExtended(obj) {
            var Obj;
            var Context = "";
            var Str = "";
            for (var i = 0; i < TBEX.rows.length; i++) {
                var j = 1;
                while (j < TBEX.rows(i).cells.length) {
                    Obj = TBEX.rows(i).cells(j).firstChild;
                    if (Obj.getAttribute("Default").trim() != Obj.value.trim() && obj != Obj) {
                        Context = Obj.getAttribute("Const");
                        Context = ReplaceAll(Context, "@", Obj.value);
                        Str = Str + " " + Context.substr(0, Context.indexOf("«") == -1 ? Context.length : Context.indexOf("«"));
                        var Start, End
                        if (Context.indexOf("«") > -1) {
                            Start = Context.indexOf("«") + 1;
                            End = Context.indexOf("»") - Start;
                            var TEXT = ReplaceAll(Context.substr(Start, End), '"', "'");
                            Str = Str + eval(TEXT)
                        }
                        Str = ReplaceAll(Str, '"', "'");
                    }
                    j += 2;
                }
            }
            $get(MasterObj + "txtStrFilter").value = Str;
        }
        //============================لود داده های مربوط به فیلد تکمیلی
        function SetValuCombo() {
            $("#" + MasterObj + "txtXmlCombo").val("<Root>" + $("#" + MasterObj + "txtXmlCombo").val() + "</Root>");
            var xml;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML($("#" + MasterObj + "txtXmlCombo").val());
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString($("#" + MasterObj + "txtXmlCombo").val(), 'text/xml');
            }
            for (var i = 0; i < TBEX.rows.length; i++) {
                var j = 1;
                while (j < TBEX.rows(i).cells.length) {
                    Obj = TBEX.rows(i).cells(j).firstChild;

                    var ObjCh = $(xml).find($(Obj).attr("FName"));
                    switch ($(Obj).attr("tagName")) {
                        case "SELECT":
                            $(Obj).html("");
                            $(ObjCh).each(function () {
                                var title = $(this).find('Title').text();
                                var Val = $(this).find('Val').text();
                                $(Obj).append("<option value=" + Val + ">" + title + "</option>");
                            });
                            break;
                        case "INPUT":
                            if (Obj.parentElement.childNodes[2] != null && Obj.parentElement.childNodes[2] != undefined) {
                                Obj.parentElement.childNodes[2].value = "";
                                onchangeDate(Obj.parentElement.childNodes[2]);
                                $(ObjCh).find($(Obj).attr("name")).each(function () {
                                    Obj.parentElement.childNodes[2].value = $(this).text();
                                    onchangeDate(Obj.parentElement.childNodes[2]);
                                });
                            }
                            else {
                                Obj.value = "";
                                $(ObjCh).find($(Obj).attr("name")).each(function () {
                                    $(Obj).val($(this).text());
                                });
                            }
                            break;
                    }
                    j++;
                }
            }

        }
        //====================================باز شدن پنجره تقویمهای فیلدهای تکمیلی
        function onclickImgDate(obj) {
            if (obj.parentElement.firstChild.value != "") {
                var Year = obj.parentElement.firstChild.value.substr(0, 4);
                var Month = obj.parentElement.firstChild.value.substr(5, 2);
                var Day = obj.parentElement.firstChild.value.substr(8, 2);
            }
            else {

                var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value

                var Year = objNow.substr(0, 4)
                var Month = objNow.substr(5, 2)
                var Day = objNow.substr(8, 2)
            }
            var strFeature = "dialogHeight:266px;dialogWidth:277px;dialogLeft:200px;dialogTop:200px;status=no";
            var strUrl = "/FrmPresentation/App_Utility/NewCalendar/SolarCalendar.htm";

            var oCurrentDate = new Object();
            oCurrentDate.Year = Year;
            oCurrentDate.Month = Month;
            oCurrentDate.Day = Day;
            oCurrentDate.Holiday = $get('txtHoliday').value;
            var oDate = showModalDialog(strUrl, oCurrentDate, strFeature);
            var strYear = "";
            var strMonth = "";
            var strDay = "";
            if (oDate != null) {
                var strYear = oDate.Year;
                var strMonth = ((parseInt(oDate.Month, 10) < 10) ? "0" + parseInt(oDate.Month, 10).toString() : oDate.Month.toString());
                var strDay = ((parseInt(oDate.Day, 10) < 10) ? "0" + parseInt(oDate.Day, 10).toString() : oDate.Day.toString());
            }
            Year = strYear;
            Month = strMonth;
            Day = strDay;
            oDate = Day + '/' + Month + '/' + Year;
            if (oDate != "//") {
                obj.parentElement.childNodes[2].value = oDate;
                onchangeDate(obj.parentElement.childNodes[2]);
                obj.parentElement.firstChild.value = Year + '/' + Month + '/' + Day;
                OnChangeCmbOneFilter();
            }
        }
        //===============================================================================================
        function SetChk() {
            var OGrid = TblDocGrd;
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;
            var strXml = "<Root>" + StrChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            //-------------------------------------------
            var removeChk = "<Root>" + XmlRemove + "</Root>"

            var oXmlDocRemove = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocRemove.async = "false";
            oXmlDocRemove.loadXML(removeChk);

            var oXmlNodesRemove = oXmlDocRemove.documentElement.selectNodes("/Root/Tb");
            //-------------------------------------------
            for (var j = 0; j < oXmlNodes.length; j++) {
                for (var i = 0; i < PageSize; i++) {
                    if (OGrid.rows(i).DocID == oXmlNodes.item(j).selectSingleNode("DocID").text
                        && OGrid.rows(i).DocTypeID == oXmlNodes.item(j).selectSingleNode("DocTypeID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                        OGrid.rows(i).cells(ActorDescrCellIndex).firstChild.setAttribute("Descr", oXmlNodes.item(j).selectSingleNode("ActorDesc").text);
                    }
                }
            }
            //--------------------------------------------
            for (var k = 0; k < oXmlNodesRemove.length; k++) {
                for (var m = 0; m < PageSize; m++) {
                    if (OGrid.rows(m).DocID == oXmlNodesRemove.item(k).selectSingleNode("DocID").text
                        && OGrid.rows(m).DocTypeID == oXmlNodesRemove.item(k).selectSingleNode("DocTypeID").text) {
                        OGrid.rows(m).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //===============================================================================================
        function OnChangeTxtDescr(obj) {
            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex
            var strXml = "<Root>" + StrChk + "</Root>"
            //========================================================
            var DocID = oGrid.rows(oIndex).DocID;
            var DocTypeID = oGrid.rows(oIndex).DocTypeID;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked) {
                    var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                    f.selectSingleNode("ActorDesc").text = oGrid.rows(oIndex).cells(ActorDescrCellIndex).firstChild.getAttribute("Descr");
                    oXmlDoc.childNodes[0].appendChild(f);
                }
                strXml = oXmlDoc.xml;
                StrChk = strXml.replace("<Root>", "");
                StrChk = StrChk.replace("</Root>", "");
                StrChk = StrChk.replace("<Root/>", "");
            }
        }
        //===============================================================================================
        function OnFocusTxtDescr(obj) {
            obj.select();
        }
        //===============================================================================================
        function OnClickBtnDocInfo() {
            if (LastSelectedRow != null) {
                var PersonID = LastSelectedRow.DocMemberID
                var DocTypeID = LastSelectedRow.DocTypeID
                var url = "/TaPresentation/App_Pages/Reports/DocInfo.aspx"
                    + "?PersonCode=" + PersonID
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                    + "&DocTypeID=" + DocTypeID
                    + "&PageMode=1&GrdHeight=480px"
                //               + "&WPeriodID=" + document.getElementById(MasterObj + "CmbPeriod").value
                //               + "&SDate=" + document.getElementById(MasterObj + "SDate").value
                //               + "&EDate=" + document.getElementById(MasterObj + "EDate").value
                CreditState = 1
                var winPro = "dialogHeight: 550px;dialogWidth: 900px;Bottom:0pX;center: No;help: no;resizable:1;status: no;minimize: yes;"
                CreditInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
            }
            else
                alert('لطفا یک سطر از گرید را انتخاب کنيد')
        }
        //===============================================================================================
        function CreateGridHeader(DynamicGrid) {
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"

            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGrd").value)
            var XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GrdHeader")

            ClearGrd(TblHeaderGrd)
            AddRowGrdHeader(TblHeaderGrd, XmlNodes, DynamicGrid)
        }
        //===============================================================================================
        function AddRowGrdHeader(oGrid, XmlNodes, DynamicGrid) {
            TblFooterWidth = 360;
            var len = XmlNodes.length, cellIndex = 0;
            oGrid.insertRow()

            oGrid.rows(0).className = "CssHeaderStyle"
            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = "<input type='checkbox' id='chkHeader' onclick='OnClickHeaderChk(this)' />";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'Selected');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '3');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex++).style.width = "30px";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "روند";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocID');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '8');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "30px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";


            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = "<div class='linkHeaderClass' onClick='OnClickHeaderGrd(this)' onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'>متقاضي </div>";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'requester');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 12);
            oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = "<div class='linkHeaderClass' onClick='OnClickHeaderGrd(this)' onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'> واحد سازماني</div>";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'deptName');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = "<div class='linkHeaderClass' onClick='OnClickHeaderGrd(this)' onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)' > نوع سند </div>";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'doctypename');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            if (DynamicGrid)
                for (var i = 0; i < len; i++) {
                    oGrid.rows(0).insertCell()
                    oGrid.rows(0).cells(cellIndex).innerHTML = "<div class='linkHeaderClass' onClick='OnClickHeaderGrd(this)' onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'>" + XmlNodes.item(i).selectSingleNode('ColTitle').text + "</div>";
                    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', XmlNodes.item(i).selectSingleNode('ColName').text);
                    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
                    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', XmlNodes.item(i).selectSingleNode('IsTitle').text);
                    oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
                    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
                    oGrid.rows(0).cells(cellIndex).style.width = XmlNodes.item(i).selectSingleNode('Width').text;
                    oGrid.rows(0).cells(cellIndex).style.color = "black";
                    cellIndex++;
                    TblFooterWidth += parseInt(XmlNodes.item(i).selectSingleNode('Width').text);
                }
            else {
                oGrid.rows(0).insertCell()
                oGrid.rows(0).cells(cellIndex).innerText = "موضوع سند";
                oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'description');
                oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
                oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 30);
                oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
                oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
                oGrid.rows(0).cells(cellIndex).style.width = "200px";
                oGrid.rows(0).cells(cellIndex++).style.color = "black";

                oGrid.rows(0).insertCell()
                oGrid.rows(0).cells(cellIndex).innerText = "شرح سند";
                oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'RequesterDescr');
                oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
                oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 25);
                oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
                oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
                oGrid.rows(0).cells(cellIndex).style.width = "120px";
                oGrid.rows(0).cells(cellIndex++).style.color = "black";

                TblFooterWidth += 320;
            }

            ActorDescrCellIndex = cellIndex;
            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "توضيحات";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'actordesc');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '6');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "50px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = "<div class='linkHeaderClass' onClick='OnClickHeaderGrd(this)' onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)' >تاريخ درخواست </div>";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'RequestDate');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "80px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";
            TblFooterWidth += 190;

            if (DynamicGrid == 0) {
                oGrid.rows(0).insertCell()
                oGrid.rows(0).cells(cellIndex).innerText = "تکميلي";
                oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'ExtendedInfo');
                oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '7');
                oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
                oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
                oGrid.rows(0).cells(cellIndex).style.width = "50px";
                oGrid.rows(0).cells(cellIndex++).style.color = "black";
                TblFooterWidth += 50;
            }

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "محاسباتي";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'CalcInfo');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '7');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "50px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";
            TblFooterWidth += 50;

            colCounts = cellIndex;
        }
        //===============================================================================================
        function CreateGrid() {
            ClearGrd(TblDocGrd)
            TblHeaderGrd.rows(0).cells(0).firstChild.checked = false;
            //-----------------------------Xml Grid------------------------------
            var xmlDocGrd = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDocGrd.async = "false"
            xmlDocGrd.loadXML($("#" + MasterObj + "txtXmlGrd").val());
            //---------------------------------------------------------------------------
            var xmlDocMsg = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDocMsg.async = "false"
            xmlDocMsg.loadXML($("#" + MasterObj + "txtDocAction").val());
            //---------------------------------------------------------------------------
            if ($("#" + MasterObj + "txtXmlGrd").val() != "<BaseInfoEntity />"
                && $("#" + MasterObj + "txtXmlGrd").val() != "<BaseInfoEntity></BaseInfoEntity>"
                && $("#" + MasterObj + "txtXmlGrd").val() != "") {
                var XmlNodes = xmlDocGrd.documentElement.selectNodes("/BaseInfoEntity/GrdDocs")
                if (XmlNodes.length > 0) {
                    var len = XmlNodes.length

                    for (var i = 0; i < len; i++)
                        AddRowGrd(TblDocGrd, XmlNodes.item(i), i, xmlDocMsg);
                }
            }

        }
        //===============================================================================================
        function AddRowGrd(oGrid, item, row, xmlDocMsg) {
            var ColType, ColName, ColTitle, isTitle, Name, Title, Width, ColTitle;
            var oRow = oGrid.insertRow();
            //--------------------------------------------------------------
            var DocID = item.selectSingleNode("DocID").text;
            var DocTypeID = item.selectSingleNode("DocTypeID").text;
            if ($("#" + MasterObj + "txtDocAction").val() != "<BaseInfoEntity />"
                && $("#" + MasterObj + "txtDocAction").val() != "<BaseInfoEntity></BaseInfoEntity>"
                && $("#" + MasterObj + "txtDocAction").val() != "")
                var XmlNodesMsg = xmlDocMsg.documentElement.selectNodes("/BaseInfoEntity/DocAction [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");
            //--------------------------------------------------------------
            for (var i = 0; i < colCounts; i++) {
                oGrid.rows(newrowindex).insertCell()

                ColType = TblHeaderGrd.rows(0).cells(i).getAttribute("ColType");
                ColName = TblHeaderGrd.rows(0).cells(i).getAttribute("ColName");
                ColTitle = TblHeaderGrd.rows(0).cells(i).innerText;
                isTitle = TblHeaderGrd.rows(0).cells(i).getAttribute("isTitle");
                Width = TblHeaderGrd.rows(0).cells(i).style.width;

                if (item.selectSingleNode(ColName)) {
                    if (isTitle > 0 && item.selectSingleNode(ColName).text.length > isTitle) {
                        Name = item.selectSingleNode(ColName).text.substr(0, isTitle) + "..."
                        Title = item.selectSingleNode(ColName).text
                    }
                    else {
                        Name = item.selectSingleNode(ColName).text
                        Title = ''
                    }
                    ColTitle = item.selectSingleNode(ColName).text;
                }
                switch (ColType) {
                    case "3":
                        if (XmlNodesMsg != null && XmlNodesMsg.length > 0)
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<input type='checkbox'  onclick='OnClickChk(this)' /><img  alt='" + XmlNodesMsg.item(0).selectSingleNode("Message").text + "' style='width:13px' src='/TAPresentation/App_Utility/Images/Icons/Error.ico'  />";
                        else
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<input type='checkbox'  onclick='OnClickChk(this)' />";
                        break;
                    case "4":

                        if (ColName == "RequestDate")
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div class='linkClass' onclick='OnClickRequestDate(this)' title='" + ColTitle + "' >" + ColTitle + "</div>";
                        else if (ColName == "RequesterDescr" || ColName == "description")
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:right'  >" + ColTitle + "</div>";
                        else
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:center' title='" + ColTitle + "' >" + ColTitle + "</div>";
                        break;
                    case "6":
                        oGrid.rows(newrowindex).cells(i).innerHTML = "<img  alt='توضيحات'  src='/FrmPresentation/App_Utility/Images/Icons/select.png' style='cursor: pointer'  onclick='OnClickBtnDescr(this)' />";
                        oGrid.rows(newrowindex).cells(i).firstChild.setAttribute("Descr", "");

                        break;
                    case "7":
                        oGrid.rows(newrowindex).cells(i).innerHTML = "<div class='linkClass' onclick='OnClickBtn" + ColName + "(this)' title='اطلاعات " + ColTitle + "' >...</div>";
                        break;
                    case "8":
                        oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/FrmPresentation/App_Utility/Images/Icons/btnSubNodes.gif' style='width:30px; cursor: pointer'  title='روند' onclick='OnClickImgFlow()' />";
                        break;

                }
                oGrid.rows(newrowindex).cells(i).style.border = "1px solid #E9E9E9";
                oGrid.rows(newrowindex).cells(i).style.width = Width
            }
            oGrid.rows(newrowindex).setAttribute("RowNumber", item.selectSingleNode("RowNumber").text);
            oGrid.rows(newrowindex).setAttribute("DocID", DocID);
            oGrid.rows(newrowindex).setAttribute("DocTypeID", DocTypeID);
            oGrid.rows(newrowindex).setAttribute("viewState", item.selectSingleNode("viewState").text);
            oGrid.rows(newrowindex).setAttribute("DocTable", item.selectSingleNode("DocTable").text);
            oGrid.rows(newrowindex).setAttribute("Action", item.selectSingleNode("Action").text);
            oGrid.rows(newrowindex).setAttribute("IsCredit", item.selectSingleNode("IsCredit").text);
            oGrid.rows(newrowindex).setAttribute("Active", item.selectSingleNode("Active").text);
            oGrid.rows(newrowindex).setAttribute("SDate", item.selectSingleNode("SDate").text);
            oGrid.rows(newrowindex).setAttribute("EDate", item.selectSingleNode("EDate").text);
            oGrid.rows(newrowindex).setAttribute("DocMemberID", item.selectSingleNode("DocMemberID").text);

            //-----------------------Grid Style---------------------------------------------------------
            if (oGrid.rows(newrowindex).getAttribute("Active") == "0"
                || oGrid.rows(newrowindex).getAttribute("Action") == "-4")
                oGrid.rows(newrowindex).cells(0).firstChild.disabled = true;
            if (oGrid.rows(newrowindex).getAttribute("Action") == "-1")
                oGrid.rows(newrowindex).className = "ErjaStepBeforStyle"
            else if (oGrid.rows(newrowindex).getAttribute("Action") == "-2")
                oGrid.rows(newrowindex).className = "ErjaToRequesterStyle"
            else if (oGrid.rows(newrowindex).getAttribute("Action") == "-3")
                oGrid.rows(newrowindex).className = "ErjaForReportAndEditStyle"
            else if (oGrid.rows(newrowindex).getAttribute("Action") == "-4")
                oGrid.rows(newrowindex).className = "ErjaForReportStyle"
            else if (oGrid.rows(newrowindex).getAttribute("viewState") == "0")
                oGrid.rows(newrowindex).className = "CssHolidayStyle"
            else {
                if (newrowindex % 2 == 0)
                    oGrid.rows(newrowindex).className = "CssItemStyle"
                else
                    oGrid.rows(newrowindex).className = "CssAlternatingItemStyle"
            }
            //----------------------------------------------------------------------------------------
            oGrid.rows(newrowindex).align = "center"
            newrowindex = newrowindex + 1
        }
        //===============================================================================================
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //===============================================================================================
        function onClickGrdDoc(obj) {
            var index = -1
            var oRow = event.srcElement
            var oCell = window.event.srcElement
            //_______Find Row------------------------
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            while (oCell.tagName != "TD")
                oCell = oCell.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "TblDocGrd") {
                for (i = 0; i < TblDocGrd.rows.length; i++) {
                    if (TblDocGrd.rows(i).className == "CssSelectedItemStyle") {
                        if (i % 2 == 0)
                            TblDocGrd.rows(i).className = "CssItemStyle"
                        else
                            TblDocGrd.rows(i).className = "CssAlternatingItemStyle"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow

                if (oCell.cellIndex != 0 && oCell.cellIndex != 1) {
                    if (oRow.cells(0).firstChild.disabled == false) {
                        if (oRow.cells(0).firstChild.checked)
                            oRow.cells(0).firstChild.checked = false;
                        else
                            oRow.cells(0).firstChild.checked = true;
                        OnClickChk(oRow.cells(0).firstChild);
                    }
                }
            }
        }
        //====================================================CreateGrid==========================
        function GetData(direction) {
            MakeStrExtended();
            switch (direction) {
                case "First": $("#" + MasterObj + "txtPageNumber").val(1); break;
                case "Next": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) + 1); break;
                case "Previous": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) - 1); break;
                case "Last": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#TotalPage").text())); break;
                case "Const": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val())); break;
            }
        }
        //**************************paging***********************************************
        function OnBlurtxtCurPage() {
            $("#txtCurPage").val($("#txtCurPage").val().replace(" ", ""));
            var TotalPage = parseInt($("#TotalPage").text());
            if ($("#txtCurPage").val() != "" && $("#txtCurPage").val() != "0") {
                if (parseInt($("#txtCurPage").val()) > parseInt(TotalPage)) {
                    $("#txtCurPage").val(TotalPage);
                }
                GetData('Const')
                $("#" + MasterObj + "txtSubmit").val('Const');
                $("#" + MasterObj + "BtnSubmit").click();
            }
            else {
                $("#txtCurPage").val("1");
                GetData('Const');
                $("#" + MasterObj + "txtSubmit").val('Const');
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt($("#txtCurPage").val()) < parseInt($("#TotalPage").text())) {
                GetData('Next')
                $("#" + MasterObj + "txtSubmit").val('Next');
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            GetData('Last')
            $("#" + MasterObj + "txtSubmit").val('Last');
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            if (parseInt($("#txtCurPage").val()) > 1) {
                GetData('Previous')
                $("#" + MasterObj + "txtSubmit").val('Last');
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            GetData('First')
            $("#" + MasterObj + "txtSubmit").val('First');
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function SetPagingInfo() {
            $("#txtCurPage").val($("#" + MasterObj + "txtPageNumber").val());
            $("#TotalPage").text(Math.ceil($("#" + MasterObj + "txtTotalPage").val() / PageSize));
            $("#txtFrom").text((($("#txtCurPage").val() - 1) * PageSize) + 1);

            $("#txtTo").text((($("#txtCurPage").val() - 1) * PageSize) + PageSize > $("#" + MasterObj + "txtTotalPage").val() ? $("#" + MasterObj + "txtTotalPage").val() : (($("#txtCurPage").val() - 1) * PageSize) + PageSize);

            $("#txtTotalRow").text($("#" + MasterObj + "txtTotalPage").val());

            if ($("#txtCurPage").val() == "" | $("#txtCurPage").val() == "0")
                $('#BtnPrv').disabled = true
            else
                $('#BtnPrv').disabled = false;

            if (parseInt($("#txtCurPage").val()) == parseInt($("#TotalPage").text()))
                $('#BtnNext').disabled = true
            else
                $('#BtnNext').disabled = false;


            if (parseInt($("#" + MasterObj + "txtTotalPage").val()) <= PageSize)
                $("#TrFooter").css("display", "none");
            else {
                $("#TrFooter").css("display", "inline");
                $("#TblFooter").css("width", TblFooterWidth + ((colCounts * 2) - 40));
                $("#TblFooter").css("height", "35px");
            }
        }
        //*******************************************************************************
        function OnClickBtnCalcInfo(obj) {
            var DialogProperty = "dialogHeight:150px;dialogWidth:400px;center: Yes;help: no;status: no;resizable=1";
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var url = "CartableCalcInfo.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&DocID=" + oRow.DocID
                + "&DocTypeID=" + oRow.DocTypeID
            window.showModalDialog(encodeURI(url), "", DialogProperty);
        }
        //*******************************************************************************
        function OnClickBtnExtendedInfo(obj) {
            var DialogProperty = "dialogHeight:150px;dialogWidth:1000px;center: Yes;help: no;status: no;resizable=1";
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement

            var url = "ShowDocDetail.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&DocID=" + oRow.DocID
                + "&DocTypeID=" + oRow.DocTypeID
            returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
            if (returnValue == 1) {
                GetData('First')
                $("#" + MasterObj + "txtSubmit").val('First');
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //*******************************************************************************
        function OnClickHeaderGrd(obj) {
            var SortStr = "";
            if (obj.parentElement.getAttribute("SortDirection") == "Blank") {
                obj.parentElement.setAttribute("SortDirection", "Asc")
                obj.parentElement.innerHTML = "<DIV class='linkHeaderClass' onclick='OnClickHeaderGrd(this)'  onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'>" + obj.innerText + "<img src='/TAPresentation/App_Utility/Images/Icons/Up.gif'  title='صعودي' /></DIV>";
            }
            else if (obj.parentElement.getAttribute("SortDirection") == "Asc") {
                obj.parentElement.setAttribute("SortDirection", "Desc")
                obj.parentElement.innerHTML = "<DIV class='linkHeaderClass' onclick='OnClickHeaderGrd(this)'  onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'>" + obj.innerText + "<img src='/TAPresentation/App_Utility/Images/Icons/Down.gif'  title='نزولي' /></DIV>";
            }
            else if (obj.parentElement.getAttribute("SortDirection") == "Desc") {
                obj.parentElement.setAttribute("SortDirection", "Blank")
                obj.parentElement.innerHTML = "<DIV class='linkHeaderClass' onclick='OnClickHeaderGrd(this)'  onmouseover='OnMouseOverPic(this)' onmouseout='OnMouseUpPic(this)'>" + obj.innerText + "<img src='/TAPresentation/App_Utility/Images/Icons/Blank.gif'   /></DIV>";
            }
            for (var i = 2; i < colCounts; i++) {
                if (TblHeaderGrd.rows(0).cells(i).getAttribute("SortDirection") != "Blank" && TblHeaderGrd.rows(0).cells(i).getAttribute("SortDirection") != null) {
                    if (SortStr == "")
                        SortStr = TblHeaderGrd.rows(0).cells(i).getAttribute("ColName") + " " + TblHeaderGrd.rows(0).cells(i).getAttribute("SortDirection");
                    else
                        SortStr += "," + TblHeaderGrd.rows(0).cells(i).getAttribute("ColName") + " " + TblHeaderGrd.rows(0).cells(i).getAttribute("SortDirection");
                }
            }

            $("#" + MasterObj + "txtSortStr").val(SortStr)
            GetData('First');
            $("#" + MasterObj + "txtSubmit").val('First');
            $("#" + MasterObj + "BtnSubmit").click();

        }
        //*******************************************************************************
        function OnChangeCmbCartablOwner() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($("#" + MasterObj + "txtXmlShareWorkTabl").val());

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetCmbAcces[Code=" + $("#" + MasterObj + "CmbCartablOwner").val() + " and OwnerAbsent=1]");
            if (oXmlNodes.length > 0)
                $("#" + MasterObj + "txtOwnerAbsent").val("1");


            $("#" + MasterObj + "CmbCartablOwner").attr("ChangeElem", "1");
            OnClickBtnFilter();
        }
        //*******************************************************************************
        function OnClickBtnDescr(obj) {
            txtFocusText = obj;
            $("#DivDesc").slideUp();
            if (TimeOut != null)
                clearTimeout(TimeOut)
            if (!ISClose) {
                TimeOut = setTimeout("ShowDescription()", 0)
            }
        }
        //*******************************************************************************
        function onclickBtnCloseDesc() {
            $("#DivDesc").slideUp("fast");
            ISClose = false;
            TimeoutObj = null;
        }
        //*******************************************************************************
        function onblurtxtDescript() {
            if (TimeoutObj != null) {
                if (TimeoutObj.getAttribute("Descr") != $get(MasterObj + "txtDescript").value) {
                    TimeoutObj.setAttribute("Descr", $get(MasterObj + "txtDescript").value);
                    OnChangeTxtDescr(TimeoutObj);
                    $get(MasterObj + "txtDescript").value = "";
                }
                $("#DivDesc").slideUp();
                TimeoutObj = null;
            }
        }
        //*******************************************************************************
        function ShowDescription() {
            TimeoutObj = txtFocusText;
            if (TimeoutObj != null) {
                $("#DivDesc").slideUp();
                $("#" + MasterObj + "txtDescript").val(TimeoutObj.getAttribute("Descr"));
                SetPosition(TimeoutObj, $get("DivDesc"));
                $("#DivDesc").slideDown("fast");
            }
        }
        var Type, Top, Left;
        //*******************************************************************************
        function SetPosition(NewObj, Div) {
            var posX = NewObj.offsetLeft;
            var posY = NewObj.offsetTop;

            if (Left != null && Top != null && Div.id == "DivDesc") {
                Div.style.top = Top;
                Div.style.left = Left;
            }
            else {
                while (NewObj.offsetParent) {
                    posX = posX + NewObj.offsetParent.offsetLeft;
                    posY = posY + NewObj.offsetParent.offsetTop;
                    if (NewObj == document.getElementsByTagName('body')[0]) { break }
                    else { NewObj = NewObj.offsetParent; }
                }
                Div.style.top = posY + 22;
                Div.style.left = posX - 80;
            }
        }
        //*******************************************************************************
        function OnkeyDownF(obj) {
            if (window.event.keyCode == 113) {
                ISClose = false;
                obj.focus();
            }
            if (window.event.keyCode == 27) {
                onblurtxtDescript();
            }
        }
        //*******************************************************************************
        function OnMouseOverPic(obj) {
            obj.style.color = "blueviolet";
        }
        //*******************************************************************************
        function OnMouseUpPic(obj) {
            obj.style.color = "#101fad";
        }
        //*******************************************************************************
        function OnClickBtnBothFilter() {
            if (BothFilter == "1") {
                BothFilter = "0";
                $("#BtnFilter").removeClass("BothFilter");
                $("#BtnFilter").addClass("Filter");

            }
            else if (BothFilter = "0") {
                $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
                $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
                $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
                $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
                $("#" + MasterObj + "txtDocType").val($("#" + MasterObj + "CmbDocType").val());
                if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value) {
                    alert("تاريخ شروع بزرگتر از تاريخ پايان است");
                    BothFilter = "0";
                    $("#BtnFilter").removeClass("BothFilter");
                    $("#BtnFilter").addClass("Filter");
                }
                else {
                    BothFilter = "1";
                    $("#BtnFilter").removeClass("Filter");
                    $("#BtnFilter").addClass("BothFilter");
                }
            }
            if (BothFilter == "1")
                OnClickBtnFilter();

        }
        //*******************************************************************************
        function OnChangeCmbOneFilter() {
            if (BothFilter == 1)
                OnClickBtnFilter();
        }
        //*******************************************************************************
        function TimechkNew(obj) {
            var val = ReplaceAll(obj.value, " ", "")
            var negativeFlag = val.substr(0, 1)
            if (negativeFlag == "-")
                val = val.substr(1, val.length)
            Timechk(obj);
            if (IsvalidTime(val))
                OnChangeCmbOneFilter();
        }
        //*******************************************************************************
        function onclickTabSystem(Obj, TabNo) {
            $(".SystemSelectedTab").addClass("Tab");
            $(".SystemSelectedTab").removeClass("SystemSelectedTab")
            Obj.className = "SystemSelectedTab";
            switch (TabNo) {
                case "TblFrm":
                    $("#" + MasterObj + "txtSystemID").val("111");
                    break;
                case "TblTA":
                    $("#" + MasterObj + "txtSystemID").val("131");
                    break;
                case "TblRst":
                    $("#" + MasterObj + "txtSystemID").val("361");
                    break;
                case "TblGim":
                    $("#" + MasterObj + "txtSystemID").val("14");
                    break;
                case "TblTsh":
                    $("#" + MasterObj + "txtSystemID").val("20");
                    break;
            }
            ChangeDocType = true;
            $("#" + MasterObj + "txtDocType").val("0");
            $("#" + MasterObj + "CmbDocType").val("0");
            $("#" + MasterObj + "txtChangeVal").val("1");
            $("#" + MasterObj + "txtSubmit").val("Filter");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************;resizable=1
        function OnClickBtnShowDocInfo() {
            if (LastSelectedRow != null) {
                var PersonID = LastSelectedRow.getAttribute("DocMemberID")
                var DocTypeID = LastSelectedRow.getAttribute("DocTypeID")
                var SDate = LastSelectedRow.getAttribute("SDate")
                var EDate = LastSelectedRow.getAttribute("EDate")
                var DocID = LastSelectedRow.getAttribute("DocID")
                var DialogProperty = "dialogHeight:700px;dialogWidth:1100px;center: Yes;help: no;status: no;resizable=1";
                var url = "/../../../TAPresentation/App_Pages/Reports/DocInfoNew.aspx"
                + "?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&PersonCode=" + PersonID
                + "&DocTypeID=" + DocTypeID
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SDate=" + SDate
                + "&EDate=" + EDate
                + "&DocID=" + DocID
                + "&Mode=1"
                returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
            }
            else {
                alert("لطفا یک سطر از گرید را انتخاب کنيد");
            }
        }
        //************************************************************گذاشتن انتخاب همه
        function OnClickChkShwAll(obj, remove) {
            if (obj.checked) {
                $get(MasterObj + "txtModeSaveShwAll").value = "1";
                if (remove != 1)
                    XmlRemove = "";
            }
            else
                $get(MasterObj + "txtModeSaveShwAll").value = "";
            //**********************
            var OGrid = TblDocGrd;
            var PageSize = OGrid.rows.length;
            if (PageSize != 0) {
                if (OGrid != "" || OGrid != undefined || OGrid != null) {
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;
                    //**********************
                    for (var j = 0; j < PageSize; j++) {
                        if (OGrid.rows(j).cells(0).firstChild.disabled != true) {
                            OGrid.rows(j).cells(0).firstChild.checked = obj.checked
                        }
                    }
                }
                SetChk()
            }
        }
        //---------------------------------------برای رفش مقادیر وارد شده به کارتابل
        function RefreshCartablAlarm() {
            $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
            $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
            $("#" + MasterObj + "KCalSDate_txtCalendar").attr("ChangeElem", "1");
            $("#" + MasterObj + "KCalEDate_txtCalendar").attr("ChangeElem", "1");
            //alert("1");
            if ($get(MasterObj + "txtKCalSDate").value <= $get(MasterObj + "txtKCalEDate").value && $("#" + MasterObj + "txtCartablOwner").val() !="") {
                $.ajax({
                    type: "POST",
                    url: "AcceptCartable.aspx/RefreshCartabl?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",

                    data: "{Accepter:'" + $("#" + MasterObj + "txtCartablOwner").val() + "', SDate:'" + $("#" + MasterObj + "txtKCalSDate").val() + "', EDate:'" + $("#" + MasterObj + "txtKCalEDate").val() + "', FilterDate:'" + $("#" + MasterObj + "txtFilterDate").val() + "', FilterTime:'" + $("#" + MasterObj + "txtFilterTime").val() + "' ,CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                    success: function (Data) {
                        UpdateAlarm(Data.d);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                    }
                });
            }
        }
        //------------------------------------
        function UpdateAlarm(Data) {
            if (Data != "{\"GetRefreshDoc\" : ]}" && Data != "") {
                var myObjectjson = eval('(' + Data + ')');
                $(myObjectjson.GetRefreshDoc).each(function () {
                    //alert(this.DocSubsysID)
                    if (this.DocSubsysID == "111") {
                        $("#txtFrmAlarm").css("display","inline")
                        $("#txtFrmAlarm").val(this.Count)
                        $("#txtFrmAlarm").attr("title", "تعداد مجوزهای جديد در حال ورود به کارتابل ")
                    }
                    else if (this.DocSubsysID == "131") {
                        $("#txtTAAlarm").css("display","inline")
                        $("#txtTAAlarm").val(this.Count)
                        $("#txtTAAlarm").attr("title", "تعداد مجوزهای جديد در حال ورود به کارتابل ")
                    }
                    else if (this.DocSubsysID == "361") {
                        $("#txtRstAlarm").css("display","inline")
                        $("#txtRstAlarm").val(this.Count)
                        $("#txtRstAlarm").attr("title", "تعداد مجوزهای جديد در حال ورود به کارتابل ")
                    }
                    else if (this.DocSubsysID == "14") {
                        $("#txtGimAlarm").css("display","inline")
                        $("#txtGimAlarm").val(this.Count)
                        $("#txtGimAlarm").attr("title", "تعداد مجوزهای جديد در حال ورود به کارتابل ")
                    }
                    else if (this.DocSubsysID == "20") {
                        $("#txtTshAlarm").css("display","inline")
                        $("#txtTshAlarm").val(this.Count)
                        $("#txtTshAlarm").attr("title", "تعداد مجوزهای جديد در حال ورود به کارتابل ")
                    }
                });

            }
        }
        //------------------------------------
    </script>
</asp:Content>
