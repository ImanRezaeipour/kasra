<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="selectGroup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.selectGroup"
    Title="------------------------------------------انتخاب گروه پرسنلي------------------------------------------------------------------------------"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 557px">
        <tr align="right">
            <td align="right">
                <table id="Table1" align="right" border="0">
                    <tr>
                        <td>
                            دسته
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="SelCategory" runat="server" Width="169px" Height="16px" DataTextField="Title"
                                DataValueField="Val" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            نام گروه
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="CmbGroupName" runat="server" Width="169px" Height="16px" DataTextField="Title"
                                DataValueField="Val" class="TxtControls" onkeypress="return KeySort(this,false)">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="right">
                            <table id="TBAndGroup">
                                <tr>
                                    <td>
                                        <input type="checkbox" id="ChkAndGroup" runat="server"  />
                                        اشتراک عضويت در گروه های انتخابی
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="1113" runat="server" PageName="selectGroup.aspxv" />
            </td>
        </tr>
        <tr valign="middle" dir="rtl">
            <td align="center">
                <table id="Table2" align="center" border="0">
                    <tr>
                        <td align="center" valign="top">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtCategoryID" runat="server" />
                                        <asp:HiddenField ID="txtGroupID" runat="server" />
                                        <asp:HiddenField ID="txtType" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    </div>
                                    <div style="width: 330px; height: 391px;">
                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtTmpPersonCode" name="txtTmpPersonCode" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="XMLX" runat="server" /><input type="text" id="WDFlag" runat="server" />
                    <input type="text" id="txtSearchflag" runat="server" />
                    <input type="text" id="ParentPage" runat="server" />
                    <input type="text" id="txtSelectedGroup" runat="server" />
                    <input type="text" id="txtSystemID" runat="server" />
                    <input type="text" id="txtGroupMode" runat="server" />
                    <input type="text" id="txtChkGroup"  runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/BaseInfo/Group/selectGroup.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/KeySorting.js"></script>
</asp:Content>
