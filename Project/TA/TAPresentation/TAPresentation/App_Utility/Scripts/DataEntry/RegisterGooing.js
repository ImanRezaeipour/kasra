
//*************************************Declaration*************************************
var SaveFlagNew = 0;
document.getElementsByTagName("body")[0].scroll = "no";
//GetAccessBtn();

//========آپشن کمبو نوع درخواست============
if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
    TblAttendanceType.style.display = "none"
}

if (document.getElementById(MasterObj + "txtTableName").value != "")
    onload();
//**************************************EndDeclaration*****************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
var SaveFlag = 0;
function BeginRequestHandler(sender, args) {
}
//====================================================================================
function EndRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "") {
            alert($get(MasterObj + "txtAlert").value)
        }
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
            SaveFlag = 1;
            window.returnValue = SaveFlag;
            if (SaveFlagNew == 1)
                OnClickBtnNew();
        }

    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    SaveFlagNew = 0;
}
//=====================================On Load===============================================
function onload() {

    var LenSpl 

    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";

    xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
    var xmlNodes;
    xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");

    var Date = xmlNodes.item(0).selectSingleNode('Date').text

    $get(MasterObj + "cmbPersonCode_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
    $get(MasterObj + "CmbGoingKind").value = xmlNodes.item(0).selectSingleNode('Type').text
    $get(MasterObj + "txtTime").value = xmlNodes.item(0).selectSingleNode('Time').text
    if (getCntChar('$', xmlNodes.item(0).selectSingleNode('Descr').text) > 0) {
        $get(MasterObj + "cmbAttendatnceType").value = xmlNodes.item(0).selectSingleNode('RequestType').text.split("$")[0]
    }
    else
        $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Descr').text;

    $get(MasterObj + "KCalDate_txtDay").value = Date.substr(0, 2);
    $get(MasterObj + "KCalDate_txtMonth").value = Date.substr(3, 2);
    $get(MasterObj + "KCalDate_txtYear").value = Date.substr(6, 4);
    $get(MasterObj + "KCalDate_txtCalendar").value = Date
    $get(MasterObj + "KCalDate_txtCalendar").value = $get(MasterObj + "KCalDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value)

    if (xmlNodes.item(0).selectSingleNode('UnTransfer').text == "true")
        $get(MasterObj + "ChkTransmission").checked = true;
    Timechk(document.getElementById(MasterObj + "txtTime"));
    //-------------------Disable For Modify-----------------------------
    $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
    $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
    if (typeof document.getElementById("OToolBar_BtnNew") == "object") {
        if (document.getElementById("OToolBar_BtnNew") != null)
            document.getElementById("OToolBar_BtnNew").style.display = "none";
    }
    if (typeof document.getElementById("OToolBar_BtnSaveNew") == "object") {
        if (document.getElementById("OToolBar_BtnSaveNew") != null)
            document.getElementById("OToolBar_BtnSaveNew").style.display = "none";
    }
    //------------------------------------------------------------------
    if ($get(MasterObj + "txtModifyFlag").value == "0") {
        $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
        $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
        $get(MasterObj + "KCalDate_txtCalendar").disabled = true;
        $get(MasterObj + "txtTime").disabled = true;
        $get(MasterObj + "txtDesc").disabled = true;
        $get(MasterObj + "ChkTransmission").disabled = true;
        $get(MasterObj + "CmbGoingKind").disabled = true;
        if (typeof document.getElementById("OToolBar_BtnNew") == "object") {
            if (document.getElementById("OToolBar_BtnNew")!=null)
            document.getElementById("OToolBar_BtnNew").style.display = "none";
        }
        if (typeof document.getElementById("OToolBar_BtnSave") == "object") {
            if (document.getElementById("OToolBar_BtnSave") != null)
            document.getElementById("OToolBar_BtnSave").style.display = "none";
        }
        if (typeof document.getElementById("OToolBar_BtnSaveNew") == "object") {
            if (document.getElementById("OToolBar_BtnSaveNew") != null)
            document.getElementById("OToolBar_BtnSaveNew").style.display = "none";
        }
    }
    if (typeof document.getElementById("OToolBar_BtnSelectGroup") == "object") {
        if (document.getElementById("OToolBar_BtnSelectGroup")!=null)
            document.getElementById("OToolBar_BtnSelectGroup").style.display = "none";
    }
}
//*******************************************************************************
function OnClickBtnNew() {
    document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtPCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
    document.getElementById(MasterObj + "KCalDate_txtYear").value = ""
    document.getElementById(MasterObj + "KCalDate_txtMonth").value = ""
    document.getElementById(MasterObj + "KCalDate_txtDay").value = ""
    $get(MasterObj + "KCalDate_txtCalendar").value = ""
    document.getElementById(MasterObj + "txtTime").value = "00:00"
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "CmbGoingKind").value = "0"
    document.getElementById(MasterObj + "ChkTransmission").checked = false;
}
//*******************************************************************************
function chkIsEmpty() {
    var Date = document.getElementById(MasterObj + "KCalDate_txtDay").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtYear").value;
    if (($get(MasterObj + "cmbPersonCode_txtCode").value == "" || $get(MasterObj + "cmbPersonCode_txtCode").value == "0") &&
       ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
        || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        $get(MasterObj + "cmbPersonCode_txtPCode").focus();
    }
    else if (document.getElementById(MasterObj + "KCalDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalDate_txtDay").value == "") {
        alert("لطفا تاريخ  تردد را وارد نماييد");
        $get(MasterObj + "KCalDate_txtCalendar").focus();
    }
    else if (document.getElementById(MasterObj + "txtTime").value == "00:00" || document.getElementById(MasterObj + "txtTime").value == "") {
        alert("لطفا ساعت  تردد را وارد نماييد");
        $get(MasterObj + "txtTime").focus();
    }
    else
        return true;
}
//*******************************************************************************
function OnClickBtnSave() {
    if (chkIsEmpty()) {
        document.getElementById(MasterObj + "txtPCode").value = document.getElementById(MasterObj + "cmbPersonCode_txtCode").value;
        document.getElementById(MasterObj + "txtKCalDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value;
        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function OnFocuseTxtTime() {
    document.getElementById(MasterObj + "txtTime").select();
}
//*******************************************************************************
function OnClickBtnSaveNew() {
    SaveFlagNew = 1;
    OnClickBtnSave();
}
//*******************************************************************
function OnClickBtnSelectGroup() {
    var strUrl = "CreditScriptGroup.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CreditScriptGroup=" + $get(MasterObj + "txtScriptGroupXML").value;
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
    $get(MasterObj + "txtScriptGroupXML").value = rValue;
}
//*******************************************************************************
//function GetAccessBtn() {
//    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
//    xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
//    xmlDoc.setProperty("SelectionLanguage", "XPath")
//    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
//    if (xmlNodes.length != 0) {
//        if (xmlNodes.item(0).selectSingleNode('BtnSelectGroup') && xmlNodes.item(0).selectSingleNode('BtnSelectGroup').text == 2)
//            document.getElementById('OToolBar_BtnSelectGroup').style.display = "none"
//    }
//}
//**********************************EndThisPage*************************************