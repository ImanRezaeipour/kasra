var MasterObj = "ctl00_ContentPlaceHolder1_"
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
    if (document.getElementById(MasterObj + "txtSubmit").value != "Calc")
        document.getElementById("ctl00_ProgressState").value = 1
    var elem = args.get_postBackElement()
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
    document.dir = "RTL"
    var StrVal = $get(MasterObj + "txtSubmit").value

    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    LastSelectedRow = null
    if (StrVal == "Delete") {
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value)
        else
            alert($get(MasterObj + "txtAlert").value)
    }
    $get(MasterObj + "txtAlert").value = ""
    $get(MasterObj + "txtSubmit").value = ""
}


document.dir = "RTL"
var LastSelectedRow = null, LastSelectedRowClass = ""

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//*************************************EndToolbar*************************************\
function OnChangeCmbTemplate(obj) {
    if (obj.value != "" && obj.value != "0") {
        document.getElementById(MasterObj + 'txtSubmit').value = "FilterCombo"
        document.getElementById(MasterObj + 'BtnSubmitTemplate').click()
    }
}
function OnClickBtnFilter() {
    document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
    document.getElementById(MasterObj + 'BtnSubmit').click()
}
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + 'cmbReport').value = 0
    document.getElementById(MasterObj + 'cmbTemplate').value = 0
    document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
    document.getElementById(MasterObj + 'BtnSubmit').click()
}
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    LastSelectedRowClass = SelectedRow.className
    LastSelectedRow = SelectedRow
    SelectedRow.className = "CssSelectedItemStyle"
}
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
            document.getElementById(MasterObj + 'txtPolicyID').value = LastSelectedRow.getAttribute("PolicyID")
            document.getElementById(MasterObj + 'txtSubmit').value = "Delete"
            document.getElementById(MasterObj + 'BtnSubmit').click()
        }
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
function OnDblClickGrd(obj) {
    OnClickBtnEdit()
}
function OnClickBtnNew() {
    var strUrl = "ReportPolicyNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&CompanyID=" + $get(MasterObj + "txtCompanyID").value
                                + "&ReportID=" + $get(MasterObj + "cmbReport").value
//    alert(strUrl)
    var retValue = window.showModalDialog( encodeURI(strUrl), '', 'dialogHeight: 770px;dialogWidth:850px;center: Yes;help: no;status: no')
    
    if (retValue == 1)
        OnClickBtnFilter()
}
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        var strUrl = "ReportPolicyNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&CompanyID=" + $get(MasterObj + "txtCompanyID").value
                                + "&PolicyID=" + LastSelectedRow.getAttribute("PolicyID")

        var retValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 770px;dialogWidth:850px;center: Yes;help: no;status: no')
        if (retValue == 1)
            OnClickBtnFilter()
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}