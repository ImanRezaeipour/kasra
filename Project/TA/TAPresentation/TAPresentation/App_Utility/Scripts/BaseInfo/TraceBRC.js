
var LastSelectedRow = null;
var LastSelectedRowClass = "";
////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value

    if ($get(MasterObj + "txtStep").value == "1")
        $get(MasterObj + "btnPrev1").disabled = true;
    else
        $get(MasterObj + "btnPrev1").disabled = false;

    if ($get(MasterObj + "txtStep2").value == "1")
        $get(MasterObj + "btnPrev2").disabled = true;
    else
        $get(MasterObj + "btnPrev2").disabled = false;

    if ($get(MasterObj + "txtStep").value == $get(MasterObj + "txtMaxTraceStepID").value)
        $get(MasterObj + "btnNext1").disabled = true;
    else
        $get(MasterObj + "btnNext1").disabled = false;

    if ($get(MasterObj + "txtStep2").value == $get(MasterObj + "txtMaxTraceStepID").value)
        $get(MasterObj + "btnNext2").disabled = true;
    else
        $get(MasterObj + "btnNext2").disabled = false;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!On Load !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if ($get(MasterObj + "txtStep").value == "1") {
    $get(MasterObj + "btnPrev1").disabled = true;
}

if ($get(MasterObj + "txtStep2").value == "1") {
    $get(MasterObj + "btnPrev2").disabled = true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage() {
    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    var Date = "";
    if (document.getElementById(MasterObj + "KCalDate_txtYear").value != "" && document.getElementById(MasterObj + "KCalDate_txtMonth").value != "" && document.getElementById(MasterObj + "KCalDate_txtDay").value != "")
        Date = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value;
    $get(MasterObj + "txtKCalDate").value = Date;
    $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "cmbPersonCode_txtCode").value
    $get(MasterObj + "BtnFilter").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd() {

}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $get(MasterObj + "txtKCalDate").value = "";
    $get(MasterObj + "KCalDate_txtCalendar").value = "";
    $get(MasterObj + "txtPersonCode").value = "";
    $get(MasterObj + "cmbPersonCode_txtCode").value = "";
    $get(MasterObj + "cmbPersonCode_txtName").value = "";
    $get(MasterObj + "BtnFilter").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickPrevStep() {
    document.getElementById(MasterObj + "txtTraceStepID").value = parseInt(document.getElementById(MasterObj + "txtTraceStepID").value) - 1;
    document.getElementById(MasterObj + "txtStep").value = document.getElementById(MasterObj + "txtTraceStepID").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickNextStep() {
    document.getElementById(MasterObj + "txtTraceStepID").value = parseInt(document.getElementById(MasterObj + "txtTraceStepID").value) + 1;
    document.getElementById(MasterObj + "txtStep").value = document.getElementById(MasterObj + "txtTraceStepID").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickPrevStep2() {
    document.getElementById(MasterObj + "txtTraceStepID2").value = parseInt(document.getElementById(MasterObj + "txtTraceStepID2").value) - 1;
    document.getElementById(MasterObj + "txtStep2").value = document.getElementById(MasterObj + "txtTraceStepID2").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit2").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickNextStep2() {
    document.getElementById(MasterObj + "txtTraceStepID2").value = parseInt(document.getElementById(MasterObj + "txtTraceStepID2").value) + 1;
    document.getElementById(MasterObj + "txtStep2").value = document.getElementById(MasterObj + "txtTraceStepID2").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit2").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!