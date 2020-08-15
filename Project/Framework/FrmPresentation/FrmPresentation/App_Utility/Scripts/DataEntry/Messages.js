var LastSelectedRow = null;
var LastSelectedRowClass = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";

////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
function OnClickBtnShowAll() {

    document.getElementById(MasterObj + "txtSDate").value = ""
    document.getElementById(MasterObj + "txtEDate").value = ""
    document.getElementById(MasterObj + "txtFilterDesc").value = ""
    if (document.getElementById(MasterObj + "txtSDate").value < document.getElementById(MasterObj + "txtEDate").value) {
        alert("تاریخ را درست وارد کنید")
        return;
    }
    else {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {

    //alert(document.getElementById("KCalender1_txtYear").value)

    document.getElementById(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    document.getElementById(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    document.getElementById(MasterObj + "txtFilterDesc").value = document.getElementById(MasterObj + "txtDesc").value
    if (document.getElementById(MasterObj + "txtSDate").value == "//" || document.getElementById(MasterObj + "txtSDate").value == "" || document.getElementById(MasterObj + "txtEDate").value == "//" || document.getElementById(MasterObj + "txtEDate").value == "" || document.getElementById(MasterObj + "txtSDate").value > document.getElementById(MasterObj + "txtEDate").value) {
        alert("تاریخ را درست وارد کنید")
        return;
    }
    else {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    var strUrl = "MessagesNew.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ID=0"
    var StrFeatur = 'dialogHeight: 300px;dialogWidth: 600px;center: Yes;help: no;status: no'
    var returnVal = window.showModalDialog(strUrl, window, StrFeatur)

    if (returnVal == true) {

        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();

    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        var strUrl = "MessagesNew.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ID=" + LastSelectedRow.getAttribute("ID")
        var StrFeatur = 'dialogHeight:300px;dialogWidth: 600px;center: Yes;help: no;status: no'
        var returnVal = window.showModalDialog(strUrl, window, StrFeatur)
        if (returnVal == true) {

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
    }
    else {
        alert("لطفا یک سطر راانتخاب نمایید")
    }


}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd() {
    OnClickBtnEdit()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (confirm('آیامطمئن هستید؟')) {
            document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID")
            document.getElementById(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("لطفا یک سطر راانتخاب نمایید")
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!