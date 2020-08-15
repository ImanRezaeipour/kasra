<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SystemUserNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.SystemUserNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                کد پرسنلی :
                            </td>
                            <td colspan="2">
                                <uc4:ComboBox ID="CmbPesonel" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                نام کاربری :
                            </td>
                            <td>
                                <input type="text" id="txtUser" name="txtUser" style="width: 150px" class="TxtControls"
                                    runat="server" onkeydown="OnKeyDownInt(this)" />
                            </td>
                            <td>
                                کلمه عبور :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPass" runat="server" Style="width: 150px" class="TxtControls"
                                    onkeypress="return keyEnter(this,event)" TextMode="password" MaxLength="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                وضعيت دسترسی به سيستم :
                            </td>
                            <td>
                                <div align="right">
                                    <input type="radio" id="rdActive" runat="server" checked  />فعال
                                    <input type="radio" id="rdDeactive" runat="server" />غير فعال
                                </div>
                            </td>
                            <td>
                                تکرار کلمه عبور :
                            </td>
                            <td>
                                <asp:TextBox ID="txtrepatePass" runat="server" Style="width: 150px" class="TxtControls"
                                    onkeypress="return keyEnter(this,event)" TextMode="password" MaxLength="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                دسترسی از تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                دسترسی تا تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtChkKeya" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                    <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
                    <input type="text" id="txtSearchXML" name="txtSearchXML" runat="server" />
                    <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
                    <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtXmlDiscription" name="txtXmlDiscription" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtActive" name="txtActive" runat="server" />
                    <input type="text" id="txtCurDate" name="txtCurDate" runat="server" />
                    <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
                    <input type="text" id="txtValue" name="txtValue" runat="server" />
                    <input type="text" id="txtMaxUsrKey" name="txtMaxUsrKey" runat="server" />
                    <input type="text" id="txtMaxUser" name="txtMaxUser" runat="server" />
                    <input type="text" id="txtXmlDiscriptions" name="txtXmlDiscriptions" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <%-- TextMode="password"--%>
    <%-- TextMode="password"--%>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";
        document.body.scroll = "no";
        var str1 = ""
        //*********************************Close Page where Key Has Problem********************************
         if ($get(MasterObj + "txtValue").value == "1" && $get(MasterObj + "txtValidate").value == "5") {
             alert($get(MasterObj + "txtAlert").value)
                window.close();
            }
        //---------------------------------------------------
        $(document).ready(function () {
           
           
        });
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";
        
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

        //====================================================================================================
        function EndRequestHandler(sender, args) {
            //        alert($get(MasterObj + "txtAlert").value)
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                    if ($get(MasterObj + "txtValidate").value != "1") {
                        alert($get(MasterObj + "txtAlert").value);
                        if ($get(MasterObj + "txtValidate").value == "5") {
                            window.close();
                        }
                    }
                    else
                        window.close();
                if (document.getElementById(MasterObj + "txtSubmit").value == "Modify&new") {
                    if ($get(MasterObj + "txtValidate").value != "1") {
                        alert($get(MasterObj + "txtAlert").value);
                        if ($get(MasterObj + "txtValidate").value == "5") {
                            window.close();
                        }
                    }
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        OnClickBtnNew()
                    }
                }
                if ($get(MasterObj + "txtChkKeya").value == "1")
                    $get(MasterObj + "rdDeactive").checked = true;

                
            }

            document.getElementById(MasterObj + "txtSubmit").value = ""
            document.getElementById(MasterObj + "txtAlert").value = ""
            LastSelectedRow = "";
            LastSelectedRowClass = "";
            $get(MasterObj + "txtChkKeya").value = "";
        }

        //=========================load Discription======================================== 
        if (document.getElementById(MasterObj + "txtID").value != 0) {
            if ($get(MasterObj + "txtXmlDiscription").value != "<BaseInfoEntity></GetSystemDescription>" || $get(MasterObj + "txtXmlDiscription").value != "<BaseInfoEntity/>") {
                var str = $get(MasterObj + "txtXmlDiscription").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)

                var XmlNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetSystemDescription");
                if (XmlNode.length != 0) {
                    $get(MasterObj + "CmbPesonel_txtCode").value = XmlNode.item(0).selectSingleNode("Code").text.toString();
                    $get(MasterObj + "CmbPesonel_txtPCode").value = XmlNode.item(0).selectSingleNode("Code").text.toString();
                    $get(MasterObj + "CmbPesonel_txtName").value = XmlNode.item(0).selectSingleNode("DisplayName").text.toString();
                    $get(MasterObj + "CmbPesonel_txtCode").disabled = true;
                    $get(MasterObj + "CmbPesonel_txtPCode").disabled = true;
                    $get(MasterObj + "CmbPesonel_txtName").disabled = true;
                    $get(MasterObj + "CmbPesonel_BtnDown").disabled = true;
                    $get(MasterObj + "txtUser").value = XmlNode.item(0).selectSingleNode("UserName").text.toString();
                    //                    $get(MasterObj + "txtPass").value = XmlNode.item(0).selectSingleNode("Password").text.toString();
                    //                    $get(MasterObj + "txtrepatePass").value = XmlNode.item(0).selectSingleNode("Password").text.toString();
                    $get(MasterObj + "KCalSDate_txtYear").value = XmlNode.item(0).selectSingleNode("StartDateTime").text.substr(0, 4)
                    $get(MasterObj + "KCalSDate_txtMonth").value = XmlNode.item(0).selectSingleNode("StartDateTime").text.substr(5, 2)
                    $get(MasterObj + "KCalSDate_txtDay").value = XmlNode.item(0).selectSingleNode("StartDateTime").text.substr(8, 2)

                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value

                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                    $get(MasterObj + "KCalEDate_txtYear").value = XmlNode.item(0).selectSingleNode("ExpireDateTime").text.substr(0, 4)
                    $get(MasterObj + "KCalEDate_txtMonth").value = XmlNode.item(0).selectSingleNode("ExpireDateTime").text.substr(5, 2)
                    $get(MasterObj + "KCalEDate_txtDay").value = XmlNode.item(0).selectSingleNode("ExpireDateTime").text.substr(8, 2)

                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                    $get(MasterObj + "txtActive").value = XmlNode.item(0).selectSingleNode("Active").text.toString();

                    //                    alert($get(MasterObj + "txtActive").value)
                    //                    alert($get(MasterObj + "rdDeactive").checked )
                    if ($get(MasterObj + "txtActive").value == "true")
                        $get(MasterObj + "rdActive").checked = true
                    else

                        $get(MasterObj + "rdDeactive").checked = true



                }
            }
        }
        // ===============================Save ==================================   
        function OnClickBtnSave() {
            $get(MasterObj + "txtPersonID").value = $get(MasterObj + "CmbPesonel_txtCode").value
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

            //             alert(document.getElementById(MasterObj + "txtID").value)
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = "";

            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = "";
            //            alert($get(MasterObj + "txtActive").value)
            if ($get(MasterObj + "rdActive").checked == true) $get(MasterObj + "txtActive").value = "1"

            else
                $get(MasterObj + "txtActive").value = "0"
            //                alert($get(MasterObj + "txtActive").value)

            if (ChkNotIsEmpty()) {
                $get(MasterObj + "txtSubmit").value = "Modify";
                $get(MasterObj + "BtnSubmit").click();

            }

        }
        //================================================= ==============================================
        function MakeXmlSave() {
            $get(MasterObj + "txtPersonID").value = $get(MasterObj + "CmbPesonel_txtCode").value
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

            //             alert(document.getElementById(MasterObj + "txtID").value)
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = "";

            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = "";
            //            alert($get(MasterObj + "txtActive").value)
            if ($get(MasterObj + "rdActive").checked == true) $get(MasterObj + "txtActive").value = "1"

            else
                $get(MasterObj + "txtActive").value = "0"
            //                alert($get(MasterObj + "txtActive").value)

            if (ChkNotIsEmpty()) {
                $get(MasterObj + "txtSubmit").value = "Modify&new";
                $get(MasterObj + "BtnSubmit").click();
                //                alert()

            }

        }
        //============================== SaveContinue  ================================   
        function OnClickBtnSaveContinue() {
            //        alert()
            MakeXmlSave()

        }
        // =============================== چک کردن خالی نبودن آبجکت ها ==================================   
        function ChkNotIsEmpty() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
            //             alert(SDate)
            //             alert(EDate)

            if (document.getElementById(MasterObj + "CmbPesonel_txtCode").value == "") {
                alert("لطفا کد پرسنلی را وارد کنید ");
                return false;
            }
            else if (document.getElementById(MasterObj + "txtUser").value == "") {
                alert("لطفا نام کاربری را وارد کنید ");
                document.getElementById(MasterObj + "txtUser").focus();
                return false;
            }

            else if ($get(MasterObj + "KCalSDate_txtCalendar").value == "") {
                alert("لطفا تاريخ شروع را وارد نماييد");
                document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus();
                return false;
            }
            else if ($get(MasterObj + "KCalEDate_txtCalendar").value == "") {
                alert("لطفا تاريخ پايان را وارد نماييد");
                document.getElementById(MasterObj + "KCalEDate_txtCalendar").focus();
                return false;
            }
            else if (SDate > EDate) {
                alert("تاريخ شروع بزرگتر از تاریخ پايان است")

                return false;
            }
            if (document.getElementById(MasterObj + "txtID").value == 0) {
                if (document.getElementById(MasterObj + "txtPass").value == "") {
                    alert("لطفا کلمه عبور را وارد کنید ");
                    document.getElementById(MasterObj + "txtPass").focus();
                    return false;
                }


                else if (document.getElementById(MasterObj + "txtrepatePass").value == "") {
                    alert("لطفا تکرار  کلمه عبور را وارد کنید ");
                    document.getElementById(MasterObj + "txtrepatePass").focus();
                    return false;
                }

                else if (document.getElementById(MasterObj + "txtPass").value != document.getElementById(MasterObj + "txtrepatePass").value) {
                    alert("لطفا کلمه عبور با تکرار کلمه عبور یکسان نیست ");
                    document.getElementById(MasterObj + "txtPass").focus();
                    return false;
                }
            }

            //           
            return true;
        }
        // =====================================================================
        function OnClickBtnNew() {

            document.getElementById(MasterObj + "txtID").value = ""
            $get(MasterObj + "CmbPesonel_txtPCode").value = ""
            $get(MasterObj + "CmbPesonel_txtCode").value = ""
            $get(MasterObj + "CmbPesonel_txtName").value = ""

            $get(MasterObj + "CmbPesonel_txtCode").disabled = false;
            $get(MasterObj + "CmbPesonel_txtPCode").disabled = false;
            $get(MasterObj + "CmbPesonel_txtName").disabled = false;
            $get(MasterObj + "CmbPesonel_BtnDown").disabled = false;

            document.getElementById(MasterObj + "txtUser").value = ""
            document.getElementById(MasterObj + "txtPass").value = ""
            document.getElementById(MasterObj + "txtrepatePass").value = ""
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "rdActive").checked = true
        }
    </script>
</asp:Content>
