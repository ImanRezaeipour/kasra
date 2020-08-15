<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="MonthlyCodeStatusReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.MonthlyCodeStatusReport"
    ValidateRequest="false" AsyncTimeout="7200" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssSymbolStyle
        {
            width: 200px; /* border: 1px groove #000000;
            background-color: #FFFFCC;*/
        }
        .CssHeaderInfo
        {
            /* border: 1px groove #000000;
            background-color: #FFD7FF;*/
        }
        .CssCellsStyle
        {
            border: 1px groove #000000;
            background-color: #BBD1E8;
            color: #05425b;
            font-weight: bolder;
            font-size:15;
            vertical-align:middle;
             /*-- background-image: url('../../App_Utility/Images/Icons/BGNew.png');

            background-repeat: repeat-x;--*/
        }
        .CssHeader
        {
            background-image: url('../../App_Utility/Images/Icons/BGNewM.png');
            background-repeat: repeat-x;
            color: Black;
            font-weight: 550;
        }
        .CssRowNumber
        {
            background-image: url('../../App_Utility/Images/Icons/BGNewM.png');
            background-repeat: repeat-x;
            color: Black;
            font-weight: 550;
            width: 50px;
            border-left-style: groove;
            border-left-width: 1px;
            border-left-color: Black;
        }
        .CssDayName
        {
            background-color: #FFD7FF;
            font-size: 9;
            color: Black;
            font-weight: bolder;
            border-left-style: groove;
            border-left-width: 1px;
        }
        .CssCodeDay
        {
            background-color:transparent;
            color: Black;
            font-weight: bolder;
            width:100%;
            height:10px;
            overflow:visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
    </asp:ScriptManager>
    <table width="100%" cellspacing="0" cellpadding="0" >
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            دوره:
                        </td>
                        <td>
                            <select class="TxtControls" style="width: 100px" id="CmbPeriod" runat="server">
                            </select>
                        </td>
                        <td>
                            پرسنلی:
                        </td>
                        <td>
                            <uc1:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                            واحد سازمانی:
                        </td>
                        <td>
                            <uc1:ComboBox ID="CmbDepartment" runat="server" />
                        </td>
                        <td>
                            گروه:
                        </td>
                        <td>
                            <uc1:ComboBox ID="CmbGroup" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <uc1:ToolBar ID="OToolBar" runat="server" />
        </tr>
        <tr>
            <td colspan="2" style="border: 1px groove #000000; height: 300px; width: 1200px"
                valign="top" align="right">
                <table width="1200px">
                    <tr>
                        <td valign="top" align="right">
                            <table id="TblPerson" style="width: 300px" cellpadding="0" cellspacing="0">
                            </table>
                        </td>
                        <td style="" valign="top" align="right">
                            <div id="DivGridData" style="overflow: auto; z-index: 10; width: 1000px">
                                <table id="TblDays" cellpadding="0" cellspacing="0">
                                </table>
                            </div>
                        </td>
                        <%--<td valign="top" align="right" style="width:200px">
                            <table id="TblSums" cellpadding="0" cellspacing="0">
                            </table>
                        </td>--%>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="TrFooter" style="display: none">
            <td colspan="2" style="width: 1320px" valign="top" align="center">
                <table id="TblFooter" class="CssHeaderPageMain" style="border-color: Gray; border-style: solid;
                    border-width: 1px">
                    <tr>
                        <td align="center">
                            <img src="../../App_Utility/Images/Icons/active_last.gif" onclick="OnClickBtnLast()"
                                style="cursor: pointer; vertical-align: middle" title='آخرين' />
                            <img src="../../App_Utility/Images/Icons/active_forward.gif" onclick="OnClickBtnNext()"
                                id="BtNext" style="cursor: pointer; vertical-align: middle" title='بعدي' />
                            <input type="text" onchange="OnBlurtxtCurPage(this)" style="width: 30px; alignment: center;
                                text-align: center; vertical-align: middle" id="txtCurPage" onfocus="onfocusItem(this)"
                                class="TxtControls" />
                            از <span style="width: 30px" id="TotalPage">0</span>
                            <img src="../../App_Utility/Images/Icons/active_back.gif" onclick="OnClickBtnPrv()"
                                id="BtnPrv" style="cursor: pointer; vertical-align: middle" title='قبلي' />
                            <img src="../../App_Utility/Images/Icons/active_first.gif" onclick="OnClickBtnFirst()"
                                style="cursor: pointer; vertical-align: middle" title='اولين' />
                            <span style="width: 30px" id="txtFrom">0</span> تا <span style="width: 30px" id="txtTo">
                                0</span> از<span style="width: 30px" id="txtTotalRow">0</span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       <%-- <tr>
            <td colspan="2">
                <asp:GridView ID="GrdPDF" runat="server" Width="100%" >
                </asp:GridView>
            </td>
        </tr>--%>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">سیمبل ها </legend>
                    <table>
                        <tr>
                            <td>
                                <table id="TblSign">
                                </table>
                            </td>
                            <td>
                                <table id="TblHeader">
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">اطلاعات سایر کدها</legend>
                    <table id="TblOtherCodes">
                    </table>
                </fieldset>
            </td>
        </tr>
        
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="hidden" id="txtXml" runat="server"  />
        <input type="hidden" id="txtSessionID" runat="server" />
        <input type="hidden" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" value="15" />
        <input type="text" id="txtPageNumber" name="txtPageNumber" value="1" runat="server" />
        <input type="text" id="txtTotalPage" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Reports/MonthlyCodeStatusReport.js?v=1" type="text/javascript"></script>
</asp:Content>
