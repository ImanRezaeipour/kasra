<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefineNewExtendedField.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.DefineNewExtendedField" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="style1">
        <tr>
            <td>
                شي انتخابي:</td>
            <td>
                </td>
            <td>
                نوع فيلد</td>
            <td>
                <select id="CmbTypeField" name="CmbTypeField" class="TxtControls" style="width: 150px"
                    runat="server">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                
                <table class="style1">
                    <tr>
                        <td>
                            نام فيلد:</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            نوع فيلد</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            مقدار پيش فرض:</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr><td>اجباري</td>
                    <td>مخفي</td>
                    <td>Caption:</td>
                    <td>&nbsp;</td>
                    <td>شرح:</td>
                    <td></td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
    
</asp:Content>
