<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
CodeBehind="frameDownLoad.aspx.cs"  Inherits="FrmPresentation.App_Pages.Setting.frameDownLoad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div onclick="Confirm()" id="dd" 
        style="text-decoration: underline; color:#3A77BA; cursor: pointer;" >
   
     دانلود فايل zip فونت ها
      
    </div>
   <div style="display:none"> <asp:Button ID="BtnConfirm" runat="server" onclick="Btn_Click"/></div>
    <script language="javascript" type="text/javascript">
        document.body.scroll = "no";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
       
        // ------------------------------------------------------
        function Confirm() {
            document.getElementById(MasterObj + "BtnConfirm").click()
        }
       </script>
</asp:Content>
