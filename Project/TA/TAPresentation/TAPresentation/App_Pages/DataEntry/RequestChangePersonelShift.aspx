<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RequestChangePersonelShift.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RequestChangePersonelShift" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="600px" style="border: medium groove #C0C0C0; background-color: #C5D5E9;">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr align="center" valign="middle" style="width: 100%; background-color: #B5C0D7;">
            <td style="width: 100%; text-align: center" colspan="4" align="center">
                <table style="text-align: center; border-bottom-style: groove; border-bottom-width: 2px; border-bottom-color: #000000;">
                    <tr>
                        <td>
                            <input id="RadChange" type="radio" name="Type" checked="checked" />جابجايي
                        </td>
                        <td>
                            <input id="RadReplace" type="radio" name="Type" />جايگزيني
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:2px">              
            </td>
        </tr>
        <tr>
            <td>
                پرسنل متقاضي
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode1" runat="server" />
            </td>
            <td>
                پرسنل جانشين
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                از تاريخ
            </td>
            <td>
                <uc3:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td>
                تا تاريخ
            </td>
            <td>
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                شرح
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                    Height="50px" Width="91%"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <!---------------------------------------------------------------->
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtFPerson" name="txtFPerson" runat="server" />
        <input type="text" id="txtSPerson" name="txtSPerson" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtAllPersView" name="txtAllPersView" runat="server" />
       
    </div>
    <script src="../../App_Utility/Scripts/DataEntry/RequestChangePersonelShift.js" type="text/javascript"></script>
</asp:Content>
