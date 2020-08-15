<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" 
CodeBehind="GroupNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.GroupNew" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 950px;
        }
        .CssRow
        {
            background-color: #C6D0E1;
        }
        .CssRowSearch
        {
            background-color: #FFFF99;
        }
        .CssUnSelect
        {
            background-color: pink;
        }
        .CssSelect
        {
            background-color: Green;
        }
        .CssGreen
        {
            background-color: #CCFFCC;
        }
        .CssConfictItemStyle
        {
            background-color: #BECDDC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td rowspan="3" valign="top">
                <fieldset style="border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid; height: 600px;">
                    <legend style="color: #78BED6">اطلاعات گروه</legend>
                    <table align="center" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="text-align: right" >
                                &nbsp;&nbsp; نام گروه :<br style="font-size: 1" />
                                &nbsp;&nbsp;<input type="text" id="txtGroupName" style="width: 190px" class="TxtControls" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                              <td style="text-align: right" >
                                &nbsp;&nbsp;نام مخفف :<br style="font-size: 1" />
                                &nbsp;&nbsp;<input type="text" id="txtAcronymName" style="width: 190px" class="TxtControls" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                              <td style="text-align: right" >
                                &nbsp;&nbsp;  دسته بندي :
                                <br style="font-size: 1" />
                                &nbsp;&nbsp;<select id="CmbCategory" runat="server" style="width: 190px" class="TxtControls">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="width: 150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="width: 150px" />
                            </td>
                        </tr>
                        <tr>
                              <td style="text-align: right" >
                                &nbsp;&nbsp;  توضيحات :
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <textarea id="Descript" rows="10" cols="20" style="width: 190px; height: 200px" class="TxtControls"></textarea>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td align="center" valign="top" style="width: 730px">
                <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#becddc">
                    <tr>
                        <td style="width: 60px">
                          شهر :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbMember" runat="server" />
                        </td>
                        <td align="right">
                            <img src="/FrmPresentation/App_Utility/Images/Icons/S8.gif" alt="" onclick="onclickSearchImg()"
                                style="text-align: right; cursor: pointer;" />
                        </td>
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
                            <img src="/FrmPresentation/App_Utility/Images/Icons/copy01.gif" alt="کپی تاریخ" onclick="onclickCopyDate()"
                                style="text-align: right; cursor: pointer;" />
                        </td>
                    </tr>
                </table>
                <fieldset id="FSetNewMember" style="border: lightblue thin inset;">
                    <legend style="color: #78BED6">اعضا جدید<img src="../../App_Utility/Images/Icons/Add.gif"
                        onclick="onclickImgShowNewMember()" style="display: none" />
                    </legend>
                    <div id="DivNewMember" style="overflow: auto; height: 200px; display: inline">
                        <table id="TblGroupMember">
                            <tr class="header">
                                <td class="CssHeaderStyle" style="width: 30px" align="center">
                                    <input type="checkbox" id="ChkHeader" onclick='onclickChkHeaderNewMembers(this)' />
                                </td>
                                <td class="CssHeaderStyle" style="width: 120px" align="center">
                                    کد   
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    نام 
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    از تاريخ
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    تا تاريخ
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <fieldset style="border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid; height: 375px;">
                    <legend style="color: #78BED6">اعضا گروه</legend>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <div id="GridViewPerson">
                                <cc2:KasraGrid ID="GrdGroupMember" runat="server" OnRowDataBound="Grid_RowDataBound"
                                    AllowSorting="true" OnSorting="GrdGroupMember_Sorting">
                                </cc2:KasraGrid>
                            </div>
                            <asp:HiddenField ID="txtSortCondition" runat="server" />
                            <asp:HiddenField ID="txtSortExpression" runat="server" />
                            <asp:HiddenField ID="txtSortDirection" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
    </table>
    <div id="DivDialogConflict" style="border: 2px groove #000000; display: none; position: absolute;
        top: 100; left: 100; background-color: #FFFFFF;">
        <div id="DivShowConflict" style="overflow: auto; width: 900px; height: 300px">
        </div>
        <div>
            <input type="button" class="CssHeaderStyle" value="شکستن تاریخ اتوماتیک" onclick="onclickBtnOK()" />
            &nbsp; &nbsp; &nbsp;
            <input class="CssHeaderStyle" type="button" value="   بستن   " onclick="onclickBtnCancel()" />
        </div>
        <div style="height: 20px">
        </div>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtHoliday" name="txtHoliday" runat="server" />
        <input type="text" id="txtSave" name="txtSave" runat="server" />
        <input type="text" id="txtSaveNewMember" name="txtSaveNewMember" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" value="16" runat="server" />
        <input type="text" id="txtTotalPage" name="txtTotalPage" runat="server" />
        <input type="text" id="txtGroupInfo" name="txtGroupInfo" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <!---------------Temp------------------------>
        <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
        <input type="text" id="txtMemberCode" name="txtMemberCode" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script>

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        $.noConflict();
        var PageSize = 12;
        var DateManage = 0;
        $("#OToolBar_TDTopToolBar").css("display", "none");
        $("#" + MasterObj + "txtSave").val("<Root></Root>");
        SetDate();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtSubmit").value != "") {
                SetChange();
                $get(MasterObj + "txtSubmit").value = "";
            }
        }
        //----------------------------------
        $(document).ready(function () {
            SetGroupInfo();
            $("#" + MasterObj + "CmbMember_txtOnChangeFunc").val("OnChangeCmbMember()");
        });
        //---------------------------------
        function SetGroupInfo() {
            var xml;
            var Data = $("#" + MasterObj + "txtXml").val();
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            var XmlNodeGroupInfo = $(xml).find("NewDataSet").find("Group");
            $("#txtGroupName").val($(XmlNodeGroupInfo[0]).find("Name").text());
            $("#txtAcronymName").val($(XmlNodeGroupInfo[0]).find("Acronym").text());
            $("#" + MasterObj + "CmbCategory").val($(XmlNodeGroupInfo[0]).find("CategoryId").text());
            $("#Descript").val($(XmlNodeGroupInfo[0]).find("Description").text());
        }
        function SetDate() {
            $("#" + MasterObj + "KCalSDate_txtYear").val("1390");
            $("#" + MasterObj + "KCalSDate_txtMonth").val("01");
            $("#" + MasterObj + "KCalSDate_txtDay").val("01");
            $("#" + MasterObj + "KCalSDate_txtCalendar").val("01/01/1390" + "  " + F_adbsghh("01/01/1390"));

            $("#" + MasterObj + "KCalEDate_txtYear").val("1399");
            $("#" + MasterObj + "KCalEDate_txtMonth").val("12");
            $("#" + MasterObj + "KCalEDate_txtDay").val("29");
            $("#" + MasterObj + "KCalEDate_txtCalendar").val("29/12/1399" + "  " + F_adbsghh("29/12/1399"));
        }
        function AddRow(obj) {
            $("#TblGroupMember").html($("#TblGroupMember").html() + " <tr class='CssRow' MemberID=" + obj.find("MemberID").text() + " MemberCode=" + obj.find("MemberCode").text() + " >"
            + "<td  align='center'><input type='checkbox' " + (obj.find("Selected").text() == "1" ? " checked " : "") + " RealVal=" + obj.find("Selected").text() + " /></td>"
            + "<td  align='center'>" + obj.find("MemberCode").text() + " </td> "
            + "<td align='right'>" + obj.find("Name").text() + " </td> "
            + "<td  align='center'><input  type='text' style='display:none' RealVal=" + obj.find("StartDate").text() + "  value='" + obj.find("StartDate").text() + "' /> <input RealVal=" + obj.find("StartDate").text() + "  style='width:130px;text-align:right' value='" + obj.find("StartDate").text() + "'  class='TxtControls' type='text'/><img src='/FrmPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' /></td>"
            + "<td  align='center'><input  type='text' style='display:none' RealVal=" + obj.find("EndDate").text() + "  value='" + obj.find("EndDate").text() + "'/> <input RealVal=" + obj.find("EndDate").text() + "    style='width:130px;text-align:right' value='" + obj.find("EndDate").text() + "'  class='TxtControls' type='text'/><img src='/FrmPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' /></td>"
            + "</tr>");
        }
        //===========================
        function ClearGrid() {
            $(".CssRow").remove();
        }
        //====================================================CreateGrid==========================
        function CreateGrid(Xml) {
            if (window.ActiveXObject) {
                XmlSave = new ActiveXObject('Microsoft.XMLDOM');
                XmlSave.async = 'false';
                XmlSave.loadXML(Xml);
            } else {
                var parser = new DOMParser();
                XmlSave = parser.parseFromString(Xml, 'text/xml');
            }
            //--------------------------
            var XmlNodes = $(XmlSave).find("Root").find("Tb").each(function () {
                AddRow($(this));
            });
            $("#TblGroupMember").find("tr").each(function () {
                if (!$(this).hasClass("header")) {
                    $(this).find("td:eq(0)").find("input").click(function () { onchangeCheckDelete(this) });

                    $(this).find("td:eq(3)").find("input:eq(1)").blur(function () { onchangeDate(this); CheckValidDateNewMember(this); }).focus(function () { onfocusItem(this) });
                    $(this).find("td:eq(3)").find("Img").click(function () {
                        onclickImgDate(this)
                    });

                    $(this).find("td:eq(4)").find("input:eq(1)").focus(function () { onfocusItem(this) }).blur(function () { onchangeDate(this); CheckValidDateNewMember(this); })

                    $(this).find("td:eq(4)").find("Img").click(function () {
                        onclickImgDate(this)
                    });

                }
            });
        }
        //====================================کپی شدن کلیه تاریخ ها در گرید پایین آن
        function onclickCopyDate() {
            $("#TblGroupMember tr").each(function () {
                $(this).find("td:eq(3)").find("input:eq(1)").val($("#" + MasterObj + "KCalSDate_txtCalendar").val());
                $(this).find("td:eq(4)").find("input:eq(1)").val($("#" + MasterObj + "KCalEDate_txtCalendar").val());
            });
        }
        //====================================باز شدن پنجره تقویمها
        function onclickImgDate(obj) {
            if (obj.parentElement.firstChild.value != "") {
                var Year = obj.parentElement.firstChild.value.substr(6, 4);
                var Month = obj.parentElement.firstChild.value.substr(3, 2);
                var Day = obj.parentElement.firstChild.value.substr(0, 2);
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
            oCurrentDate.Holiday = $("#" + MasterObj + "KCalSDate_txtXmlHoliday").val();
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
            }
        }
        //===============================
        function onfocusItem(obj) {
            obj.select();
        }
        //================================تغییر کنترل تاریخ
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
            obj.parentElement.firstChild.value = ReverseDate(RealVal);
        }
        //--------------------------------
        function OnClickBtnSelect() {
            var strUrl = "/TAPresentation/App_Pages/Setting/City.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value+"&SelectMode=1"
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 600px;dialogWidth:1200px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            if (returnResult != "" && returnResult != undefined) {
                var xmlNew;
                if (window.ActiveXObject) {
                    xmlNew = new ActiveXObject('Microsoft.XMLDOM');
                    xmlNew.async = 'false';
                    xmlNew.loadXML(returnResult);
                } else {
                    var parser = new DOMParser();
                    xmlNew = parser.parseFromString(returnResult, 'text/xml');
                }
                var StrSave = "";
                //---------------------------------               
                var SDate = $("#" + MasterObj + "KCalSDate_txtDay").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtYear").val();
                var EDate = $("#" + MasterObj + "KCalEDate_txtDay").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtYear").val();

                var LastRowNumber = $("#TblGroupMember").find("tr").length - 1;
                $(xmlNew).find("Root").find("Tb").each(function () {

                    if ($("#TblGroupMember").find("tr[MemberID='" + $(this).find("MemberID").text() + "']").length == 0)
                        StrSave += "<Tb><RowNumber>" + (parseInt(LastRowNumber + 1)) + "</RowNumber><Name>" + $(this).find("MName").text() + "</Name><MemberCode>" + $(this).find("MCode").text() + "</MemberCode><Selected>1</Selected><MemberID>" + $(this).find("MID").text() + "</MemberID><StartDate>" + SDate + "</StartDate><EndDate>" + EDate + "</EndDate><OldSDate></OldSDate><OldEDate></OldEDate></Tb>";

                    LastRowNumber++;
                });
                StrSave = "<Root>" + StrSave + "</Root>";
                CreateGrid(StrSave);
            }
        }
        //--------------------
        function NotEmpty() {
            var SDate = $("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val();
            var EDate = $("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val();
            if ($("#txtGroupName").val() == "") {
                alert("نام گروه را وارد کنید ")
                $("#txtGroupName").focus();
                return false
            }
            if ($("#txtAcronymName").val() == "") {
                alert("نام مخفف را وارد کنید ")
                $("#txtAcronymName").focus();
                return false
            }
            if ($("#" + MasterObj + "CmbCategory").val() == "0") {
                alert("نام دسته بندي را انتخاب کنید ")
                $("#txtAcronymName").focus();
                return false
            }
            if (SDate == "//") {
                alert("تاریخ شروع را وارد کنید ")
                $("#" + MasterObj + "KCalSDate_txtCalendar").focus();
                return false
            }
            if (EDate == "//") {
                alert("تاریخ خاتمه را وارد کنید ")
                $("#" + MasterObj + "KCalEDate_txtCalendar").focus();
                return false
            }
            if (SDate > EDate) {
                alert("تاریخ شروع از تاریخ خاتمه بزرگتر است ")
                $("#" + MasterObj + "KCalEDate_txtCalendar").focus();
                return false
            }
            return true;
        }
        //--------------------------------
        function OnClickBtnSave() {
            var SDate = $("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val();
            var EDate = $("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val();

            if (NotEmpty()) {
                OpenModelPopup();
                AddNewMemberXml();
                var StrXmlSave = "<Root>" + $("#" + MasterObj + "txtSave").val().replace("</Root>", "").replace("<Root>", "") + $("#" + MasterObj + "txtSaveNewMember").val().replace("<Root>", "").replace("</Root>", "") + "</Root>";
                $.ajax({
                    type: "POST",
                    url: "GroupNew.aspx/ModifyGroupMember?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SaveXml:'" + StrXmlSave + "' ,GroupID:'" + $("#" + MasterObj + "txtGroupID").val() + "',GroupName:'" + $("#txtGroupName").val() + "' ,Category:'" + $("#" + MasterObj + "CmbCategory").val() + "' ,Acronym:'" + $("#txtAcronymName").val() + "' ,DateManage:'" + DateManage.toString() + "' ,Description:'" + $("#Descript").val() + "',SystemID:'" + $("#" + MasterObj + "txtSystemID").val() + "',SDate:'" + SDate + "' ,EDate:'" + EDate + "',Active:1, CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                    success: function (Data) {
                        CloseModelPopup();
                        var xmlSave;
                        if (window.ActiveXObject) {
                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                            xmlSave.async = 'false';
                            xmlSave.loadXML(Data.d);
                        } else {
                            var parser = new DOMParser();
                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
                        }
                        $("#" + MasterObj + "txtGroupID").val($(xmlSave).find("NewDataSet").find("ShowMessage").find("ID").text());

                        if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "1") {
                            SetMsg($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())
                            $("#" + MasterObj + "txtSave").val("<Root></Root>")
                            $("#" + MasterObj + "txtSaveNewMember").val("<Root></Root>");
                            ClearGrid();
                            $("#" + MasterObj + "txtSubmit").val("Search");
                            $("#" + MasterObj + "BtnSubmit").click();
                            window.returnValue = 1;
                        }
                        else
                            if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "2") {
                                CreateGridConflict($(xmlSave));
                            }
                            else
                                alert($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        CloseModelPopup();
                        alert("ذخيره با خطا مواجه شد");
                    }
                });
            }
        }
        //---------------------------------
        function CreateGridConflict(Xml) {
            $("#DivShowConflict").html("<table><tr><td class='CssHeaderStyle' style='width:100' align='center'>کد</td><td class='CssHeaderStyle' style='width:200' align='center'>نام</td><td class='CssHeaderStyle' style='width:100' align='center'>بازه تاريخ</td><td class='CssHeaderStyle' style='width:200' align='center'>بازه تداخل </td><td class='CssHeaderStyle' style='width:150' align='center'>گروه  </td></tr></table>");
            Xml.find("NewDataSet").find("ConflictResult").each(function () {
                $("#DivShowConflict").find("table").append("<tr><td class='CssConfictItemStyle' >" + $(this).find("MCode").text() + "</td>" +
                    "<td class='CssConfictItemStyle' >" + $(this).find("MName").text() + "</td><td class='CssConfictItemStyle' >" + $(this).find("SDate").text() + "&nbsp;&nbsp; &nbsp;" + $(this).find("EDate").text() + "</td><td class='CssConfictItemStyle' >" + $(this).find("ConflicSDate").text() + "&nbsp;&nbsp; &nbsp;" + $(this).find("ConflicEDate").text() + " </td><td class='CssConfictItemStyle' >" + $(this).find("GroupName").text() + " </td></tr>");
            });
            $("#DivDialogConflict").show("slow");
        }
        //---------------------------------
        function AddNewMemberXml() {
            $("#" + MasterObj + "txtSaveNewMember").val("<Root>");
            $("#TblGroupMember").find("tr").each(function () {
                if (!$(this).hasClass("header") && $(this).find("td:eq(0)").find("input").attr("checked"))
                    $("#" + MasterObj + "txtSaveNewMember").val($("#" + MasterObj + "txtSaveNewMember").val() + "<Tb><RowNumber></RowNumber><Selected>" + ($(this).find("td:eq(0)").find("input").attr("checked") ? "1" : "0") + "</Selected><MemberID>" + $(this).attr("MemberID") + "</MemberID><StartDate>" + CorrectDate($(this).find("td:eq(3)").find("input:eq(0)").val()) + "</StartDate><EndDate>" + CorrectDate($(this).find("td:eq(4)").find("input:eq(0)").val()) + "</EndDate><OldSDate></OldSDate><OldEDate></OldEDate></Tb>");
            });
            $("#" + MasterObj + "txtSaveNewMember").val($("#" + MasterObj + "txtSaveNewMember").val() + "</Root>");
        }
        //---------------------------------
        function onclickSearchImg() {
            var Code = $("#" + MasterObj + "CmbMember_txtPCode").val();
            $("#TblGroupMember").find("tr[MemberCode=" + Code + "]").addClass("CssRowSearch");
            $("#" + MasterObj + "txtMemberCode").val(Code);
            $("#" + MasterObj + "txtSubmit").val("Search");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //---------------------------------
        function onchangeCheck(obj) {
            //برای حالت تغییر چک باکس سه لول باید بیرون آمد تا به ردیف برسیم ولی در حالت تغییر تاریخ ها باید دو لول بیرون آمد 
            // این تفاوت به خاطر تگ Span است که خود سیستم برای چک باکس می سازد 
            var Row = obj.parentElement.parentElement;
            if (Row.tagName != "TR")
            //---------------------------
                Row = Row.parentElement;

            var xmlSave;
            var Data = $("#" + MasterObj + "txtSave").val();
            if (window.ActiveXObject) {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xmlSave = parser.parseFromString(Data, 'text/xml');
            }
            //---------------------------حذف از ایکس ام ال تغییرات به دلیل اینکه می توان مجددا آن را ساخت  
            if ($(xmlSave).find("Root") != undefined && $(xmlSave).find("Root").find("Tb") != undefined) {
                $(xmlSave).find("Root").find("Tb").find("RowNumber").filter(function () { return $(this).text() == $(Row).attr("GMID") }).each(function () {
                    xmlSave.childNodes(0).removeChild($(this).parent(0)[0]);
                });
                $("#" + MasterObj + "txtSave").val(xmlSave.xml != undefined ? xmlSave.xml : (new window.XMLSerializer()).serializeToString(xmlSave));
            }
            //------------------------ایکس ام ال مربوط به تغییرات اعضای قدیمی گروه 
            //-----------------------تاریخ قدیمی موجود برای ذخیره اهمیت دارد چون جدول فیلد یکتا ندارد           
            var xmlN;
            var OldSDate = "", OldEDate = "";
            OldSDate = CorrectDate(Row.cells(3).firstChild.getAttribute("RealVal"));
            OldEDate = CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal"));
            var RowNumber
            if (window.ActiveXObject) {
                xmlN = new ActiveXObject('Microsoft.XMLDOM');
                xmlN.async = 'false';
                xmlN.loadXML("<Root><Tb><RowNumber>" + $(Row).attr("GMID").toString() + "</RowNumber><Selected>" + ($(Row).find("td:eq(0)").find("input").attr("checked") ? "1" : "0") + "</Selected><MemberID>" + $(Row).attr("MemberID") + "</MemberID><StartDate>" + CorrectDate(Row.cells(3).firstChild.value) + "</StartDate><EndDate>" + CorrectDate(Row.cells(4).firstChild.value) + "</EndDate><OldSDate>" + OldSDate + "</OldSDate><OldEDate>" + OldEDate + "</OldEDate></Tb></Root>");
            } else {
                var parser = new DOMParser();
                xmlN = parser.parseFromString("<Root><Tb><RowNumber>" + $(Row).attr("GMID").toString() + "</RowNumber><Selected>" + ($(Row).find("td:eq(0)").find("input").attr("checked") ? "1" : "0") + "</Selected><MemberID>" + $(Row).attr("MemberID") + "</MemberID><StartDate>" + CorrectDate(Row.cells(3).firstChild.value) + "</StartDate><EndDate>" + CorrectDate(Row.cells(4).firstChild.value) + "</EndDate><OldSDate>" + OldSDate + "</OldSDate><OldEDate>" + OldEDate + "</OldEDate></Tb></Root>", 'text/xml');
            }
            $(xmlSave).children(0).append($(xmlN).find("Root").find("Tb")[0]);
            $("#" + MasterObj + "txtSave").val(xmlSave.xml != undefined ? xmlSave.xml : (new window.XMLSerializer()).serializeToString(xmlSave));
            SetColorFul(Row);
        }
        function SetColorFul(Row) {
            //-----------------------     
            if ($(Row).find("td:eq(0)").find("input").attr("checked")) {
                if ($(Row).find("td:eq(0)").find("input").hasClass("CssUnSelect"))
                    $(Row).find("td:eq(0)").find("input").removeClass("CssUnSelect");
            }
            else if (!$(Row).find("td:eq(0)").find("input").attr("checked")) {
                $(Row).find("td:eq(0)").find("input").addClass("CssUnSelect");
            }
            if (CorrectDate(Row.cells(3).firstChild.value.trim()) != CorrectDate(Row.cells(3).firstChild.getAttribute("RealVal").trim())) {
                $(Row).find("td:eq(3)").find("input").addClass("CssGreen");
            }

            if (CorrectDate(Row.cells(4).firstChild.value.trim()) != CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal").trim())) {
                $(Row).find("td:eq(4)").find("input").addClass("CssGreen");
            }
            if (!(CorrectDate(Row.cells(3).firstChild.value.trim()) != CorrectDate(Row.cells(3).firstChild.getAttribute("RealVal").trim()))
            && !(CorrectDate(Row.cells(4).firstChild.value.trim()) != CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal").trim()))) {
                $(Row.cells(3).firstChild).removeClass("CssGreen");
                $(Row.cells(4).firstChild).removeClass("CssGreen");
            }

        }
        //----------------------------------
        function ReverseDate(Date) {
            if (Date == "") return "";
            return Date.split("/")[2] + "/" + Date.split("/")[1] + "/" + Date.split("/")[0];
        }
        function CorrectDate(Date) {
            if (Date.split("/")[0].length == 4)
                return Date;
            else return ReverseDate(Date);
        }
        //------------------------------------
        function OnClickHeaderChk(header) {
            $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").find("td:eq(0)").find("span").find("input").each(function () {
                if (!$(this.parentElement.parentElement).hasClass("header")) {
                    $(this).attr("checked", $(header).attr("checked"));
                    onchangeCheck(this);
                }
            });
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                $("#" + MasterObj + "txtPersonCode").val("");
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===================================================حذف سطری از گرید اعضای جدید که تیک آن برداشته می شود ============================================
        function onchangeCheckDelete(SelectedCheckBox) {
            if (!$(SelectedCheckBox).attr("checked"))
                $(SelectedCheckBox.parentElement.parentElement).remove();
        }
        //======================================متابعت چکباکس ها از چکباکس هدر=========
        function onclickChkHeaderNewMembers(HeaderChk) {
            $("#TblGroupMember").find("tr").find("td:eq(0)").find("input").each(function () {
                if (!$(this.parentElement.parentElement).hasClass("header")) {
                    $(this).attr("checked", $(HeaderChk).attr("checked"));
                    onchangeCheckDelete(this);
                }
            });
        }
        //----------------------------------اعمال تغییرات در زمان Paging------
        function SetChange() {
            var xml;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML($("#" + MasterObj + "txtSave").val());
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString($("#" + MasterObj + "txtSave").val(), 'text/xml');
            }
            var GMID, XmlChanges;
            $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").each(function () {
                GMID = $(this).attr("GMID");
                XmlChanges = $(xml).find("Root").find("Tb").find("RowNumber").filter(function () { return $(this).text() == GMID });
                if (XmlChanges.length > 0) {
                    $(this).find("td:eq(0)").find("Span").find("Input").attr("checked", $(XmlChanges).siblings("Selected").text() == "1" ? true : false);
                    $(this).find("td:eq(3)").find("Input").val(ReverseDate($(XmlChanges).siblings("StartDate").text()));
                    $(this).find("td:eq(4)").find("Input").val(ReverseDate($(XmlChanges).siblings("EndDate").text()));
                    SetColorFul(this);
                }
            });
        }
        //------------------
        function onclickImgShowNewMember() {
            $("#DivNewMember").toggle("slow");

        }
        //------------------
        function onclickBtnCancel() {
            $("#DivDialogConflict").hide("slow");
        }
        //---------------
        function onclickBtnOK() {
            DateManage = 1;
            $("#DivDialogConflict").hide("slow");
            OnClickBtnSave();
        }
        //---------------
        function CheckValidDate(TextDate) {
            var Row = TextDate.parentElement.parentElement;
            var SDate = CorrectDate($(Row).find("td:eq(3)").find("input:eq(0)").val());
            var EDate = CorrectDate($(Row).find("td:eq(4)").find("input:eq(0)").val());
            if (ReplaceAll(SDate, "/", "") > ReplaceAll(EDate, "/", "")) {
                alert("تاریخ شروع از خاتمه بزرگتر است ");
                $(TextDate).val($(TextDate).attr("RealVal"));
                TextDate.focus();
                TextDate.select()
            }
            else {
                onchangeCheck(TextDate);
            }
        }
        //------------------------
        function CheckValidDateNewMember(TextDate) {
            var Row = TextDate.parentElement.parentElement;
            var SDate = CorrectDate($(Row).find("td:eq(3)").find("input:eq(0)").val());
            var EDate = CorrectDate($(Row).find("td:eq(4)").find("input:eq(0)").val());
            var TextForFocus = TextDate.previousSibling;
            if (ReplaceAll(SDate, "/", "") > ReplaceAll(EDate, "/", "")) {
                alert("تاریخ شروع از خاتمه بزرگتر است ");
                $(TextDate).val($(TextDate).attr("RealVal"));
                TextDate.focus();
                TextDate.select()
            }
        }
        //-------------
        function OnChangeCmbMember() {
            $("#" + MasterObj + "txtMemberCode").val("");
        } 

    </script>
</asp:Content>
