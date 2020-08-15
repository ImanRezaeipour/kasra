<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CombineCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CombineCode"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            کد اول :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbGroupCode1" runat="server" />
                        </td>
                        <td>
                            کد دوم :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbGroupCode2" runat="server" />
                        </td>
                        <td>
                            نتيجه :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbResultCode" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع روز :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbDayState" runat="server" Height="16px" Width="200px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            نوع :
                        </td>
                        <td>
                            <input type="checkbox" id="chkSystem" runat="server" />سيستمي
                            <input type="checkbox" id="chkUser" runat="server" />کاربري
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="980px">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="CombineCode.aspx" />
            </td>
        </tr>
        <tr>
            <td align="center" width="700">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCode1" runat="server" />
                    <input type="text" id="txtGroupCode2" runat="server" />
                    <input type="text" id="txtResultCode" runat="server" />
                    <input type="text" id="txtDayState" runat="server" />
                     <input type="text" id="txtGroupCode1Search" runat="server" />
                    <input type="text" id="txtGroupCode2Search" runat="server" />
                    <input type="text" id="txtResultCodeSearch" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/CombineCode.js" type="text/javascript"></script>
</asp:Content>
