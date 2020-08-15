<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeCategoryPage_new.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CodeCategoryPage_new" %>

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
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="CodeCategoryPage_New.aspx" PageID="131151" />
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
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtCodeCategoryPageID" name="txtCodeCategoryPageID" runat="server" />
                    <input type="text" id="txtID" name="txtID" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام صفحه:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbPageName" class='CmbPageName' Width="200px" runat="server"
                                Font-Names="Tahoma" meta:resourcekey="CmbPageNameResource">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            وضعیت:
                        </td>
                        <td>
                            <%--<asp:TextBox ID="TxtStatus" runat="server" Width="200px"></asp:TextBox>--%>
                            <select id="cmbStatus" class="TxtControls" runat="server"></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام دسته بندی:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbCategoryName" class='CmbCategoryName' Width="200px" runat="server"
                                Font-Names="Tahoma" meta:resourcekey="CmbCategoryNameResource">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            شرح:
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDesciption" runat="server" TextMode="MultiLine" Width="300px"
                                Height="100"></asp:TextBox>
                        </td>
                        <td width="100px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/BaseInfo/CodeCategoryPage_new.js" type="text/javascript"></script>
</asp:Content>
