document.dir = "RTL";
document.body.style.overflowX = "hidden";    
var LastSelectedRow = null;
var LastSelectedRowClass = "";
$("#OToolBar_TDTopToolBar").css("display", "none");
$("#" + MasterObj + "CmbPerson_txtOnChangeFunc").val("OnChangeCmbPerson()");
OnChangeCmbPerson();
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    document.dir = "RTL";
    LastSelectedRow = null;
    if ($get(MasterObj + "txtSubmit").value == "Delete") {
        if ($get(MasterObj + "txtValidate").value == "0")
            alert($get(MasterObj + "txtAlert").value);
        else
            SetMsg($get(MasterObj + "txtAlert").value);

        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtValidate").value = "";
    }
}
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        $("#" + MasterObj + "txtCurPage").val(obj.value)
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
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    $("#" + MasterObj + "txtSubmit").val("BtnFirst")
    $("#" + MasterObj + "BtnSubmit").click()
}
//------------------------------------------------------------------------------------------
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
    var strUrl = "DefineGroupNew.aspx?GroupID=" + $(LastSelectedRow).attr("ID") + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&SystemID=" + $get(MasterObj + "txtSystemID").value
    strUrl = encodeURI(strUrl)
    returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 720px;dialogWidth:1050px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
//    if (returnResult == 1) {
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit").click();
//    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (confirm("آیا برای حذف مطمئن هستيد؟") == true) {
            $("#" + MasterObj + "txtGroupID").val($(LastSelectedRow).attr("ID"))
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
    var strUrl = "DefineGroupNew.aspx?GroupID=0" + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&SystemID=" + $get(MasterObj + "txtSystemID").value
    returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 720px;dialogWidth:1050px;center: Yes;help: no;status: no')
//    if (returnValue == 1) {
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
//    }
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
    $("#" + MasterObj + "txtTmpName").val($("#txtGroupName").val());
    $("#" + MasterObj + "txtTmpPersonCode").val($("#" + MasterObj + "CmbPerson_txtCode").val());
    $("#" + MasterObj + "txtTmpAcronym").val($("#txtAcronymName").val());
    $("#" + MasterObj + "txtTmpCategory").val($("#" + MasterObj + "CmbCategory").val());
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $("#" + MasterObj + "CmbPerson_txtCode").val("");
    $("#" + MasterObj + "CmbPerson_txtPCode").val("");
    $("#" + MasterObj + "CmbPerson_txtName").val("");
    $("#" + MasterObj + "CmbCategory").val("0");
    $("#" + MasterObj + "chkCurrStatus").attr("checked", false);
    $("#TDCurrStatusFilter").css("display", "none");
    $("#txtGroupName").val("");
    $("#txtAcronymName").val("");
    OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickSpecialCal(SelectedImg) {
    var url;
    if ($("#" + MasterObj + "CmbPerson_txtCode").val() != "") {
        url = "/Ta/TAPeresentation/Pages/SpecialCal/SpecialCal.aspx?GroupId=" + "0" + "&PersonId=" + $("#" + MasterObj + "CmbPerson_txtCode").val() + '&SessionID=' + $("#" + MasterObj + "txtSessionID").val();
        window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 895px;center: Yes;help: no;status: no");
    }
    else {
        if ($(SelectedImg.parentElement.parentElement).attr("DateManage") != 1) {
            alert("امکان باز کردن تقويم برنامه کاري براي گروههاي غير شيفتي وجود ندارد");
            return;
        }
        var url = "/Ta/TAPeresentation/Pages/SpecialCal/SpecialCal.aspx?GroupId=" + $(SelectedImg.parentElement.parentElement).attr("ID") + "&PersonId=0"
                + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
        window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 1000px;center: Yes;help: no;status: no")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnChangeCmbPerson() {
    if ($("#" + MasterObj + "CmbPerson_txtCode").val() != "") {
        $("#TDCurrStatusFilter").css("display", "inline");
        $("#" + MasterObj + "chkCurrStatus").attr("checked", true);
    }
    else {
        $("#TDCurrStatusFilter").css("display", "none");
        $("#" + MasterObj + "chkCurrStatus").attr("checked", false);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!