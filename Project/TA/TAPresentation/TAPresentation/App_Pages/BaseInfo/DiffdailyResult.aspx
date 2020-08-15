<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="DiffdailyResult.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.DiffdailyResult" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .DivSearchStyle
        {
            height: 60px;
            width: 1200px;
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid;
            border-left: #78BED6 thin outset;
            border-bottom: #78BED6 thin solid;
        }
        .GridStyle
        {
            width: 1000px;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 370px;
            float: center;
            clear: right;
            align: center; 
            clip: rect(auto, auto, auto, auto);
        }
        .LengedStyle
        {
            color: #78BED6
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
    </asp:ScriptManager>
    <table width="100%" align="center">
        <tr>
            <td>
                <fieldset dir="rtl" class="DivSearchStyle">
                    <legend class="LengedStyle">پارامتر هاي جستجو</legend>
                    <table>
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
                            <td>
                                از شماره پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="cmbFromPersonCode" runat="server" />
                            </td>
                            <td>
                                تا شماره پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbToPersonCode" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                وضعيت نمايش :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbShowDiffDaily" CssClass="TxtControls" runat="server" Width="150px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td width="1200px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="1200px" align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="Div2" runat="server" class="GridStyle" align="center">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtOnlineUserName" name="txtOnlineUserName" runat="server" />
        <input type="text" id="txtKCalSFirstDate" name="txtKCalSFirstDate" runat="server" />
        <input type="text" id="txtKCalEFirstDate" name="txtKCalEFirstDate" runat="server" />
        <input type="text" id="txtFromPersonID" name="txtFromPersonID" runat="server" />
        <input type="text" id="txtToPersonID" name="txtToPersonID" runat="server" />
    </div>
 <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/DiffdailyResult.js" type="text/javascript"></script>  
</asp:Content>
