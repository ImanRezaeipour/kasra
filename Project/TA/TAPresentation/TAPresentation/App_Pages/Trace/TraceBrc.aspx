<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="TraceBrc.aspx.cs" Inherits="TAPresentation.App_Pages.Trace.TraceBrc" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width : 800px">
        <tr>
            <td style="width : 100px">
                شماره پرسنلی
            </td>
            <td style="width:100px">
         <uc2:ComboBox ID="cmbPerson" runat="server" />
            </td>
            <td style="width : 50px" >
               تاريخ
            </td>
            <td  style="width:200px">
                  <uc3:KCalendar ID="CalDate" runat="server" />
            </td>
        </tr>
        <tr>
         <td style="width:50px">
                کد اول
            </td>
            <td style="width:100px">
                <asp:DropDownList ID="cmbCodFirst" runat="server" Height="16px" Width="200px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td style="width:50px">
                کد دوم
            </td>
            <td style="width:100px">
                <asp:DropDownList ID="cmbCodeSecond" runat="server" Height="16px" Width="200px" value="0"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td style="width:50px">
                کد سوم
            </td>
            <td style="width:100px">
                <asp:DropDownList ID="cmbCodeTree" runat="server" Height="16px" Width="200px" value="0"
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
                            <cc2:KasraGrid ID="GrdTraceBrc" runat="server" OnRowDataBound="Grid_RowDataBound">
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
        <input type="text" id="txtCodefirst" name="txtCodefirst" runat="server" />
        <input type="text" id="txtCodeSecond" name="txtCodeSecond" runat="server" />
        <input type="text" id="txtCodeTree" name="txtCodeTree" runat="server" />
         <input type="text" id="txtDate" name="txtDate" runat="server" />
          <input type="text" id="txtperson" name="txtperson" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var rval = 0;
        
        var Date = $get(MasterObj + "txtDate").value
        
        if (Date != "" ) {
            $get(MasterObj + "CalDate_txtYear").value = '13'+Date.substr(6, 2);
            $get(MasterObj + "CalDate_txtMonth").value = Date.substr(3, 2);
            $get(MasterObj + "CalDate_txtDay").value = Date.substr(0, 2);
          

            $get(MasterObj + "CalDate_txtCalendar").value = $get(MasterObj + "CalDate_txtDay").value + "/" + $get(MasterObj + "CalDate_txtMonth").value + "/" + $get(MasterObj + "CalDate_txtYear").value;
            $get(MasterObj + "CalDate_txtCalendar").value = $get(MasterObj + "CalDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "CalDate_txtDay").value + "/" + $get(MasterObj + "CalDate_txtMonth").value + "/" + $get(MasterObj + "CalDate_txtYear").value)

        }
       document.dir="rtl"
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
            var Date = $get(MasterObj + "CalDate_txtYear").value + "/" + $get(MasterObj + "CalDate_txtMonth").value + "/" + $get(MasterObj + "CalDate_txtDay").value;

            $get(MasterObj + "txtDate").value = Date;
            if ($get(MasterObj + "txtDate").value == "//")
                $get(MasterObj + "txtDate").value = ""
            if ($get(MasterObj + "cmbPerson_txtCode").value == "" && $get(MasterObj + "txtDate").value == "")
                alert(".لطفا شماره پرسنلی یا تاريخ را انتخاب کنید")
            else {
                $get(MasterObj + "txtSubmit").value = "Filter"
                $get(MasterObj + "BtnSubmit").click();

            }

        }
        
        //=====================================================محاسبه==========================================
        function OnClickBtnTrace() {
            var Date = $get(MasterObj + "CalDate_txtYear").value + "/" + $get(MasterObj + "CalDate_txtMonth").value + "/" + $get(MasterObj + "CalDate_txtDay").value;
            $get(MasterObj + "txtDate").value = Date
            $get(MasterObj + "txtperson").value = $get(MasterObj + "cmbPerson_txtCode").value
            if ($get(MasterObj + "cmbPerson_txtCode").value == "")
                alert(".لطفا شماره پرسنلی را انتخاب کنید")
            if ($get(MasterObj + "txtDate").value == "//")
                alert(".لطفا تاریخ ورود را وارد کنید");
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

            $get(MasterObj + "cmbCodFirst").value = "0"
            $get(MasterObj + "cmbCodeSecond").value = "0"
            $get(MasterObj + "cmbCodeTree").value = "0"

        }
        
    </script>
</asp:Content>
