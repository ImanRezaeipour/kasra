
window.name = "DailyResult"
aspnetForm.target = "DailyResult"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var DetailDialogObj = null;
var DetailState = 0;
//**************************************Ajax********************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}

function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    $get(MasterObj + "txtSubmit").value = "";
}
//*************************************Toolbar*************************************
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
    var oGrd = document.getElementById("GrdDailyResult");
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
    if (oCell.cellIndex == 3)
        OnClickFinalCode(oCell);
}
/******************************************************************************************/
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
    document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
    document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value
    document.getElementById(MasterObj + "txtCode").value = document.getElementById(MasterObj + "CmbCode_txtCode").value
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
/******************************************************************************************/
function OnClickFinalCode(obj) {
    var row = window.event.srcElement.parentElement
    var index;
    if (obj == 0) {
        obj = window.event.srcElement;
        index = window.event.srcElement.cellIndex;
    }
    else index = obj.cellIndex;
    if (DetailState == 0) {
        while (row.tagName != 'TR')
            row = row.parentElement
        if (DetailState != 1) {
            if (row != null) {
                var Date = row.cells(0).innerText;
                Date = Date.substr(8, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
                var url = "BaseResultCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                        + "&PersonID=" + row.cells(1).innerText
                        + "&FinalCode=" + row.cells(3).innerText
                        + "&Date=" + Date
                var winPro = "dialogWidth:950px;dialogHeight:250px;center: Yes;help: no;status:no;minimize: yes;"
                DetailDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
                DetailState = 1;
            }
        }
    }
    else {
        try {
            if (DetailState == 1) {
                if (DetailDialogObj != null) {
                    var Date = LastSelectedRow.cells(0).innerText;
                    Date = Date.substr(8, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
                    DetailDialogObj.document.getElementById(MasterObj + "txtDate").value = Date
                    DetailDialogObj.document.getElementById(MasterObj + "txtFinalCode").value = LastSelectedRow.cells(3).innerText
                    DetailDialogObj.document.getElementById(MasterObj + "txtPersonID").value = LastSelectedRow.cells(1).innerText
                    DetailDialogObj.OnClickBtnFilter();
                }
            }
        }
        catch (e) {
            DetailState = 0
            OnClickFinalCode(obj)
        }
    }
}
/******************************************************************************************/
function OnClickScript(LastSelectedRow) {
    while (LastSelectedRow.tagName != "TR")
        LastSelectedRow = LastSelectedRow.parentElement

    if (LastSelectedRow.getAttribute("ScriptType") == 1) {
        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + LastSelectedRow.getAttribute("CodeID")
                                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                            + "&New=0&System=1"; //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }
    else if (LastSelectedRow.getAttribute("ScriptType") == 2) {//قانون هاي الگويي

        var strUrl = '../../App_Pages/BaseInfo/ScriptTemplateNew.aspx?ScriptID=' + LastSelectedRow.getAttribute("ScriptID")
                        + '&CategoryID=' + LastSelectedRow.getAttribute("CategoryID")
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                        + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                        + "&System=" + LastSelectedRow.getAttribute("ScriptSystem")
                        + "&ViewMode=1"
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')
    }
    else if (LastSelectedRow.getAttribute("ScriptType") == 3) {//قانون هاي عادي
        var strUrl = '../../App_Pages/BaseInfo/ScriptsNew.aspx?ScriptID=' + LastSelectedRow.getAttribute("ScriptID")
                        + '&CategoryID=' + LastSelectedRow.getAttribute("CategoryID")
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                        + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                        + "&System=" + LastSelectedRow.getAttribute("ScriptSystem")
                        + "&ViewMode=1"
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')
    }
    else if (LastSelectedRow.getAttribute("ScriptType") == 4) {
      
        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + LastSelectedRow.getAttribute("DCodeID")
                                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                            + "&New=0&System=1"; //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }
}