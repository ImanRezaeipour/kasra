<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="EditTableOfficeAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.EditTableOfficeAccess" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .CssGreen
        {
            background-color: #CCFFCC;
        }
        .CssRed
        {
            background-color: pink;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table style="width: 500px">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="width: 350px; height: 390">
                            <cc2:KasraGrid ID="GrdTableOfficeAccess" runat="server" AllowSorting="true" OnSorting="GrdTableOfficeAccess_Sorting"
                                AllowPaging="false" OnRowDataBound="GrdTableOfficeAccess_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtSortCondition" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainerTable" style="width: 350px; height: 390">
                            <cc2:KasraGrid ID="GrdTable" runat="server" AllowSorting="true" OnSorting="GrdTable_Sorting"
                                AllowPaging="false" OnRowDataBound="GrdTable_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlertTable" runat="server" />
                        <asp:HiddenField ID="txtValidateTable" runat="server" />
                        <asp:HiddenField ID="txtSortConditionTable" runat="server" />
                        <asp:HiddenField ID="txtSortExpressionTable" runat="server" />
                        <asp:HiddenField ID="txtSortDirectionTable" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
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
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="TxtXml" runat="server" />
        <input type="text" id="TxtXmlTable" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtHtml" name="txtHtml" runat="server" />
        <table id="tblTemp">
        </table>
    </div>
    <script src="../../App_Utility/Scripts/Access/EditTableOfficeAccess.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/jquery.xmlDom.js" type="text/javascript"></script>
</asp:Content>
