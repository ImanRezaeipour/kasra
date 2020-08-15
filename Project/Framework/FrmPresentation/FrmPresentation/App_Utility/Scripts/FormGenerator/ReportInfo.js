﻿var MasterObj = "ctl00_ContentPlaceHolder1_"
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
//*********************************Toolbar**********************************************
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
function OnClickBtnAllPDF() {
    document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOnePDF() {
    document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnAllExcel() {
    document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOneExcel() {
    document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//*************************************EndToolbar*************************************\
function OnChangeCmbTemplate(obj) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtMenu").value)
    var xmlNodes
    if (obj.value != "" && obj.value != 0)
        xmlNodes = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMenu[TemplateID=" + obj.value + "]")
    else
        xmlNodes = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMenu[TemplateID!=0]")
    $get(MasterObj + "cmbReport").innerHTML = ""
    var optionEl = document.createElement("OPTION")
    $get(MasterObj + "cmbReport").options.add(optionEl)
    $get(MasterObj + "cmbReport").all(0).innerText = 'انتخاب نشده'
    $get(MasterObj + "cmbReport").all(0).value = '0'
    var len = xmlNodes.length
    for (var i = 0; i < len; i++) {
        optionEl = document.createElement("OPTION")
        $get(MasterObj + "cmbReport").options.add(optionEl)
        $get(MasterObj + "cmbReport").all(i + 1).innerText = xmlNodes.item(i).selectSingleNode('Title').text
        $get(MasterObj + "cmbReport").all(i + 1).value = xmlNodes.item(i).selectSingleNode('Val').text
    }
}
function OnClickBtnFilter() {
    document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
    document.getElementById(MasterObj + 'BtnSubmit').click()
}
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + 'cmbReport').value = 0
    document.getElementById(MasterObj + 'cmbTemplate').value = 0
    document.getElementById(MasterObj + 'txtTmpName').value = ""
    document.getElementById(MasterObj + 'txtRepName').value = ""
    document.getElementById(MasterObj + 'cmbSubSystem').value = 0
    document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
    document.getElementById(MasterObj + 'BtnSubmit').click()
}
function OnDblClickGrd(obj) {
    OnClickBtnEdit()
}
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    LastSelectedRowClass = SelectedRow.className
    LastSelectedRow = SelectedRow
    SelectedRow.className = "CssSelectedItemStyle"
}
function OnClickBtnDelete() {
    if (LastSelectedRow != null) {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
            document.getElementById(MasterObj + 'txtReportID').value = LastSelectedRow.getAttribute("ReportID")
            document.getElementById(MasterObj + 'txtSubmit').value = "Delete"
            document.getElementById(MasterObj + 'BtnSubmit').click()
        }
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
function OnClickBtnNew() {
    var strUrl = "ReportDefinition.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 770px;dialogWidth:1000px;center: Yes;help: no;status: no')
    if (retValue == 1)
        OnClickBtnFilter()
}
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        var strUrl = "ReportDefinition.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&ReportID=" + LastSelectedRow.getAttribute("ReportID")
                                + "&TemplateID=" + LastSelectedRow.getAttribute("TemplateID")
        strUrl = encodeURI(strUrl)
        retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 770px;dialogWidth:1000px;center: Yes;help: no;status: no')
        if (retValue == 1)
            OnClickBtnFilter()
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}