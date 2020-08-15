//*************************************Declaration*************************************
var SaveNewFlag = 0;
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
        if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "") {
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
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    if (SaveNewFlag == 1)
        $get(MasterObj + "txtReplaceDetailID").value = "0";
    SaveNewFlag = 0;
}
//****************************************************************************************************************
function onload() {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";

    xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
    var xmlNodes;
    xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");

    $get(MasterObj + "cmbPersonCode_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text

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

    $get(MasterObj + "CmbStructure").value = xmlNodes.item(0).selectSingleNode('NewStructureID').text
    $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Description').text
    //-------------------Disable For Modify-----------------------------
    $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
    $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
    $get("OToolBar_BtnNew").style.display = "none";
    $get("OToolBar_BtnSaveNew").style.display = "none";
    //-------------------------------------------------------------------
    if ($get(MasterObj + "txtModifyFlag").value == "0") {
        $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
        $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_btnImg").disabled = true;
        $get(MasterObj + "CmbStructure").disabled = true;
        $get(MasterObj + "txtDesc").disabled = true;
        document.getElementById("OToolBar_BtnNew").style.visibility = "hidden";
        document.getElementById("OToolBar_BtnSave").style.visibility = "hidden";
        document.getElementById("OToolBar_BtnSaveNew").style.visibility = "hidden";
    }

}
//*******************************************************************************
function OnClickBtnNew() {
    document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtPCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtYear").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtMonth").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtDay").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtYear").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtMonth").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtDay").value = ""
    $get(MasterObj + "KCalSDate_txtCalendar").value = ""
    $get(MasterObj + "KCalEDate_txtCalendar").value = ""
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "CmbStructure").value = "0"
    document.getElementById(MasterObj + "txtScriptGroupXML").value = ""
}
//*******************************************************************************
function chkIsEmpty() {
    var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
    var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

    if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "") {
        alert("لطفا تاريخ  شروع را وارد نماييد");
        $get(MasterObj + "KCalSDate_txtCalendar").focus();
    }
    else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "") {
        alert("لطفا تاريخ  پايان را وارد نماييد");
        $get(MasterObj + "KCalEDate_txtCalendar").focus();
    }
    else if (($get(MasterObj + "cmbPersonCode_txtCode").value == "" || $get(MasterObj + "cmbPersonCode_txtCode").value == "0") &&
       ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
        || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        $get(MasterObj + "cmbPersonCode_txtPCode").focus();
    }
    else if (document.getElementById(MasterObj + "CmbStructure").value == "0") {
        alert("لطفا ساختار جديد را انتخاب نماييد");
        $get(MasterObj + "CmbStructure").focus();
    }
    else if (sDate > eDate) {
        alert("تاريخ شروع بزرگتر از تاریخ پايان است");
    }
    else
        return true;
}
//*******************************************************************************
function OnClickBtnSave() {
    var str = "";
    if (chkIsEmpty()) {
        document.getElementById(MasterObj + "txtPCode").value = document.getElementById(MasterObj + "cmbPersonCode_txtCode").value
        document.getElementById(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
        document.getElementById(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function OnClickBtnSaveNew() {
    SaveNewFlag = 1;
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
//**********************************EndThisPage*************************************

