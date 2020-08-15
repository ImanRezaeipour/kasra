
<%@ Page Title="مدیریت ترددها" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true"  CodeBehind="GoingManage.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.Admin.GoingManage"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 1220px;
        }
        .style2
        {
            width: 150px;
        }
        .style4
        {
            width: 93px;
        }
        .style5
        {
            width: 150px;
        }
        .style6
        {
            width: 100px;
        }
        .cssInsertSelectChk
        {
            background-color: #96CFAD;
        }
        .cssDeleteSelectChk
        {
            background-color: #FFAAAA;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="400000000">
    </asp:ScriptManager>
    <table>
        <tr bgcolor="#DAE7E9">
            <td class="style1" align="center" style="width: 100%">
                <div style="float: right">
                </div>
                <table cellpadding="2" width="90%">
                    <tr>
                        <td align="right" style="width: 80px">
                            از تاريخ
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td align="right" style="width: 80px">
                            تا تاريخ
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td align="right" style="width: 100px">
                            مرتب سازي براساس
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbOrderBy" Width="150px" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            گروه پرسنلي
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGroupPerson" runat="server" Width="150px" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            شماره پرسنلي
                        </td>
                        <td>
                            <uc4:ComboBox ID="cmbPersonCode" runat="server" />
                        </td>
                        <td align="right">
                            نوع فيلتر<br />
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbFilteringGoingManage" Width="150px" runat="server" onchange="onChangeCmbFilteringGoingManage()"
                                class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr style="width: 100%;">
                        <td colspan="2">
                            <uc2:ToolBar ID="OToolBar" runat="server" Paging="1" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" style="width: 100%;">
                            <div style="scrollbar-highlight-color: white; overflow: auto; width: 1020px; scrollbar-arrow-color: black;
                                z-index: 1; scrollbar-base-color: #b0c4de; height: 390px;">
                                <table id="GrdGoingMange_Header">
                                    <tr class="CssHeaderStyle">
                                        <th style="width: 20px; height: 20px" scope="col">
                                            <span></span>
                                        </th>
                                        <th style="width: 70px; height: 20px" scope="col">
                                            <span>ش.پرسنلي</span>
                                        </th>
                                        <th style="width: 100px; height: 20px" scope="col">
                                            <span>نام </span>
                                        </th>
                                        <th style="width: 85px; height: 20px" scope="col">
                                            <span>تاريخ</span>
                                        </th>
                                        <th style="width: 70px; height: 20px" scope="col">
                                            <span>ساعت</span>
                                        </th>
                                        <th style="width: 80px; height: 20px" scope="col">
                                            <span>نوع</span>
                                        </th>
                                        <th style="width: 250px; height: 20px" scope="col">
                                            <span>ترددها</span>
                                        </th>
                                        <th style="width: 20px; height: 20px" scope="col" id="thMod">
                                            <span>مد.</span>
                                        </th>
                                        <th style="width: 120px; height: 20px;" scope="col">
                                            <span>نوع تردد</span>
                                        </th>
                                        <th style="width: 100px; height: 20px" scope="col">
                                            <span>شرح</span>
                                        </th>
                                        <th scope="col" style="width: 36px" id="thِDel">
                                            <span>&nbsp;حذف</span>&nbsp;
                                        </th>
                                        <th scope="col" style="width: 30px" id="thNew">
                                            <span>&nbsp;ايجاد</span>&nbsp;
                                        </th>
                                    </tr>
                                </table>
                                <table id="GrdGoingMange" onclick="onClickTable()" >
                                    <thead style="display: none">
                                    </thead>
                                </table>
                                <table>
                                    <tr id="TrFooter" style="display: none">
                                        <td>
                                            <table id="TblFooter" class="CssHeaderPageMain" style="border-color: Gray; border-style: solid;
                                                border-width: 1px; width: 845px;">
                                                <tr>
                                                    <td align="center">
                                                        <img src="../../../App_Utility/Images/Icons/active_last.gif" onclick="OnClickBtnLast()"
                                                            style="cursor: pointer" title='صفحه آخر' />
                                                        <img src="../../../App_Utility/Images/Icons/active_forward.gif" onclick="OnClickBtnNext()"
                                                            id="BtNext" style="cursor: pointer" title='صفحه بعد' />
                                                        <input type="text" onchange="OnBlurtxtCurPage(this)" style="width: 30px; alignment: center;
                                                            text-align: center;" id="txtCurPage" class="TxtControls" />
                                                        از <span style="width: 30px" id="TotalPage">0</span>
                                                        <img src="../../../App_Utility/Images/Icons/active_back.gif" onclick="OnClickBtnPrv()"
                                                            id="BtnPrv" style="cursor: pointer" title='صفحه قبل' />
                                                        <img src="../../../App_Utility/Images/Icons/active_first.gif" onclick="OnClickBtnFirst()"
                                                            style="cursor: pointer" title='صفحه اول' />
                                                        <span style="width: 30px" id="txtFrom">0</span> تا <span style="width: 30px" id="txtTo">
                                                            0</span> از<span style="width: 30px" id="txtTotalRow">0</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="DNewRow" style="display: none; z-index: 10; scrollbar-highlight-color: white;
                                background-color: White; top: 200; left: 200; width: 940px; scrollbar-arrow-color: black;
                                scrollbar-base-color: #b0c4de; vertical-align: top; border: 2px solid Black;
                                height: 100px; position: absolute;">
                                <table align="center" id="TBDNewRow">
                                    <tr>
                                        <td style='width: 17px; height: 10px;background-color:Black' colspan="9">
                                            <img src="../../../App_Utility/Images/Icons/close1.png" style="background-color: Black;"
                                                onclick="onclickBtnCloseDiv()" width="15px" height="15px" />
                                        </td>
                                    </tr>
                                    <tr class="CssHeaderStyle">
                                        <th style="width: 20px; height: 20px" scope="col">
                                            <span></span>
                                        </th>
                                        <th style="width: 70px; height: 20px" scope="col">
                                            <span>ش.پرسنلي</span>
                                        </th>
                                        <th style="width: 100px; height: 20px" scope="col">
                                            <span>نام </span>
                                        </th>
                                        <th style="width: 85px; height: 20px" scope="col">
                                            <span>تاريخ</span>
                                        </th>
                                        <th style="width: 70px; height: 20px" scope="col">
                                            <span>ساعت</span>
                                        </th>
                                        <th style="width: 80px; height: 20px" scope="col">
                                            <span>نوع</span>
                                        </th>
                                        <th style="width: 250px; height: 20px;" scope="col">
                                            <span>ترددها</span>
                                        </th>
                                        <th style="width: 120px; height: 20px" scope="col">
                                            <span>نوع تردد</span>
                                        </th>
                                        <th style="width: 100px; height: 20px" scope="col">
                                            <span>شرح</span>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="9">
                                            <table id="GrdNewRow" align="right" cellspacing="0" cellpadding="0">
                                                <thead style="display: none">
                                                </thead>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                        border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 200px;
                                        height: 350px;">
                                        <legend style="color: #78BED6">اطلاعات تکميلي</legend>
                                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 200px; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 360px;">
                                            <asp:PlaceHolder ID="PlaceHolder1" runat="Server" />
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr style="width: 100%">
                        <td style="width: 100%">
                            <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 100%;
                                height: 20px;">
                                <legend style="color: #78BED6">آيتم هاي پيش فرض</legend>
                                <table id="Table1" cellspacing="0" cellpadding="0" align="right" width="100%">
                                    <tr>
                                        <td class="style2">
                                            <input type="checkbox" runat="server" id="chkPerson" checked="checked" />شماره پرسنلي
                                        </td>
                                        <td class="style4">
                                            <input type="checkbox" runat="server" id="chkDate" checked="checked" />تاريخ
                                        </td>
                                        <td class="style6">
                                            <input type="checkbox" runat="server" id="chkTime" />ساعت
                                        </td>
                                        <td class="style5">
                                            <input type="checkbox" runat="server" id="chkTaradodKind" />نوع تردد
                                        </td>
                                        <td>
                                            <input type="checkbox" runat="server" id="chkDes" />شرح
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
            <td valign="top" colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%--<div style="scrollbar-highlight-color: white; overflow: auto; width: 800px; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 400px;" >    
                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    </div>
                        --%>
                        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" style="display: none" />
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtTotalPage" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtCodePermision" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtStatus" runat="server" />
                        <asp:HiddenField ID="txtXMLCmbCredite" runat="server" />
                        <asp:HiddenField ID="txtPersonGrdCode" runat="server" />
                        <asp:HiddenField ID="txtPersonGrdName" runat="server" />
                        <asp:HiddenField ID="txtRowIndex" runat="server" />
                        <asp:HiddenField ID="txtGoingInRow" runat="server" />
                        <asp:HiddenField ID="txtOldGoingInRow" runat="server" />
                        <asp:HiddenField ID="txtXmlGoingManage" runat="server" />
                        <asp:HiddenField ID="txtXmlNewRow" runat="server" />
                        <asp:HiddenField ID="txtXmlComboGrid" runat="server" />
                        <asp:HiddenField ID="txtIsEnableCombo" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtAttendanceIDINRow" runat="server" />
                        <asp:HiddenField ID="txtModifyModavemat" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtTopSelect" runat="server" />
                    <input type="text" id="txtSkipGetEnter" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                    <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
                    <input type="text" id="txtFoodCenterID" name="txtFoodCenterID" runat="server" />
                    <input type="text" id="txtPersonCodeSearch" name="txtPersonCodeSearch" runat="server" />
                    <input type="text" id="txtKCalDate" name="txtKCalDate" runat="server" />
                    <input type="text" id="txtEzafekarID" name="txtEzafekarID" runat="server" />
                    <input type="hidden" id="txtMenuItemID" runat="server" />
                    <input type="hidden" id="txtFlagAccess" runat="server" />
                    <input type="text" id="txtGroupPerson" name="txtGroupPerson" runat="server" />
                    <input type="text" id="txtPersonIDDetailGoingManage" name="txtPersonIDDetailGoingManage"
                        runat="server" />
                    <input type="text" id="txtDateDetailGoingManage" name="txtDateDetailGoingManage"
                        runat="server" />
                    <input type="text" id="txtOldDateDetailGoingManage" name="txtOldDateDetailGoingManage"
                        runat="server" />
                    <input type="text" id="txtSubmitNew" name="txtSubmitNew" runat="server" />
                    <asp:HiddenField ID="txtRowIndexForNew" runat="server" />
                    <asp:HiddenField ID="txtChkInRow" runat="server" />
                    <asp:HiddenField ID="DelXml" runat="server" />
                    <asp:HiddenField ID="SaveXml" runat="server" />
                    <asp:HiddenField ID="txtOldDate" runat="server" />
                    <asp:HiddenField ID="txtAttDate" runat="server" />
                    <asp:HiddenField ID="txtType" runat="server" />
                    <asp:HiddenField ID="txtTypeName" runat="server" />
                    <asp:HiddenField ID="txtCode" runat="server" />
                    <asp:HiddenField ID="txtInsertModavemat" runat="server" />
                    <asp:HiddenField ID="txtDateOfModavemat" runat="server" />
                    <asp:HiddenField ID="txtTime" runat="server" />
                    <asp:HiddenField ID="txtAttendanceID" runat="server" />
                    <asp:HiddenField ID="txtInoutKind" runat="server" />
                    <asp:HiddenField ID="txtUntransfer" runat="server" />
                    <asp:HiddenField ID="txtDeleteID" runat="server" />
                    <asp:HiddenField ID="txtDesc" runat="server" />
                    <asp:HiddenField ID="txtPCode" runat="server" />
                    <asp:HiddenField ID="txtDateForSP" runat="server" />
                    <asp:HiddenField ID="txtOldPNO" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" value="10" />
                    <input type="text" id="txtPageNumber" name="txtPageNumber" value="1" runat="server" />
                    <input type="text" id="txtOptionCmbAttendanceType" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:DropDownList ID="cmbTypeAtendance" runat="server">
        </asp:DropDownList>
        <asp:DropDownList ID="cmbRequestAttendancetype" runat="server">
        </asp:DropDownList>
    </div>
    <div id="divCodePopup" style="height: 400px; width: 75px; display: none">
        <table class="CssForGoing" id="Table9" height="100%" cellspacing="1" cellpadding="1"
            width="100%" border="0">
            <tr>
                <td id="RowFrame" style="display: inline" align="center">
                    <div class="DivStyle" style="width: 100%; height: 100%" align="right">
                        <table id="XTabTable_Header" style="width: 100%; height: 35px">
                            <thead style="display: inline">
                                <tr class="ShoperHeaderStyle">
                                    <td class="Headerstyle" align="center" style="width: 75px">
                                        نام
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 90%" align="center">
                            <table id="XTabTable" style="width: 100%;" bordercolor="gainsboro" cellspacing="0"
                                cellpadding="0" bgcolor="#fff2cb" border="1" ondblclick="XTabTableDblClick(this)"
                                onclick="onclickGrd()" onkeydown="XTabTableOnkeyDown(this)">
                                <thead style="display: none">
                                    <tr>
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
    <script src="../../../App_Utility/Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/DataEntry/Admin/GoingManage.js?V=1.4" type="text/javascript"></script>
</asp:Content>
