<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TimelyCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.TouchPages.TimelyCredit" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssDivTime
        {
            border-right-style: ridge;
            border-right-width: 1px;
            border-left-style: ridge;
            border-left-width: 1px;
            border-left-color: #000000;
        }
        .CssDayCal
        {
            border: 1px ridge #000000;
            background-color: #ffffcd;
            background-image: url('../../../App_Utility/Images/Icons/Bg14.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
        }
        .CssDayCalOver
        {
            background-color: #ffffcd;
            vertical-align: top;
            background-image: url('../../../App_Utility/Images/Icons/Bg14.gif');
            background-repeat: repeat-x;
            background-position: center;
        }
        .CssHeader
        {
            color: #000000;
            font-size: 15px;
            font-family: B titr;
            background-image: url('../../../App_Utility/Images/Icons/Bg3.gif');
            border-right-style: ridge;
            border-right-width: 1px;
            border-right-color: #000000;
            border-left-style: ridge;
            border-left-width: 1px;
            border-left-color: #000000;
            height: 23px;
            background-position: center;
        }
        .CssBtn
        {
            color: black;
            font-weight: bold;
            background-color: #2D6099;
            border: 2px ridge black;
            text-align: center;
            vertical-align: middle;
            width: 150px;
            height: 75px;
            margin-top: 2px;
            font-size: 20px;
            font-family: B titr;
            background-image: url('../../../App_Utility/Images/Icons/BDFls1.gif');
            background-position: center;
            cursor: hand;
        }
        .CssDayCalSelect
        {
            border: 1px ridge #000000;
            vertical-align: middle;
            background-color: #b0e54b;
            background-image: url('../../../App_Utility/Images/Icons/Bg19.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            font-family: B Titr;
            font-size: 18;
            text-align: center;
        }
        .CssBtnSelect
        {
            color: black;
            font-weight: bold;
            background-color: #2D6099;
            border: 2px ridge black;
            text-align: center;
            vertical-align: middle;
            width: 150px;
            height: 75px;
            margin-top: 2px;
            font-size: 20px;
            font-family: B titr;
            background-image: url('../../../App_Utility/Images/Icons/BDFls2.gif');
            background-position: center;
            cursor: hand;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: 3px groove #000000; height: 80px; background-color: #82ACDB;"
        align="right">
        <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td align="center" style="border-left-color: #000000; border-left-width: 1px; border-left-style: ridge;
                    width: 200px; background-color: black;">
                    <span id="SpanPageName" style="font-size: 20px; font-family: B Titr; color: white;
                        text-align: center" runat="server"></span>
                </td>
                <td style="width: 25px; background-position: right bottom; background-image: url('../../../App_Utility/Images/Icons/BGHead.gif');
                    background-repeat: no-repeat;">
                </td>
                <td style="width: 350px;">
                    <span id="SpanInfo" style="font-size: 17px; font-family: B Titr; color: White;">
                    </span>
                </td>
                <td style="width: 50px">
                    <div id="BtnPrevWP" class="CssBtn" style="width: 50px; font-size: x-large;">
                        «
                    </div>
                </td>
                <td align="center" style="width: 150px">
                    <div dir="ltr" id="tdWP" style="border: 2px ridge #FFFF00; color: Black; background-color: White;
                        width: 150px; height: 70px; font-size: 22px; font-family: B Titr;">
                    </div>
                </td>
                <td>
                    <div id="BtnNextWP" class="CssBtn" style="width: 50px; font-size: x-large;">
                        »
                    </div>
                </td>
                <td style="width: 80px">
                    <img id="ImgProgresss" src="../../../App_Utility/Images/Icons/loading1.gif" />
                </td>
                <td style="width: 170px">
                    <div class="CssBtn" id="divSave">
                        <br style="font-size: 4px;" />
                        ثبت&nbsp;&nbsp;<img src="../../../App_Utility/Images/Icons/Save20.png" alt="" />
                    </div>
                </td>
                <td>
                    <div class="CssBtn" id="BtnExit">
                        <br style="font-size: 4px;" />
                        خروج&nbsp;&nbsp;<img src="../../../App_Utility/Images/Icons/cross.gif" alt="" />
                    </div>
                </td>
                <td style="width: 25px; background-position: left top; background-image: url('../../../App_Utility/Images/Icons/BGHead1.gif');
                    background-repeat: no-repeat;">
                </td>
            </tr>
        </table>
    </div>
    <table style="width: 100%;">
        <tr>
            <td style="width: 750px;" valign="top">
                <table id="TblCal" border="0" cellpadding="0" cellspacing="7" bgcolor="#FFFFA4">
                    <thead bgcolor="#EFE04A">
                        <tr style="height: 23px;">
                            <td class="CssHeader" style="width: 50px" align="center">
                                شنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                یکشنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                دوشنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                سه شنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                چهارشنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                پنج شنبه
                            </td>
                            <td class="CssHeader" style="width: 50px" align="center">
                                جمعه
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                        <tr>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                            <td class="CssDayCal" dir="ltr" align="right" style="font-family: B Titr; font-size: 18;
                                overflow: hidden; height: 100px; width: 100px; text-align: center; vertical-align: middle;">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr>
                        <td align="center" valign="top" style="background-color: #82ACDB; border: 1px solid #000000;
                            height: 200px;">
                            <div style="color: White; font-size: 20; font-family: B Titr; text-align: center;">
                                ورود اطلاعات
                            </div>
                            <table cellpadding="0" cellspacing="0" id="TblSelectTime">
                                <thead>
                                    <tr>
                                        <td colspan="4" style="border: 1px ridge #333333; text-align: center; font-size: 20;
                                            font-family: B Titr" class="CssHeaderStyle">
                                            از ساعت
                                        </td>
                                        <td style="width: 30px;">
                                        </td>
                                        <td colspan="4" style="border: 1px ridge #333333; text-align: center; font-size: 20;
                                            font-family: B Titr" class="CssHeaderStyle">
                                            تا ساعت
                                        </td>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="CssBtn CssMUp2" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                    <td class="CssBtn CssMUp1" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                    <td style="width: 30px">
                                    </td>
                                    <td class="CssBtn CssHUp" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                    <td style="width: 30px">
                                    </td>
                                    <td class="CssBtn CssMUp2" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                    <td class="CssBtn CssMUp1" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                    <td style="width: 30px">
                                    </td>
                                    <td class="CssBtn CssHUp" style="width: 70px; font-size: 30px;">
                                        ↑
                                    </td>
                                </tr>
                                <tr>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivSM2">
                                            1
                                        </div>
                                    </td>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivSM1">
                                            1
                                        </div>
                                    </td>
                                    <td style="width: 30px; font-size: 20px; font-family: B Titr; font-weight: bolder;
                                        text-align: center;">
                                        :
                                    </td>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivSH">
                                            1
                                        </div>
                                    </td>
                                    <td style="width: 30px; font-size: 20px; font-family: B Titr; font-weight: bolder;
                                        text-align: center;">
                                        -
                                    </td>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivEM2">
                                            1
                                        </div>
                                    </td>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivEM1">
                                            1
                                        </div>
                                    </td>
                                    <td style="width: 30px; font-size: 20px; font-family: B Titr; font-weight: bolder;
                                        text-align: center;">
                                        :
                                    </td>
                                    <td class="CssDivTime">
                                        <div style="color: Black; background-color: White; width: 100%; height: 50px; font-size: 25;
                                            font-family: B Titr; text-align: center; vertical-align: middle" id="DivEH">
                                            1
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                    <td style="width: 30px">
                                    </td>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                    <td>
                                    </td>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                    <td style="width: 30px">
                                    </td>
                                    <td class="CssBtn CssHDown" style="width: 70px; font-size: 30px;">
                                        ↓
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="CssBtn" style="text-align: center; width: 250px;" id="BtnSDate">
                                        <img src="../../../App_Utility/Images/Icons/hand_2_icon.gif" />
                                        از تاریخ:<span id="SpanSDate" style="width: 120px" dir="ltr"></span>
                                    </td>
                                    <td>
                                    </td>
                                    <td colspan="4" class="CssBtn" style="text-align: center; width: 250px;" id="BtnEDate">
                                        <img src="../../../App_Utility/Images/Icons/hand_2_icon.gif" />
                                        تا تاریخ:<span id="SpanEDate" style="width: 110px" dir="ltr"></span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="background-color: #82ACDB; border: 1px solid #000000;
                            height: 260px">
                            <div style="color: White; font-size: 20; font-family: B Titr; text-align: center;
                                width: 300px;">
                                اطلاعات تکميلي
                            </div>
                            <div style="color: black; font-size: 15; font-family: B Titr; text-align: right;"
                                id="DivExtended">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="hidden" id="txtPageID" runat="server" />
        <input type="hidden" id="txtCompanyID" runat="server" />
        <input type="hidden" id="txtSessionID" runat="server" />
        <input type="hidden" id="txtWP" runat="server" />
        <input type="hidden" id="txtInfo" runat="server" />
        <input type="hidden" id="txtData" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server" Visible="false">
        </cc1:MySecurity>
    </div>
    <script src="../../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/DataEntry/TouchPages/TimelyCredit.js" type="text/javascript"></script>
</asp:Content>
