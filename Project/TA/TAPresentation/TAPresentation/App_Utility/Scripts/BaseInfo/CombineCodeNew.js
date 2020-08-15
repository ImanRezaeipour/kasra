
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}

function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "0") {
            alert($get(MasterObj + "txtAlert").value);
            window.returnValue = 0
        }
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
            window.returnValue = 1
        }
    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!on load !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if ($get(MasterObj + "txtSystem").value == "1") {

    $get(MasterObj + "cmbGroupCode1_txtCode").disabled = true;
    $get(MasterObj + "cmbGroupCode2_txtCode").disabled = true;
    $get(MasterObj + "cmbResultCode_txtCode").disabled = true;
    $get(MasterObj + "cmbGroupCode1_BtnDown").disabled = true;
    $get(MasterObj + "cmbGroupCode2_BtnDown").disabled = true;
    $get(MasterObj + "cmbResultCode_BtnDown").disabled = true;
    $get(MasterObj + "cmbDayState").disabled = true;
    $get(MasterObj + "txtDesc").disabled = true;
    document.getElementById('OToolBar_BtnNew').style.visibility = "hidden";
    document.getElementById('OToolBar_BtnSave').style.visibility = "hidden";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    $get(MasterObj + "cmbGroupCode1_txtCode").value = ""
    $get(MasterObj + "cmbGroupCode2_txtCode").value = ""
    $get(MasterObj + "cmbResultCode_txtCode").value = ""
    $get(MasterObj + "cmbGroupCode1_txtName").value = ""
    $get(MasterObj + "cmbGroupCode2_txtCode").value = ""
    $get(MasterObj + "cmbResultCode_txtCode").value = ""
    $get(MasterObj + "cmbDayState").value = "0"
    $get(MasterObj + "txtDesc").value = ""
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    if (checkNotEmpty() == true) {
        $get(MasterObj + "txtCode1").value = $get(MasterObj + "cmbGroupCode1_txtCode").value
        $get(MasterObj + "txtCode2").value = $get(MasterObj + "cmbGroupCode2_txtCode").value
        $get(MasterObj + "txtResultCode").value = $get(MasterObj + "cmbResultCode_txtCode").value
        $get(MasterObj + "txtSubmit").value = "Save";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmpty() {
    if (document.getElementById(MasterObj + "cmbGroupCode1_txtCode").value == "") {
        alert("لطفا گروه کد 1 را انتخاب نمائید")
        document.getElementById(MasterObj + "cmbGroupCode1_txtCode").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "cmbGroupCode2_txtCode").value == "") {
        alert("لطفا گروه کد 2 را انتخاب نمائید")
        document.getElementById(MasterObj + "cmbGroupCode2_txtCode").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "cmbResultCode_txtCode").value == "") {
        alert("لطفا کد نتيجه را انتخاب نمائید")
        document.getElementById(MasterObj + "cmbResultCode_txtCode").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "cmbDayState").value == 0) {
        alert("لطفا نوع روز را انتخاب نمائید")
        document.getElementById(MasterObj + "cmbDayState").focus()
        return false;
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!