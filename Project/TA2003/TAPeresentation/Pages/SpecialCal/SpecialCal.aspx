<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SpecialCal.aspx.vb" Inherits="TA.SpecialCal" AsyncTimeout="7200"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html dir="rtl">
<head>
    <title>----------------------------------------------------------------------زمانبندي
        برنامه کاري پرسنل----------------------------------------------------------------------
    </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="Style/StyleSpecialCal.css">
    <link rel="stylesheet" type="text/css" href="../../../Includes/Styles/StyleForPages.css">
    <script src="../../../Includes/Script/General.js"></script>
    <script src="Script/SHDate.js"></script>
    <script src="../../../Includes/Calendar/Scripts/JScripts/KasraDate.js"></script>
   
</head>
<body onload="pageLoad()" bottommargin="0" leftmargin="0" rightmargin="0" scroll="no"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <table id="Table1" class="CssPage" border="0" cellspacing="0" cellpadding="1" width="100%"
        height="60%">
        <tr>
            <td style="height: 10px" bgcolor="#e7eeff">
                <table style="width: 900px; height: 16px" id="Table2" border="0" cellspacing="1"
                    cellpadding="1" width="882" height="16">
                    <tr>
                        <td style="width: 100px; height: 2px" rowspan="2">
                         <cc1:lcombo id="cmbMonth" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
                                Width="120px" Font-Size="Smaller" onchange="cmbMonthOnChnage(this)" DataTextField="title"
                                DataValueField="val" LookupName="WorkPeriodSDateEDate">
                            </cc1:lcombo>  
                        </td>
                        <td style="width: 20px; height: 2px">
                            <input id="opPersonName" onclick="opPersonNameOnClick()" value="opPersonName" type="radio"
                                name="Group" runat="server">
                        </td>
                        <td style="width: 58px; height: 2px">
                            ش.پرسنلي:
                        </td>
                        <td style="width: 119px; height: 2px" id="tdGroupLable" align="right">
                            <input onblur="txtPersonIDOnBlur(this)" style="width: 100px" onkeydown="OnKeyDownNum('integer',this.value)" onkeyup="onkeyupPersonID(event)"
                                id="txtPersonID" class="txtControls" name="txtPersonID" runat="server" designtimedragdrop="2436">
                        </td>
                        <td style="width: 89px; height: 2px" align="right">
                            نام و نام خانوادگي:
                        </td>
                        <td style="width: 120px; height: 2px" id="tdGroupLookup" align="right">
                            <cc1:lcombo id="cmbPersonName" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
                                Width="120px" Font-Size="Smaller" onchange="cmbPersonNameOnChange(this)">
                            </cc1:lcombo>
                        </td>
                        <td>
                            <input id="chkDepartment" type="checkbox" name="chkDepartment" runat="server" disabled="disabled">واحد
                            سازماني:<%--onclick="onclickchkDepartment()"--%>
                        </td>
                        <td>
                            <cc1:lcombo id="cmbDepartment" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
                                Width="140px" Font-Size="Smaller" DataTextField="title" onchange="cmbDepartmentOnChange(this)"
                                DataValueField="val" LookupName="DepartmentName">
                            </cc1:lcombo>
                        </td>
                        <td valign="middle">
                            <!--<INPUT class="CssBtnLimitSerach" id="btnSearch" title="نمايش" style="WIDTH: 30px; CURSOR: hand; HEIGHT: 32px"
										onclick="btnSeachOnClick()" type="button" name="btnSearch">-->
                            <%--<input id="btnSave" title="ذخيره" style="display: inline; width: 30px; cursor: hand;
                                height: 25px; background-image: url('../../../Includes/Images/Icons/SaveIcon.gif');
                                background-repeat: no-repeat; background-position: center" onclick="onClickbtn()"
                                disabled="disabled" type="button" name="btnSave">--%>
                            <input class="CssbtnSave" id="btnSave" onclick="onClickbtn()" type="button" name="btnSave"
                                style="cursor: hand;" />
                            <%--<img id="ImgProgresss" src="../../../Images/Icons/loading1.gif" style="display: none;" />--%>
                        </td>
                    </tr>
                    <tr id="trGroup">
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 20px">
                            <input id="opShiftNobatKari" onclick="opShiftNobatKariOnClick()" value="opShiftNobatKari"
                                type="radio" name="Group" runat="server">
                        </td>
                        <td style="width: 58px">
                            شيفت:
                        </td>
                        <td style="width: 119px" align="right">
                            <cc1:lcombo id="cmbSchedule" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
                                Width="120px" Font-Size="Smaller" onchange="cmbScheduleOnChange(this)" DataTextField="title"
                                DataValueField="val" LookupName="Schedule">
                            </cc1:lcombo>
                        </td>
                        <td style="width: 89px" align="right">
                            گروه :
                        </td>
                        <td style="width: 120px">
                            <cc1:lcombo id="cmbNobatKari" runat="server" ConnectionName="GenCnn" CssClass="txtControls"
                                Width="120px" Font-Size="Smaller" onchange="cmbNobatKariOnChange(this)" DataValueField="val"
                                LookupName="ScheduleGroupID">
                            </cc1:lcombo>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" height="100%">
                    <tr>
                        <td class="CssHeader" width="14.5%" align="center">
                            شنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            يکشنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            دوشنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            سه شنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            چهارشنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            پنجشنبه
                        </td>
                        <td class="CssHeader" width="14.5%" align="center">
                            جمعه
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="background-color: #e7eeff; background-repeat: no-repeat" id="grdDetail"
                    border="0" cellspacing="0" cellpadding="1" width="100%" height="100%">
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo1" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo2" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo3" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo4" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo5" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo6" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" width="13%" align="center">
                            <cc1:lcombo id="Lcombo7" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="height: 24px; border-left-color: #6633cc; border-left-width: 1px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo8" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo9" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo10" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo11" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo12" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo13" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                            <cc1:lcombo id="Lcombo14" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo15" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo16" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo17" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo18" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo19" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo20" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                            <cc1:lcombo id="Lcombo21" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="25" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo22" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo23" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo24" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo25" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo26" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo27" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                            <cc1:lcombo id="Lcombo28" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo29" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo30" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo31" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo32" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo33" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo34" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                            <cc1:lcombo id="Lcombo35" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; border-top: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #ccccff 1px solid; border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                            height="5.55%" width="14.5%" align="center">
                        </td>
                        <td style="border-left: #6633cc 1px solid; height: 24px; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="5.55%" width="13%" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo36" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                            <cc1:lcombo id="Lcombo37" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                runat="server" ConnectionName="GenCnn" CssClass="txtControls" Width="120px" Font-Size="7pt"
                                onchange="onchangeLcombo(this)" DataTextField="title">
                            </cc1:lcombo>
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left-color: #6633cc; border-left-width: 1px;
                            border-right: #6633cc 1px solid" onclick="cellDayOnClick(this)" height="24" width="14.5%"
                            align="center">
                        </td>
                        <td style="border-bottom: #ccccff 1px solid; border-left: #6633cc 1px solid; border-right: #6633cc 1px solid"
                            onclick="cellDayOnClick(this)" height="24" width="13%" align="center">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table id="Table4" border="0" cellspacing="0" cellpadding="1" width="1000">
        <tr>
            <td style="display: none" id="tdHidden">
                <cc1:lcombo id="LcomboTEMP" runat="server" ConnectionName="GenCnn">
                </cc1:lcombo>
                <input id="Text1" runat="server" name="Text1">
                <input style="width: 71px; height: 22px" id="txtSelDay" size="6" runat="server" name="txtSelDay">
                <input style="width: 71px; height: 22px" id="txtWorkPeriod" size="6" runat="server" name="txtWorkPeriod"><input
                    style="width: 71px; height: 22px" id="txtSelMonth" size="6" name="Text1" runat="server"><input
                        style="width: 71px; height: 22px" id="txtSelYear" size="6" name="Text2" runat="server"><input
                            style="width: 71px; height: 22px" id="txtXmlShiftNobatKari" size="6" name="txtXmlShiftNobatKari"
                            runat="server"><input id="txtOverlapXML" runat="server" name="txtOverlapXML"><input
                                id="txtMsg" runat="server" name="txtMsg"><input style="width: 71px; height: 22px"
                                    id="txtSDate" size="6" name="txtSDate" runat="server"><input style="width: 71px;
                                        height: 22px" id="txtEDate" size="6" name="txtEDate" runat="server">
                <input id="txtCurDate" runat="server" name="txtCurDate"><input id="txtSubmit" runat="server"
                    name="txtSubmit">
                <asp:Button ID="hBtnSearch" runat="server" Text="hBtnSearch"></asp:Button><input
                    style="width: 71px; height: 22px" id="txtXmlShiftNobatKariRel" type="text" runat="server"
                    name="txtXmlShiftNobatKariRel"><input id="txtXmlHoliday" name="txtXmlHoliday" runat="server">
                <input id="txtNobatKari" runat="server" name="txtNobatKari"><input id="txtType" runat="server"
                    name="txtType">
                <input id="txtXMLSave" runat="server" name="txtXMLSave">
                <input id="txtTempDate" runat="server" name="txtTempDate">
                <input id="txtDepartmentIdselected" name="txtDepartmentIdselected" runat="server">
                <input id="txtXMLDepartmentofPersonel" name="txtXMLDepartmentofPersonel" runat="server">
                <input id="txtXMLDetailCollectionDepartment" name="txtXMLDetailCollectionDepartment"
                    runat="server">
                <input id="txtValidate" name="txtValidate" runat="server"><cc1:mysecurity id="OnLineUser"
                    runat="server">
                </cc1:mysecurity>
                <input id="txtSessionID" runat="server" name="txtSessionID">
                <input id="txtFocusDate" runat="server" name="txtFocusDate">
                <input id="txtGetCompanyFinatialPeriodID" runat="server" name="txtGetCompanyFinatialPeriodID">
                <input id="txtTickChekbox" runat="server" name="txtTickChekbox">
               
            </td>
        </tr>
        <tr>
            <td align="center">
                <img id="ImgProgresss" src="../../../Images/Icons/loading1.gif" style="display: none;"
                    width="80px" />
            </td>
        </tr>
    </table>
    </form>
</body>
 <script language="javascript">

     function ChangeGridWithSaveXml() {
         var Year, Day, Month
         var xmlDocMain = new ActiveXObject("Microsoft.XMLDOM");
         xmlDocMain.async = "false";
         xmlDocMain.loadXML(Form1.txtXmlShiftNobatKari.value);

         var xmlNodesMain;
         
         //======================================
         if (Form1.txtXMLSave.value == "")
             Form1.txtXMLSave.value = "<BaseInfoEntity></BaseInfoEntity>"

         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXMLSave.value);
         var xmlNodes;

         xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/DetailCollection");
         if (xmlNodes.length > 0) {
             for (var i = 0; i < xmlNodes.length; i++) {
                 //                alert(xmlNodes.item(i).selectSingleNode("ODate").text)
                 Year = xmlNodes.item(i).selectSingleNode("ODate").text.substr(0, 4)
                 Month = xmlNodes.item(i).selectSingleNode("ODate").text.split("/")[1]
                 Day = xmlNodes.item(i).selectSingleNode("ODate").text.split("/")[2]
                 //                     alert(Year+"  "+ Month+"  "+Day)
                 xmlNodesMain = xmlDocMain.documentElement.selectNodes("/BaseInfoEntity/GetShiftandNobatKari[FYear=" + Year + " and FMonth=" + Month + " and FDay=" + Day + "]");
                 if (xmlNodesMain.length != 0) {
                     xmlNodesMain.item(0).selectSingleNode("NewNobatKari").text = xmlNodes.item(i).selectSingleNode("DetailCollectionID").text
                     Form1.txtXmlShiftNobatKari.value = xmlDocMain.xml;
                 }

             }
         }
         Form1.txtXMLSave.value = Form1.txtXMLSave.value.replace("</BaseInfoEntity>", "")
     }
     //==============================================================================
     function offState(rootCell) {
         var tallyLeft = document.getElementById(rootCell).offsetLeft;
         var tallyTop = document.getElementById(rootCell).offsetTop;
         if (document.getElementById(rootCell).offsetParent) {
             var rootNodeFound = false;
             var offsetStart = document.getElementById(rootCell).offsetParent;
             while (!rootNodeFound) {
                 tallyLeft += offsetStart.offsetLeft;
                 tallyTop += offsetStart.offsetTop;
                 if (offsetStart.offsetParent)
                     offsetStart = offsetStart.offsetParent;
                 else
                     rootNodeFound = true;
             }
         }

         var shadow = document.createElement('div');
         shadow.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=90)';
         shadow.style.MozOpacity = 0.85;
         shadow.setAttribute('id', 'shadow_' + rootCell);
         shadow.style.position = 'absolute';
         shadow.style.left = tallyLeft + 'px';
         shadow.style.top = tallyTop + 'px';
         shadow.style.width = document.getElementById(rootCell).offsetWidth.toString() + 'px';
         shadow.style.height = document.getElementById(rootCell).offsetHeight.toString() + 'px';
         shadow.style.background = '#e7eeff';
         document.body.appendChild(shadow);

         var shadowMessage = document.createElement('div');
         shadowMessage.setAttribute('id', 'shadowMessage');
         shadowMessage.style.position = 'absolute';
         shadowMessage.innerHTML =
				'<table>' +
					'<tr>' +
						'<td valign=middle style="color:#006699;">' +
							'لطفا منتظر بمانيد' +
						'</td>' +
						'<td valign=middle>' +
							'<object type="application/x-shockwave-flash" data="/TA/Images/Please Wait/throbber-bars1.swf" width="40" height="40">' +
								'<param name="movie" value="/TA/Images/Please Wait/throbber-bars1.swf" />' +
								'<param name="BGCOLOR" value="#e7eeff" />' +
								'<param name="wmode" value="transparent" />' +
							'</object>' +
						'</td>' +
					'</tr>' +
				'</table>';
         shadow.appendChild(shadowMessage);
         shadowMessage.style.left = ((shadowMessage.offsetParent.offsetWidth / 2) - (shadowMessage.offsetWidth / 2)).toString() + 'px';
         shadowMessage.style.top = ((shadowMessage.offsetParent.offsetHeight / 2) - (shadowMessage.offsetHeight / 2)).toString() + 'px';

         stateNode = 'shadow_' + rootCell;
     }
     /****************************************************************/
     function onState() {
         document.getElementById(stateNode).parentNode.removeChild(document.getElementById(stateNode));

     }
     /******************************************************/
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
     //WaitShow
     var stateNode;
     /*******************************************************/
     function onclickchkDepartment() {
         Form1.txtSubmit.value = "ChangchkDepartment"
         Form1.ImgProgresss.style.display = "inline";
         Form1.submit()
     }
     /******************************************************/
     function SetValueCombo() {
         for (var i = 1; i < 38; i++) {
             Obj = eval("document.getElementById('Lcombo" + i.toString() + "').parentElement");
             Obj.innerHTML = "<select id='Lcombo" + i.toString() + "' onmouseover='onmouseoverLcombo(this)' onmouseout='onmouseoutLcombo()' class='TxtControls' style='Width:120px;Font-Size:7pt' onchange='onchangeLcombo(this)'>" + document.getElementById('LcomboTEMP').innerHTML + "</cc1:lcombo>";
         }
     }
     //======================================================
     function pageLoad() {
         if (Form1.txtValidate.value == "0")
             ChangeGridWithSaveXml()

         document.all.item('chkDepartment').disabled = true

         if (document.all.item('txtTickChekbox').value == '1')
             document.all.item('chkDepartment').checked = true;
         else
             document.all.item('chkDepartment').checked = false;
         SetValueCombo();

         //______________________________________________
         window.name = "SpecialCal.aspx"
         Form1.target = window.name
         //______________________________________________
         try {
             onState()
         }
         catch (x) {
         }

         curPYear = (Form1.txtTempDate.value.substr(0, 4))
         curPMonth = (Form1.txtTempDate.value.substr(5, 2))
         curPDay = (Form1.txtTempDate.value.substr(8, 2))

         //cmbNobatKariOnChange(Form1.cmbNobatKari)
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKariRel.value);

         var xmlNodes;

         xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation[GroupID=" + Form1.cmbNobatKari.value + "]");
         if (xmlNodes.length != 0) {
             if (xmlNodes.length == 1) {
                 Form1.cmbSchedule.value = xmlNodes.item(0).selectSingleNode('ScheduleId').text
             }
             else if (xmlNodes.length > 1) {
                 Form1.cmbSchedule.value = 0
             }
         }

         if (Form1.txtType.value == "1") {
             trGroup.style.display = "none"
         }

         fnFillInCells()

         if (Form1.opPersonName.checked)
             opPersonNameOnClick()
         else if (Form1.opShiftNobatKari.checked) {
             opShiftNobatKariOnClick()
             var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             xmlDoc.async = "false";
             xmlDoc.loadXML(Form1.txtXmlShiftNobatKariRel.value);
             var xmlNodes;

             if (Form1.cmbSchedule.value == 0) {

                 xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation");
                 document.all('cmbNobatKari').innerHTML = ""
                 optionEl = document.createElement("OPTION")
                 document.all('cmbNobatKari').options.add(optionEl)
                 document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
                 document.all('cmbNobatKari').all(0).value = 0

                 if (xmlNodes.length != 0) {
                     var j = 1
                     for (var i = 0; i < xmlNodes.length; ++i) {
                         optionEl = document.createElement("OPTION")
                         document.all('cmbNobatKari').options.add(optionEl)
                         document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                         document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                         j++
                     }
                 }

                 Form1.cmbNobatKari.value = 0
             }
             else {

                 var oldNobatKari = Form1.cmbNobatKari.value
                 xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation[ScheduleId=" + Form1.cmbSchedule.value + "]");
                 document.all('cmbNobatKari').innerHTML = ""
                 optionEl = document.createElement("OPTION")
                 document.all('cmbNobatKari').options.add(optionEl)
                 document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
                 document.all('cmbNobatKari').all(0).value = 0
                 if (xmlNodes.length != 0) {
                     var j = 1
                     for (var i = 0; i < xmlNodes.length; ++i) {
                         optionEl = document.createElement("OPTION")
                         document.all('cmbNobatKari').options.add(optionEl)
                         document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                         document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                         j++
                     }
                 }

                 if (xmlNodes.length == 1) {
                     Form1.cmbNobatKari.value = xmlNodes.item(0).selectSingleNode('GroupID').text
                 }
                 else {

                     Form1.cmbNobatKari.value = 0
                 }
                 if (oldNobatKari != 0)
                     Form1.cmbNobatKari.value = oldNobatKari
             }
         }

         /*****************************Alert*****************************/
         if (Form1.txtMsg.value != "") {
             Form1.ImgProgresss.style.display = "none";
             alert(Form1.txtMsg.value)
             Form1.txtMsg.value = ""
         }
         Form1.txtValidate.value = "";
     }
     /*******************************************************/
     function cmbDepartmentOnChange(obj) {
         Form1.txtDepartmentIdselected.value = obj.value
         Form1.txtSubmit.value = "ChangDepartment"
         Form1.ImgProgresss.style.display = "inline";
         Form1.submit()
     }
     /*******************************************************/
     function opShiftNobatKariOnClick() {
         Form1.cmbSchedule.disabled = false
         Form1.cmbNobatKari.disabled = false

         Form1.cmbPersonName.value = 0
         Form1.txtPersonID.value = ""
         document.all.item('cmbPersonName').disabled = true
         Form1.txtPersonID.disabled = true
         Form1.txtXMLSave.value = ""
         Form1.btnSave.style.disabled = true;
         document.all.item('cmbDepartment').disabled = true
         //Form1.chkDepartment.checked = false
         //document.all.item('chkDepartment').disabled = true
     }
     /*******************************************************/
     function opPersonNameOnClick() {
         document.all.item('cmbDepartment').disabled = false
         //document.all.item('chkDepartment').disabled = false
         document.all.item('cmbPersonName').disabled = false
         Form1.txtPersonID.disabled = false
         Form1.cmbSchedule.value = 0
         Form1.cmbNobatKari.value = 0
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKariRel.value);
         var xmlNodes;

         if (Form1.cmbSchedule.value == 0) {
             xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation");
             document.all('cmbNobatKari').innerHTML = ""
             optionEl = document.createElement("OPTION")
             document.all('cmbNobatKari').options.add(optionEl)
             document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
             document.all('cmbNobatKari').all(0).value = 0

             if (xmlNodes.length != 0) {
                 var j = 1
                 for (var i = 0; i < xmlNodes.length; ++i) {
                     optionEl = document.createElement("OPTION")
                     document.all('cmbNobatKari').options.add(optionEl)
                     document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                     document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                     j++
                 }
             }

             Form1.cmbNobatKari.value = 0
         }
         else {
             var oldNobatKari = Form1.cmbNobatKari.value
             xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation[ScheduleId=" + Form1.cmbSchedule.value + "]");
             document.all('cmbNobatKari').innerHTML = ""
             optionEl = document.createElement("OPTION")
             document.all('cmbNobatKari').options.add(optionEl)
             document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
             document.all('cmbNobatKari').all(0).value = 0
             if (xmlNodes.length != 0) {
                 var j = 1
                 for (var i = 0; i < xmlNodes.length; ++i) {
                     optionEl = document.createElement("OPTION")
                     document.all('cmbNobatKari').options.add(optionEl)
                     document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                     document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                     j++
                 }
             }
             if (xmlNodes.length == 1) {
                 Form1.cmbNobatKari.value = xmlNodes.item(0).selectSingleNode('GroupID').text
             }
             else {
                 Form1.cmbNobatKari.value = 0
             }
         }
         Form1.cmbSchedule.disabled = true
         Form1.cmbNobatKari.disabled = true
     }

     /*******************************************************/
     function onkeyupPersonID(e) {
         var keynum;
         if (window.event) // (IE)
         {
             keynum = e.keyCode;
         }

         else if (e.which) // (other browsers)
         { keynum = e.which; }

         else { // something funky is happening and no keycode can be determined...
             alert('nothing found');
             keynum = 0;
         }
         if (keynum == 13)
             txtPersonIDOnBlur(e)
     }
     function txtPersonIDOnBlur(obj) {
         if (Form1.txtPersonID.value == "") {
             Form1.cmbPersonName.value = 0
             Form1.cmbDepartment.value = 0
             obj.value = ""
             Form1.txtSubmit.value = "GetAllPersonel"
             Form1.ImgProgresss.style.display = "inline";
             Form1.submit()

         }
         else if (Form1.txtPersonID.value != "") {

             Form1.txtSubmit.value = "ChangPersonID"
             Form1.ImgProgresss.style.display = "inline";
             Form1.submit()
             btnSeachOnClick()
         }


     }
     /*******************************************************/
     function cmbPersonNameOnChange(obj) {
         Form1.txtPersonID.value = obj.value
         if (obj.value == 0) {
             Form1.txtPersonID.value = ""

         }

         else if (obj.value != 0) {
             Form1.txtSubmit.value = "ChangPersonID"
             Form1.ImgProgresss.style.display = "inline";
             Form1.submit()
             btnSeachOnClick()
         }


     }
     /*******************************************************/
     function cmbScheduleOnChange(obj) {
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKariRel.value);
         var xmlNodes;

         if (obj.value == 0) {
             xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation");

             document.all('cmbNobatKari').innerHTML = ""
             optionEl = document.createElement("OPTION")
             document.all('cmbNobatKari').options.add(optionEl)
             document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
             document.all('cmbNobatKari').all(0).value = 0

             if (xmlNodes.length != 0) {
                 var j = 1
                 for (var i = 0; i < xmlNodes.length; ++i) {
                     optionEl = document.createElement("OPTION")
                     document.all('cmbNobatKari').options.add(optionEl)
                     document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                     document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                     j++
                     //alert(xmlNodes.item(i).selectSingleNode('title').text)
                 }
             }

             Form1.cmbNobatKari.value = 0
         }
         else {
             var oldNobatKari = Form1.cmbNobatKari.value
             xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation[ScheduleId=" + obj.value + "]");

             document.all('cmbNobatKari').innerHTML = ""
             optionEl = document.createElement("OPTION")
             document.all('cmbNobatKari').options.add(optionEl)
             document.all('cmbNobatKari').all(0).innerText = 'انتخاب نشده'
             document.all('cmbNobatKari').all(0).value = 0

             if (xmlNodes.length != 0) {
                 var j = 1
                 for (var i = 0; i < xmlNodes.length; ++i) {
                     optionEl = document.createElement("OPTION")
                     document.all('cmbNobatKari').options.add(optionEl)
                     document.all('cmbNobatKari').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                     document.all('cmbNobatKari').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                     j++
                 }
             }

             if (xmlNodes.length == 1) {
                 Form1.cmbNobatKari.value = xmlNodes.item(0).selectSingleNode('GroupID').text
                 btnSeachOnClick()
             }
             else {
                 Form1.cmbNobatKari.value = 0
             }

         }

     }
     /*******************************************************/
     function cmbNobatKariOnChange(obj) {
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKariRel.value);
         var xmlNodes;
         xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftNobatKariRelation[GroupID=" + obj.value + "]");
         if (xmlNodes.length != 0) {
             if (xmlNodes.length == 1) {
                 Form1.cmbSchedule.value = xmlNodes.item(0).selectSingleNode('ScheduleId').text
             }
             else {
                 Form1.cmbSchedule.value = 0
             }
         }
         if (obj.value != 0)
             btnSeachOnClick()
     }
     /*******************************************************/
     function btnSeachOnClick() {

         if (Form1.cmbMonth.value != 0) {
             var xmlDocWP = new ActiveXObject("Microsoft.XMLDOM");
             xmlDocWP.async = "false";
             xmlDocWP.loadXML(Form1.txtWorkPeriod.value);
             var xmlNodesWP;

             xmlNodesWP = xmlDocWP.documentElement.selectSingleNode("/NewDataSet/LookUp[val=" + Form1.cmbMonth.value + "]");
             var SDate = xmlNodesWP.selectSingleNode("SDate").text;
             var EDate = xmlNodesWP.selectSingleNode("EDate").text;

             Form1.txtSDate.value = SDate
             Form1.txtEDate.value = EDate
             if (Form1.opShiftNobatKari.checked) {
                 if ((Form1.cmbSchedule.value == 0) || (Form1.cmbSchedule.value == "")) {
                     alert("ابتدا بايد يک شيفت را انتخاب نماييد.")
                     Form1.cmbSchedule.focus()
                     fnFillInCells()
                     return
                 }
             }
             else if (Form1.opPersonName.checked) {
                 if ((Form1.cmbPersonName.value == 0) && (Form1.txtPersonID.value == "")) {
                     alert("ابتدا بايد پرسنل مورد نظر را انتخاب نماييد.")
                     Form1.cmbPersonName.focus()
                     fnFillInCells()
                     return
                 }
             }
             Form1.txtNobatKari.value = Form1.cmbNobatKari.value
             Form1.hBtnSearch.click()
         }
         else alert("دوره مورد نظر را انتخاب کنيد")
     }
     /*******************************************************/
     var lastselectedcell = null
     var lastselectedrow = null
     var lastselectedcellclass = ""
     function cellDayOnClick(obj) {
         if (grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4).cells(obj.cellIndex).className == "CssOffDay") {
             return
         }
         curPDay = grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4).cells(obj.cellIndex).innerText
         Form1.txtSelDay.value = curPDay
         if (lastselectedrow != null) {
             lastselectedcell.className = lastselectedcellclass
             grdDetail.rows(lastselectedrow).cells(lastselectedcell).className = lastselectedcellclass
             grdDetail.rows(lastselectedrow + 1).cells(lastselectedcell).className = lastselectedcellclass
             grdDetail.rows(lastselectedrow + 2).cells(lastselectedcell).className = lastselectedcellclass
             grdDetail.rows(lastselectedrow + 3).cells(lastselectedcell).className = lastselectedcellclass
         }
         lastselectedcellclass = grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4).cells(obj.cellIndex).className
         lastselectedrow = parseInt(obj.parentElement.rowIndex / 4) * 4
         lastselectedcell = obj.cellIndex
         grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4).cells(obj.cellIndex).className = "CssDaySelected"
         grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4 + 1).cells(obj.cellIndex).className = "CssDaySelected"
         grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4 + 2).cells(obj.cellIndex).className = "CssDaySelected"
         grdDetail.rows(parseInt(obj.parentElement.rowIndex / 4) * 4 + 3).cells(obj.cellIndex).className = "CssDaySelected"

     }
     /*******************************************************/
     function cmbMonthOnChnage(obj) {
         btnSeachOnClick()
     }
     /*******************************************************/
     function fnFillInCells() {
         if (Form1.txtXmlHoliday.value != '') {
             var xmlDocHoli = new ActiveXObject("Microsoft.XMLDOM");
             xmlDocHoli.async = "false";
             xmlDocHoli.loadXML(Form1.txtXmlHoliday.value);
             var xmlNodesHoli;
         }

         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKari.value);

         var iCell = 0
         var iRow = 0
         var xmlNodestmp = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftandNobatKari");

         firstDayMonth = xmlNodestmp.item(0).selectSingleNode("DayNu").text;

         var xmlnodeinfo = xmlDoc.documentElement.selectSingleNode("/BaseInfoEntity/DateInfo");

         var StartWP = xmlnodeinfo.selectSingleNode('SDate').text;
         var EndWP = xmlnodeinfo.selectSingleNode('EDate').text;
         Form1.cmbMonth.value = xmlnodeinfo.selectSingleNode('WPID').text;
         Form1.txtSDate.value = StartWP;
         Form1.txtEDate.value = EndWP;

         EndWP = shdAdd(EndWP, 1);
         oldMonthDays = shdAdd(StartWP, -1).toString().substr(8, 2);

         //Past Month
         for (var i = oldMonthDays - firstDayMonth + 1; i <= oldMonthDays; ++i) {
             grdDetail.rows(iRow).cells(iCell).innerText = i
             grdDetail.rows(iRow + 1).cells(iCell).innerText = " "
             grdDetail.rows(iRow + 2).cells(iCell).innerText = " "
             grdDetail.rows(iRow + 3).cells(iCell).innerText = " "
             grdDetail.rows(iRow).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 1).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 2).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 3).cells(iCell).className = "CssOffDay"
             if (iCell < 6) {
                 ++iCell
             }
             else {
                 iCell = 0
                 iRow = iRow + 3
             }
         }
         var CounterWP = StartWP;
         if (grdDetail.rows(iRow) != null) {
             while (CounterWP != EndWP && grdDetail.rows(iRow) != null) {
                 curPDay = CounterWP.substr(8, 2);
                 curPMonth = CounterWP.substr(5, 2);
                 curPYear = CounterWP.substr(0, 4);
                 grdDetail.rows(iRow).cells(iCell).innerText = curPDay;

                 xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftandNobatKari[FYear=" + curPYear + "][FMonth=" + curPMonth + "][FDay=" + curPDay + "]");
                 if (xmlNodes.length != 0) {
                     grdDetail.rows(iRow + 1).cells(iCell).innerText = xmlNodes.item(0).selectSingleNode('Shift').text
                     grdDetail.rows(iRow + 1).cells(iCell).title = xmlNodes.item(0).selectSingleNode('fShift').text
                     if (Form1.opPersonName.checked == true && grdDetail.rows(iRow + 3).cells(iCell).innerHTML != "")
                         grdDetail.rows(iRow + 3).cells(iCell).childNodes(0).value = xmlNodes.item(0).selectSingleNode('NewNobatKari').text
                     else
                         grdDetail.rows(iRow + 3).cells(iCell).innerHTML = xmlNodes.item(0).selectSingleNode('SNobatKari').text
                     grdDetail.rows(iRow + 3).cells(iCell).title = xmlNodes.item(0).selectSingleNode('fNobatKari').text
                     grdDetail.rows(iRow + 2).cells(iCell).innerText = xmlNodes.item(0).selectSingleNode('GGroup').text
                     grdDetail.rows(iRow + 2).cells(iCell).title = xmlNodes.item(0).selectSingleNode('fGroup').text
                     grdDetail.rows(iRow + 3).cells(iCell).setAttribute("Date", CounterWP);
                 }
                 else {
                     grdDetail.rows(iRow + 3).cells(iCell).innerHTML = " "
                 }

                 if (curPDay == i) {
                     //------------------------
                     lastselectedcellclass = "CssDay"
                     lastselectedrow = iRow
                     lastselectedcell = iCell
                     //------------------------------
                     grdDetail.rows(iRow).cells(iCell).className = "CssDaySelected"
                     grdDetail.rows(iRow + 1).cells(iCell).className = "CssDaySelected"
                     grdDetail.rows(iRow + 2).cells(iCell).className = "CssDaySelected"
                     grdDetail.rows(iRow + 3).cells(iCell).className = "CssDaySelected"
                     xmlNodesHoli = xmlDocHoli.documentElement.selectNodes("/HolidayEntity/Holidays[FYear=" + curPYear + "][FMonth=" + curPMonth + "][FDay=" + curPDay + "]");

                     if (xmlNodesHoli.length == 1) {
                         grdDetail.rows(iRow).cells(iCell).title = xmlNodesHoli.item(0).selectSingleNode('Descr').text
                         grdDetail.rows(iRow).cells(iCell).style.color = "red"
                     }
                     if (xmlNodes.length > 0) {
                         if (xmlNodes.item(0).selectSingleNode('NobatKari').text == xmlNodes.item(0).selectSingleNode('ChangeStruct').text) {
                             grdDetail.rows(iRow + 1).cells(iCell).style.color = "green"
                             grdDetail.rows(iRow + 2).cells(iCell).style.color = "green"
                             grdDetail.rows(iRow + 3).cells(iCell).style.color = "green"
                         }
                         else {
                             try {
                                 grdDetail.rows(iRow + 3).cells(iCell).childNodes(0).onmouseover = ""
                             }
                             catch (e) { }
                         }
                     }
                 }
                 else {
                     xmlNodesHoli = xmlDocHoli.documentElement.selectNodes("/HolidayEntity/Holidays[FYear=" + curPYear + "][FMonth=" + curPMonth + "][FDay=" + curPDay + "]");
                     if (xmlNodesHoli.length == 1) {
                         grdDetail.rows(iRow).cells(iCell).title = xmlNodesHoli.item(0).selectSingleNode('Descr').text
                         grdDetail.rows(iRow).cells(iCell).className = "CssHoliday"
                         grdDetail.rows(iRow).cells(iCell).style.color = "red"
                     }
                     else {
                         grdDetail.rows(iRow).cells(iCell).className = "CssDay"
                         grdDetail.rows(iRow + 1).cells(iCell).className = "CssDay"
                         grdDetail.rows(iRow + 2).cells(iCell).className = "CssDay"
                         grdDetail.rows(iRow + 3).cells(iCell).className = "CssDay"
                     }
                     if (xmlNodes.length > 0) {
                         if (xmlNodes.item(0).selectSingleNode('NobatKari').text == xmlNodes.item(0).selectSingleNode('ChangeStruct').text) {
                             grdDetail.rows(iRow + 1).cells(iCell).style.color = "green"
                             grdDetail.rows(iRow + 2).cells(iCell).style.color = "green"
                             grdDetail.rows(iRow + 3).cells(iCell).style.color = "green"
                         }
                         else {
                             try {
                                 grdDetail.rows(iRow + 3).cells(iCell).childNodes(0).onmouseover = ""
                             }
                             catch (e) { }
                         }
                     }
                     if (CounterWP == Form1.txtFocusDate.value)
                         cellDayOnClick(grdDetail.rows(iRow + 3).cells(iCell));
                 }
                 if (iCell < 6) {
                     ++iCell
                 }
                 else {
                     iCell = 0
                     iRow = iRow + 4
                 }
                 CounterWP = shdAdd(CounterWP, 1);
             }
         }
         var LRow = grdDetail.rows.length

         for (var i = 0; (iRow <= LRow - 3) && (iCell <= 6); ++i) {
             grdDetail.rows(iRow).cells(iCell).innerText = shdAdd(CounterWP, i).toString().substr(8, 2);
             grdDetail.rows(iRow).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 1).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 2).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 3).cells(iCell).className = "CssOffDay"
             grdDetail.rows(iRow + 3).cells(iCell).innerHTML = " "
             if (iCell < 6) {
                 ++iCell
             }
             else {
                 iCell = 0
                 iRow = iRow + 4
             }
         }
         //åÏÝ:ÊÛííÑ æ ÐÎíÑå ÔíÝÊ______________________________________

         //________________________________________________________________
         //var LRow=grdDetail.rows.length
         var LCell = grdDetail.rows(0).cells.length
         var a = 0
         for (i = 0; i < LRow; i++) {
             for (j = 0; j < LCell; j++) {
                 if (grdDetail.rows(i).cells(j).innerText == "") {
                     grdDetail.rows(i).cells(j).innerText = " "
                 }
             }
         }
     }
     /******************************************************/
     //åÏÝ:ÊÛííÑ æ ÐÎíÑå ÔíÝÊ 
     function LoadGroup(curPYear, curPMonth, curPDay) {
         Form1.txtSubmit.value = curPDay
         if (Form1.txtSubmit.value.length < 2)
             curPDay = "0" + curPDay

         Form1.txtSubmit.value = curPMonth
         if (Form1.txtSubmit.value.length < 2)
             curPMonth = "0" + curPMonth

         var cmgGroup = document.getElementById("cmbGroupSave")
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXmlShiftNobatKari.value);
         var xmlNodes;
         xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetShiftandNobatKari[FYear=" + curPYear + "][FMonth=" + curPMonth + "][FDay=" + curPDay + "]");
         if (xmlNodes.length > 0) {
             cmgGroup.value = xmlNodes.item(0).selectSingleNode('ShiftId').text
             Form1.txtCurDate.value = curPYear + "/" + curPMonth + "/" + curPDay

             //document.all.item('tdGroupLookup').style.display='inline'
             //document.all.item('tdSaveButton').style.display='inline'
             //document.all.item('tdGroupLable').style.display='inline'

         }
     }
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
     function ValidPersianDate(year, month, day) {
         //------
         if (isNaN(parseInt(year, 10)) || parseInt(year, 10) < 0 || isNaN(parseInt(month, 10)) || parseInt(month, 10) < 0 || parseInt(month, 10) > 12 || isNaN(parseInt(day, 10)) || parseInt(day, 10) < 0 || parseInt(day, 10) > 32)
             return false;

         //------
         var bValidDate = (month >= 1 && month <= 6 && day <= 31);
         bValidDate = bValidDate || (month >= 7 && month <= 11 && day <= 30);
         bValidDate = bValidDate || (LeapPersian(year) && month == 12 && day <= 30);
         bValidDate = bValidDate || (!LeapPersian(year) && month == 12 && day <= 29);

         //------
         return bValidDate;
     }
     /******************************************************/
     function PersianDateAdd(year, month, day, unit, part) {
         //-----
         var arrNewDate = new Array();
         arrNewDate[0] = year;
         arrNewDate[1] = month;
         arrNewDate[2] = day;

         //----------------------------------------------------
         //----- Add To Year
         if (part == 0) {
             //------
             arrNewDate[0] = year + unit;
             if (arrNewDate[0] <= 0) {
                 arrNewDate[0] = 0;
                 return arrNewDate;
             }

             //------
             if (!LeapPersian(arrNewDate[0]) && month == 12 && day == 30)
                 arrNewDate[2] = 29;
         }

         //----------------------------------------------------
         //----- Add To Month
         if (part == 1) {
             //------
             arrNewDate[1] = month + unit;
             if (arrNewDate[1] == 0) {
                 arrNewDate[0] = year - 1;
                 arrNewDate[1] = 12;
                 arrNewDate[2] = ((LeapPersian(arrNewDate[0])) ? 30 : 29);
                 return arrNewDate;
             }

             if (arrNewDate[1] == 13) {
                 arrNewDate[0] = year + 1;
                 arrNewDate[1] = 1;
                 arrNewDate[2] = 1;
                 return arrNewDate;
             }

             //------
             if (arrNewDate[1] == 12 && !LeapPersian(arrNewDate[0]) && day == 30) {
                 arrNewDate[2] = 29;
                 return arrNewDate;
             }

             //------
             if (arrNewDate[1] >= 7 && arrNewDate[1] <= 11 && day == 31) {
                 arrNewDate[2] = 20;
                 return arrNewDate;
             }
         }

         //----------------------------------------------------
         //----- Add To Day
         if (part == 2) {
             //------
             arrNewDate[2] = day + unit;
             if (arrNewDate[2] == 0) {
                 if (arrNewDate[1] == 1) {
                     arrNewDate[0] = year - 1;
                     arrNewDate[1] = 12;
                     arrNewDate[2] = ((LeapPersian(arrNewDate[0])) ? 30 : 29);
                     return arrNewDate;
                 }

                 if (arrNewDate[1] >= 2 && arrNewDate[1] <= 7) {
                     arrNewDate[1] = month - 1;
                     arrNewDate[2] = 31;
                     return arrNewDate;
                 }

                 if (arrNewDate[1] >= 8 && arrNewDate[1] <= 12) {
                     arrNewDate[1] = month - 1;
                     arrNewDate[2] = 30;
                     return arrNewDate;
                 }
             }

             //------
             if (arrNewDate[1] >= 1 && arrNewDate[1] <= 6 && arrNewDate[2] == 32) {
                 arrNewDate[1] = month + 1;
                 arrNewDate[2] = 1;
                 return arrNewDate;
             }

             //------
             if (arrNewDate[1] >= 7 && arrNewDate[1] <= 11 && arrNewDate[2] == 31) {
                 arrNewDate[1] = month + 1;
                 arrNewDate[2] = 1;
                 return arrNewDate;
             }

             //------
             if (arrNewDate[1] == 12 && LeapPersian(arrNewDate[0]) && arrNewDate[2] == 31) {
                 arrNewDate[0] = year + 1;
                 arrNewDate[1] = 1;
                 arrNewDate[2] = 1;
                 return arrNewDate;
             }

             //------
             if (arrNewDate[1] == 12 && !LeapPersian(arrNewDate[0]) && arrNewDate[2] == 30) {
                 arrNewDate[0] = year + 1;
                 arrNewDate[1] = 1;
                 arrNewDate[2] = 1;
                 return arrNewDate;
             }
         }

         //------
         return arrNewDate;
     }
     /******************************************************/
     function onchangeLcombo(obj) {
         var a = obj.parentElement.cellIndex
         var b = obj.parentElement.parentElement.rowIndex
         var ddd = document.getElementById("grdDetail").rows(b - 3).childNodes(a).innerText
         //var ODate=curPYear+"/"+curPMonth+"/"+curPDay

         var ODate = obj.parentElement.getAttribute("Date");
         if (Form1.opShiftNobatKari.checked == true)
             return;
         if ((Form1.opPersonName.checked == true) && (Form1.txtPersonID.value == "")) {
             alert("لطفا شماره پرسنلي را وارد نماييد.")
             return;
         }
         if (obj.value == 0) {
             alert("لطفا نوبت کاري روز " + ODate + " را انتخاب نماييد.")
             return;
         }
         if (Form1.txtXMLSave.value == "")
             Form1.txtXMLSave.value = "<BaseInfoEntity>"
         //Search in XML ifexists Date=ODate Delete(Date)
         Form1.txtXMLSave.value += "</BaseInfoEntity>"
         var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         xmlDoc.async = "false";
         xmlDoc.loadXML(Form1.txtXMLSave.value);
         var xmlNodes;
         xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/DetailCollection[ODate='" + ODate + "']");
         if (xmlNodes.length > 0) {
             xmlNodes.item(0).selectSingleNode('DetailCollectionID').text = obj.value
             Form1.txtXMLSave.value = xmlDoc.xml
             Form1.txtXMLSave.value = Form1.txtXMLSave.value.substr(0, Form1.txtXMLSave.value.length - 17)
         }
         else {
             Form1.txtXMLSave.value = Form1.txtXMLSave.value.substr(0, Form1.txtXMLSave.value.length - 17)
             var str = ""
             str += "<DetailCollection>"
             str += "<PersonID>" + Form1.txtPersonID.value + "</PersonID>"
             str += "<ODate>" + ODate + "</ODate>"
             str += "<DetailCollectionID>" + obj.value + "</DetailCollectionID>"
             str += "</DetailCollection>"
             Form1.txtXMLSave.value += str
         }
         //-----------------------------------------------
         if ((Form1.txtXMLSave.value != "") && (Form1.opPersonName.checked == true))
         //				Form1.btnSave.style.display="inline"
             Form1.btnSave.disabled = false;
     }
     /******************************************************/
     function onClickbtn() {
         Form1.txtXMLSave.value += "</BaseInfoEntity>"
         //            alert(Form1.txtXMLSave.value)
         if (Form1.txtXMLSave.value == "</BaseInfoEntity>") {
             Form1.txtXMLSave.value = ""
             alert("ذخيره شد.")
             return;
         }
         Form1.txtSubmit.value = "SaveShift"
         //alert(Form1.txtXMLSave.value)
         Form1.ImgProgresss.style.display = "inline";
         Form1.submit()
     }
     /******************************************************/
     var oPopup = window.createPopup();
     function onmouseoverLcombo(obj) {
         var oPopupBody = oPopup.document.body
         oPopupBody.style.backgroundColor = "#ffffcc"
         oPopupBody.style.fontSize = "11px"
         oPopupBody.style.fontWeight = "bold"
         oPopupBody.style.fontFamily = "tahoma"
         oPopupBody.dir = "rtl"
         oPopupBody.document.body.innerText = obj.parentElement.title
         var lefter = event.screenX;
         var topper = event.screenY;
         var Y = obj.parentElement.offsetTop
         oPopup.show(lefter, topper, 140, 18);
     }
     /******************************************************/
     function onmouseoutLcombo() {
         try {
             oPopup.hide()
         }
         catch (e) {
         }
     }
     /******************************************************/
    </script>
</html>
