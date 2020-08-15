var LastSelectedRow = null
var LastSelectedRowClass = "";
var PageSize = 10;
var MasterObj = "ctl00_ContentPlaceHolder1_";
var OSelectedMamber = "";

document.body.style.overflowX = "hidden";
document.body.style.overflowY = "hidden";

$get(MasterObj + "KCalSDate_txtCalendar").focus();

//=========================================ToolBar=============================
function OnClickBtnSave() {
    $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    //            if (CheckDate()) {
    if ($get(MasterObj + "txtXmlMember").value == "" && $("#"+MasterObj +"txtID").val()=="0") {
        alert("لطفا ابتدا اعضا را انتخاب نماييد")

        return
    }
    else 
    if ($get(MasterObj + "SDate").value == "//" || $get(MasterObj + "EDate").value == "//" || $get(MasterObj + "txtDesc").value == "" || $get(MasterObj + "ddlKInd").value == "0" || $get(MasterObj + "txtCnt").value == "") {
        alert("لطفا اطلاعات را تکمیل نمایید")
        return;
    }
    else if ($get(MasterObj + "SDate").value > $get(MasterObj + "EDate").value) {
        alert("تاريخ خاتمه بايد بزرگتراز تاريخ شروع باشد")
        return
    }
    else {
        var oXml = new ActiveXObject("Microsoft.XMLDOM");
        oXml.async = "false";

        var Active = false;
        if (document.getElementById(MasterObj + "ddlAction").value == "12901")
            Active = true
        else
            Active = false;
        var str = "<Root><Other><SDate>" + $get(MasterObj + "SDate").value + "</SDate><EDate>" + $get(MasterObj + "EDate").value + "</EDate><Desc>" + $get(MasterObj + "txtDesc").value + "</Desc><MessageSubject>" + $get(MasterObj + "txtMessageSubject").value + "</MessageSubject><Type>" + $get(MasterObj + "ddlKInd").value + "</Type><ViewCount>" + $get(MasterObj + "txtCnt").value + "</ViewCount><Active>" + Active + "</Active><Sender>" + $get(MasterObj + "txtOnLineUser").value + "</Sender></Other>"+ $("#" + MasterObj + "txtXmlMember").val()+"</Root>";
        $("#" + MasterObj + "txtSaveXml").val(str);

        $get(MasterObj + "txtSubmit").value = "Save";
        $get(MasterObj + "BtnSubmit").click();

    }
    //            }
}
//*******************************************************************************
function OnClickBtnSelect() {

    var strOptions = ""
    var url
    var OUserFlag

    $("#" + MasterObj + "txtID").val($("#" + MasterObj + "txtID").val() == "" ? "0" : $("#" + MasterObj + "txtID").val());
    url = "GroupMemberIncluded.aspx?ID=" + $get(MasterObj + "txtID").value + "&Type=chk&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnLineUser").value;
    strOptions ="dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no";
    //-------------------------------------------------------
    if (url != "") {
        OSelectedMamber = "";
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "") {
        $("#" + MasterObj + "txtXmlMember").val(OSelectedMamber)
        $("#" + MasterObj + "txtXmlMember").val().replace("<Root>", "")
        $("#" + MasterObj + "txtXmlMember").val().replace("</Root>", "")
    }

}
//*******************************************************************************
function CheckDate() {
    $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;


    if ($get(MasterObj + "KCalSDate_txtYear").value == "" || $get(MasterObj + "KCalSDate_txtMonth").value == "" || $get(MasterObj + "KCalSDate_txtDay").value == "") {
        alert("فرمت تاریخ شروع درست نمی باشد.")
        return false;
    }
    else if ($get(MasterObj + "KCalEDate_txtYear").value == "" || $get(MasterObj + "KCalEDate_txtMonth").value == "" || $get(MasterObj + "KCalEDate_txtDay").value == "") {
        alert("فرمت تاریخ خاتمه درست نمی باشد.")
        return false;
    }
    else if ($get(MasterObj + "SDate").value > $get(MasterObj + "EDate").value) {
        alert("تاریخ شروع باید از تاریخ خاتمه کوچکتر باشد.")
        return false;
    }
    return true;
}
//*******************************************************************************       
function OnClickBtnCancel() {
    window.close();
}