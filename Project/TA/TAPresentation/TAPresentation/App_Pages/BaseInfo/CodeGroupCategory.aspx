<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CodeGroupCategory.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CodeGroupCategory" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 100%">
        <tr>
            
            <td>
                نام دسته بندی:
            </td>
            <td>
                <asp:DropDownList ID="CmbCategoryName" class='CmbCategoryName' Width="180px" runat="server"
                    Font-Names="Tahoma" meta:resourcekey="CmbCategoryNameResource">
                </asp:DropDownList>
            </td>
            <td>
                نام گروه کد:
            </td>
            <td>
                <asp:DropDownList ID="CmbCodeGroup" class='CmbCodeGroup' Width="200px" runat="server"
                    Font-Names="Tahoma" meta:resourcekey="CmbCodeGroupResource">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="CodeGroupCategory.aspx" PageID="131153" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                   <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />--%>
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtID" name="txtID" runat="server" />                           
                </div>
            </td>
        </tr>
        <tr>      
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtStatus" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewCountainer" >
                            <cc2:KasraGrid ID="GrdCodeGroupCategory" runat="server" OnRowDataBound="GrdCodeGroupCategory_RowDataBound"
                                AllowSorting="true" OnSorting="GrdCodeGroupCategory_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

        <script type="text/javascript" src="../../App_Utility/Scripts/BaseInfo/CodeGroupCategory.js"></script>
</asp:Content>
