<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DynamicReportShow.aspx.cs" Inherits="FrmPresentation.App_Pages.DynamicReport.DynamicReportShow" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        AsyncPostBackTimeout="1800" ScriptMode="Release">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            از دوره :
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            تا دوره :
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            کد :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbCode" runat="server" />
                        </td>
                        <td>
                            نوع نمايش :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbShowType" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td id="tdGroup" runat="server">
                            گروه :
                        </td>
                        <td id="tdcmbGroup" runat="server">
                            <asp:DropDownList class="TxtControls" ID="cmbGroup" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td >
                            واحد سازماني :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="cmbDepartment" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td id="tdPerson" runat="server">
                               پرسنلي :
                        </td>
                        <td id="tdCmbPerson" runat="server">
                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <input type="checkbox" id="chkPersChildren" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="LblPersChildren" Text="پرسنل زير مجموعه">
                                        </asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource2"
                            HeaderStyle-CssClass="CssHeaderStyle" OnPageIndexChanging="Grid_ChangePage" RowStyle-CssClass="CssItemStyle"
                            AlternatingRowStyle-CssClass="CssAlternatingItemStyle" FooterStyle-CssClass="CssFooterStyle">
                            <AlternatingRowStyle CssClass="CssAlternatingItemStyle" />
                            <FooterStyle CssClass="CssFooterStyle" />
                            <HeaderStyle CssClass="CssHeaderStyle" />
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="اولين" PreviousPageText="قبلی"
                                NextPageText="بعدی" LastPageText="آخرين" PageButtonCount="15" />
                            <PagerStyle BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                ForeColor="Black" />
                            <RowStyle CssClass="CssItemStyle" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <%-- <asp:Parameter DefaultValue="0" Name="Code" Type="String" />--%>
                                <asp:ControlParameter ControlID="txtCmbCode" DefaultValue="0" Name="Code" PropertyName="Text"
                                    Type="String" />
                                <asp:ControlParameter ControlID="CmbPeriod" DefaultValue="0" Name="SWPID" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="CmbToPeriod" DefaultValue="0" Name="EWPID" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="cmbGroup" DefaultValue="0" Name="GroupID" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="cmbDepartment" DefaultValue="0" Name="DeparmentID"
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtCmbPerson" DefaultValue="0" Name="personCode"
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CmbShowType" DefaultValue="0" Name="ShowType" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="txtPersChildren" DefaultValue="0" Name="chkChildren"
                                    PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txtGetCompanyFinatialPeriodID" Name="CompanyFinatialPeriodID"
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtSessionID" Name="SessionID" PropertyName="Text"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <%-- <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <%-- <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />--%>
        <%--<input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />--%>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSPName" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtRowPersonID" runat="server" />
        <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCmbPerson" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCmbCode" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPersChildren" runat="server"></asp:TextBox>
    </div>
    <script type="text/javascript" language="javascript">
        document.body.scroll = "no"
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //-----------------------------------------------------------------------------------قسمت مربوط به فیلتر شدن با کلیک اینتر----

        //-----------------------------------------------------------------
        function BeginRequestHandler(sender, args) {

        }
        function EndRequestHandler(sender, args) {

            document.dir = "RTL"

            //            if (LastSelectedRow != null)
            //                LastSelectedRow.className = LastSelectedRowClass
        }

        function OnClickBtnCalc() {
            if (LastSelectedRow != null)
                document.getElementById(MasterObj + "txtRowPersonID").value = LastSelectedRow.cells(1).innerText
            if (keyCode == 16) // =>  را گرفته براي همه محاسبه کن shift اگر کليد
                document.getElementById(MasterObj + "txtRowPersonID").value = "0"
            //در صورتی که قبلا پرسنلی را جستجو نموده محاسبه را روی همان نفر انجام دهد
            if (document.getElementById(MasterObj + "CmbPerson_txtCode").value != "")
                document.getElementById(MasterObj + "txtRowPersonID").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value
            if (document.getElementById(MasterObj + "txtRowPersonID").value != "") {
                document.getElementById(MasterObj + "txtSubmit").value = "Calc"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
            else {
                alert('لطفاً يک سطر از گريد را انتخاب کنيد')
                return
            }
        }
        function OnClickBtnFilter() {
            $get(MasterObj + "txtCmbCode").value = $get(MasterObj + "CmbCode_txtCode").value;
            $get(MasterObj + "txtCmbPerson").value = $get(MasterObj + "CmbPerson_txtCode").value;


            $get(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }

        function OnClickBtnExcel() {
            $get(MasterObj + "txtSubmit").value = "Excel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function OnClickBtnPDF() {
            $get(MasterObj + "txtSubmit").value = "PDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //    function OnClickBtnPreview() {
        //        $get(MasterObj + "txtSubmit").value = "Preview"
        //        document.getElementById(MasterObj + "BtnSubmit").click()
        //    }
        function clearAll() {
            $get(MasterObj + "cmbGroup").value = 0
            $get(MasterObj + "cmbDepartment").value = 0
            $get(MasterObj + "CmbCode_txtPCode").value = "";
            $get(MasterObj + "CmbCode_txtName").value = "";
            $get(MasterObj + "CmbPerson_txtPCode").value = "";
            $get(MasterObj + "CmbPerson_txtName").value = "";
            $get(MasterObj + "txtCmbCode").value = "";
            $get(MasterObj + "txtCmbPerson").value = "";
        }

        function OnClickBtnShowAll() {
            clearAll()

            // $get(MasterObj + "txtCmbPerson").value = ""; 
            $get(MasterObj + "txtSubmit").value = "ShowAll"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
       
    </script>
</asp:Content>
