
var LastSelectedRow = null;
var LastSelectedRowClass = "";

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//---------------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
//---------------------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "") {
        if ($get(MasterObj + "lblTo").value == "") {
            document.getElementById('OToolBar_txtFromData').value = "";
            document.getElementById('OToolBar_txtToData').value = "";
            document.getElementById('OToolBar_txtTotalData').value = "";

            document.getElementById('OToolBar_BtnNext').disabled = true;
            document.getElementById('OToolBar_BtnPrv').disabled = true;
            document.getElementById('OToolBar_BtnFirst').disabled = true;
            document.getElementById('OToolBar_BtnLast').disabled = true;
        }
        else if ($get(MasterObj + "lblTo").value != "") {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;

            if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                document.getElementById('OToolBar_BtnPrv').disabled = false;

            document.getElementById('OToolBar_BtnFirst').disabled = false;
            document.getElementById('OToolBar_BtnLast').disabled = false;
        }
    }
    $get(MasterObj + "txtSubmit").value = "";
}
//---------------------------------------------------------------------------------------------
//*************************************OnLoad*************************************
document.getElementById('OToolBar_BtnPrv').disabled = true;
document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
    document.getElementById('OToolBar_BtnNext').disabled = true
else
    document.getElementById('OToolBar_BtnNext').disabled = false;

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
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    if (parseInt(document.getElementById(MasterObj + "CmbToPeriod").value) < parseInt(document.getElementById(MasterObj + "CmbPeriod").value))
        alert("دوره شروع بزرگتر از دوره پايان است");
    else {
        document.getElementById(MasterObj + "txtToPeriod").value = document.getElementById(MasterObj + "CmbToPeriod").value;
        document.getElementById(MasterObj + "txtFromPeriod").value = document.getElementById(MasterObj + "CmbPeriod").value;
        document.getElementById(MasterObj + "txtFromPersonID").value = document.getElementById(MasterObj + "cmbFromPersonCode_txtCode").value
        document.getElementById(MasterObj + "txtToPersonID").value = document.getElementById(MasterObj + "CmbToPersonCode_txtCode").value
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() { 
    document.getElementById(MasterObj + "txtToPeriod").value = "";
    document.getElementById(MasterObj + "txtFromPeriod").value = "";
    document.getElementById(MasterObj + "CmbPeriod").value = "";
    document.getElementById(MasterObj + "CmbToPeriod").value = "";
    document.getElementById(MasterObj + "txtFromPersonID").value = "";
    document.getElementById(MasterObj + "txtToPersonID").value = "";
    document.getElementById(MasterObj + "CmbToPersonCode_txtCode").value = "";
    document.getElementById(MasterObj + "cmbFromPersonCode_txtCode").value = "";
    document.getElementById(MasterObj + "CmbToPersonCode_txtName").value = "";
    document.getElementById(MasterObj + "cmbFromPersonCode_txtName").value = "";
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 