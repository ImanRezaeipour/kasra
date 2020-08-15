<%@ Page Title="--------------------------------------------------------------------------انتخاب واحد سازمانی-----------------------------------------------------------------------------------" Language="C#" AutoEventWireup="true" CodeBehind="SelectDepartment.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.Person.SelectDepartment" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <table scroll="no" style ="width: 90%">
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 805px;">
                    <tr>
                        <td valign="top" style="height: 38px" align="center">
                            <table style="width: 90%">
                                <tr>
                                    <td style="width: 87px">
                                        نام واحد:
                                    </td>
                                    <td style="width: 294px" align="right">
                                        <asp:DropDownList ID="CmbDepartment" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtDepartment" type="text" runat="server" dir="rtl" class="TxtControls" />
                                    </td>
                                    <td style="width: 84px">
                                        نوع واحد:
                                    </td>
                                    <td style="width: 100px">
                                        <asp:DropDownList ID="cmbDepartmentType" runat="server" Width="100px" class="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="SelectDepartment.aspx" PageID="1111" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px" align="center" id="TDTypeSelDept">
                            <table style="width: 60%">
                                <tr>
                                    <td style="width: 18px">
                                        <input id="ChkDepartmentS" checked="true" type="radio" name="GroupChk" value="1" />
                                    </td>
                                    <td style="width: 159px">
                                        واحد سازماني (مستقيم)
                                    </td>
                                    <td>
                                        <input id="ChkDepartmentA" type="radio" name="GroupChk" value="2" />
                                    </td>
                                    <td>
                                        واحد سازماني (با زيرمجموعه)
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 406px">
                            <table style="width: 100%">
                                <tr>
                                    <td id="TDTree" align="right" valign="top" style="width: 310px; height: 311px">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div style="width: 360px; height: 440px;" class="BlueScroll">
                                                    <ComponentArt:TreeView ID="TVNew" runat="server" Height="98%" Width="345px" AutoPostBackOnSelect="true"
                                                        KeyboardEnabled="true" MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true"
                                                        CssClass="" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                        HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                                        MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                                        LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                                        ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                                        ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                                        ImagesBaseUrl="../../../App_Utility/Images/TreeViewImage/" LineImagesFolderUrl="../../../App_Utility/Images/TreeViewLine/"
                                                        ExpandSinglePath="true" OnNodeSelected="TVNew_NodeSelected" ExpandNodeOnSelect="True"
                                                        CollapseNodeOnSelect="False">
                                                    </ComponentArt:TreeView>
                                                    <asp:HiddenField ID="txtTreeDeptID" runat="server" />
                                                    <asp:HiddenField ID="txtSubmit" runat="server" />
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitTree" EventName="click" />
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitMain" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td id="TDGrid" valign="top" align="center">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div style="display: none">
                                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                                    <asp:HiddenField ID="txtShowFlag" runat="server" />
                                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                                    <asp:HiddenField ID="lblTo" runat="server" />
                                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                                    <asp:HiddenField ID="SearchRowIndex" runat="server" />
                                                    <asp:HiddenField ID="txtXmlDepartment" runat="server" />
                                                </div>
                                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                </td> </tr></table>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitMain" EventName="click" />
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                <asp:AsyncPostBackTrigger ControlID="TVNew" EventName="NodeSelected" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                            <div style="display: none">
                                <cc1:MySecurity ID="OnLineUser" runat="server">
                                </cc1:MySecurity>
                                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                                <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
                                <input type="text" id="txtGrdDeptID" name="txtGrdDeptID" runat="server" />
                                <input type="text" id="txtShowTypeSelDept" name="txtShowTypeSelDept" runat="server" />
                                <input type="text" id="txtSearch" name="txtSearch" runat="server" />
                                <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <asp:Button ID="BtnSubmitMain" runat="server" Text="BtnSubmitMain" OnClick="BtnSubmit_Click" />
                                <asp:Button ID="BtnSubmitTree" runat="server" Text="BtnSubmitTree" OnClick="BtnSubmit_Click" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
                                <input type="text" id="txtFind" name="txtFind" runat="server" />
                                 
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

   <%-- Script --%>
    <script src="../../../App_Utility/Scripts/BaseInfo/OrganizationChart/SelectDepartment.js?v=1.1"
        type="text/javascript"></script>

</asp:Content>
