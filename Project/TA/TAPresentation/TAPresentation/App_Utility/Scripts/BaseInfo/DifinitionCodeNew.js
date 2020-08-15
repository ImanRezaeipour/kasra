var Shift;
var UsedFlag = 0;
document.getElementById(MasterObj + "txtFormule").value = ""
BindPage();
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
function EndRequestHandler(sender, args) {
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtAlertStatus").value == "0")
            alert($get(MasterObj + "txtAlert").value);
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
            $get(MasterObj + "txtCodeId").value = $get(MasterObj + "txtUserCode").value
            $get(MasterObj + "txtUserCode").disabled = true
            returnValue = 1
        }
    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlertStatus").value = "";
    $get(MasterObj + "txtAlert").value = "";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!onload !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindPage() {
    if ($get(MasterObj + "txtXMLSave").value != "") {
        var strXml = $get(MasterObj + "txtXMLSave").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CodeDescription");
        if (oXmlNodes.length > 0) {
            var type = oXmlNodes.item(0).selectSingleNode("Type").text
            var StepID = oXmlNodes.item(0).selectSingleNode("StepID").text
            var SQLCommand = oXmlNodes.item(0).selectSingleNode("SQLCommand").text;
            var CategoryID = oXmlNodes.item(0).selectSingleNode("Category").text
            var Condition = oXmlNodes.item(0).selectSingleNode("Condition").text
            //for get DAte///////////////////////////////////////////////////////////
            var SDate = oXmlNodes.item(0).selectSingleNode("StartDate").text
            if (SDate != "") {
                $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
                $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
                $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

            }
            else {
                $get(MasterObj + "KCalSDate_txtDay").value = "01";
                $get(MasterObj + "KCalSDate_txtMonth").value = "01";
                $get(MasterObj + "KCalSDate_txtYear").value = "1301";
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            }
            var EDate = oXmlNodes.item(0).selectSingleNode("EndDate").text
            if (EDate != "") {
                $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
                $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
                $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            }
            else {
                $get(MasterObj + "KCalEDate_txtDay").value = "29";
                $get(MasterObj + "KCalEDate_txtMonth").value = "12";
                $get(MasterObj + "KCalEDate_txtYear").value = "1399";
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            }
            //end//////////////////////////////////////////////////////////////////////
            var Descript = "";
            if (oXmlNodes.item(0).selectSingleNode("Descript") != null)
                Descript = oXmlNodes.item(0).selectSingleNode("Descript").text;

            UsedFlag = oXmlNodes.item(0).selectSingleNode("UsedFlag").text
            $get(MasterObj + "txtUserCode").value = oXmlNodes.item(0).selectSingleNode("CodeID").text
            $get(MasterObj + "txtUserCode").disabled = true
            $get(MasterObj + "txtCodeName").value = oXmlNodes.item(0).selectSingleNode("CodeName").text
            $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Desc").text
            $get(MasterObj + "cmbCodeNature").value = type;
            $get(MasterObj + "txtShortKey").value = oXmlNodes.item(0).selectSingleNode("ShortKey").text
            $get(MasterObj + "txtCondition").value = Condition;
            $get(MasterObj + "txtAcronym").value = oXmlNodes.item(0).selectSingleNode("Acronym").text
            //----------------------------------------------------------------
            $get(MasterObj + "cmbCategory").value = CategoryID;
            if (SQLCommand != "") {
                if (StepID != 0 && SQLCommand.split('$').length < 2) {
                    document.getElementById("chkFormule").checked = true
                    onclickchkFormule()
                    $get(MasterObj + "cmbStep").value = StepID
                    document.getElementById(MasterObj + "txtFormule").value = SQLCommand;
                    document.getElementById(MasterObj + "txtDescription").value = Descript;
                    document.getElementById(MasterObj + "txtPriority").value = oXmlNodes.item(0).selectSingleNode("Priority").text
                    //$get(MasterObj + "cmbCategoryFormule").value = CategoryID;
                }
                else {
                    document.getElementById("ChkCombine").checked = true
                    onclickchkCombine();
                    SQLCommand = SQLCommand.split('$');
                    if (SQLCommand[0].length == 6 && SQLCommand[1].length == 6) {
                        $get(MasterObj + "CmbCode1_txtCode").value = SQLCommand[0].substr(1, 5);
                        $get(MasterObj + "CmbCode2_txtCode").value = SQLCommand[1].substr(1, 5);
                        $get(MasterObj + "CmbCode1_txtPCode").value = SQLCommand[0].substr(1, 5);
                        $get(MasterObj + "CmbCode2_txtPCode").value = SQLCommand[1].substr(1, 5);
                        $get(MasterObj + "CmbCode1_txtName").value = oXmlNodes.item(0).selectSingleNode("Code1").text
                        $get(MasterObj + "CmbCode2_txtName").value = oXmlNodes.item(0).selectSingleNode("Code2").text
                    }
                    else {
                        $get(MasterObj + "CmbCode1_txtCode").value = SQLCommand[0];
                        $get(MasterObj + "CmbCode2_txtCode").value = SQLCommand[1];
                        $get(MasterObj + "CmbCode1_txtPCode").value = SQLCommand[0];
                        $get(MasterObj + "CmbCode2_txtPCode").value = SQLCommand[1];
                    }
                    $get(MasterObj + "txtCombineDesc").value = Descript;
                    //$get(MasterObj + "cmbCategoryCombine").value = CategoryID;
                }
            }
            else {
                document.getElementById("chkFormule").checked = false
                onclickchkFormule()

                document.getElementById("ChkCombine").checked = false;
                onclickchkCombine();
            }
            //----------------------------------------------------------------
            var Active = oXmlNodes.item(0).selectSingleNode("Active").text
            if (Active == 0)
                document.getElementById(MasterObj + "rdbNoActive").checked = true
            else if (Active == 1)
                document.getElementById(MasterObj + "rdbActive").checked = true
            else if (Active == 2)
                document.getElementById(MasterObj + "rdbMActive").checked = true
            //----------------------------------------------------------------
        }
    }
    else {
        document.getElementById("chkFormule").checked = false;
        onclickchkFormule();
        document.getElementById("ChkCombine").checked = false;
        onclickchkCombine();
    }
    if ($get(MasterObj + "txtSystem").value == "1" || UsedFlag == 1) {
        $get(MasterObj + "txtCodeName").disabled = true;
        $get(MasterObj + "cmbCodeNature").disabled = true;
        $get(MasterObj + "rdbActive").disabled = true;
        $get(MasterObj + "rdbNoActive").disabled = true;
        $get(MasterObj + "rdbMActive").disabled = true;
        $get(MasterObj + "txtPriority").disabled = true;

        $get(MasterObj + "cmbStep").disabled = true;
        $get("chkFormule").disabled = true; 
        $get("ChkCombine").disabled = true;
        $get(MasterObj + "cmbCategory").disabled = true;

        $get(MasterObj + "CmbCode1_txtCode").disabled = true
        $get(MasterObj + "CmbCode2_txtCode").disabled = true
        $get(MasterObj + "CmbCode1_txtPCode").disabled = true
        $get(MasterObj + "CmbCode2_txtPCode").disabled = true
        $get(MasterObj + "CmbCode1_txtName").disabled = true
        $get(MasterObj + "CmbCode2_txtName").disabled = true
        $get(MasterObj + "CmbCode1_BtnDown").disabled = true
        $get(MasterObj + "CmbCode2_BtnDown").disabled = true
        $get(MasterObj + "txtCombineDesc").disabled = true;
        $get(MasterObj + "txtDescription").disabled = true; 
        document.getElementById('OToolBar_BtnSelectMember').style.display = "none";
        $get(MasterObj + "txtCondition").disabled = true;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true
        $get(MasterObj + "KCalSDate_btnCalender").disabled = true;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
                       
        $get(MasterObj + "txtFormule").disabled = true;
        $get("btnSelectCode").disabled = true;

        $get(MasterObj + "txtShortKey").disabled = true;
        document.getElementById('OToolBar_BtnNew').style.display = "none";
        document.getElementById('OToolBar_BtnSelectGroup').style.display = "none";
        if ($get(MasterObj + "txtSystem").value == "1") {
            $get(MasterObj + "txtDesc").disabled = true;
//            document.getElementById('OToolBar_BtnSave').style.display = "none";
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    $get("chkFormule").checked = false
    $get(MasterObj + "txtCodeName").value = ""
    $get(MasterObj + "txtDesc").value = ""
    $get(MasterObj + "txtCodeId").value = ""
    $get(MasterObj + "txtFormule").value = "" 
    $get(MasterObj + "cmbStep").value = 0
    $get(MasterObj + "rdbActive").checked = true
    $get(MasterObj + "rdbNoActive").checked = false
    $get(MasterObj + "rdbMActive").checked = false
    $get(MasterObj + "txtDescription").value = "";
    $get(MasterObj + "cmbCodeNature").value = "0";
    $get(MasterObj + "txtPriority").value = "1";
    $get(MasterObj + "cmbCategory").value = "0"
    $get(MasterObj + "txtCondition").value = "";
    $get(MasterObj + "KCalSDate_txtCalendar").value = ""
    $get(MasterObj + "KCalEDate_txtCalendar").value = ""
    $get(MasterObj + "txtScriptID").value = ""
    $get(MasterObj + "txtAcronym").value = ""
    //document.getElementById(MasterObj + "txtUserCode").value=""

    onclickchkFormule();

    $get("ChkCombine").checked = false
    $get(MasterObj + "CmbCode1_txtCode").value = "";
    $get(MasterObj + "CmbCode1_txtPCode").value = "";
    $get(MasterObj + "CmbCode1_txtName").value = "";
    $get(MasterObj + "CmbCode2_txtCode").value = "";
    $get(MasterObj + "CmbCode2_txtPCode").value = "";
    $get(MasterObj + "CmbCode2_txtName").value = "";
    $get(MasterObj + "txtCombineDesc").value = "";
    $get(MasterObj + "cmbCategory").value = "0";
    $get(MasterObj + "txtCondition").value = "";
    $get(MasterObj + "KCalSDate_txtCalendar").value = ""
    $get(MasterObj + "KCalEDate_txtCalendar").value = ""
    onclickchkCombine();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    if (checkNotEmpty() == true) {
        MakeXML()
        document.getElementById(MasterObj + "txtSubmit").value = "Save";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeXML() {
    var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    var Active = 1
    if (document.getElementById(MasterObj + "rdbNoActive").checked)
        Active = 0
    else if (document.getElementById(MasterObj + "rdbMActive").checked)
        Active = 2
    var XMLStr = "<Tb>"
    XMLStr = XMLStr + "<CodeID>" + document.getElementById(MasterObj + "txtUserCode").value + "</CodeID>"
    XMLStr = XMLStr + "<CodeName>" + document.getElementById(MasterObj + "txtCodeName").value + "</CodeName>"
    XMLStr = XMLStr + "<Desc>" + document.getElementById(MasterObj + "txtDesc").value + "</Desc>"
    XMLStr = XMLStr + "<type>" + $get(MasterObj + "cmbCodeNature").value + "</type>"
    XMLStr = XMLStr + "<StartDate>" + SDate + "</StartDate>"
    XMLStr = XMLStr + "<EndDate>" + EDate + "</EndDate>"
    XMLStr = XMLStr + "<Category>" + $get(MasterObj + "cmbCategory").value + "</Category>"
    XMLStr = XMLStr + "<Condition>" + $get(MasterObj + "txtCondition").value + "</Condition>" 
    if (document.getElementById(MasterObj + "txtShortKey").value != "")
        XMLStr = XMLStr + "<ShortKey>" + $get(MasterObj + "txtShortKey").value + "</ShortKey>";
    if (document.getElementById(MasterObj + "txtAcronym").value != "")
        XMLStr = XMLStr + "<Acronym>" + document.getElementById(MasterObj + "txtAcronym").value + "</Acronym>";
    if (document.getElementById("chkFormule").checked == true) {
        XMLStr = XMLStr + "<StepID>" + $get(MasterObj + "cmbStep").value + "</StepID>"
        XMLStr = XMLStr + "<Active>" + Active + "</Active>"
        XMLStr = XMLStr + "<Descript>" + $get(MasterObj + "txtDescription").value + "</Descript>"
        XMLStr = XMLStr + "<Formule>" + document.getElementById(MasterObj + "txtFormule").value + "</Formule>"
        XMLStr = XMLStr + "<Priority>" + $get(MasterObj + "txtPriority").value + "</Priority>"
    }
    else if (document.getElementById("ChkCombine").checked == true) {
        XMLStr = XMLStr + "<StepID>50</StepID>"
        XMLStr = XMLStr + "<Active>" + Active + "</Active>"
        XMLStr = XMLStr + "<Descript>" + $get(MasterObj + "txtCombineDesc").value + "</Descript>"
        XMLStr = XMLStr + "<Formule>" + "C" + $get(MasterObj + "CmbCode1_txtCode").value + "$" + "C" + $get(MasterObj + "CmbCode2_txtCode").value + "</Formule>";
    }
    else {
        XMLStr = XMLStr + "<StepID>0</StepID>"
        XMLStr = XMLStr + "<Formule></Formule>"
    }
    XMLStr = XMLStr + "<ScriptID>" + $get(MasterObj + "txtScriptID").value + "</ScriptID>"
    XMLStr = XMLStr + "</Tb>"
    document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + document.getElementById(MasterObj + "txtGroupCodeXML").value + "<TbMember>" + document.getElementById(MasterObj + "txtScriptGroups").value + "</TbMember>" + "</Root>"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmpty() {
    var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    if (document.getElementById(MasterObj + "txtCodeName").value == "") {
        alert("لطفا نام آيتم  را وارد نمائید")
        document.getElementById(MasterObj + "txtCodeName").focus()
        return false;
    }
//    else if (getCntChar('%', document.getElementById(MasterObj + "txtCodeName").value) > 0) {
    else if (!OnCheckValidCodeName(document.getElementById(MasterObj + "txtCodeName").value)) {
        alert("لطفا نام آيتم را درست وارد کنيد،فقط حروف الفبا ی انگليسی و فارسي می توان وارد کرد")
        document.getElementById(MasterObj + "txtCodeName").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "txtUserCode").value == "") {
        alert("لطفا کد آيتم را وارد نمائید")
        document.getElementById(MasterObj + "txtUserCode").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "txtUserCode").value.length != 5) {
        alert("کد باید پنج رقمی باشد")
        document.getElementById(MasterObj + "txtUserCode").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "txtDesc").value == "")
          && (document.getElementById("chkFormule").checked == true) && UsedFlag == 0) {
        alert("لطفا شرح کد را وارد نمائيد")
        document.getElementById(MasterObj + "txtDesc").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "cmbStep").value == 0) && (document.getElementById("chkFormule").checked == true)) {
        alert("لطفا مرحله اجرا را انتخاب نمائيد")
        document.getElementById(MasterObj + "cmbStep").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "txtFormule").value == "") && (document.getElementById("chkFormule").checked == true)) {
        alert("لطفا فرمول را وارد نمائيد")
        document.getElementById(MasterObj + "txtFormule").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "txtDescription").value == "")
          && (document.getElementById("chkFormule").checked == true) && UsedFlag == 0) {
        alert("لطفا شرح فرمول را وارد نمائيد")
        document.getElementById(MasterObj + "txtDescription").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "CmbCode1_txtCode").value == "") && (document.getElementById("ChkCombine").checked == true)) {
        alert("لطفا کد تعدادي را وارد نمائيد")
        document.getElementById(MasterObj + "CmbCode1_txtPCode").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "CmbCode2_txtCode").value == "") && (document.getElementById("ChkCombine").checked == true)) {
        alert("لطفا کد ساعتي را وارد نمائيد")
        document.getElementById(MasterObj + "CmbCode2_txtPCode").focus()
        return false;
    }
    else if ((document.getElementById(MasterObj + "txtCombineDesc").value == "")
          && (document.getElementById("ChkCombine").checked == true) && UsedFlag == 0) {
        alert("لطفا شرح قسمت ترکيبي را وارد نمائيد")
        document.getElementById(MasterObj + "txtCombineDesc").focus()
        return false;
    }
    else if ((document.getElementById("chkFormule").checked == true || document.getElementById("ChkCombine").checked == true) && document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
        alert("لطفا تاريخ شروع را وارد نمائيد")
        document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus()
        return false;
    }
    else if ((document.getElementById("chkFormule").checked == true || document.getElementById("ChkCombine").checked == true) && document.getElementById(MasterObj + "KCalEDate_txtYear").value == "") {
        alert("لطفا تاريخ خاتمه را وارد نمائيد")
        document.getElementById(MasterObj + "KCalEDate_txtCalendar").focus()
        return false;
    }
    else if (SDate > EDate) {
        alert("تاريخ شروع بزرگتر از تاريخ خاتمه است")
        document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus()
        return false;
    }
    else if ((document.getElementById("chkFormule").checked == true || document.getElementById("ChkCombine").checked == true) && document.getElementById(MasterObj + "cmbCategory").value == "0") {
        alert("لطفا دسته بندي را انتخاب نماييد")
        document.getElementById(MasterObj + "cmbCategory").focus()
        return false;
    } 
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickchkFormule() {
    if (document.getElementById("chkFormule").checked == true) {
        document.getElementById(MasterObj + "txtFormule").disabled = false
        document.getElementById("btnSelectCode").disabled = false
        $get(MasterObj + "cmbStep").disabled = false
        document.getElementById(MasterObj + "rdbActive").disabled = false
        document.getElementById(MasterObj + "rdbNoActive").disabled = false
        document.getElementById(MasterObj + "rdbMActive").disabled = false
        document.getElementById(MasterObj + "txtDescription").disabled = false
        document.getElementById(MasterObj + "txtPriority").disabled = false
        document.getElementById(MasterObj + "cmbCategory").disabled = false
        $get(MasterObj + "txtCondition").disabled = false;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = false;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
        $get(MasterObj + "KCalSDate_btnCalender").disabled = false;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        //----------
        document.getElementById("ChkCombine").checked = false;
        document.getElementById(MasterObj + "CmbCode1_txtPCode").disabled = true;
        document.getElementById(MasterObj + "CmbCode1_BtnDown").disabled = true;
        document.getElementById(MasterObj + "CmbCode1_txtName").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_txtPCode").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_BtnDown").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_txtName").disabled = true;
        document.getElementById(MasterObj + "txtCombineDesc").disabled = true;
        document.getElementById('OToolBar_BtnSelectMember').style.display = "";
        //document.getElementById(MasterObj + "cmbCategoryCombine").disabled = true;
    }
    else {
        document.getElementById(MasterObj + "txtFormule").disabled = true
        document.getElementById("btnSelectCode").disabled = true
        $get(MasterObj + "cmbStep").disabled = true
        document.getElementById(MasterObj + "rdbActive").disabled = true
        document.getElementById(MasterObj + "rdbNoActive").disabled = true
        document.getElementById(MasterObj + "rdbMActive").disabled = true
        document.getElementById(MasterObj + "txtDescription").disabled = true
        document.getElementById(MasterObj + "txtPriority").disabled = true
        document.getElementById(MasterObj + "cmbCategory").disabled = true
        $get(MasterObj + "txtCondition").disabled = true;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalSDate_btnCalender").disabled = true;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        //------------------
        document.getElementById("ChkCombine").checked = false;
        document.getElementById('OToolBar_BtnSelectMember').style.display = "none";
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickbtnSelectCode() {
    var strUrl = "SelectCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no')
    if (rValue != "")
        document.getElementById(MasterObj + "txtFormule").value = document.getElementById(MasterObj + "txtFormule").value + 'C' + rValue;

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSelectGroup() {
    var strUrl = "SelectGroupCode.aspx?CodeId=" + $get(MasterObj + "txtCodeId").value
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 450px;center: Yes;help: no;status: no')
    document.getElementById(MasterObj + "txtGroupCodeXML").value = rValue
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickchkCombine() {
    if (document.getElementById("ChkCombine").checked == false) {
        document.getElementById(MasterObj + "CmbCode1_txtPCode").disabled = true;
        document.getElementById(MasterObj + "CmbCode1_BtnDown").disabled = true;
        document.getElementById(MasterObj + "CmbCode1_txtName").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_txtPCode").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_BtnDown").disabled = true;
        document.getElementById(MasterObj + "CmbCode2_txtName").disabled = true;
        document.getElementById(MasterObj + "txtCombineDesc").disabled = true; 
        document.getElementById(MasterObj + "rdbActive").disabled = true
        document.getElementById(MasterObj + "rdbNoActive").disabled = true
        document.getElementById(MasterObj + "rdbMActive").disabled = true
        document.getElementById(MasterObj + "cmbCategory").disabled = true
        $get(MasterObj + "txtCondition").disabled = true;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalSDate_btnCalender").disabled = true;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        //------
        document.getElementById("chkFormule").checked = false
        document.getElementById('OToolBar_BtnSelectMember').style.display = "none";

    }
    else {
        document.getElementById(MasterObj + "CmbCode1_txtPCode").disabled = false;
        document.getElementById(MasterObj + "CmbCode1_BtnDown").disabled = false;
        document.getElementById(MasterObj + "CmbCode1_txtName").disabled = false;
        document.getElementById(MasterObj + "CmbCode2_txtPCode").disabled = false;
        document.getElementById(MasterObj + "CmbCode2_BtnDown").disabled = false;
        document.getElementById(MasterObj + "CmbCode2_txtName").disabled = false;
        document.getElementById(MasterObj + "txtCombineDesc").disabled = false; 
        document.getElementById(MasterObj + "rdbActive").disabled = false
        document.getElementById(MasterObj + "rdbNoActive").disabled = false
        document.getElementById(MasterObj + "rdbMActive").disabled = false
        document.getElementById(MasterObj + "cmbCategory").disabled = false
        $get(MasterObj + "txtCondition").disabled = false;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = false;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
        $get(MasterObj + "KCalSDate_btnCalender").disabled = false;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        //------
        document.getElementById("chkFormule").checked = false
        document.getElementById(MasterObj + "txtFormule").disabled = true
        document.getElementById("btnSelectCode").disabled = true
        $get(MasterObj + "cmbStep").disabled = true
        document.getElementById(MasterObj + "txtDescription").disabled = true
        document.getElementById(MasterObj + "txtPriority").disabled = true
        document.getElementById('OToolBar_BtnSelectMember').style.display = "none";
       // document.getElementById(MasterObj + "cmbCategoryFormule").disabled = true
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnKeyDownCode(obj) {
    var key = window.event.keyCode
    if (!Shift) {
        if (key == 16)
            Shift = true;
        else {
            window.event.returnValue =
		    (
			(key == 189) ||
			(key == 191) ||
			(key == 67) ||
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46 || key == 39 || key == 37) ||
			((key >= 35) && (key <= 40))
	      	)

        }
    }
    else if (Shift) {
        window.event.returnValue =
		    (
			(key == 187) ||
			(key == 56) ||
			(key == 57) ||
			(key == 48) ||
			(key == 67)

	      	)
        Shift = false;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnKeyDownFaEn(obj) {
    
    var key = window.event.keyCode
    
    if (!Shift) {
    
        if (key == 16)
            Shift = true;
        else {
            window.event.returnValue =
		    (
			((key >= 65) && (key <= 90)) ||
			(key == 8 || key == 39 || key == 37) ||
			(key == 221 || key == 219 || key == 220 || key == 222 || key == 186) ||
			(key == 226 || key == 188 || key == 32) || (key == 17) || (key == 231)
	      	)

        }
    }
    else if (Shift) {
        window.event.returnValue =
		    (
			((key >= 65) && (key <= 90))
	      	)
        Shift = false;
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnCheckValidCodeName(obj) {
    var lenObj = obj.length
    var key
    var eventObj 

    for (var i = 0; i < lenObj; i++) {
        eventObj = obj.substring(i, i + 1)

        key = eventObj.charCodeAt(0)
        if (((key == 1611) || (key == 1612) || (key == 1613) || (key == 1614) || (key == 1615) || (key == 1616) || (key == 1617))) {
            return false;
        } else
            if (((key >= 65) && (key <= 90)) || ((key >= 1570) && (key <= 1641)) || ((key >= 8194) && (key <= 8204)) ||
                     (key == 1670) || (key == 1740) || (key == 1705) || (key == 1662) || (key == 1711) || (key == 1688) ||
                     ((key >= 48) && (key <= 58)) || ((key >= 40) && (key <= 47)) || (key == 95) || (key == 247) ||
                     ((key >= 97) && (key <= 122)) || (key == 32)) {
            if (i == lenObj - 1) {
                return true
            }
        }
        else {
            return false;
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSelectMember() {
    var strUrl = "ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=" + $get(MasterObj + "txtSystem").value
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no')
    document.getElementById(MasterObj + "txtScriptGroups").value = rValue

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnChangeCmbStep() {
    if ($get(MasterObj + "cmbStep").value == "50")
        document.getElementById('OToolBar_BtnSelectMember').style.display = "none";
    else
        document.getElementById('OToolBar_BtnSelectMember').style.display = "inline";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!