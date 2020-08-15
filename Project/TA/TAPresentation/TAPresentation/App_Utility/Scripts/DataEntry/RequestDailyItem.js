var SaveNewFlag = 0;
var SaveFlag = 0;
document.getElementsByTagName("body")[0].scroll = "no";
if (document.getElementById(MasterObj + "txtTableName").value != "")
    onload();
//*******************************************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
//====================================================================================
function EndRequestHandler(sender, args) {
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
            alert($get(MasterObj + "txtAlert").value)
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
            SaveFlag = 1;
            window.returnValue = SaveFlag;
            if (SaveNewFlag == 1)
                OnClickBtnNew();
            else
                window.close();
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
    $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Description').text
    $get(MasterObj + "CmbMojavez").value = xmlNodes.item(0).selectSingleNode('Code').text
    $get(MasterObj + "txtStaticCodeValueID").value = xmlNodes.item(0).selectSingleNode('ID').text
    $get(MasterObj + "CmbValueType").value = xmlNodes.item(0).selectSingleNode('Kind').text
    var SDate = xmlNodes.item(0).selectSingleNode('SDate').text
    var EDate = xmlNodes.item(0).selectSingleNode('EDate').text
    $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
    $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
    $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

    $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
    $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
    $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
    //-------------------Disable For Modify-----------------------------
    $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
    $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
    document.getElementById("OToolBar_BtnNew").style.display = "none";
    document.getElementById("OToolBar_BtnSaveNew").style.display = "none";
    //------------------------------------------------------------------
    if ($get(MasterObj + "txtModifyFlag").value == "0") {
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalSDate_btnCalender").disabled = true;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        $get(MasterObj + "cmbPersonCode_txtPCode").disabled = true;
        $get(MasterObj + "cmbPersonCode_BtnDown").disabled = true;
        $get(MasterObj + "txtValue").disabled = true;
        $get(MasterObj + "CmbMojavez").disabled = true;
        $get(MasterObj + "txtDesc").disabled = true;
        $get(MasterObj + "CmbValueType").disabled = true;
        document.getElementById("OToolBar_BtnNew").style.visibility = "hidden";
        document.getElementById("OToolBar_BtnSave").style.visibility = "hidden";
        document.getElementById("OToolBar_BtnSaveNew").style.visibility = "hidden";
    }
    document.getElementById("OToolBar_BtnSelectGroup").style.visibility = "hidden";
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

        $get(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
        $get(MasterObj + "txtEDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
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
        $get(MasterObj + "txtCode").value = document.getElementById(MasterObj + "CmbMojavez").value
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
    var SDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
    var EDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
    if (document.getElementById(MasterObj + "KCalSDate_txtCalendar").value == "") {
        alert("لطفا از تاريخ  را انتخاب نماييد");
        $get(MasterObj + "KCalSDate_txtCalendar").focus();
    }
    else if (document.getElementById(MasterObj + "KCalEDate_txtCalendar").value == "") {
        alert("لطفا تا تاريخ را انتخاب نماييد");
        $get(MasterObj + "KCalEDate_txtCalendar").focus();
    }
    else if (SDate > EDate) {
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
        $get(MasterObj + "KCalSDate_txtCalendar").focus();
    }
    else if (($get(MasterObj + "cmbPersonCode_txtCode").value == "" || $get(MasterObj + "cmbPersonCode_txtCode").value == "0") &&
       ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
        || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        $get(MasterObj + "cmbPersonCode_txtPCode").focus();
    }
    else if (document.getElementById(MasterObj + "CmbMojavez").value == "0") {
        alert("لطفا کد اعطا را انتخاب نماييد");
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
function OnClickBtnNew() {
    document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = "";
    document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = "";
    document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtPCode").value = ""
    document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
    document.getElementById(MasterObj + "txtValue").value = ""
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "CmbMojavez").value = "0"
    document.getElementById(MasterObj + "CmbValueType").selectedIndex = "0"
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
//*******************************************************************************
function Refresh() {
    if (document.getElementById(MasterObj + "txtValue").value == "") {
        $get(MasterObj + "txtSubmit").value = "Refresh";
        $get(MasterObj + "BtnSubmit").click();
    }
}