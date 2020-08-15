var LastSelectedRow = null, LastSelectedRowClass = ""
$get("OToolBar_BtnExecCardexRule").style.display = "none"
//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//=====================================================================================================
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
    var StrVal = $get(MasterObj + "txtSubmit").value
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
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    LastSelectedRowClass = SelectedRow.className
    LastSelectedRow = SelectedRow
    SelectedRow.className = "CssSelectedItemStyle"
}
//===============================================================================================
function OnClickBtnFilter() {
    $get(MasterObj + "txtPCode").value = $get(MasterObj + "CmbPerson_txtCode").value;
    $get(MasterObj + "txtCardexPeriod").value = $get(MasterObj + "CmbCardexPeriod").value;
    $get(MasterObj + "txtCardexCode").value = $get(MasterObj + "CmbCardexCode").value;
    $get(MasterObj + "txtFromPeriod").value = $get(MasterObj + "CmbFromPeriod").value;
    $get(MasterObj + "txtToPeriod").value = $get(MasterObj + "CmbToPeriod").value;
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();

}
//===============================================================================================
function OnClickBtnShowAll() {
    $get(MasterObj + "txtPCode").value = "";
    $get(MasterObj + "CmbPerson_txtCode").value = "";
    $get(MasterObj + "CmbPerson_txtPCode").value = "";
    $get(MasterObj + "CmbPerson_txtName").value = "";
    $get(MasterObj + "txtCardexPeriod").value = "";
    $get(MasterObj + "CmbCardexPeriod").value = "0";
    $get(MasterObj + "CmbFromPeriod").selectedIndex = "0";
    $get(MasterObj + "txtFromPeriod").value = $get(MasterObj + "CmbFromPeriod").selectedIndex
    $get(MasterObj + "CmbToPeriod").selectedIndex = "0";
    $get(MasterObj + "txtToPeriod").value = $get(MasterObj + "CmbToPeriod").selectedIndex
    $get(MasterObj + "CmbCardexCode").selectedIndex = "0";
    $get(MasterObj + "txtCardexCode").value = "";
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
} 
//===============================================================================================
function OnClickBtnNew() {
    var strUrl = "RequestCardex.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 300px;dialogWidth:700px;center: Yes;help: no;status: no')
    if (retValue == 1)
        OnClickBtnFilter()
}
//===============================================================================================
function OnDblClickGrd() {
    OnClickBtnEdit()
}
//===============================================================================================
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        var strUrl = "RequestCardex.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&PCode=" + LastSelectedRow.cells(1).innerText
                                + "&GrantCode=" + LastSelectedRow.getAttribute("GrantCode")
                                + "&GrantWP=" + LastSelectedRow.getAttribute("GrantWP")
                                + "&GrantValue=" + LastSelectedRow.cells(6).innerText
                                + "&Type=" + LastSelectedRow.getAttribute("Type")
                                + "&Descr=" + LastSelectedRow.cells(7).innerText
                                + "&ID=" + LastSelectedRow.getAttribute("ID")
                                + "&CardexPeriodID=" + LastSelectedRow.getAttribute("CardexPeriodID")
        strUrl = encodeURI(strUrl)
        var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 300px;dialogWidth:700px;center: Yes;help: no;status: no')
        if (retValue == 1)
            OnClickBtnFilter()
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
//===============================================================================================
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        if (confirm("آيا براي حذف مطمئنيد؟")) {
            $get(MasterObj + "txtStaticCodeValueID").value = LastSelectedRow.getAttribute("ID");
            $get(MasterObj + "txtPCodeDel").value = LastSelectedRow.cells(1).innerText;
            $get(MasterObj + "txtPeriod").value = LastSelectedRow.getAttribute("GrantWP");
            $get(MasterObj + "txtSubmit").value = "Delete";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
//===============================================================================================
function OnClickBtnExecCardexRule() {
    var strUrl = "ExecCardexRule.aspx?OnlineUserID=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth:600px;center: Yes;help: no;status: no')
}
//===============================================================================================
function OnClickImgFlow(obj) {
    var oRow = window.event.srcElement.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement

    var CreditID = oRow.getAttribute('ID')
    var WFDocId = oRow.getAttribute('WFDocId')
    var DocTypeID = oRow.getAttribute('DocTypeID')

    if (DocTypeID == 0 && WFDocId != 0)
        window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no");
    else
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}