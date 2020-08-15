<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="GroupPersonLog.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.GroupPersonLog" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
     .CssNewRow
        {
            background-color: #C7D0DF;
          
        }
        .CssGroupClass
        {
            background-color:#eebfc7;
        }
        .CssTargetGroupClass
        {
            background-color:#b6d4ab;
        }
        .CssHeaderStyle1
        {
            background-color:#c06272;
        }
        .CssHeaderStyle2
        {
            background-color:#4a8a33;
        }
        .RedLink
        {
            color:Red;
            text-decoration:underline;
            cursor:hand;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <table width="100%;" >
        <!------------------------------آیتم های جستجو---------------------------->
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table class="TblFilter" cellpadding="0" >
                        <tr>
                            <td>
                                کاربر :
                            </td>
                            <td>
                                <uc1:ComboBox ID="CmbOnlineUser" runat="server" />
                            </td>
                            <td>
                                نام سيستم :
                            </td>
                            <td>
                                <input type="text" id="txtSystemName" style="width:160px" runat="server" class="TxtControls" />
                            </td>
                            <td>
                                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                                    align="center">
                                    <legend style="color: #78BED6">زمان عمليات</legend>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                از تاريخ :
                                            </td>
                                            <td>
                                                <uc2:KCalendar ID="KCalActSDate" runat="server" />
                                            </td>
                                            <td>
                                                تا تاريخ :
                                            </td>
                                            <td>
                                                <uc2:KCalendar ID="KCalActEDate" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                            <td>
                                <input type="button" onclick="OnClickBtnFilter()" value="فيلتر" style="border: thin groove #000080;
                                    width: 80px; background-color: #6AB5FF;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc1:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbGroup" name="CmbGroup" Width="160px" class="TxtControls"
                                    onkeypress="return KeySort(this,false)" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                                    align="center">
                                    <legend style="color: #78BED6">زمان عضويت</legend>
                                    <table  cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                از تاريخ :
                                            </td>
                                            <td>
                                                <uc2:KCalendar ID="KCalSDate" runat="server" />
                                            </td>
                                            <td>
                                                تا تاريخ :
                                            </td>
                                            <td>
                                                <uc2:KCalendar ID="KCalEDate" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <!----------------------------------گرید------------------------->
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtXmlLog" runat="server" />
                        <asp:HiddenField ID="txtXmlLogDetail" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div valign="top" align="center" id="GridViewCountainer" style="width: 96%; height: 400px;
                    overflow: auto">
                    <table id="TblLog" cellspacing="0" cellpadding="0" width="90%">
                        <tr style="height: 20px;">
                            <td class="CssHeaderStyle" style="width: 30px; height: 20px;" align="center" valign="middle">
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px; height: 20px;" align="center" valign="middle">
                                کد کاربر
                            </td>
                            <td class="CssHeaderStyle" style="width: 300px; height: 20px;" align="center" valign="middle">
                                نام کاربر
                            </td>
                            <td class="CssHeaderStyle" style="width: 300px; height: 20px;" align="center" valign="middle">
                                نام سيستم
                            </td>
                            <td class="CssHeaderStyle" style="width: 200px; height: 20px;" align="center" valign="middle">
                                زمان
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr id="TrLogDetailHeader" style="display: none">
            <td class="CssHeaderStyle1" style="width: 50px; height: 20px;" align="center" valign="middle">
                پرسنلي
            </td>
            <td class="CssHeaderStyle1" style="width: 150px; height: 20px;" align="center" valign="middle">
                نام
            </td>
            <td class="CssHeaderStyle1" style="width: 50px; height: 20px;" align="center" valign="middle">
                کد گروه
            </td>
            <td class="CssHeaderStyle1" style="width: 150px; height: 20px;" align="center" valign="middle">
                نام گروه
            </td>
            <td class="CssHeaderStyle1" style="width: 100px; height: 20px;" align="center" valign="middle">
                از تاريخ
            </td>
            <td class="CssHeaderStyle1" style="width: 100px; height: 20px;" align="center" valign="middle">
                تا تاريخ
            </td>
            <td class="CssHeaderStyle1" style="width: 50px; height: 20px;" align="center" valign="middle">
                عمليات
            </td>
            <td class="CssHeaderStyle2" style="width: 50px; height: 20px;" align="center" valign="middle">
                پرسنلي
            </td>
            <td class="CssHeaderStyle2" style="width: 150px; height: 20px;" align="center" valign="middle">
                نام
            </td>
            <td class="CssHeaderStyle2" style="width: 50px; height: 20px;" align="center" valign="middle">
                کد گروه
            </td>
            <td class="CssHeaderStyle2" style="width: 150px; height: 20px;" align="center" valign="middle">
                نام گروه
            </td>
            <td class="CssHeaderStyle2" style="width: 100px; height: 20px;" align="center" valign="middle">
                از تاريخ
            </td>
            <td class="CssHeaderStyle2" style="width: 100px; height: 20px;" align="center" valign="middle">
                تا تاريخ
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------->
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtKCalActSDate" name="txtKCalActSDate" runat="server" />
        <input type="text" id="txtKCalActEDate" name="txtKCalActEDate" runat="server" />
        <input type="text" id="txtActionTimeGP" name="txtActionTimeGP" runat="server" />
        <input type="text" id="txtOnlineUserID" name="txtOnlineUserID" runat="server" />
    
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Schedule/GroupPersonLog.js?v=1" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>
</asp:Content>
