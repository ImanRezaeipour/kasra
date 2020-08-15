<%@ Page Title="-------------------------------------------------------درخواست جابه جایی --------------------------------------------------------------------"
 Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ShiftRequest.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.ShiftRequest" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="600px" style="border: medium groove #C0C0C0; background-color: #C5D5E9;">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr align="center" valign="middle" style="width: 100%; background-color: #B5C0D7;">
            <td style="width: 100%; text-align: center" colspan="4" align="center">
                <table style="text-align: center; border-bottom-style: groove; border-bottom-width: 2px;
                    border-bottom-color: #000000;">
                    <tr>
                        <td>
                            <input id="RadUnilateral" type="radio" name="Type" checked="checked" onclick="OnCheckedrd1()" />جابجايی
                            
                        </td>
                        <td>
                            <input id="RadChange" type="radio" name="Type" onclick="OnCheckedrd1()" />جايگزينی
                        </td>
                        <td>
                            <input id="RadBilateral" type="radio" name="Type" onclick="OnCheckedrd2()" />جایگزینی
                            دو طرفه
                        </td>
                       
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 2px">
            </td>
        </tr>
        <tr>
            <td>
                از تاريخ :
            </td>
            <td>
                <uc3:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td>
                پرسنل متقاضي :
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                به تاريخ :
            </td>
            <td>
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
            <td>
                پرسنل جانشين :
            </td>
            <td>
                <uc4:ComboBox ID="cmbPersonCode2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                    Height="50px" Width="91%"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <!---------------------------------------------------------------->
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtFPerson" name="txtFPerson" runat="server" />
        <input type="text" id="txtSPerson" name="txtSPerson" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
         <input type="text" id="txtTableName" name="txtTableName" runat="server" />
          <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
         <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
          <input type="text" id="txtFlag" name="txtFlag" runat="server" />
    </div>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script language="javascript" type="text/javascript">
        document.getElementsByTagName("body")[0].scroll = "no";

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        if (document.getElementById(MasterObj + "txtTableName").value != "")
            onload();
        function onload() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");

            //--------------------------------------ست کردن نوع درخواست شامل جابجایی 3 - جایگزینی  2 - جایگزینی دوطرفه 1 ----
            if (xmlNodes.item(0).selectSingleNode('Type').text == "1")
                $get("RadUnilateral").checked = true;
            else if (xmlNodes.item(0).selectSingleNode('Type').text == "3")
                $get("RadBilateral").checked = true;
            else if (xmlNodes.item(0).selectSingleNode('Type').text == "2")
                $get("RadChange").checked = true;
            //-------------------------------------------
            $get(MasterObj + "cmbPersonCode1_txtCode").value = xmlNodes.item(0).selectSingleNode('FPersonelID').text
            $get(MasterObj + "cmbPersonCode1_txtPCode").value = xmlNodes.item(0).selectSingleNode('FPersonelID').text
            $get(MasterObj + "cmbPersonCode1_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName1').text

            $get(MasterObj + "cmbPersonCode2_txtCode").value = xmlNodes.item(0).selectSingleNode('SPersonelID').text
            $get(MasterObj + "cmbPersonCode2_txtPCode").value = xmlNodes.item(0).selectSingleNode('SPersonelID').text
            $get(MasterObj + "cmbPersonCode2_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName2').text

            $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('SDate').text.substr(0, 2);
            $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('SDate').text.substr(3, 2);
            $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('SDate').text.substr(6, 4);
            $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('SDate').text
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            if ($get("RadChange").checked == false) {
                $get(MasterObj + "KCalEDate_txtDay").value = xmlNodes.item(0).selectSingleNode('EDate').text.substr(0, 2);
                $get(MasterObj + "KCalEDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('EDate').text.substr(3, 2);
                $get(MasterObj + "KCalEDate_txtYear").value = xmlNodes.item(0).selectSingleNode('EDate').text.substr(6, 4);
                $get(MasterObj + "KCalEDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('EDate').text
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            }
            else if ($get("RadChange").checked == true) {
                $get(MasterObj + "KCalEDate_txtDay").value = ""
                $get(MasterObj + "KCalEDate_txtMonth").value = ""
                $get(MasterObj + "KCalEDate_txtYear").value = ""
                $get(MasterObj + "KCalEDate_txtCalendar").value = ""
                $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            }
            $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Desc').text;
            $get(MasterObj + "txtID").value = xmlNodes.item(0).selectSingleNode('ID').text;

            $get(MasterObj + "cmbPersonCode1_txtPCode").disabled = true;
            $get(MasterObj + "cmbPersonCode1_BtnDown").disabled = true;
            $get("OToolBar_BtnNew").style.display = "none";
            $get("OToolBar_BtnSaveNew").style.display = "none";

            if ($get(MasterObj + "txtModifyFlag").value == "0") {
                $get("RadUnilateral").disabled = true;
                $get("RadBilateral").disabled = true;
                $get("RadChange").disabled = true;

                $get(MasterObj + "cmbPersonCode1_txtPCode").disabled = true;
                $get(MasterObj + "cmbPersonCode2_txtPCode").disabled = true;
                $get(MasterObj + "cmbPersonCode1_BtnDown").disabled = true;
                $get(MasterObj + "cmbPersonCode2_BtnDown").disabled = true;
                $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
                $get(MasterObj + "KCalSDate_btnImg").disabled = true;
                $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
                $get(MasterObj + "KCalEDate_btnImg").disabled = true;
                $get(MasterObj + "txtDesc").disabled = true;
                $get("OToolBar_BtnNew").style.display = "none";
                $get("OToolBar_BtnSave").style.display = "none";
                $get("OToolBar_BtnSaveNew").style.display = "none";
            }

        }
        //-------------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
            $get(MasterObj + "txtAlert").value = "";
        }

        if ($get("RadUnilateral").checked == true || $get("RadChange").checked == true) {
            //--------------------------------غیر فعال کردن به تاریخ-------------------------------
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        }
        else if ($get("RadBilateral").checked == true) {
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        }
        //==================================EndRequestHandler==================================================
        function EndRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";


            if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                if ($get(MasterObj + "txtValidate").value != "1") {

                    alert($get(MasterObj + "txtAlert").value);
                }
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = "1";
                    window.close();
                }
            if (document.getElementById(MasterObj + "txtSubmit").value == "ModifyContinue") {
                if ($get(MasterObj + "txtValidate").value != "1")
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    OnClickBtnNew()
                    window.returnValue = "1";
                }
            }
            document.getElementById(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = ""
        }

        //==========================OnClickBtnNew=================
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtID").value = 0;

            document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value = ""
            document.getElementById(MasterObj + "cmbPersonCode1_txtPCode").value = ""
            document.getElementById(MasterObj + "cmbPersonCode1_txtName").value = ""
            $get(MasterObj + "txtFPerson").value = "";
      
            document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value = ""
            document.getElementById(MasterObj + "cmbPersonCode2_txtPCode").value = ""
            document.getElementById(MasterObj + "cmbPersonCode2_txtName").value = ""
            $get(MasterObj + "txtSPerson").value = "";

            document.getElementById(MasterObj + "KCalSDate_txtYear").value = ""
            document.getElementById(MasterObj + "KCalSDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "txtSDate").value = "";
            
            document.getElementById(MasterObj + "KCalEDate_txtYear").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "txtEDate").value = "";

            document.getElementById(MasterObj + "txtDesc").value = ""
     
            if ($get("RadUnilateral").checked == true) {
                //--------------------------------غیر فعال کردن به تاریخ-------------------------------
                $get(MasterObj + "KCalEDate_txtCalendar").disabled = true
                $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
            }         
        }
        //********************************chkIsEmpty***********************************************
        function chkIsEmpty() {
            var SDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
            var EDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
         
            if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "") {
                alert("لطفا از تاريخ را وارد نماييد");
                $get(MasterObj + "KCalSDate_txtCalendar").focus();
                return false;
            }

            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "") {
                alert("لطفا به تاريخ را وارد نماييد");
                $get(MasterObj + "KCalEDate_txtCalendar").focus();
                return false;
            }

            else if (document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value == "") {
                alert("لطفا پرسنل متقاضي را انتخاب کنید");
                $get(MasterObj + "cmbPersonCode1_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value == "") {
                alert("لطفا پرسنل جانشين را انتخاب کنید");
                $get(MasterObj + "cmbPersonCode2_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value == document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value) {
                alert("امکان انتخاب پرسنل متقاضي به عنوان جانشين وجود ندارد");
                $get(MasterObj + "cmbPersonCode2_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDesc").value == "") {
                alert("لطفا شرح را وارد نماييد");
                $get(MasterObj + "txtDesc").focus();
                return false;
            }
            if ($get("RadBilateral").checked == false) {
                   if (SDate > EDate) {
                    alert("تاريخ شروع از خاتمه بزرگتر است");
                    $get(MasterObj + "KCalSDate_txtCalendar").focus();
                    return false;
                }
            }
            else {
                $get(MasterObj + "txtFPerson").value = document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value
                $get(MasterObj + "txtSPerson").value = document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value
                $get(MasterObj + "txtSDate").value = SDate
                $get(MasterObj + "txtEDate").value = EDate
                return true;
            }
        }

        //----------------------------------chkIsEmpty2-------------------------------------------------------------
        function chkIsEmpty2() {
            var SDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
            var EDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;


            if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "") {
                alert("لطفا از تاريخ را وارد نماييد");
                $get(MasterObj + "KCalSDate_txtCalendar").focus();
                return false;
            }

            else if (document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value == "") {
                alert("لطفا پرسنل متقاضي را انتخاب کنید");
                $get(MasterObj + "cmbPersonCode1_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value == "") {
                alert("لطفا پرسنل جانشين را انتخاب کنید");
                $get(MasterObj + "cmbPersonCode2_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value == document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value) {
                alert("امکان انتخاب پرسنل متقاضي به عنوان جانشين وجود ندارد");
                $get(MasterObj + "cmbPersonCode2_txtPCode").focus();
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDesc").value == "") {
                alert("لطفا شرح را وارد نماييد");
                $get(MasterObj + "txtDesc").focus();
                return false;
            }

            else {
                if ($get("RadUnilateral").checked == true) {
                    $get(MasterObj + "txtFPerson").value = document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value
                    $get(MasterObj + "txtSPerson").value = document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value
                    $get(MasterObj + "txtSDate").value = SDate
                    $get(MasterObj + "txtEDate").value = SDate
                }
                else if ($get("RadChange").checked == true) {
                    $get(MasterObj + "txtFPerson").value = document.getElementById(MasterObj + "cmbPersonCode1_txtCode").value
                    $get(MasterObj + "txtSPerson").value = document.getElementById(MasterObj + "cmbPersonCode2_txtCode").value
                    $get(MasterObj + "txtSDate").value = SDate
                    $get(MasterObj + "txtEDate").value = "";
                }
                return true;

            }
        }
        //**********************************OnClickBtnSave*********************************************
        function OnClickBtnSave() {
            var Flag = false;

            if ($get("RadUnilateral").checked == true || $get("RadChange").checked == true)
                Flag = chkIsEmpty2();
            else if ($get("RadBilateral").checked)
                Flag = chkIsEmpty();

            if (Flag) {
                if ($get("RadUnilateral").checked == true) $get(MasterObj + "txtFlag").value = "1";
                else if ($get("RadChange").checked == true) $get(MasterObj + "txtFlag").value = "2";
                else if ($get("RadBilateral").checked == true) $get(MasterObj + "txtFlag").value = "3";
                document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
       // *******************************OnClickBtnSaveNew************************************************
        function OnClickBtnSaveNew() {
            var Flag = false;

            if ($get("RadUnilateral").checked == true || $get("RadChange").checked == true)
                Flag = chkIsEmpty2();
            else if ($get("RadBilateral").checked) Flag = chkIsEmpty();

            if (Flag) {
                if ($get("RadUnilateral").checked == true) $get(MasterObj + "txtFlag").value = "1";
                else if ($get("RadChange").checked == true) $get(MasterObj + "txtFlag").value = "2";
                else if ($get("RadBilateral").checked == true) $get(MasterObj + "txtFlag").value = "3";
                       document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue";
                document.getElementById(MasterObj + "BtnSubmit").click();
           }         
       }
        //----------------------------------------OnCheckedrd1----------------------------------------------
        function OnCheckedrd1() {
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
            document.getElementById(MasterObj + "KCalEDate_txtYear").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "txtEDate").value = "";
        }
        //----------------------------------------OnCheckedrd2-----------------------------------------------------------
        function OnCheckedrd2() {
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        }
    //**********************************EndThisPage************************************
    </script>
</asp:Content>
