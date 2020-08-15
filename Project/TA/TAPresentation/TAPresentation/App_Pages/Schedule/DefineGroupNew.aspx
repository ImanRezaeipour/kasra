<%@ Page Title="---------------------------------------------------------------------------------------------------تعريف گروه-----------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="DefineGroupNew.aspx.cs" AsyncTimeout="7200" Inherits="TAPresentation.App_Pages.Schedule.DefineGroupNew" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 950px;
        }
        .CssRow
        {
            background-color: #C6D0E1;
        }
        .CssRowSearch
        {
            background-color: #FFFF99;
        }
        .CssUnSelect
        {
            background-color: pink;
        }
        .CssSelect
        {
            background-color: Green;
        }
        .CssGreen
        {
            background-color: #CCFFCC;
        }
        .CssConfictItemStyle
        {
            background-color: #BECDDC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false" AsyncPostBackTimeout="400000000" >
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td rowspan="3" valign="top">
                <fieldset style="border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid; height: 600px;">
                    <legend style="color: #78BED6">اطلاعات گروه</legend>
                    <table align="center" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                &nbsp;&nbsp; نام گروه :<br style="font-size: 1" />
                                &nbsp;&nbsp;<input type="text" id="txtGroupName" style="width: 190px" class="TxtControls" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp; نام مخفف:<br style="font-size: 1" />
                                &nbsp;&nbsp;<input type="text" id="txtAcronymName" style="width: 190px" class="TxtControls" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp; دسته بندي:
                                <br style="font-size: 1" />
                                &nbsp;&nbsp;<select id="CmbCategory" runat="server" style="width: 190px;"  class="TxtControls">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="width: 150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%-- شیفتی
                                <input id="RDShift" type="radio" name="Shift" />
                                &nbsp;&nbsp;&nbsp;غیر شیفتی
                                <input id="RDNoShift" type="radio" name="Shift" checked="checked" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--  &nbsp;&nbsp; فعال
                                <input id="RdActive" type="radio" name="Active" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;غیر فعال
                                <input id="RdUnActive" type="radio" name="Active" checked="checked" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="width: 150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp; توضيحات:
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <textarea id="Descript" rows="10" cols="20" style="width: 190px; height: 200px" class="TxtControls"></textarea>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td align="center" valign="top" style="width: 730px">
                <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #CDE3B5">
                    <tr>
                        <td style="width: 60px">
                            پرسنلي:
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td align="right">
                            <%--style="width: 450px"--%>
                            <img src="/TAPresentation/App_Utility/Images/Icons/S8.gif" alt="" onclick="onclickSearchImg()"
                                style="text-align: right; cursor: pointer;" />
                        </td>
                        <td>
                            از تاريخ:
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <%--<td>
                            <div style="display: none">
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </div>
                        </td>--%>
                        <td>
                            تا تاريخ:
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td>
                            <img src="/TAPresentation/App_Utility/Images/Icons/copy01.gif" alt="کپی تاریخ" onclick="onclickCopyDate()"
                                style="text-align: right; cursor: pointer;" />
                        </td>
                    </tr>
                </table>
                <fieldset id="FSetNewMember" style="border: lightblue thin inset;">
                    <legend style="color: #78BED6">اعضا جدید<img src="../../App_Utility/Images/Icons/Add.gif"
                        onclick="onclickImgShowNewMember()" style="display: none" />
                    </legend>
                    <div id="DivNewMember" style="overflow: auto; height: 200px; display: inline">
                        <table id="TblGroupMember">
                            <tr class="header">
                                <td class="CssHeaderStyle" style="width: 20px" align="center">
                                </td>
                                <td class="CssHeaderStyle" style="width: 30px" align="center">
                                    <input type="checkbox" id="ChkHeader" onclick='onclickChkHeaderNewMembers(this)' />
                                </td>
                                <td class="CssHeaderStyle" style="width: 120px" align="center">
                                    کد پرسنلي
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    نام و نام خانوادگي
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    از تاريخ
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    تا تاريخ
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <fieldset style="border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid; height: 375px;">
                    <legend style="color: #78BED6">اعضا گروه</legend>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <div id="GridViewPerson">
                                <cc2:KasraGrid ID="GrdGroupMember" runat="server" OnRowDataBound="Grid_RowDataBound"
                                    AllowSorting="true" OnSorting="GrdGroupMember_Sorting">
                                </cc2:KasraGrid>
                            </div>
                            <asp:HiddenField ID="txtSortCondition" runat="server" />
                            <asp:HiddenField ID="txtSortExpression" runat="server" />
                            <asp:HiddenField ID="txtSortDirection" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
    </table>
    <div id="DivDialogConflict" style="border: 2px groove #000000; display: none; position: absolute;
        top: 100; left: 100; background-color: #FFFFFF;">
        <div id="DivShowConflict" style="overflow: auto; width: 900px; height: 300px">
        </div>
        <div>
            <input type="button" class="CssHeaderStyle" value="شکستن تاریخ اتوماتیک" onclick="onclickBtnOK()" />
            &nbsp; &nbsp; &nbsp;
            <input class="CssHeaderStyle" type="button" value="   بستن   " onclick="onclickBtnCancel()" />
        </div>
        <div style="height: 20px">
        </div>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtHoliday" name="txtHoliday" runat="server" />
        <input type="text" id="txtSave" name="txtSave" runat="server" />
        <input type="text" id="txtSaveNewMember" name="txtSaveNewMember" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" value="16" runat="server" />
        <input type="text" id="txtTotalPage" name="txtTotalPage" runat="server" />
        <input type="text" id="txtGroupInfo" name="txtGroupInfo"  runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <!---------------Temp------------------------>
        <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Schedule/DefineGroupNew.js?v=1.7" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/jquery.blockUI.js" type="text/javascript"></script>
</asp:Content>
