var MasterObj = "ctl00_ContentPlaceHolder1_";
document.body.scroll = "no";
var LastSelectedRow = "";
var LastSelectedRowClass = "";
var AllHtml = "";
var str = "";
//<script src="../../App_Utility/Scripts/jquery.xmlDom.js" type="text/javascript"></script>
//=====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//====================================================================================================

function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtAlert").val() != "" || $("#" + MasterObj + "txtAlertTable").val() != "") {
        window.returnValue = "1";
        if ($("#" + MasterObj + "txtSubmit").val() == "Modify") {
            if ($("#" + MasterObj + "txtValidate").val() != "1")
                alert($("#" + MasterObj + "txtAlert").val());
            else {
                SetMsg($("#" + MasterObj + "txtAlert").val());
                window.close();
            }
        }
    }
    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")
    //============================================
    var GrdTableXml = $.xmlDOM($("#" + MasterObj + "TxtXmlTable").val());
    $("#" + MasterObj + "GrdTable")
         .find("tr")
         .each(function () {
             var obj = $(this);
             $(GrdTableXml)
              .find("ID")
             .each(function () {
                 if ($(obj).attr("GroupID") == $(this).text() && $(this).parent(1).find("Access").text() == '1') {
                     $(obj).find("td").find('input:checkbox').attr("checked", "checked");
                 }
             });
         });
    //=====================================================
    var GrdTableOfficeAccessXml = $.xmlDOM($("#" + MasterObj + "TxtXml").val());
    $("#" + MasterObj + "GrdTableOfficeAccess")
         .find("tr")
         .each(function () {
             var obj2 = $(this);
             $(GrdTableOfficeAccessXml)
              .find("ID")
             .each(function () {
                 if ($(obj2).attr("RoleId") == $(this).text() && $(this).parent(1).find("Dastrasi").text() == '1') {
                     $(obj2).find("td").find('input:checkbox').attr("checked", "checked");
                 }
             });
         });
    //-----------------------------------------------
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
// ===============================Save==================================   
function OnClickBtnSave() {
    MakeXmlSave();
    MakeXmlSaveTable()
    $("#" + MasterObj + "txtSubmit").val("Modify")
    $("#" + MasterObj + "BtnSubmit").click()
}
//======================================متابعت چکباکس ها از چکباکس هدر=========

function OnClickHeaderChk(header) {
    //        $("#" + MasterObj + "GrdTableOfficeAccess").find("TBODY").find("tr").find("input:checkbox").each(function () {
    //            if (!$(this).hasClass("header")) {
    //                $(this).attr("checked", $(header).attr("checked"));
    //                SetColorFul($(this))
    //            }
    //        });
    $(header).parent(1).parent(1).parent(1).find("input:checkbox").each(function () {
        if (!$(this).hasClass("header")) {
            $(this).attr("checked", $(header).attr("checked"));
            SetColorFul($(this))
        }
    });
}

//============================MakeXmlSave==================================
function MakeXmlSave() {
    var XMLStr = ""
    //var XMLStr2 = ""
    var counter = '1'
    $("#" + MasterObj + "GrdTableOfficeAccess")
     .find("TBODY")
     .find('tr')
     .each(function () {
         if (counter != '1') {
             if ($(this).find('input:checkbox').attr("checked")) {
                 XMLStr += "<Tb>"
                 XMLStr += "<ID>" + $(this).attr("RoleId") + "</ID>"
                 XMLStr += "<Dastrasi>1</Dastrasi>"
                 XMLStr += "</Tb>"
             }
             else {
                 XMLStr += "<Tb>"
                 XMLStr += "<ID>" + $(this).attr("RoleId") + "</ID>"
                 XMLStr += "<Dastrasi>0</Dastrasi>"
                 XMLStr += "</Tb>"
             }
         }
         counter++
     });
     var str = "<Root>" + XMLStr + "</Root>"
     $("#" + MasterObj + "TxtXml").val(str)
     return str;
}
//============================================================
function MakeXmlSaveTable() {
    var XMLStr = ""
    var counter = '1'
    $("#" + MasterObj + "GrdTable")
     .find("TBODY")
     .find('tr')
     .each(function () {
         if (counter != '1') {
             if ($(this).find('input:checkbox').attr("checked")) {
                 XMLStr += "<Tbs>"
                 XMLStr += "<ID>" + $(this).attr("GroupID") + "</ID>"
                 XMLStr += "<Access>1</Access>"
                 XMLStr += "</Tbs>"
             }
             else {
                 XMLStr += "<Tbs>"
                 XMLStr += "<ID>" + $(this).attr("GroupID") + "</ID>"
                 XMLStr += "<Access>0</Access>"
                 XMLStr += "</Tbs>"
             }
         }
         counter++
     });

    var str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "TxtXmlTable").val(str)
    return str;
}
function onchangeCheck(obj) { 
    SetColorFul(obj);
}
//------------------------------------------
function SetColorFul(CheckBox) {
    if ($(CheckBox).attr("checked") && $(CheckBox).parent(1).attr("RealVal") == "0") {
        $(CheckBox).removeClass("CssRed");
        $(CheckBox).addClass("CssGreen");

    }
    else if (!$(CheckBox).attr("checked") && $(CheckBox).parent(1).attr("RealVal") == "1") {
        $(CheckBox).removeClass("CssGreen");
        $(CheckBox).addClass("CssRed");

    }
    else {
        $(CheckBox).removeClass("CssGreen");
        $(CheckBox).removeClass("CssRed");
    }
    MakeXmlSaveTable();
    MakeXmlSave();

}