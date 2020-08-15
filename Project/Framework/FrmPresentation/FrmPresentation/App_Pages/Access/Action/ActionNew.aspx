<%@ Page Title="تعريف فعاليت" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ActionNew.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action.ActionNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام فعاليت
                        </td>
                        <td style="text-align: right">
                            <input id="txtActionName" type="text" runat="server" width="150px" class="TxtControls" />
                        </td>
                        <td>
                            کد فعاليت
                        </td>
                        <td>
                            <input type="text" id="txtActionCode" name="txtSubmit" runat="server" class="TxtControls"
                                onkeypress="return keyEnter(this,event)" width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شرح
                        </td>
                        <td colspan="3" style="text-align:right">
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                                Height="50px" Width="370px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="ChkIcon" type="checkbox" onclick="onclickChk()" runat="server"/>                        
                            آيکن
                        </td>
                        <td colspan="3" style="text-align:right">
                            <asp:FileUpload ID="FileUploadIcon" onchange="onchangeFile()" runat="server" class="TxtControls" Enabled="false" />
                            <img runat="server" alt="" id="img" src="../../../App_Utility/Images/Icons/Blank.gif"
                                style="width: 20px; height: 20px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:right">
                            امکان ذخيره عکس با فرمت bmp ، gif ،png و jpg وجود دارد
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtActionID" runat="server" />
                            <asp:HiddenField ID="txtPicPath" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnSubmit" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtXmlSave" runat="server" />
        <input type="text" id="txtMsg" runat="server" />
        <input type="text" id="txtXMLDescription" runat="server" />
    </div>
    <script type="text/javascript" language="javascript">
        window.name = "ActionNew.aspx"
        aspnetForm.target = window.name; //for Not open page again when download img

        document.body.scroll = "no";
        var Str = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //---------------------------------------Load Description-----------------------------

        if ($get(MasterObj + "txtXMLDescription").value != "<AccessEntity></ActionDesc>" || $get(MasterObj + "txtXMLDescription").value != "<AccessEntity/>") {
            var str = $get(MasterObj + "txtXMLDescription").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(str)
            var XmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/ActionDesc");
            if (XmlNode.length != 0) {
                if ($get(MasterObj + "txtActionID").value != "0") {
                    $get(MasterObj + "txtActionName").value = XmlNode.item(0).selectSingleNode("Name").text.toString();
                    $get(MasterObj + "txtActionCode").value = XmlNode.item(0).selectSingleNode("Code").text.toString();
                    $get(MasterObj + "txtDesc").value = XmlNode.item(0).selectSingleNode("Descr").text.toString();
                    var obj = $get(MasterObj + "FileUploadIcon");
                    $get(MasterObj + "img").src = XmlNode.item(0).selectSingleNode("Icon").text.toString();
                    obj.value = XmlNode.item(0).selectSingleNode("Icon").text.toString();
                }
            }
        }
        //-------------------------------------------------------------------------------
        if ($get(MasterObj + "txtMsg").value != "") alert($get(MasterObj + "txtMsg").value)
        else {
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    window.returnValue = "1"
                    SetMsg($get(MasterObj + "txtAlert").value);
                    if ($get(MasterObj + "txtsubmit").value == "ModifyContinue")
                        NewTextBox();
                }
                else
                    alert($get(MasterObj + "txtAlert").value)
            }

            $get(MasterObj + "txtAlert").value = ""
        }
        //------------------------------save-----------------------------------------------
        function OnClickBtnSave() {
            if (CHECKISEMPTY()) {
                MakeXML();
                //                            if (confirm("                                                            فايل/فايلهايي با نام " + String.fromCharCode(13) + "                                           " + document.getElementById(MasterObj + "txtAlert").value + String.fromCharCode(13) + " وجود دارد . آيا مي خواهيد فايل/فايلهاي جديد را جايگزين کنيد ؟")) {
                document.getElementById(MasterObj + "txtSubmit").value = "Modify"
                document.getElementById(MasterObj + "BtnSubmit").click()
                //                            }
            }
        }
        //------------------------------------------------------------------------
        function CHECKISEMPTY() {
            var PicPathLen;
            var location = ""
            var fileFormat = ""
            location = document.getElementById(MasterObj + "FileUploadIcon").value

            if (document.getElementById(MasterObj + "txtActionName").value == "") {
                alert("لطفا نام فعاليت را وارد کنيد")
                $get(MasterObj + "txtActionName").focus();
                return false;
            }
            else
                if (document.getElementById(MasterObj + "txtActionCode").value == "") {
                    alert("لطفا کد فعاليت را وارد کنيد")
                    $get(MasterObj + "txtActionCode").focus();
                    return false;
                }
                else if (location != "") {
                    PicPathLen = location.length;
                    fileFormat = location.substr(PicPathLen - 3, 3);

                    if (fileFormat == "gif" || fileFormat == "jpg" || fileFormat == "png" || fileFormat == "bmp"
                             || fileFormat == "GIF" || fileFormat == "JPG" || fileFormat == "PNG" || fileFormat == "BMP") {
                        return true;
                    }
                    else {
                        alert("فرمت فايل نادرست است")
                        return false;
                    }
                }
            return true
        }
        //------------------------------------------------------------------
        function MakeXML() {
            Str += "<Root>";
            Str += "<Action>"
            Str += "<ActionID>" + document.getElementById(MasterObj + "txtActionID").value + "</ActionID>"
            Str += "<ActionName>" + document.getElementById(MasterObj + "txtActionName").value + "</ActionName>"
            Str += "<ActionCode>" + document.getElementById(MasterObj + "txtActionCode").value + "</ActionCode>"
            Str += "<Descr>" + document.getElementById(MasterObj + "txtDesc").value + "</Descr>"
            Str += "</Action>"
            Str += "</Root>"
            document.getElementById(MasterObj + "txtXmlSave").value = Str;
            Str = ""
        }
        //=======================================================ذخیره و ادامه=====================
        function OnClickBtnSaveContinue() {
            if (CHECKISEMPTY()) {
                MakeXML();
                document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //------------------------------------------------------خالی کردن---------------------------
        function NewTextBox() {
            $get(MasterObj + "txtPicPath").value = 0; 
            $get(MasterObj + "txtActionName").value = "";
            $get(MasterObj + "txtActionCode").value = "";
            $get(MasterObj + "txtActionCode").value = "";
            $get(MasterObj + "txtDesc").value = "";
            $get(MasterObj + "FileUploadIcon").value = "";
        }
        function onchangeFile() {
            $get(MasterObj + "img").src = $get(MasterObj + "FileUploadIcon").value;
        }
        //-------------------------------------------------------------------------------------------------
        function onclickChk() {
            if ($get(MasterObj + "ChkIcon").checked)
                $get(MasterObj + "FileUploadIcon").disabled = false
            else
                $get(MasterObj + "FileUploadIcon").disabled = true;
        }                  
    </script>
</asp:Content>
