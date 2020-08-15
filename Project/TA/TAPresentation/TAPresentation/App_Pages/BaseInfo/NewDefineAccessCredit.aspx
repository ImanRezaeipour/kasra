<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="NewDefineAccessCredit.aspx.cs"
    Inherits="TAPresentation.App_Pages.BaseInfo.NewDefineAccessCredit" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table cellspacing="1" cellpadding="2" border="0">
        <tr>
            <td colspan="6">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
            </td>
        </tr>
        <tr bgcolor="#d2d8e6">
            <td>
                از تاريخ:
            </td>
            <td>
                <uc1:KCalendar ID="KCalSDate" runat="server" />
                &nbsp;
            </td>
            <td>
                تا تاريخ:
            </td>
            <td>
                <uc1:KCalendar ID="KCalEDate" runat="server" />
                &nbsp;
            </td>
            <td>
                گروه مجوز:
            </td>
            <td>
                <select id="CmbCreditType" name="CmbCreditType" runat="server" style="width: 150px"
                    class="TxtControls">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 10px">
            </td>
        </tr>
        <tr bgcolor="#d2d8e6">
            <td colspan="6">
                <table width="100%">
                    <tr>
                        <td style="width: 22px; height: 22px" align="center">
                            <input id="RadRole" type="radio" checked name="GroupChk" />
                        </td>
                        <td style="height: 22px">
                            واحد سازماني
                        </td>
                        <td style="width: 22px; height: 22px" align="center">
                            <input id="RadGroup" type="radio" name="GroupChk" />
                        </td>
                        <td>
                            گروه پرسنلي
                        </td>
                        <td style="width: 22px; height: 22px" align="center">
                            <input id="RadPerson" type="radio" name="GroupChk" />
                        </td>
                        <td>
                            پرسنل
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table width="100%">
                    <tr>
                        <td style="width: 90px">
                        </td>
                        <td align="center" valign="top">
                            <div align="center">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <fieldset dir="rtl" style="width: 70%; height: 292px; border-right: lightblue thin inset;
                                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                            align="center">
                                            <legend style="color: lightblue">اعضاء</legend>
                                            <table id="XTabTable_Header" style="width: 299px; height: 11px;" cellpadding="0"
                                                align="center" cellspacing="0">
                                                <thead style="display: inline">
                                                    <tr class="ShoperHeaderStyle">
                                                        <td class="CssHeaderStyle" align="center">
                                                            نام
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 304px;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 292px" align="center">
                                                <table id="XTabTable" align="center">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                        </fieldset>
                                        <asp:HiddenField ID="txtSDate" runat="server" />
                                        <asp:HiddenField ID="txtEDate" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtPageSize" runat="server" />
                                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                                        <asp:HiddenField ID="txtOrderString" runat="server" />
                                        <asp:HiddenField ID="txtValidate" runat="server" />
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td style="width: 90px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtGroupTypeTmp" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
    </div>

    <script src="../../App_Utility/Scripts/BaseInfo/NewDefineAccessCredit.js" type="text/javascript"></script>

</asp:Content>
