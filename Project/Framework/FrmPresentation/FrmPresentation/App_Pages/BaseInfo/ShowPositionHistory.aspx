<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="ShowPositionHistory.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.ShowPositionHistory" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
     <div id="GridViewCountainer">
        <fieldset dir="rtl" style="width: 550px; height: 330px; border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
            align="center">
            <legend style="color: #78BED6">تاريخچه</legend>
            <br /><br />
            <asp:GridView ID="GrdHistory" runat="server" BackColor="White" BorderColor="#999999"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Vertical" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:ImageField DataImageUrlField="Active" HeaderText="وضعيت ">
                    </asp:ImageField>
                    <asp:BoundField DataField="DepartmentName" HeaderText="نام واحد" />
                    <asp:BoundField DataField="CreateDate" HeaderText="تاريخ" />
                    <asp:BoundField DataField="CreateTime" HeaderText="زمان " />
                    <asp:BoundField DataField="RoleType" HeaderText="نوع سمت" />
                    <asp:BoundField DataField="RoleTitle" HeaderText="عنوان سمت" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle CssClass="CssHeaderStyle" Font-Bold="True" BackColor="#000084" 
                    ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle CssClass="CssRow" BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
        </fieldset>
    </div>
    <input type="hidden" id="txtPCode" runat="server" />   
    <cc1:MySecurity ID="OnLineUser" runat="server">
    </cc1:MySecurity>
</asp:Content>
