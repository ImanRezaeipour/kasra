var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = "";
var LastSelectedRowClass = "";
document.body.scroll = "no";


//=====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
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
                window.close();
            }
        }
    }

    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");

    LastSelectedRow = "";
    LastSelectedRowClass = "";
}

//for merge
// ===============================Save===================================   
function OnClickBtnSave() {
    if ($("#" + MasterObj + "txtTitle").val()==""){
        alert("لطفا عنوان را وارد کنید");
        $("#" + MasterObj + "txtTitle").focus();
              return;
              }
    if ($("#" + MasterObj + "txtDoer").val()==""){
        alert("لطفا مجری را وارد کنید ");
        $("#" + MasterObj + "txtDoer").focus();
              return;
          }
          if ($("#" + MasterObj + "CmbSubSystem").val()== "0") {
              alert("لطفا زیرسیستم را وارد کنید");
              $("#" + MasterObj + "CmbSubSystem").focus();
              return;
          }
          if ($("#" + MasterObj + "CmbGroup").val() == "0") {
              alert("لطفا دسته بندی را وارد کنید");
              $("#" + MasterObj + "CmbGroup").focus();
              return;
          }
          if ($("#" + MasterObj + "TxtRequest").val() == "") {
              alert("لطفا شرح درخواست را وارد کنید");
              $("#" + MasterObj + "TxtRequest").focus();
              return;
          }
          if ($("#" + MasterObj + "TxtSolution").val() == "") {
              alert("لطفا شرح راه حل را وارد کنید");
              $("#" + MasterObj + "TxtSolution").focus();
              return;
          }            
    $("#" + MasterObj + "txtSubmit").val("Modify");
      $("#" + MasterObj + "BtnSubmit").click();
  }
