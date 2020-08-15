<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CreditInfoNew.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.CreditInfoNew" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="TDFilterItem" style="border-style: ridge; border-width: 1px; border-color: #000000;
                background-color: #FFF8DF">
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <table align="right" width="750px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="text-align: right">
                            &nbsp; تاييد کننده :
                        </td>
                        <td style="text-align: right; border-left-color: #000000; border-left-width: 1px;
                            border-left-style: outset;">
                            <uc4:ComboBox id="CmbCartablOwner" runat="server" />
                        </td>
                        <td style="text-align: right">
                            &nbsp; تاريخ درخواست از :
                        </td>
                        <td id="TDKCal" style="text-align: right">
                            <uc2:KCalendar id="KCalSDate" runat="server" />
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
                            &nbsp; وضعيت سند :
                        </td>
                        <td style="text-align: right; border-left-color: #000000; border-left-width: 1px;
                            border-left-style: outset;">
                            <asp:DropDownList ID="CmbDocStatus" name="CmbDocStatus" onchange="onchangeElem(this)"
                                Width="210px" class="TxtControls" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: right">
                            &nbsp; تا :
                        </td>
                        <td style="text-align: right">
                            <uc2:KCalendar id="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-left-color: #000000; border-left-width: 1px; border-left-style: outset;">
                            &nbsp;
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
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
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
            <td align="center" colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle" align="center">
                            <cc2:KasraGrid ID="GrdCreditManage" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="false" OnSorting="Grd_Sorting">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="XMLvDocs" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
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
        <cc1:mysecurity ID="OnLineUser" runat="server">
        </cc1:mysecurity>
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
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
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
    </div>
</asp:Content>
