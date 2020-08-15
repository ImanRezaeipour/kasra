<%@ Page Title="-----------------------------------------مجوز ماموريت --------------------------" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefieDutyCredit.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DefieDutyCredit" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/farsitype.js" type="text/javascript"></script>

    <script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        
    </script>
    <table align="center" width="700px" style="border: medium groove #C0C0C0; background-color: #DBE3F0;">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                نام پرسنلی :
            </td>
            <td>
                <uc4:ComboBox ID="CmbPerson" runat="server" />
            </td>
            <td>
                شماره سريال:
                <%--<input id="RdDaily" name="RdDaily" type="radio" runat="server" onclick="onchangeForGetCodePermission()" />روزانه--%>
            </td>
            <td>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                <div align="right">
                    <input id="txtSerialCode" type="text" class="TxtControls" style="width: 120px" runat="server"
                        onkeydown="OnKeyDownInt(this)" /></div>
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                از تاريخ :
            </td>
            <td>
                <div align="right">
                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                </div>
            </td>
            <td>
                گروه مجوز :
            </td>
            <td>
                <div align="right">
                    <select id="CmbGroupCode" name="CmbGroupCode" style="width: 190px" runat="server"
                        class="TxtControls" onchange="onchangeForGetCodePermission()">
                        <option></option>
                    </select></div>
                <%----%>
            </td>
        </tr>
        <tr>
            <td align="right">
                تا تاريخ :
            </td>
            <td>
                <div align="right">
                    <uc3:KCalendar ID="KCalEDate" runat="server" />
                </div>
            </td>
            <td>
                نوع مجوز :
            </td>
            <td>
                <div align="right">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <asp:HiddenField ID="ShouldBeOpen" runat="server" />
                            <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 190px"
                                class="TxtControls" onchange="ShouldBeOpen()">
                                <option></option>
                            </select>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <div align="right">
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                        Height="50px" Width="520px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table width="100%">
                    <tr>
                        <td id="DownRow" align="center">
                            <fieldset dir="rtl" style="width: 90%; height: 200px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="middle">
                                <legend style="color: #75A3D0">اطلاعات تکميلي</legend>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <div id="DivExtended" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 180px;">
                                            <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                            <asp:HiddenField ID="txtFirstTagName" runat="server" />
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtXMLCmbCredite" runat="server" />
                        <asp:HiddenField ID="txtSubmit" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtSearch" runat="server" />
                        <asp:HiddenField ID="txtTempSearch" runat="server" />
                        <asp:HiddenField ID="txtTmpPersonCode" runat="server" />
                        <asp:HiddenField ID="SearchRowIndex" runat="server" />
                        <asp:HiddenField ID="txtCreditID" runat="server" />
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtstrParam" name="txtstrParam" runat="server" />
        <input type="text" id="txtPName" name="txtPName" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
        <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
        <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
        <asp:HiddenField ID="txtCodeID" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtTmpPersonID" name="txtTmpPersonID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtExSaveXml" name="txtSubmit" runat="server" />
        <input type="text" id="txtXmlGrid" name="txtSubmit" runat="server" />
        <input type="text" id="txtVCredit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtExtended" name="txtExtended" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
    </div>

    <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        var str = "";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
        var lastPersonCode = "";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var IsChanged = false;
        var heightGeneral;
        var SaveNewFlag = 0;
        window.name = "CreditRegister.aspx"
        aspnetForm.target = window.name
        if (document.getElementById(MasterObj + "txtTableName").value != "")
            onload();
        //**************************************EndDeclaration*****************************************       
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        var SaveFlag = 0;

        function BeginRequestHandler(sender, args) {

            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";

            $get(MasterObj + "txtAlert").value = "";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {

            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";


            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "" || $get(MasterObj + "txtCreditID").value == "0") {
                    alert($get(MasterObj + "txtAlert").value)
                }
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    SaveFlag = 1;
                    window.returnValue = SaveFlag;
                    if (SaveNewFlag == 1)
                        OnClickBtnNew();
                }
            }
            if (StrVal == "GetCodePermision") {
                IsChanged = false;
                $get(MasterObj + "CmbCreditType").focus();
                $get(MasterObj + "CmbCreditType").setActive();

            }
            if (StrVal == "ShouldBeOpen") {
                IsChanged = false;
                if (document.getElementById(MasterObj + "ShouldBeOpen").value == 1) {
                }
            }
            if (StrVal == "Modify") {
                var OExGrid = document.getElementById("GrdExtendedCode");
                if (OExGrid != null) {
                }
            }


            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            SaveFlagNew = 0;
            if ($get(MasterObj + "CmbCreditType").innerHTML == "") {
                optionEl = document.createElement("OPTION")
                $get(MasterObj + "CmbCreditType").options.add(optionEl)
                // $get(MasterObj + "CmbCreditType").all(0).innerText = 'انتخاب نشده'
                // $get(MasterObj + "CmbCreditType").all(0).value = '0'
            }


        }
        //=================================================================
       function onload() {
           var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           xmlDoc.async = "false";

           xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
           var xmlNodes;
           xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");

           $get(MasterObj + "CmbPerson_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
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

           $get(MasterObj + "CmbGroupCode").value = xmlNodes.item(0).selectSingleNode('Type').text
           $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Des').text

           OnChangeCmbGrdGroupCode();

           if ($get(MasterObj + "txtModifyFlag").value == "0") {
               $get(MasterObj + "CmbPerson_txtCode").disabled = true;
               $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
               $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
               $get(MasterObj + "CmbGroupCode").disabled = true;
               $get(MasterObj + "CmbCreditType").disabled = true;
               $get(MasterObj + "txtDesc").disabled = true;
               document.getElementById("OToolBar_BtnNew").style.visibility = "hidden";
               document.getElementById("OToolBar_BtnSave").style.visibility = "hidden";
               document.getElementById("OToolBar_BtnSaveNew").style.visibility = "hidden";
           }
           $get(MasterObj + "CmbCreditType").value = xmlNodes.item(0).selectSingleNode('CreditType').text

       }
        //**************************************************************************
        //*************************************EndDeclaration*************************************

        document.getElementById(MasterObj + "KCalSDate_txtCalendar").attachEvent('onchange', onchangeForGetCodePermission)
        document.getElementById(MasterObj + "KCalEDate_txtCalendar").attachEvent('onchange', onchangeForGetCodePermission)

        //*************************************OnLoad*************************************
//        function resize(obj) {
//            if (obj == document.getElementById("ImgOpen")) {
//                document.getElementById("tdOpen").style.display = "none";
//                document.getElementById("tdClose").style.display = "inline";
//                document.getElementById("DownRow").style.display = "inline";
//                //                heightGeneral = window.dialogHeight;
//                //                topGeneral = window.dialogTop;
//                //                var height = window.document.body.scrollHeight;
//                //var width = window.document.body.scrollWidth;

//                //var left = screen.availWidth / 2 - width / 2; // center window horizontally
//                //                var top = screen.availHeight / 3 - height / 3; // center window vertically

//                //                //window.dialogLeft = left + "px";
//                //                window.dialogTop = top + "px";

//                //                window.dialogHeight = height + "px";

//                //window.dialogWidth = width + "px";
//            }
//            if (obj == document.getElementById("ImgClose")) {
//                document.getElementById("tdClose").style.display = "none";
//                document.getElementById("tdOpen").style.display = "inline";
//                document.getElementById("DownRow").style.display = "none";
//                //                var height = window.document.body.scrollHeight;
//                //                //var top = screen.availHeight * 3 + height * 3;  // center window vertically
//                //                window.dialogHeight = heightGeneral
//                //                window.dialogTop = topGeneral;

//            }
//        }
        //*******************************************************************************
        function OnChangeCmbGrdGroupCode() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
            var xmlNodes;
            $get(MasterObj + "CmbCreditType").innerHTML = ""

            var j = 0
            if ($get(MasterObj + "CmbGroupCode").value != 0 && $get(MasterObj + "CmbGroupCode").value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGroupCode").value + "]");
            }
            else {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
            }
            if (xmlNodes.length != 0) {
                if ($get(MasterObj + "CmbGroupCode").value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbCreditType").options.add(optionEl)
                    }
                }
                for (var i = 0; i < xmlNodes.length; ++i) {
                    optionEl = document.createElement("OPTION")
                    $get(MasterObj + "CmbCreditType").options.add(optionEl)
                    $get(MasterObj + "CmbCreditType").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    $get(MasterObj + "CmbCreditType").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++
                }
            }
        }
        //*******************************************************************************

        //*******************************************************************************
        function LoadCodes() {

            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

            if (IsChanged == true) {
                if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "")
                    alert("لطفا تاريخ شروع را وارد نماييد");
                else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "")
                    alert("لطفا تاريخ پايان را وارد نماييد");
                else if (sDate > eDate)
                    alert("تاريخ شروع بزرگتر از تاریخ پايان است");
                else if (document.getElementById(MasterObj + "CmbGroupCode").value == "0")
                    alert("لطفا گروه مجوز را وارد نماييد");
                else if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "")
                    alert("لطفا پرسنلی مورد نظر خود را انتخاب نماييد");
                else {
                    var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
                    var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
                    document.getElementById(MasterObj + "txtstrParam").value = "<Root><CodePermission><Flag></Flag><GroupCodeID>" + document.getElementById(MasterObj + "CmbGroupCode").value + "</GroupCodeID><PersonCode>" + document.getElementById(MasterObj + "CmbPerson_txtCode").value + "</PersonCode><SDate>" + sDate + "</SDate><EDate>" + eDate + "</EDate><OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</OnLineUserID><ISDaily>1</ISDaily><ISTimly>0</ISTimly></CodePermission></Root>"

                    document.getElementById(MasterObj + "txtSubmit").value = "GetCodePermision";
                    document.getElementById(MasterObj + "BtnSubmit").click();

                }
            }
        }

        //*******************************************************************************
        function OnClickBtnCancel() {
            window.returnValue = SaveFlag;
            window.close();
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "CmbPerson_txtCode").value = ""
            document.getElementById(MasterObj + "CmbPerson_txtName").value = ""
            document.getElementById(MasterObj + "KCalSDate_txtYear").value = ""
            document.getElementById(MasterObj + "KCalSDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KCalSDate_txtDay").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtYear").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            document.getElementById(MasterObj + "CmbGroupCode").selectedIndex =0
            document.getElementById(MasterObj + "CmbCreditType").value = "0"
            
            document.getElementById(MasterObj + "txtDesc").value = ""
            NewExendeCode();
            SaveNewFlag = 0;

        }
        //*******************************************************************************
        function NewExendeCode() {
            var OExGrid = document.getElementById("GrdExtendedCode");
            if (OExGrid != null) {
                for (var i = 1; i < OExGrid.rows.length; i++) {
                    if (OExGrid.rows(i).cells(1).firstChild.firstChild.tagName == 'SELECT')
                        OExGrid.rows(i).cells(1).firstChild.firstChild.value = 0;
                    if (OExGrid.rows(i).cells(3).firstChild.firstChild != null) {
                        if (OExGrid.rows(i).cells(3).firstChild.firstChild.tagName == 'SELECT')
                            OExGrid.rows(i).cells(3).firstChild.firstChild.value = 0;
                    }
                }
            }
        }
        //*******************************************************************************
        function onchangeRdDaily() {

        }
        //*******************************************************************************
        function chkIsEmpty() {
            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

            if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "")
                alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "")
                alert("لطفا تاريخ شروع مجوز را وارد نماييد");
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "")
                alert("لطفا تاريخ پايان مجوز را وارد نماييد");            
            else if (document.getElementById(MasterObj + "CmbGroupCode").value == "0")
                alert("لطفا گروه مجوز را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "CmbCreditType").value == "0" || document.getElementById(MasterObj + "CmbCreditType").value == "")
                alert("لطفا نوع مجوز را انتخاب نماييد ");
            else if (sDate > eDate)
                alert("تاريخ شروع بزرگتر از تاریخ پايان است");

            else
                return true;
        }
        //*******************************************************************************
        function save() {
            var xmlStr;
            var sDate = document.getElementById(MasterObj + "KCalSDate_txtDay").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtYear").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtDay").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtYear").value
            xmlStr = "<Root><Tb>";
            xmlStr = xmlStr + "<PersonID>" + document.getElementById(MasterObj + "CmbPerson_txtCode").value + "</PersonID>";
            xmlStr = xmlStr + "<PersonCode>" + document.getElementById(MasterObj + "CmbPerson_txtCode").value + "</PersonCode>";
            xmlStr = xmlStr + "<StartDate>" + sDate + "</StartDate>";
            xmlStr = xmlStr + "<EndDate>" + eDate + "</EndDate>";
            xmlStr = xmlStr + "<Type>" + document.getElementById(MasterObj + "CmbGroupCode").value + "</Type>";
            xmlStr = xmlStr + "<CreditType>" + document.getElementById(MasterObj + "CmbCreditType").value + "</CreditType>";
            xmlStr = xmlStr + "<StartTime>00:00</StartTime>";
            xmlStr = xmlStr + "<EndTime>00:00</EndTime>";
            xmlStr = xmlStr + "<Des>" + document.getElementById(MasterObj + "txtDesc").value + "</Des>";
            xmlStr = xmlStr + "<StatusType></StatusType>";
            xmlStr = xmlStr + "<UserPersonelID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";

            if (document.getElementById(MasterObj + "txtFieldValue").value == "")
                document.getElementById(MasterObj + "txtFieldValue").value = "0";
            xmlStr = xmlStr + "<CreditID>" + document.getElementById(MasterObj + "txtFieldValue").value + "</CreditID>";

            xmlStr = xmlStr + "</Tb><Setting><Flag>2</Flag></Setting></Root>";

            document.getElementById(MasterObj + "txtXml").value = xmlStr;
            // alert(document.getElementById(MasterObj + "txtXml").value)
        }
        //*******************************************************************************
        function SaveExtendedCode() {
            var StrXml = "";
            var OExGrid = DivExtended.firstChild;
            if (OExGrid.rows.length > 0) {
                StrXml = "<" + document.getElementById(MasterObj + "txtFirstTagName").value + ">";

                for (var i = 0; i < OExGrid.rows.length; i++) {
                    if (OExGrid.rows(i).cells(0).firstChild.tagName != "FIELDSET") {
                        if (OExGrid.rows(i).cells(1) != null)
                            if (OExGrid.rows(i).cells(1).firstChild != null) {
                            if (CheckValidData(OExGrid.rows(i).cells(1), OExGrid.rows(i).cells(0).firstChild.innerText)) {
                                StrXml = StrXml + "<" + OExGrid.rows(i).cells(1).Tag + ">" + GetData(OExGrid.rows(i).cells(1).firstChild) + "</" + OExGrid.rows(i).cells(1).Tag + ">"
                            }
                            else return false;
                        }
                        if (OExGrid.rows(i).cells(3) != null) {
                            if (OExGrid.rows(i).cells(3).firstChild != null) {
                                if (CheckValidData(OExGrid.rows(i).cells(3), OExGrid.rows(i).cells(2).firstChild.innerText)) {
                                    StrXml = StrXml + "<" + OExGrid.rows(i).cells(3).Tag + ">" + GetData(OExGrid.rows(i).cells(3).firstChild) + "</" + OExGrid.rows(i).cells(3).Tag + ">"
                                }
                                else return false;
                            }
                        }
                    }
                    else {
                        var OGrid = OExGrid.rows(i).cells(0).firstChild.childNodes(1);
                        StrXml = StrXml + "<" + OExGrid.rows(i).cells(0).firstChild.Tag + ">"
                        for (var j = 0; j < OGrid.rows.length; j++) {
                            if (OGrid.rows(j).cells(1) != null)
                                if (OGrid.rows(j).cells(1).firstChild != null) {
                                if (CheckValidData(OGrid.rows(j).cells(1), OGrid.rows(j).cells(0).firstChild.innerText)) {
                                    StrXml = StrXml + "<" + OGrid.rows(j).cells(1).Tag + ">" + GetData(OGrid.rows(j).cells(1).firstChild) + "</" + OGrid.rows(j).cells(1).Tag + ">"
                                }
                                else {
                                    return false;
                                }
                            }
                            if (OGrid.rows(j).cells(3) != null)
                                if (OGrid.rows(j).cells(3).firstChild != null) {
                                if (CheckValidData(OGrid.rows(j).cells(3), OGrid.rows(j).cells(2).firstChild.innerText)) {
                                    StrXml = StrXml + "<" + OGrid.rows(j).cells(3).Tag + ">" + GetData(OGrid.rows(j).cells(3).firstChild) + "</" + OGrid.rows(j).cells(3).Tag + ">"
                                }
                                else return false;
                            }

                        }
                        StrXml = StrXml + "</" + OExGrid.rows(i).cells(0).firstChild.Tag + ">";
                    }
                }
                StrXml = StrXml + "</" + document.getElementById(MasterObj + "txtFirstTagName").value + ">";

                document.getElementById(MasterObj + "txtExSaveXml").value = StrXml;
            }
            return true;
        }
        //*******************************************************************************
        function GetData(Obj) {
            if (Obj.tagName == "SCRIPT")
                return eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtYear').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtMonth').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtDay').value");
            else if (Obj.tagName == "INPUT") {
                if (Obj.getAttribute("type") == "checkbox")
                    return Obj.checked ? "1" : "0";
            }
            return Obj.value;
        }
        //===============================================================================        
        function CheckValidData(Obj, Caption) {

            if (Obj.Require == "True") {
                if (Obj.firstChild.value == "") {
                    alert(Caption + " را وارد کنيد");
                    return false;
                }
            }
            return true;
        }
        //===============================================================================
        function OnClickBtnSave() {
            if (chkIsEmpty()) {
                if (SaveExtendedCode()) {
                    save();
                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //*******************************************************************************
//        function onBlurtxtETime() {
//            if (document.getElementById(MasterObj + "txtSTime").value == "00:00" && document.getElementById(MasterObj + "txtETime").value == "00:00")
//                document.getElementById(MasterObj + "RdDaily").checked = true;
//        }
        //*******************************************************************************
        function onchangeForGetCodePermission() {       
            if (document.getElementById(MasterObj + "KCalSDate_txtCalendar").value != "" && document.getElementById(MasterObj + "KCalEDate_txtCalendar").value != "")
                IsChanged = true;
            LoadCodes();
        }
        //*******************************************************************************
        function ShouldBeOpen() {
            if ($get(MasterObj + "CmbCreditType").value != "0") {
                $get(MasterObj + "txtVCredit").value = "VCredit_" + $get(MasterObj + "CmbCreditType").value;
                document.getElementById(MasterObj + "txtSubmit").value = "ShouldBeOpen";
                document.getElementById(MasterObj + "BtnSubmit2").click();
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
        function OnClickBtnSaveNew() {
            SaveNewFlag = 1;
            OnClickBtnSave();

        }
        //*******************************************************************************
        //**********************************EndThisPage*************************************
  
        
    </script>

</asp:Content>
