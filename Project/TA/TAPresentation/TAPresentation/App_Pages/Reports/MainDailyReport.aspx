<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    CodeBehind="MainDailyReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.MainDailyReport"
    AsyncTimeout="7200" ValidateRequest="false" Title="-------------------------------------------------------------------------------مديريت کارکرد روزانه----------------------------------------------------------------------------------------" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="ucd" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    
    
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"
        AsyncPostBackTimeout="7200">
    </asp:ScriptManager>
    <table style="width:100%;">
        <tr id="tr1">
            <td>
                <div style="float: right; width: 2%; text-align: left;">
                    واحد:
                </div>
                <div id="DivRole" style="float: right; width: 12%; text-align: right">
                </div>
                <div style="float: right; width: 3%; text-align: left">
                    سمت:
                </div>
                <div id="DivRoleTitle" style="float: right; width: 8%; text-align: right">
                </div>
                <div style="float: right; width: 1%; text-align: left">
                    از:
                </div>
                <div style="float: right; width: 16%; text-align: right">
                    
                    <%--<ucd:KCalendar ID="KCalSDate" runat="server" />--%>
                    <input type="text" id="TxtSDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="onkeydownEnter();ArrowKeyManager(this);" onchange="onchangeDate()" onblur="DatePicker_OnBlur(this)"  />
                </div>
                <div style="float: right; width: 1%; text-align: left">
                    تا:
                </div>
                <div style="float: right; width: 16%; text-align: right">
                    
                    <%--<ucd:KCalendar ID="KCalEDate" runat="server" />--%>
                    <input type="text" id="TxtEDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="onkeydownEnter();ArrowKeyManager(this);" onchange="onchangeDate()" onblur="DatePicker_OnBlur(this)" />
                    </div>
                <div style="float: right; width: 50px;  text-align: right">
                    <input id="btnNextPerson" type="button" title="پرسنل بعدی" onclick="OnClickBtnNextPerson()"
                        style="width: 20px; cursor: pointer; height: 25px; background-color: #596d9e;
                        background-image: url('/TAPresentation/App_Utility/Images/Icons/paging-next.gif');background-repeat:no-repeat;border: thin groove #000080" />
                    <input id="btnPrePerson" type="button" title="پرسنل قبلی" onclick="OnClickBtnPrePerson()"
                        style="width: 20px; cursor: pointer; height: 25px; background-color:  #596d9e;
                        background-image: url('/TAPresentation/App_Utility/Images/Icons/paging-prev.gif');background-repeat:no-repeat;border: thin groove #000080" />
                </div>
                <div style="float: right; width: 2%; text-align: left">
                    پرسنلي :
                </div>
                <div id="TDSearchCombo" style="float: right; width: 12%; text-align: right">
                    <uc4:ComboBox ID="CmbPerson" runat="server" />
                </div>
                <div id="TDSearchTxt" style="float: right; width: 21%; text-align: right; display: none">
                    
                    <input id="txtPersonCode" type="text" runat="server" dir="rtl" style="width: 80px"
                        onkeydown="OnKeyDownInt(this),onkeydownEnterPersonCode()" onblur="OnBlurtxtPersonCode()"
                        class="TxtControls" />
                    <input id="txtPersonName" runat="server" name="txtPersonName" style="width: 99px"
                        type="text" class="TxtControls" />
                    <input id="btnRefreshPerson" class="CssHeaderStyle" onclick="onClickbtnRefreshPerson(this)"
                        style="width: 20px; cursor: hand; height: 22px" type="button" value="..." />
                        
                </div>
                
                <div style="float: right; width: 10%; height: 20px; text-align: left">
                    <input type="checkbox" id="chkCreditNeed" runat="server" />
                    
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
                
                <div id="GridViewCountainer" style="vertical-align: top; float: right;" align="right">
                    <%--<cc2:KasraGrid ID="GrdDailyReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                        ShowLineCounter="true" AllowSendToPDF="true" AllowSendToExcel="true">
                    </cc2:KasraGrid>--%>
                    
                    <div id="dPager" style="height:30px;text-align:right;background-color:#D3E2ED;border-width:1px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ADC2E9, EndColorStr=#CDDAF1)">
                        <table>
                            <tr>
                                <td id="TdGridSend" align="right">
                                                
                                </td>
                                <td id="TdGridPager" align="right">
                                    <table>
                                        <tr>
                                            <td style="width:30px;">
                                                <img id="BtnGridLast" title="آخرين" alt="آخرين" src="/TAPresentation/App_Utility/Images/Icons/active_last.gif" style="cursor:pointer;" />
                                            </td>
                                            <td style="width:30px;">
                                                <img id="BtnGridNext" title="بعدي" alt="بعدي" src="/TAPresentation/App_Utility/Images/Icons/active_forward.gif" style="cursor:pointer;" />
                                            </td>
                                            <td>
                                                <input id="TxtGridCurPage" type="text" title="صفحه جاري" style="text-align:center;border-style:solid;border-width:1px;border-color:#003366 #7EAACB #7EAACB #003366;background-color:#D3E2ED;width:40px;height:18px;font-weight:normal;font-size:12px;font-family:Tahoma;" onkeydown="OnKeyDownInt(this)" />
                                            </td>
                                            <td style="width:10px;color:#003366;">
                                                از
                                            </td>
                                            <td style="width:40px;">
                                                <input id="TxtGridTotalPage" type="text" title="تعداد كل صفحات" readonly="readonly" style="text-align:center;width:100%;background-color:transparent;border-width:0px;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                            </td>
                                            <td style="width:30px;">
                                                <img id="BtnGridPrev" title="قبلي" alt="قبلي" src="/TAPresentation/App_Utility/Images/Icons/active_back.gif" style="cursor:pointer;" />
                                            </td>
                                            <td style="width:30px;">
                                                <img id="BtnGridFirst" title="اولين" alt="اولين" src="/TAPresentation/App_Utility/Images/Icons/active_first.gif" style="cursor:pointer;" />
                                            </td>
                                            <td style="width:50px;">
                                                <input id="TxtGridFromData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                            </td>
                                            <td style="width:20px;color:#003366;">
                                                تا
                                            </td>
                                            <td style="width:50px;">
                                                <input id="TxtGridToData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                            </td>
                                            <td style="width:20px;color:#003366;">
                                                از
                                            </td>
                                            <td style="width:50px;">
                                                <input id="TxtGridTotalData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                            </td>
                                                            
                                        </tr>
                                    </table>
                                </td>
                                <td id="TdGridMessage" style="width:400px;color:Red;">
                                                            
                                </td>
                            </tr>
                        </table>
                                        
                        </div>
                        <table id="GrdDailyReport" border="0" cellpadding="0" cellspacing="1">
                            <thead id="ColumnHeader">
            
                            </thead>
                            <tbody id="ColumnData">
            
                            </tbody>
                            <tfoot id="ColumnFooter">
            
                            </tfoot>
                        </table>
                        
                </div>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
                <asp:HiddenField ID="txtValidateCalc" runat="server" />
                <input type="text" style="display: none" id="txtToolTipDept" runat="server" />
                <input type="text" id="txtDivDept" style="display: none" runat="server" />
                <input type="text" style="display: none" id="txtToolTipRole" runat="server" />
                <input type="text" id="txtRoleTitle" style="display: none" runat="server" />
                   
            </td>
        </tr>
    </table>
    <div align="center" id="LinkDiv" style="vertical-align: middle; width: 320px; height: 100px;
        font-family: tahoma Normal; overflow: auto; border-style: solid; border-right-color: #6495ed;
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
                        
                        <asp:HiddenField ID="txtAlertDayContinuation" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtStatus" runat="server" />
                            
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
        
        <asp:HiddenField ID="txtXmlRowInfo" runat="server" />
        <asp:HiddenField ID="txtRDate" runat="server" />
            
        <input type="text" id="txtFlagDayContinuation" name="txtFlagDayContinuation" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtRowDate" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="BtnSubmit_Click" />
        <asp:Button ID="RefreshPersonGridSubmit" runat="server" OnClick="BtnSubmit_Click" />
        <input id="SDate" runat="server" name="SDate" type="text" />
        <input id="EDate" runat="server" name="EDate" type="text" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtAccessBtn" runat="server" />
        <input type="text" id="txtLDow" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtXmlGridProperty" name="txtXmlGridProperty" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtXmlRptGetPersonelDailyReport" name="txtXmlRptGetPersonelDailyReport" runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
        <input type="text" id="txtWorkPeriodID_Decode" name="txtWorkPeriodID_Decode" runat="server" />
        <input type="text" id="txtAllowSend" runat="server" />
        <input type="text" id="txtLMazadKar" runat="server" />
        <input type="text" id="txtLkasrkar" runat="server" />
        <input type="text" id="txtDayContinuation" runat="server" />
        <input type="text" id="txtNewWFO" runat="server" />
        <input type="text" id="txtOptionCmbPerson" runat="server" />
        <input type="text" id="txtCreditNeed" runat="server" />
        <input type="text" id="txtShowWorkCartable" runat="server" />
        <input type="text" id="txtMenuItemID" runat="server" />
        <input type="text" id="txtShowDocInfoNew" runat="server" />
        <input type="text" id="txtPName" runat="server" />
        <input type="text" id="TxtRequestPersonCode" runat="server" />
        
    </div>
    
    <link type="text/css" href="../../App_Utility/PersianCalendar/styles/DatePicker.css" rel="stylesheet" /> 
    <script language="javascript" type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/PDate.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/calendar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-ar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-fa.js"></script>
    <script type="text/javascript" src="../../App_Utility/Scripts/KasraJsGrid.js"></script>
    <script type="text/javascript" src="../../App_Utility/Scripts/Reports/MainDailyReport.js?v=1.2""></script>
    
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    
    
</asp:Content>

