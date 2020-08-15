<%@ Page Title="--------------------------------------------------------------------کسر از کاردکس-------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="RequestFractionCardex.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.RequestFractionCardex" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
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
                نام پرسنلی
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode" runat="server" />
            </td>
            <td>
                دوره کارکردي :
            </td>
            <td>
                <asp:DropDownList runat="server" ID="CmbPeriod" Style="width: 120px" CssClass="TxtControls">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                دوره کاردکس :
            </td>
            <td>
                <asp:DropDownList ID="CmbCardexPeriod" runat="server" Style="width: 120px" OnChange="OnChangeCmbCardexPeriod()"
                    CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td>
                کد کسر :
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList runat="server" ID="CmbCardexCodeType" Style="width: 200px" CssClass="TxtControls" onchange="Refresh()">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                مقدار کسر :
            </td>
            <td>
            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <asp:DropDownList runat="server" ID="CmbValueType" Style="width: 120px" CssClass="TxtControls">
                </asp:DropDownList>
                <input type="text" id="txtValue" class="TxtControls" onblur="onblurtxtValue(this)"
                    onkeydown="OnKeyDownTimeNew(this);" style="width: 60px" runat="server" />
                     </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                    Height="50px" Width="96%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPeriod" name="txtPeriod" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtCode" name="txtCode" runat="server" />
        <input type="text" id="txtValueSave" name="txtValueSave" runat="server" />
        <input type="text" id="txtStaticCodeValueID" name="txtStaticCodeValueID" runat="server" />
        <input type="text" id="txtScriptGroupXML" name="txtScriptGroupXML" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtDayLength" name="txtDayLength" runat="server" />
    </div>
  <script type="text/javascript" src="../../App_Utility/Scripts/Cardex/RequestFractionCardex.js?v=1"></script>
</asp:Content>

