<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="DefineDepatmentType.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.DefineDepatmentType" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="left">
                <div align="left" dir="ltr" style="width: 100%">
                    <input id="BtnUpItem" title="حرکت به بالا" class="CssMoveUpItem" onclick="checkEnter(-1)"
                        type="button" name="BtnUpItem" />
                    <input id="BtnDownItem" title="حرکت به پايين" class="CssMoveDownItem" onclick="checkEnter(1)"
                        type="button" name="BtnDownItem" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdDepartment" runat="server" OnRowDataBound="GrdDepartment_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="TxtXml" runat="server" />
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
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtID" name="txtID" runat="server" />
        <input type="text" id="txtAllowSend" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />IntVal
        <input type="text" id="txtIntVal" name="txtIntVal" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/BaseInfo/OrganizationChart/DefineDepatmentType.js"
        type="text/javascript"></script>
   <%-- <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>--%>
</asp:Content>

