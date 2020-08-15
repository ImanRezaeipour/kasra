<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SelectFile.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.SelectFile" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
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
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="TblReciveFile">
                 <tr><td>فايل شماره1:&nbsp;<asp:FileUpload style="direction:ltr" ID="FileUpload1" runat="server" Width="450px" /></td></tr>  
                 <tr><td>فايل شماره2:&nbsp;<asp:FileUpload style="direction:ltr" ID="FileUpload2" runat="server" Width="450px" /></td></tr>  
                 <tr><td>فايل شماره3:&nbsp;<asp:FileUpload style="direction:ltr" ID="FileUpload3" runat="server" Width="450px" /></td></tr>  
                </table>
                
                <div style="display: none;">
                    <input id="txtFilePath" type="text" runat="server" />
                    <input id="txtFileID" type="text" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input id="txtValidate" type="text" runat="server" />
        <input id="txtMessage" type="text" runat="server" />
         <input id="txtSessionID" type="text" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.name = "SelectFile.aspx"
        aspnetForm.target = "SelectFile.aspx"

        //------------------------
        if ($("#" + MasterObj + "txtValidate").val() == "1") {
            window.returnValue = $("#" + MasterObj + "txtFileID").val();
            SetMsg($("#" + MasterObj + "txtMessage").val())
            window.close();

        } else
            if ($("#" + MasterObj + "txtValidate").val() == "0") {
                alert($("#" + MasterObj + "txtMessage").val())
            }
        //---------------------------     
        function OnClickBtnOK() {
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
       
    </script>
</asp:Content>
