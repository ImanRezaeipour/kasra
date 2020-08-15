<%@ Page Title="------------------------------------------------------------------------------------------------------------------ريز تردد پرسنل----------------------------------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true"
    CodeBehind="AllPersonelDailyReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AllPersonelDailyReport"
    ValidateRequest="false" AsyncTimeout="1800" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <style>
        .DivRole
        {
            border: 1px solid #6699FF;
            width: 250px;
            color: Red;
            background-color: #CEDEFF;
        }
        .TB
        {
            width: 64%;
            display: inline;
        }
        .DivAllPerson
        {
            border: 1px solid #6699FF;
            width: 70px;
            color: Red;
            background-color: #CEDEFF;
        }
        .TB2
        {
            width: 100%;
            display: none;
        }
        .DivStyle1
        {
            width: 99%;
            height: 380px;
            float: right;
            clear: right;
            clip: rect(auto, auto, auto, auto);
        }
    </style>
    <table width="100%">
        <tr>
            <td align="right" valign="top">
                <table id="TBAbsentPresent" class="TB">
                    <tr>
                        <td align="center" style="width: 80px">
                            واحد سازماني:
                        </td>
                        <td id="DivRole" runat="server" class="DivRole">
                        </td>
                        <td align="left">
                            کل پرسنل :
                        </td>
                        <td id="DivAllPerson" align="center" class="DivAllPerson" runat="server">
                        </td>
                        <td align="left">
                            حاضرين :
                        </td>
                        <td id="DivPresent" align="center" class="DivAllPerson" runat="server">
                        </td>
                        <td align="left">
                            غايبين :
                        </td>
                        <td id="DivAbsent" align="center" class="DivAllPerson" runat="server">
                        </td>
                    </tr>
                </table>
                <fieldset id="TBDailyRepot" class="TB2" dir="rtl" style="width: 100%; height: 60px;
                    border-right: lightblue thin inset; border-top: #78BED6 thin solid; border-left: #78BED6 thin outset;
                    border-bottom: #78BED6 thin solid;" align="right">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                از :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                روزهاي :
                            </td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="TxtControls" Style="width: 120px" ID="CmbDailyCredit">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شيفت :
                            </td>
                            <td id="Td1">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList class="TxtControls" ID="cmbShift" runat="server" Width="143px"
                                            onchange="onchangeCmbShift()">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <select id="CmbGroup" name="CmbGroup" style="width: 143px" runat="server" onchange="onchangecmbGroup()"
                                            class="TxtControls">
                                            <option></option>
                                        </select>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                واحد سازماني :
                            </td>
                            <td id="TdCmbDepartment">
                                <asp:DropDownList ID="CmbDepartment" runat="server" Width="208px" CssClass="TxtControls"
                                    onkeypress="return KeySort(this,false)">
                                </asp:DropDownList>
                            </td>
                            <td id="TDChildren">
                                <input type="checkbox" id="chkChildren" runat="server" />زير مجموعه
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="Div1" runat="server" class="DivStyle1" align="center">
                            <div id="GridViewCountainer" style="vertical-align: top; float: right;" align="right">
                                <cc2:KasraGrid ID="GrdDailyReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                                    AllowSendToPDF="true" AllowSendToExcel="true">
                                </cc2:KasraGrid>
                            </div>
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtMaxNumber" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
                            <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
                            <asp:HiddenField ID="txtValidateCalc" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:PostBackTrigger ControlID="BtnSubmitSend" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtXmlRowInfo" runat="server" />
                        <asp:HiddenField ID="txtRDate" runat="server" />
                        <asp:HiddenField ID="txtDepartmentID" runat="server" />
                        <asp:HiddenField ID="txtGroupID" runat="server" />
                        <asp:HiddenField ID="txtDepartmentName" runat="server" />
                        <asp:HiddenField ID="txtKind" runat="server" />
                        <asp:HiddenField ID="txtDate" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <input type="text" id="txtFlagDayContinuation" name="txtFlagDayContinuation" runat="server" />
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtFromDate" runat="server" />
                    <input type="text" id="txtToDate" runat="server" />
                    <input type="text" id="txtFilterPersonId" runat="server" />
                    <input type="text" id="SDate" runat="server" />
                    <input type="text" id="EDate" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSortExpression" name="txtSortExpression" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtRowDate" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
                    <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
                    <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="hidden" id="txtMenuItemID" runat="server" />
                    <input type="hidden" id="txtFlagAccess" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtTouchLogin" runat="server" />
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <input type="hidden" id="txtToPersonID" runat="server" />
                    <input type="hidden" id="txtPersonID" runat="server" />
                    <input type="hidden" id="txtFromPersonID" runat="server" />
                    <input type="hidden" id="UserName" runat="server" />
                    <input type="text" id="txtAccessBtn" runat="server" />
                    <input type="text" id="txtLDow" runat="server" />
                    <input type="text" id="txtLMazad" runat="server" />
                    <input type="text" id="txtLOtherEzafekar" runat="server" />
                    <input type="text" id="txtLKasr" runat="server" />
                    <input type="text" id="txtLEST" runat="server" />
                    <input type="text" id="txtLSickCode" runat="server" />
                    <input type="text" id="txtLComissionCode" runat="server" />
                    <input type="text" id="txtLOtherMorakhasi" runat="server" />
                    <input type="text" id="txtToolTipDept" runat="server" />
                    <input type="text" id="txtPageID" runat="server" />
                    <input type="text" id="txtSTime" runat="server" />
                    <input type="text" id="txtETime" runat="server" />
                    <input type="text" id="txtAllPerson" runat="server" />
                    <input type="text" id="txtReportID" name="txtReportID" runat="server" />
                    <input type="text" id="txtScriptGroupXML" name="txtScriptGroupXML" runat="server" />
                    <input type="text" id="txtNewWFO" name="txtNewWFO" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="textPageID1" name="textPageID1" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/Reports/AllPersonelDailyReport.js" type="text/javascript"></script>
</asp:Content>
