<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TraceDr.aspx.cs" Inherits="TAPresentation.App_Pages.Trace.TraceDr" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 900px">
        <%--Filter--%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            شماره پرسنلی :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbPerson" runat="server" />
                        </td>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="CalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="CalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            کد اول :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbFirstCode" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            کد دوم :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbSecCode" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            کد سوم :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbTrdCode" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Toolbar--%>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="TraceDr.aspx" />
            </td>
        </tr>
        <%--KasraGrid--%>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 400px" align="right">
                            <cc2:KasraGrid ID="GrdTraceDr" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
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
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtWPID" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.dir = "rtl"
        var SDate = $get(MasterObj + "txtSDate").value
        var EDate = $get(MasterObj + "txtEDate").value
//        alert(SDate)
//        alert(EDate)
        if (SDate != "" && EDate != "") {
            $get(MasterObj + "CalSDate_txtYear").value = SDate.substr(6, 4);
            $get(MasterObj + "CalSDate_txtMonth").value = SDate.substr(3, 2);
            $get(MasterObj + "CalSDate_txtDay").value = SDate.substr(0, 2);
//            alert(SDate.substr(6, 4))
//            alert(SDate.substr(3, 2))
//            alert(SDate.substr(0, 2))
            $get(MasterObj + "CalEDate_txtYear").value = EDate.substr(6, 4);
            $get(MasterObj + "CalEDate_txtMonth").value = EDate.substr(3, 2);
            $get(MasterObj + "CalEDate_txtDay").value = EDate.substr(0, 2);

            $get(MasterObj + "CalSDate_txtCalendar").value = $get(MasterObj + "CalSDate_txtDay").value + "/" + $get(MasterObj + "CalSDate_txtMonth").value + "/" + $get(MasterObj + "CalSDate_txtYear").value;
            $get(MasterObj + "CalSDate_txtCalendar").value = $get(MasterObj + "CalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "CalSDate_txtDay").value + "/" + $get(MasterObj + "CalSDate_txtMonth").value + "/" + $get(MasterObj + "CalSDate_txtYear").value)

            $get(MasterObj + "CalEDate_txtCalendar").value = $get(MasterObj + "CalEDate_txtDay").value + "/" + $get(MasterObj + "CalEDate_txtMonth").value + "/" + $get(MasterObj + "CalEDate_txtYear").value
            $get(MasterObj + "CalEDate_txtCalendar").value = $get(MasterObj + "CalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "CalEDate_txtDay").value + "/" + $get(MasterObj + "CalEDate_txtMonth").value + "/" + $get(MasterObj + "CalEDate_txtYear").value)
        }

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                    SetMsg($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtAlert").value = ""
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //====================================================================================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //====================================================================================================
        function OnClickBtnFilter() {
            LoadInfoFilter();
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //------------------------------------------------------
        function LoadInfoFilter() {
            var SDate = $get(MasterObj + "CalSDate_txtYear").value + "/" + $get(MasterObj + "CalSDate_txtMonth").value + "/" + $get(MasterObj + "CalSDate_txtDay").value
            var EDate = $get(MasterObj + "CalEDate_txtYear").value + "/" + $get(MasterObj + "CalEDate_txtMonth").value + "/" + $get(MasterObj + "CalEDate_txtDay").value

            $get(MasterObj + "txtSDate").value = SDate
            $get(MasterObj + "txtEDate").value = EDate
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""
            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""
        }
        //-------------------------------------------------------------------------------------------------------
        function OnClickBtnCal() {
            var SDate = $get(MasterObj + "CalSDate_txtYear").value + "/" + $get(MasterObj + "CalSDate_txtMonth").value + "/" + $get(MasterObj + "CalSDate_txtDay").value
            var EDate = $get(MasterObj + "CalEDate_txtYear").value + "/" + $get(MasterObj + "CalEDate_txtMonth").value + "/" + $get(MasterObj + "CalEDate_txtDay").value
            $get(MasterObj + "txtSDate").value = SDate
            $get(MasterObj + "txtEDate").value = EDate
            if ($get(MasterObj + "cmbPerson_txtCode").value == "")
                alert(".لطفا شماره پرسنلی را انتخاب کنید")
            if ($get(MasterObj + "txtSDate").value == "//") 
                alert(".لطفا تاریخ ورود را وارد کنید");
            if ($get(MasterObj + "txtEDate").value == "//")
                alert(".لطفا تاریخ پایان را وارد کنید");
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "CalCulate"
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //-------------------------------------------------------------------------------------------------------
        function OnClickBtnShowAll() {
            OnClickBtnClearAll();
            OnClickBtnFilter();
        }
        //-------------------------------------------------------------------------------------------------------
        function OnClickBtnClearAll() {
            $get(MasterObj + "cmbPerson_txtCode").value = ""
            $get(MasterObj + "cmbPerson_txtName").value = ""
            $get(MasterObj + "CalSDate_txtCalendar").value = ""
            $get(MasterObj + "CalSDate_txtYear").value = ""
            $get(MasterObj + "CalSDate_txtMonth").value = ""
            $get(MasterObj + "CalSDate_txtDay").value = ""
            $get(MasterObj + "CalEDate_txtCalendar").value = ""
            $get(MasterObj + "CalEDate_txtYear").value = ""
            $get(MasterObj + "CalEDate_txtMonth").value = ""
            $get(MasterObj + "CalEDate_txtDay").value = ""
            $get(MasterObj + "cmbFirstCode").value = "0"
            $get(MasterObj + "cmbSecCode").value = "0"
            $get(MasterObj + "cmbTrdCode").value = "0"
        }
        //====================================================================================================
    </script>
</asp:Content>
