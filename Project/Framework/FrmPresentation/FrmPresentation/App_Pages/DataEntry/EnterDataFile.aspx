<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="EnterDataFile.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.EnterDataFile" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>  
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" class="DivStyle" style="height: 200px">
                <fieldset dir="rtl" style="height: 80px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                    <legend style="color: lightblue">انتخاب فايل با فرمت اکسل یا txt</legend>
                    <table id="Table1" style="width: 370px; height: 20px;" cellpadding="0" align="center"
                        cellspacing="0">
                        <tr>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="360" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtMessage" runat="server" />
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:HiddenField ID="txtFilePath" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFileFormat" name="txtFileFormat" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
    </div>
<script language="javascript" type="text/javascript">

    document.body.style.overflowX = "hidden";
    document.body.style.overflowY = "hidden";
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    window.name = "EnterDataFile.aspx"
    aspnetForm.target = "EnterDataFile.aspx"
    //====================================================================================
    try {
        if ($("#" + MasterObj + "txtMessage").val() != "") {

            if ($("#" + MasterObj + "txtValidate").val() == "1")
               SetMsg($("#" + MasterObj + "txtMessage").val())
            else
                alert($("#" + MasterObj + "txtMessage").val());

        }
        $("#" + MasterObj + "txtValidate").val("");
        $("#" + MasterObj + "txtMessage").val("");
    }
    catch (Exception) {
        alert("خطا در انجام عملیات");
    }
    //====================================================================================
    function OnClickBtnOk() {
        var location =  $("#" + MasterObj + "FileUpload1").val() 
        $("#" + MasterObj + "txtFilePath").val(location);

        var fileFormat = location.split('.')[1];
        $("#" + MasterObj + "txtFileFormat").val(fileFormat);

        if (location == "")
            alert("لطفا فايل مورد نظر خود را انتخاب کنيد");
        else if (location != ""
             && (fileFormat == "txt" || fileFormat == "xlsx" || fileFormat == "xls")) {

            $("#" + MasterObj + "BtnSubmit").click();
        }
        else
            alert("فرمت فايل نادرست است")

    }
    //====================================================================================
</script>

</asp:Content>
