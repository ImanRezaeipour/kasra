
var LastSelectedRow = null;
var LastSelectedRowClass = "";

var rowIndex;
var isCheanged = false;
var GrdGoingMangeNew = document.getElementById("GrdGoingMangeNew");

window.name = "GoingManageNew.aspx"
window.target = window.name;
window.returnValue = 0;

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//==================================================================
function BeginRequestHandler(sender, args) {
    window.name = "GoingManageNew.aspx"
    window.target = window.name;

}
//==================================================================
function EndRequestHandler(sender, args) {

    var StrVal = $get(MasterObj + "txtSubmit").value

    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1") {
            alert($get(MasterObj + "txtAlert").value)
            window.returnValue = 1;
        }
        else {
            alert($get(MasterObj + "txtAlert").value);
        }
        $get(MasterObj + "txtAlert").value = "";
    }
    $get(MasterObj + "txtSubmit").value = "";
    if (StrVal == "ModavematKari") {
        if ($get(MasterObj + "txtValidate").value == "1")
            document.getElementById(MasterObj + "chkModavemat").className = "";
    }

}

//**********************************************************************************************
function onClickModavemat(obj) {
    if (document.getElementById(MasterObj + "txtModifyModavemat").value != "2") {
        if (obj.className == "" && obj.checked == true) {
            obj.className = "cssInsertSelectChk";
            document.getElementById(MasterObj + "txtInsertModavemat").value = "0"
        }
        else
            if (obj.className == "" && obj.checked == false) {
                obj.className = "cssDeleteSelectChk";
                document.getElementById(MasterObj + "txtInsertModavemat").value = "1"
            }
            else {
                obj.className = "";
                document.getElementById(MasterObj + "txtInsertModavemat").value = obj.checked == false ? 1 : 0;
            }
        if (obj.className != "") {
            document.getElementById(MasterObj + "txtSubmit").value = "ModavematKari";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
}
//**********************************************************************************************
function checkEnter(obj) {
    // برای حرکت روی گرید برای بالا رفتن با اروکی بالا
    if (window.event.keyCode == 40) {
        var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) + 1;
        if (obj.parentElement.parentElement.parentElement.rows(rowIndex) != null) {
            if (obj.parentElement.cellIndex == 3) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                    return
                }
            }
            if (obj.parentElement.cellIndex == 9) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                    return
                }
            }
            if (obj.parentElement.cellIndex == 11) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.select()
                    return
                }
            }

        }
    }
    // برای حرکت روی گرید برای پایین رفتن با اروکی پایین
    if (window.event.keyCode == 38) {
        var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) - 1;
        if (rowIndex != 0) {
            if (obj.parentElement.cellIndex == 3) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                    return
                }
            }
            if (obj.parentElement.cellIndex == 9) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                    return
                }
            }
            if (obj.parentElement.cellIndex == 11) {
                if (obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.disabled == false) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(11).firstChild.select()
                    return
                }
            }
        }
    }
    if (window.event.keyCode == 13) {
        //-----برای حالتی که display مربوط به نوع تردد درخواستی باید false شود-----------
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            obj.parentElement.parentElement.cells(10).className = "hidden";
        }
        else
            obj.parentElement.parentElement.cells(10).className = "";
        //پس از ساعت
        if (obj.parentElement.cellIndex == 3 && obj.parentElement.parentElement.cells(4).firstChild.disabled == false) {

            obj.parentElement.parentElement.cells(4).firstChild.focus()
            obj.parentElement.parentElement.cells(4).firstChild.setActive()

        }
        //پس از ساعت
        if (obj.parentElement.cellIndex == 3 && obj.parentElement.parentElement.cells(4).firstChild.disabled == true) {

            obj.parentElement.parentElement.cells(9).firstChild.firstChild.focus()
            obj.parentElement.parentElement.cells(9).firstChild.firstChild.select()
        }
        //پس از نوع
        if (obj.parentElement.cellIndex == 4) {
            //---چک اینکه اگه عدم انتقال غیر فعال است بپرد روی آبجکت بعدیش
            if (obj.parentElement.parentElement.cells(9).firstChild.firstChild.disabled == false) {
                obj.parentElement.parentElement.cells(9).firstChild.firstChild.focus()
                obj.parentElement.parentElement.cells(9).firstChild.firstChild.select()
            }
            else {
                if (obj.parentElement.parentElement.cells(10).className != "hidden")
                    obj.parentElement.parentElement.cells(10).firstChild.focus()
                else {
                    obj.parentElement.parentElement.cells(10).firstChild.focus()
                    obj.parentElement.parentElement.cells(10).firstChild.select()
                }
            }
        }
        //پس از عدم انتقال
        if (obj.parentElement.cellIndex == 9) {
            if (obj.parentElement.parentElement.cells(10).className != "hidden")
                obj.parentElement.parentElement.cells(10).firstChild.focus()
            else {
                obj.parentElement.parentElement.cells(10).firstChild.focus()
                obj.parentElement.parentElement.cells(10).firstChild.select()
            }
        }
        //پس از نوع تردد درخواستی
        if (obj.parentElement.cellIndex == 10 && obj.parentElement.parentElement.cells(10).className != "hidden") {
            obj.parentElement.parentElement.cells(11).firstChild.focus()
            obj.parentElement.parentElement.cells(11).firstChild.select()
        }
        //اینتر روی شرح
        if (obj.parentElement.parentElement.cells(10).className != "hidden") {
            if (obj.parentElement.cellIndex == 11) {
                if ((obj.parentElement.parentElement.cells(12).style.display == "none") || (obj.parentElement.parentElement.cells(12).firstChild.tagName == "BUTTON")) {
                    var row = obj.parentElement.parentElement
                    //اگر دسترسی ذخیره دارد
                    if (document.getElementById(MasterObj + "txtModifyTaradod").value == "1") {
                        //اگر سطرحذف شده نیست
                        if (row.getAttribute("ISDel") != 1) {
                            //اگر با دکمه ایجاد به وجود آمده است
                            if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {

                                if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                    alert("لطفا اطلاعات را تکمیل نمایید")
                                    return;
                                }
                                save(obj);
                                rowIndex = row.rowIndex;
                                document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                                document.getElementById(MasterObj + "BtnSubmit").click();
                            }
                            //اگر سطر موجود است
                            else {

                                if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                    alert("لطفا اطلاعات را تکمیل نماییید")
                                    return;
                                }
                                if (isCheanged == true || document.getElementById(MasterObj + "txtOldDesc").value != row.cells(9).firstChild.value) {
                                    modify(obj);
                                    document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                                    isCheanged = false;
                                    document.getElementById(MasterObj + "BtnSubmit").click();
                                }
                            }

                        }
                    }
                }
                else {
                    obj.parentElement.parentElement.cells(12).firstChild.focus()
                    obj.parentElement.parentElement.cells(12).firstChild.setActive()
                }
            }
            if (obj.parentElement.cellIndex == 12) {
                var row = obj.parentElement.parentElement

                //if (document.getElementById(MasterObj + "txtState").value == "Admin") {
                //اگر دسترسی ذخیره دارد
                if (document.getElementById(MasterObj + "txtModifyTaradod").value == "1") {
                    //اگر سطرحذف شده نیست
                    if (row.getAttribute("ISDel") != 1) {
                        //اگر با دکمه ایجاد به وجود آمده است
                        if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {

                            if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                alert("لطفا اطلاعات را تکمیل نمایید")
                                return;
                            }
                            save(obj);
                            rowIndex = row.rowIndex;
                            document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                            document.getElementById(MasterObj + "txtSubmit").value = "Save";
                            document.getElementById(MasterObj + "BtnSubmit").click();
                        }
                        //اگر سطر موجود است
                        else {

                            if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                alert("لطفا اطلاعات را تکمیل نماییید")
                                return;
                            }
                            if (isCheanged == true || document.getElementById(MasterObj + "txtOldDesc").value != row.cells(9).firstChild.value) {
                                modify(obj);
                                document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                                isCheanged = false;
                                document.getElementById(MasterObj + "BtnSubmit").click();
                            }
                        }
                        //---------------
                    }
                }
            }
        }
        else {
            if (obj.parentElement.cellIndex == 10) {
                if ((obj.parentElement.parentElement.cells(11).style.display == "none") || (obj.parentElement.parentElement.cells(11).firstChild.tagName == "BUTTON")) {
                    var row = obj.parentElement.parentElement
                    //اگر دسترسی ذخیره دارد
                    if (document.getElementById(MasterObj + "txtModifyTaradod").value == "1") {
                        //اگر سطرحذف شده نیست
                        if (row.getAttribute("ISDel") != 1) {
                            //اگر با دکمه ایجاد به وجود آمده است
                            if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {

                                if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                    alert("لطفا اطلاعات را تکمیل نمایید")
                                    return;
                                }
                                save(obj);
                                rowIndex = row.rowIndex;
                                document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                                document.getElementById(MasterObj + "BtnSubmit").click();
                            }
                            //اگر سطر موجود است
                            else {

                                if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                    alert("لطفا اطلاعات را تکمیل نماییید")
                                    return;
                                }
                                if (isCheanged == true || document.getElementById(MasterObj + "txtOldDesc").value != row.cells(9).firstChild.value) {
                                    modify(obj);
                                    document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                                    isCheanged = false;
                                    document.getElementById(MasterObj + "BtnSubmit").click();
                                }
                            }

                        }
                    }
                }
                else {
                    obj.parentElement.parentElement.cells(11).firstChild.focus()
                    obj.parentElement.parentElement.cells(11).firstChild.setActive()
                }
            }
            if (obj.parentElement.cellIndex == 11) {
                var row = obj.parentElement.parentElement

                //if (document.getElementById(MasterObj + "txtState").value == "Admin") {
                //اگر دسترسی ذخیره دارد
                if (document.getElementById(MasterObj + "txtModifyTaradod").value == "1") {
                    //اگر سطرحذف شده نیست
                    if (row.getAttribute("ISDel") != 1) {
                        //اگر با دکمه ایجاد به وجود آمده است
                        if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {

                            if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                alert("لطفا اطلاعات را تکمیل نمایید")
                                return;
                            }
                            save(obj);
                            rowIndex = row.rowIndex;
                            document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                            document.getElementById(MasterObj + "txtSubmit").value = "Save";
                            document.getElementById(MasterObj + "BtnSubmit").click();
                        }
                        //اگر سطر موجود است
                        else {

                            if (row.cells(3).firstChild.value == "00:00" || row.cells(3).firstChild.value == "") {
                                alert("لطفا اطلاعات را تکمیل نماییید")
                                return;
                            }
                            if (isCheanged == true || document.getElementById(MasterObj + "txtOldDesc").value != row.cells(9).firstChild.value) {
                                modify(obj);
                                document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";
                                document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                                isCheanged = false;
                                document.getElementById(MasterObj + "BtnSubmit").click();
                            }
                        }
                        //---------------
                    }
                }
            }
        }
    }
}
//**********************************************************************************************
function modify(obj) {

    rowIndex = obj.parentElement.parentElement.rowIndex;
    var row = obj.parentElement.parentElement
    var Date = document.getElementById(MasterObj + "txtSDate").value

    Date = Date.substr(8, 2).trim() + "/" + Date.substr(3, 2).trim() + "/" + Date.substr(0, 2).trim();
    document.getElementById(MasterObj + "txtTime").value = row.cells(3).firstChild.value
    document.getElementById(MasterObj + "txtDateForSP").value = Date
    document.getElementById(MasterObj + "txtAttendanceID").value = row.getAttribute("AttendanceID")
    document.getElementById(MasterObj + "txtInoutKind").value = row.cells(4).firstChild.value
    document.getElementById(MasterObj + "txtUntransfer").value = row.cells(9).firstChild.firstChild.checked
    document.getElementById(MasterObj + "txtDeleteID").value = "0"
    if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
        document.getElementById(MasterObj + "txtDesc").value = row.cells(10).firstChild.value
        document.getElementById(MasterObj + "txtCardCode").value = row.cells(11).firstChild.value;
    }
    else {
        if (row.cells(10).firstChild.value != "0" && row.cells(10).firstChild.value != 0)
            document.getElementById(MasterObj + "txtDesc").value = row.cells(10).firstChild.value + "$" + row.cells(11).firstChild.value
        else
            document.getElementById(MasterObj + "txtDesc").value = row.cells(11).firstChild.value;

        document.getElementById(MasterObj + "txtCardCode").value = row.cells(12).firstChild.value;
    }

}
//**********************************************************************************************
function save(obj) {

    rowIndex = obj.parentElement.parentElement.rowIndex;
    var row = obj.parentElement.parentElement
    var Date = document.getElementById(MasterObj + "txtSDate").value

    Date = Date.substr(8, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
    document.getElementById(MasterObj + "txtTime").value = row.cells(3).firstChild.value
    document.getElementById(MasterObj + "txtDateForSP").value = Date
    document.getElementById(MasterObj + "txtAttendanceID").value = null
    document.getElementById(MasterObj + "txtInoutKind").value = row.cells(4).firstChild.value
    document.getElementById(MasterObj + "txtUntransfer").value = row.cells(9).firstChild.firstChild.checked
    document.getElementById(MasterObj + "txtDeleteID").value = "0"
    if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
        document.getElementById(MasterObj + "txtDesc").value = row.cells(10).firstChild.value
        document.getElementById(MasterObj + "txtCardCode").value = row.cells(11).firstChild.value;
    }
    else {
        if (row.cells(10).firstChild.value != "0" && row.cells(10).firstChild.value != 0)
            document.getElementById(MasterObj + "txtDesc").value = row.cells(10).firstChild.value + "$" + row.cells(11).firstChild.value
        else
            document.getElementById(MasterObj + "txtDesc").value = row.cells(11).firstChild.value;

        document.getElementById(MasterObj + "txtCardCode").value = row.cells(12).firstChild.value;
    }
}
//**********************************************************************************************
function onchangeControl() {

    isCheanged = true;

}
//*******************************************************************************
function OnClickNewRow(obj) {
    //زدن دکمه ایجاد و فرستان شماره سطر و تحویل ان به اسپی برای آوردن یک سطر خالی از بانک
    rowIndex = obj.parentElement.parentElement.rowIndex;
    document.getElementById(MasterObj + "txtRowIndexForNew").value = rowIndex
    if (document.getElementById(MasterObj + "txtRowIndexForNew").value == "")
        document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";

    document.getElementById(MasterObj + "txtSubmit").value = "New";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************

function OnClickGrd(SelectedRow) {

    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;

    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OnClickBtnCancel() {
    window.close();
}
//*******************************************************************************
function OnClickGardeshDCon() {
    //مطابق با ماهانه 14/11 است

    if (document.getElementById(MasterObj + "txtDayContinuationID").value != "" && document.getElementById(MasterObj + "txtDayContinuationID").value != "0") {

        var DocId = 0
        var WFDocId = 0
        var NewWF = 0
        DocId = document.getElementById(MasterObj + "txtDayContinuationID").value
        WFDocId = document.getElementById(MasterObj + "WFDocModavem").value
        NewWF = document.getElementById(MasterObj + "NewWF").value

        //        var xmlStr = document.getElementById(MasterObj + "txtXmlWfLog").value
        //        root = '/DataEntryEntity/WFLog'
        //        //
        //        newrowindex = 0
        //        if (xmlStr == "")
        //            xmlStr = "<ReportsEntity></ReportsEntity>"

        //        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        //        xmlDoc.async = "false";
        //        xmlDoc.loadXML(xmlStr);

        //        var xmlNodes;

        //        xmlNodes = xmlDoc.documentElement.selectNodes(root + "[DocId=" + DocId + "]");

        //        if (xmlNodes.length != 0)

        if (NewWF == 1) {
            window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocId + "&DocID=" + DocId, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
        }
        else
            window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + DocId, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
    }
}
//*******************************************************************************
function OnClickGardeshCredit(obj) {
    //مطابق با ماهانه 14/11 است
    var oRow = window.event.srcElement.parentElement.parentElement.rowIndex
    var Row = window.event.srcElement.parentElement.parentElement

    var CreditID = Row.getAttribute("AttendanceID")

    var WFDocId = Row.getAttribute("WFDocId");
    var NewF = Row.getAttribute("NewF");


    if (NewF == 1)
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocId + "&DocID=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    else
        window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
}
//*******************************************************************************
function OnClickDelRow(obj) {
    if (confirm('آیامطمئن هستيد؟')) {
        rowIndex = obj.parentElement.parentElement.rowIndex;
        var row = obj.parentElement.parentElement
        document.getElementById(MasterObj + "txtTime").value = row.cells(3).firstChild.value
        document.getElementById(MasterObj + "txtDateForSP").value = document.getElementById(MasterObj + "txtSDate").value;
        document.getElementById(MasterObj + "txtAttendanceID").value = row.getAttribute("AttendanceID")
        document.getElementById(MasterObj + "txtInoutKind").value = null
        document.getElementById(MasterObj + "txtUntransfer").value = null
        document.getElementById(MasterObj + "txtDeleteID").value = "1"
        document.getElementById(MasterObj + "txtDesc").value = null
        document.getElementById(MasterObj + "txtSubmit").value = "Del";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function OnClickRefreshDelRow(obj) {
    if (confirm('آیامطمئن هستيد؟')) {
        rowIndex = obj.parentElement.parentElement.rowIndex;
        var row = obj.parentElement.parentElement
        document.getElementById(MasterObj + "txtTime").value = row.cells(3).firstChild.value
        document.getElementById(MasterObj + "txtDateForSP").value = document.getElementById(MasterObj + "txtSDate").value;
        document.getElementById(MasterObj + "txtAttendanceID").value = row.getAttribute("AttendanceID")
        document.getElementById(MasterObj + "txtInoutKind").value = null
        document.getElementById(MasterObj + "txtUntransfer").value = null
        document.getElementById(MasterObj + "txtDeleteID").value = "0"
        document.getElementById(MasterObj + "txtDesc").value = null
        document.getElementById(MasterObj + "txtSubmit").value = "Refresh";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function SaveOldDesc(obj) {
    //زیرا onchanged برای شرح بی معنا است زیرا باید onblur اتفاق بیفتد تا پس از آن onchanged پس برای تصمیم گیری که ایا تغییر داشته ایم و سمت سروذ برویم یا خیر نیاز است
    document.getElementById(MasterObj + "txtOldDesc").value = obj.value;
}
//**********************************************************************************************
function onclickForFocus(obj) {
    obj.select();
}

