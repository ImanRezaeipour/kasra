<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="AdminCreditNew.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.Admin.AdminCreditNew"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .CssLables
        {
            text-align: right;
        }
        .CssItemNewStyle
        {
            background-color: #DFE6EE;
        }
        .CssNewRow
        {
            background-color: #C7D0DF;
        }
        .CssFilterItems
        {
            width: 100%;
        }
        .CssTitleExtended
        {
            background-image: url('../../../App_Utility/Images/Icons/BGNew.png');
            font-weight: bold;           
        }
        .CssItemExtended
        {
            background-color: #FFFFFF;           
        }
        .CssSelectedRow
        {
            background-color: #FCDA94;
        }
    </style>
    <link type="text/css" href="../../../App_Utility/PersianCalendar/styles/DatePicker.css" rel="stylesheet" /> 
    <script language="javascript" type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/PDate.js"></script>
    <script type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc.js"></script>
    <script type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/calendar.js"></script>
    <script type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-ar.js"></script>
    <script type="text/javascript" src="../../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-fa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="CssFilterItems" cellpadding="1" cellspacing="1">
        <!---------------------------------------آیتمهای فیلتر------------------>
        <tr style="background-color: #CFF1CD;">
            <td colspan="2">
                <table width="1020" cellpadding="0" cellspacing="0" align="right">
                    <tr>
                        <td class="CssLables">
                            از تاريخ:
                        </td>
                        <td>
                            <%--<uc3:KCalendar ID="KCalSDate" runat="server" />--%>
                            <input type="text" id="TxtStartDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                        </td>
                        <td class="CssLables" colspan="2">
                            <input id="ChkDaily" type="checkbox" name="ChkGroupCodeType" />روزانه
                            <input id="ChkTimely" type="checkbox" name="ChkGroupCodeType" />ساعتی&nbsp;&nbsp;
                            بالای
                            <input type="text" id="txtRegTime" style="width: 40px" class="TxtControls" onblur="Timechk(this)" />ساعت
                        </td>
                        <td colspan="2">
                            نوع فيلتر:
                            <select id="CmbRegister" class="TxtControls" style="width: 80px">
                                <option value="0">جدید</option>
                                <option value="1">ثبت شده </option>
                                <option value="2">ثبت نشده </option>
                            </select>
                            مرتب سازي :
                            <select id="CmbOrder" class="TxtControls" style="width: 80px">
                                <option value="0">پرسنلی</option>
                                <option value="1">تاریخ </option>
                            </select>
                        </td>
                        <td>
                            <img alt="" id="ImgProgress" src="../../../App_Utility/Images/ProgressImage/loading1.gif"
                                style="visibility: hidden" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            تا تاريخ:&nbsp;
                        </td>
                        <td>
                            <%--<uc3:KCalendar ID="KCalEDate" runat="server" />--%>
                            <input type="text" id="TxtEndDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                        </td>
                        <td class="CssLables">
                            گروه مجوز:
                        </td>
                        <td>
                            <select id="CmbCodeGroupCode" class="TxtControls" style="width: 150px" runat="server"
                                onchange="onchangeCodeGroup(this)">
                            </select>
                        </td>
                        <td class="CssLables">
                            گروه پرسنلي:
                        </td>
                        <td>
                            <select id="CmbGroup" class="TxtControls" style="width: 205px" runat="server">
                            </select>
                        </td>
                        <td>
                         <input id="BtnShowCredit" type="button" style="width: 100px; font-weight: bold;display:none;"
                                value="نمايش مجوزها" />
                        </td>
                    </tr>
                    <tr>
                        <td class="CssLables">
                            پرسنلي:
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPersonCode" runat="server" />
                        </td>
                        <td class="CssLables">
                            نوع مجوز:
                        </td>
                        <td>
                            <select id="CmbCreditType" class="TxtControls" style="width: 150px">
                            </select>
                        </td>
                        <td class="CssLables">
                            واحد سازماني:
                        </td>
                        <td>
                            <select id="CmbDepartment" class="TxtControls" style="width: 205px" runat="server">
                            </select>
                        </td>
                        <td>
                            <input id="BtnFilter" type="button" style="width: 60px; font-weight: bold;"
                                value="فیلتر" />                               
                            <input id="BtnSave" type="button" style="width: 60px; font-weight: bold;display:none;"
                                value="ذخيره" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="background-color: #DAE7E9;">
            <td colspan="2">
                <hr style="width: 100%" class="CssHR" />
            </td>
        </tr>
        <!---------------------------------------گرید------------------>
        <tr>
            <td valign="top" align="right" id="GridViewCountainer" style="width: 850; overflow: auto">
                <table cellpadding="0" cellspacing="0" id="TblMainCredit" frame="hsides">
                    <tr style="height: 20px;" valign="top">
                        <td class="CssHeaderStyle" style="width: 130px" align="center">
                            <input type="checkbox" id="ChkPersonCode" />پرسنلی
                        </td>
                        <td class="CssHeaderStyle" style="width: 130px" align="center" valign="middle">
                            نام
                        </td>
                        <td class="CssHeaderStyle" style="width: 80px" align="center">
                            <input type="checkbox" id="ChkGroupCode" />گروه مجوز
                        </td>
                        <td class="CssHeaderStyle" style="width: 80px" align="center">
                            <input type="checkbox" id="ChkSDate" />از تاریخ
                        </td>
                        <td class="CssHeaderStyle" style="width: 80px" align="center">
                            <input type="checkbox" id="ChkEDate" />تا تاریخ
                        </td>
                        <td class="CssHeaderStyle" style="width: 60px" align="center">
                            <input type="checkbox" id="ChkSTime" />ز.شروع
                        </td>
                        <td class="CssHeaderStyle" style="width: 60px" align="center">
                            <input type="checkbox" id="ChkETime" />ز.خاتمه
                        </td>
                        <td class="CssHeaderStyle" style="width: 40px" align="center" valign="middle">
                            مقدار
                        </td>
                        <td class="CssHeaderStyle" style="width: 100px" align="center">
                            <input type="checkbox" id="ChkCreditType" />نوع مجوز
                        </td>
                        <td class="CssHeaderStyle" style="width: 100px" align="center">
                            <input type="checkbox" id="ChkDescript" />شرح
                        </td>
                        <td class="CssHeaderStyle" style="width: 40px" align="center">
                        </td>
                    </tr>
                    <tr id="TRInsert" RowIndex="0" pcode="" date="" creditid="" class="CssItemNewStyle">
                        <td style="width: 80px" align="right" id="test">
                            <input id="txtPersonCodeNew" type="text" class="TxtControls CssInsertNewItem CssPersonCode"
                                style="width: 65px; font-weight: bold;" /><input class="CssHeaderStyle CssButtonPersonCode"
                                    type="button" style="height: 20px; width: 15px" />
                        </td>
                        <td style="width: 130px" align="right">
                        </td>
                        <td style="width: 80px" align="right">
                            <select id="CmbGroupCodeNew" class="TxtControls CssInsertNewItem" style="width: 80px">
                            </select>
                        </td>
                        <td style="width: 80px" align="right">
                            <input id="txtSDateNew" type="text" class="TxtControls CssInsertNewItem CssDateStyle"
                                style="width: 80px; font-weight: bold;" />
                        </td>
                        <td style="width: 80px" align="right">
                            <input id="txtEDateNew" type="text" class="TxtControls CssInsertNewItem CssDateStyle"
                                style="width: 80px; font-weight: bold;" />
                        </td>
                        <td style="width: 60px" align="right">
                            <input id="txtSTimeNew" type="text" class="TxtControls CssInsertNewItem CssTimeStyle"
                                style="width: 50px; font-weight: bold;" />
                        </td>
                        <td style="width: 60px" align="right">
                            <input id="txtETimeNew" type="text" class="TxtControls CssInsertNewItem CssTimeStyle CssETime"
                                style="width: 50px; font-weight: bold;" />
                        </td>
                        <td style="width: 40px" align="right">
                        </td>
                        <td style="width: 100px" align="right">
                            <input id="txtCreditTypeNew" type="text" class="TxtControls CssInsertNewItem CssCreditType"
                                style="width: 100px; font-weight: bold;" />
                        </td>
                        <td style="width: 100px" align="right">
                            <input id="txtDescriptNew" type="text" class="TxtControls CssInsertNewItem" style="width: 100px;
                                font-weight: bold;" />
                        </td>
                        <td style="width: 40px" align="center">
                            <img src="../../../App_Utility/Images/Icons/Blank.gif" alt="" />
                        </td>
                    </tr>
                </table>
                <div align="center" id="TRPaging" style="visibility: hidden; border: 1px ridge #000000;
                    background-color: #B8CAEC;">
                    <img alt="" src="../../../App_Utility/Images/Icons/active_last.gif" onclick="OnClickBtnLast()"
                        style="cursor: pointer" title='صفحه آخر' />
                    <img alt="" src="../../../App_Utility/Images/Icons/active_forward.gif" onclick="OnClickBtnNext()"
                        id="BtNext" style="cursor: pointer" title='صفحه بعد' />
                    <input type="text" onchange="OnBlurtxtCurPage(this)" style="width: 30px; text-align: center;"
                        id="txtCurPage" class="TxtControls" />
                    از <span style="width: 30px" id="TotalPage">0</span>
                    <img alt="" src="../../../App_Utility/Images/Icons/active_back.gif" onclick="OnClickBtnPrv()"
                        id="BtnPrv" style="cursor: pointer" title='صفحه قبل' />
                    <img alt="" src="../../../App_Utility/Images/Icons/active_first.gif" onclick="OnClickBtnFirst()"
                        style="cursor: pointer" title='صفحه اول' />
                    <span style="width: 30px" id="txtFrom">0</span> تا <span style="width: 30px" id="txtTo">
                        0</span> از<span style="width: 30px" id="txtTotalRow">0</span>
                </div>
            </td>
            <td valign="top" align="right">
                <table id="TblExtended" date="" pcode="" >
                    <tr>
                        <td style="width: 200px; background-color: #000000; color: #FFFFFF;" align="center">
                            اطلاعات تکمیلی
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtGeneranInfo" runat="server" />
        <input type="text" id="txtBatchInsertOption" runat="server" />
        <input type="text" id="txtSurveyAccess" runat="server" />
        <input type="text" id="txtSDate" style="width: 150px" />
        <input type="text" id="txtEDate" style="width: 150px" />
        <input type="text" id="SDate" runat="server" style="width: 150px" />
        <input type="text" id="EDate" runat="server" style="width: 150px" />
        <input type="text" id="txtPersonCode" style="width: 180px" />
        <input type="text" id="txtInsertCreditCount" name="txtInsertCreditCount" runat="server" />
        <!------------------------------آیتم های جایگزین در سلولها به منظور ویرایش------->
        <div id="DivPersonCode">
            <input id="txtPersonCodeSelected" type="text" class="TxtControls CssInsertNewItem CssPersonCode"
                style="width: 60px; font-weight: bold; float: right" />
            <input class="CssHeaderStyle CssButtonPersonCode" type="button" style="height: 20px;
                width: 15px" />
        </div>
        <div id="DivCodeGroup">
            <select id="CmbCodeGroupSelected" class="TxtControls CssInsertNewItem" style="width: 80px">
            </select>
        </div>
        <div id="DivSDate">
            <input id="txtSDateSelected" type="text" class="TxtControls CssInsertNewItem CssDateStyle"
                style="width: 80px; font-weight: bold;" />
        </div>
        <div id="DivEDate">
            <input id="txtEDateSelected" type="text" class="TxtControls CssInsertNewItem CssDateStyle"
                style="width: 80px; font-weight: bold;" />
        </div>
        <div id="DivSTime">
            <input id="txtSTimeSelected" type="text" class="TxtControls CssInsertNewItem CssTimeStyle"
                style="width: 50px; font-weight: bold;" />
        </div>
        <div id="DivETime">
            <input id="txtETimeSelected" type="text" class="TxtControls CssInsertNewItem CssTimeStyle"
                style="width: 50px; font-weight: bold;" />
        </div>
        <div id="DivCreditType">
            <input id="txtCreditTypeSelected" type="text" class="TxtControls CssInsertNewItem CssCreditType"
                style="width: 100px; font-weight: bold;" />
        </div>
        <div id="DivDescript">
            <input id="txtDescriptSelected" type="text" class="TxtControls CssInsertNewItem CssDescript"
                style="width: 100px; font-weight: bold;" />
        </div>
        <!------------------------------------------------------------------------------------>
    </div>
    <div id="PopupCreditType" style="background-color: White; border: 2px solid Black;
        display: none; position: absolute; top: 200; left: 200;" align="right">
        <img alt="" src="../../../App_Utility/Images/Icons/close1.png" style="background-color: Black;"
            onclick="onclickBtnCloseDesc()" width="15px" height="15px" />
        <table cellpadding="0" cellspacing="0" id="TblCredits">
            <tr style="background-color: Black; height: 10px">
                <td style="width: 60px; background-color: Black; color: White">
                    کد
                </td>
                <td style="width: 150px; background-color: Black; color: White">
                    نام
                </td>
                <td style="display: none">
                </td>
            </tr>
        </table>
    </div>
    <div id="PopupOffer" style="background-color: White; border: 2px solid Black; display: none;
        position: absolute; top: 200; left: 200;" align="right">
        <img alt="" src="../../../App_Utility/Images/Icons/close1.png" style="background-color: Black;"
            onclick="onclickBtnCloseOffer()" width="15px" height="15px" />
        <table cellpadding="0" cellspacing="0" id="TblOffer">
            <tr style="background-color: Black; height: 10px">
                <td style="width: 80px; background-color: Black; color: White">
                    از تاریخ
                </td>
                <td style="width: 80px; background-color: Black; color: White">
                    تا تاریخ
                </td>
                <td style="width: 50px; background-color: Black; color: White">
                    از ساعت
                </td>
                <td style="width: 50px; background-color: Black; color: White">
                    تا ساعت
                </td>
            </tr>
        </table>
    </div>
    <%--<script src="../../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>--%> 
    
    <script language="javascript" type="text/javascript">
        document.body.scroll = "yes";
        $.noConflict();

        //---------------------------Declarations----------------
        var PageNumber = 1;
        var SubmitType = "";
        var LastSelectedRow = "";           //--------ردیف انتخابی گرید اصلی 
        var LastSelectedRowOffer = "";      //--------ردیف انتخابی گرید پیشنهادی 
        var LastSelectedRowCredit = "";     //--------ردیف انتخابی گرید نوع مجوزها
        var Counter = 0;
        $(document).ready(function () {
            $('#TxtStartDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });

            $('#TxtEndDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });


            var startDate = document.getElementById(MasterObj + "SDate").value;
            var endDate = document.getElementById(MasterObj + "EDate").value;

            document.getElementById("TxtStartDate").value = ReverceDate(document.getElementById(MasterObj + "SDate").value);
            document.getElementById("TxtEndDate").value = ReverceDate(document.getElementById(MasterObj + "EDate").value);




        });
        //ایکس ام ال مربوط به تغییرات در حالت ذخیره سازی دسته ای
        var XmlBatchSave = {
            Context: "<ReportsEntity></ReportsEntity>",
            Remove: function (rowIndex) {
                var xml;
                if (window.ActiveXObject) {
                    xml = new ActiveXObject('Microsoft.XMLDOM');
                    xml.async = 'false';
                    xml.loadXML(this.Context);
                } else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString(this.Context, 'text/xml');
                }

                var XmlNode = $(xml).find("ReportsEntity").find("ModifyCreditInput").filter(function () {
                    return $(this).find("RowIndex").text() == rowIndex;
                });

                if ($(XmlNode).length > 0) {
                    $(XmlNode).each(function () {
                        xml.childNodes(0).removeChild($(this)[0]);
                    });
                    this.Context = (xml.xml != undefined ? xml.xml : (new window.XMLSerializer()).serializeToString(xml));
                }
            },
            Add: function (Row) {
                var SDate = $(Row).find("td:eq(3)").children().val();
                var EDate = $(Row).find("td:eq(4)").children().val();
                this.Context = this.Context.replace("<ReportsEntity>", "").replace("</ReportsEntity>", "").replace("<ReportsEntity/>", "");
                this.Context = this.Context + "<ModifyCreditInput>"
            + "<Type>" + $(Row).find("td:eq(2)").children().val() + "</Type>"
            + "<StartDate>" + SDate.split("/")[2].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0] + "</StartDate>"
            + "<EndDate>" + EDate.split("/")[2].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0] + "</EndDate>"
            + "<CreditType>" + $(Row).find("td:eq(8)").children().attr("CodeID") + "</CreditType>"
            + "<StartTime>" + $(Row).find("td:eq(5)").children().val() + "</StartTime>"
            + "<EndTime>" + $(Row).find("td:eq(6)").children().val() + "</EndTime>"
            + "<Daily>" + (($(Row).find("td:eq(5)").children().val() == "00:00" && $(Row).find("td:eq(6)").children().val() == "00:00") ? "1" : "2") + "</Daily>"
            + "<Des>" + $(Row).find("td:eq(9)").children().val() + "</Des>"
                //            + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
            + "<CreditID>" + ($(Row).attr("creditid")!=undefined?$(Row).attr("creditid"):0) + "</CreditID>"
            + "<RowIndex>" + $(Row).attr("RowIndex") + "</RowIndex>"
            + "<JPersonelID>0</JPersonelID>"
            + "<MID>" + $(Row).attr("pcode") + "</MID>"
            + "<MType>U</MType>"
            + "<Extended></Extended>"
            + "<SerialNo></SerialNo>"
            + "</ModifyCreditInput>";


                this.Context = "<ReportsEntity>" + this.Context + "</ReportsEntity>";
            },
            AddForNew: function (Row) {
                var SDate = $(Row).find("td:eq(3)").text();
                var EDate = $(Row).find("td:eq(4)").text();
                this.Context = this.Context.replace("<ReportsEntity>", "").replace("</ReportsEntity>", "").replace("<ReportsEntity/>", "");
                this.Context = this.Context + "<ModifyCreditInput>"
            + "<Type>" + $(Row).attr("Type") + "</Type>"
            + "<StartDate>" + SDate.split("/")[2].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0] + "</StartDate>"
            + "<EndDate>" + EDate.split("/")[2].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0] + "</EndDate>"
            + "<CreditType>" + $(Row).attr("CodeID") + "</CreditType>"
            + "<StartTime>" + $(Row).find("td:eq(5)").text() + "</StartTime>"
            + "<EndTime>" + $(Row).find("td:eq(6)").text() + "</EndTime>"
            + "<Daily>" + (($(Row).find("td:eq(5)").text() == "00:00" && $(Row).find("td:eq(6)").text() == "00:00") ? "1" : "2") + "</Daily>"
            + "<Des>" + $(Row).find("td:eq(9)").attr("title") + "</Des>"
                //            + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
            + "<CreditID>" + ($(Row).attr("creditid") != undefined ? $(Row).attr("creditid") : 0) + "</CreditID>"
            + "<RowIndex>" + $(Row).attr("RowIndex") + "</RowIndex>"
            + "<JPersonelID>0</JPersonelID>"
            + "<MID>" + $(Row).attr("pcode") + "</MID>"
            + "<MType>U</MType>"
            + "<Extended></Extended>"
            + "<SerialNo></SerialNo>"
            + "</ModifyCreditInput>";
                //            + "<RowIndex>" + $(Row).attr("RowIndex") + "</RowIndex>"
                //            + "<PersonCode>" + $(Row).attr("pcode") + "</PersonCode>"
                //            + "<StartDate>" + SDate.split("/")[0].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[2] + "</StartDate>"
                //            + "<EndDate>" + EDate.split("/")[0].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[2] + "</EndDate>"
                //            + "<Type>" + $(Row).attr("Type") + "</Type>"
                //            + "<CreditType>" + $(Row).attr("CodeID") + "</CreditType>"
                //            + "<StartTime>" + $(Row).find("td:eq(5)").text() + "</StartTime>"
                //            + "<EndTime>" + $(Row).find("td:eq(6)").text() + "</EndTime>"
                //            + "<Des>" + $(Row).find("td:eq(9)").attr("title") + "</Des>"
                //            + "<StatusType>Admin</StatusType>"
                //            + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
                //            + "<CreditID>" + $(Row).attr("creditid") + "</CreditID></Tb>";
                this.Context = "<ReportsEntity>" + this.Context + "</ReportsEntity>";
            },
            ISEmpty: function () {
                if (this.Context.replace("<ReportsEntity>", "").replace("</ReportsEntity>", "").replace("<ReportsEntity/>", "").trim() == "")
                    return true;
                return false;
            },
            CreateContext: function () {
                $("#TblMainCredit").find("[changeRow=1]").each(function () {
                    if ($(this).attr("id") != "TRInsert") {
                        if ($(this).find("td:eq(0)").find("input:text").length > 0) {
                            if (NotEmpty(this, 2)) {
                                XmlBatchSave.Add(this);
                            }
                            else {
                                XmlBatchSave.Context = "<ReportsEntity></ReportsEntity>";
                                return false;
                            }
                        }
                        else {
                            XmlBatchSave.AddForNew(this);
                        }
                    }
                });
                return true;
            }
        };
        //------------------------------ Events---------
        function OnClickBtnLast() { PageNumber = $("#TotalPage").text(); SubmitType = "Paging"; $("#BtnFilter").click(); }
        function OnClickBtnNext() { if (PageNumber + 1 <= $("#TotalPage").text()) { PageNumber = PageNumber + 1; SubmitType = "Paging"; $("#BtnFilter").click(); } }
        function OnClickBtnPrv() { if (PageNumber - 1 > 0) { PageNumber = PageNumber - 1; SubmitType = "Paging"; $("#BtnFilter").click(); } }
        function OnClickBtnFirst() { PageNumber = 1; SubmitType = "Paging"; $("#BtnFilter").click(); }
        function OnBlurtxtCurPage(CurPage) {
            PageNumber = $(CurPage).val();
            $("#BtnFilter").click();
        }
        $(document).ready(function () {
            if ($("#" + MasterObj + "txtSurveyAccess").val() == "1") {
                $("#BtnShowCredit").css("display", "inline");
            }
            if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1")
                $("#BtnSave").css("display", "inline");
            $("#BtnSave").click(function () {
                OnClickBtnSave();
            });
            $("#BtnShowCredit").click(function () {
                OnClickBtnShowCredit();
            });
            $(this).click(function (e) {
                var Element = e.srcElement;
                if ($(Element).parent("table").attr("id") != "TblCredits" && $(Element).parent("table").attr("id") != "TblOffer") {
                    $("#PopupCreditType").hide("fast");
                    $("#PopupOffer").hide("fast");
                }
            });
            PageLoad();
            //مدیریت دو حالت ساعتی و روزانه در آیتمهای فیلتر
            $("#ChkTimely").click(function () {
                $("#txtRegTime").attr("disabled", ($(this).attr("checked") ? "" : "disabled"));
            });

            $("#TblMainCredit").keydown(function (e) {
                switch (e.keyCode) {
                    case 34: //Pagedown
                        OnClickBtnPrv();
                        break;
                    case 33: //PageUp
                        OnClickBtnNext();
                        break;
                    case 113: //F2
                        $("#TblMainCredit").find("tr:eq(1)").find("td:eq(0)").children("input:text").focus();
                        break;
                    case 36: //Home
                        $(LastSelectedRow).find("td:eq(0)").children("input:text").focus();
                        break;
                }
            });
            //مدیریت گرید پیشنهادی
            $("#TblCredits").mousedown(function (e) {
                TargetElem = e.srcElement;
                if (TargetElem.tagName == "TD") {
                    LastSelectedRowCredit = $(TargetElem).parent();
                    $("#TblCredits").keydown();
                }
            });
            $("#TblOffer").mousedown(function (e) {
                TargetElem = e.srcElement;
                if (TargetElem.tagName == "TD") {
                    LastSelectedRowOffer = $(TargetElem).parent();
                    $("#TblOffer").keydown();
                }
            });

            //تغییر نوع مجوز از ساعتی به روزانه و بالعکس باید کمبوی نوع مجوز در آیتمهای فیلتر را مجددا لود کند
            $('[name="ChkGroupCodeType"]').change(function () {
                onchangeCodeGroup();
            });
            //دکمه فیلتر 
            $("#BtnFilter").click(function () {
                if (SubmitType != "Paging") {
                    PageNumber = 1;
                }
                else SubmitType = "";
                //$("#txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
                $("#txtSDate").val(ReverceDate($("#TxtStartDate").val()));
                //$("#txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
                $("#txtEDate").val(ReverceDate($("#TxtEndDate").val()));
                $("#txtPersonCode").val($("#" + MasterObj + "CmbPersonCode_txtCode").val())
                //---نوع فیلتر جدید
                if ($("#CmbRegister").val() == 0) {
                    ClearGrid();
                    $("#TRInsert").css("display", "inline");
                    Clear($("#TRInsert"));
                    $("#TRPaging").css("visibility", "hidden");
                    $("#txtPersonCodeNew").select();
                    $("#txtPersonCodeNew").focus();
                    XmlBatchSave.Context = "";
                    Counter = 0;
                }
                else {
                    if ($("#txtSDate").val() == "//" || $("#txtEDate").val() == "//")
                        alert("تاریخ شروع و خاتمه جستجو را وارد کنید ");
                    else if (($("#CmbRegister").val() == "2") && ($("#" + MasterObj + "CmbCodeGroupCode").val() == 0 || $("#" + MasterObj + "CmbCodeGroupCode").val() == ""))
                        alert("گروه مجوز را انتخاب کنید")
                    else {
                        XmlBatchSave.Context = "";
                        Counter = 0;
                        $("#TRInsert").css("display", "none");
                        OpenModelPopup();

                        var DailyTimely
                        var ISTimely = $("#ChkTimely").attr("checked") ? 1 : 0; //--1:Daily ---0:Timely---2:Both
                        var ISDaily = $("#ChkDaily").attr("checked") ? 1 : 0;
                        if ((ISTimely == 1 && ISDaily == 1) || (ISTimely == 0 && ISDaily == 0))
                            DailyTimely = 2;
                        else DailyTimely = ISTimely == 1 ? 0 : 1;

                        $.ajax({
                            type: "POST",
                            url: "AdminCreditNew.aspx/BindGrid?SubmitMode=Ajax",
                            contentType: "application/json; charset=utf-8",
                            data: "{SDate:'" + $("#txtSDate").val() + "' ,EDate:'" + $("#txtEDate").val() + "',PersonCode:'" + $("#txtPersonCode").val() + "' ,GroupPerson:" + $("#" + MasterObj + "CmbGroup").val() + " ,GroupCodeID:" + $("#" + MasterObj + "CmbCodeGroupCode").val() + " ,CodeGroupCodeID:" + $("#CmbCreditType").val() + ",DateOrder:" + $("#CmbOrder").val() + ",IsRegister:" + $("#CmbRegister").val() + ",DeptID:" + $("#" + MasterObj + "CmbDepartment").val() + " ,PageNumber:" + PageNumber + ",RengTime:'" + $("#txtRegTime").val() + "',DailyTimely:" + DailyTimely + ",CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                            success: function (Data) {
                                while (Data.d.indexOf("كدهاي") != -1) {
                                    Data.d = Data.d.replace("كدهاي", "");
                                }
                                CreateGrid(Data.d);
                                CloseModelPopup();

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                                CloseModelPopup();
                            }
                        });
                    }
                }
            });
            //با فوکوس در هر آیتم گرید باید متن داخل آن انتخاب شود و سطر آن نیز انتخاب گردد
            $(".CssInsertNewItem").focus(function () {
                SetFocusItem(this);
            });
            //روی گرید اصلی ArrowKeyاینتر فوکوس و      
            $(document).delegate(".CssInsertNewItem", "keydown", function (e) {

                var KeyCode = e.keyCode;

                if (KeyCode == undefined) KeyCode = 13;

                var Row = $(this).parent().parent();

                if (KeyCode == 13) {
                    switch ($(this).parent().index()) {
                        case 0:
                            if ($("#ChkGroupCode").attr("checked")) Row.find("td:eq(2)").children().keydown();
                            else Row.find("td:eq(2)").children().focus();
                            break;
                        case 2:
                            if ($("#ChkSDate").attr("checked")) Row.find("td:eq(3)").children().keydown();
                            else Row.find("td:eq(3)").children().focus();
                            break;
                        case 3:
                            if ($("#ChkEDate").attr("checked")) Row.find("td:eq(4)").children().keydown();
                            else Row.find("td:eq(4)").children().focus();
                            if (Row.find("td:eq(3)").children().val() == "")
                                GetOfferGrid(Row.find("td:eq(3)").children());
                            break;
                        case 4:
                            if ($("#ChkSTime").attr("checked")) Row.find("td:eq(5)").children().keydown();
                            else Row.find("td:eq(5)").children().focus();
                            if (Row.find("td:eq(4)").children().val() == "")
                                GetOfferGrid(Row.find("td:eq(4)").children());
                            break;
                        case 5:
                            if ($("#ChkETime").attr("checked")) Row.find("td:eq(6)").children().keydown();
                            else Row.find("td:eq(6)").children().focus();
                            break;
                        case 6:
                            if ($("#ChkCreditType").attr("checked")) Row.find("td:eq(8)").children().keydown();
                            else Row.find("td:eq(8)").children().focus();
                            break;
                        case 8:
                            if ($("#ChkDescript").attr("checked")) Row.find("td:eq(9)").children().keydown();
                            else Row.find("td:eq(9)").children().focus();
                            if (Row.find("td:eq(8)").children().val() == "")
                                CreatePopupCreditType(Row.find("td:eq(8)").children());
                            break;
                        case 9:
                            if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") {
                                if ($(Row).attr("id") == "TRInsert") {
                                    var Row = $(this).parent().parent();
                                    if (NotEmpty(Row, 2)) {
                                        var GrouCode = $(Row).find("td:eq(2)").children();
                                        var JSonObj = "{'AdminCredit' : [{'CreditID' : '" + $(Row).attr("creditid") + "','PersonelNo' : '" + $(Row).attr("pcode") + "','PersonelName' : '" + $(Row).find("td:eq(1)").text() + "','Type' : '" + $(Row).find("td:eq(2)").children().val() + "','StartDate' : '" + $(Row).find("td:eq(3)").children().val() + "','EndDate' : '" + $(Row).find("td:eq(4)").children().val() + "','StartTime' : '" + $(Row).find("td:eq(5)").children().val() + "','EndTime' : '" + $(Row).find("td:eq(6)").children().val() + "','Code' : '" + $(Row).find("td:eq(8)").children().val() + "','CID' : '" + $(Row).find("td:eq(8)").children().attr("CodeID") + "','Des' : '" + $(Row).find("td:eq(9)").children().val() + "','Value' : '" + $(Row).find("td:eq(7)").text() + "','GroupName' : '" + $(GrouCode[0].all(GrouCode[0].selectedIndex)).text() + "'}]}";
                                        var myObjectjson = eval('(' + JSonObj + ')');
                                        AddRow(myObjectjson.AdminCredit[0], "Save", 1);
                                        Clear(Row);
                                    }
                                }
                            }
                            else
                                OnClickBtnSave(this, $(this).parent().parent().attr("id") == "TRInsert" ? "NewItem" : "");
                            break;
                    }
                }
                else {
                    if (KeyCode == 40) {
                        $("#TblMainCredit").find("tr:eq(" + (Row.index() + 1) + ")").click();
                        $("#TblMainCredit").find("tr:eq(" + (Row.index() + 1) + ")").find("td:eq(" + $(this).parent().index() + ")").children("input:text").focus();
                    }
                    else {
                        if (KeyCode == 38) {
                            $("#TblMainCredit").find("tr:eq(" + (Row.index() - 1) + ")").click();
                            $("#TblMainCredit").find("tr:eq(" + (Row.index() - 1) + ")").find("td:eq(" + $(this).parent().index() + ")").children("input:text").focus();
                        }
                    }
                }
            });
            //تغییر کنترلهای پرسنلی
            $(".CssPersonCode").change(function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
            });
            $(document).delegate(".CssPersonCode", "change", function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
                if ($(this).val() != "")
                    FindPerson(this);
                else {
                    $(this).parent().parent().find("td:eq(1)").text("");
                    $(this).parent().parent().attr("pcode", "");
                }
            });
            //تغییر شرح مجوز 
            $(document).delegate(".CssDescript", "change", function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
            });
            //دکمه های انتخاب پرسنل در ستون پرسنلی
            $(document).delegate(".CssButtonPersonCode", "click", function () {
                var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=1&SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&OnLineUser=" + $("#" + MasterObj + "txtOnlineUser").val() + "&MenuItemID=" + $("#" + MasterObj + "txtPageID").val() + "&OutputFormat=Json";
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
                var SelectedMember = window.showModalDialog(url, "", strOptions)
                if (SelectedMember != undefined) {
                    if (SelectedMember != "{\"Tb\" : ]}") {
                        var myObjectjson = eval('(' + SelectedMember + ')');
                        $(this).parent().children("input:text").val(myObjectjson.Tb[0].PCode);
                        $(this).parent().parent().attr("pcode", myObjectjson.Tb[0].PCode);
                        $(this).parent().next().text(myObjectjson.Tb[0].PName);
                        $(this).parent().children("input:text").keydown();
                    }
                }
            });
            //کنترلهای تاریخ    
            $(document).delegate(".CssDateStyle", "change", function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
                $(this).val(CorrectDate(this, $("#TxtStartDate").val().split('/')[2], $("#TxtStartDate").val().split('/')[1], $("#TxtStartDate").val().split('/')[1]));

                if ($(this).parent().index() == 3) {
                    $(this).parent().parent().attr("date", $(this).val());
                    if ($(this).val() != "")
                        GetExtendedGrid(this);
                    if ($(this).parent().parent().find("td:eq(4)").children().val() == "")
                        $(this).parent().parent().find("td:eq(4)").children().val($(this).val())
                }
            });
            //کنترلهای زمان
            $(".CssTimeStyle").blur(function () {
                if ($(this).val() == "") $(this).val("00:00");
                $(this).parent().parent().find("td:eq(7)").text(GetValue($(this).parent().parent().find("td:eq(5)").find(".CssTimeStyle").val(), $(this).val()));
            });
            $(document).delegate(".CssTimeStyle", "keydown", function () {
                OnKeyDownTime(this);
            });
            $(document).delegate(".CssTimeStyle", "change", function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
                if ($(this).val() == "") $(this).val("00:00");
                Timechk(this);
                $(this).parent().parent().find("td:eq(7)").text(GetValue($(this).parent().parent().find("td:eq(5)").find(".CssTimeStyle").val(), $(this).val()));

            });
            //کنترلهای نوع مجوز
            $(document).delegate(".CssCreditType", "change", function () {
                if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") $(this).parent().parent().attr("changeRow", "1");
                if ($(this).val() != "")
                    FindCredit(this);
            });
            $("#TblOffer").keydown(function (e) {
                var KeyCode = e.keyCode
                if (KeyCode == undefined) KeyCode = 13;

                switch (KeyCode) {
                    case 13: //اینتر				
                        var SDate = $(LastSelectedRowOffer).find("td:eq(0)").text();

                        SDate = SDate.split("/")[2] + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0];
                        var EDate = $(LastSelectedRowOffer).find("td:eq(1)").text();
                        EDate = EDate.split("/")[2] + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0];

                        $(LastSelectedRow).find("td:eq(3)").children().val(SDate);
                        $(LastSelectedRow).find("td:eq(4)").children().val(EDate);
                        $(LastSelectedRow).find("td:eq(5)").children().val($(LastSelectedRowOffer).find("td:eq(2)").text());
                        $(LastSelectedRow).find("td:eq(6)").children().val($(LastSelectedRowOffer).find("td:eq(3)").text());
                        $(LastSelectedRow).attr("date", $(LastSelectedRowOffer).find("td:eq(0)").text());
                        $(LastSelectedRow).find("td:eq(6)").children().change();
                        GetExtendedGrid($(LastSelectedRow).find("td:eq(3)").children());
                        onclickBtnCloseOffer();
                        $(LastSelectedRow).find("td:eq(8)").children().focus();
                        break;
                    case 38: //Arrow بالا
                        if (($(LastSelectedRowOffer).index() - 1) >= 1) {
                            if (LastSelectedRowOffer != "") $(LastSelectedRowOffer).removeClass("CssSelectedRow");
                            LastSelectedRowOffer = $(this).find("tr:eq(" + ($(LastSelectedRowOffer).index() - 1) + ")");
                            $(LastSelectedRowOffer).addClass("CssSelectedRow")
                        }
                        break;
                    case 40: //Arrow پایین
                        if ($(this).find("tr").length >= ($(LastSelectedRowOffer).index() + 1)) {
                            if (LastSelectedRowOffer != "") $(LastSelectedRowOffer).removeClass("CssSelectedRow");
                            LastSelectedRowOffer = $(this).find("tr:eq(" + ($(LastSelectedRowOffer).index() + 1) + ")");
                            $(LastSelectedRowOffer).addClass("CssSelectedRow")
                        }
                        break;
                    case 27: //Escape--بسته شدن گرید
                        onclickBtnCloseOffer();
                        $(LastSelectedRow).find("td:eq(3)").children().focus();
                        break;
                }
            });
            //مدیریت گرید نوع مجوزها 
            $("#TblCredits").keydown(function (e) {
                var KeyCode = e.keyCode;
                if (KeyCode == undefined) KeyCode = 13;
                switch (KeyCode) {
                    case 13: //اینتر
                        $(LastSelectedRow).find("td:eq(8)").children().val($(LastSelectedRowCredit).find("td:eq(1)").text());
                        $(LastSelectedRow).find("td:eq(8)").children().attr("CodeID", $(LastSelectedRowCredit).find("td:eq(2)").text());
                        onclickBtnCloseDesc();
                        $(LastSelectedRow).find("td:eq(9)").children().focus();
                        break;
                    case 38: //Arrow  بالا
                        if (($(LastSelectedRowCredit).index() - 1) >= 1) {
                            if (LastSelectedRowCredit != "") $(LastSelectedRowCredit).removeClass("CssSelectedRow");
                            LastSelectedRowCredit = $(this).find("tr:eq(" + ($(LastSelectedRowCredit).index() - 1) + ")");
                            $(LastSelectedRowCredit).addClass("CssSelectedRow")
                        }
                        break;
                    case 40: //Arrow پایین 
                        if ($(this).find("tr").length >= ($(LastSelectedRowCredit).index() + 1)) {
                            if (LastSelectedRowCredit != "") $(LastSelectedRowCredit).removeClass("CssSelectedRow");
                            LastSelectedRowCredit = $(this).find("tr:eq(" + ($(LastSelectedRowCredit).index() + 1) + ")");
                            $(LastSelectedRowCredit).addClass("CssSelectedRow")
                        }
                        break;
                    case 27: //Escape
                        onclickBtnCloseDesc();
                        $(LastSelectedRow).find("td:eq(8)").children().focus();
                        break;
                }
            });
        });
        //--------------------------------------------------توابع --------------------------------------------------------------
        //انتخاب متن داخل هر آیتم و سطر معادل با فوکوس آن آیتم
        function SetFocusItem(SelecteItem) {
            //انتخاب سطر 
            $(SelecteItem).select();
            if (LastSelectedRow != "") $(LastSelectedRow).removeClass("CssSelectedRow");
            LastSelectedRow = $(SelecteItem).parent().parent();
            $(LastSelectedRow).addClass("CssSelectedRow");
            //لود اطلاعات تکمیلی 
            if (($.trim($(LastSelectedRow).attr("date")) != $.trim($("#TblExtended").attr("date"))) ||
        ($(LastSelectedRow).attr("pcode") != $("#TblExtended").attr("pcode"))) {
                GetExtendedGrid(SelecteItem);
            }
        }
        //با زدن کد مجوز و اینتر نام آن جایگزین شود
        function FindCredit(CreditItem) {
            var GroupCodeItem = $(CreditItem).parent().parent().find("td:eq(2)").children();
            var Data = $(GroupCodeItem[0].all(GroupCodeItem[0].selectedIndex)).attr("Credits");
            var Row = $(CreditItem).parent().parent();
            if (Data != "{\"Credits\" : ]}" && Data != null) {
                var myObjectjson = eval('(' + Data + ')');
                var ISDaily_Or_Timely = (Row.find("td:eq(5)").children().val().trim() == "00:00" && Row.find("td:eq(6)").children().val().trim() == "00:00") ? 1 : 0; //--1:Daily ---0:Timely
                var Flag = false;
                for (var i = 0; i < myObjectjson.Credits.length; i++) {
                    if ((ISDaily_Or_Timely == 1 && myObjectjson.Credits[i].Daily == 1) || (ISDaily_Or_Timely == 0 && myObjectjson.Credits[i].Timely == 1))
                        if ($(CreditItem).val() == myObjectjson.Credits[i].Shortkey || $(CreditItem).val() == myObjectjson.Credits[i].CodeName) {
                            $(CreditItem).val(myObjectjson.Credits[i].CodeName);
                            $(CreditItem).attr("CodeID", myObjectjson.Credits[i].CodeID);
                        }
                }
            }
        }
        //لود نام پرسنلی وقتی کد را تغییر می دهیم
        function FindPerson(PersonCodeObj) {
            var Date = $(PersonCodeObj).parent().parent().find("td:eq(3)").children().val();
            $.ajax({
                type: "POST",
                url: "AdminCreditNew.aspx/GetPesonName?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{PersonCode:'" + $(PersonCodeObj).val() + "',Date:'" + Date + "',OnlineUserID:" + $("#" + MasterObj + "txtOnLineUser").val() + ",CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " }",
                success: function (Data) {

                    var Result = Data.d;
                    var PersonCodePart = Result.split("$$")[0];
                    $(PersonCodeObj).parent().parent().find("td:eq(1)").text(PersonCodePart);

                    if (PersonCodePart != "") {
                        var OtherPart = Result.split("$$")[1];
                        $(PersonCodeObj).parent().parent().attr("pcode", $(PersonCodeObj).val());
                        CreateGridExtended(OtherPart, Date, $(PersonCodeObj).val());
                    }
                    else {
                        $(PersonCodeObj).parent().parent().attr("pcode", "")
                        $(PersonCodeObj).val("");
                        alert("شماره پرسنلی نا معتبر است");
                        $(PersonCodeObj).focus();
                        ClearExtended();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                }
            });
        }
        //----اطلاعات تکمیلی
        function ClearExtended() {
            $(".CssExtendedStyle").remove();
            $("#TblExtended").attr("date", "");
            $("#TblExtended").attr("pcode", "");
        }
        function CreateGridExtended(Data, Date, PersonCode) {
            ClearExtended();
            if (Data != "{\"DetailCredit\" : ]}" && Data != "") {
                var myObjectjson = eval('(' + Data + ')');
                for (var i = 0; i < myObjectjson.DetailCredit.length; i++) {
                    $("#TblExtended").append("<tr class='CssExtendedStyle'><td class='" + (myObjectjson.DetailCredit[i].IsTitle == 1 ? "CssTitleExtended" : "CssItemExtended") + "' >" + myObjectjson.DetailCredit[i].label + "</td></tr>");
                }
                $("#TblExtended").attr("date", Date);
                $("#TblExtended").attr("pcode", PersonCode);
            }
        }
        function GetExtendedGrid(SelectedItem) {

            var Date = $(SelectedItem).parent().parent().find("td:eq(3)").children().val();
            var PersonCode = $(SelectedItem).parent().parent().find("td:eq(0)").children().val();

            if (Date != "" && PersonCode != "") {
                Date = Date.split("/")[0].trim() + "/" + Date.split("/")[1] + "/" + Date.split("/")[2];

                $.ajax({
                    type: "POST",
                    url: "AdminCreditNew.aspx/GetExtendedInfo?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{Date:'" + Date + "',PersonCode:'" + PersonCode + "' }",
                    success: function (Data) {
                        CreateGridExtended(Data.d, Date, PersonCode);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            }
        }
        //-------------گرید پیشنهادی
        function GetOfferGrid(SelectedItem) {
            var Code = $(SelectedItem).parent().parent().find("td:eq(2)").children().val();
            Code = Code == "1" ? "10102" : (Code == "2" ? "10103" : Code);
            $.ajax({
                type: "POST",
                url: "AdminCreditNew.aspx/GetOfferGrid?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{SDate:'" + $("#txtSDate").val() + "',EDate:'" + $("#txtEDate").val() + "',Code:'" + Code + "',PersonCode:'" + $(SelectedItem).parent().parent().attr("pcode") + "' , CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + " , SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " }",
                success: function (Data) {
                    CreateGridOffer(Data.d);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("جستجو با خطا مواجه شد");
                }
            });
        }
        function ClearOfferGrid() {
            $(".OfferTRStyle").remove();
        }
        function CreateGridOffer(Data) {
            ClearOfferGrid();
            if (Data != "{\"Offer\" : ]}" && Data != "") {
                var myObjectjson = eval('(' + Data + ')');
                for (var i = 0; i < myObjectjson.Offer.length; i++) {
                    if (myObjectjson.Offer[i].DATE != undefined) {
                        $("#TblOffer").append("<tr class='OfferTRStyle'><td>" + myObjectjson.Offer[i].DATE + " </td><td>" + myObjectjson.Offer[i].DATE + "</td><td>" + myObjectjson.Offer[i].STime + " </td><td>" + myObjectjson.Offer[i].ETime + "</td></tr>");
                    }
                }
                if ($("#PopupOffer").find("tr").length > 1) {
                    $("#PopupOffer").css("display", "inline");
                    $("#TblOffer").focus();
                    $("#TblOffer").find("tr:eq(1)").addClass("CssSelectedRow");
                    if (LastSelectedRowOffer != "") $(LastSelectedRowOffer).removeClass("CssSelectedRow");
                    LastSelectedRowOffer = $("#TblOffer").find("tr:eq(1)");
                }
            }
        }
        function onclickBtnCloseOffer() {
            $("#PopupOffer").hide("fast");
        }
        function ClearGrid() {
            $(".CssNewRow").remove();
        }
        //ذخیره-
        function OnClickBtnSave(DescriptItem, Type) {
            var Row = $(DescriptItem).parent().parent();
            var XmlSave = "";
            var flag = true;
            if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") {
                if (XmlBatchSave.CreateContext()) {
                    if (XmlBatchSave.ISEmpty()) {
                        alert("موردي براي ذخيره وجود ندارد");
                        flag = false;
                    }
                    else XmlSave = XmlBatchSave.Context;
                }
            }
            else {
                flag = NotEmpty(Row, 2);
                XmlSave = MakeSaveXml(Row);
            }
            if (flag) {
                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "AdminCreditNew.aspx/ModifyCredit?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SaveXML:'" + XmlSave + "',CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + " ,SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                    success: function (Data) {

                        if ($("#" + MasterObj + "txtBatchInsertOption").val() == "1") {
                            SetRowsInfoBatch(Data);
                        } else {
                            var Validate, Message, CreditID;
                            if (Data.d != "{\"ModifyCredit\" : ]}") {
                                var myObjectjson = eval('(' + Data.d + ')');
                                Validate = myObjectjson.ModifyCredit[0].ResultID;
                                Message = myObjectjson.ModifyCredit[0].StrResult;
                                CreditID = myObjectjson.ModifyCredit[0].CreditID;

                            } else Validate = 0;

                            if (Validate == 1) {
                                $(Row).attr("creditid", CreditID);
                                SetMsg(Message);
                                if (Type == "NewItem") {
                                    var GrouCode = $(Row).find("td:eq(2)").children();
                                    var JSonObj = "{'AdminCredit' : [{'CreditID' : '" + CreditID + "','PersonelNo' : '" + $(Row).attr("pcode") + "','PersonelName' : '" + $(Row).find("td:eq(1)").text() + "','Type' : '" + $(Row).find("td:eq(2)").children().val() + "','StartDate' : '" + $(Row).find("td:eq(3)").children().val() + "','EndDate' : '" + $(Row).find("td:eq(4)").children().val() + "','StartTime' : '" + $(Row).find("td:eq(5)").children().val() + "','EndTime' : '" + $(Row).find("td:eq(6)").children().val() + "','Code' : '" + $(Row).find("td:eq(8)").children().val() + "','CID' : '" + $(Row).find("td:eq(8)").children().attr("CodeID") + "','Des' : '" + $(Row).find("td:eq(9)").children().val() + "','Value' : '" + $(Row).find("td:eq(7)").text() + "','GroupName' : '" + $(GrouCode[0].all(GrouCode[0].selectedIndex)).text() + "'}]}";
                                    var myObjectjson = eval('(' + JSonObj + ')');
                                    AddRow(myObjectjson.AdminCredit[0], "Save");
                                    Clear(Row);
                                }
                            } else {
                                $(DescriptItem).parent().parent().find("td:eq(10)").children().attr("Title", Message);
                                alert(Message);

                            }
                        }

                        CloseModelPopup();
                        Counter = 0;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
                        CloseModelPopup();
                    }
                });
            }
        }
        //-------------------------خالی کردن آیتمهای ایجاد---
        function Clear(Row) {
            $(Row).attr("creditid", "");

            if (!$("#ChkPersonCode").attr("checked")) {
                $("#txtPersonCodeNew").val("");
                $(Row).find("td:eq(1)").text("");
                $(Row).attr("pcode", "");
            }
            if (!$("#ChkGroupCode").attr("checked")) {
                $("#CmbGroupCodeNew").index(1);
            }
            if (!$("#ChkSDate").attr("checked")) {
                $("#txtSDateNew").val("");
                $(Row).attr("date", "");
            }
            if (!$("#ChkPersonCode").attr("checked") || !$("#ChkSDate").attr("checked")) {
                ClearExtended();
            }
            if (!$("#ChkEDate").attr("checked")) {
                $("#txtEDateNew").val("");
            }
            if (!$("#ChkSTime").attr("checked")) {
                $("#txtSTimeNew").val("");
            }
            if (!$("#ChkETime").attr("checked")) {
                $("#txtETimeNew").val("");
            }
            if ((!$("#ChkSTime").attr("checked")) || (!$("#ChkETime").attr("checked"))) {
                $(Row).find("td:eq(7)").text("");
            }
            if (!$("#ChkCreditType").attr("checked")) {
                $("#txtCreditTypeNew").val("");
                $("#txtCreditTypeNew").attr("CodeID", "");
            }
            if (!$("#ChkDescript").attr("checked")) {
                $("#txtDescriptNew").val("");
            }
            if (!$("#ChkPersonCode").attr("checked")) $("#txtPersonCodeNew").focus();
            else $("#txtPersonCodeNew").keydown();
        }
        //-----------------ساختن Xml  برای ذخیره آیتم ها
        function MakeSaveXml(Row) {
            var xmlStr;
            var SDate = $(Row).find("td:eq(3)").children().val();
            var EDate = $(Row).find("td:eq(4)").children().val();
//            xmlStr = "<Root><Tb>"
//            + "<PersonCode>" + $(Row).attr("pcode") + "</PersonCode>"
//            + "<StartDate>" + SDate.split("/")[0].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[2] + "</StartDate>"
//            + "<EndDate>" + EDate.split("/")[0].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[2] + "</EndDate>"
//            + "<Type>" + $(Row).find("td:eq(2)").children().val() + "</Type>"
//            + "<CreditType>" + $(Row).find("td:eq(8)").children().attr("CodeID") + "</CreditType>"
//            + "<StartTime>" + $(Row).find("td:eq(5)").children().val() + "</StartTime>"
//            + "<EndTime>" + $(Row).find("td:eq(6)").children().val() + "</EndTime>"
//            + "<Des>" + $(Row).find("td:eq(9)").children().val() + "</Des>"
//            + "<StatusType>" + "Admin" + "</StatusType>"
//            + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
//+ "<CreditID>" + $(Row).attr("creditid") + "</CreditID></Tb></Root>";
            xmlStr="<ReportsEntity><ModifyCreditInput>"
            + "<Type>" + $(Row).find("td:eq(2)").children().val() + "</Type>"
            + "<StartDate>" + SDate.split("/")[2].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0] + "</StartDate>"
            + "<EndDate>" + EDate.split("/")[2].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0] + "</EndDate>"
            + "<CreditType>" + $(Row).find("td:eq(8)").children().attr("CodeID") + "</CreditType>"
            + "<StartTime>" + $(Row).find("td:eq(5)").children().val() + "</StartTime>"
            + "<EndTime>" + $(Row).find("td:eq(6)").children().val() + "</EndTime>"
            + "<Daily>" + (($(Row).find("td:eq(5)").children().val() == "00:00" && $(Row).find("td:eq(6)").children().val()=="00:00")?"1":"2") + "</Daily>"
            + "<Des>" + $(Row).find("td:eq(9)").children().val() + "</Des>"
//            + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
            + "<CreditID>" + ($(Row).attr("creditid") != undefined ? $(Row).attr("creditid") : 0) + "</CreditID>"
            + "<RowIndex>" + $(Row).attr("RowIndex") + "</RowIndex>"
            + "<JPersonelID>0</JPersonelID>"
            + "<MID>" + $(Row).attr("pcode") + "</MID>"
            + "<MType>U</MType>"
            +"<Extended></Extended>"
            + "<SerialNo></SerialNo>"
            + "</ModifyCreditInput></ReportsEntity>";
            return xmlStr;
        }
        //----------------------------
        function AddRow(RowObj, InsertType, changeRow) {
            if (parseInt(Counter) + 1 > parseInt($("#" + MasterObj + "txtInsertCreditCount").val())) {
                if ($("#CmbRegister").val() == 0) {
                    alert('تعداد نباید بیشتر از ' + $("#" + MasterObj + "txtInsertCreditCount").val() + ' رکورد باشد');
                }
            } else {
                var TblInsert = InsertType == "Save" ? $("#TblMainCredit tr:eq(1)") : $("#TblMainCredit tr:last");
                TblInsert.after("<tr  class='CssNewRow' RowIndex='" + (Counter + 1) + "'  changeRow='" + (changeRow != undefined ? changeRow : "0") + "'   valign='top' pcode='" + RowObj.PersonelNo + "' date='" + RowObj.StartDate + "' creditid='" + RowObj.CreditID + "' Type='" + RowObj.Type + "' CodeID='" + RowObj.CID + "'>" +
                " <td class='CssItemSavedStyle' RelatedObj='DivPersonCode' RelatedType='input'  style='width: 80px' align='right'  >" + RowObj.PersonelNo + "</td>" +
                " <td class='CssItemSavedStyle' style='width: 130px' align='right'>" + RowObj.PersonelName + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivCodeGroup' RelatedType='select' style='width:80px' align='right' >" + RowObj.GroupName + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivSDate' RelatedType='input' style='width: 80px' align='right' > " + RowObj.StartDate + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivEDate' RelatedType='input' style='width: 80px' align='right' > " + RowObj.EndDate + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivSTime' RelatedType='input' style='width: 60px' align='right' > " + RowObj.StartTime + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivETime' RelatedType='input' style='width: 60px' align='right' > " + RowObj.EndTime + " </td>" +
                "<td class='CssItemSavedStyle' style='width: 40px' align='right' > " + RowObj.Value + "</td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivCreditType' RelatedType='input' style='width: 100px' align='right' >" + RowObj.Code + "</td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivDescript' RelatedType='input' style='width: 100px;' align='right' title='" + RowObj.Des + "' >" + RowObj.Des.substr(0, 10) + (RowObj.Des.length > 10 ? "..." : "") + "</td>" +
                "<td class='CssItemSavedStyle' style='width: 40px' align='right'> <img src='../../../App_Utility/Images/Icons/Cross.gif' class='CssDeleteRow'/></td></tr>");
                Counter = (Counter + 1);
                TblInsert.next().click(function () {
                    OnClickSavedCell(this);
                });
                TblInsert.next().find("td:eq(10)").find(".CssDeleteRow").click(function () {
                    if ($(this).parent().parent().attr("creditid") == "" || $(this).parent().parent().attr("creditid") == "0") {
                        if (confirm("آیا برای حذف مجوز مطمئن هستید؟")) {
                            XmlBatchSave.Remove($(this).parent().parent().attr("RowIndex"));
                            $(this).parent().parent().remove();
                        }
                    }
                    else {
                        var Descript = prompt("آیا برای حذف مجوز مطمئن هستید؟", "");
                        if (Descript != null) {
                            DelCredit(this);
                        }
                    }
                });
            }
        }
        //------------------------حذف مجوز
        function DelCredit(ImgItem) {
            OpenModelPopup();
            $.ajax({
                type: "POST",
                url: "AdminCreditNew.aspx/DeleteCredit?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{CreditID:'" + $(ImgItem).parent().parent().attr("creditid") + "' , CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + " , SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                success: function (Data) {
                    if (Data.d != "{\"Credits\" : ]}" && Data.d != null) {
                        var myObjectjson = eval('(' + Data.d + ')');
                        if (myObjectjson.ShowMessage[0].Validate == 1) {
                            SetMsg(myObjectjson.ShowMessage[0].Message);
                            XmlBatchSave.Remove($(ImgItem).parent().parent().attr("RowIndex"));
                            $(ImgItem).parent().parent().remove();
                        }
                        else alert(myObjectjson.ShowMessage[0].Message);
                    }
                    CloseModelPopup();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alerts("حذف با خطا مواجه شد");
                    CloseModelPopup();
                }
            });
        }
        function OnClickSavedCell(SelectedRow, SelectItemindex) {

            var RelatedObj = $(SelectedRow).find("[RelatedObj]");
            RelatedObj.each(function () {
                if ($(this).find($(this).attr("RelatedType")).length == 0) {
                    $("#" + $(this).attr("RelatedObj")).children("input:text").val($(this).text());

                    if ($(this).attr("RelatedType") == "select") {
                        $("#" + $(this).attr("RelatedObj")).children().val($(SelectedRow).attr("Type"));
                    }
                    $(this).text("");
                    while ($("#" + $(this).attr("RelatedObj")).html().indexOf("كدهاي") != -1) {
                        $("#" + $(this).attr("RelatedObj")).html($("#" + $(this).attr("RelatedObj")).html().replace("كدهاي", ""))
                    }
                    $(this).append($("#" + $(this).attr("RelatedObj")).html());
                    $(this).children().focus(function () {
                        SetFocusItem(this);
                    });
                    $("#" + $(this).attr("RelatedObj")).focus();
                }
            });
            $(SelectedRow).find("td:eq(8)").children().attr("CodeID", $(SelectedRow).attr("CodeID"));
            $(SelectedRow).find("td:eq(9)").children().val($(SelectedRow).find("td:eq(9)").attr("Title"));
            if (SelectItemindex == 0)
                $(SelectedRow).find("td:eq(0)").children("input:text").focus();
        }
        //---------------------
        function PageLoad() {

            $("#CmbGroupCodeNew").html($("#" + MasterObj + "CmbCodeGroupCode").html());
            $("#CmbGroupCodeNew").find("[value=0]").remove();
            while ($("#CmbGroupCodeNew").html().indexOf("كدهاي") != -1) {
                $("#CmbGroupCodeNew").html($("#CmbGroupCodeNew").html().replace("كدهاي", ""));
            }
            $("#CmbCodeGroupSelected").html($("#" + MasterObj + "CmbCodeGroupCode").html());
            $("#CmbCodeGroupSelected").find("[value=0]").remove();
            //$("#txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
            $("#txtSDate").val(ReverceDate($("#TxtStartDate").val()));
            //$("#txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
            $("#txtEDate").val(ReverceDate($("#TxtEndDate").val()));
            $("#txtPersonCode").val($("#" + MasterObj + "CmbPersonCode_txtCode").val())
            onchangeCodeGroup()
            $("#txtPersonCodeNew").focus();
        }
        //---------------------برای پر کردن گرید نوع مجوز
        function CreatePopupCreditType(CreditTypeItem) {
            var GroupCodeItem = $(CreditTypeItem).parent().parent().find("td:eq(2)").children();
            var Row = $(CreditTypeItem).parent().parent();
            var Credits = $(GroupCodeItem[0].all(GroupCodeItem[0].selectedIndex)).attr("Credits");
            $(".CreditTRStyle").remove();

            if (NotEmpty(Row, 1)) {
                var ISDaily_Or_Timely = (Row.find("td:eq(5)").children().val().trim() == "00:00" && Row.find("td:eq(6)").children().val().trim() == "00:00") ? 1 : 0; //--1:Daily ---0:Timely

                if (Credits != "{\"Credits\" : ]}" && $(GroupCodeItem).val() != "0" && $(GroupCodeItem).val() != "" && Credits != null) {
                    var myObjectjson = eval('(' + Credits + ')');
                    $(myObjectjson.Credits).each(function () {
                        if ((ISDaily_Or_Timely == 1 && this.Daily == 1) || (ISDaily_Or_Timely == 0 && this.Timely == 1))
                            $("#TblCredits").append("<tr class='CreditTRStyle'><td>" + this.Shortkey + " </td><td>" + this.CodeName + "</td> <td style='display:none'>" + this.CodeID + "</td></tr>");
                    });
                    $("#PopupCreditType").css("display", "inline");
                    $("#TblCredits").focus();
                    $("#TblCredits").find("tr:eq(1)").addClass("CssSelectedRow");
                    if (LastSelectedRowCredit != "") $(LastSelectedRowCredit).removeClass("CssSelectedRow");
                    LastSelectedRowCredit = $("#TblCredits").find("tr:eq(1)");
                }
                else {
                    alert("شما دسترسی به هیچ مجوزی ندارید");
                }
            }
        }
        function onclickBtnCloseDesc() {
            $("#PopupCreditType").hide("fast");
        }
//        //--------------------پر کردن نوع مجوز در آیتمهای فیلتر
        function onchangeCodeGroup() {
            var CmbCodeGroup = $("#" + MasterObj + "CmbCodeGroupCode")[0];
            var Credits = "";
            Credits = $(CmbCodeGroup.all(CmbCodeGroup.selectedIndex)).attr("Credits");
            $("#CmbCreditType").html("");
            $("#CmbCreditType").append("<option value=0 >انتخاب نشده</option>");

            var ISTimely = $("#ChkTimely").attr("checked") ? 1 : 0; //--1:Daily ---0:Timely---2:Both
            var ISDaily = $("#ChkDaily").attr("checked") ? 1 : 0;
            if (ISDaily == 0 && ISTimely == 0) {
                ISDaily = 1;
                ISTimely = 1;
            }
            if (Credits != "{\"Credits\" : ]}" && $(CmbCodeGroup).val() != "0" && Credits != null) {
                var myObjectjson = eval('(' + Credits + ')');
                for (var i = 0; i < myObjectjson.Credits.length; i++) {
                    if ((ISDaily == 1 && myObjectjson.Credits[i].Daily == 1) || (ISTimely == 1 && myObjectjson.Credits[i].Timely == 1))
                        $("#CmbCreditType").append("<option value=" + myObjectjson.Credits[i].CodeID + " >" + myObjectjson.Credits[i].CodeName + "</option>");
                }
            }
            if (Credits != "{\"Credits\" : ]}" && $(CmbCodeGroup).val() == "0" && Credits != null) {
                var myObjectjson = eval('(' + Credits + ')');
                for (var i = 0; i < myObjectjson.Credits.length; i++) {
                    if ((ISDaily == 1 && myObjectjson.Credits[i].Daily == 1) || (ISTimely == 1 && myObjectjson.Credits[i].Timely == 1))
                        $("#CmbCreditType").append("<option value=" + myObjectjson.Credits[i].CodeID + " >" + myObjectjson.Credits[i].CodeName + "</option>");
                }
            }
        }
        //---------------------
        function CreateGrid(Data) {
            ClearGrid();
            if (Data != "{\"AdminCredit\" : ]}") {
                var myObjectjson = eval('(' + Data + ')');
                for (var i = 0; i < myObjectjson.AdminCredit.length; i++) {
                    AddRow(myObjectjson.AdminCredit[i]);
                }
                if (myObjectjson.AdminCredit[0].MaxPage > 1) {
                    $("#txtCurPage").val(PageNumber);
                    $("#TotalPage").text(myObjectjson.AdminCredit[0].MaxPage);
                    $("#txtFrom").text(myObjectjson.AdminCredit[0].RowNumber);
                    $("#txtTo").text(myObjectjson.AdminCredit[myObjectjson.AdminCredit.length - 1].RowNumber);
                    $("#txtTotalRow").text(myObjectjson.AdminCredit[0].MaxRow);
                    $("#TRPaging").css("visibility", "visible");
                }
                else {
                    $("#txtCurPage").val("");
                    $("#TotalPage").text("");
                    $("#txtFrom").text("");
                    $("#txtTo").text("");
                    $("#TRPaging").css("visibility", "hidden");
                }
                OnClickSavedCell($("#TblMainCredit").find("tr:eq(2)"), 0);
            }
            else {
                $("#txtCurPage").val("");
                $("#TotalPage").text("");
                $("#txtFrom").text("");
                $("#txtTo").text("");
                $("#TRPaging").css("visibility", "hidden");
            }
        }
        //-----------------چک کردن خالی نبودن آیتمها
        function NotEmpty(Row, Type) {
            if (Type == 1)  //------------چک کردن خالی نبودن گروه مجوز و زمان شروع و خاتمه برای لود گرید نوع مجوز
            {
                if ($(Row).find("td:eq(2)").children().val() == "0" || $(Row).find("td:eq(2)").children().val() == "") {
                    alert("گروه مجوز را انتخاب کنید")
                    $(Row).find("td:eq(2)").children(0).focus();
                    $(Row).find("td:eq(2)").children(0).setActive();
                    return false;
                }
                if ($(Row).find("td:eq(5)").children().val() == "") {
                    alert("ساعت شروع را انتخاب کنید")
                    $(Row).find("td:eq(5)").children("input:text").focus();
                    $(Row).find("td:eq(5)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(6)").children().val() == "") {
                    alert("ساعت خاتمه را انتخاب کنید")
                    $(Row).find("td:eq(6)").children("input:text").focus();
                    $(Row).find("td:eq(6)").children("input:text").select();
                    return false;
                }
                return true;
            }
            if (Type == 2) {//-------------------چک کردن خالی نبودن و متناسب بودن آیتمها در زمان ذخیره

                if ($(Row).attr("PersonCode") == "") {
                    alert("پرسنل را انتخاب کنید")
                    $(Row).find("td:eq(0)").children("input:text").focus();
                    $(Row).find("td:eq(0)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(2)").children().val() == "0" || $(Row).find("td:eq(2)").children().val() == "") {
                    alert("گروه مجوز را انتخاب کنید")
                    $(Row).find("td:eq(2)").children(0).focus();
                    $(Row).find("td:eq(2)").children(0).setActive();
                    return false;
                }
                if ($(Row).find("td:eq(3)").children().val() == "") {
                    alert("تاریخ شروع را انتخاب کنید")
                    $(Row).find("td:eq(3)").children("input:text").focus();
                    $(Row).find("td:eq(3)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(4)").children().val() == "") {
                    alert("تاریخ خاتمه را انتخاب کنید")
                    $(Row).find("td:eq(4)").children("input:text").focus();
                    $(Row).find("td:eq(4)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(5)").children().val() == "") {
                    alert("ساعت شروع را انتخاب کنید")
                    $(Row).find("td:eq(5)").children("input:text").focus();
                    $(Row).find("td:eq(5)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(6)").children().val() == "") {
                    alert("ساعت خاتمه را انتخاب کنید")
                    $(Row).find("td:eq(6)").children("input:text").focus();
                    $(Row).find("td:eq(6)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(8)").children().val() == "") {
                    alert("نوع مجوز را انتخاب کنید")
                    $(Row).find("td:eq(8)").children("input:text").focus();
                    $(Row).find("td:eq(8)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(3)").children().val().split("/")[2].trim() + "/" + $(Row).find("td:eq(3)").children().val().split("/")[1].trim() + "/" + $(Row).find("td:eq(3)").children().val().split("/")[0].trim() > $(Row).find("td:eq(4)").children().val().split("/")[2].trim() + "/" + $(Row).find("td:eq(4)").children().val().split("/")[1].trim() + "/" + $(Row).find("td:eq(4)").children().val().split("/")[0].trim()) {

                    alert("زمان شروع مجوز از زمان خاتمه بزرگتر است")
                    $(Row).find("td:eq(3)").children("input:text").focus();
                    $(Row).find("td:eq(3)").children("input:text").select();
                    return false;
                }
                if ($(Row).find("td:eq(3)").children("input:text").val() == $(Row).find("td:eq(4)").children("input:text").val() && $(Row).find("td:eq(5)").children("input:text").val() > $(Row).find("td:eq(6)").children("input:text").val()) {
                    alert("زمان شروع مجوز از زمان خاتمه بزرگتر است")
                    $(Row).find("td:eq(5)").children("input:text").focus();
                    $(Row).find("td:eq(5)").children("input:text").select();
                    return false;
                }
                //-------------------چک کردن ولید بودن مجوز انتخابی 
                var ISDaily_Or_Timely = ($(Row).find("td:eq(5)").children("input:text").val().trim() == "00:00" && $(Row).find("td:eq(6)").children("input:text").val().trim() == "00:00") ? 1 : 0; //--1:Daily ---0:Timely
                var GroupCodeItem = $(Row).find("td:eq(2)").children();
                var Credits = $(GroupCodeItem[0].all(GroupCodeItem[0].selectedIndex)).attr("Credits");
                var Flag = false;

                var CodeID = $(Row).find("td:eq(8)").children("input:text").val();

                if (Credits != "{\"Credits\" : ]}" && Credits != null) {
                    var myObjectjson = eval('(' + Credits + ')');
                    var i = 0;
                    while (i < myObjectjson.Credits.length && !Flag) {
                        if ((ISDaily_Or_Timely == 1 && myObjectjson.Credits[i].Daily == 1) || (ISDaily_Or_Timely == 0 && myObjectjson.Credits[i].Timely == 1)) {
                            if (CodeID == myObjectjson.Credits[i].CodeID || CodeID == myObjectjson.Credits[i].CodeName)
                                Flag = true;
                        }
                        i++;
                    }
                }
                if (!Flag) {
                    alert("مجوز انتخاب شده نادرست است ")
                    $(Row).find("td:eq(8)").children("input:text").focus();
                    $(Row).find("td:eq(8)").children("input:text").select();
                    return false;
                }
                //---------------------
            }
            return true;
        }
        //-----------------
        function CorrectDate(obj, Year, Month, Day) {
            var sal;
            var Date = "";
            var s = $(obj).val().split('/');
            if ($(obj).val() != "") {
                if (s.length > 3) {
                    $(obj).val() = "";
                    return Date;
                }
                if (s[2] != null) {
                    sal = s[2].split('  ');
                }
                if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
                    obj.value = ""
                    return Date;
                }
                if (s.length == 3) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    if (s[2] == null)
                        Date = Year + "/" + Date
                    if (s[2] != null) {
                        var sal;
                        sal = s[2].split('  ');
                        if (sal[0].length == 0)
                            Date = Year + "/" + Date
                        if (sal[0].length == 1)
                            Date = Year.substr(0, 3) + sal[0] + "/" + Date
                        if (sal[0].length == 2)
                            Date = Year.substr(0, 2) + sal[0] + "/" + Date
                        if (sal[0].length == 3)
                            Date = Year.substr(0, 1) + sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] != "0000")
                            Date = sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] == "0000")
                            Date = Year + "/" + Date
                    }
                }

                if (s.length == 2) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    Date = Year + "/" + Date
                }

                if (s.length == 1) {
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Year + "/" + Month + "/" + Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Year + "/" + Month + "/" + Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Year + "/" + Month + "/" + Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Year + "/" + Month + "/" + Date + "01"
                }

                Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
                return Date;
            }
        }
        //----------------
        //**********************************************************************************************
        function GetValue(STime, ETime) {
            if (STime != "" && ETime != "") { //مقدار عددي از ساعت

                var ValueStime = Math.abs(STime.substring(0, 2)) * 60
                ValueStime = Math.abs(ValueStime) + Math.abs(STime.substring(3, 5))//مقدار عددي تا ساعت

                var ValueEtime = Math.abs(ETime.substring(0, 2)) * 60
                ValueEtime = Math.abs(ValueEtime) + Math.abs(ETime.substring(3, 5))

                //--در حالتیکه تاریخ پایان بزرگتر از تاریخ شروع و ساعت پایان کوچکتر از ساعت شروع می باشد
                if (ValueStime > ValueEtime)
                    ValueEtime = ValueEtime + 1440;

                var Ret = ValueEtime - ValueStime

                if (Ret >= 60) {

                    var s = Ret - Math.floor(Ret / 60) * 60;
                    if (s.toString().length == 1)
                        s = "0" + s
                    Ret = s + " : " + Math.floor(Ret / 60)
                }
                else {
                    if (Ret.toString().length == 1)
                        Ret = "0" + Ret
                    Ret = "00:" + Ret
                }
                if (STime.trim() == "00:00" && ETime.trim() == "00:00")
                    Ret = "روزانه"
                return Ret;
            }
            else
                return "";
        }
        //----------------
        function SetRowsInfoBatch(Data) {
            var ErrorOccur = false;
            if (Data.d != "{\"ModifyCredit\" : ]}") {
                var myObjectjson = eval('(' + Data.d + ')');
                for (var i = 0; i < myObjectjson.ModifyCredit.length; i++) {
                    $("#TblMainCredit").find("[RowIndex='" + myObjectjson.ModifyCredit[i].RowIndex + "']").find("td:eq(10)").find(".CssError").remove();
                    if (myObjectjson.ModifyCredit[i].ResultID == "1") {
                        $("#TblMainCredit").find("[RowIndex='" + myObjectjson.ModifyCredit[i].RowIndex + "']").attr("creditid", myObjectjson.ModifyCredit[i].CreditID);
                        XmlBatchSave.Remove(myObjectjson.ModifyCredit[i].RowIndex);
                        $("#TblMainCredit").find("[RowIndex='" + myObjectjson.ModifyCredit[i].RowIndex + "']").attr("changeRow", "0");
                    }
                    else {
                        ErrorOccur = true;
                        $("#TblMainCredit").find("[RowIndex='" + myObjectjson.ModifyCredit[i].RowIndex + "']").find("td:eq(10)").append("<img src='../../../App_Utility/Images/Icons/SilverSign.GIF' class='CssError' />");
                    }
                    $("#TblMainCredit").find("[RowIndex='" + myObjectjson.ModifyCredit[i].RowIndex + "']").find("td:eq(10)").attr("title", myObjectjson.ModifyCredit[i].StrResult);
                }
                if (ErrorOccur)
                    alert("برخی مجوزها ذخیره نشد");
            }
        }
        //-----------------------
        function OnClickBtnShowCredit() {

            if (!(LastSelectedRow == null || LastSelectedRow == undefined || LastSelectedRow == "")) {
                var SDate = $(LastSelectedRow).find("td:eq(3)").children().val();
                var EDate = $(LastSelectedRow).find("td:eq(4)").children().val();
                SDate = SDate.split("/")[2] + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0]
                EDate = EDate.split("/")[2] + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0]
                var PersonCode = $(LastSelectedRow).attr("pcode");
                var PersonName = $(LastSelectedRow).find("td:eq(1)").text();
                if (SDate == "" || EDate == "" || PersonCode == "" || PersonName == "") {
                    alert("اطلاعات وارد شده کافي نمي باشد")
                }
                else {
                    var url = "../../Reports/DocInfo.aspx?PersonCode=" + encode64(PersonCode)
               + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
               + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
               + "&PageMode=1&GrdHeight=480px"
               + "&PersonName=" + PersonName
               + "&SDate=" + encode64(SDate)
               + "&EDate=" + encode64(EDate)
               + "&ModeDaily=1"
               + "&HashFlag=1";
                    window.showModelessDialog(encodeURI(url), window, "dialogHeight: 550px;dialogWidth: 1100px;Bottom:0pX;center: no;help: no;resizable:1;status: no;minimize: yes;");
                }
            }
            else alert("رديف مورد نظر را انتخاب کنيد ")
        }
    </script>
    
    <%--<script src="../../../App_Utility/Scripts/DataEntry/Admin/AdminCreditNew.js?v=35.1" type="text/javascript"></script>--%>
</asp:Content>
