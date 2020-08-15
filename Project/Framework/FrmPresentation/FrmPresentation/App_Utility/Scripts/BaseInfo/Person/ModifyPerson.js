
//*************************************Declaration*************************************
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var AccessNew = 1, AccessModify = 1;
document.getElementsByTagName("body")[0].scroll = "no";

if (document.getElementById('OToolBar_BtnNew') == null)
    AccessNew = 0;
if (document.getElementById('OToolBar_BtnEdit') == null)
    AccessModify = 0;
//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//=====================================================================================================
function BeginRequestHandler(sender, args) {
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value);
        else
            alert($get(MasterObj + "txtAlert").value);
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";
    $get(MasterObj + "txtPersonCodeSearch").value = "";
    $get(MasterObj + "txtPersonNameSearch").value = "";
}
//*************************************OnLoad*************************************
document.body.attachEvent('onkeydown', SetEnter)
document.body.attachEvent('onkeypress', SetEnter)
//*************************************ThisPage***************************************
function SetEnter() {
    if (event.srcElement.id == MasterObj + "CmbPerson_txtCode") {
        if (window.event.keyCode == 13)
            OnClickBtnSearch()
    }
    else if (event.srcElement.id == MasterObj + "txtCardNo") {
        if (window.event.keyCode == 13)
            OnClickBtnSearch()
    }
}
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//===============================================================================================
function OnClickGrdPerson(SelectedRow) {
    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    LastSelectedRowClass = SelectedRow.className
    LastSelectedRow = SelectedRow
    SelectedRow.className = "CssSelectedItemStyle"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    url = "ModifyPersonNew.aspx?PersonID=0 &PersonCode= &PersonName= &ToPersonID="
             + $get(MasterObj + "txtOnLineUser").value
             + "&SessionID=" + $get(MasterObj + "txtSessionID").value
             + "&AccessNew=" + AccessNew
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 500px;dialogWidth: 750px;center: Yes;help: no;status: no")
    if (returnValue == 1) {
        OnClickBtnFilter();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        var Strconfirm = "با حذف پرسنل مورد نظر کليه اطلاعات مرتبط نيز حذف خواهد شد" + String.fromCharCode(13) + "آيا از حذف مطمئنيد؟"
        if (confirm(Strconfirm)) {
            $get(MasterObj + "txtTmpPersonID").value = LastSelectedRow.cells(1).innerText;
            $get(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("به منظور حذف يک سطر را انتخاب کنيد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSearch() {
    if (($get(MasterObj + "chkActive").checked == true && $get(MasterObj + "chkInActive").checked == true)
                 || ($get(MasterObj + "chkActive").checked == false && $get(MasterObj + "chkInActive").checked == false))
        $get(MasterObj + "txtActive").value = "-1";
    else if ($get(MasterObj + "chkActive").checked == true)
        $get(MasterObj + "txtActive").value = "1";
    else if ($get(MasterObj + "chkInActive").checked == true)
        $get(MasterObj + "txtActive").value = "0";
    $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "CmbPerson_txtCode").value;
    $get(MasterObj + "txtCardNoSearch").value = $get(MasterObj + "txtCardNo").value
    $get(MasterObj + "txtSearchFlag").value = "1";
    $get(MasterObj + "txtSubmit").value = "Search";
    $get(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null)
        OndbClickGrdPerson();
    else
        alert("به منظور ويرايش يک سطر را انتخاب کنيد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrdPerson() {
    if (document.getElementById('OToolBar_BtnEdit') == null)
        return;
    else {
        url = "ModifyPersonNew.aspx?PersonID=" + LastSelectedRow.getAttribute("PersonID")
               + "&PersonCode=" + LastSelectedRow.cells(1).innerText
               + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value
               + "&PersonName=" + LastSelectedRow.cells(1).innerText
               + "&Semat=" + ($get(MasterObj + "rdbSemat").checked == true ? "1" : "0")
               + "&AccessNew=" + AccessNew
      
        returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 500px;dialogWidth: 750px;center: Yes;help: no;status: no")
        if (returnValue == 1) {
            if ($get(MasterObj + "CmbPerson_txtCode").value == "") {
                $get(MasterObj + "txtSubmit").value = "Const";
                $get(MasterObj + "BtnSubmit").click();
            }
            else {
                $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "CmbPerson_txtCode").value;
                $get(MasterObj + "txtSubmit").value = "Search";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    if (($get(MasterObj + "chkActive").checked == true && $get(MasterObj + "chkInActive").checked == true)
                 || ($get(MasterObj + "chkActive").checked == false && $get(MasterObj + "chkInActive").checked == false))
        $get(MasterObj + "txtActive").value = "-1";
    else if ($get(MasterObj + "chkActive").checked == true)
        $get(MasterObj + "txtActive").value = "1";
    else if ($get(MasterObj + "chkInActive").checked == true)
        $get(MasterObj + "txtActive").value = "0";
    $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "CmbPerson_txtCode").value;
    $get(MasterObj + "txtCardNoSearch").value = $get(MasterObj + "txtCardNo").value
    $get(MasterObj + "txtSearchFlag").value = "0";
    $get(MasterObj + "txtSubmit").value = "Search";
    $get(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $get(MasterObj + "chkInActive").checked = false;
    $get(MasterObj + "chkActive").checked = false;
    $get(MasterObj + "txtActive").value = "-1";
    $get(MasterObj + "txtPersonCodeSearch").value = "";
    $get(MasterObj + "CmbPerson_txtCode").value = "";
    $get(MasterObj + "CmbPerson_txtPCode").value = "";
    $get(MasterObj + "CmbPerson_txtName").value = "";
    $get(MasterObj + "txtCardNoSearch").value = "";
    $get(MasterObj + "txtCardNo").value = "";
    $get(MasterObj + "rdbSemat").checked = true;
    $get(MasterObj + "rdbNoSemat").checked = false;
    $get(MasterObj + "rdbSemat").disabled = false;
    $get(MasterObj + "rdbNoSemat").disabled = false;
    $get(MasterObj + "txtSearchFlag").value = "0";
    $get(MasterObj + "txtSubmit").value = "Search";
    $get(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChkActive() {
    if ($get(MasterObj + "chkInActive").checked) {
        $get(MasterObj + "rdbSemat").disabled = true;
        $get(MasterObj + "rdbNoSemat").disabled = true;
    }
    else {
        $get(MasterObj + "rdbSemat").disabled = false;
        $get(MasterObj + "rdbNoSemat").disabled = false;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnMemberFile() {
    var strUrl = "/FrmPresentation/App_Pages/DataEntry/MemberFile.aspx?MenuItemID=1306"
                          + '&PersonInfo=1';
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 300px;dialogWidth: 450px;center: Yes;help: no;status: no;scroll:no')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFileHelp() {
    window.open("../../../App_Utility/Images/BaseInfo/MiniInstalHelp.docx");
}
//**********************************EndThisPage*************************************