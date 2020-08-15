
window.name = "WPResult"
aspnetForm.target = "WPResult"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
/******************************************************************************************/
function OnClickBtnFilter() {
    $get(MasterObj + "txtCode").value = $get(MasterObj + "CmbCode_txtCode").value
    $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "CmbPerson_txtCode").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
/******************************************************************************************/
function OnClickScript(LastSelectedRow) {
    while (LastSelectedRow.tagName != "TR")
        LastSelectedRow = LastSelectedRow.parentElement


    if (LastSelectedRow.getAttribute("ScriptType") == 1 ) {
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