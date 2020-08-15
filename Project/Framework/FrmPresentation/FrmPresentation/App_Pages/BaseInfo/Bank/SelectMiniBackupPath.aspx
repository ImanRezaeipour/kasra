<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="SelectMiniBackupPath.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.SelectMiniBackupPath" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.CssBtn
{
    background-position:center;
	BACKGROUND-REPEAT: no-repeat;	
	BACKGROUND-COLOR: transparent;
	BORDER-RIGHT: #346fa4 2px solid; 
	BORDER-TOP: lightsteelblue 2px solid; 
	BORDER-LEFT: lightsteelblue 2px solid; 
	BORDER-BOTTOM: #346fa4 2px solid;  
	WIDTH: 65px;
	HEIGHT: 30px	
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="DivSelectBackupPatch" style="text-align: center; vertical-align: middle;">
        <table align="center" dir="rtl">
            <tr>
                <td>
                    <fieldset dir="rtl" style="height: 80px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                        <legend style="color: lightblue">انتخاب مسير بکاپ</legend>
                        <table id="Table1" style="width: 450px; height: 80px;" cellpadding="0" align="center"
                            cellspacing="0">
                            <tr>
                                <td>
                                   نام ديتابيس :
                                </td>
                                <td>
                                    <input type="text" runat="server" id="txtDBName" style="width: 350px" class="TxtControls" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    مسير بکاپ :
                                </td>
                                <td>
                                    <input type="text" runat="server" id="txtSelectBackupPatch" style="width: 350px;
                                        height: 30px" class="TxtControls" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <table>
                        <tr>
                            <td>
                                <input id="BtnOK" name="BtnOK" type="button" onclick="onClickBtnOK()" style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/btnok.gif');
                                    cursor: pointer; height: 30px" class="CssBtn" />
                            </td>
                            <td>
                                <input id="BtnCancel" onclick="onClickBtnCancel()" name="BtnCancel" type="button"
                                    style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/Cancel.gif');
                                    cursor: pointer; height: 30px" class="CssBtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="display:none">
        <asp:HiddenField ID="txtFlag" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script language="javascript" type="text/javascript">
        document.getElementsByTagName("body")[0].scroll = "no";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.name = "SelectMiniBackupPath.aspx"
        aspnetForm.target = "SelectMiniBackupPath.aspx"

        if (document.getElementById(MasterObj + "txtFlag").value != "") {
            if (document.getElementById(MasterObj + "txtFlag").value == "1") {
                window.returnValue = document.getElementById(MasterObj + "txtSelectBackupPatch").value + "#" + document.getElementById(MasterObj + "txtDBName").value;
                window.close();
            }
            else
                alert("مسير انتخابي نادرست است.");
        }
        function onClickBtnOK() {
            if (document.getElementById(MasterObj + "txtDBName").value == "")
                alert("لطفا نام ديتابيس مورد نظر برای بکاپ گیری را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "txtSelectBackupPatch").value == "") 
              alert("لطفا مسير انتخابي برای کپي فايل بکاپ را وارد نماييد");
            else
                document.getElementById(MasterObj + "BtnSubmit").click()
        }
        function onClickBtnCancel() {
            window.returnValue = "";
            window.close();
        }
    </script>
</asp:Content>
