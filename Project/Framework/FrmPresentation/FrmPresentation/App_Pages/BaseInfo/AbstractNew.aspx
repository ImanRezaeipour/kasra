<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="AbstractNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.AbstractNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/ComponentArt/Tab/tabStyle.css" type="text/css"
        rel="stylesheet" />
        <link href="../../App_Utility/Styles/StyleForPages.css" type="text/css"
        rel="stylesheet" />
    <link href="../../App_Utility/Styles/snapStyle.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/aqua/theme.css"
        title="Aqua" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-blue.css"
        title="winter" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-blue2.css"
        title="blue" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-brown.css"
        title="summer" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-green.css"
        title="green" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-win2k-1.css"
        title="win2k-1" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-win2k-2.css"
        title="win2k-2" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-win2k-cold-1.css"
        title="win2k-cold-1" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-win2k-cold-2.css"
        title="win2k-cold-2" />
    <link rel="alternate stylesheet" type="text/css" media="all" href="../../App_Utility/Calendar/skins/calendar-system.css"
        title="system" />

    <script src="../../App_Utility/Calendar/Script/KCalendar.js" type="text/javascript"></script>

    <script src="../../App_Utility/Calendar/Script/SPECIAL_DAYS.js" type="text/javascript"></script>

    <script src="../../App_Utility/Calendar/Script/CalScript.js" type="text/javascript"></script>

    <!-- import the Jalali Date Class script -->

    <script type="text/javascript" src="../../App_Utility/Calendar/lang/calendar-fa.js"></script>

    <!-- helper script that uses the calendar -->

    <script type="text/javascript">
        // code to change the active stylesheet
        if (!window.XMLHttpRequest)
            XMLHttpRequest = function() {
                return new ActiveXObject("Microsoft.XMLHTTP");
            };
        /**##################################################################################****************************************************/
        var J0000 = 1721424.5;                // Julian date of Gregorian epoch: 0000-01-01
        var J1970 = 2440587.5;                // Julian date at Unix epoch: 1970-01-01
        var JMJD = 2400000.5;                // Epoch of Modified Julian Date system
        var J1900 = 2415020.5;                // Epoch (day 1) of Excel 1900 date system (PC)
        var J1904 = 2416480.5;                // Epoch (day 0) of Excel 1904 date system (Mac)
        var GREGORIAN_EPOCH = 1721425.5;
        var PERSIAN_EPOCH = 1948320.5;
        var MonthDays = new Array(
        /* فروردين */31,     /* ارديبهشت */31, /* خرداد */31,     /* تير */31,
        /* مرداد */31,     /* شهريور */31, /* مهر */30,     /* آبان */30,
        /* آذر */30,     /* دي */30, /* بهمن */30,     /* اسفند */29)
        /******************************************************/
        //Gregorian 
        var curMDay = 0
        var curMMonth = 0
        var curMYear = 0
        /******************************************************/
        //Persian
        var curPDay = 0
        var curPMonth = 0
        var curPYear = 0
        /******************************************************/
        var oldPDay = 0
        var oldPMonth = 0
        var oldPYear = 0
        var newPDay = 0
        var newPMonth = 0
        var newPYear = 0
        var curMonthDays = 0
        var oldMonthDays = 0
        var newMonthDays = 0
        var firstDayMonth = 0
        /******************************************************/
        /******************************************************/
        function Gregorian2JD(year, month, day) {
            year = new Number(year);
            month = new Number(month);
            day = new Number(day);

            return (GREGORIAN_EPOCH - 1) +
				(365 * (year - 1)) +
				Math.floor((year - 1) / 4) +
				(-Math.floor((year - 1) / 100)) +
				Math.floor((year - 1) / 400) +
				Math.floor((((367 * month) - 362) / 12) +
				((month <= 2) ? 0 :
									(LeapGregorian(year) ? -1 : -2)
				) +
				day);
        }
        /******************************************************/
        function JD2Gregorian(jd) {
            jd = new Number(jd);
            var wjd, depoch, quadricent, dqc, cent, dcent, quad, dquad,
				yindex, dyindex, year, yearday, leapadj;

            wjd = Math.floor(jd - 0.5) + 0.5;
            depoch = wjd - GREGORIAN_EPOCH;
            quadricent = Math.floor(depoch / 146097);
            dqc = Mod(depoch, 146097);
            cent = Math.floor(dqc / 36524);
            dcent = Mod(dqc, 36524);
            quad = Math.floor(dcent / 1461);
            dquad = Mod(dcent, 1461);
            yindex = Math.floor(dquad / 365);
            year = (quadricent * 400) + (cent * 100) + (quad * 4) + yindex;
            if (!((cent == 4) || (yindex == 4))) {
                year++;
            }
            yearday = wjd - Gregorian2JD(year, 1, 1);
            leapadj = ((wjd < Gregorian2JD(year, 3, 1)) ? 0
														:
						(LeapGregorian(year) ? 1 : 2)
					);
            month = Math.floor((((yearday + leapadj) * 12) + 373) / 367);
            day = (wjd - Gregorian2JD(year, month, 1)) + 1;

            return new Array(year, month, day);
        }
        /******************************************************/
        function LeapGregorian(year) {
            return ((year % 4) == 0) &&
					(!(((year % 100) == 0) && ((year % 400) != 0)));
        }
        /******************************************************/
        function LeapPersian(year) {
            return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
        }
        /******************************************************/
        function Persian2JD(year, month, day) {
            year = new Number(year);
            month = new Number(month);
            day = new Number(day);

            var epbase, epyear;

            epbase = year - ((year >= 0) ? 474 : 473);
            epyear = 474 + this.Mod(epbase, 2820);

            return day +
					((month <= 7) ?
						((month - 1) * 31) :
						(((month - 1) * 30) + 6)
					) +
					Math.floor(((epyear * 682) - 110) / 2816) +
					(epyear - 1) * 365 +
					Math.floor(epbase / 2820) * 1029983 +
					(this.PERSIAN_EPOCH - 1);
        }
        /******************************************************/
        function Mod(a, b) {
            return a - (b * Math.floor(a / b));
        }
        /******************************************************/
        function JD2Persian(jd) {
            jd = new Number(jd);

            var year, month, day, depoch, cycle, cyear, ycycle,
				aux1, aux2, yday;

            jd = Math.floor(jd) + 0.5;

            depoch = jd - Persian2JD(475, 1, 1);
            cycle = Math.floor(depoch / 1029983);
            cyear = Mod(depoch, 1029983);
            if (cyear == 1029982) {
                ycycle = 2820;
            } else {
                aux1 = Math.floor(cyear / 366);
                aux2 = Mod(cyear, 366);
                ycycle = Math.floor(((2134 * aux1) + (2816 * aux2) + 2815) / 1028522) +
							aux1 + 1;
            }
            year = ycycle + (2820 * cycle) + 474;
            if (year <= 0) {
                year--;
            }

            yday = (jd - Persian2JD(year, 1, 1)) + 1;
            month = (yday <= 186) ? Math.ceil(yday / 31) : Math.ceil((yday - 6) / 30);
            day = (jd - Persian2JD(year, month, 1)) + 1;
            return new Array(year, month, day);
        }
        /******************************************************/
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600">
    </asp:ScriptManager>
    <table><tr><td valign="top" id="TopColumn" style="width:700px;"  class="Dock">
    <ComponentArt:Snap ID="Snap1" DockingContainers="TopColumn" CurrentDockingContainer="TopColumn"
        CurrentDockingIndex="0" ExpandCollapseMode="Animated" DraggingStyle="Original"
        DockingStyle="SolidOutline" MustBeDocked="true" IsCollapsed="false" runat="server">
        <Header>
            <table style="cursor: move;" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="SnapHeader" width="10" style="cursor: pointer" align="right">
                        <img onclick="Snap1.toggleExpand();" src="../../App_Utility/Images/Icons/i_open.gif"
                            width="22" height="19" border="0">
                    </td>
                    <td class="SnapHeader" onmousedown="Snap1.startDragging(event);">
                    </td>
                </tr>
            </table>
        </Header>
        <Content>
            <table class="SnapContent" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    
                                <td style="width: 25px" >
                                    <img src="../../App_Utility/Images/Icons/Arm02.gif" alt=""  />
                                </td>
                                <td>
                                    <table>
                                        <tr align="right">
                                            <td align="right" width="110px" class="link" onclick="onclickSend(13)">
                                                <div align="right">
                                                    کاربر:
                                                </div>
                                            </td>
                                            <td width="120px" align="right">
                                                <div id="PersonName" align="right" class="lbl">
                                                </div>
                                            </td>
                                            <td align="right" width="80px" class="link" onclick="onclickSend(10)">
                                                <div align="right">
                                                    نام جانشين:
                                                </div>
                                            </td>
                                            <td width="120px" align="right">
                                                <div id="CName" align="right" class="lbl">
                                                </div>
                                            </td>
                                            <td width="90px" align="right">
                                                <div align="right">
                                                    زمان ورود:
                                                </div>
                                            </td>
                                            <td width="100px" align="right">
                                                <div id="EnterTime" align="right" class="lbl">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="link" onclick="onclickSend(11)">
                                                <div align="right">
                                                    تفويض اختيار:</div>
                                            </td>
                                            <td >
                                                <div id="COName" align="right" class="lbl">
                                                </div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    تاريخ:
                                                </div>
                                            </td>
                                            <td align="right">
                                                <div id="EnterDate" align="right" class="lbl">
                                                </div>
                                            </td>
                                            <td class="link" onclick="onclickSend(12)">
                                                <div align="right">
                                                    مانده مرخصي:
                                                </div>
                                            </td>
                                            <td>
                                                <div id="RemainRest" dir="rtl" align="right" class="lbl">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="TRAdminMsg">
                                            <td>
                                                <div align="right">
                                                    پيام مدير سيستم:</div>
                                            </td>
                                            <td colspan="5">
                                                <div id="AdminMsg" dir="rtl" align="right" class="lbl">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            
                </tr>
            </table>
        </Content>
        <Footer>
            <img height="2" src="../../App_Utility/Images/Icons/clear.gif" border="0">
        </Footer>
    </ComponentArt:Snap>
    </td></tr>
    <tr><td id="teret" >
    
                <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="tabData.xml"
                    DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                    DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1" ImagesBaseUrl="../../App_Utility/Images/ComponentArt/Tab/images/"
                    MultiPageId="MultiPage1" Width="750px" runat="server">
                    <ItemLooks>
                        <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover"
                            LabelPaddingLeft="10"  
                            LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="4"
                            LeftIconWidth="3" 
                            LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                        <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" 
                        LabelPaddingLeft="10"
                            LabelPaddingRight="10" LabelPaddingTop="4" LabelPaddingBottom="4" LeftIconWidth="3"
                            LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                    </ItemLooks>
                </ComponentArt:TabStrip>
                <ComponentArt:MultiPage ID="MultiPage1" CssClass="MultiPage" runat="server">
                    <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                        <div id="DivRequest" style="display: inline">
                            <table id="TBLUp1" style="display: inline; width: 90%; height: 20px" cellpadding="0"
                                cellspacing="0">
                                <tr style="height: 10px">
                                    <td align="right" colspan="4" class="HeaderGrid">
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
                                <tr  style="height: 10px">
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
                            <div id="DivUp1" style="height: 120px; display: inline; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataUp1">
                                </table>
                            </div>
                            <table id="TBLDown1" style="vertical-align: bottom; display: inline; width: 90%;" cellpadding="0"
                                cellspacing="0"
                                height: 40px" >
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
                            <div id="DivDown1" style="height: 120px; display: inline; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataDown1">
                                </table>
                            </div>
                        </div>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                        <div id="DivAbsentPresent">
                        
                            <table id="TBLDown2" style="display: inline; width: 90%; height: 20px" cellpadding="0";
    cellspacing="0">
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
                                <tr style="height: 10px;width: 90%">
                                    <td class="CssHeaderStyle" style="width: 20%">
                                        نام فرد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 30%">
                                        تردد
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 20%">
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
                                    <td class="CssHeaderStyle" style="width: 6%"></td>
                                </tr>
                            </table>
                            <div style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 90%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 270px"
																align="center">
                                <table id="TBLDataDown2" class="XItemStyle">
                                </table>
                            </div>
                        </div>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                        <div id="DivMessage">
                            <table id="TBLUp3" style="display: inline; width: 90%; height: 20px" cellpadding="0";
    cellspacing="0">
                                <tr style="height: 10px">
                                    <td align="right" colspan="3" class="HeaderGrid">
                                        <table align="right" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 15px" onclick="onclickHideShow(this,'Up3')" onmouseout="onmouseoutHideShow(this)"
                                                    onmouseover="onmouseoverHideShow(this)">
                                                    <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                </td>
                                                <td style="color: Blue; text-decoration: underline; cursor: pointer" onclick="onclickSend(9)">
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
                            <div id="DivUp3" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataUp3">
                                </table>
                            </div>
                            <table id="TBLDown3" style="display: inline; width: 90%; height: 20px" cellpadding="0";
    cellspacing="0">
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
                                                    ( &nbsp;
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
                                <tr style="height: 10px">
                                    <td class="CssHeaderStyle">
                                        درخواست کننده
                                    </td>
                                    <td class="CssHeaderStyle">
                                        نوع مجوز
                                    </td>
                                    <td class="CssHeaderStyle">
                                        از ساعت
                                    </td>
                                    <td class="CssHeaderStyle">
                                        تا ساعت
                                    </td>
                                </tr>
                            </table>
                            <div id="DivDown3" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataDown3">
                                </table>
                            </div>
                        </div>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
                        <div id="DivCurCredit">
                            <table id="TBLUp4" style="display: inline; width: 90%; height: 20px" cellpadding="0";
    cellspacing="0">
                                <tr style="height: 10px">
                                    <td align="right" colspan="5" class="HeaderGrid">
                                        <table align="right" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 15px" onclick="onclickHideShow(this,'Up4')" onmouseout="onmouseoutHideShow(this)"
                                                    onmouseover="onmouseoverHideShow(this)">
                                                    <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                </td>
                                                <td style="color: Blue; text-decoration: underline; cursor: pointer" onclick="onclickSend(20)">
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
                            <div id="DivUp4" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataUp4">
                                </table>
                            </div>
                            <table id="TBLDown4" style="display: inline; width: 90%; height: 20px" cellpadding="0";
    cellspacing="0">
                                <tr style="height: 10px">
                                    <td colspan="5" class="HeaderGrid">
                                        <table align="right" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 15px" onclick="onclickHideShow(this,'Down4')" onmouseout="onmouseoutHideShow(this)"
                                                    onmouseover="onmouseoverHideShow(this)">
                                                    <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                </td>
                                                <td style="color: Blue; text-decoration: underline; cursor: pointer" onclick="onclickSend(21)">
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
                            <div id="DivDown4" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                overflow: auto; width: 90%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                <table id="TBLDataDown4">
                                </table>
                            </div>
                        </div>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 50%" valign="top" align="right">
                                    <div id="DivNeededCredit" style="width: 100%;" align="right">
                                        <table id="TBLUp5" style="display: inline; width: 100%; height: 20px" cellpadding="0";
    cellspacing="0">
                                            <tr style="height: 10px">
                                                <td align="right" colspan="4" class="HeaderGrid">
                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Up5')" onmouseout="onmouseoutHideShow(this)"
                                                                onmouseover="onmouseoverHideShow(this)">
                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                            </td>
                                                            <td style="color: Blue; text-decoration: underline; cursor: pointer" onclick="onclickSend(22)">
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
                                        <div id="DivUp5" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                            overflow: auto; width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                            <table id="TBLDataUp5">
                                            </table>
                                        </div>
                                        <table id="TBLDown5" style="display: inline; width: 100%; height: 20px" cellpadding="0";
    cellspacing="0">
                                            <tr style="height: 10px">
                                                <td colspan="4" class="HeaderGrid">
                                                    <table align="right" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 15px" onclick="onclickHideShow(this,'Down5')" onmouseout="onmouseoutHideShow(this)"
                                                                onmouseover="onmouseoverHideShow(this)">
                                                                <img alt="" src="..\..\App_Utility\Images\Icons\Up3.gif" />&nbsp;
                                                            </td>
                                                            <td style="color: Blue; text-decoration: underline; cursor: pointer" onclick="onclickSend(23)">
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
                                        <div id="DivDown5" style="display: inline; height: 120px; scrollbar-highlight-color: white;
                                            overflow: auto; width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: white;">
                                            <table id="TBLDataDown5">
                                            </table>
                                        </div>
                                    </div>
                                </td>
                                <td style="width: 50%" valign="top">
                                    <div id="DivOccure" style="width: 100%; height: 100%; display: inline" >
                                        <table style="width: 90%" >
                                            <tr>
                                                <td colspan="2" class="HeaderGrid">
                                                    محدوديت ثبت مجوزها
                                                </td>
                                            </tr>
                                            <tr >
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
                                                    <td class="XTabTable" style="width: 70%;" >
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
                    </ComponentArt:PageView>
                </ComponentArt:MultiPage>
                </td></tr></table>
            
    <div style="position: absolute; top: 0px; left: 0px; visibility: hidden;">
        <img src="../../App_Utility/Images/ComponentArt/Tab/images/tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../App_Utility/Images/ComponentArt/Tab/images/hover_tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../App_Utility/Images/ComponentArt/Tab/images/selected_tab_bg.gif" width="0"
            height="0" alt="" />
    </div>
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
        <input type="text" id="txtAccess" name="txtAccess" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtToday" name="txtToday" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <!------------------------------------------------------------------------------------------>
    </div>
    <div id="divTools" style="display: none; position: absolute; top: 100px; left: 100px;
        background-color: #FFCCCC;">
        <table>
            <tr>
                <td>
                    Theme:
                </td>
                <td>
                    <select onchange="setActiveStyleSheet(this.value);">
                        <option value="winter">winter</option>
                        <option value="blue">blue</option>
                        <option value="summer">summer</option>
                        <option value="green">green</option>
                        <option value="win2k-1">win2k-1</option>
                        <option value="win2k-2">win2k-2</option>
                        <option value="win2k-cold-1">win2k-cold-1</option>
                        <option value="win2k-cold-2">win2k-cold-2</option>
                        <option value="system">system</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    نوع تقويم:
                </td>
                <td>
                    <select onchange="changeDateType(this.value);">
                        <option value="jalali">جلالي</option>
                        <option value="gregorian">ميلادي</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript" language="javascript">
        document.dir = "rtl";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //##################################################اصلی
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";

        oXmlDoc.loadXML($get(MasterObj + 'txtXml').value)

        //################################################
        document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "txtAccess").value.split("#")[7];

        var TabSelect = null;
        var GridSelect = null;

        CreateGrid();
        
        //================================================
        function onmouseoverText(obj) {
            obj.className = "CssTextLink";
        }
        //===================================================
        function onmouseoutText(obj) {
            obj.className = "";
        }
        //===================================================
        function CreateGrid() {

            //------------------------پيامها
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=2]")
            AddToGridMessage(xmlNodes, "Up")
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=18]")
            AddToGridMessage(xmlNodes, "Down")

            //------------------------مجوزهای مورد نیاز
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=3 and Type=0  ]")
            AddToGridCredit(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=4 and Type=0  ]")
            AddToGridCredit(xmlNodes, "Down")

            //=---------------------------------مجوز های درجریان
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=3 and (Type!=0 or Name='Sum') ]")
            AddToGridCreditCur(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=4 and (Type!=0 or Name='Sum')]")
            AddToGridCreditCur(xmlNodes, "Down")

            //------------------------درخواستهای رسیده         
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=6]")
            AddToGridRequest(xmlNodes, "Down")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=5]")
            AddToGridRequest(xmlNodes, "Up")

            //-------------------------حاضرین غایبین
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=15]")
            AddToGridAbsentPresent(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=14]")
            AddToGridAbsentPresent(xmlNodes, "Down")

            //------------------------------   alert(1)

            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=12]")
            document.getElementById(MasterObj + "SDate").value = xmlNodes.item(0).selectSingleNode("SDate").text;
            document.getElementById(MasterObj + "EDate").value = xmlNodes.item(0).selectSingleNode("StartTime").text;
            if (document.getElementById(MasterObj + "SDate").value == '13')
                document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "txtToday").value;
            if (document.getElementById(MasterObj + "EDate").value == '13')
                document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "txtToday").value;
            PersonName.innerText = xmlNodes.item(0).selectSingleNode("Name").text.split("#")[0];
            document.getElementById(MasterObj + "txtPersonCode").value = xmlNodes.item(0).selectSingleNode("Name").text.split("#")[1];
            RemainRest.innerText = xmlNodes.item(0).selectSingleNode("Desc").text;
            
            //----------------------------------------------------------------------------تفویض اختیار
            if (xmlNodes.item(0).selectSingleNode("Type").text.length > 30) {
                COName.innerText = xmlNodes.item(0).selectSingleNode("Type").text.substr(0, 28) + "...";
                COName.title = xmlNodes.item(0).selectSingleNode("Type").text;
            }
            else
                COName.innerText = xmlNodes.item(0).selectSingleNode("Type").text;
           
            //--------------------------------------------------------------------نام جانشین
            if (xmlNodes.item(0).selectSingleNode("EndTime").text.length > 30) {
                CName.innerText = xmlNodes.item(0).selectSingleNode("EndTime").text.substr(0, 28) + "...";
                CName.title = xmlNodes.item(0).selectSingleNode("EndTime").text;
            }
            else
                CName.innerText = xmlNodes.item(0).selectSingleNode("EndTime").text;
           
            //------------------------------------------------------------------------
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=13]")
            if (xmlNodes.length > 0)
                AdminMsg.innerText = xmlNodes.item(0).selectSingleNode("Desc").text;
            else
                TRAdminMsg.style.display = "none";
            var oDate = new Date()
            var arr
            arr = JD2Persian(Gregorian2JD(oDate.getFullYear(), oDate.getMonth() + 1, oDate.getDate()))
            EnterDate.innerText = arr[2] + "/" + arr[1] + "/" + arr[0];
            EnterTime.innerText = ("0" + oDate.getHours()).substr(("0" + oDate.getHours()).length - 2, 2) + ":" + ("0" + oDate.getMinutes()).substr(("0" + oDate.getMinutes()).length - 2, 2) + ":" + ("0" + oDate.getSeconds()).substr(("0" + oDate.getSeconds()).length - 2, 2);

        }
        
        
        //===================================================
        function AddToGridMessage(XmlNodes, Sign) {
            //            eval("document.getElementById(MasterObj+'LBL" + Sign + "3').innerText=" + XmlNodes.length.toString());
            document.getElementById(MasterObj + "TabStrip1_2").firstChild.firstChild.childNodes(1).firstChild.innerHTML +=XmlNodes.length
            eval("TDCount" + Sign + "3.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "3.style.width='100%'");
            for (var i = 0; i < XmlNodes.length; i++) {
                var ORow = eval("TBLData" + Sign + "3.insertRow()");
                ORow.insertCell();
                ORow.insertCell();

                if (XmlNodes.item(i).selectSingleNode("Name").text.length > 15) {
                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 13) + "..."
                    ORow.cells(0).title = XmlNodes.item(i).selectSingleNode("Name").text;
                }
                else ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text

                if (XmlNodes.item(i).selectSingleNode("Desc").text.length > 120) {
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.substr(0, 118) + "..."
                    ORow.cells(1).title = XmlNodes.item(i).selectSingleNode("Desc").text;
                }
                else ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("Desc").text;
                ORow.cells(0).style.width = "20%";
                ORow.cells(1).style.width = "80%";
                ORow.cells(0).style.color = XmlNodes.item(i).selectSingleNode("Type").text.trim() == "1" ? "red" : "";
                
                
                
                ORow.cells(0).className = "XTabTable";
                ORow.cells(1).className = "XTabTable";

                if ((ORow.rowIndex) % 2 == 0)
                    ORow.className = "CssItemStyle"
                else
                    ORow.className = "CssAlternatingItemStyle";
            }
        }
        //-=================================================================================
        function AddToGridCreditCur(XmlNodes, Sign) {
            //            document.getElementById(MasterObj + "LBL4").innerText = document.getElementById(MasterObj + "LBL4").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL4").innerText
            //            document.getElementById(MasterObj + "LBL4").innerText = parseInt(document.getElementById(MasterObj + "LBL4").innerText) + (XmlNodes.length == 0 ? 0 : XmlNodes.length - 1);
            document.getElementById(MasterObj + "TabStrip1_3").firstChild.firstChild.childNodes(1).firstChild.innerHTML += (XmlNodes.length == 0) ? 0 : XmlNodes.length - 1
            eval("TDCount" + Sign + "4.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "4.style.width='100%'");

            if (XmlNodes.length == 0)
                eval("TDSum" + Sign + "4.innerText=0");
            for (var i = 0; i < XmlNodes.length; i++) {
                if (XmlNodes.item(i).selectSingleNode("Name").text != "Sum") {
                    var ORow = eval("TBLData" + Sign + "4.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();

                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.split("/")[2] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[0];
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("SDate").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(4).innerText = XmlNodes.item(i).selectSingleNode("Desc").text

                    ORow.cells(0).style.width = "10%";
                    ORow.cells(1).style.width = "10%";
                    ORow.cells(2).style.width = "10%";
                    ORow.cells(3).style.width = "35%";
                    ORow.cells(4).style.width = "35%";
                    
                    
                    ORow.cells(0).className = "XTabTable";
                    ORow.cells(1).className = "XTabTable";
                    ORow.cells(2).className = "XTabTable";
                    ORow.cells(3).className = "XTabTable";

                    if ((ORow.rowIndex) % 2 == 0)
                        ORow.className = "CssItemStyle"
                    else
                        ORow.className = "CssAlternatingItemStyle";
                        
                       
                }
                else {
                    eval("TDCount" + Sign + "4.innerText=(parseInt(TDCount" + Sign + "4.innerText)-1).toString()");
                    eval("TDSum" + Sign + "4.innerText= XmlNodes.item(i).selectSingleNode('EndTime').text");
                }
            }
        }
        //==================================================================================
        function AddToGridCredit(XmlNodes, Sign) {
            //            document.getElementById(MasterObj + "LBL5").innerText = document.getElementById(MasterObj + "LBL5").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL5").innerText
            //            document.getElementById(MasterObj + "LBL5").innerText = parseInt(document.getElementById(MasterObj + "LBL5").innerText) + (XmlNodes.length == 0 ? 0 : XmlNodes.length - 1);
document.getElementById(MasterObj + "TabStrip1_4").firstChild.firstChild.childNodes(1).firstChild.innerHTML += (XmlNodes.length == 0) ? 0 : XmlNodes.length - 1;
            eval("TDCount" + Sign + "5.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "5.style.width='100%'");
            if (XmlNodes.length == 0)
                eval("TDSum" + Sign + "5.innerText=0");
            for (var i = 0; i < XmlNodes.length; i++) {
                if (XmlNodes.item(i).selectSingleNode("Name").text != "Sum") {
                    var ORow = eval("TBLData" + Sign + "5.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();

                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.split("/")[2] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[0];
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("SDate").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(0).style.width = "25%";
                    ORow.cells(1).style.width = "25%";
                    ORow.cells(2).style.width = "25%";
                    ORow.cells(3).style.width = "25%";
                    ORow.cells(0).className = "XTabTable";
                    ORow.cells(1).className = "XTabTable";
                    ORow.cells(2).className = "XTabTable";
                    ORow.cells(3).className = "XTabTable";

                    if ((ORow.rowIndex) % 2 == 0)
                        ORow.className = "CssItemStyle"
                    else
                        ORow.className = "CssAlternatingItemStyle";
                }
                else
                    eval("TDCount" + Sign + "5.innerText=(parseInt(TDCount" + Sign + "5.innerText)-1).toString()");
                eval("TDSum" + Sign + "5.innerText= XmlNodes.item(i).selectSingleNode('SDate').text");
            }
        }
        //==================================================================================
        function AddToGridRequest(XmlNodes, Sign) {
           
            //            document.getElementById(MasterObj + "LBL1").innerText = document.getElementById(MasterObj + "LBL1").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL1").innerText
            //            document.getElementById(MasterObj + "LBL1").innerText = parseInt(document.getElementById(MasterObj + "LBL1").innerText) + XmlNodes.length;
            //alert(document.getElementById(MasterObj + "TabStrip1_1").firstChild.firstChild.ChildNodes(1).innerHTML)

            document.getElementById(MasterObj + "TabStrip1_0").firstChild.firstChild.childNodes(1).firstChild.innerHTML += XmlNodes.length
            eval("TDCount" + Sign + "1.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "1.style.width='100%'");
            for (var i = 0; i < XmlNodes.length; i++) {
                var ORow = eval("TBLData" + Sign + "1.insertRow()");
                var CellIndex = 0;
                ORow.insertCell();
                ORow.insertCell();
                ORow.insertCell();
                ORow.insertCell();
                if (Sign == "Down") {
                    ORow.insertCell();
                    ORow.insertCell();
                }
                //-----------------------نوع درخواست
                if (XmlNodes.item(i).selectSingleNode("Type").text.length > 20) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Type").text.substr(0, 18) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Type").text
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Type").text
                ORow.cells(CellIndex).style.width = "20%";
                ORow.cells(CellIndex).className = "XTabTable";
                CellIndex++;
                //---------------------------تاریخ درخواست
                ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[0] + "/" + XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[2].substr(2, 2);
                ORow.cells(CellIndex).style.width = "20%";
                ORow.cells(CellIndex).className = "XTabTable";
                CellIndex++;
                //---------------------------از تا
                if (Sign == "Down") {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text;
                    ORow.cells(CellIndex).style.width = "5%";
                    ORow.cells(CellIndex).className = "XTabTable";
                    CellIndex++;

                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text;
                    ORow.cells(CellIndex).style.width = "5%";
                    ORow.cells(CellIndex).className = "XTabTable";
                    CellIndex++;
                }
                //----------------------------درخواست کننده   
                if (XmlNodes.item(i).selectSingleNode("Name").text.length > 30) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 28) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Name").text;
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Name").text;
                ORow.cells(CellIndex).style.width = CellIndex == 2 ? "25%" : "20%";
                ORow.cells(CellIndex).className = "XTabTable";
                CellIndex++;
                //-----------------------شرح درخواست
                if (XmlNodes.item(i).selectSingleNode("Desc").text.length > 30) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.substr(0, 28) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Desc").text;
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Desc").text;
                ORow.cells(CellIndex).style.width = CellIndex == 3 ? "35%" : "30%";
                ORow.cells(CellIndex).className = "XTabTable";
                //-----------------------
                if ((ORow.rowIndex) % 2 == 0)
                    ORow.className = "CssItemStyle"
                else
                    ORow.className = "CssAlternatingItemStyle";
            }
        }
        //===================================================================================
        function AddToGridAbsentPresent(XmlNodes, Sign) {
            
            // document.getElementById(MasterObj + "LBLUp2").innerText = XmlNodes.length;
            //            else 
            if (Sign != "Up") {
                //  document.getElementById(MasterObj + "LBLDown2").innerText = XmlNodes.length;

                eval("TDCount" + Sign + "2.innerText=" + XmlNodes.length.toString());
                eval("TBLData" + Sign + "2.style.width='100%'");
                for (var i = 0; i < XmlNodes.length; i++) {
                    var ORow = eval("TBLData" + Sign + "2.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    if (XmlNodes.item(i).selectSingleNode("Name").text.length > 25) {
                        ORow.cells(0).title = XmlNodes.item(i).selectSingleNode("Name").text;
                        ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 23) + "...";
                    }
                    else
                        ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text;

                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[0];
                    ORow.cells(4).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[1];
                    ORow.cells(5).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[2];

                    ORow.cells(0).style.width = "20%";
                    ORow.cells(1).style.width = "30%";
                    ORow.cells(2).style.width = "20%";
                    ORow.cells(3).style.width = "10%";
                    ORow.cells(4).style.width = "10%";
                    ORow.cells(5).style.width = "10%";

                    ORow.cells(0).className = "XTabTable";
                    ORow.cells(1).className = "XTabTable";
                    ORow.cells(2).className = "XTabTable";
                    ORow.cells(3).className = "XTabTable";
                    ORow.cells(4).className = "XTabTable";
                    ORow.cells(5).className = "XTabTable";
                    
                    if ((ORow.rowIndex) % 2 == 0)
                        ORow.className = "CssItemStyle"
                    else
                        ORow.className = "CssAlternatingItemStyle";

                }
            }
        }
        //===================================================================
        function onclickSend(Sign) {
            //alert(Sign)
            var url; var State;
            switch (Sign) {
                //----------------------------جانشین                
                case 10:
                    url = "/Framework/Pages/User/ConfermentAccess.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                //-----------------------------تفویض اختیار    
                case 11:
                    url = "/Framework/Pages/User/ViewConfermenter.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
                    State = "dialogHeight: 560px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 12:
                    //-------------------------------مانده مرخصی          
                    url = "/TAPresentation/App_Pages/Cardex/CardexInfo.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 560px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 13:
                    //-------------------------------نام کاربری
                    url = "Person/ModifyPersonNew.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonID=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Monthly=1";
                    State = "dialogHeight: 560px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 1:
                    //-------------------------------درخواستها
                    url = "/Framework/Pages/WorkFlow/CardTable/CardtableAllDoc.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Date=" + document.getElementById(MasterObj + "txtToday").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                case 2:
                    //-------------------------------حاضرین غایبین
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 3:
                    //-------------------------------پیامها
                    url = "../DataEntry/MessageReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                case 7:
                    //-------------------------------حاضرین 
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 8:
                    //-------------------------------غایبین
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 9:
                    //-------------------------------پیامها
                    url = "../DataEntry/MessageReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                case 5:
                    //--------------------------------------------- مجوزهای در جریان     
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 20:
                    //-----------------------------------مجوز های کسر در جریان
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10102&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 21:
                    //----------------------------------------مجوز مازاددر جریان
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10103&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 6:
                    //--------------------------------------------- مجوزهای مورد نیاز     
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 22:
                    //-----------------------------------مجوز های کسر مورد نیاز
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=0" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10102&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 23:
                    //----------------------------------------مجوز مازاد مورد نیاز
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=0" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10103&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
            }
            window.showModalDialog(encodeURI(url), window, State);
        }
        //==================================================================
        function ChekAccess() {
            var str = document.getElementById(MasterObj + "txtAccess").value;
            //-----------------------------------------------------------------دسترسی پیامها
            if (str.split("#")[0] == "0") {
                divMessage.setAttribute("onclick", "");
                divMessage.setAttribute("onmouseover", "");
                divMessage.setAttribute("onmouseout", "");
                divMessage.style.cursor = "Normal";
            }
            if (str.split("#")[1] == "0") {
                divReciving.setAttribute("onclick", "");
                divReciving.setAttribute("onmouseover", "");
                divReciving.setAttribute("onmouseout", "");
                divReciving.style.cursor = "Normal";
            }
            //-----------------------------------------------------------------دسترسی مجوزهای مورد نیاز
            if (str.split("#")[2] == "0") {
                divLackCode.setAttribute("onclick", "");
                divLackCode.setAttribute("onmouseover", "");
                divLackCode.setAttribute("onmouseout", "");
                divLackCode.style.cursor = "Normal";
            }
            if (str.split("#")[3] == "0") {
                divOverCode.setAttribute("onclick", "");
                divOverCode.setAttribute("onmouseover", "");
                divOverCode.setAttribute("onmouseout", "");
                divOverCode.style.cursor = "Normal";
            }
            //            if (str.split("#")[3] == "0" && str.split("#")[2] == "0") {
            divCredit.setAttribute("onclick", "");
            divCredit.setAttribute("onmouseover", "");
            divCredit.setAttribute("onmouseout", "");
            divCredit.style.cursor = "Normal";
            //            }
            //-----------------------------------------------------------------دسترسی درخواستهای رسیده
            if (str.split("#")[4] == "0") {
                divRequest.setAttribute("onclick", "");
                divRequest.setAttribute("onmouseover", "");
                divRequest.setAttribute("onmouseout", "");
                divRequest.style.cursor = "Normal";
            }
            //            if (str.split("#")[4] == "0") {
            divDaily.setAttribute("onclick", "");
            divDaily.setAttribute("onmouseover", "");
            divDaily.setAttribute("onmouseout", "");
            divDaily.style.cursor = "Normal";

            divHoure.setAttribute("onclick", "");
            divHoure.setAttribute("onmouseover", "");
            divHoure.setAttribute("onmouseout", "");
            divHoure.style.cursor = "Normal";
            //            }
            //-----------------------------------------------------------------دسترسی کاردکس
            //            if (str.split("#")[5] == "0") {
            divCardex.setAttribute("onclick", "");
            divCardex.setAttribute("onmouseover", "");
            divCardex.setAttribute("onmouseout", "");
            divCardex.style.cursor = "Normal";

            divCardexsub.setAttribute("onclick", "");
            divCardexsub.setAttribute("onmouseover", "");
            divCardexsub.setAttribute("onmouseout", "");
            divCardexsub.style.cursor = "Normal";
            //            }
            //----------------------------------------------------------------دسترسی حاضرین غایبین
            divAbPresent.setAttribute("onclick", "");
            divAbPresent.setAttribute("onmouseover", "");
            divAbPresent.setAttribute("onmouseout", "");
            divAbPresent.style.cursor = "Normal";

            divPresent.setAttribute("onclick", "");
            divPresent.setAttribute("onmouseover", "");
            divPresent.setAttribute("onmouseout", "");
            divPresent.style.cursor = "Normal";

            divAbsent.setAttribute("onclick", "");
            divAbsent.setAttribute("onmouseover", "");
            divAbsent.setAttribute("onmouseout", "");
            divAbsent.style.cursor = "Normal";
        }
        //==================================================================
        function onclickimg(obj) {
            var posX = obj.offsetLeft; var posY = obj.offsetTop;
            while (obj.offsetParent) {
                posX = posX + obj.offsetParent.offsetLeft;
                posY = posY + obj.offsetParent.offsetTop;
                if (obj == document.getElementsByTagName('body')[0]) { break }
                else { obj = obj.offsetParent; }
            }
            divTools.style.top = posY + 20;
            divTools.style.left = posX + 20;
            divTools.style.display = "inline";

        }
        //==================================================================
        function onclickTableBase() {
            if (window.event.srcElement.tagName != "IMG")
                divTools.style.display = "none";
        }
        //======================================================================
        
        //================================================
        function onmouseoutHideShow(obj) {
            obj.className = "";
        }
        //================================================
        function onmouseoverHideShow(obj) {
            obj.className = "CssOverShowHidden";
        }
        //=====================================================
        function onclickHideShow(obj, Sign) {

            obj.firstChild.src = obj.firstChild.src == document.getElementById("Link").href ? "..\\..\\App_Utility\\Images\\Icons\\Down3.gif" : document.getElementById("Link").href;
            eval("Div" + Sign + ".style.display=Div" + Sign + ".style.display=='inline'?'none':'inline'");

            if (Sign.substr(0, 2) != "Up") {
                if (eval("Div" + Sign + ".style.display=='inline'"))
                    eval("Div" + Sign.replace("Down", "Up") + ".style.height='120px'");
                else eval("Div" + Sign.replace("Down", "Up") + ".style.height='240px'");
            }
            else {
                if (eval("Div" + Sign + ".style.display=='inline'"))
                    eval("Div" + Sign.replace("Up", "Down") + ".style.height='120px'");
                else eval("Div" + Sign.replace("Up", "Down") + ".style.height='240px'");
            }
        }
        //======================================================
        
    </script>

    <script type="text/javascript">
        setActiveStyleSheet("winter");

        Calendar.setup({
            align: "BR",
            showOthers: true,
            onClose: closed,
            dateType: 'jalali',
            langNumbers: true,
            button: "EnterDate",
            electric: false

        });
        function de() { }
    </script>

</asp:Content>
