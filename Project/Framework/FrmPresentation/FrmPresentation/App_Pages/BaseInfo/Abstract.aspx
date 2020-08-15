<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Abstract.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Abstract" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .TableValign
        {
            vertical-align: bottom;
        }
    </style>
    <link href="../../App_Utility/Styles/snapStyle.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Utility/Styles/ComponentArt/Tab/tabStyle.css" type="text/css"
        rel="stylesheet" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-blue.css"
        title="winter" />

    <script src="../../App_Utility/Calendar/Script/KCalendar.js" type="text/javascript"></script>

    <script src="../../App_Utility/Calendar/Script/SPECIAL_DAYS.js" type="text/javascript"></script>

    <script src="../../App_Utility/Calendar/Script/CalScript.js" type="text/javascript"></script>

    <script src="../../App_Utility/Scripts/Date.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td valign="top" id="TopColumn" style="width: 700px;">
                <table width="100%">
                    <tr>
                        <td align="left">
                            تاريخ:
                        </td>
                        <td id="EnterDate" align="right" class="lbl">
                        </td>
                        <td align="right">
                            زمان ورود:
                        </td>
                        <td id="EnterTime" style="width: 40px" align="right" class="lbl">
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr align="right">
                        <td align="left" class="link" onclick="onclickSend(13)">
                            کاربر:
                        </td>
                        <td style="width: 80px" id="PersonName" align="right" class="lbl">
                        </td>
                        <td align="right" class="link" onclick="onclickSend(10)">
                            نام جانشين:
                        </td>
                        <td style="width: 80px" id="CName" align="right" class="lbl">
                        </td>
                        <td align="left" class="link" onclick="onclickSend(11)">
                            تفويض اختيار:
                        </td>
                        <td style="width: 80px" id="COName" align="right" class="lbl">
                        </td>
                        <td align="left" class="link" onclick="onclickSend(12)">
                            مانده مرخصي:
                        </td>
                        <td style="width: 50px" id="RemainRest" dir="rtl" align="right" class="lbl">
                        </td>
                    </tr>
                    <tr id="TRAdminMsg">
                        <td>
                            پيام مدير سيستم:
                        </td>
                        <td colspan="7">
                            <div id="AdminMsg" dir="rtl" align="right" class="lbl">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <table class="pghbg" cellpadding="10">
                    <tr>
                        <td valign="top">
                            <table style="width: 700px; height: 90%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="bottom">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr style="height: 30px">
                                                <td id="Request" onmouseover="onmouseoverUpDown(this)" onmouseout="onmouseoutUpDown(this)"
                                                    onclick="onclickRequest(this,1)" class="DefaultTab">
                                                    درخواستهای رسيده&nbsp;(<asp:Label ID="LBL1" runat="server" Text=""></asp:Label>)
                                                </td>
                                                <td onmouseover="onmouseoverUpDown(this)" onmouseout="onmouseoutUpDown(this)" onclick="onclickRequest(this,2)"
                                                    class="DefaultTab">
                                                    حاضرين&nbsp;(<asp:Label ID="LBLUp2" runat="server" Text=""></asp:Label>)/غايبين&nbsp;(<asp:Label
                                                        ID="LBLDown2" runat="server" Text=""></asp:Label>)
                                                </td>
                                                <td onmouseover="onmouseoverUpDown(this)" onmouseout="onmouseoutUpDown(this)" onclick="onclickRequest(this,3)"
                                                    class="DefaultTab">
                                                    پيام ها&nbsp;(<asp:Label ID="LBLUp3" runat="server" Text=""></asp:Label>) و رويدادها&nbsp;(<asp:Label
                                                        ID="LBLDown3" runat="server" Text=""></asp:Label>)
                                                </td>
                                                <td onmouseover="onmouseoverUpDown(this)" onmouseout="onmouseoutUpDown(this)" onclick="onclickRequest(this,4)"
                                                    class="DefaultTab">
                                                    مجوزهاي در جريان&nbsp;(<asp:Label ID="LBL4" runat="server" Text=""></asp:Label>)
                                                </td>
                                                <td onmouseover="onmouseoverUpDown(this)" onmouseout="onmouseoutUpDown(this)" onclick="onclickRequest(this,5)"
                                                    class="DefaultTab">
                                                    مجوزهاي مورد نياز&nbsp;(<asp:Label ID="LBL5" runat="server" Text=""></asp:Label>)
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 100%">
                                    <td align="center" valign="top" class="BorderGrid">
                                        <table width="100%" style="height: 350px;" class="TableBase">
                                            <tr>
                                                <td valign="top">
                                                    <!-----------------------------------------------------------درخواستهای رسيده------------------------------------------->
                                                    <div id="DivRequest" style="display: inline">
                                                        <table id="TBLUp1" style="display: inline; width: 90%; height: 20px">
                                                            <tr valign="top" style="height: 10px">
                                                                <td align="right" valign="top" colspan="4" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onmouseout="onmouseoutHideShow(this)" onmouseover="onmouseoverHideShow(this)"
                                                                                onclick="onclickHideShow(this,'Up1')">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;روزانه&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                (&nbsp;
                                                                            </td>
                                                                            <td id="TDCountUp1">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px">
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    نوع درخواست
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    تاريخ درخواست
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 25%">
                                                                    درخواست کننده
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 35%">
                                                                    شرح درخواست
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivUp1" style="height: 120px; display: inline; width: 90%;" class="WhiteScroll">
                                                            <table id="TBLDataUp1">
                                                            </table>
                                                        </div>
                                                        <table id="TBLDown1" style="display: inline; width: 90%; height: 40px" cellpadding="1"
                                                            cellspacing="1" class="TableValign">
                                                            <tr style="height: 20px">
                                                                <td colspan="8" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Down1')" onmouseout="onmouseoutHideShow(this)"
                                                                                onmouseover="onmouseoverHideShow(this)">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;ساعتي&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                ( &nbsp;
                                                                            </td>
                                                                            <td id="TDCountDown1">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 20px">
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    نوع درخواست
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    تاريخ درخواست
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 5%">
                                                                    از &nbsp;&nbsp;
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 5%">
                                                                    تا &nbsp;&nbsp;
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    درخواست کننده
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 30%">
                                                                    شرح درخواست
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivDown1" style="height: 120px; display: inline; width: 90%;" class="WhiteScroll">
                                                            <table id="TBLDataDown1">
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-----------------------------------------------------------حاضرین /غایبین------------------------------------------->
                                                    <div id="DivAbsentPresent" style="display: none;" class="TableValign">
                                                        <table id="TBLDown2" style="display: inline; width: 95%; height: 20px">
                                                            <tr style="height: 10px">
                                                                <td colspan="6" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                &nbsp;غايبين&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                ( &nbsp;
                                                                            </td>
                                                                            <td id="TDCountDown2">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px">
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    نام فرد
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 29%">
                                                                    تردد
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 19%">
                                                                    شيفت
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    حضور
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    مازاد حضور
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    کسر حضور
                                                                </td>
                                                                <td style="width: 10%">
                                                                    &nbsp; &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivDown2" style="display: inline; height: 270; width: 95%;" class="WhiteScroll">
                                                            <table id="TBLDataDown2" style="width: 90%;">
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-----------------------------------------------------------پیام ها و رویدادها------------------------------------------->
                                                    <div id="DivMessage" style="display: none">
                                                        <table id="TBLUp3" style="display: inline; width: 90%; height: 20px">
                                                            <tr style="height: 10px">
                                                                <td align="right" colspan="3" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Up3')" onmouseout="onmouseoutHideShow(this)"
                                                                                onmouseover="onmouseoverHideShow(this)">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                            </td>
                                                                            <td class="LinkText" onclick="onclickSend(9)">
                                                                                &nbsp;پيام ها&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                (&nbsp;
                                                                            </td>
                                                                            <td id="TDCountUp3">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px">
                                                                <td class="CssHeaderStyle" style="width: 20%">
                                                                    فرستنده
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 80%">
                                                                    شرح
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivUp3" style="display: inline; height: 120px; width: 90%;" class="WhiteScroll">
                                                            <table id="TBLDataUp3">
                                                            </table>
                                                        </div>
                                                        <table id="TBLDown3" style="display: inline; width: 90%; height: 20px">
                                                            <tr style="height: 10px">
                                                                <td colspan="4" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Down3')" onmouseout="onmouseoutHideShow(this)"
                                                                                onmouseover="onmouseoverHideShow(this)">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;رويدادها&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td id="TDCountDown3">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px; width: 90%">
                                                                <td class="CssHeaderStyle">
                                                                    نام قانون
                                                                </td>
                                                                <td class="CssHeaderStyle">
                                                                    متن پيام
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivDown3" style="display: inline; height: 120px; width: 90%" class="WhiteScroll">
                                                            <table id="TBLDataDown3">
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-----------------------------------------------------------مجوزهای در جریان------------------------------------------->
                                                    <div id="DivCurCredit" style="display: none">
                                                        <table id="TBLUp4" style="display: inline; width: 90%; height: 20px">
                                                            <tr style="height: 10px">
                                                                <td align="right" colspan="5" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Up4')" onmouseout="onmouseoutHideShow(this)"
                                                                                onmouseover="onmouseoverHideShow(this)">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                            </td>
                                                                            <td class="LinkText" onclick="onclickSend(20)">
                                                                                &nbsp;کسر حضور&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                (&nbsp;
                                                                            </td>
                                                                            <td id="TDCountUp4">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;مجموع:&nbsp;&nbsp;
                                                                            </td>
                                                                            <td id="TDSumUp4">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px">
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    تاريخ
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    از ساعت
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    تا ساعت
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 35%">
                                                                    آخرين تاييد کننده
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 35%">
                                                                    منتظر تاييد
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivUp4" style="display: inline; height: 120px; width: 90%;" class="WhiteScroll">
                                                            <table id="TBLDataUp4">
                                                            </table>
                                                        </div>
                                                        <table id="TBLDown4" style="display: inline; width: 90%; height: 20px">
                                                            <tr style="height: 10px">
                                                                <td colspan="5" class="HeaderGrid">
                                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Down4')" onmouseout="onmouseoutHideShow(this)"
                                                                                onmouseover="onmouseoverHideShow(this)">
                                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                            </td>
                                                                            <td class="LinkText" onclick="onclickSend(21)">
                                                                                &nbsp;مازاد حضور&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                ( &nbsp;
                                                                            </td>
                                                                            <td id="TDCountDown4">
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;)
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;مجموع:&nbsp;&nbsp;
                                                                            </td>
                                                                            <td id="TDSumDown4">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 10px">
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    تاريخ
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    از ساعت
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 10%">
                                                                    تا ساعت
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 35%">
                                                                    آخرين تاييد کننده
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 35%">
                                                                    منتظر تاييد
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="DivDown4" style="display: inline; height: 120px; width: 90%" class="WhiteScroll">
                                                            <table id="TBLDataDown4">
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-----------------------------------------------------------مجوزهای مورد نیاز------------------------------------------->
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 50%" valign="top" align="right">
                                                                <div id="DivNeededCredit" style="width: 100%; display: none" align="right">
                                                                    <table id="TBLUp5" style="display: inline; width: 100%; height: 20px">
                                                                        <tr style="height: 10px">
                                                                            <td align="right" colspan="4" class="HeaderGrid">
                                                                                <table align="right" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td style="width: 15px" onclick="onclickHideShow(this,'Up5')" onmouseout="onmouseoutHideShow(this)"
                                                                                            onmouseover="onmouseoverHideShow(this)">
                                                                                            <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                                        </td>
                                                                                        <td class="LinkText" onclick="onclickSend(22)">
                                                                                            &nbsp;کسر حضور&nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            (&nbsp;
                                                                                        </td>
                                                                                        <td id="TDCountUp5">
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;)
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;&nbsp;مجموع:
                                                                                        </td>
                                                                                        <td id="TDSumUp5">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 10px">
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                تاريخ
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                از ساعت
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                تا ساعت
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                مقدار
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <div id="DivUp5" style="display: inline; height: 120px; width: 100%;" class="WhiteScroll">
                                                                        <table id="TBLDataUp5">
                                                                        </table>
                                                                    </div>
                                                                    <table id="TBLDown5" style="display: inline; width: 100%; height: 20px">
                                                                        <tr style="height: 10px">
                                                                            <td colspan="4" class="HeaderGrid">
                                                                                <table align="right" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td style="width: 15px" onclick="onclickHideShow(this,'Down5')" onmouseout="onmouseoutHideShow(this)"
                                                                                            onmouseover="onmouseoverHideShow(this)">
                                                                                            <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                                                        </td>
                                                                                        <td class="LinkText" onclick="onclickSend(23)">
                                                                                            &nbsp;مازاد حضور&nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            ( &nbsp;
                                                                                        </td>
                                                                                        <td id="TDCountDown5">
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;)
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;&nbsp;مجموع:
                                                                                        </td>
                                                                                        <td id="TDSumDown5">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 10px">
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                تاريخ
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                از ساعت
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                تا ساعت
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 25%">
                                                                                مقدار
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <div id="DivDown5" style="display: inline; height: 120px; width: 100%;" class="WhiteScroll">
                                                                        <table id="TBLDataDown5">
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td style="width: 50%" valign="top">
                                                                <div id="DivOccure" style="width: 100%; height: 100%; display: inline">
                                                                    <table style="width: 90%">
                                                                        <tr>
                                                                            <td colspan="2" class="HeaderGrid">
                                                                                محدوديت ثبت مجوزها
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="CssHeaderStyle" style="width: 30%">
                                                                                نام مجوز
                                                                            </td>
                                                                            <td class="CssHeaderStyle" style="width: 70%">
                                                                                شرح محدوديت
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="CssItemStyle">
                                                                            <td class="XTabTable" style="width: 30%;">
                                                                                ماموريت
                                                                            </td>
                                                                            <td class="XTabTable" style="width: 70%;">
                                                                                2روز بعد از اتفاق
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="CssAlternatingItemStyle">
                                                                            <td class="XTabTable" style="width: 30%;">
                                                                                استحقاقي روزانه
                                                                            </td>
                                                                            <td class="XTabTable" style="width: 70%;">
                                                                                7روز بعد از اتفاق
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="CssItemStyle">
                                                                            <td class="XTabTable" style="width: 30%;">
                                                                                ماموريت داخلی
                                                                            </td>
                                                                            <td class="XTabTable" style="width: 70%;">
                                                                                بدون محدوديت
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="CssAlternatingItemStyle">
                                                                            <td class="XTabTable" style="width: 30%;">
                                                                                استحقاقي ساعتي
                                                                            </td>
                                                                            <td class="XTabTable" style="width: 70%;">
                                                                                7روز بعد از اتفاق
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
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
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <a id="Link" href="..\..\App_Utility\Images\Icons\Up3.gif"></a>
        <input type="text" id="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" />
        <a id="LinkDown" href="..\..\App_Utility\Images\Icons\Down3.gif"></a><a id="LinkUp"
            href="..\..\App_Utility\Images\Icons\Up3.gif"></a>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <!------------------------------------------------------------------------------------------>
        <input type="text" id="txtOnlineUserID" name="txtOnlineUserID" runat="server" />
        <input type="text" id="txtWPID" name="txtWPID" runat="server" />
        <input type="text" id="txtAccess" name="txtAccess" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtToday" name="txtToday" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <input type="text" id="txtSendAbstract" name="txtSendAbstract" runat="server" />
        <input type="text" id="txttitleSendAbstract" name="txttitleSendAbstract" runat="server" />
        <!------------------------------------------------------------------------------------------>
    </div>

    <script src="../../App_Utility/Scripts/BaseInfo/Abstract.js" type="text/javascript"></script>

</asp:Content>
