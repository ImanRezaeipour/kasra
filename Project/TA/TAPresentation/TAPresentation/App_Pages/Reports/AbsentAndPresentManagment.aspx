<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="AbsentAndPresentManagment.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AbsentAndPresentManagment" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .DivStyle
        {
            border: 2px double #6593CF;
            display: inline;
            width: 209px;
            height: 300px;
        }
        .DivShadow
        {
            border: 2px double #6593CF;
            height: 8px;
            background-color: #74A0D8;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 100%">
        <tr>
            <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table>
                    <tr>
                        <td>
                            تاريخ :
                        </td>
                        <td>
                            <uc1:KCalendar ID="KCalDate" runat="server" />
                            &nbsp;
                        </td>
                        <td>
                            از ساعت :
                        </td>
                        <td>
                            <input id="txtSTime" type="text" class="TxtControls" style="width: 50px" runat="server"
                                onblur="Timechk(this),OnBlurSTime()" value="00:00" onfocus="OnFocuseTxtSTime()"
                                onkeydown="OnKeyDownTime(this)" />
                        </td>
                        <td>
                            تا ساعت :
                        </td>
                        <td>
                            <input id="txtETime" type="text" class="TxtControls" style="width: 50px;" runat="server"
                                onblur="Timechk(this),OnBlurETime()" value="00:00" onfocus="OnFocuseTxtETime()"
                                onkeydown="OnKeyDownTime(this)" />
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="width: 15px">
                                    </td>
                                    <td>
                                        گروه :
                                    </td>
                                    <td>
                                        <uc3:MultiPerson ID="MultiGroups" runat="server" />
                                    </td>
                                    <td style="width: 15px">
                                    </td>
                                    <td>
                                        گزارش بر اساس :
                                    </td>
                                    <td>
                                        <input type="checkbox" id="ChkDepartment" runat="server" onclick="OnClickChkDepartment(this)" />
                                        واحد سازمانی
                                    </td>
                                    <td>
                                        <input type="checkbox" id="ChkGroup" runat="server" onclick="OnClickChkGroup(this)" />
                                        گروه
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table id="">
                    <tr>
                        <td>
                            <div id="shadowMessage" class="DivStyle">
                                <table>
                                    <tr>
                                        <td align="left" class="DivShadow">
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="cssDiv" style="height: 350px; width: 260px;">
                                                        <ComponentArt:TreeView ID="TVNew" runat="server" AutoPostBackOnNodeCheckChanged="True"
                                                            KeyboardEnabled="true" MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true"
                                                            CssClass="" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                            HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                                            MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                                            LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                                            ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                                            ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                                            ImagesBaseUrl="../../App_Utility/Images/TreeViewImage/" LineImagesFolderUrl="../../App_Utility/Images/TreeViewLine/"
                                                            ExpandSinglePath="true" ExpandNodeOnSelect="True" CollapseNodeOnSelect="False"
                                                            OnNodeCheckChanged="TVMenu_NodeCheckChanged">
                                                        </ComponentArt:TreeView>
                                                    </div>
                                                    <asp:HiddenField ID="txtTreeXml" runat="server" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitTree" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td id="ttt" valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="hdnDepartmentName" runat="server" />
                                        <asp:HiddenField ID="hdnDepartmentType" runat="server" />
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                                        <input type="text" id="txtDepartmentName" name="txtDepartmentName" runat="server" />
                                        <input type="text" id="txtTreeDepartmentID" name="txtTreeDepartmentID" runat="server" />
                                        <input type="text" id="txtTreeDepartmentName" name="txtTreeDepartmentName" runat="server" />
                                    </div>
                                    <div class="cssDiv" id="GridViewCountainer" style="width: 100%; height: 431px;">
                                        <cc2:KasraGrid ID="GrdAbsentPresentManagment" runat="server" OnRowDataBound="Grid_RowDataBound"
                                            AllowSendToPDF="true" AllowSendToExcel="true">
                                        </cc2:KasraGrid>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    <asp:AsyncPostBackTrigger ControlID="TVNew" EventName="NodeSelected" />
                                    <asp:PostBackTrigger ControlID="BtnSubmitSend" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <asp:Button ID="BtnSubmitTree" runat="server" Text="BtnSubmitTree" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtShowMonthlyTree" runat="server" />
        <input type="text" id="txtOnlineUserDepartmentID" runat="server" />
        <input type="text" id="txtGetAccessID" runat="server" />
        <input type="text" id="txtGetRoleType" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSTimeSearch" name="txtSTimeSearch" runat="server" />
        <input type="text" id="txtETimeSearch" name="txtETimeSearch" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtCurDate" name="txtCurDate" runat="server" />
        <input type="text" id="txtReportDate" name="txtReportDate" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtGroup" name="txtGroup" runat="server" />
        <input type="text" id="txtRGroupID" name="txtRGroupID" runat="server" />
        <input type="text" id="txtRDepartmentID" name="txtRDepartmentID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Reports/AbsentAndPresentManagment.js?v=1.1"
        type="text/javascript"></script>
</asp:Content>
