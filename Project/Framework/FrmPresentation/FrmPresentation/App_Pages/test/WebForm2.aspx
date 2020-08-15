<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="FrmPresentation.App_Pages.test.WebForm2" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/CodeCondition/CodeCondition.ascx" tagname="CodeCondition" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<uc1:CodeCondition ID="CodeCondition1" runat="server" />
 
</asp:Content>
