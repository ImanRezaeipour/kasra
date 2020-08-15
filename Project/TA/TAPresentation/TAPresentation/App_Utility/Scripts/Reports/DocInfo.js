
WidthScreen = window.screen.width;
document.body.style.overflow = "auto";
//document.body.style.overflowY = "hidden";
window.document.dir = "RTL";

//$get("GridViewCountainer").style.width = WidthScreen - 20;
//TBLBase.style.width = WidthScreen - 100;
$get("OToolBar_TDTopToolBar").style.display = "none"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
//GetAccessBtn();
onclickTab(1)
if ($get(MasterObj + "GrdImport") == null) {
    onclickTab(1);
    $get("TblTabs").style.display = "none";
}
else $get("TblTabs").style.display = "inline";
//====================================
//********برای حالت باز شدن صفحه نمایش مجوزها از صفحه روزانه*********
if ($get(MasterObj + "txtModeRD").value == "1") {
    $get(MasterObj + "rdDate").checked = true;
    OnClickRdDate()
}
else
    OnClickRdWpID()  
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//--------------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
}
//--------------------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    //$get("GridViewCountainer").style.width = WidthScreen - 20;
    //----------------------------------------------------------------------------------------
    if ($get(MasterObj + "txtSubmit").value != "") {
        if ($get(MasterObj + "txtAlert").value != "") {
            if ($get(MasterObj + "txtValidate").value == "1")
                SetMsg($get(MasterObj + "txtAlert").value);
            else
                alert($get(MasterObj + "txtAlert").value);
        }
        if ($get(MasterObj + "txtSubmit").value == "Filter") {           
            if ($get(MasterObj + "GrdImport") == null) {
                onclickTab(1);
                $get("TblTabs").style.display = "none";
            }
            else $get("TblTabs").style.display = "inline";           
        }
        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtModeRD").value = "";
        LastSelectedRow = null;
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
  
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
    if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value && $get(MasterObj + "rdDate").checked ==true)
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
    else if ($get(MasterObj + "CmbWorkPeriod").value > $get(MasterObj + "CmbWorkPeriodTo").value && $get(MasterObj + "rdWPID").checked == true)
            alert(" دوره شروع بزرگتر از پايان دوره است");
    else {
        //----------------------------------------------------------------------------------
        $get(MasterObj + "txtDocMemberCode").value = $get(MasterObj + "CmbPerson_txtCode").value
        $get(MasterObj + "txtAccepter").value = $get(MasterObj + "CmbAccepter_txtCode").value
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $get(MasterObj + "CmbPerson_txtCode").value = "";
    $get(MasterObj + "CmbPerson_txtPCode").value = "";
    $get(MasterObj + "CmbPerson_txtName").value = "";
    $get(MasterObj + "CmbAccepter_txtCode").value = "";
    $get(MasterObj + "CmbAccepter_txtPCode").value = "";
    $get(MasterObj + "CmbAccepter_txtName").value = "";
    $get(MasterObj + "txtDocMemberCode").value = "";
    $get(MasterObj + "txtAccepter").value = "";
    $get(MasterObj + "CmbDocStatus").value = "0";
    $get(MasterObj + "CmbDocType").value = "0";
    $get(MasterObj + "CmbWorkPeriod").value = $get(MasterObj + "txtCurrWorkPeriod").value;
    $get(MasterObj + "CmbWorkPeriodTo").value = $get(MasterObj + "txtCurrWorkPeriod").value;
    if ($get(MasterObj + "CmbWorkPeriod").value == "")
        $get(MasterObj + "CmbWorkPeriod").selectedIndex = "0";
    if ($get(MasterObj + "CmbWorkPeriodTo").value == "")
        $get(MasterObj + "CmbWorkPeriodTo").selectedIndex = "0";
//    OnChangeCmbWorkPeiod();
    OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        var Msg = "آیا برای حذف مطمئنید؟"
        if ($get(MasterObj + "txtDescDeleteOption").value == "1") {
            $("#PromptMessage").css("display", "inline");
        }
        else {
            if (confirm(Msg)) {
                $get(MasterObj + "txtDocID").value = LastSelectedRow.getAttribute('DocID');
                $get(MasterObj + "txtDocTypeID").value = LastSelectedRow.getAttribute('DocTypeID');
                $get(MasterObj + "txtSubmit").value = "Delete";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
    }
    else
        alert("به منظور حذف يک سطر را انتخاب نماييد");
}
function onclickOkPrompt() {
    if ($get(MasterObj + "txtShouldDescDelete").value == "1") {
        if ($("#txtComment").val() == '') {
            alert('لطفا شرح حذف را وارد کنید');
        }
        else {
                $get(MasterObj + "txtDescDelete").value = $("#txtComment").val();
                $get(MasterObj + "txtDocID").value = LastSelectedRow.getAttribute('DocID');
                $get(MasterObj + "txtDocTypeID").value = LastSelectedRow.getAttribute('DocTypeID');
                $get(MasterObj + "txtSubmit").value = "Delete";
                $get(MasterObj + "BtnSubmit").click();
                
                $("#PromptMessage").css("display", "none");
                $("#txtComment").val('');
        }
    }
    else {
            $get(MasterObj + "txtDescDelete").value = $("#txtComment").val();
            $get(MasterObj + "txtDocID").value = LastSelectedRow.getAttribute('DocID');
            $get(MasterObj + "txtDocTypeID").value = LastSelectedRow.getAttribute('DocTypeID');
            $get(MasterObj + "txtSubmit").value = "Delete";
            $get(MasterObj + "BtnSubmit").click();
        
            $("#PromptMessage").css("display", "none");
            $("#txtComment").val('');
    }
}
function onclickCancelPrompt() {
    $("#PromptMessage").css("display", "none");
}
//==============================================================================================================
function OnClickImgFlow(obj) {
    if ($get(MasterObj + "GrdDocInfo") != null || $get(MasterObj + "GrdImport") != null) {
        var oRow = window.event.srcElement.parentElement
        while (oRow.tagName != "TR")
            oRow = oRow.parentElement

        var DocID = oRow.getAttribute('DocID')
        var DocTypeID = oRow.getAttribute('DocTypeID')
        var ActorPID = oRow.getAttribute('ActorPID')
        var WFDocId = oRow.getAttribute('WFDocId')
    }
    window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}
//==============================================================================================================
function OnChangeCmbWorkPeiod() {
    var WPID = $get(MasterObj + "CmbWorkPeriod").value;
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlWorkPeriod").value)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo [Val=" + WPID + "]");
    if (xmlNodes.length != 0) {
        var SDate = "13" + xmlNodes.item(0).selectSingleNode('SDate').text;
        var EDate = "13" + xmlNodes.item(0).selectSingleNode('EDate').text;

        $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

        $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

    }
}
//==============================================================================================================
function onclickTab(Number) {
    $get(MasterObj + "txtTabNumber").value = Number;
    switch (Number) {
        case 1:
            $get("TblExport").style.display = "inline";
            $get("TabExport").style.backgroundColor = "";
            $get("TabImport").style.backgroundColor = "#E3EFFF";
            $get("TblImport").style.display = "none";           
            break;
        case 2:
            $get("TblExport").style.display = "none";
            $get("TblImport").style.display = "inline";
            $get("TabImport").style.backgroundColor = "";
            $get("TabExport").style.backgroundColor = "#E3EFFF";           
            break;
    }
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
        LastSelectedRow = null;
    }
}
//=================================
function OnClickBtnExcel() {
    $get(MasterObj + "txtPName").value = $get(MasterObj + "CmbPerson_txtName").value;
    $get(MasterObj + "txtSubmit").value="SendToExcel"
    $get(MasterObj + "BtnSubmitSend").click()
}
//=================================
function OnClickBtnPDF() {
    $get(MasterObj + "txtPName").value = $get(MasterObj + "CmbPerson_txtName").value;
    $get(MasterObj + "txtSubmit").value = "SendToPDF"
    $get(MasterObj + "BtnSubmitSend").click()
}
//================================
function OnClickRdWpID() {
    $get(MasterObj + "rdDate").checked = false;
    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("disabled", true)
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("disabled", true)
    $("#" + MasterObj + "CmbWorkPeriod").attr("disabled", false)
    $("#" + MasterObj + "CmbWorkPeriodTo").attr("disabled", false)
    $("#" + MasterObj + "txtRD").val("1");
}
//================================
function OnClickRdDate() {
    $get(MasterObj + "rdWPID").checked = false;
    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("disabled", false)
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("disabled", false)
    $("#" + MasterObj + "CmbWorkPeriod").attr("disabled", true)
    $("#" + MasterObj + "CmbWorkPeriodTo").attr("disabled", true)
    $("#" + MasterObj + "txtRD").val("2");
}