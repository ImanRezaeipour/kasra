<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineAccessCredit.aspx.cs"
    Inherits="TAPresentation.App_Pages.BaseInfo.DefineAccessCredit" %>

<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 95%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="40000000" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
    </table>
    <div class="style1" style="height: 535; border: thin double #000000; background-color: #CED7EA">
        <table class="style1">
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                شماره پرسنلي:
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                گروهبندي مجوزها:
                            </td>
                            <td>
                                <select id="CmbCreditType" name="D2" runat="server" style="width: 160px" onchange="onchangeCreditType()"
                                    class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                مجوزها:
                            </td>
                            <td>
                                <select id="CmbCredit" name="D1" runat="server" onchange="onchangeCredit()" style="width: 160px;"
                                    class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
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
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <uc1:ToolBar ID="OToolBar" runat="server" Paging="0" />
                </td>
            </tr>
            <tr valign="top">
                <td align="center" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtSDate" runat="server" />
                            <asp:HiddenField ID="txtEDate" runat="server" />
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
        </table>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtSortExpression" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtSortDirection" runat="server" />
        <input type="text" id="txtOldSortExpression" runat="server" />
        <input type="text" id="txtHeaderIndex" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitme" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <!----------------------------------------------------------------------------->
        <input type="text" id="txtPersonCodeTmp" name="txtPersonCodeTmp" runat="server" />
        <input type="text" id="txtCreditTmp" name="txtCreditTmp" runat="server" />
        <input type="text" id="txtXmlCode" name="txtXmlCode" runat="server" />
    </div>

    <script src="../../App_Utility/Scripts/BaseInfo/DefineAccessCredit.js" type="text/javascript"></script>

</asp:Content>
