<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DifinitionCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.DifinitionCode" Title="Untitled Page" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .DivStyle
        {
            border: thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            clear: right;
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            height: 390px;
            width : 1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <table >
                    <tr>
                        <td>
                            کد :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbCode" runat="server" />
                        </td>
                        <td>
                            نام آيتم :
                        </td>
                        <td>
                            <input type="text" runat="server" class="TxtControls" id="txtCodeName" />
                        </td>
                        <td>
                            نوع
                        </td>
                        <td>
                            <input type="checkbox" id="chkSystem" runat="server" />سيستمي
                            <input type="checkbox" id="chkUser" runat="server" />کاربري
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="DifinitionCode.aspx" PageID="1308" />
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
                        <div id="GridViewCountainer" class="DivStyle">
                            <cc2:KasraGrid ID="GrdCode" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="GrdCode_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtCodeID" runat="server" />
                    <input type="text" id="txtCodeSearch" name="txtCodeSearch" runat="server" />
                    <input type="text" id="txtCodeNameSearch" name="txtCodeNameSearch" runat="server" />
                    <input type="text" id="txtCodeStatusSearch" name="txtCodeStatusSearch" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                </div>
            </td>
        </tr>
    </table>
  <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/DifinitionCode.js?v=1"
        type="text/javascript"></script>
</asp:Content>
