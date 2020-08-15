<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="personelDashboard.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.personelDashboard" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .CssNewRow
        {
            background-color: #C7D0DF;
          
        }
        .CssNewRow2
        {
            background-color: #C7D0DF;
        }
        .CssNewRow3
        {
            background-color: #C7D0DF;
          
        }
        .CssNewRow4
        {
            background-color: #C7D0DF;
        }
         .CssNewRow5
        {
            background-color: #C7D0DF;
        }
        .Tab
        {
            background-position: center center;
            color: #000066;
            background-image: url(../../App_Utility/Images/TabImg/tab_bg2.gif);
            font-size: 12px; /*background-color:#666666;*/
            cursor: hand;
            background-repeat: no-repeat;
            border-right-color: #000066;
            border-right-width: 1px;
            border-right-style: solid;
            border-left-color: #000066;
            border-left-width: 1px;
            border-left-style: solid;
            border-bottom-color: #000066;
            border-bottom-width: 1px;
            border-bottom-style: solid;
        }
        .SelectedTab
        {
            background-position: center center;
            background-repeat: no-repeat;
            border-top-color: #ffc83c;
            border-top-width: 3px;
            border-top-style: solid;
            border-left-color: #ffc83c;
            border-left-width: 1px;
            border-left-style: solid;
            border-right-color: #ffc83c;
            border-right-width: 1px;
            border-right-style: solid;
            color: #000066;
            background-color: White;
            font-size: 12px;
            cursor: hand; /* filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#666666, EndColorStr=white);*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" LoadScriptsBeforeUI="false" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                تاريخ :
            </td>
            <td>
                <uc1:KCalendar ID="KCalDate" runat="server" />
            </td>
            <td>
                پرسنلي :
            </td>
            <td>
                <uc3:ComboBox ID="CmbPerson" runat="server" />
            </td>
            <td>
                <input type="button" onclick="OnClickBtnFilter()" value="فيلتر"
                    
                    style="border: thin groove #000080; width:80px; background-color: #6AB5FF;"/>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td id="TabBaseInfo" align="center" isload="1" onclick="onclickTab(this,'1')" class="Tab"
                style="width: 100px; height: 25px">
                اطلاعات پايه
            </td>
            <td>
                &nbsp
            </td>
            <td id="TabAttendance" align="center" isload="0" onclick="onclickTab(this,'2')" class="Tab"
                style="width: 130px; height: 25px">
                وضعيت ترددها
            </td>
            <td>
                &nbsp
            </td>
            <td id="TabShift" align="center" isload="0" onclick="onclickTab(this,'3')" class="Tab"
                style="width: 100px; height: 25px">
                وضعيت شيفت
            </td>
            <td>
                &nbsp
            </td>
            <td id="TabCredit" align="center" isload="0" onclick="onclickTab(this,'4')" class="Tab"
                style="width: 100px; height: 25px">
                مجوزها
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtXmlGrdInfo" runat="server" />
                        <asp:HiddenField ID="txtXmlAttInfo" runat="server" />
                        <asp:HiddenField ID="txtXmlShiftInfo" runat="server" />
                        <asp:HiddenField ID="txtXmlDocInfo" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" id="Table1" align="center" class="DataTable"
        style="display: none; width: 800px; height: 500px">
        <tr>
            <td id="Td1" style="border: 1px solid #ffc83c;" runat="server" valign="top" align="center">
                <table cellpadding="0" cellspacing="0"  width="100%">
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="imgEmployeeStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png"
                                            width="30px" onclick="OnClickImgGrdStatus(this,'TblBasicInfo',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        وضعيت شخص در سيستم
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblBasicInfo" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        شناسه پرسنلي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        کد پرسنلي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام نام خانوادگي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        تاريخ استخدام
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        تاريخ خاتمه کار
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgDeptStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png"
                                            width="30px" onclick="OnClickImgGrdStatus(this,'TblDepartmentInfo',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        وضعيت شخص در چارت سازماني
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblDepartmentInfo" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        کد پرسنلي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام نام خانوادگي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        کد واحد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نام واحد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نوع سمت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        ارشد
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" id="Table2" align="center" class="DataTable"
        style="display: none; width: 900px;">
        <tr>
            <td id="Td2" style="border: 1px solid #ffc83c;" runat="server" valign="top" align="center">
                <table  width="100%">
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgAttendanceStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png"
                                            width="30px" onclick="OnClickImgGrdStatus(this,'TblAttendance',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        وضعيت ترددها
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="TrAttendanceFilter">
                        <td>
                            <table align="right">
                                <tr>
                                    <td>
                                        شماره کارتخوان :
                                    </td>
                                    <td>
                                        <input type="text" id="txtCardKhanNo" class="TxtControls" style="width: 120px" onkeydown="OnKeyDownInt(this)" />
                                    </td>
                                    <td>
                                        کارت کد :
                                    </td>
                                    <td>
                                        <select id="CmbCardCode" class="TxtControls" style="width: 120px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        وضعيت حذف :
                                    </td>
                                    <td>
                                        <select id="CmbDelStatus" class="TxtControls" style="width: 120px">
                                        </select>
                                    </td>
                                    <td>
                                        وضعيت تاييد :
                                    </td>
                                    <td>
                                        <select id="CmbAcceptStatus" class="TxtControls" style="width: 120px">
                                        </select>
                                    </td>
                                    <td>
                                        <input type="button" value="فيلتر" onclick="OnClickBtnFilterAtt()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                    <td>
                                        <input type="button" value="نمايش همه" onclick="OnClickBtnShowAllAtt()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top" id="TrTblAttendance">
                        <td>
                            <table id="TblAttendance" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        شماره کارت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        نوع تردد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        شماره کارتخوان
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت تاييد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 50px; height: 20px;" align="center" valign="middle">
                                        حذف
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        کارت کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        Pooledrecord
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgToleranceStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png"
                                            width="30px" onclick="OnClickImgGrdStatus(this,'TblTolerance',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        وضعيت تلورانس
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblTolerance" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        ساعت جايگزين
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 50px; height: 20px;" align="center" valign="middle">
                                        فعال
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        توضيحات
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نام
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        نوع
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" id="Table3" align="center" class="DataTable"
        style="display: none; width: 800px;">
        <tr>
            <td id="Td3" style="border: 1px solid #ffc83c;" runat="server" valign="top" align="center">
                <table width="100%">
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgShiftStatus" src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblGroupShift',0)"  statusdisplay="1"/>
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        عضويت فرد در گروه ها
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="TrGroupShiftFilter">
                        <td>
                            <table align="right">
                                <tr>
                                    <td>
                                        گروه :
                                    </td>
                                    <td>
                                        <select id="CmbGroup" class="TxtControls" style="width: 147px">
                                        </select>
                                    </td>
                                    <td>
                                        شيفت :
                                    </td>
                                    <td>
                                        <select id="CmbShift" class="TxtControls" style="width: 147px">
                                        </select>
                                    </td>
                                    <td>
                                        شيفتي
                                        <input type="checkbox" id="chkShift" />
                                    </td>
                                    <td>
                                        غير شيفتي
                                        <input type="checkbox" id="chkNoShift" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        از تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td>
                                        تا تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                    <td>
                                        <input type="button" value="فيلتر" onclick="OnClickBtnFilterGroupShift()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                    <td>
                                        <input type="button" value="نمايش همه" onclick="OnClickBtnShowAllGroupShift()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblGroupShift" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 150px; height: 20px;" align="center" valign="middle">
                                        نام گروه
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نام مخفف
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام دسته
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        کد شيفت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نام شيفت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تاريخ شروع
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgStructureStatus" src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblStructure',0)" statusdisplay="1"  />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                        وضعيت ساختار روز
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="TrStructureFilter">
                        <td>
                            <table align="right">
                                <tr>
                                    <td>
                                        شيفت :
                                    </td>
                                    <td>
                                        <select id="CmbStructureShift" class="TxtControls" style="width: 147px">
                                        </select>
                                    </td>
                                    <td>
                                       ساختار :
                                    </td>
                                    <td>
                                        <select id="CmbStructure" class="TxtControls" style="width: 147px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        از تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalStrSDate" runat="server" />
                                    </td>
                                    <td>
                                        تا تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalStrEDate" runat="server" />
                                    </td>
                                    <td>
                                        <input type="button" value="فيلتر" onclick="OnClickBtnFilterStructure()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                    <td>
                                        <input type="button" value="نمايش همه" onclick="OnClickBtnShowAllStructure()" style="border: thin groove #000080; width:80px; background-color: #ffc83c;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblStructure" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        کد شيفت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                        نام شيفت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        کد ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px; height: 20px;" align="center" valign="middle">
                                        ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px; height: 20px;" align="center" valign="middle">
                                        زير ساختار
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" id="Table4" align="center" class="DataTable"
        style="display: none; width: 800px;">
        <tr>
            <td id="Td4" style="border: 1px solid #ffc83c; height: 90%" runat="server" valign="top" align="center">
                <table  width="100%">
                    <tr>
                        <td>
                            <table align="right" width="100%" cellpadding="0" cellspacing="0">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgCreditStatus"  src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblCredit',0)" statusdisplay="1"/>
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                       مجوزها
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="TrCreditFilter">
                        <td>
                            <table align="right">
                                <tr>
                                    <td>
                                        مجوز :
                                    </td>
                                    <td>
                                        <select id="CmbCredit" class="TxtControls" style="width: 160px">
                                        </select>
                                    </td>
                                    <td>
                                        وضعيت تاييد :
                                    </td>
                                    <td>
                                        <select id="CmbStatus" class="TxtControls" style="width: 140px">
                                        </select>
                                    </td>
                                    <td>
                                        <input type="button" value="فيلتر" onclick="OnClickBtnFilterCredit()" style="border: thin groove #000080;
                                            width: 80px; background-color: #ffc83c;" />
                                    </td>
                                    <td>
                                        <input type="button" value="نمايش همه" onclick="OnClickBtnShowAllCredit()" style="border: thin groove #000080;
                                            width: 80px; background-color: #ffc83c;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblCredit" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        کد مجوز
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام مجوز
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت تاييد
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%"  cellpadding="0" cellspacing="0">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgSchedulChangesStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblSchedulChanges',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                       جابجايي و جايگزيني

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblSchedulChanges" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        ش.متقاضي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام متقاضي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        ش.جانشين
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        جانشين نام
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        نوع
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت تاييد
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%"  cellpadding="0" cellspacing="0">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgReplaceDetailStatus" statusdisplay="1" src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblReplaceDetail',0)" />
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                       تغيير ساختار
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblReplaceDetail" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 120px; height: 20px;" align="center" valign="middle">
                                        ساختار قبلي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 120px; height: 20px;" align="center" valign="middle">
                                        ساختار جديد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        شناسه عضو
                                    </td>
                                       <td class="CssHeaderStyle" style="width: 180px; height: 20px;" align="center" valign="middle">
                                        نام عضو
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        نوع عضويت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت تاييد
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="right" width="100%"  cellpadding="0" cellspacing="0">
                                <tr style="height: 20px;" valign="top">
                                    <td style="width: 20px">
                                        <img id="ImgDayContinuationStatus"  src="../../App_Utility/Images/Icons/AddOk.png" width="30px"
                                            onclick="OnClickImgGrdStatus(this,'TblDayContinuation',0)" statusdisplay="1"/>
                                    </td>
                                    <td style="text-align: right; background-color: #87A3ED; width: 600px" valign="middle">
                                       مداومت کاري
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20px;" valign="top">
                        <td>
                            <table id="TblDayContinuation" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                         تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت تاييد
                                    </td>
                                      <td class="CssHeaderStyle" style="width: 80px; height: 20px;" align="center" valign="middle">
                                        وضعيت حذف
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
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input id="txtOnLineUser" type="text" name="txtOnLineUser" runat="server" />
        <input id="txtDate" type="text" name="txtDate" runat="server" />
         <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/BaseInfo/personelDashboard.js?V=1" type="text/javascript"></script>
</asp:Content>
