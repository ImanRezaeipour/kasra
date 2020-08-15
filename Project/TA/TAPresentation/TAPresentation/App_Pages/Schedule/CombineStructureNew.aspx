<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="CombineStructureNew.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.CombineStructureNew" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style ="width: 40%">
                    <tr>
                        <td>
                            ساختار اول :
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
                    </tr>
                    <tr>
                        <td>
                            ساختار دوم :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbStructure2" runat="server" Width="120px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ساختار سوم :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbStructure3" runat="server" Width="120px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ساختار چهارم :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbStructure4" runat="server" Width="120px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ساختار نتیجه :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbStructureResponse" runat="server" Width="120px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" runat="server" id="txtUpdateXml" />
        <input type="text" id="txtID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Schedule/CombineStructureNew.js" type="text/javascript"></script>
</asp:Content>
