<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="ValidPersonCardReaderNew.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.ValidPersonCardReaderNew" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 141px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table cellspacing="1" cellpadding="2" border="0" width="700px">
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr bgcolor="#d2d8e6">
            <td>
                <table width="100%">
                    <tr>
                        <td style="width: 150px; height: 22px" align="center">
                            <input id="RadRole" type="radio" checked name="GroupChk" />
                            واحد سازماني
                        </td>
                        <td style="width: 150px; height: 22px" align="center">
                            <input id="RadGroup" type="radio" name="GroupChk" />گروه پرسنلي
                        </td>
                        <td style="width: 150px; height: 22px" align="center">
                            <input id="RadPerson" type="radio" name="GroupChk" />
                            پرسنل
                        </td>
                        <td style="width: 150px; height: 22px" align="center">
                            <input id="RadTableOff" type="radio" name="GroupChk" />
                            دفتر تابل
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td align="center" valign="top">
                            <div align="center" style="vertical-align: top">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <fieldset dir="rtl" style="width: 70%; height: 300px; border-right: lightblue thin inset;
                                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
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
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 432px" align="center">
                                                <table id="XTabTable" align="center">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                            <div style="display: none">
                                                <asp:HiddenField ID="txtValidate" runat="server" />
                                                <asp:HiddenField ID="txtAlert" runat="server" />
                                            </div>
                                        </fieldset>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td style="width: 500px; background-color: #d2d8e6;" valign="top">
                            <table width="100%">
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="1" class="style1">
                                        نوع محدوديت:
                                    </td>
                                    <td style="background-color: #E6E8F7" colspan="2">
                                        <input id="RadHard" type="radio" onclick="ChangeActionCombo()" name="limitedType"
                                            runat="server" checked />سخت افزاري
                                        <input id="RadSoft" type="radio" onclick="ChangeActionCombo()" name="limitedType"
                                            runat="server" />نرم افزاري
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        از تاريخ:
                                    </td>
                                    <td style="width: 80px">
                                        <uc1:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 100px">
                                        تا تاريخ:
                                    </td>
                                    <td style="width: 80px">
                                        <uc1:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        علت:
                                    </td>
                                    <td>
                                        <select id="CmbCause" name="CmbCause" runat="server" style="width: 120px" class="TxtControls">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td>
                                        فعاليت:
                                    </td>
                                    <td>
                                        <select id="CmbAction" name="CmbAction" runat="server" style="width: 120px" class="TxtControls">
                                            <option></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <fieldset dir="rtl" style="width: 100%; height: 220px; border-right: lightblue thin inset;
                                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                            <legend class="legendStyle">گروه کارتخوان:</legend>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="DivStyle" style="height: 202px">
                                                        <div id="GridViewCountainer" style="vertical-align: middle; height: 200px;">
                                                            <cc2:KasraGrid ID="GrdCardReaderGroup" runat="server" Height="200px" OnRowDataBound="Grid_RowDataBound">
                                                            </cc2:KasraGrid>
                                                        </div>
                                                    </div>
                                                    <asp:HiddenField ID="txtMaxNumber" runat="server" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </fieldset>
                                    </td>
                                    <%--<td colspan="2">
                                        <select id="CmbCardGroup" name="CmbCardGroup" runat="server" style="width: 120px"
                                            class="TxtControls">
                                            <option></option>
                                        </select>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" colspan="4">
                                        شرح:
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtDesc" runat="server" CssClass="TxtControls" TextMode="MultiLine"
                                            Width="100%" Height="80px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:HiddenField ID="txtSDate" runat="server" />
        <asp:HiddenField ID="txtEDate" runat="server" />
        <asp:HiddenField ID="lblFrom" runat="server" />
        <asp:HiddenField ID="lblTo" runat="server" />
        <asp:HiddenField ID="Totalpage" runat="server" />
        <asp:HiddenField ID="txtCurPage" runat="server" />
        <asp:HiddenField ID="lblTotal" runat="server" />
        <asp:HiddenField ID="txtPageSize" runat="server" />
        <asp:HiddenField ID="txtPageNumber" runat="server" />
        <asp:HiddenField ID="txtOrderString" runat="server" />
        <asp:HiddenField ID="CurPage" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
        <input type="text" id="txtActionEdit" name="txtActionEdit" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
        <input type="text" id="txtFlag" name="txtFlag7" runat="server" />
        <input type="text" id="txtXmlValidPersonFlag" name="txtFlag7" runat="server" />
        <input type="text" id="txtXml1" name="txtXml1" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/ValidPersonCardReaderNew.js"
        type="text/javascript"></script>
</asp:Content>
