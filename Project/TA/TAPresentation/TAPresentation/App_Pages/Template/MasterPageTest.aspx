<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" CodeBehind="MasterPageTest.aspx.cs" Inherits="TAPresentation.App_Pages.Template.MasterPageTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <input id="SDate" name="SDate" runat="server" type="text" />
        <input id="Button1" type="button" onclick="f()"
            value="button" />
      <input id="BtnSearch" name="BtnSearch" type="button" value="نمايش محدود" onclick="OnClickBtnSearch()"/></div>
    <div style="DIPLAY:none">
         <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
          <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
    </div>
     
    <script language="javascript" type="text/javascript">
        //ctl00_ContentPlaceHolder1_KCalSDate
       
        //alert(document.getElementById('ctl00_ContentPlaceHolder1_SDate').value)
        function f() {
            //alert(document.getElementById('ctl00_ContentPlaceHolder1_SDate').value)
           //alert($get('ctl00_ContentPlaceHolder1_SDate').value)
        }
        function OnClickBtnSearch() {
            //alert("ss")
           
            document.getElementById(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        
        
     </script>
    
</asp:Content>