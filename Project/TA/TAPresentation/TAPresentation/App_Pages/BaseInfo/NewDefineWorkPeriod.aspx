<%@ Page Title="-------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" AsyncTimeout="400000000" CodeBehind="NewDefineWorkPeriod.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.NewDefineWorkPeriod"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
    </asp:ScriptManager>
    <table style="width: 500px" align="center">
        <tr>
            <td colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" EnableViewState="true" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                        </div>
                        <div align="center">
                            <table>
                            <tr><td style="text-align:left">
                                <input id="ChkActive" type="checkbox" runat="server" /></td><td>اجراي اسکريپتهای نيمه فعال</td></tr>
                                <tr>
                                    <td>
                                        نام دوره :
                                    </td>
                                    <td align="right">
                                        <input id="txtName" type="text" runat="server" align="right" />
                                        <div id="DivName" style="display: none; color: Maroon;">
                                        </div>
                                    </td>
                                    <td>
                                        تاريخ قطعي کردن:
                                    </td>
                                    <td>
                                        <uc3:KCalendar ID="KCalEXDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        از تاريخ:
                                    </td>
                                    <td class="style3">
                                        <table>
                                            <tr>
                                                <td id="SDateDiv">
                                                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                                                </td>
                                                <td id="DivSDate" style="width: 110px; display: none; color: Maroon">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" class="style3">
                                        تا تاريخ:
                                    </td>
                                    <td class="style3">
                                        <div id="EDateDiv">
                                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                                        </div>
                                        <div id="DivEDate" style="display: none; color: Maroon">
                                        </div>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
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
        <input type="text" id="EXDate" name="EXDate" runat="server" />
        <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtActive" name="txtActive" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/BaseInfo/NewDefineWorkPeriod.js" type="text/javascript"></script>
</asp:Content>
