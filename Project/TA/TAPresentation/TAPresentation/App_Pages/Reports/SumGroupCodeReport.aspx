<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SumGroupCodeReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.SumGroupCodeReport" AsyncTimeout="1800"%>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>
<%@ Register Src="../../App_Utility/MultiCode/MultiCode.ascx" TagName="MultiCode"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
   .CssNewRow
        {
            background-color: #C7D0DF;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <table class="TableStyle" align="center" valign="middle" style="width: 100%">
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            دوره :
                        </td>
                        <td>
                            <asp:DropDownList Width="100px" ID="CmbPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td id="TDToPeriodText" style="display: inline">
                            تا دوره :
                        </td>
                        <td id="TDToPeriod" style="display: inline">
                            <asp:DropDownList Width="100px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                             گروه :
                        </td>
                        <td>
                            <uc3:MultiPerson ID="MultiGroups" runat="server" />
                        </td>
                        <td>
                            کد :
                        </td>
                        <td>
                            <uc1:MultiCode ID="MultiCodes" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td id="TDGetShowText" colspan="7">
                            <table>
                                <tr>
                                    <td>
                                        نوع نمايش :
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <input type="radio" checked="true" runat="server" name="RSum" id="RSum" runat="server" />سرجمع
                                                <input type="radio" name="RSum" runat="server" id="RAverage" runat="server" />میانگین
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
            </td>
        </tr>
        <tr valign="top">
            <td  valign="top">
                <uc2:ToolBar ID="OToolBar" runat="server" PageName="SumGroupCodeReport.aspx" PageID="131220" />
            </td>
        </tr>
        <tr>
            <td id="TopRow" align="center">
                <table id="TblGridGroupCode">
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" id="txtXmlGroupCode" name="txtXmlGroupCode" runat="server" />
                <input type="text" id="txtPeriod" name="txtPeriod" runat="server" />
                <input type="text" id="txtToPeriod" name="txtToPeriod" runat="server" />
                <input type="text" id="txtShowType" name="txtShowType" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <input type="text" id="TxtXmlHeaderGroupCode" name="TxtXmlHeaderGroupCode" runat="server" />
        <input type="text" id="txtMultiGroup" name="txtMultiGroup" runat="server" />
        <input type="text" id="txtMultiCode" name="txtMultiCode" runat="server" />
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/Reports/SumGroupCodeReport.js"
        type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/jquery.xmlDom.js" type="text/javascript"></script>
</asp:Content>

