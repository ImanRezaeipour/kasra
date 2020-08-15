<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="MemberFile.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.MemberFile" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                ستون اول فایل اکسل باید کلمه PCode باشد.
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <asp:HiddenField ID="txtStatus" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtMemberXml" runat="server" />
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
    </div>
    <script language="javascript" type="text/javascript">
        window.name = "MemberFile.aspx"
        aspnetForm.target = "MemberFile.aspx"

        try {
            if ($get(MasterObj + "txtAlert").value != "") {
                if (($get(MasterObj + "txtStatus").value == "0") || ($get(MasterObj + "txtStatus").value == "2")) {
                    alert($get(MasterObj + "txtAlert").value);
                    if ($get(MasterObj + "txtStatus").value == "2") {
                        SaveFlag = 1;
                        window.returnValue = $get(MasterObj + "txtMemberXml").value
                        window.close();
                    }
                }
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    SaveFlag = 1;
                    window.returnValue = $get(MasterObj + "txtMemberXml").value
                    window.close();
                }
            }
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtStatus").value = "";
        }
        catch (Exception) {
            alert("اطلاعات ناقص است");
        }
        function OnClickBtnOk() {
            var location = document.getElementById(MasterObj + "FileUpload1").value
            $get(MasterObj + "txtFilePath").value = location;
            var fileFormat = location.split('.')[1];

            if (location == "")
                alert("لطفا فايل مورد نظر خود را انتخاب کنيد");
            else if (location != "" && (fileFormat == "xlsx" || fileFormat == "xls"))
                document.getElementById(MasterObj + "BtnSubmit").click()
            else
                alert("فرمت فايل نادرست است")

        }
        function OnClickBtnCancel() {
            window.returnValue = "";
            window.close();
        }
    </script>
</asp:Content>
