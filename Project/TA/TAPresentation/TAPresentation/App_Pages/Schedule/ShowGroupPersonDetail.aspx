<%@ Page Title="-----------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ShowGroupPersonDetail.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.ShowGroupPersonDetail" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .CssRow
        {
            background-color: #C6D0E1;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <br />
    <div align="center" style="text-align: center;width:100%">
        <div style="float: right; width: 60px;text-align:left">
            نام:&nbsp;</div>
        <div style="float: right; width: 120px;text-align:right;color:#C40000" runat="server" id="DivName">
        </div>
        <div style="float: right; width:80px;text-align:left">
            کد پرسنلي:&nbsp;</div>
        <div style="float: right; width: 100px;text-align:right;color:#C40000" runat="server" id="DivPCode">
        </div>
    </div>
    <br style="font-size:1;" />
    <div id="GridViewCountainer">
        <fieldset dir="rtl" style="width: 550px; height: 330px; border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
            align="center">
            <legend style="color: #78BED6">ليست گروه ها</legend>
            <asp:GridView ID="GrdGroupsOfPerson" runat="server" BackColor="White" BorderColor="White"
                BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                GridLines="None" AutoGenerateColumns="False">
                <Columns>
                    <asp:ImageField DataImageUrlField="ISValid" HeaderText="وضعيت ">
                    </asp:ImageField>
                    <asp:BoundField DataField="Name" HeaderText="نام گروه" />
                    <asp:BoundField DataField="Acronym" HeaderText="نام مخفف" />
                    <asp:BoundField DataField="CategoryName" HeaderText="دسته بندي" />
                    <asp:BoundField DataField="SDate" HeaderText="از تاريخ" />
                    <asp:BoundField DataField="EDate" HeaderText="تا تاريخ" />
                </Columns>
                <HeaderStyle CssClass="CssHeaderStyle" Font-Bold="True" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle CssClass="CssRow" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <br />
        </fieldset>
    </div>
    <input type="hidden" id="txtPID" runat="server" />
    <input type="hidden" id="txtGroupID" runat="server" />
    <cc1:MySecurity ID="OnLineUser" runat="server">
    </cc1:MySecurity>
</asp:Content>
