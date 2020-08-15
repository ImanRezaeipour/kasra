<%@ Page Title="-------------------------انتخاب ساختار----------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true"
    CodeBehind="SelectStructure.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.SelectStructure" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table scroll="no">
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" style="height: 406px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="width: 350px; height: 390; overflow: auto">
                            <cc2:KasraGrid ID="GrdStructure" runat="server" AllowPaging="True"
                                OnRowDataBound="GrdStructure_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <div style="display: none">
            <cc1:MySecurity ID="OnLineUser" runat="server">
            </cc1:MySecurity>
            <asp:HiddenField ID="txtOnLineUser" runat="server" />
            <input type="text" id="txtOutputFormat" runat="server" />
            <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                runat="server" />
            <input type="text" id="txtMenuItemID" name="txtMenuItemID" runat="server" />
            <input type="text" id="txtXml" name="txtXml" runat="server" />
            <input type="text" id="txtStrucure" name="txtStrucure" runat="server" />
            <input type="text" id="txtXmlHidden" name="txtXmlHidden" runat="server" />
        </div>
    </table>
    <script src="../../App_Utility/Scripts/Schedule/SelectStructure.js" type="text/javascript"></script>
</asp:Content>
