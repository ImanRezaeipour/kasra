//-----------------------------------------------AJAX---------

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    /*
    $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(0, 2);
    $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(3, 2);
    $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(6, 4);
    $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('StartDate').text
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
                */
}

function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value

    if ($get(MasterObj + "txtAlert").value != "") {
        SetMsg($get(MasterObj + "txtAlert").value);
        returnValue = 1
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
}
//=====================================================================
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var strChk = "";
var newrowindex = 0;
var SelectedFlag = 0;
var SelectedFlagEdit = 0;
var ScriptID, InstanceID
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    var strUrl = "RegisterLimitation.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 800px;center: Yes;help: no;status: no')
    //alert(rValue)
    if (rValue == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (confirm("آيا براي حذف مطمئنيد؟")) {
        document.getElementById(MasterObj + "txtSubmit").value = "Delete";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    //              if (checkNotEmpty() == true) {
    //                  MakeXML()
    //                  alert(document.getElementById(MasterObj + "txtXml").value)
    ////                  document.getElementById(MasterObj + "txtSubmit").value = "Save";
    ////                  document.getElementById(MasterObj + "BtnSubmit").click();
    //              }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";

    ScriptID = SelectedRow.getAttribute('ScriptID')
    InstanceID = SelectedRow.getAttribute('InstanceID')
    $get(MasterObj + "txtScriptID").value = SelectedRow.getAttribute('ScriptID')
    $get(MasterObj + "txtInstanceID").value = SelectedRow.getAttribute('InstanceID')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgGroups(obj) {
    var oRow = window.event.srcElement.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement

    ScriptID = oRow.getAttribute('ScriptID')
    InstanceID = oRow.getAttribute('InstanceID')
    $get(MasterObj + "txtScriptID").value = oRow.getAttribute('ScriptID')
    
    var strUrl = "ScriptGroups.aspx?ScriptID=" + ScriptID
            + "&Type=chk"
                            + "&InstanceID=" + InstanceID
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=13"
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 670px;center: Yes;help: no;status: no')

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd() {
    var strUrl = "RegisterLimitation.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 800px;center: Yes;help: no;status: no')
    //alert(rValue)
    if (rValue == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!