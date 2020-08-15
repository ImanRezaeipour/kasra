var MasterObj = "ctl00_ContentPlaceHolder1_";
var MasterObjSearch = "ctl00_Snap3_ContentPlaceHolderSearch_";
window.name = "Alarm.aspx"
window.target = window.name;
/////-------------------------------------------

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var GroupID = '0';
var CountChkSelected = 0
var LastSelectedRow = null;
var LastSelectedRowClass = "";

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage() {
    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "ShowCurPage";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {

    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickImgParameter(obj) {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    var RequsterAction = "";
    var RequsterPageID = 0

    if (event.srcElement.id.indexOf('OToolBar_') != -1) {
        RequsterAction = event.srcElement.id.replace('OToolBar_', '')
    }

    url = "../BaseInfo/Person/SelectPerson.aspx?ShowFlag=0 &Page=GroupMember &GroupID=" + document.getElementById(MasterObj + "txtGroupAccessID").value
                + " &RequsterPageID=1129"
                + " &RequsterAction=" + RequsterAction
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value


    var returnValue
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no")

    if (returnValue != undefined) {
        ModifyXML(returnValue);

        $get(MasterObj + "txtSubmit").value = "Search";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)


    if (document.getElementById(MasterObj + "txtAlarmID").value != "") {
        var StrConf = "آيا از حذف مطمئنيد؟"
        if (confirm(StrConf)) {
            $get(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("لطفا ابتدا يک سطر انتخاب نماييد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    if (document.getElementById(MasterObj + "txtAlarmID").value != "") {
        url = "AlarmNew.aspx?ScriptID=" + LastSelectedRow.ScriptID
                + " &Alarm=" + LastSelectedRow.AlarmID
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value

        var returnValue
        returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

        if (returnValue == "1") {
            $get(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("لطفا ابتدا يک سطر انتخاب نماييد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd(SelectedRow) {
    OnClickBtnEdit()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }

    document.getElementById(MasterObj + "txtAlarmID").value = SelectedRow.AlarmID
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    url = "AlarmNew.aspx?ScriptID=0"
            + " &Alarm=0"
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value

    var returnValue
    returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

    if (returnValue == "1") {
        $get(MasterObj + "txtSubmit").value = "Search";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!