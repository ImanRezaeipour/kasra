<%@ Page Title="-----------------------------------------------------------------------------------------------------------------------روند تاييد سند--------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DocFlow.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.DocFlow" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .CssLayer1
{
	border-style:solid;           
    border-right-color :#215fed;        
    border-top-color  :#215fed;        
    border-bottom-color :#215fed;   
    border-left-color :#215fed;          
    background :#c3d8f5;       
    border-width :2px          
}
.CssLayer2
{
	border-style:solid;           
    border-right-color :#6495ed;        
    border-top-color  :#87cefa;        
    border-bottom-color :#6495ed;   
    border-left-color :#87cefa;          
    background :#91b7df;       
    border-width :1px
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="CssLayer1" id="Layer1" height="100%" cellspacing="0" cellpadding="0"
        width="100%" align="right" border="0">
        <tr>
            <td valign="middle" align="center">
                <table class="CssLayer2" id="Layer2" height="100%" cellspacing="0" cellpadding="0"
                    width="100%" border="0">
                    <tr>
                        <td valign="middle" align="center">
                            <table class="CssPage" id="Page" style="height: 385px" cellspacing="0" cellpadding="0"
                                width="875" border="2">
                                <tr>
                                    <td id="DownRow" valign="top" align="center" height="352">
                                        <table id="Table5" style="height: 331px" cellspacing="2" cellpadding="2" width="100%"
                                            align="right" border="0">
                                            <tr>
                                                <td valign="top" align="center" style="height: 337px">
                                                    <div id="GridViewCountainer" align="center">
                                                        <cc2:KasraGrid ID="GrdWFLog" runat="server" AllowSendToPDF="true" AllowSendToExcel="true"
                                                            OnRowDataBound="Grid_RowDataBound">
                                                        </cc2:KasraGrid>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="center">
                                                    <table id="Table9" cellspacing="5" cellpadding="2" border="0">
                                                        <tr height="30">
                                                            <td style="width: 6px" valign="middle" align="center" width="6">
                                                                <input class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel();" type="button">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
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
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtShowClientIPInDocFlow" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
    </div>
<script>
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    document.getElementsByTagName("body")[0].scroll = "no";
    function OnClickBtnCancel() {
        window.close();
    }
    function OnClickBtnOnePDF() {
        $("#" + MasterObj + "txtSubmit").val("OnePDF");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }
    function OnClickBtnOneExcel() {
        $("#" + MasterObj + "txtSubmit").val("OneExcel");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }

</script>
</asp:Content>
