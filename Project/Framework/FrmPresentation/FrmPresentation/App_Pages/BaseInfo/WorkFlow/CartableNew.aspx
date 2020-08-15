<%@ Page Title="------------------------------------------------------------------------------------------------------------کارتابل اسناد-----------------------------------------------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="CartableNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.CartableNew"
    AsyncTimeout="1800" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<%@ Register Src="~/App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<%@ Register Src="~/App_Utility/MultiGroup/MultiGroup.ascx" TagName="MultiGroup"
    TagPrefix="uc5" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%--<%@ Register src="../../../App_Utility/AutoComplete/AutoComplete.ascx" tagname="AutoComplete" tagprefix="uc6" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ReadStyle
        {
            font-weight: bold;
            font-size: 14px;
        }
        .fieldsetStyle
        {
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid;
            border-left: #78BED6 thin outset;
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6;
        }
        .DropDownListStyle
        {
            font-weight: bold;
            font-size: 8pt;
            font-family: Tahoma;
            background-color: white;
            border-color: lightsteelblue;
            height: 20px;
            width: 180px;
            display: none;
        }
        .DivStyle1
        {
            border: thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            clear: right;
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            float: right;
        }
        .style1
        {
            width: 100%;
        }
        .SortClass
        {
            width: 50px;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <div style="display: none">
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />

    <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" /></div>
    <table id="TBLBase" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td id="TDFilterItem" style="border-style: ridge; border-width: 1px; border-color: #000000;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table align="right" width="750px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="text-align: right">
                                    &nbsp; تاييد کننده :
                                </td>
                                <td style="text-align: right; border-left-color: #000000; border-left-width: 1px;
                                    border-left-style: outset;">
                                    <uc4:ComboBox ID="CmbCartablOwner" runat="server" />
                                </td>
                                <td style="text-align: right">
                                    &nbsp; تاريخ درخواست از :
                                </td>
                                <td id="TDKCal" style="text-align: right">
                                    <uc2:KCalendar ID="KCalSDate" runat="server" />
                                </td>
                                <td id="TdDepartment" style="text-align: right">
                                    &nbsp;واحد سازماني :
                                </td>
                                <td id="TdCmbDepartment" style="text-align: right">
                                    <asp:DropDownList ID="CmbDepartment" runat="server" onchange="onchangeElem(this)"
                                        Width="142px" CssClass="TxtControls" onkeypress="return KeySort(this,false)">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    &nbsp; واحد سازمانی :
                                </td>
                                <td style="text-align: right; border-left-color: #000000; border-left-width: 1px;
                                    border-left-style: outset;">
                                    <uc3:MultiDepartment ID="UCDepartment" runat="server" />
                                </td>
                                <td style="text-align: right">
                                    &nbsp; تا :
                                </td>
                                <td style="text-align: right">
                                    <uc2:KCalendar ID="KCalEDate" runat="server" />
                                </td>
                                <td style="text-align: right">
                                    &nbsp; گروه :
                                </td>
                                <td>
                                    <asp:DropDownList ID="CmbGroup" name="CmbGroup" Width="142px" class="TxtControls"
                                        onchange="onchangeElem(this)" onkeypress="return KeySort(this,false)" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    &nbsp;گروه :
                                </td>
                                <td style="text-align: right; border-left-color: #000000; border-left-width: 1px;
                                    border-left-style: outset;">
                                    <uc5:MultiGroup ID="UCGroup" runat="server" />
                                </td>
                                <td style="text-align: right">
                                    <div id="DivPartOne" style="float: right; cursor: hand; width: 8px; background-color: green"
                                        onclick='onclickImgFilterValue(this)'>
                                        &nbsp;</div>
                                    درخواست کننده:
                                </td>
                                <td style="text-align: right">
                                    <select onchange="onchangeElem(this)" class="TxtControls" id="CmbRequestor" style="width: 142px"
                                        runat="server">
                                    </select>
                                </td>
                                <td style="text-align: right">
                                    &nbsp;نوع سند:
                                </td>
                                <td style="text-align: right">
                                    <asp:DropDownList ID="CmbDocType" name="CmbDocType" Width="142px" class="TxtControls"
                                        runat="server" onchange="onchangeCmbDocType();onchangeElem(this)">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <div style="display: none">
                            <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                            <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
                            <input type="text" id="txtXmlFilter" name="txtXmlFilter" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnLoadCombo" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnBoth" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td id="TDEX" style="border-style: ridge; border-width: 1px 0px 1px 1px; border-color: #000000;
                background-color: #FFF0C4; text-align: right;">
                <div class='ImageClass' style="float: right; cursor: hand; width: 8px; background-color: Red"
                    onclick='onclickImgCreator(this)'>
                    &nbsp;</div>
                <div id="DivEX" style="float: right">
                    <table id="TBEX" cellpadding="0" cellspacing="0">
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right; background-color: #C5D5E9; border-bottom-style: ridge;
                border-bottom-width: 1px; border-bottom-color: #000000;">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="SortClass">
                            <input type="text" itemname="doctypename" sorttext="1" style="width: 20px; text-align: center;"
                                class="TxtControls" onfocus="OnFocusSortItem(this)" onchange="onchangeSortNo(this)"
                                onkeydown="OnKeyDownInt(this)" /><img src="../../../App_Utility/Images/Icons/Up11.png"
                                    width="16PX" height="16PX" style="cursor: hand" onclick="onclickImgSort(this)" />
                        </td>
                        <td style="text-align: right; width: 80px">
                            نوع سند
                        </td>
                        <td class="SortClass">
                            <input type="text" itemname="requester" sorttext="1" style="width: 20px; text-align: center;"
                                class="TxtControls" onfocus="OnFocusSortItem(this)" onchange="onchangeSortNo(this)"
                                onkeydown="OnKeyDownInt(this)" /><img src="../../../App_Utility/Images/Icons/Up11.png"
                                    width="16PX" height="16PX" style="cursor: hand" onclick="onclickImgSort(this)" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            درخواست کننده
                        </td>
                        <td class="SortClass">
                            <input type="text" itemname="deptName" sorttext="1" style="width: 20px; text-align: center;"
                                class="TxtControls" onfocus="OnFocusSortItem(this)" onchange="onchangeSortNo(this)"
                                onkeydown="OnKeyDownInt(this)" onfocus="OnFocusSortItem(this)" /><img src="../../../App_Utility/Images/Icons/Up11.png"
                                    width="16PX" height="16PX" style="cursor: hand" onclick="onclickImgSort(this)" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            واحد سازماني
                        </td>
                        <td class="SortClass">
                            <input type="text" itemname="actionDate" sorttext="1" style="width: 20px; text-align: center;"
                                class="TxtControls" onfocus="OnFocusSortItem(this)" onchange="onchangeSortNo(this)"
                                onkeydown="OnKeyDownInt(this)" /><img src="../../../App_Utility/Images/Icons/Up11.png"
                                    width="16PX" height="16PX" style="cursor: hand" onclick="onclickImgSort(this)" />
                        </td>
                        <td style="text-align: right; width: 100px">
                            تاريخ درخواست
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle1" align="center">
                            <cc2:KasraGrid ID="GrdCreditManage" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="false" OnSorting="Grd_Sorting" AllowPaging="true">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="XMLvDocs" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtDocAction" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnBoth" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnLoadCombo" runat="server" Text="BtnLoadCombo" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnBoth" runat="server" Text="BtnLoadCombo" OnClick="BtnSubmit_Click" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" id="txtXmlCombo" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnLoadCombo" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="BtnBoth" EventName="click" />
                         </Triggers>
        </asp:UpdatePanel>
         <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>               
            </ContentTemplate>
            <Triggers>              
                <asp:PostBackTrigger ControlID="BtnSubmitSend" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtCredit" name="txtCredit" runat="server" />
        <input type="text" id="txtRequesterID" name="txtCreatorPersonID" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtNewWFO" name="txtNewWFO" runat="server" />
        <input type="text" id="txtCartablOwner" name="txtCartablOwner" runat="server" />
        <input type="text" id="txtHoliday" />
        <input type="text" id="txtStrFilter" name="txtStrFilter" runat="server" />
        <input type="text" id="txtPartOneCH" name="txtPartOneCH" runat="server" />
        <input type="text" id="txtPartTwoCH" name="txtPartTwoCH" runat="server" />
        <input type="text" id="txtSortStr" name="txtSortStr" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtAction" name="txtAction" runat="server" />
        <input type="text" id="txtUCDepartment" name="txtUCDepartment" runat="server" />
        <input type="text" id="txtUCGroup" name="txtUCGroup" runat="server" />
        <input type="text" id="txtChkCount" name="txtChkCount" runat="server" />
    </div>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script src="../../../App_Utility/Scripts/BaseInfo/WorkFlow/CartableNew.js" type="text/javascript"></script>
</asp:Content>
