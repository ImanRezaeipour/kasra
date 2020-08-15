var RowIndex
var rowi
//window.document.dir = "rtl";
var MasterObj = "ctl00_ContentPlaceHolder1_";

function TVNew_onContextMenu(sender, eventArgs) {
    var e = eventArgs.get_event();

    DepartmentMenu.showContextMenu(e, eventArgs.get_node());

}
function onunload() {
    var str = form1.txtXmlGridData.value
    if (str != "") {
        if (confirm("تغييرات ذخيره شود ؟")) {
            OnClickBtnSave()
        }
    }
}
function DepartmentMenu_OnSelect(sender, eventArgs) {


    var menuItem = eventArgs.get_item();
    var contextDataNode = menuItem.get_parentMenu().get_contextData();

    form1.txtTreeDepartmentIDSelected.value = contextDataNode.get_value()

    if (menuItem.get_value() == "New") {
        OnClickBtnNewDepartmentFromTree(form1.txtTreeDepartmentIDSelected.value)
    }
    else if (menuItem.get_value() == "Edit") {
        OnClickBtnEditDepartmentFromTree(form1.txtTreeDepartmentIDSelected.value)
    }
    else if (menuItem.get_value() == "DelDeptNoSubNoRoleNoPerson") {
        form1.txtDeleteFlag.value = "0"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DelDeptYesSubYesRoleYesPerson") {
        form1.txtDeleteFlag.value = "1"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DelSubDeptNoRoleNoPerson") {
        form1.txtDeleteFlag.value = "2"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DelSubDeptYesRoleYesPerson") {
        form1.txtDeleteFlag.value = "3"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DelPersonDept") {
        form1.txtDeleteFlag.value = "4"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DelRolePersonDept") {
        form1.txtDeleteFlag.value = "5"
        DeleteDepartmentFromTree(contextDataNode.get_text())
    }
    else if (menuItem.get_value() == "DeptCopy") {
        form1.txtDeptCopied.value = form1.txtTreeDepartmentIDSelected.value
        form1.txtTreeAction.value = menuItem.get_value()
    }
    else if (menuItem.get_value() == "DeptCut") {
        form1.txtDeptCopied.value = form1.txtTreeDepartmentIDSelected.value
        form1.txtTreeAction.value = menuItem.get_value()
    }
    else if (menuItem.get_value() == "DeptPaste") {

        if (form1.txtTreeAction.value == "DeptCopy" || form1.txtTreeAction.value == "DeptCut")
            DepartmentPasteFromTree()
        else
            alert("درخواست نادرست مي باشد")
    }
    else if (menuItem.get_value() == "PersonCopy") {
        form1.txtDeptCopied.value = form1.txtTreeDepartmentIDSelected.value
        form1.txtTreeAction.value = menuItem.get_value()
    }
    else if (menuItem.get_value() == "PersonCut") {
        form1.txtDeptCopied.value = form1.txtTreeDepartmentIDSelected.value
        form1.txtTreeAction.value = menuItem.get_value()
    }
    else if (menuItem.get_value() == "PersonPaste") {
        if (form1.txtTreeAction.value == "PersonCopy" || form1.txtTreeAction.value == "PersonCut")
            DepartmentPasteFromTree()
        else
            alert("درخواست نادرست مي باشد")

    }
    else if (menuItem.get_value() == "DeptMergeCut") {
        form1.txtTreeAction.value = menuItem.get_value()
        DepartmentMergeCut()
    }
    else if (menuItem.get_value() == "DeptMergePaste") {
        if (form1.txtTreeAction.value == "DeptMergeCut")
            DepartmentMergePaste()
        else
            alert("درخواست نادرست مي باشد")
    }

    $get("txtDepartmentID").value = form1.txtTreeDepartmentIDSelected.value
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateNewDepartmentFromTree(DepartmentID) {
    document.getElementById("txtFlagMode").value == "1"
    document.getElementById("txtOrgName").value = ""
    //alert($get(MasterObj + "txtDepartmentID").value)
    if ($get("txtTreeDepartmentIDSelected").value == "")
        document.getElementById("SelParentName").value = 0
    else
        document.getElementById("SelParentName").value = $get("txtTreeDepartmentIDSelected").value;

    if (document.getElementById("txtNewOrgType").value == "")
        document.getElementById("SelOrgType").value = 0
    else
        document.getElementById("SelOrgType").value = document.getElementById("txtNewOrgType").value
    document.getElementById("txtDepartmnetCode").value = document.getElementById("txtNewDepartmentCode").value

    if (document.getElementById("SelParentName").value == "") {

        $get("txtPAlert").value = "NoAccess"
        SetMsg($get("txtPAlert").value)
    }
    else
        PopupCreate.style.display = "inline";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateNewDepartment() {

    document.getElementById("txtFlagMode").value == "1"
    document.getElementById("txtOrgName").value = ""

    if ($get("txtDepartmentID").value == "")
        document.getElementById("SelParentName").value = 0
    else
        document.getElementById("SelParentName").value = $get("txtDepartmentID").value;
    if (document.getElementById("txtNewOrgType").value == "")
        document.getElementById("SelOrgType").value = 0
    else
        document.getElementById("SelOrgType").value = document.getElementById("txtNewOrgType").value
    document.getElementById("txtDepartmnetCode").value = document.getElementById("txtNewDepartmentCode").value

    PopupCreate.style.display = "inline";




}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNewDepartmentFromTree(DepartmentID) {
    if ($get("txtDelFalg").value == "1")
        $get("txtDepartmentID").value = "0"


    document.getElementById("txtDepID").value = "0";
    document.getElementById("SelParentName").innerHTML = "";
    document.getElementById("txtPSubmit").value = "NewTree";
    document.getElementById("txtFlagMode").value = "1"; //Insert Mode
    document.getElementById("BtnPSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNewDepartment(DepartmentID) {

    if ($get("txtDelFalg").value == "1")
        $get("txtDepartmentID").value = "0"


    document.getElementById("txtDepID").value = "0";
    document.getElementById("SelParentName").innerHTML = "";
    document.getElementById("txtPSubmit").value = "New";
    document.getElementById("txtFlagMode").value = "1"; //Insert Mode
    document.getElementById("BtnPSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnParentName() {
    strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    url = "SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0&SessionID=" + document.getElementById("txtSessionID").value + "&CompanyPeriodID=" + document.getElementById("txtCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById("txtOnLineUser").value
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")

    if (returnValue != "" & returnValue != undefined) {

        returnValue = returnValue.substring(3, returnValue.length)

        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(returnValue);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb")
        if (oXmlNodes.length > 0) {
            document.getElementById("SelParentName").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
            $get("txtPerioritySubmit").value = "GetPeriority";
            document.getElementById("BtnPerioritySubmit").click();
        }
    }
}
function OnClickBtnPriority() {

    if (document.getElementById("SelParentName").value == "") {
        document.getElementById("SelParentName").focus();

        alert('لطفا نام واحد مافوق انتخاب شود');
        return;
    }

    strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    url = "PeriorityOrgan.aspx?DepartmentID=" + document.getElementById("txtDepID").value + "&ParentID=" + document.getElementById("SelParentName").value + "&DepartmentName=" + document.getElementById("txtOrgName").value + "&SessionID=" + document.getElementById("txtSessionID").value + "&CompanyPeriodID=" + document.getElementById("txtCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById("txtOnLineUser").value
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")

    if (returnValue != "0" & returnValue != undefined) {
        document.getElementById("TxtPeriority").value = returnValue;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPSave() {
    if (CheckNotDuplicateDepName() == true) {
        CreateXmlSave();
        if (document.getElementById("txtSaveXml").value == "")
            return

        if (document.getElementById("txtFlagMode").value == "1" && document.getElementById("SelOrgType").value == "48") {
            alert('امکان ايجاد مدير عامل از اين صفحه وجود ندارد')
            return
        }

        document.getElementById("txtPSubmit").value = "Save";
        document.getElementById("BtnPSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPSaveNew() {

    if (CheckNotDuplicateDepName() == true) {
        document.getElementById("txtDepID").value = document.getElementById("txtDepartmentID").value
        $get("txtColseFlag").value = "1";

        CreateXmlSave();
        if (document.getElementById("txtSaveXml").value == "")
            return

        if (document.getElementById("txtFlagMode").value == "1" && document.getElementById("SelOrgType").value == "48") {
            alert('امکان ايجاد مدير عامل از اين صفحه وجود ندارد')
            return
        }
        document.getElementById("txtPSubmit").value = "SaveNew";
        if (document.getElementById("txtDepID").value == "")
            document.getElementById("txtDepID").value = "0"

        document.getElementById("BtnPSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckNotDuplicateDepName() {
    if (document.getElementById("txtOrgName").value == "") {
        alert("لطفا نام واحد را وارد کنید ")
        return false
    }
    //    root = "/GeneralEntity/Lcombo[Title='" + document.getElementById("txtOrgName").value + "' and  Val!='" + document.getElementById("txtDepID").value + "' ]"
    //    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    //    if ($get("txtAllDepartmentXML").value == "")
    //        $get("txtAllDepartmentXML").value = "<GeneralEntity></GeneralEntity>"

    //    //alert($get("txtAllDepartmentXML").value)
    //    xmlDoc.loadXML($get("txtAllDepartmentXML").value);
    //    xmlDoc.setProperty("SelectionLanguage", "XPath");

    //    var xmlNodes;
    //    xmlNodes = xmlDoc.documentElement.selectNodes(root);

    //    var x = 0
    //    if (xmlNodes.length != 0) {
    //        alert("نام واحد تکراری است ")
    //        return false
    //    }
    return true
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateXmlSave() {
    var str = '';
    document.getElementById("txtSaveXml").value = ""

    if (document.getElementById("txtOrgName").value == "" || document.getElementById("txtOrgName").value == "0") {
        alert('لطفا نام واحد را وارد کنيد')
        return
    }
    if (document.getElementById("txtFlagMode").value != "2" && document.getElementById("SelOrgType").value != "48") {
        if (document.getElementById("SelParentName").value == "" || document.getElementById("SelParentName").value == "0") {
            alert('لطفا نام واحد مافوق را انتخاب کنيد')
            return
        }
    }
    if (document.getElementById("SelOrgType").value == "" || document.getElementById("SelOrgType").value == "0") {
        alert('لطفا نوع واحد را انتخاب کنيد')
        return
    }
    if (document.getElementById("txtDepartmnetCode").value == "" || document.getElementById("txtDepartmnetCode").value == "0") {
        alert('لطفا کد واحد را وارد کنيد')
        return
    }
    if (document.getElementById("txtPriorityOption").value == "1" && document.getElementById("TxtPeriority").value == "") {
        alert('لطفا اولويت را وارد کنيد')
        return
    }
    str += '<Root><Tb>'


    str += '<DepartmentID>' + document.getElementById("txtDepID").value + '</DepartmentID>'
    str += '<Name>' + document.getElementById("txtOrgName").value + '</Name>'
    str += '<ParentID>' + document.getElementById("SelParentName").value + '</ParentID>'
    str += '<Type>' + document.getElementById("SelOrgType").value + '</Type>'
    str += '<DepartmentCode>' + document.getElementById("txtDepartmnetCode").value + '</DepartmentCode>'
    str += '<Periority>' + document.getElementById("TxtPeriority").value + '</Periority>'

    str += '</Tb></Root>'
    document.getElementById("txtSaveXml").value = str


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEditDepartmentFromTree(DepartmentID) {

    if (DepartmentID == "") {
        alert('لطفا يک واحد از چارت براي ويرايش انتخاب کنيد')
        return
    }
    document.getElementById("txtDepID").value = DepartmentID
    document.getElementById("txtFlagMode").value = "2";  //Update Mode
    document.getElementById("txtPSubmit").value = "EditTree";
    document.getElementById("BtnPSubmit").click();


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEditDepartment() {

    if (document.getElementById("txtDepartmentID").value == "") {
        alert('لطفا يک واحد از چارت براي ويرايش انتخاب کنيد')
        return
    }
    document.getElementById("txtDepID").value = document.getElementById("txtDepartmentID").value
    document.getElementById("txtFlagMode").value = "2";  //Update Mode
    document.getElementById("txtPSubmit").value = "Edit";
    document.getElementById("BtnPSubmit").click();


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function EditDepartmentFromTree() {
    document.getElementById("txtFlagMode").value == "2"
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById("txtXmlDepartmnet").value);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDepartmentProperties");
    var len = oXmlNodes.length

    for (j = 0; j < len; j++) {
        document.getElementById("txtOrgName").value = oXmlNodes.item(j).selectSingleNode("Name").text
        document.getElementById("SelParentName").value = oXmlNodes.item(j).selectSingleNode("ParentID").text
        document.getElementById("SelOrgType").value = oXmlNodes.item(j).selectSingleNode("Type").text
        document.getElementById("txtDepartmnetCode").value = oXmlNodes.item(j).selectSingleNode("DepartmentCode").text
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function EditDepartment(DepartmentID) {
    document.getElementById("txtFlagMode").value == "2"
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById("txtXmlDepartmnet").value);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDepartmentProperties");
    var len = oXmlNodes.length

    for (j = 0; j < len; j++) {
        document.getElementById("txtOrgName").value = oXmlNodes.item(j).selectSingleNode("Name").text
        document.getElementById("SelParentName").value = oXmlNodes.item(j).selectSingleNode("ParentID").text
        document.getElementById("SelOrgType").value = oXmlNodes.item(j).selectSingleNode("Type").text
        document.getElementById("txtDepartmnetCode").value = oXmlNodes.item(j).selectSingleNode("DepartmentCode").text
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDelDepartment() {
    document.getElementById("txtAcCode").value = GetAccessCode(window.event.srcElement)
    var OGrid = document.getElementById("GrdPersonRole");
    var str = form1.txtXmlGridData.value

    if (str == "") {
        if ($get("txtDepartmentID").value != "") {
            if (OGrid.rows.length - 1 > 1) {
                alert("ابتدا بایستی سمتهای هر واحد پاک گردد")
                return;
            }
        }
        else if ($get("txtDepartmentID").value == "" || $get("txtDepartmentID").value == "0") {
            alert("هیج موردی برای حذف انتخاب نشده است")
            return;
        }
    }
    var Msg = "آيا براي حذف مطمئن هستيد؟"
    if (confirm(Msg) == true) {

        form1.txtDeleteFlag.value = "0"

        document.getElementById("txtSubmit").value = "DelDepartment";
        document.getElementById("BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function DeleteDepartmentFromTree(NodeText) {
    if (form1.txtTreeDepartmentIDSelected.value == "0" && form1.txtTreeDepartmentIDSelected.value == "1") {
        alert("هیج موردی برای حذف انتخاب نشده است")
        return;
    }
    else {
        if (confirm('آيا براي حذف "' + NodeText + '" مطمئن هستيد؟')) {

            $get("txtDepartmentID").value = form1.txtTreeDepartmentIDSelected.value

            document.getElementById("txtSubmit").value = "DelDepartment";
            document.getElementById("BtnSubmit").click();
        }
    }


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function DepartmentPasteFromTree() {


    if (confirm("آيا مطمئن هستيد؟")) {
        document.getElementById("txtSubmit").value = "DepartmentPaste";
        document.getElementById("BtnSubmit").click();
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function DepartmentMergeCut() {
    document.getElementById("txtSubmit").value = "DeptMergeCut";
    document.getElementById("BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function DepartmentMergePaste() {
    document.getElementById("txtSubmit").value = "DeptMergePaste";
    document.getElementById("BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onchangeRoleType(obj) {
    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");

    RowIndex = obj.parentElement.parentElement.rowIndex;

    var strXml = "<Root>" + str + "</Root>"
    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID');

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";

    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");
    if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "") {
        if (oXmlNodes.length > 0)
            OGrid.rows(RowIndex).cells(0).firstChild.value = oXmlNodes.item(0).selectSingleNode("RoleType").text
        alert("وارد کردن نوع سمت الزامی است")

    }
    else {

        if (oXmlNodes.length > 0) {
            oXmlNodes.item(0).selectSingleNode("RoleType").text = OGrid.rows(RowIndex).cells(0).firstChild.value
            if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

            strXml = oXmlDoc.xml;
            str = strXml.replace("<Root>", "");
            str = str.replace("</Root>", "");
        }
        else {
                str += "<Tb>"
                str += "<RowIndex>" + RowIndex + "</RowIndex>";
                str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleID>" + RoleID + "</RoleID>"
                str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</PersonCode>"
                if (OGrid.rows(RowIndex).cells(2).firstChild == null)
                    str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).innerText + "</PersonName>"
                else
                    str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).firstChild.innerText + "</PersonName>"
                str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
                str += "<Selected>1</Selected>"
                str += "</Tb>"

        }
    }


    form1.txtXmlGridData.value = str
    //            if ((OGrid.rows(RowIndex).cells(2).firstChild.innerText == "") && (OGrid.rows(RowIndex).cells(1).firstChild.innerText != "") && (OGrid.rows(RowIndex).cells(1).firstChild.innerText != "0")) 
    //                onblurPersonCode(OGrid.rows(RowIndex).cells(1).firstChild)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onblurRoleTitle(obj) {

    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");

    RowIndex = obj.parentElement.parentElement.rowIndex;

    var strXml = "<Root>" + str + "</Root>"
    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

    if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "")
        return;
    if (OGrid.rows(RowIndex).cells(1).firstChild.value == "")
        return;

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

    if (oXmlNodes.length > 0) {

        oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(3).firstChild.value
        if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1;


        strXml = oXmlDoc.xml;
        str = strXml.replace("<Root>", "");
        str = str.replace("</Root>", "");
    }
    else {
        str += "<Tb>"
        str += "<RowIndex>" + RowIndex + "</RowIndex>"
        str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
        str += "<RoleID>" + RoleID + "</RoleID>"
        str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
        str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
        str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</PersonCode>"
        if (OGrid.rows(RowIndex).cells(2).firstChild == null)
            str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).innerText + "</PersonName>"
        else
            str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).firstChild.innerText + "</PersonName>"
        str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
        str += "<Selected>1</Selected>"
        str += "</Tb>"
    }

    form1.txtXmlGridData.value = str

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onfocusPersonCode(obj) {
    //alert("onfocusPersonCode")
    var OGrid = document.getElementById("GrdPersonRole");
    var RowIndex1 = obj.parentElement.parentElement.rowIndex;
    for (var i = 1; i < OGrid.rows.length; i++) {

        OGrid.rows(i).cells(0).firstChild.disabled = true;
        OGrid.rows(i).cells(3).firstChild.disabled = true;
        if (RowIndex1 != i) {
            OGrid.rows(i).cells(1).firstChild.disabled = true;

        }
        OGrid.rows(i).cells(1).childNodes(1).disabled = true;
        OGrid.rows(i).cells(4).firstChild.disabled = true;
        OGrid.rows(i).cells(5).firstChild.disabled = true;
        OGrid.rows(i).cells(6).firstChild.disabled = true;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onblurPersonCode(obj) {
    //alert("onblurPersonCode")
    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");

    RowIndex = obj.parentElement.parentElement.rowIndex;
    //            alert("$RowIndex$" + RowIndex)
    //            alert("RowIndex: " + RowIndex)
    var strXml = "<Root>" + str + "</Root>"
    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

    if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "") {
        for (var i = 1; i < OGrid.rows.length; i++) {
            OGrid.rows(i).cells(0).firstChild.disabled = false;
            OGrid.rows(i).cells(1).firstChild.disabled = false;
            OGrid.rows(i).cells(3).firstChild.disabled = false;
            OGrid.rows(i).cells(1).childNodes(1).disabled = false;
            OGrid.rows(i).cells(4).firstChild.disabled = false;
            OGrid.rows(i).cells(5).firstChild.disabled = false;
            if (OGrid.rows.length - 1 == RowIndex)
                OGrid.rows(i).cells(6).firstChild.disabled = false;
        }
        alert("ابتدا نوع سمت را انتخاب کنید")
        obj.value = ""
        return;
    }
    if (OGrid.rows(RowIndex).cells(1).firstChild.value == "") {
        for (var i = 1; i < OGrid.rows.length; i++) {
            OGrid.rows(i).cells(0).firstChild.disabled = false;
            OGrid.rows(i).cells(1).firstChild.disabled = false;
            OGrid.rows(i).cells(3).firstChild.disabled = false;
            OGrid.rows(i).cells(1).childNodes(1).disabled = false;
            OGrid.rows(i).cells(4).firstChild.disabled = false;
            OGrid.rows(i).cells(5).firstChild.disabled = false;
            if (OGrid.rows.length - 1 == RowIndex)
                OGrid.rows(i).cells(6).firstChild.disabled = false;
        }
        return;
    }
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");


    if (oXmlNodes.length > 0) {
        oXmlNodes.item(0).selectSingleNode("PersonCode").text = OGrid.rows(RowIndex).cells(1).firstChild.value
        if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1;


        strXml = oXmlDoc.xml;
        str = strXml.replace("<Root>", "");
        str = str.replace("</Root>", "");
    }
    else {
            str += "<Tb>"
            str += "<RowIndex>" + RowIndex + "</RowIndex>"
            str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
            str += "<RoleID>" + RoleID + "</RoleID>"
            str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
            str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
            str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</PersonCode>"
            if (OGrid.rows(RowIndex).cells(2).firstChild == null)
                str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).innerText + "</PersonName>"
            else
                str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).firstChild.innerText + "</PersonName>"
            str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
            str += "<Selected>1</Selected>"
            str += "</Tb>"
      
    }



    $get("txtPersonValue").value = OGrid.rows(RowIndex).cells(1).firstChild.value;

    //-----------------------------------------------------------
    if (OGrid.rows(RowIndex).cells(1).firstChild.value != "" && OGrid.rows(RowIndex).cells(1).firstChild.value != "0") {

        for (var i = 1; i < OGrid.rows.length; i++) {
            OGrid.rows(i).cells(0).firstChild.disabled = true;
            OGrid.rows(i).cells(1).firstChild.disabled = true;
            OGrid.rows(i).cells(3).firstChild.disabled = true;
            OGrid.rows(i).cells(1).childNodes(1).disabled = true;
            OGrid.rows(i).cells(4).firstChild.disabled = true;
            OGrid.rows(i).cells(5).firstChild.disabled = true;
            OGrid.rows(i).cells(6).firstChild.disabled = true;
        }



        document.getElementById("BtnSubmitPerson").click();
    }
    else {

        for (var i = 1; i < OGrid.rows.length; i++) {
            OGrid.rows(i).cells(0).firstChild.disabled = false;
            OGrid.rows(i).cells(1).firstChild.disabled = false;
            OGrid.rows(i).cells(3).firstChild.disabled = false;
            OGrid.rows(i).cells(1).childNodes(1).disabled = false;
            OGrid.rows(i).cells(4).firstChild.disabled = false;
            OGrid.rows(i).cells(5).firstChild.disabled = false;
            if (OGrid.rows.length - 1 == RowIndex)
                OGrid.rows(i).cells(6).firstChild.disabled = false;
        }
    }


    form1.txtXmlGridData.value = str


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateGridXml() {

    form1.txtGridDepartmentID.value = document.getElementById("txtDepartmentID").value

    var OGrid = document.getElementById("GrdPersonRole");

    var str = "<Root>"
    for (var i = 1; i < OGrid.rows.length; ++i) {

        str += "<Tb>"
        str += "<RowIndex>" + i + "</RowIndex>"
        str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
        str += "<RoleID>" + OGrid.rows(i).RoleID + "</RoleID>"
        str += "<RoleType>" + OGrid.rows(i).cells(0).firstChild.value + "</RoleType>"
        str += "<RoleTitle>" + OGrid.rows(i).cells(3).firstChild.value + "</RoleTitle>"
        str += "<PersonCode>" + OGrid.rows(i).cells(1).firstChild.value + "</PersonCode>"
        str += "<PersonName>" + OGrid.rows(i).cells(2).firstChild.innerText + "</PersonName>"
        str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
        if (OGrid.rows(i).cells(4).firstChild.checked)
            str += "<Selected>1</Selected>"
        else
            str += "<Selected>0</Selected>"
        str += "</Tb>"



    }
    str += "</Root>"



}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function FillGridPersonRole() {

    var OGrid = document.getElementById("GrdPersonRole");
    if (document.getElementById("txtTempPersonID").value != "") {
        if (OGrid != undefined) {
            if (OGrid.rows.length > 0) {
                for (var k = 1; k < OGrid.rows.length - 1; ++k) {

                    if (parseInt(OGrid.rows(k).cells(1).firstChild.value, 10) == parseInt(document.getElementById("txtTempPersonID").value, 10)) {
                        OGrid.rows(k).className = "CssSelectedItemStyle"
                    }
                }
            }
        }


    }

    if (form1.txtXmlGridData.value == "")
        return

    var str = form1.txtXmlGridData.value




    var strXml = "<Root>" + str + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [DepartmentID=" + document.getElementById("txtDepartmentID").value + "]");


    if (oXmlNodes.length != 0) {
        for (var i = 1; i < OGrid.rows.length - 1; ++i) {
            for (var j = 0; j < oXmlNodes.length; ++j) {
                if (OGrid.rows(i).RoleID == oXmlNodes.item(j).selectSingleNode("RoleID").text && i == oXmlNodes.item(j).selectSingleNode("RowIndex").text) {
                    OGrid.rows(i).cells(0).firstChild.value = oXmlNodes.item(j).selectSingleNode("RoleType").text

                    if (OGrid.rows(i).cells(0).firstChild.value != "0" && OGrid.rows(i).cells(0).firstChild.value != "" && OGrid.rows(i).cells(1).firstChild.value != "") {
                        //OGrid.rows(i).cells(1).firstChild.value = oXmlNodes.item(j).selectSingleNode("RoleTitle").text
                        OGrid.rows(i).cells(1).firstChild.value = oXmlNodes.item(j).selectSingleNode("PersonCode").text

                        OGrid.rows(i).cells(2).innerText = oXmlNodes.item(j).selectSingleNode("PersonName").text
                    }


                }
            }
        }
    }

}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function FillGridPersonRoleForNew() {

    if (form1.txtXmlGridData.value == "")
        return

    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");


    var strXml = "<Root>" + str + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [DepartmentID=" + document.getElementById("txtDepartmentID").value + "][RoleID=0]");


    if (oXmlNodes.length != 0) {

        for (var i = 1; i < OGrid.rows.length; ++i) {

            for (var j = 0; j < oXmlNodes.length; ++j) {

                if (i == oXmlNodes.item(j).selectSingleNode("RowIndex").text) {

                    OGrid.rows(i).cells(0).firstChild.value = oXmlNodes.item(j).selectSingleNode("RoleType").text

                    //OGrid.rows(i).cells(1).firstChild.value = oXmlNodes.item(j).selectSingleNode("RoleTitle").text
                    OGrid.rows(i).cells(1).firstChild.value = oXmlNodes.item(j).selectSingleNode("PersonCode").text
                    OGrid.rows(i).cells(2).innerText = oXmlNodes.item(j).selectSingleNode("PersonName").text

                    if ((parseInt(OGrid.rows.length, 10) - parseInt(i, 10)) == 1)
                        OnClickBtnNewRow(OGrid.rows(i).cells(6).firstChild)
                }
            }
        }
    }
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickChkDelRole(obj) {
    //
    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");
    RowIndex = obj.parentElement.parentElement.rowIndex;
    //            alert("$RowIndex$" + RowIndex)
    //-------------------------

    if (
                OGrid.rows(RowIndex).RoleID == 0 ||
                OGrid.rows(RowIndex).cells(0).firstChild.value == 0 ||
                OGrid.rows(RowIndex).cells(1).firstChild.value == ""
             ) {
        alert("مجاز به این کار نمی باشید")
        OGrid.rows(RowIndex).cells(4).firstChild.checked = false;
        return;
    }
    //-------------------------



    if (obj.checked == true) {

        OGrid.rows(RowIndex).style.backgroundColor = "#FFCCFF";
        OGrid.rows(RowIndex).cells(0).firstChild.disabled = true;
        //OGrid.rows(RowIndex).cells(1).firstChild.disabled = true
        OGrid.rows(RowIndex).cells(1).childNodes(0).disabled = true;
        OGrid.rows(RowIndex).cells(1).childNodes(1).disabled = true;
    }
    else if (obj.checked == false) {
        OGrid.rows(RowIndex).style.backgroundColor = "";
        OGrid.rows(RowIndex).cells(0).firstChild.disabled = false;
        //OGrid.rows(RowIndex).cells(1).firstChild.disabled = false
        OGrid.rows(RowIndex).cells(1).childNodes(0).disabled = false;
        OGrid.rows(RowIndex).cells(1).childNodes(1).disabled = false;
    }
    //---UpdateXml:Selected=0------------------------------------------------------------

    var strXml = "<Root>" + str + "</Root>"
    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

    if (oXmlNodes.length > 0) {

        oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(3).firstChild.value


        if (obj.checked == true) {

            oXmlNodes.item(0).selectSingleNode("Selected").text = 0;
        }
        else if (obj.checked == false)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1;


        strXml = oXmlDoc.xml;
        str = strXml.replace("<Root>", "");
        str = str.replace("</Root>", "");
    }
    else {
        str += "<Tb>"
        str += "<RowIndex>" + RowIndex + "</RowIndex>"
        str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
        str += "<RoleID>" + RoleID + "</RoleID>"
        str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
        str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
        str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</PersonCode>"
        str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).firstChild.innerText + "</PersonName>"
        str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
        if (obj.checked == true)
            str += "<Selected>0</Selected>"
        else if (obj.checked == false)
            str += "<Selected>1</Selected>"

        str += "</Tb>"
    }
    //------------------------------------------------------------------------
    form1.txtXmlGridData.value = str

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDelPerson(obj) {

    var str = form1.txtXmlGridData.value

    var OGrid = document.getElementById("GrdPersonRole");
    RowIndex = obj.parentElement.parentElement.rowIndex;
    //            alert("$RowIndex$" + RowIndex)
    OGrid.rows(RowIndex).cells(1).firstChild.value = "";
    OGrid.rows(RowIndex).cells(2).innerText = "";
    //---UpdateXml:PersonCode=0------------------------------------------------------------

    var strXml = "<Root>" + str + "</Root>"
    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

    if (oXmlNodes.length > 0) {

        oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(3).firstChild.value
        oXmlNodes.item(0).selectSingleNode("PersonCode").text = 0
        if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

        strXml = oXmlDoc.xml;
        str = strXml.replace("<Root>", "");
        str = str.replace("</Root>", "");
    }
    else {
        str += "<Tb>"
        str += "<RowIndex>" + RowIndex + "</RowIndex>"
        str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
        str += "<RoleID>" + RoleID + "</RoleID>"
        str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
        str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
        str += "<PersonCode>0</PersonCode>"
        str += "<PersonName></PersonName>"
        str = str + "<Head>" + (OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0") + "</Head>";
        str += "<Selected>1</Selected>"
        str += "</Tb>"
    }

    form1.txtXmlGridData.value = str

    document.getElementById("txtSubmit").value = "DeletePerson"
    TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNewRow(obj) {

    var OGrdPersonRole = document.getElementById("GrdPersonRole");
    var GridLen = OGrdPersonRole.rows.length - 1;
    var NewRowIndex = obj.parentElement.parentElement.rowIndex;

    if (OGrdPersonRole.rows(NewRowIndex).cells(0).firstChild.value == "0" || OGrdPersonRole.rows(NewRowIndex).cells(1).firstChild.value == "") {
        alert("اطلاعات کامل نیست")
        return;
    }
    var oRow = OGrdPersonRole.insertRow();
    oRow.setAttribute('RoleID', 0);

    if (oRow.rowIndex % 2 == 0)
        oRow.className = "CssAlternatingItemStyle"
    else
        oRow.className = "CssItemStyle"

    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = OGrdPersonRole.rows(GridLen).cells(0).innerHTML
    oCell0.firstChild.value = "0";
    oCell0.firstChild.disabled = false;

    var oCell1 = oRow.insertCell();
    oCell1.innerHTML = OGrdPersonRole.rows(GridLen).cells(1).innerHTML
    oCell1.firstChild.value = "";
    oCell1.firstChild.disabled = false

    var oCell2 = oRow.insertCell();
    oCell2.innerHTML = OGrdPersonRole.rows(GridLen).cells(2).innerHTML
    oCell2.innerText = "";

    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = OGrdPersonRole.rows(GridLen).cells(3).innerHTML
    oCell3.firstChild.value = "";
    oCell3.firstChild.disabled = false;

    var oCell4 = oRow.insertCell();
    oCell4.innerHTML = OGrdPersonRole.rows(GridLen).cells(4).innerHTML
    oCell4.firstChild.checked = false;

    var oCell5 = oRow.insertCell();
    oCell5.innerHTML = OGrdPersonRole.rows(GridLen).cells(5).innerHTML

    var oCell6 = oRow.insertCell();
    oCell6.innerHTML = OGrdPersonRole.rows(GridLen).cells(6).innerHTML

    var oCell7 = oRow.insertCell();
    oCell7.innerHTML = OGrdPersonRole.rows(GridLen).cells(7).innerHTML

    var oCell8 = oRow.insertCell();
    oCell8.innerHTML = OGrdPersonRole.rows(GridLen).cells(8).innerHTML

    OGrdPersonRole.rows(GridLen).cells(6).firstChild.disabled = true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDelSelectedItem() {
    document.getElementById("txtDelSelectedItem").value = "1";
    OnClickBtnSave()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    var str = form1.txtXmlGridData.value
    var OGrid = document.getElementById("GrdPersonRole");
    var RowInd = parseInt(form1.txtHeadNew.value.trim());
    var StrXml = ""

    document.getElementById("txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (str == "") {
        if (form1.txtHeadNew.value.trim() == form1.txtHead.value.trim() && (form1.txtHeadNew.value.trim() != "")) {
            if (OGrid.rows(RowInd) != null) {
                if (OGrid.rows(RowInd).cells(8).firstChild.checked) {
                    alert("هیج موردی برای ذخیره وجود ندارد")
                    return;
                }
            }
        }
        else if (form1.txtHeadNew.value.trim() == form1.txtHead.value.trim() && form1.txtHeadNew.value.trim() == "") {
            alert("هیج موردی برای ذخیره وجود ندارد")
            return;
        }

    }
    $get("txtSaveXml").value = "<Root>" + str + "</Root>"
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get("txtSaveXml").value);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[DepartmentID=" + document.getElementById("txtDepartmentID").value + "]");
    var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb[RoleTitle='']");

    if (oXmlNodes.length == 0) {
        if (form1.txtHeadNew.value.trim() == form1.txtHead.value.trim() && (form1.txtHeadNew.value.trim() != "")) {
            if (OGrid.rows(RowInd).cells(8).firstChild.checked) {
                alert("موردی برای ذخیره انتخاب نشده است")
                return;
            }
        }
        else if (form1.txtHeadNew.value.trim() == form1.txtHead.value.trim() && (form1.txtHeadNew.value.trim() == "")) {
            alert("موردی برای ذخیره انتخاب نشده است")
            return;
        }
       
        StrXml = "<Root><Tb><RowIndex>" + RowInd + "</RowIndex><DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID><RoleID>" + OGrid.rows(parseInt(RowInd)).RoleID + "</RoleID><RoleType>" + OGrid.rows(parseInt(RowInd)).cells(0).firstChild.value + "</RoleType><RoleTitle>" + OGrid.rows(parseInt(RowInd)).cells(3).firstChild.value + "</RoleTitle><PersonCode>" + OGrid.rows(parseInt(RowInd)).cells(1).firstChild.value + "</PersonCode><PersonName>" + OGrid.rows(parseInt(RowInd)).cells(2).innerText + "</PersonName><Head>" + (OGrid.rows(RowInd).cells(8).firstChild.checked ? "1" : "0") + "</Head><Selected>1</Selected></Tb></Root>";
    }
    else if (oXmlNodes1.length > 0) {

        alert("وارد کردن نام سمت الزامی است")
        return;
    }
    else {
        StrXml += "<Root>"
        for (var i = 0; i < oXmlNodes.length; ++i) {
                if (oXmlNodes.item(i).selectSingleNode("PersonName").text != '' ) {
                    StrXml += "<Tb>"
                    StrXml += "<RowIndex>" + oXmlNodes.item(i).selectSingleNode("RowIndex").text + "</RowIndex>"
                    StrXml += "<DepartmentID>" + oXmlNodes.item(i).selectSingleNode("DepartmentID").text + "</DepartmentID>"
                    StrXml += "<RoleID>" + oXmlNodes.item(i).selectSingleNode("RoleID").text + "</RoleID>"
                    StrXml += "<RoleType>" + oXmlNodes.item(i).selectSingleNode("RoleType").text + "</RoleType>"
                    StrXml += "<RoleTitle>" + oXmlNodes.item(i).selectSingleNode("RoleTitle").text + "</RoleTitle>"
                    //            if (isNaN(parseInt(oXmlNodes.item(i).selectSingleNode("PersonCode").text, 10)))
                    //                StrXml += "<PersonCode>0</PersonCode>"
                    //            else
                    StrXml += "<PersonCode>" + oXmlNodes.item(i).selectSingleNode("PersonCode").text + "</PersonCode>"
                    StrXml += "<PersonName>" + oXmlNodes.item(i).selectSingleNode("PersonName").text + "</PersonName>"
                    StrXml = StrXml + "<Head>" + (oXmlNodes.item(i).selectSingleNode("Head").text) + "</Head>";
                    StrXml += "<Selected>" + oXmlNodes.item(i).selectSingleNode("Selected").text + "</Selected>"
                    StrXml += "</Tb>"
                }
            //for delete semat
                if (oXmlNodes.item(i).selectSingleNode("PersonName").text == '' && oXmlNodes.item(i).selectSingleNode("RoleID").text!='0') {
                    StrXml += "<Tb>"
                    StrXml += "<RowIndex>" + oXmlNodes.item(i).selectSingleNode("RowIndex").text + "</RowIndex>"
                    StrXml += "<DepartmentID>" + oXmlNodes.item(i).selectSingleNode("DepartmentID").text + "</DepartmentID>"
                    StrXml += "<RoleID>" + oXmlNodes.item(i).selectSingleNode("RoleID").text + "</RoleID>"
                    StrXml += "<RoleType>" + oXmlNodes.item(i).selectSingleNode("RoleType").text + "</RoleType>"
                    StrXml += "<RoleTitle>" + oXmlNodes.item(i).selectSingleNode("RoleTitle").text + "</RoleTitle>"
                    //            if (isNaN(parseInt(oXmlNodes.item(i).selectSingleNode("PersonCode").text, 10)))
                    //                StrXml += "<PersonCode>0</PersonCode>"
                    //            else
                    StrXml += "<PersonCode>" + oXmlNodes.item(i).selectSingleNode("PersonCode").text + "</PersonCode>"
                    StrXml += "<PersonName>" + oXmlNodes.item(i).selectSingleNode("PersonName").text + "</PersonName>"
                    StrXml = StrXml + "<Head>" + (oXmlNodes.item(i).selectSingleNode("Head").text) + "</Head>";
                    StrXml += "<Selected>" + oXmlNodes.item(i).selectSingleNode("Selected").text + "</Selected>"
                    StrXml += "</Tb>"
                }
            }
            StrXml += "</Root>"
        
    }
    $get("txtSaveXml").value = StrXml

    document.getElementById("txtSubmit").value = "Modify";
    document.getElementById("BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickSelectPerson(Obj) {

    var OGrid = document.getElementById("GrdPersonRole");
    RowIndex = Obj.parentElement.parentElement.rowIndex;
    //            alert("$RowIndex$" + RowIndex)
    if (OGrid.rows(RowIndex).cells(0).firstChild.value == "" || OGrid.rows(RowIndex).cells(0).firstChild.value == "0") {
        //                document.getElementById("txtSubmit").value = "SelEmptyPerson"
        //                TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
        alert("ابتدا نوع سمت را انتخاب کنید")
        return
    }
    //            else if (OGrid.rows(RowIndex).cells(1).firstChild.value == "") {
    //                document.getElementById("txtSubmit").value = "SelEmptyPerson"
    //                TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);

    //                return
    //            }


    var RequsterAction = "Btndata";
    var RequsterPageID = 0


    url = "../Person/SelectPerson.aspx?ShowFlag=1" + " &RequsterPageID=11110" + " &RequsterAction=" + RequsterAction + " &SessionID=" + form1.txtSessionID.value + " &CompanyPeriodID=" + form1.txtCompanyFinatialPeriodID.value + " &OnLineUser=" + form1.txtOnlineUserCode.value;
    var returnValue
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")


    if (returnValue != "" && returnValue != undefined) {


        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(returnValue);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");

        if (oXmlNodes.length > 0)
            OGrid.rows(RowIndex).cells(1).firstChild.value = oXmlNodes.item(0).selectSingleNode("PCode").text


    }
    onblurPersonCode(OGrid.rows(RowIndex).cells(1).firstChild)

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    if ($get("CmbCodeDept_txtCode").value != '') {
        document.getElementById("txtDepartmentID").value = $get("CmbCodeDept_txtCode").value;
    }

    document.getElementById("txtAcCode").value = GetAccessCode(window.event.srcElement)
    document.getElementById("txtTreePersonCode").value = document.getElementById("txtPersonCode").value
    if (document.getElementById("txtTreePersonCode").value == "")
        document.getElementById("txtTreePersonCode").value = "0";
    document.getElementById("txtSubmit").value = "Filter";
    document.getElementById("BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNewAndAssignRole() {

    if ($get("txtDepartmentID").value == "" && $get("txtDepartmentID").value != "0") {
        alert("یک واحد سازمانی را انتخاب نمایید")
        return;
    }
    url = "NewAndAssignRole.aspx?DepartmentID=" + $get("txtDepartmentID").value + " &ToPersonId=" + form1.txtOnlineUserCode.value + " &SessionID=" + form1.txtSessionID.value + " &CompanyFinatialPeriodID=" + form1.txtCompanyFinatialPeriodID.value
    var rr = "";
    rr = window.showModalDialog(url, window, "dialogHeight: 160px;dialogWidth: 450px;center: Yes;help: no;status: no")


    if (rr != "" && rr != "undefined") {
        $get("txtTmpPDepartmentID").value = $get("txtDepartmentID").value
        onClickBtnOK();
    }

}


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnAdvanceFilter() {
    document.getElementById("txtAcCode").value = GetAccessCode(window.event.srcElement)
    $get("txtTmpPRCode").value = $get("CmbPerson_txtCode").value
    if ($get("txtTmpPRCode").value == "")
        $get("txtTmpPRCode").value = "0"

    document.getElementById("BtnSubmitPersonRole").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickBtnOK() {
    document.getElementById("txtSubmit").value = "AdvanceFilter";
    document.getElementById("BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onChangeCmbPersonName() {
    document.getElementById("txtPersonCode").value = document.getElementById("CmbPersonName").value
    if (document.getElementById("CmbPersonName").value == 0)
        document.getElementById("txtPersonCode").value = ""
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnKeyDownIntDeptCode(number) {
    var key = window.event.keyCode
    var key2 = window.event.shiftKey;

    window.event.returnValue =
		(
        (key <= 31 && (key >= 48 || key <= 57))
         || (key == 8) || (key == 9) || (key == 46) || (key == 16)
         || ((key >= 96) && (key <= 105))
         || ((key2 == false) && ((key <= 65) || (key >= 90)))

		)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function ChangeParent() {
    $get("txtPerioritySubmit").value = "GetPeriority";
    document.getElementById("BtnPerioritySubmit").click();
}