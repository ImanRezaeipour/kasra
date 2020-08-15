<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" AsyncTimeout="7200" CodeBehind="DocInfoNew.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DocInfoNew" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .DivStyle1
        {
            border: thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            clear: right;
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
    </asp:ScriptManager>
    <table id="TBLBase" align="center">
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="TDFilterItem">
                                <table align="right" width="950px" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            متقاضي :
                                        </td>
                                        <td>
                                            <uc3:ComboBox ID="CmbPerson" runat="server" />
                                        </td>
                                        <td>
                                            <input type="radio" id="rdDate" runat="server" onclick="OnClickRdDate()" />
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
                                            نوع سند :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbDocType" name="CmbDocType" Width="142px" class="TxtControls"
                                                runat="server" onchange="onchangeCmbDocType(1)">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تاييد کننده :
                                        </td>
                                        <td>
                                            <uc3:ComboBox ID="CmbAccepter" runat="server" />
                                        </td>
                                        <td>
                                            <input type="radio" id="rdWPID" checked="true" runat="server" onclick="OnClickRdWpID()" />
                                            از دوره:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbWorkPeriod" name="CmbWorkPeriod" Width="145px" class="TxtControls"
                                                runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            تا دوره:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbWorkPeriodTo" name="CmbWorkPeriodTo" Width="145px" class="TxtControls"
                                                runat="server">
                                            </asp:DropDownList>
                                        </td>









                                        <td>
                                            وضعيت سند :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbDocStatus" name="CmbDocStatus" Width="142px" class="TxtControls"
                                                runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                            <td id="TDEX">
                                <div id="DivEX" style="float: right">
                                    <table id="TBEX" width="100%" cellpadding="0" cellspacing="0">
                                    </table>
                                </div>
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
            <td valign="top" align="center">
                <table cellpadding="0" cellspacing="0" id="TblTabs">
                    <tr>
                        <td class="CssHeaderStyle" id="TabExport" style="border: 1px groove #000000; width: 200px;
                            cursor: hand;" align="center" onclick="onclickTab(1)">
                            مجوزهاي درخواست شده
                        </td>
                        <td id="TabImport" class="CssHeaderStyle" style="width: 200px; border: 1px groove #000000;
                            cursor: hand;" align="center" onclick="onclickTab(2)">
                            مجوزهاي محول شده
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <table id="TblExport" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" align="center">
                            <table class="DivStyle1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <div align="center" id="DivHeaderGrd" style="vertical-align: top; height: 20px">
                                            <table id="TblHeaderGrd" cellspacing="0">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div align="center" id="DivDocGrd" style="vertical-align: top; height: 30px">
                                            <table id="GrdDocInfo" cellspacing="0" onclick="OnClickGrdDocInfo(this)" ondblclick="OndbClickGrd()">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table id="TblImport" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="GridViewCountainer" align="center" class="DivStyle1">
                                        <cc2:KasraGrid ID="GrdImport" runat="server" OnRowDataBound="GridImport_RowDataBound"
                                            AllowSorting="false">
                                        </cc2:KasraGrid>
                                    </div>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtOrderString" runat="server" />
                                    <asp:HiddenField ID="txtType" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="XMLvDocs" runat="server" />
                                    <asp:HiddenField ID="txtSortExpression" runat="server" />
                                    <asp:HiddenField ID="txtSortDirection" runat="server" />
                                    <asp:HiddenField ID="txtTotalPage" runat="server" />
                                    <asp:HiddenField ID="txtXmlGrd" runat="server" />
                                    <asp:HiddenField ID="txtXmlFilter" runat="server" />
                                    <asp:HiddenField ID="txtXmlCombo" runat="server" />
                                    <asp:HiddenField ID="txtLoadGrdImport" runat="server" />
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
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtDocMemberCode" name="txtDocMemberCode" runat="server" />
        <input type="text" id="txtAccepter" name="txtAccepter" runat="server" />
        <input type="text" id="txtDocID" name="txtDocID" runat="server" />
        <input type="text" id="txtDocTypeID" name="txtDocTypeID" runat="server" />
        <input type="text" id="txtXmlWorkPeriod" name="txtXmlWorkPeriod" runat="server" />
        <input type="text" id="txtCurrWorkPeriod" name="txtCurrWorkPeriod" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtTabNumber" name="txtTabNumber" runat="server" />
        <input type="text" id="txtXmlDocInfo" name="txtXmlDocInfo" runat="server" />
        <input type="text" id="txtPageNumber" name="txtPageNumber" value="1" runat="server" />
        <input type="text" id="txtStrFilter" name="txtStrFilter" runat="server" />
        <input type="text" id="txtShowAll" name="txtShowAll" runat="server" />
        <input type="text" id="DocID" name="DocID" runat="server" />
        <input type="text" id="txtRD" name="txtRD" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtXmlComboDef" name="txtXmlComboDef" runat="server" />
        <input type="text" id="txtDescDelete" name="txtDescDelete" runat="server" />
        <input type="text" id="txtDescDeleteOption" name="txtDescDeleteOption" runat="server" />
        <input type="text" id="txtModeRD" name="txtModeRD" runat="server" />
        <input type="text" id="txtShowDocInfoInload" name="txtShowDocInfoInload" runat="server" />
        <asp:DropDownList ID="CmbDocTypeExtended" name="CmbDocTypeExtended" runat="server">
        </asp:DropDownList>
    </div>
    <%-- <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>--%>
    <script src="../../App_Utility/Scripts/Reports/DocInfoNew.js?v=1" type="text/javascript"></script>
</asp:Content>