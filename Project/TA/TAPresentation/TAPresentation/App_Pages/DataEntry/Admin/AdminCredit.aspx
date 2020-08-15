<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="AdminCredit.aspx.cs"
    Inherits="TAPresentation.App_Pages.DataEntry.Admin.AdminCredit" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style7
        {
            width: 102px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table id="TblBase" onclick="onblurdivCodePopup()" cellpadding="0" cellspacing="0"
        style="width: 970Px">
        <tr bgcolor="#DAE7E9">
            <td align="right" style="border: 1px groove #000000">
                <table cellspacing="0">
                    <tr align="center">
                        <td>
                            از تاريخ :
                        </td>
                        <td align="right">
                            <uc3:KCalendar ID="KCalSdate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td align="right">
                            <uc3:KCalendar ID="KCalEdate" runat="server" />
                        </td>
                        <td>
                            نوع فيلتر
                        </td>
                        <td align="right">
                            <table>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="CmbFilteringAdminCredit" Width="150px" runat="server" onchange="onChangeCmbFilteringAdminCredit()"
                                            class="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <input type="text" class="TxtControls" style="display: none; width: 50px" id="txtRengTime"
                                            runat="server" onblur="Timechk(this)" onkeydown="OnKeyDownInt(this)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" style="width:40px">
                            <img id="ImgProgresss" src="../../../App_Utility/Images/ProgressImage/loading1.gif"
                                style="display: none;" />
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            مرتب سازي براساس:
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="CmbOrderBy" Width="145px" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        
                        <td>
                            گروه مجوز
                        </td>
                        <td align="right">
                            <select id="CmbGroupCode" name="CmbGroupCode" style="width: 150px" onchange="OnChangeCmbGroupCode()"
                                runat="server" class="TxtControls">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            نوع مجوز:
                        </td>
                        <td align="right" colspan="2">
                            <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 150px"
                                class="TxtControls">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شماره پرسنلي :
                        </td>
                        <td align="right">
                            <uc4:ComboBox ID="cmbPersonCode" runat="server" />
                        </td>
                        <td>
                            گروه پرسنلي :
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="CmbPersonelGroup" Width="150px" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            واحد سازماني:
                        </td>
                        <td colspan="2">
                            <select runat="server" id="CmbDept" class="TxtControls" style="width: 200px">
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!--------------------------------نوار ابزار ----------------------------------------------------------->
        <tr valign="top">
            <td valign="top">
                <table cellpadding="0" cellspacing="0" style="width: 970px">
                    <tr>
                        <td colspan="2">
                            <uc2:ToolBar ID="OToolBar" runat="server" Paging="1" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="DivGrid" style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                        scrollbar-base-color: #b0c4de; height: 370px;">
                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit1" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td id="TDTakmili" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset id="FTakmili" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                        border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 400px;
                                        height: 410px;">
                                        <legend style="color: #78BED6">اطلاعات تکميلي</legend>
                                        <div id="DIVTakmili" style="scrollbar-highlight-color: white; overflow: auto; width: 400px;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 402px;">
                                            <asp:PlaceHolder ID="PlaceHolder1" runat="Server" />
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <table style="">
                                <tr>
                                    <td style="">
                                        <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                            border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 770px;
                                            height: 20px;">
                                            <legend style="color: #78BED6">آيتم هاي پيش فرض</legend>
                                            <table id="Table1" cellspacing="0" cellpadding="0" align="right" width="750px">
                                                <tr valign="middle">
                                                    <td style="width: 16%">
                                                        <input type="checkbox" runat="server" id="chkPerson" checked="checked" />شماره پرسنلي
                                                    </td>
                                                    <td style="width: 11%">
                                                        <input type="checkbox" runat="server" id="chkCreditGroup" />گروه مجوز
                                                    </td>
                                                    <td style="width: 10%">
                                                        <input type="checkbox" runat="server" id="chkStartDate" checked="checked" />ازتاريخ
                                                    </td>
                                                    <td style="width: 10%">
                                                        <input type="checkbox" runat="server" id="chkEndDate" checked="checked" />تاتاريخ
                                                    </td>
                                                    <td style="width: 13%">
                                                        <input type="checkbox" runat="server" id="chkSTime" />زمان شروع
                                                    </td>
                                                    <td style="width: 13%">
                                                        <input type="checkbox" runat="server" id="chkETime" />زمان خاتمه
                                                    </td>
                                                    <td class="style7">
                                                        <input type="checkbox" runat="server" id="chkCreditType" />نوع مجوز
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" runat="server" id="chkDesc" />
                                                        شرح
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtXMLCmbCredite" runat="server" />
                        <asp:HiddenField ID="txtPersonGrdCode" runat="server" />
                        <asp:HiddenField ID="txtPersonGrdName" runat="server" />
                        <asp:HiddenField ID="txtGetCountAggrigatedCode" runat="server" />
                        <asp:HiddenField ID="txtXmlPersonCode" runat="server" />
                        <asp:HiddenField ID="txtCreditIDForNew" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtTopSelect" runat="server" />
        <input type="text" id="txtSkipGetEnter" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit1" runat="server" Text="BtnSubmit1" OnClick="BtnSubmit1_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtGroupPerson" name="txtGroupPerson" runat="server" />
        <input type="text" id="txtGroupCode" name="txtGroupCode" runat="server" />
        <input type="text" id="txtCodeGroupCode" name="txtCodeGroupCode" runat="server" />
        <input type="text" id="txtSDateDel" name="txtSDateDel" runat="server" />
        <input type="text" id="txtEDateDel" name="txtEDateDel" runat="server" />
        <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtXmlNew" name="txtXmlNew" runat="server" />
        <input type="text" id="txtPersonIDDetailCredit" name="txtPersonIDDetailCredit" runat="server" />
        <input type="text" id="txtDateDetailCredit" name="txtDateDetailCredit" runat="server" />
        <input type="text" id="txtSTimeGetvalue" name="txtSTimeGetvalue" runat="server" />
        <input type="text" id="txtETimeGetvalue" name="txtETimeGetvalue" runat="server" />
        <input type="text" id="txtRowIndex" name="txtRowIndex" runat="server" />
        <input type="text" id="cellIndex" name="cellIndex" runat="server" />
        <input type="text" id="txtCellIndex" name="txtCellIndex" runat="server" />
        <input type="text" id="txtPCForEnterC" name="txtPCForEnterC" runat="server" />
        <input type="text" id="txtMainCodeForEnterC" name="txtMainCodeForEnterC" runat="server" />
        <input type="text" id="strParam" name="strParam" runat="server" />
        <input type="text" id="LastValueOfObject" name="LastValueOfObject" runat="server" />
        <input type="text" id="LastValueOfCell9" name="LastValueOfCell9" runat="server" />
        <input type="text" id="txtSDateForEnterC" name="txtSDateForEnterC" runat="server" />
        <input type="text" id="txtEDateForEnterC" name="txtEDateForEnterC" runat="server" />
        <input type="text" id="txtOldCreditID" name="txtCreditIDForNew" runat="server" />
        <input type="text" id="txtPopupAdmin" name="txtPopupAdmin" runat="server" />
        <input type="text" id="txtWorkPeriodXml" name="txtWorkPeriodXml" runat="server" />
        <!--------------------------------------------------------------------------------------->
        <input type="text" id="txtOldPersonCode" name="txtOldPersonCode" runat="server" />
        <input type="text" id="txtOldSDate" name="txtOldSDate" runat="server" />
        <!----------------------------------------------------------------------------------------->
    </div>
    <br style="font-size: 1" />
    <div id="DivPopup" style="border: 2px groove #000000; position: absolute; top: 100px;
        left: 400px; width: 200px; height: 200px; display: none; background-color: #FFFFFF;">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" style="text-align: right">
                    <img src="../../../App_Utility/Images/Icons/close1.png" onclick="onclickClose()" />
                </td>
            </tr>
            <tr>
                <td class="CssHeaderStyle" style="width: 80px; text-align: center">
                    تاريخ
                </td>
                <td class="CssHeaderStyle" style="width: 50px; text-align: center">
                    از ساعت
                </td>
                <td class="CssHeaderStyle" style="width: 50px; text-align: center">
                    تا ساعت
                </td>
            </tr>
        </table>
        <div class="BlueScroll" style="width: 200px; height: 200px;">
            <table id="GridOffer" onclick="onclickRowOffer()" onkeydown="onkeydownRowOffer()"
                cellpadding="0" cellspacing="0" ondblclick="ondblclickGridOffer()">
            </table>
        </div>
    </div>
    <div id="divCodePopup" style="height: 400px; width: 180px; display: none;">
        <table class="CssForGoing" id="Table9" height="100%" cellspacing="1" cellpadding="1"
            border="0">
            <tr>
                <td id="RowFrame" style="display: inline;" align="center">
                    <div class="DivStyle" style="width: 200px; height: 400px; overflow-y: auto;" align="right">
                        <table id="XTabTable_Header" style="height: 35px;">
                            <thead style="display: inline;">
                                <tr class="ShoperHeaderStyle">
                                    <td class="Headerstyle" align="center" style="width: 30px">
                                        ميانبر
                                    </td>
                                    <td class="Headerstyle" align="center" style="width: 150px">
                                        نام
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <div class="DivStyle" style="scrollbar-highlight-color: white; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 90%" align="center">
                            <table id="XTabTable" style="" bordercolor="gainsboro" cellspacing="0" cellpadding="0"
                                bgcolor="#fff2cb" border="1" ondblclick="XTabTableDblClick(this)" onclick="SelectRow()"
                                onkeydown="XTabTableOnkeyDown(this)" onload="aa()">
                                <thead style="display: none">
                                    <tr>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: none;">
        <select runat="server" id="CmbTemp">
        </select>
    </div>
    <script src="../../../App_Utility/Scripts/DataEntry/Admin/AdminCredit.js?V=1.6" type="text/javascript"></script>
</asp:Content>
