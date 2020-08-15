<%@ Page Title="------------------------------------------------انتخاب کد-----------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="SelectCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.SelectCode" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Style1
        {
            border: 2px inset #B2B2B2;
        }
        .FieldSetSyle
        {
            width: 390px;
            height: 340px;
            text-align: center;
        }
        .LengedStyle
        {
            font-size: 14px;
            color: #FF0066;
            font-weight: bold;
            font-family: 'KasraB Traffic';
        }
        .DivStyle
        {
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 330px;
            width: 350px;
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
                <table width="100%" class="Style1">
                    <tr>
                        <td>
                            شماره کد :
                        </td>
                        <td>
                            <input class="TxtControls" type="text" runat="server" id="txtCodeNo" />
                        </td>
                        <td>
                            نام کد :
                        </td>
                        <td>
                            <input class="TxtControls" type="text" runat="server" id="txtCodeName" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="SelectCode.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width: 500" align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset class="FieldSetSyle">
                                        <legend><font class="LengedStyle">انتخاب کد</font></legend>
                                        <div id="GridViewCountainer" class="DivStyle">
                                            <cc2:KasraGrid ID="GrdSelectCode" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                                OnSorting="GrdSelectCode_Sorting">
                                            </cc2:KasraGrid>
                                        </div>
                                    </fieldset>
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
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCode" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtCodeNoSearch" runat="server" />
                    <input type="text" id="txtCodeNameSearch" runat="server" />
                    <input type="text" id="txtPageSize" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/SelectCode.js"
        type="text/javascript"></script>

</asp:Content>
