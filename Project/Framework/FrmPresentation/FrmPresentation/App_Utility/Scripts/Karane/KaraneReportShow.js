//*************************************Declaration*************************************
document.body.scroll = 'NO';
document.dir = "rtl";
var MasterObj = "ctl00_ContentPlaceHolder1_";
//************************************************************************************

//**************************************EndDeclaration*********************************       
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {

}
//====================================================================================
function EndRequestHandler(sender, args) {
    var OGrd = $("#" + MasterObj + "GrdKaraneReport");
    var len = OGrd.find("tr").length;
    OGrd.find("tr:eq(" + (len - 1) + ")").find("td:eq(0)").text("");
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtMultiPerson").val("")
    $("#" + MasterObj + "txtMultiDepartment").val("")
    $("#" + MasterObj + "txtMultiGroup").val("")
    $("#" + MasterObj + "txtAlert").val("");
    $("#" + MasterObj + "TxtXmlHeaderEquipment").val("")
}

//===========================================================================================================
function SetFilterValue() {
    if ($("#" + MasterObj + "CmbKaraneRptName").val() == '' || $("#" + MasterObj + "CmbKaraneRptName").val() == '0') {
        alert('لطفا ایتم کارانه را انتخاب کنید');
        return false;
    }
        if ($("#" + MasterObj + "MultiDep_txtHidden").val() != "") {
            var Departments = "<Root>" + $("#" + MasterObj + "MultiDep_txtHidden").val() + "</Root>", DeptString = '';
            if (window.ActiveXObject) {
                xml = new ActiveXObject("Microsoft.XMLDOM");
                xml.async = "false";
                xml.loadXML(Departments);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Departments, 'text/xml');
            }
            $(xml)
                .find("Root").find("Tb").each(function () {
                    DeptString = DeptString + "," + $(this).find('DepartmentID').text();
                });
            DeptString = DeptString.substring(1, DeptString.length)
            $("#" + MasterObj + "txtMultiDepartment").val(DeptString);
        } else
            $("#" + MasterObj + "txtMultiDepartment").val($("#" + MasterObj + "MultiDep_cmbDepartment").val());
        //---------------------------------------------------------------------------------------------
        if ($("#" + MasterObj + "MultiPerson_txtHidden").val() != "") {
            var Persons = $("#" + MasterObj + "MultiPerson_txtHidden").val(), PersonString = '';
            if (window.ActiveXObject) {
                xml = new ActiveXObject("Microsoft.XMLDOM");
                xml.async = "false";
                xml.loadXML(Persons)
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Persons, 'text/xml');
            }
            $(xml)
                .find("Root").find("Tb").each(function () {
                    PersonString = PersonString + "," + $(this).find('PCode').text();
                });
            PersonString = PersonString.substring(1, PersonString.length);
            $("#" + MasterObj + "txtMultiPerson").val(PersonString);
        } else
            $("#" + MasterObj + "txtMultiPerson").val($("#" + MasterObj + "MultiPerson_cmbPerson").val());
        //---------------------------------------------------------------------------------------------
        return true;
    }
//===========================================================================================================
    function OnClickBtnFilter() {
        //Baraye dastresi
    if ($get(MasterObj + "chkPersChildren").checked == true)
        $("#" + MasterObj + "txtChkChildren").val("1");
    else
           $("#" + MasterObj + "txtChkChildren").val("0");
    if (SetFilterValue()) {
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//================================================================
function OnClickBtnExcel() {
    if ($get(MasterObj + "chkPersChildren").checked == true)
        $("#" + MasterObj + "txtChkChildren").val("1");
    else
        $("#" + MasterObj + "txtChkChildren").val("0");
    if (SetFilterValue()) {
        $("#" + MasterObj + "txtSubmit").val("Excel");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }
}
//============================================================================
function OnClickBtnPDF() {
    if ($get(MasterObj + "chkPersChildren").checked == true)
        $("#" + MasterObj + "txtChkChildren").val("1");
    else
        $("#" + MasterObj + "txtChkChildren").val("0");
    if (SetFilterValue()) {
        $("#" + MasterObj + "txtSubmit").val("PDF");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }
}
//========================================================================
function OnClickBtnShowAll() {
    $("#" + MasterObj + "MultiDep_cmbDepartment").val('');
    $("#" + MasterObj + "MultiPerson_cmbPerson").val('');
    $("#" + MasterObj + "CmbWorkPeriod").val('0');
    $("#" + MasterObj + "CmbKaraneStatus").val('0');
    
    $get( MasterObj + "txtMultiPerson").value="";
    $get(MasterObj + "txtMultiDepartment").value = "";
    
    $get(MasterObj + "chkPersChildren").checked = false;
    $("#" + MasterObj + "txtChkChildren").val('0');
    if ($("#" + MasterObj + "CmbKaraneRptName").val() == '' || $("#" + MasterObj + "CmbKaraneRptName").val() == '0') {
        alert('لطفا ایتم کارانه را انتخاب کنید');
    }
    else{
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
    }

}


