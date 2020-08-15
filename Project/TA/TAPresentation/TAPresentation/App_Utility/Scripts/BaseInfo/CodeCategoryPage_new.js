var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//        ======================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//        =================================Message==============================================

function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtValidate").val() == "0") {
        alert($("#" + MasterObj + "txtAlert").val());
    }
    else {

        window.returnValue = "1";
        window.close();
    }

    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
//-----------------------------------save-----------------------------------
function OnClickBtnSave() {
    MakeXmlSave()
    if (ChkNotIsEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Modify");
        $("#" + MasterObj + "BtnSubmit").click();
    }
    //window.close();
}
//============================MakeXmlSave==================================
function MakeXmlSave() {
    var XMLStr = "<Tb>"
    XMLStr += "<ID>" + $("#" + MasterObj + "txtID").val() + "</ID>"
    XMLStr += "<PageID>" + $("#" + MasterObj + "CmbPageName").val() + "</PageID>"
    XMLStr += "<CategoryID>" + $("#" + MasterObj + "CmbCategoryName").val() + "</CategoryID>"
    XMLStr += "<State>" + $("#" + MasterObj + "cmbStatus").val() + "</State>"
    XMLStr += "<Description>" + $("#" + MasterObj + "TxtDesciption").val() + "</Description>"
    XMLStr += "</Tb>"
    var str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "txtXml").val(str)
    return str;
}
// =============================== چک کردن خالی نبودن آبجکت ها ==================================   
function ChkNotIsEmpty() {

    if ($("#" + MasterObj + "CmbPageName").val() == 0) {
        alert("لطفا نام صفحه را وارد کنید ");
        return false;
    }
    else if ($("#" + MasterObj + "CmbCategoryName").val() == 0) {
        alert("لطفا نام دسته بندی را وارد کنید ");
        return false;
    }
//    else if ($("#" + MasterObj + "cmbStatus").val() == "") {
//        alert("لطفا وضعیت را وارد نماييد");
//        $("#" + MasterObj + "TxtStatus").focus();
//        return false;
//        }
    
    else if ($("#" + MasterObj + "TxtDesciption").val() == "") {
        alert("لطفا شرح را وارد نماييد");
        $("#" + MasterObj + "TxtDesciption").focus();
        return false;
    }

    return true;
}
// =====================================================================
function OnClickBtnNew() {
    $("#" + MasterObj + "CmbPageName").val(0);
    $("#" + MasterObj + "CmbCategoryName").val(0);
    $("#" + MasterObj + "cmbStatus").val("");
    $("#" + MasterObj + "TxtDesciption").val("");
}