//document.body.scroll = "no"
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BeginRequestHandler(sender, args) {
    //document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    //$("#OToolBar_ProgressBar").css("visibility", "visible")
}
function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    if ($("#" + MasterObj + "txtAlert").val() != "")
        if ($("#" + MasterObj + "txtValidate").val() == "0")
            alert($("#" + MasterObj + "txtAlert").val());
        else
            SetMsg($("#" + MasterObj + "txtAlert").val());
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");
    $("#" + MasterObj + "txtValidate").val("");
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
    var strUrl = "CombineStructureNew.aspx?S1=" + $(LastSelectedRow).attr("S1")
                                                + "&S2=" + $(LastSelectedRow).attr("S2")
                                                + "&S3=" + $(LastSelectedRow).attr("S3")
                                                + "&S4=" + $(LastSelectedRow).attr("S4")
                                                + "&RS=" + $(LastSelectedRow).attr("RS")
                                                + "&ID=" + $(LastSelectedRow).attr("ID")
                                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:600px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
    if (returnResult == 1) {
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//-------------------------------------
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (confirm("آیا برای حذف مطمئن هستيد؟") == true) {
            $("#" + MasterObj + "txtID").val($(LastSelectedRow).attr("ID"))
            $("#" + MasterObj + "txtSubmit").val("Delete");
            $("#" + MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("به منظور حذف یک سطر را انتخاب کنید")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    var strUrl = "CombineStructureNew.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&ID=0"
    returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:600px;center: Yes;help: no;status: no')
    if (returnValue == 1) {
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
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
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $("#" + MasterObj + "cmbStructure").val("0");
    $("#" + MasterObj + "cmbStructureResponse").val("0");
    $("#" + MasterObj + "cmbDetailCollection").val("0");
    $("#" + MasterObj + "cmbDetailCollectionResponse").val("0");
    OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        $("#" + MasterObj + "txtCurPage").val(obj.value)
        //document.getElementById(MasterObj + "txtCurPage").value = obj.value
        $("#" + MasterObj + "txtSubmit").val("Const")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    $("#" + MasterObj + "txtSubmit").val("BtnNext")
    $("#" + MasterObj + "BtnSubmit").click()

}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    $("#" + MasterObj + "txtSubmit").val("BtnLast")
    $("#" + MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    $("#" + MasterObj + "txtSubmit").val("BtnPrev")
    $("#" + MasterObj + "BtnSubmit").click()
}
//===============================================================================================
function OnClickBtnFirst() {
    $("#" + MasterObj + "txtSubmit").val("BtnFirst")
    $("#" + MasterObj + "BtnSubmit").click()
}