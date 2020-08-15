<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ReportPolicyPreview.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportPolicyPreview" ValidateRequest="false" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

   <cc2:KasraGrid ID="GrdPolicy" runat="server" OnRowDataBound="Grid_RowDataBound"
       AllowSorting="true" OnSorting="GrdPolicy_Sorting">
   </cc2:KasraGrid>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
    </div>
</asp:Content>

