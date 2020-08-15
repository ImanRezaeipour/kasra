<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" Title="------------------------------------------------------------------------ترکیب ساختار----------------------------------------------------------------"
    CodeBehind="CombineStructure.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.CombineStructure" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <table width="100%" align="center">
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="50%" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                ساختار :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList class="TxtControls" ID="cmbStructure" runat="server" Width="120px">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                ساختار نتیجه :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList class="TxtControls" ID="cmbStructureResponse" runat="server" Width="120px">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle1" align="center">
                            <cc2:KasraGrid ID="GrdCombineStructure" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowPaging="true">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtAlertStatus" runat="server" />
                        <asp:HiddenField ID="txtGridData" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
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
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <input type="text" id="txtSubmit2" name="txtSubmit2" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit_Click2" />
            <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
            <input type="text" id="txtNewWFO" name="txtNewWFO" runat="server" />
            <input type="text" id="S1" name="S1" runat="server" />
            <input type="text" id="S2" name="S2" runat="server" />
            <input type="text" id="S3" name="S3" runat="server" />
            <input type="text" id="S4" name="S4" runat="server" />
            <input type="text" id="RS" name="RS" runat="server" />
            <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        </div>
    </table>
    <script src="../../App_Utility/Scripts/Schedule/CombineStructure.js" type="text/javascript"></script>
</asp:Content>
