//*************************************Declaration*************************************
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.getElementsByTagName("body")[0].scroll = "no";

//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//=====================================================================================================
function BeginRequestHandler(sender, args) {
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtAlert").val() != "") {

        window.returnValue = "1";
        if ($("#" + MasterObj + "txtSubmit").val() == "Modify") {
            if ($("#" + MasterObj + "txtValidate").val() != "1") {
                alert($("#" + MasterObj + "txtAlert").val());
            }
            else {
                SetMsg($("#" + MasterObj + "txtAlert").val());
                if ($get(MasterObj + "txtName").value!='')
                   window.close();
            }
        }
    }

    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")

    LastSelectedRow = "";
    LastSelectedRowClass = "";

}
// ===============================Save===================================   
function OnClickBtnSave() {
    MakeXmlSave();
    if (ChkNotIsEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Modify")
        $("#" + MasterObj + "BtnSubmit").click()
    }
  } 
//--------------------------
function OnClickBtnSaveNew() {
    MakeXmlSave();
    if (ChkNotIsEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Modify")
        $("#" + MasterObj + "BtnSubmit").click()
        // ----------------------------------------
         $get(MasterObj + "txtID").value=""
        $get(MasterObj + "txtName").value =""
        $get(MasterObj + "txtFamil").value=""
        $get(MasterObj + "CmbRelation").value=""
        $("#" + MasterObj + "txtBirthDate").val("")
        $("#" + MasterObj + "txtValidDate").val("")
      
    }
} 
//============================MakeXmlSave==================================
function MakeXmlSave() {
    var Act = "1";
    if ($("#" + MasterObj + "RadioActiv").attr("checked"))
        Act = "1"
    else
        Act = "0"
    $("#" + MasterObj + "txtBirthDate").val($("#" + MasterObj + "KCalBirthDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalBirthDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalBirthDate_txtDay").val());
    $("#" + MasterObj + "txtValidDate").val($("#" + MasterObj + "KCalValiDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalValiDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalValiDate_txtDay").val());
    if ($("#" + MasterObj + "txtBirthDate").val() == "//")
        $("#" + MasterObj + "txtBirthDate").val("");
    if ($("#" + MasterObj + "txtValidDate").val() == "//")
        $("#" + MasterObj + "txtValidDate").val("");
    var XMLStr = "<Tb>"
    XMLStr += "<ID>" + $get(MasterObj + "txtID").value + "</ID>"
    XMLStr += "<FName>" + $get(MasterObj + "txtName").value + "</FName>"
    XMLStr += "<LName>" + $get(MasterObj + "txtFamil").value + "</LName>"
    XMLStr += "<Relation>" + $get(MasterObj + "CmbRelation").value + "</Relation>"
    XMLStr += "<BirthDate>" + $("#" + MasterObj + "txtBirthDate").val() + "</BirthDate>"
    XMLStr += "<ValidDate>" + $("#" + MasterObj + "txtValidDate").val() + "</ValidDate>"
    XMLStr += "<Active>" + Act + "</Active>"
    XMLStr += "<PersonID>" + $("#" + MasterObj + "txtPersonID").val() + "</PersonID>"
    //XMLStr += "<Sex>" + $get(MasterObj + "CmbSex").value + "</Sex>"
    XMLStr += "</Tb>"
    var str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "txtXmlsave").val(str)
    return str;
}
// =============================== چک کردن خالی نبودن آبجکت ها ==================================   
function ChkNotIsEmpty() {
    if ($get(MasterObj + "txtName").value == "") {
        alert("لطفا نام را وارد کنید")
        return false;
    }
    else  if ($get(MasterObj + "txtFamil").value == ""){
        alert("لطفا نام خانوادگی را وارد کنید")
        return false;
    }
    if ($get(MasterObj + "CmbRelation").value=="0") {
        alert("لطفا نسبت را وارد کنید")
        return false;
    } else {
        return true;
    }

}