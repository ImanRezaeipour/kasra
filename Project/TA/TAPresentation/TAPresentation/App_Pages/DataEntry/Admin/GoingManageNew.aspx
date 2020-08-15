
<%@ Page Title="================================================ریزترددها========================================"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="GoingManageNew.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.Admin.GoingManageNew"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="100%">
        <tr style="width: 600px">
            <td colspan="7" align="center" style="height: 20px">
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 380px;">
                    <table id="Table10" cellspacing="0" cellpadding="0" align="center" width="380px">
                        <tr>
                            <td dir="rtl">
                                شماره پرسنلي:
                            </td>
                            <td>
                                <asp:Label ID="txtPrsCode" runat="server" Text="Label" BorderColor="#FF3300" ForeColor="#FF3300"></asp:Label>
                            </td>
                            <td dir="rtl">
                                نام:
                            </td>
                            <td>
                                <asp:Label ID="txtName" runat="server" Text="Label" BorderColor="#FF3300" ForeColor="#FF3300"></asp:Label>
                            </td>
                            <td dir="rtl">
                                تاريخ:
                            </td>
                            <td>
                                <asp:Label ID="txtDate" runat="server" Text="Label" BorderColor="#FF3300" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td onclick="OnClickGardeshDCon()" style="cursor: pointer">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <img alt="" src="" runat="server" id="TypeOfModavemat" />
                        <asp:HiddenField ID="txtDayContinuationID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <input id="chkModavemat" type="checkbox" onclick="onClickModavemat(this)" runat="server" />
            </td>
            <td>
                مداومتکاری
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="border: thin double #333333; scrollbar-highlight-color: white; overflow: auto;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 430px; background-color: #BBD1E8;
                            width: 880px">
                            <br />
                            <center>
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </center>
                            <br />
                        </div>
                        <input type="text" id="txtSDate" name="txtSDate" style="display: none" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" style="display: none" />
                        <asp:HiddenField ID="txtXmlWfLog" runat="server" />
                        <asp:HiddenField ID="txtState" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <%--Change--%>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        <input type="text" id="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtXML" name="txtXML" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <asp:HiddenField ID="txtRowIndexForNew" runat="server" />
        <asp:HiddenField ID="DelXml" runat="server" />
        <asp:HiddenField ID="SaveXml" runat="server" />
        <asp:HiddenField ID="txtOldDesc" runat="server" />
        <asp:HiddenField ID="txtInsertModavemat" runat="server" />
        <asp:HiddenField ID="txtTime" runat="server" />
        <asp:HiddenField ID="txtAttendanceID" runat="server" />
        <asp:HiddenField ID="txtInoutKind" runat="server" />
        <asp:HiddenField ID="txtUntransfer" runat="server" />
        <asp:HiddenField ID="txtDeleteID" runat="server" />
        <asp:HiddenField ID="txtDesc" runat="server" />
        <asp:HiddenField ID="txtDateForSP" runat="server" />
        <asp:HiddenField ID="txtDelTaradod" runat="server" />
        <asp:HiddenField ID="txtModifyTaradod" runat="server" />
        <asp:HiddenField ID="txtModifyModavemat" runat="server" />
        <asp:HiddenField ID="txtCardCode" runat="server" />
        <asp:HiddenField ID="WFDocModavem" runat="server" />
        <asp:HiddenField ID="NewWF" runat="server" />
        <select runat="server" id="CardCodeTemp">
        </select>
        <asp:HiddenField ID="txtAttendanceTypeXML" runat="server" />
        <input type="text" id="txtTransmission" runat="server" />
         <input type="text" id="txtOptionCmbAttendanceType" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/DataEntry/Admin/GoingManageNew.js?v=1.2" type="text/javascript"></script>
</asp:Content>
