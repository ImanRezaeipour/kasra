<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="GoingManageNewWithStatus201.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.Admin.GoingManageNewWithStatus201" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">        
        <tr>
            <td style="height:20px">          
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="border: thin double #333333; scrollbar-highlight-color: white; overflow: auto; width: 320px; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 320px; background-color: #BBD1E8;">
                            <br />
                            <center>
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </center>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        <input type="text" id="txtSubmit" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtXML" name="txtXML" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <asp:HiddenField ID="txtCode" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/DataEntry/Admin/GoingManageNewWithStatus201.js"
        type="text/javascript"></script>
</asp:Content>
