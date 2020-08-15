<%@ Page Title="-----------------------------------------------------------------------------------------------------------تفویض کارتابل------------------------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="DataAccessCardTable.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.DataAccessCardTable" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2"   ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
    <table>
        <%--Filter--%> 
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table style="width: 900px" align="right" >
                        <tr>
                            <td> 
                                از تاريخ :
                            </td>
                            <td>
                                <uc1:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc1:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td>
                                نوع سند :
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbTypeCardTable" runat="server" Width="150px" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تفويض از :
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbDelegateOf" runat="server" />
                            </td>
                            <td>
                                به :
                            </td>
                            <td colspan="3">
                                <uc2:ComboBox ID="CmbDelegateTo" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <%--Toolbar--%>
        <tr>
            <td>
                <uc3:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 900px; text-align:right" align="right">
                            <cc2:KasraGrid ID="GrdDataAccessCardTable" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtAllPersViewOption" name="txtAllPersViewOption" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.scroll="no"

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //==============================================================================
        var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
        var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

        $get(MasterObj + "txtKCalSDate").value = SDate
        $get(MasterObj + "txtKCalEDate").value = EDate

        if ($get(MasterObj + "txtKCalSDate").value = "//")
            $get(MasterObj + "txtKCalSDate").value = ""
        if ($get(MasterObj + "txtKCalEDate").value = "//")
            $get(MasterObj + "txtKCalEDate").value = "";
        //=============================================================================
        function BeginRequestHandler(sender, args) {
        }
        //-------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                SetMsg($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtAlert").value = ""
            $get(MasterObj + "txtSubmit").value = ""
            LastSelectedRow = null;
            LastSelectedRowClass = "";
        }
        //===============================================Paging======================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //-------------------------------------------------------------------------------------------
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
        function OnClickBtnNew() {
            var strUrl = 'DataAccessCardTableNew.aspx?ID=0'
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 605px;dialogWidth:650px;center: Yes;help: no;status: no;resizable:1");
            if (returnValue == "1")
                OnClickBtnFilter()
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnEdit() {
            if (LastSelectedRow == null)
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
            else {
                var strUrl = 'DataAccessCardTableNew.aspx?ID=' + LastSelectedRow.getAttribute("ID")
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value
                //-----------------------clear txtCalDeiver-----------------------------------------
                $get(MasterObj + "KCalSDate_txtCalendar").value = ""
                $get(MasterObj + "KCalSDate_txtYear").value = ""
                $get(MasterObj + "KCalSDate_txtMonth").value = ""
                $get(MasterObj + "KCalSDate_txtDay").value = ""
                //-----------------------clear txtCalBDate------------------------------------------
                $get(MasterObj + "KCalEDate_txtCalendar").value = ""
                $get(MasterObj + "KCalEDate_txtYear").value = ""
                $get(MasterObj + "KCalEDate_txtMonth").value = ""
                $get(MasterObj + "KCalEDate_txtDay").value = ""

                returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 605px;dialogWidth:650px;center: Yes;help: no;status: no;resizable:1")
                if (returnValue == "1")
                    OnClickBtnFilter()
            }
        }
        //----------------------------------------------------------------------------------------
        function OndbClickGrd() {
            OnClickBtnEdit()
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئن هستید ؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID")
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
        //----------------------------------------------------------------------------------------
        function LoadInformation() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

            $get(MasterObj + "txtKCalSDate").value = SDate
            $get(MasterObj + "txtKCalEDate").value = EDate
            if ($get(MasterObj + "txtKCalSDate").value == "//")
                $get(MasterObj + "txtKCalSDate").value = ""
            if ($get(MasterObj + "txtKCalEDate").value == "//")
                $get(MasterObj + "txtKCalEDate").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnFilter() {
            LoadInformation();
            document.getElementById(MasterObj + "BtnSubmit").click();
            document.dir = "rtl"
        }
        //-----------------------------------------------------------------------------------------
        function OnClickBtnShowAll() {
            OnClickBtnClear()
            OnClickBtnFilter()
        }
        //-----------------------------------------------------------------------------------------
        function OnClickBtnClear() {
            $get(MasterObj + "CmbDelegateOf_txtCode").value = ""
            $get(MasterObj + "CmbDelegateOf_txtPCode").value = ""
            $get(MasterObj + "CmbDelegateOf_txtName").value = ""
            $get(MasterObj + "CmbDelegateTo_txtCode").value = ""
            $get(MasterObj + "CmbDelegateTo_txtPCode").value = ""
            $get(MasterObj + "CmbDelegateTo_txtName").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "cmbTypeCardTable").value = 0
        }
        //--------------------------------------------------------------------------------------
    </script>
</asp:Content>
