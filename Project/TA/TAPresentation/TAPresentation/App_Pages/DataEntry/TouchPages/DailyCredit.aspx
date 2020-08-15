<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="DailyCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.TouchPages.DailyCredit" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssDayCalRavandCredit
        {
            border: 1px ridge #000000;
            vertical-align: top;
            background-color: #f4d05b;
            background-image: url('../../../App_Utility/Images/Icons/Bg15.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            text-align: center;
        }
        .CssDayCalSelectCredit
        {
            border: 1px ridge #000000;
            vertical-align: top;
            background-color: #aac893;
            background-image: url('../../../App_Utility/Images/Icons/Bg20.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            text-align: center;
        }
        .CssDayCalCredit
        {
            border: 1px ridge #000000;
            vertical-align: top;
            background-color: #ffffcd;
            background-image: url('../../../App_Utility/Images/Icons/Bg14.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            text-align: center;
        }
        .CssDayCalSelect
        {
            border: 1px ridge #000000;
            vertical-align: top;
            background-color: #b0e54b;
            background-image: url('../../../App_Utility/Images/Icons/Bg19.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            text-align: center;
        }
        .CssDayCal
        {
            border: 1px ridge #000000;
            vertical-align: top;
            background-color: #ffffcd;
            background-image: url('../../../App_Utility/Images/Icons/Bg14.gif');
            background-repeat: repeat-x;
            cursor: hand;
            background-position: center;
            overflow: hidden;
            text-align: center;
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
            color: white;
            font-weight: bold;
            background-color: #2D6099;
            border: 2px ridge #FFFF00;
            text-align: center;
            vertical-align: middle;
            width: 150px;
            height: 70px;
            margin-top: 2px;
            font-size: 20px;
            font-family: B titr;
            background-image: url('../../../App_Utility/Images/Icons/Bg18.gif');
            background-position: center;
            cursor: hand;
        }
        .CssDivDay
        {
            width: 50px;
            height: 20%;
            font-size: 20px;
            font-family: B Titr;
            font-weight: bolder;
            text-align: center;
            color: Black;
        }
        .CssDivData
        {
            margin-right: 2;
            width: 100%;
            font-size: 12px;
            font-family: tahoma;
            font-weight: bold;
            height: 20%;
            direction: rtl;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: 3px groove #000000; height: 80px; background-color: #82ACDB;"
        align="right">
        <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
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
                <td style="width: 180px;display:none;">
                    <div class="CssBtn" id="divToday" runat="server">
                        <br style="font-size: 4px;" />
                        دوره جاري &nbsp;&nbsp;<img src="../../../App_Utility/Images/Icons/today-icon.png"
                            alt="" />
                    </div>
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
                <td style="width: 100px">
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
    <div id="divBase" style="border: 1px ridge #87CEFA; width: 97%; height: 100%; background-color: #C3D8F5;">
        <div style="border: 1px solid #87CEFA; width: 98%; height: 99%; background-color: #91B7DF;">
            <div style="border: 1px ridge #87CEFA; width: 98%; height: 99%; background-color: #6196D1;">
                <div style="border: thin double #0099FF; width: 98%; height: 99%; background-color: #FFFF95;">
                    <div style="width: 100%; height: 100%;">
                        <table id="TblCal" border="0" cellpadding="0" cellspacing="7">
                            <thead bgcolor="#EFE04A">
                                <tr style="height: 23px;">
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        شنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        یکشنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        دوشنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        سه شنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        چهارشنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        پنج شنبه
                                    </td>
                                    <td class="CssHeader" style="width: 200px" align="center">
                                        جمعه
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr>
                                  <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr> <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr> <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr> <tr>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                    <td class="CssDayCal" dir="ltr" align="right">
                                        <div class="CssDivDay">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                        <div class="CssDivData">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
    </div>
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
    <script src="../../../App_Utility/Scripts/DataEntry/TouchPages/DailyCredit.js" type="text/javascript"></script>
</asp:Content>
