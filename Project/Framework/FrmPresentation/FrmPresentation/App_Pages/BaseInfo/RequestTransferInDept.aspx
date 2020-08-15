<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RequestTransferInDept.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.RequestTransferInDept"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            کد پرسنلي:
                        </td>
                        <td>
                            <uc1:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ:
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc3:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdTransferDept" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdTransferDept_Sorting">
                            </cc2:KasraGrid>
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTransferDeptID" name="txtTransferDeptID" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtMaxNumber" name="txtMaxNumber" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

        function EndRequestHandler(sender, args) {           
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1")
                    SetMsg($get(MasterObj + "txtAlert").value);
                else
                    alert($get(MasterObj + "txtAlert").value);
            }

           $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtValidate").value = "";            
        }

      
        function OnClickBtnNew() {
            url = "RequestTransferInDept_New.aspx?ID=0&SessionID=" + $("#" + MasterObj + "txtSessionID").val();
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:500px;dialogWidth: 750px;center: Yes;help: no;status: no")
            if (returnValue == 1) {
                OnClickBtnFilter();
            }
        }
        function OnClickBtnFilter() {
            $("#" + MasterObj + "txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
            $("#" + MasterObj + "txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnDelete() {
            if (LastSelectedRow != null) {
                if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                    $get(MasterObj + "txtTransferDeptID").value = LastSelectedRow.getAttribute("ID");
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("به منظور حذف يک سطر را انتخاب کنيد")
        }
        function OnClickBtnEdit() {
            if (LastSelectedRow != null)
                OndbClickGrd();
            else
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
        }
        function OnClickGrd() {

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            url = "RequestTransferInDept_New.aspx?ID=" + LastSelectedRow.getAttribute("ID")
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value;
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 500px;dialogWidth: 750px;center: Yes;help: no;status: no")
            if (returnValue == 1) {
                $get(MasterObj + "txtSubmit").value = "Const";
                $get(MasterObj + "BtnSubmit").click();
            }
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
        //===============================================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null)
                $(LastSelectedRow).removeClass("CssSelectedItemStyle");
            LastSelectedRow = SelectedRow
            $(SelectedRow).addClass("CssSelectedItemStyle");
        }
        //-------------------------
        function OnClickBtnShowAll() {
            Clear();
            OnClickBtnFilter();
        }
        //----------------------
        function Clear() {
            $("#" + MasterObj + "txtSDate").val("");
            $("#" + MasterObj + "KCalSDate_txtYear").val("");
            $("#" + MasterObj + "KCalSDate_txtMonth").val("");
            $("#" + MasterObj + "KCalSDate_txtDay").val("");
            $("#" + MasterObj + "KCalSDate_txtCalendar").val("");
            $("#" + MasterObj + "txtEDate").val("");
            $("#" + MasterObj + "KCalEDate_txtYear").val("");
            $("#" + MasterObj + "KCalEDate_txtMonth").val("");
            $("#" + MasterObj + "KCalEDate_txtDay").val("");
            $("#" + MasterObj + "KCalEDate_txtCalendar").val("");
            $("#" + MasterObj + "CmbPerson_txtCode").val("");
            $("#" + MasterObj + "CmbPerson_txtPCode").val("");
            $("#" + MasterObj + "CmbPerson_txtName").val("");
        }
        //--------------------------
        function onclickGardesh(obj) {
            var DocID = obj.parentElement.getAttribute("ID");
            var DocTypeID = obj.parentElement.getAttribute("DocTypeID");           
            window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
        }
        //----------------------------
        function onclickHistory(obj) {      
            window.showModalDialog("ShowPositionHistory.aspx?PCode="+obj.parentElement.cells(4).innerText , "", "dialogHeight: 450px;dialogWidth: 600px;center: Yes;help: no;status: no")
        }
    </script>
</asp:Content>
