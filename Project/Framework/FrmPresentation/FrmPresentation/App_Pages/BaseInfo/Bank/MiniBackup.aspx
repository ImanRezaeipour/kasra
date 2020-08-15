<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="MiniBackup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.MiniBackup" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
    </asp:ScriptManager>
    <table style="width: 70%" cellpadding="0" cellspacing="0">
        <!--------------------------------------------ToolBar--------------------------------------------------->
        <tr>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 10px">
            </td>
        </tr>
    </table>
    <table width="60%">
        <!--------------------------------------------آیتم های وسط--------------------------------------------------->
        <tr>
            <td style="width: 90px">
            </td>
            <td style="width: 100%">
                <table width="100%" border="1px" style="background-color: #C5D8EB;">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="4" style="height: 10px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 150px;">
                                        از تاريخ :
                                    </td>
                                    <td style="width: 250px">
                                        <uc3:KCalendar ID="KcalSDate" runat="server" />
                                    </td>
                                    <td align="center" style="width: 150px;">
                                        تا تاريخ :
                                    </td>
                                    <td style="width: 250px">
                                        <uc3:KCalendar ID="KcalEDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <hr class="CssHR" style="width: 450px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <input id="RadioPrs" type="radio" name="RadioAll" value="1" style="background-color: transparent"
                                            checked />
                                        پرسنلی
                                    </td>
                                    <td align="right">
                                        &nbsp;
                                        <input id="RadioGR" type="radio" name="RadioAll" style="background-color: transparent" />
                                        گروه
                                    </td>
                                    <td align="right">
                                        <input id="RadioDep" type="radio" name="RadioAll" style="background-color: transparent" />
                                        واحد سازمانی
                                    </td>
                                    <td align="center">
                                        <input id="RadioTab" type="radio" name="RadioAll" style="background-color: transparent"
                                            value="4" />دفاتر تابل
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 10px">
                                        <hr class="CssHR" style="width: 450px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="right">
                                        <table   align="right">
                                            <tr>
                                                <td>
                                                    <input type="checkbox" runat="server" id="chkSecurity" />
                                                    چک کردن موارد امنيتي
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 90px">
            </td>
        </tr>
        <!--------------------------------------------گرید--------------------------------------------------->
        <tr>
            <td style="width: 90px">
            </td>
            <td align="center">
                <div align="center">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <fieldset dir="rtl" style="width: 70%; height: 300px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: lightblue">مشمولين</legend>
                                <table id="XTabTable_Header" style="width: 299px; height: 11px;" cellpadding="0"
                                    align="center" cellspacing="0">
                                    <thead style="display: inline">
                                        <tr class="ShoperHeaderStyle">
                                            <td class="CssHeaderStyle" style="width: 3px" align="right">
                                                <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" name="chkAll">
                                            </td>
                                            <td class="CssHeaderStyle" align="right">
                                                نام
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 304px;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 300px" align="center">
                                    <table id="XTabTable" align="center">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                            </fieldset>
                            <div style="display: none">
                                <asp:HiddenField ID="txtSDate" runat="server" />
                                <asp:HiddenField ID="txtEDate" runat="server" />
                                <asp:HiddenField ID="txtValidate" runat="server" />
                                <asp:HiddenField ID="txtAlert" runat="server" />
                                <asp:HiddenField ID="lblFrom" runat="server" />
                                <asp:HiddenField ID="lblTo" runat="server" />
                                <asp:HiddenField ID="Totalpage" runat="server" />
                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                <asp:HiddenField ID="lblTotal" runat="server" />
                                <asp:HiddenField ID="txtPageSize" runat="server" />
                                <asp:HiddenField ID="txtPageNumber" runat="server" />
                                <asp:HiddenField ID="txtOrderString" runat="server" />
                                <asp:HiddenField ID="txtCodePermision" runat="server" />
                                <asp:HiddenField ID="CurPage" runat="server" />
                                <input type="text" id="CalcStatusID" name="CalcStatusID" runat="server" />
                            </div>
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
        <tr>
            <td colspan="3" style="height: 20px">
            </td>
        </tr>
    </table>

    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtXMLNames" name="txtXMLNames" runat="server" />
        <input type="text" id="txtSubsysID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
         <input type="text" id="txtMiniBackupPath" name="txtMiniBackupPath" runat="server" />
        <input type="text" id="txtDBName" name="txtDBName" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/BaseInfo/Bank/MiniBackup.js" type="text/javascript"></script>
</asp:Content>
