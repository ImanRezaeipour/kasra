document.body.scroll = "no";
$.noConflict();

$("#" + MasterObj + "cmbDepartment_txtOnChangeFunc").val("OnChangecmbDepartment()");
//----------------------------------------
function OnKeyDownInt() {
    var key = window.event.keyCode
    window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40))
		)
}
//------------------------------------------
function OnClickChkShowNumber(obj) {
    if ($(obj).attr("checked")) {
       // $("#" + MasterObj + "txtNumber").attr("disabled", false)
        $("#" + MasterObj + "txtFactorOne").attr("disabled", false)
        $("#" + MasterObj + "txtFactortwo").attr("disabled", false)
    }
    else {
      //  $("#" + MasterObj + "txtNumber").attr("disabled", true)
        $("#" + MasterObj + "txtFactorOne").attr("disabled", true)
        $("#" + MasterObj + "txtFactortwo").attr("disabled", true)
    }
}
//------------------------------------------
function OnClickBtnSave() {
    if (NotEmpty()) {
        CreateXml();
        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "DepartmentMonitoringOption.aspx/SaveOption?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{SaveXml:'" + $("#" + MasterObj + "txtSave").val() + "' , CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
            success: function (Data) {
                CloseModelPopup();
                var xmlSave;
                if (window.ActiveXObject) {
                    xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                    xmlSave.async = 'false';
                    xmlSave.loadXML(Data.d);
                } else {
                    var parser = new DOMParser();
                    xmlSave = parser.parseFromString(Data.d, 'text/xml');
                }
                $("#" + MasterObj + "txtGroupID").val($(xmlSave).find("NewDataSet").find("ShowMessage").find("ID").text());

                if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "1") {
                    SetMsg($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())
                    $("#" + MasterObj + "txtSave").val("<Root></Root>")
                }
                else
                    alert($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text());

            },
            error: function (jqXHR, textStatus, errorThrown) {
                CloseModelPopup();
                alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
            }
        });
    }
}
//----------------------------------------
function NotEmpty() {
    if ($("#" + MasterObj + "txtDepartmentID").val() == "") {
        alert("لطفا واحد مورد نظر را وارد کنيد")
        return false;
    }
    else if ($("#" + MasterObj + "txtMeeting").val() == "" && $("#" + MasterObj + "txtTime").val() == ""
            && $("#" + MasterObj + "ChkImage").attr("checked") == false
            && $("#" + MasterObj + "ChkPersonInfo").attr("checked") == false
            && $("#" + MasterObj + "ChkAttendance").attr("checked") == false
             && $("#" + MasterObj + "ChkRole").attr("checked") == false
              && $("#" + MasterObj + "ChkShowNumber").attr("checked") == false
//              && $("#" + MasterObj + "txtNumber").val() == ""
                 && $("#" + MasterObj + "txtFactorOne").val() == ""
                    && $("#" + MasterObj + "txtFactortwo").val() == ""
       ) {
        alert("هيچ تغييری برای ذخيره وجود ندارد");
        return false;
    }
    else if ($("#" + MasterObj + "ChkShowNumber").attr("checked") && ( $("#" + MasterObj + "txtFactorOne").val() == "" || $("#" + MasterObj + "txtFactortwo").val() == "")) {
        alert("اطلاعات تعداد پرسنل را کامل وارد کنيد");
        return false;
    }
    else if (parseInt($("#" + MasterObj + "txtFactorOne").val()) > parseInt($("#" + MasterObj + "txtFactortwo").val())) {
        alert("صورت ضريب نمی تواند بزرگتر از مخرج باشد")
    }
    return true;
}
//----------------------------------------
function CreateXml() {
    $("#" + MasterObj + "txtDepartmentID").val($("#" + MasterObj + "cmbDepartment_txtPCode").val())
    var Str = "";
    Str += "<Root>"
    Str += "<Tb>"
    Str += "<DepartmentID>" + $("#" + MasterObj + "txtDepartmentID").val() + "</DepartmentID>"
    Str += "<MeetingTitle>" + $("#" + MasterObj + "txtMeeting").val() + "</MeetingTitle>";
    Str += "<Time>" + $("#" + MasterObj + "txtTime").val() + "</Time>";
    //    if ($("#" + MasterObj + "ChkImage").attr("checked") == false)
    //        Str += "<Image>0</Image>";
    //    else
    Str += "<Image>1</Image>";
    if ($("#" + MasterObj + "ChkPersonInfo").attr("checked") == false)
        Str += "<PersonInfo>0</PersonInfo>";
    else
        Str += "<PersonInfo>1</PersonInfo>";
    if ($("#" + MasterObj + "ChkAttendance").attr("checked") == false)
        Str += "<Attendance>0</Attendance>";
    else
        Str += "<Attendance>1</Attendance>";
    if ($("#" + MasterObj + "ChkRole").attr("checked") == false)
        Str += "<Role>0</Role>";
    else
        Str += "<Role>1</Role>";
    if ($("#" + MasterObj + "ChkShowNumber").attr("checked") == false)
        Str += "<ShowNumber>0</ShowNumber>";
    else
        Str += "<ShowNumber>1</ShowNumber>";
    //Str += "<PersonNumber>" + $("#" + MasterObj + "txtNumber").val() + "</PersonNumber>";
    Str += "<Factor>" + $("#" + MasterObj + "txtFactorOne").val() + "/" + $("#" + MasterObj + "txtFactortwo").val() + "</Factor>";

    Str += "</Tb>"
    Str += "</Root>"

    $("#" + MasterObj + "txtSave").val(Str);
}
//---------------------------------
function OnChangecmbDepartment() {
    $("#" + MasterObj + "txtDepartmentID").val($("#" + MasterObj + "cmbDepartment_txtPCode").val())
    OnClickFilter();
}
//----------------------------------
function OnClickFilter() {
    if ($("#" + MasterObj + "txtDepartmentID").val() != "" && $("#" + MasterObj + "txtDepartmentID").val() != undefined) {
        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "DepartmentMonitoringOption.aspx/BindPage?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",

            data: "{DepartmentID:'" + $("#" + MasterObj + "txtDepartmentID").val() + "',CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
            success: function (Data) {
                LoadPage(Data.d)
                CloseModelPopup();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                CloseModelPopup();
            }
        });
    }
    else alert("لطفا کد واحد سازمانی را به درستی وارد کنيد")
}
//------------------------------------
function LoadPage(Data) {
    if (Data != "{\"DepartmentMonitoringOptionDesc\" : ]}") {
        var myObjectjson = eval('(' + Data + ')');
        $(myObjectjson.DepartmentMonitoringOptionDesc).each(function () {
            $("#" + MasterObj + "txtMeeting").val(this.MeetingName)
            $("#" + MasterObj + "txtTime").val(this.Time)
            if (this.AttendancePreson == 1)
                $("#" + MasterObj + "ChkAttendance").attr("checked", true)
            if (this.PersonInfo == 1)
                $("#" + MasterObj + "ChkPersonInfo").attr("checked", true);
            if (this.Role == 1)
                $("#" + MasterObj + "ChkRole").attr("checked", true);
            if (this.ShowPersonNumber == 1) {
                $("#" + MasterObj + "ChkShowNumber").attr("checked", true);
                $("#" + MasterObj + "txtFactorOne").val(this.Factor.split("/")[0])
                $("#" + MasterObj + "txtFactortwo").val(this.Factor.split("/")[1])
                //  $("#" + MasterObj + "txtNumber").attr("disabled", true)
                $("#" + MasterObj + "txtFactorOne").attr("disabled", false)
                $("#" + MasterObj + "txtFactortwo").attr("disabled", false)
            }
        });
    }
}