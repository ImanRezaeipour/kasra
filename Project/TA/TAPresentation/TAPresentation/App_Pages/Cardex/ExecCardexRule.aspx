<%@ Page Title="----------------------------------------------قوانين کاردکس--------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ExecCardexRule.aspx.cs" ValidateRequest="false" Inherits="TAPresentation.App_Pages.Cardex.ExecCardexRule" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width: 300px">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            دوره کاردکس :
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbCardexPeriod" runat="server" CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            دوره کارکردي :
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbPeriod" runat="server" CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <fieldset style="width: 550px; height: 300px; text-align: center;">
                            <legend><font style="font-size: 14px; color: #78BED6; font-weight: bold; font-family: 'KasraB Traffic';">
                                ليست قوانين کاردکس</font></legend>
                            <div id="GridViewCardexRule" class="DivStyle">
                                <cc2:KasraGrid ID="GrdCardexRule" runat="server" OnRowDataBound="Grid_RowDataBound"
                                    AllowSorting="true" OnSorting="GrdCardexRule_Sorting">
                                </cc2:KasraGrid>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="display: inline">
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/Cardex/ExecCardexRule.js" type="text/javascript"></script>
</asp:Content>
