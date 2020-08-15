<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ScriptParameter.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.ScriptParameter"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var MasterObjSearch = "ctl00_Snap3_ContentPlaceHolderSearch_";
        window.name = "GroupMember.aspx"
        window.target = window.name;
        /////-------------------------------------------
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="GrdScriptParameter_Header">
                </table>
                <table id="GrdScriptParameter">
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSessionID" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtScriptID" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        
        <input type="text" id="txtXMLModify" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
</asp:Content>
