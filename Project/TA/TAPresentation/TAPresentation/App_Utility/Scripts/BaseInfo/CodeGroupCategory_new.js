var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//===================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
// =================================Message==========================================================
function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtSubmit").val() == "Modify") {
        if ($("#" + MasterObj + "txtValidate").val() == "0") {
            alert($("#" + MasterObj + "txtAlert").val());
        }
        else {
            window.returnValue = "1";
            window.close();
        }
    }
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
///////////////////////////////////////////OnClickGrd////////////////////////////////
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
////////////////////////////////////////////New///////////////////////////////////////////////////////
function OnClickBtnNew() {
    $("#" + MasterObj + "CmbCategoryName").val(0)
    if ($('input[name=ChkShowGroup]').is(':checked') == true) {
        $('#ChkShowGroup').removeAttr('checked')
    }
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()
}
////////////////////////////////////////////OnClickHeaderChk/////////////////////////////////////////
function OnClickHeaderChk() {
    var flag
    if ($("#" + MasterObj + "GrdGroupName").find("tr:eq(0)").find("input[type='checkbox']").attr('checked'))
        flag = true;
    else
        flag = false;

    $("#" + MasterObj + "GrdGroupName").find("tr").each(function () {

        if (flag) {
            $(this).find("td:eq(0)").find("input[type='checkbox']").attr('checked', 'checked');
        }
        else {
            $(this).find("td:eq(0)").find("input[type='checkbox']").removeAttr('checked');
        }
    });
}
//////////////////////////////////////////////////////////////////////
$(".CmbCategoryName").change(function () {
    if ($('input[name=ChkShowGroup]').is(':checked') == true) {
        $('#ChkShowGroup').removeAttr('checked')
    }
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()

});
////////////////////////////////////CheckboxChecked//////////////////////////
function CheckboxChecked() {
    if ($("#ChkShowGroup").attr('checked')) {
        var Counter = 0;
        $("#" + MasterObj + "GrdGroupName").find("tr").each(function () {
            if (!$(this).find("td").find("input[type='checkbox']").attr('checked')) {
                if (Counter != 0) {
                    $(this).css("display", "none")
                } Counter = Counter + 1;
            }
        });
    }
    else {
        $("#" + MasterObj + "GrdGroupName").find("tr").each(function () {
            if (!$(this).find("td").find("input[type='checkbox']").attr('checked')) {
                if (Counter != 0) {
                    $(this).css("display", "inline")
                } Counter = Counter + 1;
            }
        });
    }
}
/////////////////////////////////////////////////////////////////////
$("#ChkShowGroup").click(function () {
    CheckboxChecked()
});
//=================================save===================================
function OnClickBtnSave() {
    MakeXmlSave()
    if (ChkNotIsEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Modify");
        $("#" + MasterObj + "BtnSubmit").click();
    }

}
//--------------------------------MakeXmlSave------------------------------
function MakeXmlSave() {
    var Counter = 0;
    var ischeck = 1;
    var str = "";
    var XMLStr = "";
    $("#" + MasterObj + "GrdGroupName").find("tr").each(function () {
        if (Counter != 0) {
            if ($(this).find("input[type='checkbox']").attr('checked')) {

                XMLStr += "<Tb>"
                XMLStr += "<CodeGroupID>" + $(this).attr("CodeGroupID") + "</CodeGroupID>"
                XMLStr += "<selected>1</selected>"
                XMLStr += "<CategoryID>" + $("#" + MasterObj + "CmbCategoryName").val() + "</CategoryID>"
                XMLStr += "</Tb>"
            }
            else {

                XMLStr += "<Tb>"
                XMLStr += "<CodeGroupID>" + $(this).attr("CodeGroupID") + "</CodeGroupID>"
                XMLStr += "<selected>0</selected>"
                XMLStr += "<CategoryID>" + $("#" + MasterObj + "CmbCategoryName").val() + "</CategoryID>"
                XMLStr += "</Tb>"
            }
        }
        Counter = Counter + 1;
    });
    str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "txtXml").val(str)
    return str;
}
//-------------------------------چک کردن خالی نبودن آبجکت ها-------------------------------------------- 
function ChkNotIsEmpty() {
    if ($("#" + MasterObj + "CmbCategoryName").val() == 0) {
        alert("لطفا نام دسته بندی را وارد کنید ");
        return false;
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    MakeXmlSave();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!