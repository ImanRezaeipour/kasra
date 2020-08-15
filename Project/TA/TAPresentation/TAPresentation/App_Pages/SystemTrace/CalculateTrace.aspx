<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="CalculateTrace.aspx.cs" Inherits="TAPresentation.App_Pages.SystemTrace.CalculateTrace" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .SelectedTabStyle
        {
            background-color: gray;
            color: White;
            border-left: 1px solid yellow;
            border-top: 1px solid yellow;
            border-right: 1px solid yellow;
            border-bottom: 1px solid gray;
        }
        .CssDataRowStyle
        {
            background-color: White;
        }
        .CssSelectedItemStyles
        {
            direction: rtl;
            background-color: #FFD599;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="Base">
        <!---------------فیلترینگ---------------->
        <div>
            <table>
                <td>
                    پرسنلي:
                </td>
                <td>
                    <uc4:ComboBox ID="CmbPerson" runat="server" />
                </td>
                <td>
                    تاريخ:
                </td>
                <td>
                    <uc3:KCalendar ID="KCalDate" runat="server" />
                </td>
            </table>
        </div>
        <br />
        <!---------------ToolBar------------------->
        <div>
            <uc1:ToolBar ID="OToolBar" runat="server" />
        </div>
        <!---------------گرید ها ---------------->
        <div id="DivGrid">
            <table width="600px" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="GrdCard" class="CssTabStyle" align="center" style="width: 200px; cursor: hand;
                        font-weight: bold;" hasload="0">
                        <br style="font-size: 9" />
                        محاسبه تا مرحله زوج کردن کارتها
                    </td>
                    <td id="GrdEnd" class="CssTabStyle" align="center" style="width: 200px; cursor: hand;
                        font-weight: bold;" hasload="0">
                        <br style="font-size: 9" />
                        محاسبه تا مرحله آخر
                    </td>
                    <td id="GrdCode" class="CssTabStyle" align="center" style="width: 200px; cursor: hand;
                        font-weight: bold;" hasload="0">
                        <br style="font-size: 9" />
                        گزارش کدها
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="CssGrdStyle" width="1100px" style="height: 400px;
                display: none; border-left: 1px solid yellow; border-bottom: 1px solid yellow;
                border-right: 1px solid yellow; border-top: 1px solid yellow;" id="TBLGrdCard"
                bgcolor="gray">
                <tr>
                    <td valign="top">
                        <fieldset>
                            <legend style="color: White">اطلاعات محاسبه شده </legend>
                            <table id="TBLStructure">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        شيفت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        کد ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        زير ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        ترددها
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset>
                            <legend style="color: White">قوانين مرحله تعيين ساختار روزهاي محاسبه و زوج کردن کارتها و تعیین مجوزها</legend>
                            <table id="TBLScript">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 170px" align="center">
                                        مرحله
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 170px" align="center">
                                        نام قانون
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px" align="center">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px" align="center">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 50px" align="center">
                                        اولويت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 240px" align="center">
                                        مشمولين
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 330px" align="center">
                                        شرح قانون
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset>
                            <legend style="color: White">تنظيمات</legend>
                            <table id="TBLOption">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 160px" align="center">
                                        نام
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        مقدار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 505px" align="center">
                                        شرح
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 250px" align="center">
                                        زير سيستم
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="CssGrdStyle" width="1100px" style="height: 400px;
                border-left: 1px solid yellow; border-bottom: 1px solid yellow; border-right: 1px solid yellow;
                border-top: 1px solid yellow; display: none" id="TBLGrdEnd" bgcolor="gray">
                <tr>
                    <td valign="top">
                        <fieldset>
                            <legend style="color: White">نمايش فرايند محاسبه</legend>
                            <table id="TBLCalc">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        مرحله اجرا
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 300px" align="center">
                                        قانون
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        نمايش نتايج
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 250px" align="center">
                                        توضيحات
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="CssGrdStyle" width="1100px" style="height: 400px;
                border-left: 1px solid yellow; border-bottom: 1px solid yellow; border-right: 1px solid yellow;
                border-top: 1px solid yellow; display: none" id="TBLGrdCode" bgcolor="gray">
                <tr>
                    <td valign="top">
                        <fieldset>
                            <legend style="color: White"> <img id="imgEmployeeStatus" statusdisplay="1"
                                src="../../App_Utility/Images/Icons/AddOk.png" width="20px" onclick="OnClickImgGrdStatus(this,'TBLFisrtCode',0)" /> گزارش کدهايِ اولیه</legend>
                            <table id="TBLFisrtCode">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        تاريِخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        از ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تا ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        نوع ساختار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        حضور
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        مقدار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        مقدار ساعتی
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        کد مجوز
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 300px" align="center">
                                        نام مجوز
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        کد نهاييِ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 300px" align="center">
                                        نام کد نهايِيِ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 250px" align="center">
                                        مرحله اجرا
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 250px" align="center">
                                        نام قانون
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset>
                            <legend style="color: White"><img id="img1" statusdisplay="1"
                                src="../../App_Utility/Images/Icons/AddOk.png" width="20px" onclick="OnClickImgGrdStatus(this,'TBLTimeCode',0)" /> گزارش کدهايِ ساعتيِ </legend>
                            <table id="TBLTimeCode">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        از ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تا ساعت
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مقدار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        مقدار ساعتيِ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مرحله اجرا
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام قانون
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset>
                            <legend style="color: White"> <img id="img2" statusdisplay="1"
                                src="../../App_Utility/Images/Icons/AddOk.png" width="20px" onclick="OnClickImgGrdStatus(this,'TBLDailyCode',0)" />گزارش کدهايِ روزانه</legend>
                            <table id="TBLDailyCode">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مقدار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        مقدار ساعتيِ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مرحله اجرا
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام قانون
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset>
                            <legend style="color: White"> <img id="img3" statusdisplay="1"
                                src="../../App_Utility/Images/Icons/AddOk.png" width="20px" onclick="OnClickImgGrdStatus(this,'TBLPeriodCode',0)" />گزارش کدهايِ دوره ايِ</legend>
                            <table id="TBLPeriodCode">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                        دوره
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام کد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مقدار
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                        مقدار ساعتيِ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                        مرحله اجرا
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 360px" align="center">
                                        نام قانون
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <div style="display: none">
            <cc1:MySecurity ID="OnLineUser" runat="server">
            </cc1:MySecurity>
            <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
            <input type="text" id="txtPageID" name="txtPageID" runat="server" />
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <input type="text" id="txtCardInfo" name="txtCardInfo" runat="server" />
            <input type="text" id="txtEndInfo" name="txtEndInfo" runat="server" />
            <input type="text" id="txtCodeInfo" name="txtCodeInfo" runat="server" />
            <input type="text" id="txtDate" name="txtDate" runat="server" />
            <input type="text" id="txtEndStep" name="txtEndStep" runat="server" />
            <input type="text" id="txtStyleXml" name="txtStyleXml" runat="server" />
        </div>
    </div>
     <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
    <script src="../../App_Utility/Scripts/SystemTrace/CalculateTrace.js" type="text/javascript"></script>
</asp:Content>
