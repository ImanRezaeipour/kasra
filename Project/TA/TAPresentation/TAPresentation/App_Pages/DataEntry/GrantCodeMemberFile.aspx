<%@ Page Title="-----------------------------------دریافت از فایل---------------------------------------------------" AsyncTimeout="7200" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="GrantCodeMemberFile.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.GrantCodeMemberFile" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>            
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="7200">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>  
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" class="DivStyle" style="height: 200px">
                <fieldset dir="rtl" style="height: 80px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                    <legend style="color: lightblue">انتخاب فايل با فرمت اکسل</legend>
                    <table id="Table1" style="width: 370px; height: 20px;" cellpadding="0" align="center"
                        cellspacing="0">
                        <tr>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="360" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            سر ستون اول فايل بایستی PersonCode باشد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                               سر ستون های بعدی بایستی به عنوان نمونه بصورت C11001 باشد.
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <asp:HiddenField ID="txtStatus" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtMessage" runat="server" />
                <asp:HiddenField ID="txtMemberXml" runat="server" />
                <asp:HiddenField ID="txtCodeXml" runat="server" />
                <asp:HiddenField ID="txtXmlSave" runat="server" />
                <asp:HiddenField ID="txtXmlPersons" runat="server" />
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:HiddenField ID="txtFilePath" runat="server" />
        <asp:HiddenField ID="txtFlag" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtDirectSend" name="txtDirectSend" runat="server" />
        <input type="text" id="txtWPID" name="txtWPID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
        <input type="text" id="txtRepeatedItem" name="txtRepeatedItem" runat="server" />
    </div>
<script language="javascript" type="text/javascript">
    window.name = "MemberFile.aspx"
    aspnetForm.target = "MemberFile.aspx"
    document.body.style.overflowX = "hidden";
    document.body.style.overflowY = "hidden";
    var ParentDialog = window.dialogArguments;
    //====================================================================================
    try {
        ParentDialog.$get(MasterObj + "txtDirectSend").value = $get(MasterObj + "txtDirectSend").value;
        ParentDialog.$get(MasterObj + "txtXmlSave").value = $get(MasterObj + "txtXmlSave").value;
        ParentDialog.$get(MasterObj + "txtRepeatedItem").value = $get(MasterObj + "txtRepeatedItem").value;
        if ($get(MasterObj + "txtAlert").value != "") {
            if (($get(MasterObj + "txtStatus").value == "0") || ($get(MasterObj + "txtStatus").value == "2")) {
                if ($get(MasterObj + "txtValidate").value == "0")
                    alert($get(MasterObj + "txtAlert").value + "  " + $get(MasterObj + "txtMessage").value);
                else
                    alert($get(MasterObj + "txtAlert").value);
                if ($get(MasterObj + "txtStatus").value == "2"
                 && $get(MasterObj + "txtDirectSend").value == "") {
                    SaveFlag = 1;
                    window.returnValue = 1;
                    ParentDialog.$get(MasterObj + "txtExcelXml").value = $get(MasterObj + "txtMemberXml").value;
                    ParentDialog.$get(MasterObj + "txtCodeXml").value = $get(MasterObj + "txtCodeXml").value;                
                    ParentDialog.$get(MasterObj + "txtMemberXML").value = $get(MasterObj + "txtXmlPersons").value;
                    window.close();
                }
            }
            else {
                if ($get(MasterObj + "txtValidate").value == "0")
                    alert($get(MasterObj + "txtMessage").value);
                else
                    alert($get(MasterObj + "txtAlert").value);
                if ($get(MasterObj + "txtDirectSend").value == "") {
                    SaveFlag = 1;
                    window.returnValue = 1;
                    ParentDialog.$get(MasterObj + "txtExcelXml").value = $get(MasterObj + "txtMemberXml").value;
                    ParentDialog.$get(MasterObj + "txtCodeXml").value = $get(MasterObj + "txtCodeXml").value;
                    ParentDialog.$get(MasterObj + "txtMemberXML").value = $get(MasterObj + "txtXmlPersons").value;
                    window.close();
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1")
                window.close();

        }
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtStatus").value = "";
        $get(MasterObj + "txtValidate").value = "";
        $get(MasterObj + "txtMessage").value = "";
    }
    catch (Exception) {
        alert("خطا در انجام عملیات");
    }
    //====================================================================================
    function OnClickBtnOk() {
        var location = document.getElementById(MasterObj + "FileUpload1").value
        $get(MasterObj + "txtFilePath").value = location;
        var fileFormat = location.split('.')[1];

        if (location == "")
            alert("لطفا فايل مورد نظر خود را انتخاب کنيد");
        else if (location != "" && (fileFormat == "xlsx" || fileFormat == "xls")) {
            OpenModelPopup();
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        else
            alert("فرمت فايل نادرست است")

    }
    function OnClickBtnCancel() {
        window.returnValue = "";
        window.close();
    }
</script>

</asp:Content>
