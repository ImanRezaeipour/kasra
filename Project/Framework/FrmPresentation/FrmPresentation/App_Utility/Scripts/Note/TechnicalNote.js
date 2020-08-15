var LastSelectedRow = null;
var MasterObj = "ctl00_ContentPlaceHolder1_";
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value);
        else
            alert($get(MasterObj + "txtAlert").value);
    }
    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")
    $("#" + MasterObj + "txtValidate").val("")
   
}


function OnClickBtnNew() {
    url = "TechnicalNote_New.aspx?ID=0&SessionID=" + $("#" + MasterObj + "txtSessionID").val() +
          "&txtGetCompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val();
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:300px;dialogWidth: 600px;center: Yes;help: no;status: no")
    if (returnValue == 1) {
        OnClickBtnFilter();
    }
}
//=======================================================ویرایش ========================================  
function OnClickBtnEdit() {
    if (LastSelectedRow == "" || LastSelectedRow == null)
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
    else {

        var strUrl = "TechnicalNote_New.aspx?ID=" + $(LastSelectedRow).attr("Id")
                   + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                   + "&Title=" + $(LastSelectedRow).find("td:eq(" + 2 + ")").text()
                   + "&Doer=" + $(LastSelectedRow).find("td:eq(" + 4 + ")").text()
                   + "&SubSystem=" + $(LastSelectedRow).attr("SystemId")
                   + "&CategoryId=" + $(LastSelectedRow).attr("CategoryId")
                   + "&Requester=" + $(LastSelectedRow).attr("Requester")
                   + "&RequestDesc=" + $(LastSelectedRow).attr("RequestDesc")
                   + "&Solution=" + $(LastSelectedRow).attr("Solution")
                   + "&txtGetCompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value;
        var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 300px;dialogWidth: 600px;center: Yes;help: no;status: no")

        if (returnValue == "1") {
            $("#" + MasterObj + "txtSubmit").val("Const")
            $("#" + MasterObj + "BtnSubmit").click()
        }
    }
}
//======================================================
function OnClickBtnFilter() {
    $("#" + MasterObj + "txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
    $("#" + MasterObj + "txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
    $("#" + MasterObj + "txtSubmit").val("Filter");
    $("#" + MasterObj + "BtnSubmit").click();
}
//=======================================================================

function OnClickBtnDel() {
    if (LastSelectedRow != null && LastSelectedRow != "") {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {

            $("#" + MasterObj + "txtID").val($(LastSelectedRow).attr("Id"))
            $("#" + MasterObj + "txtSubmit").val("Delete")
            $("#" + MasterObj + "BtnSubmit").click()
        }
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
//======================================================دابل کلیک ==============================
function OndbClickGrd() {
    OnClickBtnEdit()
}

//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
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
//===============================================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyle');
}
//===================================================
