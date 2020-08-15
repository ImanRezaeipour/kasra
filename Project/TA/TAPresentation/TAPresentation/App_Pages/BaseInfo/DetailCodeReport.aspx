<%@ Page Title="----------------------------------------------------------------------نمایش جزييات کدها-------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="DetailCodeReport.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.DetailCodeReport" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<style>
    .DivStyle
    {
        scrollbar-highlight-color: white;
        overflow: auto;
        width: 800px;
        scrollbar-arrow-color: black;
        scrollbar-base-color: #b0c4de;
        height: 500px;
    }
    .TableStyle
    {
        width: 796px;
        border: thin groove #000000;
        background-color: #C5D5E9;
    }
</style>
    <table class="TableStyle" align="center" valign="middle">
        <tr>
            <td id="TopRow">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="DivStyle">
                            <center>
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </center>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        <input type="text" id="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <a href="../../App_Utility/Images/Icons/btnSubNodes.gif" id="Url"></a>
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/DetailCodeReport.js"
        type="text/javascript"></script>
</asp:Content>

