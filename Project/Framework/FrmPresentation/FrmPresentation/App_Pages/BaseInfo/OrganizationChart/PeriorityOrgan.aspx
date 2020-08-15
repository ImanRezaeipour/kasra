<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="PeriorityOrgan.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.PeriorityOrgan" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr id="test">
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer">
                            <cc2:KasraGrid ID="GrdPrioritydepartment" runat="server" OnRowDataBound="GrdPrioritydepartment_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                <%--    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>--%>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:mysecurity id="OnLineUser" runat="server">
        </cc1:mysecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
        <input type="text" id="txtParentID" name="txtParentID" runat="server" />
        <input type="text" id="txtDepartmentName" name="txtDepartmentName" runat="server" />
    </div>
        <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/BaseInfo/OrganizationChart/PeriorityOrgan.js"></script>
</asp:Content>

