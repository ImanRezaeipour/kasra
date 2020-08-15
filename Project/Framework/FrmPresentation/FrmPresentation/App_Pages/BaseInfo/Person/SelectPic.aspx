<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SelectPic.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.SelectPic"
    Title="------------------------------انتخاب تصوير--------------------------------------------------------------" %>

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
    <div style="text-align:center;vertical-align:middle">
        <table align="center"  dir="rtl">
            <tr>
                <td>
                    <fieldset dir="rtl" style="height: 80px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                        <legend style="color: lightblue">انتخاب تصوير</legend>
                        <table id="Table1" style="width: 299px; height:80px;" cellpadding="0" align="center"
                            cellspacing="0">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server"  />
                                </td>
                            </tr>
                            <tr>
                                  <td colspan="2" align="center">
                                    امکان ذخيره عکس با فرمت bmp ، gif ،png و jpg وجود دارد
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
           
            <tr>
                <td colspan="2" align="center">
                    <table style="width: 94px">
                        <tr>
                            <td>
                                <input id="BtnOK" name="BtnOK" type="button" onclick="onClickBtnOK()" style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/btnok.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>
                            <td>
                                <input id="BtnCancel" onclick="onClickBtnCancel()" name="BtnCancel" type="button"
                                    style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/Cancel.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <div style="display:none">
    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    <asp:HiddenField ID="txtPicPath" runat="server" />
    <asp:HiddenField ID="txtFlag" runat="server" />
    </div>
    
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        window.name = "SelectPic.aspx"
        aspnetForm.target = "SelectPic.aspx"

        if (document.getElementById(MasterObj + "txtFlag").value == 1) {
            window.returnValue = document.getElementById(MasterObj + "txtPicPath").value;
            window.close();
        }
        function onClickBtnOK() {
            var PicPathLen;
            var location = ""
            var fileFormat = ""
            location = document.getElementById(MasterObj + "FileUpload1").value


            PicPathLen = location.length;
            fileFormat = location.substr(PicPathLen - 3, 3)
            if (location != "" && (fileFormat == "gif" || fileFormat == "jpg" || fileFormat == "png" || fileFormat == "bmp"
           || fileFormat == "GIF" || fileFormat == "JPG" || fileFormat == "PNG" || fileFormat == "BMP")) {

                document.getElementById(MasterObj + "BtnSubmit").click()

            }
            else if (location != "")
                alert("فرمت فايل نادرست است")

        }
        function onClickBtnCancel() {
            window.returnValue = "";
            window.close();
        }
    </script>
</asp:Content>
