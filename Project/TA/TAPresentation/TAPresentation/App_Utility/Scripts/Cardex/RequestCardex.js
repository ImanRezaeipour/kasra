var SaveNewFlag = 0;
if ($get(MasterObj + "txtStaticCodeValueID").value != "")
    document.getElementById("OToolBar_BtnSelectGroup").style.visibility = "hidden";
//*******************************************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
}
//====================================================================================
function EndRequestHandler(sender, args) {
    document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
            alert($get(MasterObj + "txtAlert").value)
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
function OnClickBtnSave() {
    if (chkIsEmpty()) {
        var Value = $get(MasterObj + "txtValue").value;

        //برای حالتیکه روز انتخاب شود که در صورت خالی بودن آپشن طول روز مقدار 7:20را در نظر می گیرد
        var DayLength = $("#" + MasterObj + "txtDayLength").val()
        if (DayLength == "" && document.getElementById(MasterObj + "CmbValueType").value == "18703") {
            alert("لطفا مقدار طول روز را در تنطيمات سيستم وارد کنيد");
            return;
        }

        if (document.getElementById(MasterObj + "CmbValueType").value == "18701")
            Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
        else if (document.getElementById(MasterObj + "CmbValueType").value == "18703")
            Value = parseInt(Value) * parseInt(DayLength);

        $get(MasterObj + "txtValueSave").value = Value;
        $get(MasterObj + "txtCode").value = document.getElementById(MasterObj + "CmbCardexCodeType").value
        $get(MasterObj + "txtPeriod").value = document.getElementById(MasterObj + "CmbPeriod").value
        $get(MasterObj + "txtPCode").value = document.getElementById(MasterObj + "cmbPersonCode_txtCode").value;
        if ($get(MasterObj + "txtStaticCodeValueID").value != "")
            $get(MasterObj + "txtSubmit").value = "Modify";
        else
            $get(MasterObj + "txtSubmit").value = "New";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************
function chkIsEmpty() {
    if (($get(MasterObj + "cmbPersonCode_txtCode").value == "" || $get(MasterObj + "cmbPersonCode_txtCode").value == "0") &&
       ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
        || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        $get(MasterObj + "cmbPersonCode_txtPCode").focus();
        return false;
    }
    if (document.getElementById(MasterObj + "CmbPeriod").value == "0") {
        alert("لطفا دوره را انتخاب نماييد");
        $get(MasterObj + "CmbPeriod").focus();
        return false;
    }
    if (document.getElementById(MasterObj + "CmbCardexCodeType").value == "0") {
        alert("لطفا کد اعطا را انتخاب نماييد");
        $get(MasterObj + "CmbMojavez").focus();
        return false;
    }
    if (document.getElementById(MasterObj + "txtValue").value == "") {
        alert("لطفا مقدار را وارد نماييد");
        $get(MasterObj + "txtValue").focus();
        return false;
    }
    else
        return true;
}
//*******************************************************************************
function OnClickBtnNew() {
    document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtPCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
    document.getElementById(MasterObj + "txtValue").value = ""
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "CmbCardexCodeType").value = "0"
    document.getElementById(MasterObj + "CmbPeriod").value = "0"
    document.getElementById(MasterObj + "CmbValueType").value = "0"
}
//*******************************************************************************
function OnClickBtnSaveNew() {
    SaveNewFlag = 1;
    OnClickBtnSave();
}
//*******************************************************************
function OnClickBtnSelectGroup() {
    var strUrl = "../DataEntry/CreditScriptGroup.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CreditScriptGroup=" + $get(MasterObj + "txtScriptGroupXML").value;
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
    $get(MasterObj + "txtScriptGroupXML").value = rValue;
}
//*******************************************************************************
function OnChangeCmbCardexPeriod() {
    $get(MasterObj + "txtSubmit").value = "GetCardexIncCode";
    $get(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************
function Refresh() {
    if (document.getElementById(MasterObj + "txtValue").value == "") {
        document.getElementById(MasterObj + "txtSubmit").value = "Refresh";
        $get(MasterObj + "BtnSubmit").click();
    }
}