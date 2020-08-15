    <%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="PresentAbsentReportWithoutCalc.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.PresentAbsentReportWithoutCalc" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .LblPerson
        {
            border: solid 1px #6699FF;
            width: 70px;
            color: Red;
            background-color: White;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" LoadScriptsBeforeUI="false" runat="server"
        AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <table style="width: 950px">
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td>
                            کل پرسنل :
                        </td>
                        <td align="center">
                            <asp:Label ID="lblAllPerson" runat="server" class="LblPerson"></asp:Label>
                        </td>
                        <td>
                            &nbsp&nbsp&nbsp
                        </td>
                        <td>
                            حاضرين :
                        </td>
                        <td align="center">
                            <asp:Label ID="lblPresent" runat="server" class="LblPerson"></asp:Label>
                        </td>
                        <td>
                            &nbsp&nbsp&nbsp
                        </td>
                        <td>
                            غايبين :
                        </td>
                        <td align="center">
                            <asp:Label ID="lblAbsent" runat="server" class="LblPerson"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                پرسنلی :
                            </td>
                            <td>
                                <uc1:ComboBox ID="cmbPerson" runat="server" />
                            </td>
                            <td>
                                 شيفت :
                            </td>
                            <td colspan="3">
                                <asp:DropDownList ID="cmbShift" runat="server" CssClass="TxtControls" Style="width: 220px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                وضعيت حضور :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbPresentType" runat="server" CssClass="TxtControls" Style="width: 140px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                واحد سازماني :
                            </td>
                            <td>
                                <uc4:MultiPerson ID="MultiDepartment" runat="server" />
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td colspan="3">
                                <uc4:MultiPerson ID="MultiGroup" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalDate" runat="server" />
                            </td>
                            <td>
                                از ساعت :
                            </td>
                            <td>
                                <input type="text" id="txtTime" onblur="Timechk(this)" class="TxtControls" style="width: 50px"
                                    runat="server" onfocus="onFocusTime(this)" />
                            </td>
                            <td>
                                 تا ساعت :
                            </td>
                            <td>
                                <input type="text" id="txtETime" onblur="Timechk(this)" class="TxtControls" style="width: 50px"
                                    runat="server" onfocus="onFocusTime(this)" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtAttendanceID" runat="server" />
                            <asp:HiddenField ID="txtAllPersonCnt" runat="server" />
                            <asp:HiddenField ID="txtPresentCnt" runat="server" />
                            <asp:HiddenField ID="txtAbsentCnt" runat="server" />
                            <asp:HiddenField ID="txtMaxNumber" runat="server" />
                            <asp:HiddenField ID="txtInOutTime" runat="server" />
                        </div>
                        <!------------------------------Grid--------------------------->
                        <div id="GridViewCountainer" align="center">
                            <cc3:KasraGrid ID="GrdPresentAbsent" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSendToExcel="true" AllowSendToPDF="true">
                            </cc3:KasraGrid>
                        </div>
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtCmbShift" name="txtCmbShift" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmitPaging" name="txtSubmitPaging" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtCurDate" name="txtCurDate" runat="server" />
        <input type="text" id="txtPresenttype" name="txtPresenttypes" runat="server" />
        <input type="text" id="txtMultiGroup" name="txtMultiGroup" runat="server" />
        <input type="text" id="txtMultiDepartment" name="txtMultiDepartment" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
    </div>
    <script type="text/javascript" language="javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no"
        var GrdPresent = $get(MasterObj+"GrdPresentAbsent")
        $get(MasterObj + "txtDate").value = $get(MasterObj + "KCalDate_txtYear").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtDay").value;
        //===============================================================
        $get(MasterObj + "lblAllPerson").innerText = $get(MasterObj + "txtAllPersonCnt").value
        $get(MasterObj + "lblPresent").innerText = $get(MasterObj + "txtPresentCnt").value
        $get(MasterObj + "lblAbsent").innerText = $get(MasterObj + "txtAbsentCnt").value
        //===================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //====================================================
        function BeginRequestHandler(sender, args) {
        }
        //======================================================
        function EndRequestHandler(sender, args) {
            var StrSubmit = $get(MasterObj + "txtSubmit").value
            if (StrSubmit == "Filter") {
                $get(MasterObj + "lblAllPerson").innerText = $get(MasterObj + "txtAllPersonCnt").value
                $get(MasterObj + "lblPresent").innerText = $get(MasterObj + "txtPresentCnt").value
                $get(MasterObj + "lblAbsent").innerText = $get(MasterObj + "txtAbsentCnt").value
            }
            LastSelectedRow = null;
            LastSelectedRowClass = "";
           // $get(MasterObj + "txtPresenttype").value = ""
            $get(MasterObj + "txtAllPersonCnt").value = ""
            $get(MasterObj + "txtPresentCnt").value = ""
            $get(MasterObj + "txtAbsentCnt").value=""
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "txtSubmitPaging").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "txtSubmitPaging").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "txtSubmitPaging").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "txtSubmitPaging").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "txtSubmitPaging").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //=================================SendPdfExcel===================================================
        function OnClickBtnAllPDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function OnClickBtnOnePDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function OnClickBtnAllExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function OnClickBtnOneExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //===================================Filter==============
        function OnClickBtnFilter() {
            $get(MasterObj + "txtDate").value = $get(MasterObj + "KCalDate_txtYear").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtDay").value;
            if ($get(MasterObj + "CmbPresentType").value == "27601") $get(MasterObj + "txtPresenttype").value = "1"
            if ($get(MasterObj + "CmbPresentType").value == "27602") $get(MasterObj + "txtPresenttype").value = "2"
            if ($get(MasterObj + "CmbPresentType").value == "0") $get(MasterObj + "txtPresenttype").value = "0"
            //---------------------------------------------------------------------------------------------
            if ($("#" + MasterObj + "MultiGroup_txtHidden").val() != "") {
                var Groups = $("#" + MasterObj + "MultiGroup_txtHidden").val(), xml, GroupString = '';
                if (window.ActiveXObject) {
                    xml = new ActiveXObject("Microsoft.XMLDOM");
                    xml.async = "false";
                    xml.loadXML(Groups)
                }
                else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString(Groups, 'text/xml');
                }
                $(xml)
        .find("Root").find("Tb").each(function () {
            GroupString = GroupString + "," + $(this).find('GroupId').text();
        });
                GroupString = GroupString.substring(1, GroupString.length)
                $("#" + MasterObj + "txtMultiGroup").val(GroupString);
            }
            else
                $("#" + MasterObj + "txtMultiGroup").val($("#" + MasterObj + "MultiGroup_cmbPerson_txtCode").val());
            //---------------------------------------------------------------------------------------------
            if ($("#" + MasterObj + "MultiDepartment_txtHidden").val() != "") {
                var Departments = "<Root>" + $("#" + MasterObj + "MultiDepartment_txtHidden").val() + "</Root>", xml, DeptString = '';
                if (window.ActiveXObject) {
                    xml = new ActiveXObject("Microsoft.XMLDOM");
                    xml.async = "false";
                    xml.loadXML(Departments)
                }
                else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString(Groups, 'text/xml');
                }
                $(xml)
        .find("Root").find("Tb").each(function () {
            DeptString = DeptString + "," + $(this).find('DepartmentID').text();
        });
                DeptString = DeptString.substring(1, DeptString.length)
                $("#" + MasterObj + "txtMultiDepartment").val(DeptString);
            }
            else
                $("#" + MasterObj + "txtMultiDepartment").val($("#" + MasterObj + "MultiDepartment_cmbPerson_txtCode").val());



            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click()
        }
        //==========================================رنگی شدن سطر گرید با کلیک کردن روی سطر===========================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //==================================فوکوس زمان=========================================
        function onFocusTime(obj) {
            obj.select();
        }
    </script>
</asp:Content>
