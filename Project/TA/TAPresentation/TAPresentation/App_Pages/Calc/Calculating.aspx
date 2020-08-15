<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" AsyncTimeout="7200" CodeBehind="Calculating.aspx.cs" Inherits="TAPresentation.App_Pages.Calc.Calculating"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 70%" cellpadding="0" cellspacing="0">
        <!--------------------------------------------ToolBar--------------------------------------------------->
        <tr>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 10px">
            </td>
        </tr>
    </table>
    <table width="60%">
        <!--------------------------------------------آیتم های وسط--------------------------------------------------->
        <tr>
            <td style="width: 90px">
            </td>
            <td style="width: 100%">
                <table width="100%" border="1px" style="background-color: #C5D8EB;">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="4" style="height: 10px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 150px;">
                                        از تاريخ:
                                    </td>
                                    <td style="width: 250px">
                                        <uc3:KCalendar ID="KcalSDate" runat="server" />
                                    </td>
                                    <td align="center" style="width: 150px;">
                                        تا تاريخ:
                                    </td>
                                    <td style="width: 250px">
                                        <uc3:KCalendar ID="KcalEDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <hr class="CssHR" style="width: 450px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <input id="RadioPrs" type="radio" name="RadioAll" value="1" style="background-color: transparent" />
                                        پرسنلی
                                    </td>
                                    <td align="right">
                                        &nbsp;
                                        <input id="RadioGR" type="radio" name="RadioAll" style="background-color: transparent" />
                                        گروه
                                    </td>
                                    <td align="right">
                                        <input id="RadioDep" type="radio" name="RadioAll" style="background-color: transparent" />
                                        واحد سازمانی
                                    </td>
                                    <td align="center">
                                        <input id="RadioTab" type="radio" name="RadioAll" style="background-color: transparent"
                                            value="4" />دفاتر تابل
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 10px">
                                        <hr class="CssHR" style="width: 450px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <input id="RdoFromPerson" type="radio" name="RadioAll" style="background-color: transparent"
                                                        value="4" />
                                                </td>
                                                <td>
                                                    از پرسنلي:
                                                </td>
                                                <td>
                                                    <input id="txtFromPerson" type="text" class="TxtControls" onkeydown="OnKeyDownInt(this)"
                                                        style="width: 100px;"  />
                                                </td>
                                                <td>
                                                    &nbsp; &nbsp; تا پرسنلي:
                                                </td>
                                                <td>
                                                    <input id="txtToPerson" type="text" class="TxtControls" onkeydown="OnKeyDownInt(this)"
                                                        style="width: 100px;" />
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
            <td style="width: 90px">
            </td>
        </tr>
        <tr><td colspan="3" align="center">  <img alt="" id="ImgProgress" src="../../App_Utility/Images/ProgressImage/loading1.gif"
                                 /></td></tr>
        <!--------------------------------------------گرید--------------------------------------------------->
        <tr>
            <td style="width: 90px">
            </td>
            <td align="center">
                <div align="center">
                    <fieldset dir="rtl" style="width: 70%; height: 300px; border-right: lightblue thin inset;
                        border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                        align="center">
                        <legend style="color: lightblue">اعضا</legend>
                        <table id="XTabTable_Header" style="width: 299px; height: 11px;" cellpadding="0"
                            align="center" cellspacing="0">
                            <thead style="display: inline">
                                <tr class="ShoperHeaderStyle">
                                    <td class="CssHeaderStyle" style="width: 3px" align="center">
                                        <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                            type="checkbox" name="chkAll" />
                                    </td>
                                    <td class="CssHeaderStyle" align="center">
                                        نام
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 304px;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 300px" align="center">
                            <table id="XTabTable" align="center">
                                <thead style="display: none">
                                </thead>
                            </table>
                        </div>
                    </fieldset>
                </div>
            </td>
            <td style="width: 90px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 20px">
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
    </div>   
    <script src="../../App_Utility/Scripts/Calc/Calculating.js" type="text/javascript"></script>
</asp:Content>
