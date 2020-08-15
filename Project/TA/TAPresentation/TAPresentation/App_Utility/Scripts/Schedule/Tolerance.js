//document.body.scroll = "no"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "")
        if ($get(MasterObj + "txtValidate").value == "0")
        alert($get(MasterObj + "txtAlert").value);
    else
        SetMsg($get(MasterObj + "txtAlert").value);
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";
}
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//===============================================================================================
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
    var strUrl = "ToleranceNew.aspx?DetailCollectionID=" + LastSelectedRow.DetailCollectionID
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 360px;dialogWidth: 850px;center: Yes;help: no;status: no')
    if (returnValue == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        var Msg = "آیا برای حذف مطمئنید؟"
        if (confirm(Msg) == true) {
            document.getElementById(MasterObj + "txtDetailCollectionID").value = LastSelectedRow.DetailCollectionID
            document.getElementById(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("به منظور حذف یک سطر را انتخاب کنید")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    var strUrl = "ToleranceNew.aspx?DetailCollectionID=0"
        + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    returnValue = window.showModalDialog(strUrl, '', 'dialogHeight:360px;dialogWidth:850px;center: Yes;help: no;status: no')
    if (returnValue == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null)
        OndbClickGrd()
    else
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    var StartDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    var EndDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
    

    $get(MasterObj + "txtSDate").value = StartDate
    $get(MasterObj + "txtEDate").value = EndDate
    if ($get(MasterObj + "txtSDate").value == "//")
        $get(MasterObj + "txtSDate").value = ""
    if ($get(MasterObj + "txtEDate").value == "//")
        $get(MasterObj + "txtEDate").value = ""

    var Sdate = document.getElementById(MasterObj + "txtSDate").value
    var Edate = document.getElementById(MasterObj + "txtEDate").value

    if ((Sdate == "" && Edate!="")|| (Sdate!="" && Edate=="")
     || Sdate > Edate) {
        alert("تاریخ را درست وارد کنید")
        return;
    }
    else {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}

function OnClickBtnShowAll() {

    document.getElementById(MasterObj + "cmbStructure").value = 0;
    document.getElementById(MasterObj + "cmbType").value = 0;
    document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = "";
    document.getElementById(MasterObj + "KCalSDate_txtYear").value = "";
    document.getElementById(MasterObj + "KCalSDate_txtMonth").value = "";
    document.getElementById(MasterObj + "KCalSDate_txtDay").value = "";
    document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = "";
    document.getElementById(MasterObj + "KCalEDate_txtYear").value = "";
    document.getElementById(MasterObj + "KCalEDate_txtMonth").value = "";
    document.getElementById(MasterObj + "KCalEDate_txtDay").value = "";
    document.getElementById(MasterObj + "SDate").value = "";
    document.getElementById(MasterObj + "EDate").value = "";
    document.getElementById(MasterObj + "txtSDate").value = "";
    document.getElementById(MasterObj + "txtEDate").value = "";
    document.getElementById(MasterObj + "txtSubmit").value = "ShowAll";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
