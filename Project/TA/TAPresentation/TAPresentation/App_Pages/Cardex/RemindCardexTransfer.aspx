<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="RemindCardexTransfer.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.RemindCardexTransfer" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        AsyncPostBackTimeout="7200" ScriptMode="Release">
    </asp:ScriptManager>
    <table style="width: 100%">
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
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp; نام کاردکس
                                                </td>
                                                <td>
                                                    <asp:DropDownList class="TxtControls" ID="CmbCardexPeriod" runat="server" Width="120px"
                                                        onchange="OnChangeCardexPeriod()">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; از دوره
                                                </td>
                                                <td>
                                                    <asp:DropDownList class="TxtControls" ID="CmbFromPeriod" runat="server" Width="120px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;به
                                                    دوره
                                                </td>
                                                <td>
                                                    <asp:DropDownList class="TxtControls" ID="CmbToPeriod" runat="server" Width="120px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkTransfer" runat="server" />
                                                    مقدار ابتدای دوره کاردکس منتقل شود
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtCardexPeriodID" runat="server" />
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitrefresh" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <input type="text" id="txtCodesInc" name="txtCodesInc" runat="server" />
                                        <input type="text" id="txtCodesDec" name="txtCodesDec" runat="server" />
                                    </div>
                                    <table>
                                        <tr>
                                            <td>
                                                کدهای افزاینده
                                            </td>
                                            <td>
                                                <input class="TxtControls" id="txtCodeSelectorInc" runat="server" dir="rtl" type="text"
                                                    style="width: 300px;" disabled="disabled" />
                                            </td>
                                            <td>
                                                <input class='HeaderStyle' onclick='onclickbtnCodeSelector("Inc")' style='width: 25px;
                                                    cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;کدهای کاهنده
                                            </td>
                                            <td>
                                                <input class="TxtControls" id="txtCodeSelectorDec" runat="server" dir="rtl" type="text"
                                                    style="width: 300px;" disabled="disabled" />
                                            </td>
                                            <td>
                                                <input class='HeaderStyle' onclick='onclickbtnCodeSelector("Dec")' style='width: 25px;
                                                    cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitrefresh" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <input type="text" id="txtCodesInc1" name="txtCodesInc1" runat="server" />
                                        <input type="text" id="txtCodesDec1" name="txtCodesDec1" runat="server" />
                                    </div>
                                    <table>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;&nbsp;سایر افزاینده
                                            </td>
                                            <td>
                                                <input class="TxtControls" id="txtCodeSelectorInc1" runat="server" dir="rtl" type="text" style="width: 300px;"
                                                    disabled="disabled" />
                                            </td>
                                            <td>
                                                <input class='HeaderStyle' onclick='onclickbtnCodeSelector1("Inc")' style='width: 25px;
                                                    cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />
                                            </td>
                                            <td>
                                                کدهای کسر از کاهنده
                                            </td>
                                            <td>
                                                <input class="TxtControls" id="txtCodeSelectorDec1" runat="server" dir="rtl" type="text" style="width: 300px;"
                                                    disabled="disabled" />
                                            </td>
                                            <td>
                                                <input class='HeaderStyle' onclick='onclickbtnCodeSelector1("Dec")' style='width: 25px;
                                                    cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitrefresh" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <td>
                                   &nbsp;&nbsp;&nbsp;&nbsp; کد اول دوره
                                </td>
                                <td>
                                    <uc2:combobox id="ddlStartCode" runat="server" />
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;کد سوخت شده
                                </td>
                                <td>
                                    <uc2:combobox id="ddlFireCode" runat="server" />
                                </td>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;نوع ضریب
                                    </td>
                                    <td>
                                        <asp:DropDownList class="TxtControls" ID="CmbZaribCardexType" runat="server" Width="120px"
                                            onchange="OnChangeZaribCardexType()">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                      
                                    </td>
                                    <td>
                                        <input type="text" id="txtZarib" runat="server" name="txtZarib" style="width: 110px"
                                            onblur="onblurtxtValue(this)" onkeydown="OnKeyDownIntZarib()" />
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;توضیحات
                                    </td>
                                    <td>
                                        <input type="text" id="txtComment" runat="server" name="txtComment" style="width: 560" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 50%; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">مشمولين</legend>
                                <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0" style="height: 100%;">
                                    <tr>
                                        <td valign="top" style="width: 50%">
                                            <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                                <tr id="TDD">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson" runat="server" name="GroupChk" type="radio" checked />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="center" style="width: 50%">
                                            <table id="ScriptGroups_Header" style="width: 275px;">
                                                <tr>
                                                    <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                        <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                            type="checkbox" name="chkAll">
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        شماره
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td valign="top">
                                                        <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; vertical-align: top"
                                                            align="right">
                                                            <table align="center" id="ScriptGroups" style="width: 275px;">
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 50%; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">غير مشمولين</legend>
                                <table id="Table3" cellspacing="0" cellpadding="0" align="center" border="0" style="height: 100%;">
                                    <tr>
                                        <td valign="top">
                                            <table id="Table4" cellspacing="1" cellpadding="1" border="0">
                                                <tr id="TDD1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment1" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup1" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson1" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="ScriptGroups_Header1" style="width: 275px;">
                                                <tr>
                                                    <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                        <input id="chkAll1" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                            type="checkbox" />
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        شماره
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; vertical-align: top"
                                                align="right">
                                                <table align="center" id="ScriptGroups1" style="width: 275px;">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: none">
                    <input type="text" id="txtValidate" name="txtValidate" runat="server" />
                    <input type="text" id="txtAlert" name="txtAlert" runat="server" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitrefresh" runat="server" OnClick="BtnSubmitrefresh_Click" />
        <%--input type="text" id="txtCardexPeriodID" name="txtCardexPeriodID" runat="server" />--%>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtEndPeriod" name="txtEndPeriod" runat="server" />
        <input type="text" id="txtReportCode" name="txtReportCode" runat="server" />
        <input type="text" id="txtReportCode1" name="txtReportCode1" runat="server" />
        <input type="text" id="txtchkTransfer" name="txtchkTransfer" runat="server" />
        <input type="text" id="txtPersScript" name="txtPersScript" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Cardex/RemindCardexTransfer.js" type="text/javascript"></script>
</asp:Content>
