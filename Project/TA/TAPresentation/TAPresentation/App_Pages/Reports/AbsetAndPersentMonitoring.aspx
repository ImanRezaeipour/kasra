<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="AbsetAndPersentMonitoring.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AbsetAndPersentMonitoring" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tdbold
        {
            color: Black;
            font-weight: bold;
        }
        .tdstyle
        {
            width: 12%;
            height: 25%;
            background-color: #e7e6ef;
        }
        .tdstyleBig
        {
            width: 10%;
            height: 15%;
            background-color: #e7e6ef;
        }
        .TblMainStyle
        {
            width: 100%;
            height: 100%;
        }
        .TblMainStyleInfo
        {
            width: 100%;
            height: 100%;
        }
        .SpratorStyle
        {
            width: 90%;
            height: 1px;
            background-color: #e7e6ef;
        }
        .tdImg
        {
            width: 90%;
            height: 60%;
           
        }
        .tdPersonInfo
        {
            width: 100%;
            height: 40%;
        }
        .tdStyleImg
        {
            width: 115px;
            height: 100%;
        }
        .tdStyleInfo
        {
            color: Black;
            font-size: 10;
            font-weight: bolder;
        }
        .tdStyleInfoPIDInfo
        {
            color: Black;
            font-size: 9;
            font-weight: bold;
            direction: ltr;
        }
        .tdStyleRole
        {
            color: Black;
            font-size: 9;
            font-weight: bold;
            direction: ltr;
        }
        .tdStyleTimein
        {
            color: #4c0583;
            font-size: 10;
            font-weight: bold;
        }
        .tdStyleTimeout
        {
            color: #4c0583;
            font-size: 10;
            font-weight: bold;
        }
        .DepartmentName
        {
            color: #4c0583;
            font-size: 20;
            font-weight: bold;
            font-family: B Titr;
        }
        .Header
        {
            background-image: url('../../App_Utility/Images/Icons/New044.gif');
            background-repeat: repeat-x;
        }
        .AbsentPresentInfo
        {
            color: #4c0583;
            font-size: 14;
            font-weight: bold;
            font-family: B Titr;
        }
        .fieldsetStyle
        {
            height: 100%;
            border-right: #c4bee6 thin inset;
            border-top: #b2aadf thin solid;
            border-left: #b2aadf thin outset;
            border-bottom: #c4bee6 thin solid;
        }
        .trMain
        {
            vertical-align: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="TblMainStyle" cellpadding="0" cellspacing="0">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
        </asp:ScriptManager>
        <tr valign="top" style="height: 5%;width:100%">
            <td>
                <table style="width:100%">
                    <tr>
                        <td style="width: 30%;" class="Header">
                            <table>
                                <tr>
                                    <td align="center" style="color: #080896; font-family: B Titr; font-size: 14">
                                        واحد سازمانی :
                                    </td>
                                    <td>
                                        <div align="center">
                                            <uc1:ComboBox ID="cmbDepartment" runat="server" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 40%;" class="Header">
                            <div class="DepartmentName" align="center">
                            </div>
                        </td>
                        <td style="width: 30%;" class="Header">
                            <div class="AbsentPresentInfo" align="center">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top" style="height: 95%;width:100%" class="Smalltr">
            <td>
                <table id="AbsentPresent" class="TblMainStyleInfo">
                    <tr id="td1" class="trMain" valign="top">
                        <td id="11" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="12" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="13" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="14" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="15" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="16" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="17" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="18" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr id="td2" class="trMain">
                        <td id="21" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="center">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="22" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="23" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="24" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="25" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="26" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="27" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="28" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr id="td3" class="trMain">
                        <td id="31" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="32" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="33" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="34" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="35" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="36" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="37" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="38" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr id="td4" class="trMain">
                        <td id="41" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="42" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="43" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="44" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <td class="tdPersonInfo">
                                                <div class="DInfo">
                                                </div>
                                                <div class="DTime">
                                                </div>
                                            </td>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="45" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="46" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="47" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                                <%--<img src='' style='cursor: pointer' />--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td id="48" class="tdstyle">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top" style="height: 95%;width:100%;display:none" class="Bigtr">
            <td>
                <table id="BigAbsentPresent" class="TblMainStyleInfo">
                    <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                     <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                     <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                     <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                     <tr class="trMain" valign="top">
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                         <td class="tdstyleBig">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <table class="TblMainStyleInfo">
                                    <tr align="center">
                                        <td class="tdImg">
                                            <div class="DImg">
                                            </div>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                            <th class="SpratorStyle" />
                                        </tr>--%>
                                    <tr>
                                        <td class="tdPersonInfo">
                                            <div class="DInfo">
                                            </div>
                                            <div class="DTime">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/Reports/AbsetAndPersentMonitoring.js?v=1.1" type="text/javascript"></script>
</asp:Content>
