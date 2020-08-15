<%@ Page Title="------------------------------------------انتخاب سمت------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="selectRoleType.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.RoleType.selectRoleType"
ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table cellpadding="0" cellspacing="0" style="width: 557px">
        <tr align="right">
            <td align="right">
                <table id="Table1" align="right" border="0">
                    <tr>
                        <td>
                        </td>
                        <td align="right">
                        </td>
                        <td>
                            عنوان سمت
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="CmbRoleTypeName" runat="server" Width="169px" Height="16px"
                                DataTextField="Title" DataValueField="Val" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="11134" runat="server" PageName="selectRoleType.aspxv" />
            </td>
        </tr>
        <tr valign="middle" dir="rtl">
            <td align="center">
                <table id="Table2" align="center" border="0">
                    <tr>
                        <td align="center" valign="top">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtCategoryID" runat="server" />
                                        <asp:HiddenField ID="txtRoleTypeID" runat="server" />
                                        <asp:HiddenField ID="txtType" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    </div>
                                    <div id="GridViewRoleType">
                                        <cc2:KasraGrid ID="GrdRoleType" runat="server" OnRowDataBound="Grid_RowDataBound"
                                            AllowPaging="true">
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
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtHidden" runat="server" />
                    <input type="text" id="txtAcCode" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="XMLX" runat="server" /><input type="text" id="WDFlag" runat="server" />
                    <input type="text" id="txtSearchflag" runat="server" />
                    <input type="text" id="ParentPage" runat="server" />
                    <input type="text" id="txtSelectedRoleType" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtXml2" runat="server" />
                    <input type="text" id="txtXmlPage" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                        runat="server" />
                        <input type="text" id="txtXml3" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../../App_Utility/Scripts/BaseInfo/RoleType/selectRoleType.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/jquery.xmlDom.js" type="text/javascript"></script>
</asp:Content>
