var LastSelectedRow = null;
var LastSelectedRowClass = "";
////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value

    if ($get(MasterObj + "txtAlert").value != "")
        if ($get(MasterObj + "txtStatus").value == "1")
            alert($get(MasterObj + "txtAlert").value);
        else
            SetMsg($get(MasterObj + "txtAlert").value);
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtStatus").value = "";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
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
function OndbClickGrd() {
     if (LastSelectedRow.System == 0) {
        var strUrl = "DifinitionCodeNew.aspx?CodeID=" + LastSelectedRow.cells(1).innerText
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&New=0&System=0"
                            + "&ScriptID=" + $(LastSelectedRow).attr("ScriptID");
    }
    else {
        var strUrl = "DifinitionCodeNew.aspx?CodeID=" + LastSelectedRow.cells(1).innerText
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&New=0&System=1"
                            + "&ScriptID=" + $(LastSelectedRow).attr("ScriptID");
    }
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 690px;dialogWidth: 690px;center: Yes;help: no;status: no')

    if (rValue == 1) {
        if (document.getElementById(MasterObj + "CmbCode_txtCode").value != "")
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        else
            document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    $get(MasterObj + "txtSearchFlag").value = "0";
    if ($get(MasterObj + "txtCodeName").value != "")
        $get(MasterObj + "txtCodeNameSearch").value = $get(MasterObj + "txtCodeName").value;
    else
        $get(MasterObj + "txtCodeNameSearch").value = $get(MasterObj + "CmbCode_txtName").value;
    $get(MasterObj + "txtCodeSearch").value = $get(MasterObj + "CmbCode_txtCode").value
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSearch() {
    $get(MasterObj + "txtSearchFlag").value = "1";
    if ($get(MasterObj + "txtCodeName").value != "")
        $get(MasterObj + "txtCodeNameSearch").value = $get(MasterObj + "txtCodeName").value;
    else
        $get(MasterObj + "txtCodeNameSearch").value = $get(MasterObj + "CmbCode_txtName").value;
    $get(MasterObj + "txtCodeSearch").value = $get(MasterObj + "CmbCode_txtCode").value
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (LastSelectedRow.System == 0) {
            var Msg = "آیا برای حذف مطمئنید؟"
            if (confirm(Msg) == true) {
                document.getElementById(MasterObj + "txtCodeID").value = LastSelectedRow.cells(1).innerText
                document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        else
            alert("کدهای سيستمي را نمی توانید حذف کنید")
    }
    else {
        alert("به منظور حذف یک سطر را انتخاب کنید")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    var strUrl = 'DifinitionCodeNew.aspx?ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&New=1";
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 690px;dialogWidth: 690px;center: Yes;help: no;status: no')
    if (rValue == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    OnClickBtnClear()
    OnClickBtnFilter()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnClear() {
    document.getElementById(MasterObj + "CmbCode_txtCode").value = ""
    document.getElementById(MasterObj + "CmbCode_txtName").value = ""
    document.getElementById(MasterObj + "txtCodeSearch").value = ""
    document.getElementById(MasterObj + "txtCodeNameSearch").value = ""
    document.getElementById(MasterObj + "chkUser").checked = false
    document.getElementById(MasterObj + "chkSystem").checked = false
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null)
        OndbClickGrd()
    else
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
