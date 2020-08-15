var MasterObj = "ctl00_ContentPlaceHolder1_"
var LastSelectedRow = null, LastSelectedRowClass = "", SearchFlag = 0
PageLoad();
//**********************************EndOnLoad*************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
    if (LastSelectedRow != null)
        LastSelectedRow.className = LastSelectedRowClass
    if (document.getElementById(MasterObj + "txtRChart").value == "0")
        document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false
    else
        document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
    $get(MasterObj + "txtSubmit").value = ""
}
//--------------------------------------------------------------------------------------------
function OnClickRestore() {
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_Restore").style.display = "none"
}
//*************************************ThisPage***************************************
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "1"
    document.getElementById(MasterObj + "txtDepartmentID").value = "0"
    Filter()
}
//--------------------------------------------------------------------------------------------
function Filter() {
    document.getElementById(MasterObj + "txtCmbGetShowBy").value = document.getElementById(MasterObj + "cmbGetShowBy").value
    document.getElementById(MasterObj + "txtCmbGetRoleType").value = document.getElementById(MasterObj + "cmbGetRoleType").value
    SearchFlag = 1
    document.getElementById(MasterObj + "txtSubmit").value = "Search"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0"
    $get(MasterObj + "txtDepartmentID").value = "0"
    Search()
}
//--------------------------------------------------------------------------------------------
function Search() {
    SearchFlag = 1
    document.getElementById(MasterObj + "txtCmbGetShowBy").value = document.getElementById(MasterObj + "cmbGetShowBy").value
    document.getElementById(MasterObj + "txtCmbGetRoleType").value = document.getElementById(MasterObj + "cmbGetRoleType").value
    document.getElementById(MasterObj + "txtSubmit").value = "Search"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function onclickImgClose() {
    if ($get(MasterObj + "txtShowModal").value == "1") {
        if (win.parent.document.all.item("ImgRestore").style.display == "inline") {
            document.body.scroll = "no"
        }
    }
    else {
        if (window.parent.document.all.item("ImgRestore").style.display == "inline") {
            document.body.scroll = "no"
        }
    }
    document.getElementById("shadowMessage").style.display = "none"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"
}
//--------------------------------------------------------------------------------------------
function OnClickImgRestor() {
    document.body.scroll = "yes"
    document.documentElement.scrollTop = "yes"
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
}
//--------------------------------------------------------------------------------------------
document.body.attachEvent('onkeydown', onkeydownBody)
var keyCode = 0
function onkeydownBody() {
    keyCode = event.keyCode
    setTimeout("keyCode=0", 1000)
}
//--------------------------------------------------------------------------------------------
function OnclickRchart() {
    document.getElementById(MasterObj + 'txtRChart').value = "1"
    document.getElementById(MasterObj + 'txtRtotal').value = "0"
    document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
    document.getElementById(MasterObj + 'cmbGetRoleType').value = "0"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"
    document.body.scroll = "no"
}
//--------------------------------------------------------------------------------------------
function OnclickRtotal() {
    document.getElementById(MasterObj + 'txtRChart').value = "0"
    document.getElementById(MasterObj + 'txtRtotal').value = "1"
    document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false
    document.getElementById(MasterObj + 'txtDepartmentID').value = "0"
    onclickImgClose()
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
    document.body.scroll = "yes"
}
//--------------------------------------------------------------------------------------------
function PageLoad() {
    if (document.getElementById(MasterObj + "txtShowMonthlyTree").value != "1") {
        onclickImgClose()
    }
    else {
        document.getElementById("OToolBar_ImgRestor").style.display = "none"
        document.body.scroll = "yes"
    }
    if (document.getElementById(MasterObj + 'RChart').checked == true)
        document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
    else
        document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false
}
//--------------------------------------------------------------------------------------------
function OnTreeClick(evt) {
    var src = window.event != window.undefined ? window.event.srcElement : evt.target
    var nodeClick = src.tagName.toLowerCase() == "a", index, len
    if (nodeClick) {
        var nodeText = src.innerText || src.innerHTML
        var nodeValue = GetNodeValue(src)
        index = nodeValue.indexOf('#', 0)
        len = nodeValue.length
        nodeValue = nodeValue.substr(index + 1, len - index)
        $get(MasterObj + "txtDepartmentID").value = nodeValue
    }
    return false //comment this if you want postback on node click
}
//--------------------------------------------------------------------------------------------
function GetNodeValue(node) {
    var nodePath = node.href.substring(node.href.indexOf(",") + 2, node.href.length - 2)
    var nodeValues = nodePath.split("\\")
    if (nodeValues.length > 1)
        nodeValue = nodeValues[nodeValues.length - 1]
    else
        nodeValue = nodeValues[0].substr(1)
    return nodeValue
}
        