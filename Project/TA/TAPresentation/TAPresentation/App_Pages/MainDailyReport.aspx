<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    CodeBehind="MainDailyReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.MainDailyReport"
    ValidateRequest="false" Title="-------------------------------------------------------------------------------مديريت کارکرد روزانه----------------------------------------------------------------------------------------" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false" >
    </asp:ScriptManager>
    <table style="width: 100%">
        <tr id="tr1">
            <td>
                <div style="float: right; width: 10%; text-align: left">
                    واحد سازماني:
                </div>
                <div id="DivRole" style="float: right; width: 12%; text-align: right">
                </div>
                <div style="float: right; width: 2%; text-align: left">
                    از:
                </div>
                <div style="float: right; width: 15%; text-align: right">
                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                </div>
                <div style="float: right; width: 2%; text-align: left">
                    تا:
                </div>
                <div style="float: right; width: 15%; text-align: right">
                    <uc3:KCalendar ID="KCalEDate" runat="server" />
                </div>
                <div style="float: right; width: 6%; text-align: left">
                    پرسنلي :
                </div>
                <div style="float: right; width: 20%; text-align: right">
                    <uc4:ComboBox ID="CmbPerson" runat="server" /></div>
                <div style="float: right; width: 2%; height: 20px; text-align: left">
                    <input type="checkbox" id="chkCreditNeed" runat="server" />
                </div>
                <div style="float: right; width: 14%; text-align: right">
                    روزهاي نيازمند مجوز
                </div>
            </td>
        </tr>
        <tr id="tr2">
            <td id="tdbar" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" PageID="1302" PageName="MainDailyReport.aspx" />
            </td>
        </tr>
        <tr dir="rtl" align="right">
            <td dir="rtl" align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="vertical-align: top; float: right;" align="right">
                             <cc2:KasraGrid ID="GrdDailyReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                                   ShowLineCounter="true"  AllowSendToPDF="true"  AllowSendToExcel="true">
                                     </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
                        <asp:HiddenField ID="txtValidateCalc" runat="server" />
                        <input type="text" style="display: none" id="txtToolTipDept" runat="server" />
                        <input type="text" id="txtDivDept" style="display: none" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                         <asp:PostBackTrigger ControlID="BtnSubmitSend" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div align="center" id="LinkDiv" style="vertical-align: middle; width: 320px; height: 100px;
        font-family: Kasra Traffic Normal; overflow: auto; border-style: solid; border-right-color: #6495ed;
        border-top-color: #87cefa; border-bottom-color: #6495ed; border-left-color: #87cefa;
        background: #e7eeff; border-width: 2px; display: none; position: absolute;">
        <table style="vertical-align: middle; height: 83px; width: 310px;" align="center">
            <tr align="center">
                <td id="TDDayContinuation" align="center">
                    آيا براي ثبت مداومت کاري اطمينان داريد؟
                </td>
            </tr>
            <tr align="center">
                <td align="center">
                    <div style="display: none" align="center">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:HiddenField ID="txtAlertDayContinuation" runat="server" />
                                <asp:HiddenField ID="txtValidate" runat="server" />
                                <asp:HiddenField ID="txtStatus" runat="server" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table align="center">
                        <tr align="center">
                            <td align="center">
                                <input id="BtnLinkOk" type="button" title="تائيد" onclick="OnClickBtnLinkOk()" style="width: 70px;
                                    height: 32px; cursor: pointer; background-color: transparent; background-image: url('/TAPresentation/App_Utility/Images/Button/Btnok2.gif');" />
                            </td>
                            <td align="center">
                                <input id="BtnLinkCancel" type="button" title="انصراف" onclick="OnClickBtnLinkCancel()"
                                    style="width: 70px; cursor: pointer; height: 32px; background-color: transparent;
                                    background-image: url('/TAPresentation/App_Utility/Images/Button/Cancel.gif');" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUserSec" runat="server">
        </cc1:MySecurity>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtXmlRowInfo" runat="server" />
                <asp:HiddenField ID="txtRDate" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtFlagDayContinuation" name="txtFlagDayContinuation" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtRowDate" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />        
        <input id="SDate"  runat="server" name="SDate" type="text" />
        <input id="EDate" runat="server" name="EDate" type="text" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtAccessBtn" runat="server" />
        <input type="text" id="txtLDow" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
         <input type="text" id="txtAllowSend" runat="server" />
    </div>
        <script language="javascript" src="../../App_Utility/Scripts/Reports/MainDailyReport.js" type="text/javascript"></script>
</asp:Content>

