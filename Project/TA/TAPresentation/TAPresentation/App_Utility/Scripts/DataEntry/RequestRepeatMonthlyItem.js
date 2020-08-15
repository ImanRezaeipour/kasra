var SaveNewFlag = 0;
var SaveFlag = 0;
document.getElementsByTagName("body")[0].scroll = "no";
if (document.getElementById(MasterObj + "txtTableName").value != "")
    onload();
//*************************************End Declaration*************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
//====================================================================================
function EndRequestHandler(sender, args) {
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
    SaveNewFlag = 0;
}
//*************************************On Load *****************************************
function onload() {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";

    xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
    var xmlNodes;
    xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");

    $get(MasterObj + "cmbPersonCode_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
    $get(MasterObj + "cmbPersonCode_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
    $get(MasterObj + "txtValue").value = xmlNodes.item(0).selectSingleNode('Value').text
    $get(MasterObj + "CmbPeriod").value = xmlNodes.item(0).selectSingleNode('WPID').text
    $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Description').text
    $get(MasterObj + "CmbMojavez").value = xmlNodes.item(0).selectSingleNode('Code').text
    $get(MasterObj + "txtWPResultID").value = xmlNodes.item(0).selectSingleNode('WPResultID').text
    $get(MasterObj + "CmbValueType").value = xmlNodes.item(0).selectSingleNode('Kind').text
    //-------------------Disable For Modify-----------------------------
    $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
    $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
    $get("OToolBar_BtnNew").style.display = "none";
    $get("OToolBar_BtnSaveNew").style.display = "none";
    //------------------------------------------------------------------
    if ($get(MasterObj + "txtModifyFlag").value == "0") {
        $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
        $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
        $get(MasterObj + "txtValue").disabled = true;
        $get(MasterObj + "CmbPeriod").disabled = true;
        $get(MasterObj + "CmbMojavez").disabled = true;
        $get(MasterObj + "txtDesc").disabled = true;
        $get(MasterObj + "CmbValueType").disabled = true;
        document.getElementById("OToolBar_BtnNew").style.display = "none";
        document.getElementById("OToolBar_BtnSave").style.display = "none";
        document.getElementById("OToolBar_BtnSaveNew").style.display = "none";
        document.getElementById("OToolBar_BtnMemberFile").style.display = "none";
    }
    if (document.getElementById("OToolBar_BtnSelectGroup"))
        document.getElementById("OToolBar_BtnSelectGroup").style.display = "none";
    if (document.getElementById("OToolBar_BtnMemberFile"))
        document.getElementById("OToolBar_BtnMemberFile").style.display = "none";
}
//*******************************************************************************
function CmbPerson_onLoad(sender, e) {
    document.getElementById(MasterObj + "CmbPerson_Input").onkeydown = CmbPerson_Keydown;
}
//========================================================
function CmbPerson_Keydown() {
    if (event.keyCode == 13) {
        if (document.getElementById(MasterObj + "CmbPerson_Input").value != "") {
            onKeyDownEnter($get(MasterObj + 'CmbPeriod'));
        }
        else $get(MasterObj + 'CmbPerson_Input').focus()
    }
}
//*******************************************************************************
function OnClickBtnNew() {
    document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtPCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
    document.getElementById(MasterObj + "txtValue").value = ""
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "CmbMojavez").value = "0"
    document.getElementById(MasterObj + "CmbPeriod").value = "0"
    document.getElementById(MasterObj + "CmbValueType").selectedIndex = "0"
}
//*******************************************************************************
function chkIsEmpty() {
    if (($get(MasterObj + "cmbPersonCode_txtCode").value == "" || $get(MasterObj + "cmbPersonCode_txtCode").value == "0") &&
       ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
        || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        $get(MasterObj + "cmbPersonCode_txtPCode").focus();
    }
    else if (document.getElementById(MasterObj + "CmbPeriod").value == "0") {
        alert("لطفا دوره را انتخاب نماييد");
        $get(MasterObj + "CmbPeriod").focus();
    }
    else if (document.getElementById(MasterObj + "CmbMojavez").value == "0") {
        alert("لطفا مجوز را انتخاب نماييد");
        $get(MasterObj + "CmbMojavez").focus();
    }
    else if (document.getElementById(MasterObj + "txtValue").value == "") {
        alert("لطفا مقدار را وارد نماييد");
        $get(MasterObj + "txtValue").focus();
    }
    else
        return true;
}
//*******************************************************************************
function OnClickBtnSave() {
    if (chkIsEmpty()) {
        var Value = $get(MasterObj + "txtValue").value;
        //برای حالتیکه روز انتخاب شود که در صورت خالی بودن آپشن طول روز مقدار 7:20را در نظر می گیرد
        var DayLength = $("#" + MasterObj + "txtDayLength").val()
        if (DayLength == "" && document.getElementById(MasterObj + "CmbValueType").value == "18703") {
            alert("لطفا مقدار طول روز را در تنطيمات سيستم وارد کنيد");
            return;
        }

        if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
            Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
        else if (document.getElementById(MasterObj + "CmbValueType").value == "18703")
            Value = parseInt(Value) * parseInt(DayLength);

        $get(MasterObj + "txtValueSave").value = Value;
        $get(MasterObj + "txtCode").value = document.getElementById(MasterObj + "CmbMojavez").value
        $get(MasterObj + "txtPeriod").value = document.getElementById(MasterObj + "CmbPeriod").value
        $get(MasterObj + "txtPCode").value = document.getElementById(MasterObj + "cmbPersonCode_txtCode").value;
        if ($get(MasterObj + "txtWPResultID").value != "")
            $get(MasterObj + "txtSubmit").value = "Modify";
        else
            $get(MasterObj + "txtSubmit").value = "New";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function OnClickBtnSaveNew() {
    SaveNewFlag = 1;
    OnClickBtnSave();
}
//*******************************************************************************
function onKeyDownEnter(obj) {

    if (event.keyCode == 13)
        switch (obj.id) {
        case MasterObj + "CmbPerson_Input":
            if (obj.value != "") {
                onKeyDownEnter($get(MasterObj + 'CmbPeriod'));
            }
            else $get(MasterObj + 'CmbPerson_Input').focus()

            break;
        case MasterObj + "CmbPeriod":
            if (obj.value != "") {
                onKeyDownEnter($get(MasterObj + 'txtValue'));
            }
            else $get(MasterObj + 'CmbPeriod').focus()

            break;
        case MasterObj + "txtValue":
            if (obj.value != "") {
                onKeyDownEnter($get(MasterObj + 'CmbMojavez'));
            }
            else $get(MasterObj + 'txtValue').focus()

            break;
        case MasterObj + "CmbMojavez":
            if (obj.value != "") {
                onKeyDownEnter($get(MasterObj + 'txtDesc'));
            }
            else $get(MasterObj + 'CmbMojavez').focus()

            break;
        case MasterObj + "txtDesc":
            OnClickBtnSave();
            break;

    }
}
//*******************************************************************
function onkeyDownFloat(obj) {
    var number = obj.value;
    var key = window.event.keyCode
    if (getCntChar('.', number) < 1) {
        window.event.returnValue =
			            (
				            ((key >= 96) && (key <= 105)) ||
				            ((key >= 48) && (key <= 57)) ||
				            (key == 8) ||
				            (key == 9) ||
				            (key == 46) ||
				            ((key >= 35) && (key <= 40)) ||
				            ((key == 110) && getCntChar('.', number) < 1) ||
				            ((key == 190) && getCntChar('.', number) < 1)

			            )
    }
    else {
        window.event.returnValue =
			        (
			            ((key >= 96) && (key <= 105)) ||
				        ((key >= 48) && (key <= 57)) ||
				        (key == 8) ||
				        (key == 9) ||
				        (key == 46) ||
				        ((key >= 35) && (key <= 40))
				    )
    }
}
//*******************************************************************
function onblurtxtValue(obj) {
    if (obj.value != "" || obj.value != "0") {
        if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
            TimeChkNew(obj);
        else
            obj.value = obj.value.split(":")[0];
    }
}
//*******************************************************************
function TimeChkNew(Obj) {
    if (Obj.value == "")
        Obj.value = "00:00";
    if (Obj.value.split(":").length == 1) {
        if (Obj.value.length == 1)
            Obj.value = "0" + Obj.value + ":00";
        else
            Obj.value = Obj.value + ":00";
    }
    else
        if (Obj.value.split(":")[1] > 59) {
            alert("!لطفا ساعت صحيح را وارد کنيد");
            Obj.select();
            Obj.focus();
        }
}
//*******************************************************************
function OnKeyDownTimeNew(obj) {
    if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
        OnKeyDownTime();
    else OnKeyDownInt(obj);
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
//*******************************************************************
function GetAccessBtn() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
    if (xmlNodes.length != 0) {
        if (xmlNodes.item(0).selectSingleNode('BtnSelectGroup') && xmlNodes.item(0).selectSingleNode('BtnSelectGroup').text == 2)
            document.getElementById('OToolBar_BtnSelectGroup').style.display = "none"
        if (xmlNodes.item(0).selectSingleNode('BtnMemberFile') && xmlNodes.item(0).selectSingleNode('BtnMemberFile').text == 2)
            document.getElementById('OToolBar_BtnMemberFile').style.display = "none"
    }
}
//*******************************************************************
function Refresh() {
    if (document.getElementById(MasterObj + "txtValue").value == "") {
        $get(MasterObj + "txtSubmit").value = "Refresh";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//**********************************EndThisPage***********************