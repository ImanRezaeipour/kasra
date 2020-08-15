<%@ Page Title="-----------------------------------------------------------------درخواست ماموريت--------------------------------------------------------------------------"
    Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineDutyCredit.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DefineDutyCredit" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <table align="center" width="650px"   class="DivStyle"   >
        <tr>   
            <!------------------------------------ToolBar----------------------------------------->
            <td align="center" colspan="4" id="TdToolbar">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr id="SerialTR">
            <td style="text-align: right">
                پرسنلی :
            </td>
            <td>
                <uc4:ComboBox ID="CmbPerson" runat="server" />
            </td>
            <!------------------------------------نمایش شماره حکم ماموريت----------------------------------------->
            <td style="color: Green; font-size: 12; font-weight: bold; text-align: right; ">
                شماره حکم :
            </td>
            <td >
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <input type="text" runat="server" id="txtSerialNo" class="TxtControls" style="width:180px" onkeydown="OnKeyDownOnlyInt()"/>
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtCreditID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                واحد سازماني :
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <asp:Label ID="lblDeptName" runat="server" Style="color: black; border: 1px solid #6699FF;
                            width: 210px; height: 20px"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <!-----------------------------------آيتم های ثابت فرم----------------------------------------->
            <td style="text-align: right">
                نوع مجوز :
            </td>
            <td>
                <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 180px"
                    onchange="onchangeCmbCreditType()" class="TxtControls">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
               تاريخ شروع :
            </td>
            <td>
                <div align="right">
                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                </div>
            </td>
            <td style="text-align: right">
               ساعت شروع :
            </td>
            <td>
                <input id="txtSTime" type="text" onfocus="onfocusItem(this)" class="TxtControls"
                    style="width: 80px" runat="server" onblur="Timechk(this)" value="00:00" onkeydown="OnKeyDownTime(this)" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
               تاريخ خاتمه :
            </td>
            <td>
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
            <td style="text-align: right">
               ساعت خاتمه :
            </td>
            <td>
                <input id="txtETime" type="text" onfocus="onfocusItem(this)" class="TxtControls"
                    style="width: 80px" runat="server" onblur="Timechk(this)" value="00:00" onkeydown="OnKeyDownTime(this)" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                شرح :
            </td>
            <td colspan="3">
                <div align="right">
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls" Height="70px" Width="510px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <!--------------------------------------------قسمت غیر ثابت ------------------------------------->
        <tr id="Tr1" runat="server">
            <td id="ExtendedTR" colspan="4" align="center" >
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <fieldset  class="fieldsetStyle" style="height:200px">
                            <legend class="legendStyle">اطلاعات تکميلي</legend>
                            <table>
                                <tr>
                                    <td id="DivExtended">
                                        <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                        <asp:HiddenField ID="txtFirstTagName" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUserID" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtExSaveXml" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtExtended" name="txtExtended" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtIdentitySerialNoOption" name="txtIdentitySerialNoOption"
            runat="server" />
        <input type="text" id="txtMonthly" name="txtMonthly" runat="server" />
        <input type="text" id="txtCalcOption" runat="server" />
        <input type="text" id="txtTimeValidation" runat="server" />
        <input type="text" id="txtTimeActive" runat="server" />
        <input type="text" id="txtCrditIdIsNumber" runat="server" />
        <input type="text" id="txtScriptGroupXML" runat="server" />
        <input type="text" id="txtAccessBtn" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Extended.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        $("#" + MasterObj + "CmbPerson_txtOnChangeFunc").val("OnChangeCmbPerson()");
      
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var IsChanged = false;
        var heightGeneral;
        var SaveFlag = 0;
        window.name = "DefineDutyCredit.aspx"
        aspnetForm.target = window.name
        if ($get(MasterObj + "txtIdentitySerialNoOption").value == "1")
            $get(MasterObj + "txtSerialNo").disabled = true;
        if (document.getElementById(MasterObj + "txtTableName").value != "")
            onload();
        if ($get(MasterObj + "txtModifyFlag").value == "0")
            document.getElementById("TdToolbar").style.display = "none";


        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML($get(MasterObj + "txtAccessBtn").value)
        var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
        if (xmlNodes.length != 0) {
            if (xmlNodes.item(0).selectSingleNode('BtnSelectGroup') && xmlNodes.item(0).selectSingleNode('BtnSelectGroup').text == 2)
                document.getElementById('OToolBar_BtnSelectGroup').style.display = "none"
        }
        if ($get(MasterObj + "txtIdentitySerialNoOption").value == "0")
            document.getElementById('OToolBar_BtnSelectGroup').style.display = "none"
        //**************************************EndDeclaration*****************************************       
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "DepartmentOfPerson")
                document.getElementById("ctl00_ProgressState").value = 1;
        }
        //====================================check option TimeActive================================================
        if ($get(MasterObj + "txtTimeActive").value == "0") {
            $get(MasterObj + "txtSTime").disabled = true;
            $get(MasterObj + "txtETime").disabled = true;
        }
        else {
            $get(MasterObj + "txtSTime").disabled = false;
            $get(MasterObj + "txtETime").disabled = false;
        }
        //======================================================================================
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
                    alert($get(MasterObj + "txtAlert").value)
                else {
                    SaveFlag = 1;
                    window.returnValue = SaveFlag;

                    alert($get(MasterObj + "txtAlert").value)
                    window.close();
                }

            }
            //------------------------------------------------------------
            if ($get(MasterObj + "txtSubmit").value == "Modify") {
                if ($get(MasterObj + "txtMonthly").value == "1"
                && $get(MasterObj + "txtValidate").value == "1") {
                    RefreshParentRow()
                    window.close()
                }
            }
            //------------------------------------------------------------
            if ($get(MasterObj + "txtIdentitySerialNoOption").value == "1")
                $get(MasterObj + "txtSerialNo").disabled = true;
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
        }
        //**************************************EndDeclaration*****************************************\
        function RefreshParentRow() {
            try {
                if ($get(MasterObj + "txtCalcOption").value != "0") {
                    win = window.dialogArguments
                    if (win.RefreshThisRowCreditInfo)
                        win.RefreshThisRowCreditInfo()
                }
            }
            catch (e) {
                /**/
            }
        }
        //*******************************************************************************
        function onload() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
            var xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");
            if (xmlNodes.item(0).selectSingleNode('SerialNo') != null)
                $get(MasterObj + "txtSerialNo").value = xmlNodes.item(0).selectSingleNode('SerialNo').text;
            $get(MasterObj + "CmbPerson_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
            $get(MasterObj + "CmbPerson_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
            $get(MasterObj + "CmbPerson_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
            $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(0, 2);
            $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(3, 2);
            $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(6, 4);
            $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('StartDate').text
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            $get(MasterObj + "KCalEDate_txtDay").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(0, 2);
            $get(MasterObj + "KCalEDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(3, 2);
            $get(MasterObj + "KCalEDate_txtYear").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(6, 4);
            $get(MasterObj + "KCalEDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('EndDate').text
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            $get(MasterObj + "CmbCreditType").value = xmlNodes.item(0).selectSingleNode('CreditType').text
            $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Des').text
            $get(MasterObj + "txtCreditID").value = xmlNodes.item(0).selectSingleNode('CreditID').text
            if (xmlNodes.item(0).selectSingleNode('StartTime').text != "00:00") {
                $get(MasterObj + "txtSTime").value = xmlNodes.item(0).selectSingleNode('StartTime').text
                $get(MasterObj + "txtETime").value = xmlNodes.item(0).selectSingleNode('EndTime').text
                Timechk(document.getElementById(MasterObj + "txtSTime"));
                Timechk(document.getElementById(MasterObj + "txtETime"));
            }
            //-----------------------Disable For Modify---------------------------------------------------
            $get(MasterObj + "CmbPerson_txtCode").disabled = true;
            $get(MasterObj + "CmbPerson_txtPCode").disabled = true;
            $get(MasterObj + "CmbPerson_btnDown").disabled = true;
            $get(MasterObj + "CmbCreditType").disabled = true;
            if (typeof document.getElementById("OToolBar_BtnNew") == "object") {
                if (document.getElementById("OToolBar_BtnNew") != null)
                    document.getElementById("OToolBar_BtnNew").style.display = "none";
            }
            //--------------------------------------------------------------------------------------------
        }
        //******************************************************************************
        function OnClickBtnNew() {
            $get(MasterObj + "CmbPerson_txtCode").value = ""
            $get(MasterObj + "CmbPerson_txtPCode").value = ""
            $get(MasterObj + "CmbPerson_txtName").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "txtSerialNo").innerText = "";
            $get(MasterObj + "txtExtended").value = "";
            $get(MasterObj + "txtDesc").value = ""
            $get(MasterObj + "txtSTime").value = "00:00"
            $get(MasterObj + "txtETime").value = "00:00"
            $get(MasterObj + "txtCreditID").value = "";
            $get(MasterObj + "txtSerialNo").value = "";
            $get(MasterObj + "lblDeptName").innerText = "";
            $get(MasterObj + "txtScriptGroupXML").value = "";
            NewExendeCode();
        }

        //*******************************************************************************
        function chkIsEmpty() {
            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            var STime = $get(MasterObj + "txtSTime").value;
            STime = STime.split(':')[0] * 60 + STime.split(':')[1];
            var ETime = $get(MasterObj + "txtETime").value;
            ETime = ETime.split(':')[0] * 60 + ETime.split(':')[1];
            if ($get(MasterObj + "txtIdentitySerialNoOption").value == "0" && $get(MasterObj + "txtSerialNo").value == "")
                alert("لطفا شماره حکم ماموريت را وارد نماييد");
            else if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "" &&
               ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
               || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
                alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "")
                alert("لطفا تاريخ شروع مجوز را وارد نماييد");
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "")
                alert("لطفا تاريخ پايان مجوز را وارد نماييد");
            else if (document.getElementById(MasterObj + "CmbCreditType").value == "0" || document.getElementById(MasterObj + "CmbCreditType").value == "")
                alert("لطفا نوع مجوز را انتخاب نماييد ");
            else if (sDate > eDate)
                alert("تاريخ شروع بزرگتر از تاریخ پايان است");
            else if (STime == 000 && document.getElementById(MasterObj + "txtTimeValidation").value == "1" && $get(MasterObj + "txtTimeActive").value == "1")
                alert("ساعت شروع را وارد نماييد");
            else if (STime != 0 && ETime == 0 && document.getElementById(MasterObj + "txtTimeValidation").value == "1" && $get(MasterObj + "txtTimeActive").value == "1")
                alert("ساعت خاتمه را وارد نماييد");
            else if (STime == 0 && ETime != 0 && document.getElementById(MasterObj + "txtTimeValidation").value == "1" && $get(MasterObj + "txtTimeActive").value == "1")
                alert("ساعت شروع را وارد نماييد");
            else if ((STime != 0 || ETime != 0) && parseInt(STime) > parseInt(ETime) && sDate == eDate)
                alert("ساعت شروع بزرگتر از ساعت خاتمه است");
            else
                return true;
        }
//        function chkIsEmpty() {
//            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
//            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
//            var STime = $get(MasterObj + "txtSTime").value;
//            STime = STime.split(':')[0] * 60 + STime.split(':')[1];
//            var ETime = $get(MasterObj + "txtETime").value;
//            ETime = ETime.split(':')[0] * 60 + ETime.split(':')[1];

//            if ($get(MasterObj + "txtIdentitySerialNoOption").value == "0" && $get(MasterObj + "txtSerialNo").value == "")
//                alert("لطفا شماره حکم ماموريت را وارد نماييد");
//            else if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "")
//                alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
//            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "")
//                alert("لطفا تاريخ شروع مجوز را وارد نماييد");
//            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "")
//                alert("لطفا تاريخ پايان مجوز را وارد نماييد");
//            else if (document.getElementById(MasterObj + "CmbCreditType").value == "0" || document.getElementById(MasterObj + "CmbCreditType").value == "")
//                alert("لطفا نوع مجوز را انتخاب نماييد ");
//            else if (sDate > eDate)
//                alert("تاريخ شروع بزرگتر از تاریخ پايان است");
//            else if (STime != 0 && ETime == 0)
//                alert("ساعت خاتمه را وارد نماييد");
//            else if (STime == 0 && ETime != 0)
//                alert("ساعت شروع را وارد نماييد");
//            else if ((STime != 0 || ETime != 0) && parseInt(STime) > parseInt(ETime) && sDate == eDate)
//                alert("ساعت شروع بزرگتر از ساعت خاتمه است");
//            else
//                return true;
//        }
        //*******************************************************************************
        function save() {
            var xmlStr;
            var sDate = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
            var eDate = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
            var STime = $get(MasterObj + "txtSTime").value;
            STime = STime.split(':')[0] * 60 + STime.split(':')[1];
            var ETime = $get(MasterObj + "txtETime").value;
            ETime = ETime.split(':')[0] * 60 + ETime.split(':')[1];
            if ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>"
            || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>"
            || $get(MasterObj + "txtScriptGroupXML").value == "undefined"
            || $get(MasterObj + "txtScriptGroupXML").value == ""
            || ($get(MasterObj + "txtCreditID").value != "" && $get(MasterObj + "txtCreditID").value != "0")) {
                xmlStr = "<Root><Tb>";
                xmlStr = xmlStr + "<PersonID>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonID>";
                xmlStr = xmlStr + "<PersonCode>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonCode>";
                xmlStr = xmlStr + "<StartDate>" + sDate + "</StartDate>";
                xmlStr = xmlStr + "<EndDate>" + eDate + "</EndDate>";
                xmlStr = xmlStr + "<Type>25</Type>";
                xmlStr = xmlStr + "<CreditType>" + $get(MasterObj + "CmbCreditType").value + "</CreditType>";
                xmlStr = xmlStr + "<StartTime>" + $get(MasterObj + "txtSTime").value + "</StartTime>";
                xmlStr = xmlStr + "<EndTime>" + $get(MasterObj + "txtETime").value + "</EndTime>";
                xmlStr = xmlStr + "<Des>" + $get(MasterObj + "txtDesc").value + "</Des>";
                xmlStr = xmlStr + "<StatusType></StatusType>";
                xmlStr = xmlStr + "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";
                if (($get(MasterObj + "txtFieldValue").value == "" || $get(MasterObj + "txtFieldValue").value == "0")
                && ($get(MasterObj + "txtIdentitySerialNoOption").value == "1"))
                    xmlStr = xmlStr + "<SerialNo></SerialNo>";
                else
                    xmlStr = xmlStr + "<SerialNo>" + $get(MasterObj + "txtSerialNo").value + "</SerialNo>";
                if (STime != 0 && ETime != 0) {
                    xmlStr = xmlStr + "<_Flags>1</_Flags>";
                }
                if ($get(MasterObj + "txtFieldValue").value == "")
                    $get(MasterObj + "txtFieldValue").value = "0";
                xmlStr = xmlStr + "<CreditID>" + $get(MasterObj + "txtFieldValue").value + "</CreditID>";
                xmlStr = xmlStr + "</Tb><Setting><Flag>2</Flag></Setting></Root>";
            }
            else {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + "txtScriptGroupXML").value);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                var XmlNodesLen = oXmlNodes.length;
                if (oXmlNodes.length > 0) {
                    xmlStr = "<Root>";
                    for (var i = 0; i < XmlNodesLen; i++) {
                        xmlStr = xmlStr + "<Tb>";
                        xmlStr = xmlStr + "<PersonID>" + oXmlNodes.item(i).selectSingleNode("MID").text + "</PersonID>";
                        xmlStr = xmlStr + "<PersonCode>" + oXmlNodes.item(i).selectSingleNode("MID").text + "</PersonCode>";
                        xmlStr = xmlStr + "<MType>" + oXmlNodes.item(i).selectSingleNode("Type").text + "</MType>";
                        xmlStr = xmlStr + "<StartDate>" + sDate + "</StartDate>";
                        xmlStr = xmlStr + "<EndDate>" + eDate + "</EndDate>";
                        xmlStr = xmlStr + "<Type>25</Type>";
                        xmlStr = xmlStr + "<CreditType>" + $get(MasterObj + "CmbCreditType").value + "</CreditType>";
                        xmlStr = xmlStr + "<StartTime>" + $get(MasterObj + "txtSTime").value + "</StartTime>";
                        xmlStr = xmlStr + "<EndTime>" + $get(MasterObj + "txtETime").value + "</EndTime>";
                        xmlStr = xmlStr + "<Des>" + $get(MasterObj + "txtDesc").value + "</Des>";
                        xmlStr = xmlStr + "<StatusType></StatusType>";
                        xmlStr = xmlStr + "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";
                        if (($get(MasterObj + "txtFieldValue").value == "" || $get(MasterObj + "txtFieldValue").value == "0")
                         && ($get(MasterObj + "txtIdentitySerialNoOption").value == "1"))
                            xmlStr = xmlStr + "<SerialNo></SerialNo>";
                        else
                            xmlStr = xmlStr + "<SerialNo>" + $get(MasterObj + "txtSerialNo").value + "</SerialNo>";
                        if (STime != 0 && ETime != 0) {
                            xmlStr = xmlStr + "<_Flags>1</_Flags>";
                        }
                        if ($get(MasterObj + "txtFieldValue").value == "")
                            $get(MasterObj + "txtFieldValue").value = "0";
                        xmlStr = xmlStr + "<CreditID>" + $get(MasterObj + "txtFieldValue").value + "</CreditID>";
                        xmlStr = xmlStr + "</Tb>";
                    }
                    xmlStr = xmlStr + "</Root>";
                }
            }
            $get(MasterObj + "txtXml").value = xmlStr;
        }
        //===============================================================================
        function OnClickBtnSave() {
            if (chkIsEmpty()) {
                if (SaveExtendedCode("txtExSaveXml")) {
                    save();
                    $get(MasterObj + "txtSubmit").value = "Modify";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //*******************************************************************************       
        function OnFocuseTxtSTime() {
            document.getElementById(MasterObj + "txtSTime").select()
        }
        //*******************************************************************************
        function OnFocuseTxtETime() {
            document.getElementById(MasterObj + "txtETime").select();
        }
        //*******************************************************************************
        function onchangeCmbCreditType() {
            document.getElementById(MasterObj + "BtnSubmit2").click();
        }
        //*******************************************************************************
        function onfocusItem(Obj) {
            Obj.select();
        }
        //*******************************************************************************
        function OnChangeCmbPerson() {
            if ($get(MasterObj + "CmbPerson_txtName").value != "") {
                $get(MasterObj + "txtSubmit").value = "DepartmentOfPerson";
                $get(MasterObj + "BtnSubmit").click();
            }
            else
                $get(MasterObj + "lblDeptName").innerText = "";  
        }
        //****************************************************************************
        function OnKeyDownOnlyInt() {
            if ($get(MasterObj + "txtCrditIdIsNumber").value == "1") {
                var key = window.event.keyCode;
                window.event.returnValue =
                        (
                            ((key >= 96) && (key <= 105)) ||
                                ((key >= 48) && (key <= 57)) ||
                                (key == 8) || (key == 9) || (key == 46) ||
                                ((key >= 35) && (key <= 40))
                        );
            }

        }
        //*******************************************************************************
        function OnClickBtnSelectGroup() {
            var strUrl = "../DataEntry/CreditScriptGroup.aspx?ScriptID=0"
                        + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                        + "&CreditScriptGroup=" + $get(MasterObj + "txtScriptGroupXML").value
                        + "&CreditID=" + $get(MasterObj + "txtCreditID").value;
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 420px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
            if (rValue != undefined)
                $get(MasterObj + "txtScriptGroupXML").value = rValue;
        }
        //*******************************************************************************
    </script>
</asp:Content>
