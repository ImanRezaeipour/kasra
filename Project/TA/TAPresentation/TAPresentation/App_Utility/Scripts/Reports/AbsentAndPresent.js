//*************************************Declaration*************************************

var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var AllPerson = 0;
var Present = 0;
var Absent = 0;
var DepID = 0;
var DepName = "";
var DetailDialogObj = null;
var DetailState = 0;
document.dir = "RTL"
document.getElementsByTagName("body")[0].scroll = "no";
document.getElementById(MasterObj + "CmbType").value = "2"
//*************************************End Declaration*************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    var elem = args.get_postBackElement();
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    //----------------------------------
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRow = null
    //----------------------------------
    $get(MasterObj + "txtSubmit").value = "";
}
//**********************************EndOnLoad*************************************
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnAllPDF() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOnePDF() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnAllExcel() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOneExcel() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//*************************************EndToolbar*************************************
//*************************************ThisPage***************************************
function onclickImgClose() {
    if (window.parent.document.all.item("ImgRestore").style.display == "inline")
        document.body.scroll = "no"
    document.getElementById("shadowMessage").style.display = "none"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgRestor() {
    document.body.scroll = "yes"
    document.documentElement.scrollTop = "yes"
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
document.body.attachEvent('onkeydown', onkeydownBody)
var keyCode = 0
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onkeydownBody() {
    keyCode = event.keyCode
    setTimeout("keyCode=0", 1000)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {

    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
    CheckDailyClick();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckDailyClick() {

    var oGrd = document.getElementById(MasterObj + "GrdAbsentPresent");

    if (oGrd)
        var len = oGrd.rows.length
    else
        return
    //--------------------------------------------- 

    var oCell = window.event.srcElement
    var oRow = window.event.srcElement
    while (oCell.tagName != "TD")
        oCell = oCell.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    //---------------------------------------------
    if ((oCell.cellIndex == 1 || oCell.cellIndex == 2 || oCell.cellIndex == 3 || oCell.cellIndex == 4 ||
                                  oCell.cellIndex == 5) && oCell.innerText != 0) {
        OnClickGrdAllperson(oCell);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnTreeClick(evt) {
    var src = window.event != window.undefined ? window.event.srcElement : evt.target;
    var nodeClick = src.tagName.toLowerCase() == "a";
    var index;
    var len;
    if (nodeClick) {
        var nodeText = src.innerText || src.innerHTML;
        var nodeValue = GetNodeValue(src);
        index = nodeValue.indexOf('#', 0);
        len = nodeValue.length;
        nodeValue = nodeValue.substr(index + 1, len - index);
    }
   
    return false;  
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function GetNodeValue(node) {
    var nodeValue = "";
    var nodePath = node.href.substring(node.href.indexOf(",") + 2, node.href.length - 2);
    var nodeValues = nodePath.split("\\");
    if (nodeValues.length > 1)
        nodeValue = nodeValues[nodeValues.length - 1];
    else
        nodeValue = nodeValues[0].substr(1);
    return nodeValue;
}
//*******************************************************************************
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0"
    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
    $get(MasterObj + "txtSTimeSearch").value = $get(MasterObj + "txtSTime").value;
    $get(MasterObj + "txtETimeSearch").value = $get(MasterObj + "txtETime").value;
    if ($get(MasterObj + "txtETimeSearch").value == "00:00")
        $get(MasterObj + "txtETimeSearch").value = "";

    if ($get(MasterObj + "txtSTimeSearch").value == "00:00")
        $get(MasterObj + "txtSTimeSearch").value = "";

    if ($get(MasterObj + "txtETimeSearch").value < $get(MasterObj + "txtSTimeSearch").value)
        alert("ساعت شروع بزرگتر از ساعت پایان است");
    else {
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }

}
//*******************************************************************************
function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "1"
    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
    $get(MasterObj + "txtSTimeSearch").value = $get(MasterObj + "txtSTime").value;
    $get(MasterObj + "txtETimeSearch").value = $get(MasterObj + "txtETime").value;
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0"
    $get(MasterObj + "txtETimeSearch").value = ""
    $get(MasterObj + "txtSTimeSearch").value = ""
    $get(MasterObj + "txtSTime").value = "00:00"
    $get(MasterObj + "txtETime").value = "00:00"
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************
function OnFocuseTxtSTime() {
    document.getElementById(MasterObj + "txtSTime").select();
}
//*******************************************************************************
function OnFocuseTxtETime() {
    document.getElementById(MasterObj + "txtETime").select();
}
//=======================================================================
function OnBlurSTime() {
    if ($get(MasterObj + "txtSTime").value != "00:00"
        && $get(MasterObj + "CmbType").value == "2"
        && $get(MasterObj + "txtSTime").value <= '23:59')
        $get(MasterObj + "txtETime").value = $get(MasterObj + "txtSTime").value;
}
//==================================================================================
function OnClickGrdAllperson(obj) {
    var row = window.event.srcElement.parentElement
    var index;
    if (obj == 0) {
        obj = window.event.srcElement;
        index = window.event.srcElement.cellIndex;
    }
    else index = obj.cellIndex;

    var kind, RptKind;
    switch (index) {
        case 1:
            kind = "Allperson";
            RptKind = "کل پرسنل";
            break;
        case 2:
            kind = "wPresent";
            RptKind = "حاضرين موظف";
            break;
        case 3:
            kind = "Present";
            RptKind = "اضافه کار پرسنل";
            break;
        case 4:
            kind = "Absent";
            RptKind = "غايبين";
            break;
        case 5:
            kind = "noPresent";
            RptKind = "غايبين مجاز";
            break;
    }
    if (DetailState == 0) {
        while (row.tagName != 'TR')
            row = row.parentElement
        if (DetailState != 1) {
            if (row != null) {

                AllPerson = row.cells(1).innerText;
                Present = row.cells(2).innerText;
                Absent = row.cells(4).innerText;
                $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
                if (row.getAttribute("department") == "999999999") {
                    DepID = document.getElementById(MasterObj + "txtTreeDepartmentID").value
                    DepName = document.getElementById(MasterObj + "txtTreeDepartmentName").value
                }
                else {
                    DepID = row.getAttribute("department");
                    DepName = row.cells(0).innerText;
                }
                var url = "AllPersonelDailyReport.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&Kind=" + kind
                + "&RptKind=" + RptKind
                + "&DepID=" + DepID
                + "&Date=" + $get(MasterObj + "txtDate").value
                + "&AllPerson=" + AllPerson
                + "&Absent=" + Absent
                + "&DepName=" + DepName
                + "&Present=" + Present
                + "&STime=" + $get(MasterObj + "txtSTimeSearch").value
                + "&ETime=" + $get(MasterObj + "txtETimeSearch").value
                + "&MenuItemID=" + $get(MasterObj + "txtPageID").value
                var winPro = "dialogWidth:1250px;dialogHeight:550px;center: Yes;help: no;status:no;minimize: yes;"
                DetailDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
                DetailState = 1;
            }
        }
    }
    else {
        try {
            if (DetailState == 1) {
                if (DetailDialogObj != null) {
                    var oGrd = document.getElementById(MasterObj + "GrdAbsentPresent");
                    var len = oGrd.rows.length - 2;
                    if (LastSelectedRow.rowIndex == len) {
                        DepID = document.getElementById(MasterObj + "txtTreeDepartmentID").value
                        DepName = document.getElementById(MasterObj + "txtTreeDepartmentName").value
                    }
                    else {
                        DepID = LastSelectedRow.getAttribute('department')
                        DepName = LastSelectedRow.cells(0).innerText;
                    }
                    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
                    DetailDialogObj.document.getElementById(MasterObj + "txtDate").value = $get(MasterObj + "txtDate").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentID").value = DepID
                    DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentName").value = DepName
                    DetailDialogObj.document.getElementById(MasterObj + "txtKind").value = kind;
                    DetailDialogObj.document.getElementById(MasterObj + "DivRole").innerText = DepName
                    DetailDialogObj.document.getElementById(MasterObj + "DivAllPerson").innerText = LastSelectedRow.cells(1).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "DivAbsent").innerText = LastSelectedRow.cells(4).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "DivPresent").innerText = LastSelectedRow.cells(2).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "txtSTime").value = $get(MasterObj + "txtSTimeSearch").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtETime").value = $get(MasterObj + "txtETimeSearch").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtAllPerson").value = LastSelectedRow.cells(1).innerText;

                    DetailDialogObj.OnClickBtnFilter();
                }
            }
        }
        catch (e) {
            DetailState = 0
            OnClickGrdAllperson(obj)
        }
    }
}
//=======================================================================
function OnChangeCmbType() {
    var SDate = document.getElementById(MasterObj + "txtCurDate").value;

    if (document.getElementById(MasterObj + "CmbType").value == "1") {//روز خاص

        document.getElementById(MasterObj + "txtSTime").disabled = true;
        document.getElementById(MasterObj + "txtETime").disabled = true;
        document.getElementById(MasterObj + "txtSTime").value = "";
        document.getElementById(MasterObj + "txtSTimeSearch").value = "";
        document.getElementById(MasterObj + "txtETime").value = "";
        document.getElementById(MasterObj + "txtETimeSearch").value = "";
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = false;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = false;
    }
    else if (document.getElementById(MasterObj + "CmbType").value == "2") {//ساعت خاص
        document.getElementById(MasterObj + "txtSTime").disabled = false;
        document.getElementById(MasterObj + "txtETime").disabled = true;
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = true;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = true;
        document.getElementById(MasterObj + "txtDate").value = document.getElementById(MasterObj + "txtCurDate").value;

        $get(MasterObj + "KCalDate_txtDay").value = SDate.substr(8, 2);
        $get(MasterObj + "KCalDate_txtMonth").value = SDate.substr(5, 2);
        $get(MasterObj + "KCalDate_txtYear").value = SDate.substr(0, 4);
        $get(MasterObj + "KCalDate_txtCalendar").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
        $get(MasterObj + "KCalDate_txtCalendar").value = $get(MasterObj + "KCalDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value)

    }
    else if (document.getElementById(MasterObj + "CmbType").value == "3") {//بازه زمانی خاص
        document.getElementById(MasterObj + "txtSTime").disabled = false;
        document.getElementById(MasterObj + "txtETime").disabled = false;
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = false;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = false;
    }

}