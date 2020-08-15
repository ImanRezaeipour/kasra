<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="FrmPresentation.App_Pages.test.WebForm5" %>
<%@ Register src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" tagname="MultiDepartment" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <uc1:MultiDepartment ID="MultiDepartment1" runat="server" />
    <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
</asp:Content>
