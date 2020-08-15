<%@ Page Title="-------------------------------------------------درخواست آيتم ماهانه----------------------------------------------------"
    Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RequestMonthlyItem.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RequestMonthlyItem"
    AsyncTimeout="1800" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="600px">
        <tr>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800"
                LoadScriptsBeforeUI="false">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td align="center">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="600px" style="border: medium groove #C0C0C0; background-color: #DBE3F0;">
        <tr>
            <td>
                نام پرسنلی :
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode" runat="server" />
            </td>
            <td>
                دوره :
            </td>
            <td>
                <select id="CmbPeriod" name="CmbPeriod" style="width: 120px" runat="server" onkeydown="onKeyDownEnter(this)"
                    class="TxtControls">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                مقدار :
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <select style="width: 105px" id="CmbValueType" onkeydown="onKeyDownEnter(this)" class="TxtControls"
                            runat="server">
                            <option></option>
                        </select>
                        <input type="text" id="txtValue" class="TxtControls" onblur="onblurtxtValue(this)"
                            onkeydown="onKeyDownEnter(this);OnKeyDownTimeNew(this);" style="width: 105px"
                            runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td align="right">
                مجوز :
            </td>
            <td>
                <select id="CmbMojavez" name="CmbMojavez" onkeydown="onKeyDownEnter(this)" style="width: 120px"
                    runat="server" class="TxtControls" onchange="Refresh()">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr id="TDDate" runat="server">
            <td>
                از تاريخ:
            </td>
            <td>
                <uc3:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td>
                تا تاريخ:
            </td>
            <td>
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" onkeydown="onKeyDownEnter(this)" TextMode="MultiLine"
                    class="TxtControls" Height="50px" Width="91%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCreditID" runat="server" />
                        <br />
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
        <input type="text" id="txtCode" name="txtCode" runat="server" />
        <input type="text" id="txtPeriod" name="txtPeriod" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtWPResultID" name="txtWPResultID" runat="server" />
        <input type="text" id="txtValueSave" name="txtValueSave" runat="server" />
        <input type="text" id="txtScriptGroupXML" name="txtScriptGroupXML" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtShowDate" name="txtShowDate" runat="server" />
        <input type="text" id="txtDayLength" name="txtDayLength" runat="server" />
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/DataEntry/RequestMonthlyItem.js?v=1"
        type="text/javascript"></script>
</asp:Content>
