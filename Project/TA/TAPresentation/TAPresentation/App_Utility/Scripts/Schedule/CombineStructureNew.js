document.body.scroll = "no";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var SaveNewFlag = 0;
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtAlert").val() != "") {

        window.returnValue = "1";
        if ($("#" + MasterObj + "txtSubmit").val() == "Modify") {
            if ($("#" + MasterObj + "txtValidate").val() != "1") {
                alert($("#" + MasterObj + "txtAlert").val());

            }
            else {
                if (SaveNewFlag == 1) {
                    SetMsg($("#" + MasterObj + "txtAlert").val());
                    OnClickBtnNew();
                }
                else
                    SetMsg($("#" + MasterObj + "txtAlert").val());
                //window.close();
            }
        }
    }

    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");

    LastSelectedRow = "";
    LastSelectedRowClass = "";
    SaveNewFlag = 0;
}
// ===============================Save===================================   
function OnClickBtnSave() {

    if ($("#" + MasterObj + "cmbDetailCollection").val() == "0") {
        alert("لطفا زیرساختار اول را وارد کنید");
        $("#" + MasterObj + "cmbDetailCollection").focus();
        return;
    }

    if ($("#" + MasterObj + "cmbDetailCollection2").val() == "0") {
        alert("لطفا زیرساختار دوم را وارد کنید");
        $("#" + MasterObj + "cmbDetailCollection2").focus();
        return;
    }
    if ($("#" + MasterObj + "cmbDetailCollectionResponse").val() == "0") {
        alert("لطفا زیرساختار نتیجه را وارد کنید");
        $("#" + MasterObj + "cmbDetailCollectionResponse").focus();
        return;
    }
    $("#" + MasterObj + "txtSubmit").val("Modify");
    $("#" + MasterObj + "BtnSubmit").click();
}

// =====================================================================
function OnClickBtnNew() {
    $("#" + MasterObj + "txtID").val("0")
    $("#" + MasterObj + "cmbStructure").val("0")
    //        $("#" + MasterObj + "cmbDetailCollection").val("0")
    $("#" + MasterObj + "cmbStructure2").val("0")
    //        $("#" + MasterObj + "cmbDetailCollection2").val("0")
    $("#" + MasterObj + "cmbStructure3").val("0")
    //        $("#" + MasterObj + "cmbDetailCollection3").val("0")
    $("#" + MasterObj + "cmbStructure4").val("0")
    //        $("#" + MasterObj + "cmbDetailCollection4").val("0")
    $("#" + MasterObj + "cmbStructureResponse").val("0")
    //        $("#" + MasterObj + "cmbDetailCollectionResponse").val("0")
    $("#" + MasterObj + "txtSubmit").val("NewItem");
    $("#" + MasterObj + "BtnSubmit").click();
}
//=============================
function OnClickBtnSaveNew() {
    SaveNewFlag = 1;
    OnClickBtnSave();
}