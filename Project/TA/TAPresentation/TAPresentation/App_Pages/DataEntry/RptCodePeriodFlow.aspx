<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RptCodePeriodFlow.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RptCodePeriodFlow" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/CodeCondition/CodeCondition.ascx" tagname="CodeCondition" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            از دوره
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            تا دوره
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            پرسنلي
                        </td>
                        <td>

                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        گروه :
                                    </td>
                                    <td>
                                       
                                        <uc4:CodeCondition ID="cmbGroup" runat="server" />
                                       
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
                        <asp:GridView ID="GrdWorkPeriod" runat="server"  AllowPaging="True" OnPageIndexChanging="Grid_ChangePage" AutoGenerateColumns="true"
                            HeaderStyle-CssClass="CssHeaderStyle"  RowStyle-CssClass="CssItemStyle"
                            AlternatingRowStyle-CssClass="CssAlternatingItemStyle" FooterStyle-CssClass="CssFooterStyle" >
                            <AlternatingRowStyle CssClass="CssAlternatingItemStyle" />
                            <FooterStyle CssClass="CssFooterStyle" />
                            <HeaderStyle CssClass="CssHeaderStyle" />
                           
                            <PagerStyle BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                ForeColor="Black" />
                            <RowStyle CssClass="CssItemStyle" />
                        </asp:GridView>                       
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                       <asp:AsyncPostBackTrigger ControlID="GrdWorkPeriod" EventName="PageIndexChanging" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display:none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGroupCode" runat="server" />
         <input type="text" id="txtPersonName" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtRowPersonID" runat="server" />
        <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCmbPerson" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCmbCode" runat="server"></asp:TextBox>
    </div>
    <script language="javascript" type="text/javascript">

        document.body.scroll = "no"
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        function OnClickBtnFilter() {
            $get(MasterObj + "txtSubmit").value = "Filter"
            $get(MasterObj + "txtGroupCode").value = $get(MasterObj + "cmbGroup_lblCode").innerText
            document.getElementById(MasterObj + "BtnSubmit").click()
        }

        function OnClickBtnExcel() {
            $get(MasterObj + "txtSubmit").value = "Excel"
            $get(MasterObj + "txtGroupCode").value = $get(MasterObj + "cmbGroup_lblCode").innerText
            $get(MasterObj + "txtPersonName").value = $get(MasterObj + "CmbPerson_txtName").value
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function OnClickBtnPDF() {
            $get(MasterObj + "txtSubmit").value = "PDF"
            $get(MasterObj + "txtGroupCode").value = $get(MasterObj + "cmbGroup_lblCode").innerText
            $get(MasterObj + "txtPersonName").value = $get(MasterObj + "CmbPerson_txtName").value
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        function clearAll() {
            $get(MasterObj + "cmbGroup_lblCode").innerText=""
            $get(MasterObj + "CmbPerson_txtPCode").value = "";
            $get(MasterObj + "CmbPerson_txtName").value = "";
            $get(MasterObj + "CmbPeriod").value = "0";
            $get(MasterObj + "CmbToPeriod").value = "0";
            $get(MasterObj + "txtGroupCode").value = "";
            $get(MasterObj + "txtPersonName").value = "";
        }

        function OnClickBtnShowAll() {
            clearAll()
            $get(MasterObj + "txtSubmit").value = "ShowAll"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }   
    </script>
</asp:Content>
