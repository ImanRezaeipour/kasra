<%@ Page Title="---------------------------------------------------------نمايش Log--------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ShowLogsShiftSchedule.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.ShowLogsShiftSchedule" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
        .centerCell
        {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
         <td align="center">
            <div id="GridViewCountainer" style="height: 550px; width: 1060px;" align="right">
                <cc2:KasraGrid ID="GrdLog" runat="server" OnRowDataBound="Grid_RowDataBound"  AllowSorting="false">
                </cc2:KasraGrid>
            </div>
            </td>
        </tr>
    </table>  
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />       
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <!--------------------------------------------------------------------->
        <input type="text" id="txtInstanceID" name="txtInstanceID" runat="server" />
        <!--------------------------------------------------------------------->
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
         <input type="text" id="txtDate" name="txtDate" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        document.getElementsByTagName("body")[0].scroll = "no";
        function onclickShowWF(obj) {
            var row = obj.parentElement.parentElement;           
            window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + row.WFDocID + "&DocId=" + row.getAttribute("ID"), "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
        }
    </script>
</asp:Content>
