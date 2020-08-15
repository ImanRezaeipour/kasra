<%@ Page Title="--------------------------نمايش نتايج محاسبه----------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DutyResult.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DutyResult" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="100%"  >
        <tr>
            <td >
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtMessage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewContainer" style="height:320px"  class="DivStyle" >
                            <cc2:KasraGrid ID="GrdDutyResult" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <cc1:mysecurity id="OnLineUser" runat="server">
                    </cc1:mysecurity>
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" runat="server" id="txtPersonCode" />
                    <input type="text" runat="server" id="txtCode" />
                    <input type="text" runat="server" id="txtCreditID" />
                    <input type="text" runat="server" id="txtStatusID" />
                 
                </div>
            </td>
        </tr>
    </table>
     <script>
         //*************************************Declaration*************************************
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         document.getElementsByTagName("body")[0].scroll = "no";
         //**************************************EndDeclaration*****************************************       
         Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

         function BeginRequestHandler(sender, args) {
         }
         //====================================================================================
         function EndRequestHandler(sender, args) {
             if ($get(MasterObj + "txtMessage").value != "") {
                 if ($get(MasterObj + "txtValidate").value == "1")
                     SetMsg($get(MasterObj + "txtMessage").value)
                 else
                     alert($get(MasterObj + "txtMessage").value);
             }
             $get(MasterObj + "txtSubmit").value = "";
             LastSelectedRow = null;
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
         //==========================================================
         function OnClickGrd(SelectedRow) {
             if (LastSelectedRow != null)
                 LastSelectedRow.className = LastSelectedRowClass
             LastSelectedRowClass = SelectedRow.className
             LastSelectedRow = SelectedRow
             SelectedRow.className = "CssSelectedItemStyle"
         }
         //========================================================
         function OnClickBtnCalc() {
             if ($get(MasterObj + "txtStatusID").value != "203")
                 alert("امکان محاسبه برای ماموريت تاييد نشده وجود ندارد");
             else {
                 document.getElementById(MasterObj + "txtSubmit").value = "Calculate"
                 document.getElementById(MasterObj + "BtnSubmit").click()
             }
         }
         //========================================================
   </script>
</asp:Content>

