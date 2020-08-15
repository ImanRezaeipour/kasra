
<%@ Page Title="----------------------------------------------------درخواست تردد--------------------------------------------------"
    Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RegisterGooing.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RegisterGooing"
    AsyncTimeout="1800" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800"
        LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table align="center" width="600px">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="600px" class="TableStyle">
        <tr>
            <td>
                نام پرسنلی :
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode" runat="server" />
            </td>
            <td>
                نوع :
            </td>
            <td>
                <select id="CmbGoingKind" name="CmbGoingKind" style="width: 120px" runat="server"
                    class="TxtControls">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                تاريخ :
            </td>
            <td>
                <uc3:KCalendar ID="KCalDate" runat="server" />
            </td>
            <td>
                ساعت :
            </td>
            <td>
                <input id="txtTime" type="text" class="TxtControls" style="width: 120px" runat="server"
                    onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtTime()" onkeydown="OnKeyDownTime(this)" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="checkbox" id="ChkTransmission" runat="server" />
            </td>
            <td>
                عدم انتقال
            </td>
            <td colspan="2">
                <table id="TblAttendanceType">
                    <tr>
                        <td>
                            نوع تردد :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbAttendatnceType" runat="server" class="TxtControls" Style="width: 140px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                    Height="50px" Width="91%"></asp:TextBox>
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPName" name="txtPName" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtKCalDate" name="txtKCalDate" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtScriptGroupXML" name="txtScriptGroupXML" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtTransmission" runat="server" />
        <input type="text" id="txtOptionCmbAttendanceType" runat="server" />
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/DataEntry/RegisterGooing.js?v=5"
        type="text/javascript"></script>
</asp:Content>
