<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DocInfo.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DocInfo" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
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
        .PromptMessage
        {
            display: none;
            position: absolute;
            top: 40%;
            left: 40%;
            right: 35%;
            z-index: 3;
        }
        .CssHeaderPrompt
        {
            filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#7ea7e0, EndColorStr=#D5E2F4); /*background-image: url('../../App_Utility/Images/PageMain/BG38.gif');*/
            font-family: Tahoma;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="600" runat="server">
    </asp:ScriptManager>
    <table id="TBLBase" align="center" width="100%">
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table align="right" width="950px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                متقاضي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
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
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تاييد کننده :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbAccepter" runat="server" />
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
                <table id="TblExport" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="GridViewCountainer" align="center" class="DivStyle1">
                                        <cc2:KasraGrid ID="GrdDocInfo" runat="server" OnRowDataBound="Grid_RowDataBound"
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
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <table id="TblImport" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="Div1" align="center" class="DivStyle1">
                                        <cc2:KasraGrid ID="GrdImport" runat="server" OnRowDataBound="GridImport_RowDataBound"
                                            AllowSorting="false">
                                        </cc2:KasraGrid>
                                    </div>
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
    <div id="PromptMessage" class="PromptMessage" >
        <table width="100%" style="border-top-style: double; border-right-style: double; border-left-style: double;
            border-bottom-style: double; border-top-width: medium; border-right-width: medium;
            border-left-width: medium; border-bottom-width: medium; border-top-color: #336699;
            border-right-color: #336699; border-left-color: #336699; border-bottom-color: #336699;
            background-color: #b0c4de" cellpadding="0" cellspacing="0" border="2" width="300px ;">
            <tr>
                <td colspan="2" id="Td1" valign="middle" style=" height: 7px;
                    width: 90%;">
                    <div align="right" class="CssHeaderPrompt">
                        <img style="display: inline" onclick="onclickCancelPrompt()" id="imgClose" src="/TAPresentation/App_Utility/Images/Icons/close1.png" />
                    </div>
                </td>
            </tr>
           
            <tr >
                <td colspan="2" style="height: 40%;">
                    آیا برای حذف مطمئنید؟<br/>
                    <br/>

                   <nobr>شرح حذف</nobr><input type="text" value="" id="txtComment" style="width: 280px" />
                    
                </td>
            </tr>
            <tr>
                <td align="left" style="height: 7px; width: 10%;">
                    <%-- <img style="display: inline" onclick="onclickCancelPrompt()" id="imgClose" src="/TAPresentation/App_Utility/Images/Icons/close1.png" />--%>
                    <input type="button" id="BtnOk" runat="server" onclick="onclickOkPrompt()" value="تايِيِد"
                        style="width: 60px" class="CssHeaderStyle"/>
                </td>
                <td align="right" style="height: 7px; width: 10%;">
                    <input type="button" id="BtnCancel" runat="server" onclick="onclickCancelPrompt()"
                        value="انصراف" style="width: 60px" class="CssHeaderStyle"/>
                </td>
            </tr>
        </table>
    </div>
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
        <input type="text" id="txtRD" name="txtRD" runat="server" />
        <input type="text" id="txtModeRD" name="txtModeRD" runat="server" />
        <input type="text" id="txtDescDelete" name="txtDescDelete" runat="server" />
        <input type="text" id="txtDescDeleteOption" name="txtDescDeleteOption" runat="server" />
        <input type="text" id="txtShouldDescDelete" name="txtShouldDescDelete" runat="server" />
        <input type="text" id="txtShowDocInfoInload" name="txtShowDocInfoInload" runat="server" />
        <input type="text" id="txtPName" name="txtPName" runat="server" />
    </div>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script src="../../App_Utility/Scripts/Reports/DocInfo.js" type="text/javascript"></script>
</asp:Content>
