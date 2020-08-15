<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" 
CodeBehind="Group.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.Group"  ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .TblFilter
        {
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <table width="850px;" cellpadding="0" cellspacing="0">
        <!------------------------------آیتم های جستجو---------------------------->
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table class="TblFilter">
                        <tr>
                            <td>
                                نام گروه :
                            </td>
                            <td>
                                <input type="text" id="txtGroupName" style="width: 100px" class="TxtControls" />
                            </td>
                            <td>
                                 نام مخفف :
                            </td>
                            <td>                               
                                <input type="text" id="txtAcronymName" style="width: 100px" class="TxtControls" />
                            </td>
                            <td>
                                شهر :
                            </td>
                            <td>
                                <uc1:ComboBox ID="CmbMember" runat="server" />                               
                            </td>
                            <td>
                                 دسته بندي :
                            </td>
                            <td>
                                <select id="CmbCategory" runat="server" style="width: 150px" class="TxtControls">
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <!-----------------------ToolBar------------------------------>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <!----------------------------------گرید------------------------->
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdGroup" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="GrdGroup_Sorting">
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
    <!------------------------------------------------------------->
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtBtnNew" name="txtBtnNew" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <!---------------Temp------------------------>
         <input type="text" id="txtTmpMemberCode" name="txtTmpMemberCode" runat="server" />
         <input type="text" id="txtTmpName" name="txtTmpName" runat="server" />
         <input type="text" id="txtTmpAcronym" name="txtTmpAcronym" runat="server" />
         <input type="text" id="txtTmpCategory" name="txtTmpCategory" runat="server" />
          <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
    </div>
      <script src="../../../App_Utility/Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script>
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        $("#OToolBar_TDTopToolBar").css("display", "none");
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            LastSelectedRow = null;
            if ($get(MasterObj + "txtSubmit").value == "Delete") {
                if ($get(MasterObj + "txtValidate").value == "0")
                    alert($get(MasterObj + "txtAlert").value);
                else
                    SetMsg($get(MasterObj + "txtAlert").value);

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                $get(MasterObj + "txtValidate").value = "";
            }
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                $("#" + MasterObj + "txtCurPage").val(obj.value)
                $("#" + MasterObj + "txtSubmit").val("Const")
                $("#" + MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            $("#" + MasterObj + "txtSubmit").val("BtnNext")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            $("#" + MasterObj + "txtSubmit").val("BtnLast")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            $("#" + MasterObj + "txtSubmit").val("BtnPrev")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            $("#" + MasterObj + "txtSubmit").val("BtnFirst")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //------------------------------------------------------------------------------------------
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function OndbClickGrd() {
            var strUrl = "GroupNew.aspx?GroupID=" + $(LastSelectedRow).attr("ID") + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            strUrl = encodeURI(strUrl)
            returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 700px;dialogWidth:1050px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            if (returnValue == 1) {
                $("#" + MasterObj + "txtSubmit").val("Const");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                if (confirm("آیا برای حذف مطمئن هستيد؟") == true) {
                    $("#" + MasterObj + "txtGroupID").val($(LastSelectedRow).attr("ID"))
                    $("#" + MasterObj + "txtSubmit").val("Delete");
                    $("#" + MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function OnClickBtnNew() {
            var strUrl = "GroupNew.aspx?GroupID=0" + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 700px;dialogWidth:1050px;center: Yes;help: no;status: no')
            if (returnValue == 1) {
                $("#" + MasterObj + "txtSubmit").val("Filter");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null)
                OndbClickGrd()
            else
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            $("#" + MasterObj + "txtTmpName").val($("#txtGroupName").val());
            $("#" + MasterObj + "txtTmpMemberCode").val($("#" + MasterObj + "CmbMember_txtCode").val());
            $("#" + MasterObj + "txtTmpAcronym").val($("#txtAcronymName").val());
            $("#" + MasterObj + "txtTmpCategory").val($("#" + MasterObj + "CmbCategory").val());
            $("#" + MasterObj + "txtSubmit").val("Filter")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            $("#" + MasterObj + "CmbMember_txtCode").val("");
            $("#" + MasterObj + "CmbMember_txtPCode").val("");
            $("#" + MasterObj + "CmbMember_txtName").val("");
            $("#" + MasterObj + "CmbCategory").val("0");
            $("#txtGroupName").val("");
            $("#txtAcronymName").val("");
            OnClickBtnFilter();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectPosition() {
            if (LastSelectedRow != null) {
                var strUrl = "SelectGroupPosition.aspx?GroupID=" + LastSelectedRow.getAttribute("ID")
                    + "&RoleID=" + LastSelectedRow.RoleID
                    + "&GroupName=" + LastSelectedRow.cells(0).innerText
                    + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                returnValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 700px;dialogWidth:1050px;center: Yes;help: no;status: no')
            } else {
                var strUrl = "SelectGroupPosition.aspx?GroupID=0&RoleID=0"
                    + "&GroupName="   
                    + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                returnValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 700px;dialogWidth:1050px;center: Yes;help: no;status: no')
            }
            if (returnValue == 1) {
                $("#" + MasterObj + "txtSubmit").val("Const");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>

