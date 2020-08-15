<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TraceWpr.aspx.cs" Inherits="TAPresentation.App_Pages.Trace.TraceWpr" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                شماره پرسنلی
            </td>
            <td>
         <uc2:ComboBox ID="cmbPerson" runat="server" />
            </td>
            <td>
                دوره
            </td>
            <td>
                <asp:DropDownList ID="cmbPeriod" runat="server" Height="16px" Width="150px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
         <td>
                کد اول
            </td>
            <td>
                <asp:DropDownList ID="cmbCodFirst" runat="server" Height="16px" Width="150px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td>
                کد دوم
            </td>
            <td>
                <asp:DropDownList ID="cmbCodeSecond" runat="server" Height="16px" Width="150px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td>
                کد سوم
            </td>
            <td>
                <asp:DropDownList ID="cmbCodeTree" runat="server" Height="16px" Width="150px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table>
        <!--toolbar-->
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 600px" align="right">
                            <cc2:KasraGrid ID="GrdTraceWpr" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtCode" name="txtCode" runat="server" />
        <input type="text" id="txtPersonId" name="txtPersonId" runat="server" />
        <input type="text" id="txtPeriod" name="txtPeriod" runat="server" />
        <input type="text" id="txtCodefirst" name="txtCodefirst" runat="server" />
        <input type="text" id="txtCodeSecond" name="txtCodeSecond" runat="server" />
        <input type="text" id="txtCodeTree" name="txtCodeTree" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var rval = 0;
     
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
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
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //==================================================فیلتر=============================================
        function OnClickBtnFilter() {
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();

        }
        //=====================================================محاسبه==========================================
        function OnClickBtnTrace() {
            if ($get(MasterObj + "cmbPerson_txtCode").value == "")
                alert(".لطفا شماره پرسنلی را انتخاب کنید")
            else {
                $get(MasterObj + "txtSubmit").value = "Calc";
                $get(MasterObj + "BtnSubmit").click();
            }

        }
        //============================================نمایش همه ===================================================
      
        function OnClickBtnShowAll() {
            OnClickBtnClearAll();
            OnClickBtnFilter();
        }
        //=================================================  خالی کردن آبجکت ها==============================================
        function OnClickBtnClearAll() {
            $get(MasterObj + "cmbPerson_txtCode").value = ""
            $get(MasterObj + "cmbPerson_txtName").value = ""
            $get(MasterObj + "cmbPeriod").value = "0"
            $get(MasterObj + "cmbCodFirst").value = "0"
            $get(MasterObj + "cmbCodeSecond").value = "0"
            $get(MasterObj + "cmbCodeTree").value = "0"
          
        }
    </script>
</asp:Content>
