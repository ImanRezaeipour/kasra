var MasterObj = "ctl00_ContentPlaceHolder1_";
var MasterObjSearch = "ctl00_Snap3_ContentPlaceHolderSearch_";
window.name = "GroupMember.aspx"
window.target = window.name;
/////-------------------------------------------

window.name = "GroupMember.aspx"
window.target = window.name;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var GroupID = '0';
var CountChkSelected = 0
var LastSelectedRow = null;
var LastSelectedRowClass = "";

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$get(MasterObj + "CmbPerson_txtCode").attachEvent('onblur', onblurcmbPersonCode)
document.getElementById('OPaging_BtnPrv').disabled = true;
document.getElementById('OPaging_txtFromData').value = $get(MasterObj + "lblFrom").value;
document.getElementById('OPaging_txtToData').value = $get(MasterObj + "lblTo").value;
document.getElementById('OPaging_txtTotalData').value = $get(MasterObj + "lblTotal").value;
document.getElementById('OPaging_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
document.getElementById('OPaging_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
if (parseInt(document.getElementById("OPaging_txtCurPage").value) == parseInt(document.getElementById("OPaging_txtTotalPage").value))
    document.getElementById('OPaging_BtnNext').disabled = true
else
    document.getElementById('OPaging_BtnNext').disabled = false;
if (document.getElementById(MasterObj + "txtGroupAccessID").value == "0")
    document.getElementById('OToolBar_BtnSelect').style.display = "none"
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage() {
    document.getElementById("OPaging_txtCurPage").value = document.getElementById("OPaging_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OPaging_txtTotalPage").value);
    if (document.getElementById("OPaging_txtCurPage").value != "" &&
                    document.getElementById("OPaging_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OPaging_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OPaging_txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "ShowCurPage";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {

    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmpty() {
    if (document.getElementById(MasterObjSearch + "txtGroupName").value == "") {
        $get(MasterObj + "txtAlert").value = "وارد کردن نام گروه الزامی است"
        alert($get(MasterObj + "txtAlert").value);
        return false;
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    var str = ""
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (checkNotEmpty() == true) {
        if ($get(MasterObj + "txtSaveXml").value == "")
            $get(MasterObj + "txtSaveXml").value = "<Root></Root>"
        var strXml = $get(MasterObj + "txtSaveXml").value

        str = strXml.replace("<Root>", "");
        str = str.replace("</Root>", "");

        str = str + "<GroupAccess>"
        str = str + "<GroupName>" + document.getElementById(MasterObjSearch + "txtGroupName").value + "</GroupName>"
        str = str + "<GroupDesc>" + document.getElementById(MasterObjSearch + "TxtGroupDesc").value + "</GroupDesc>"
        str = str + "</GroupAccess>"

        strXml = strXml.replace("</Root>", str + "</Root>");
        $get(MasterObj + "txtSaveXml").value = strXml
        returnValue = 1;
        document.getElementById(MasterObj + "txtSubmit").value = "Save";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSelect() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    var RequsterAction = "";
    var RequsterPageID = 0

    if (event.srcElement.id.indexOf('OToolBar_') != -1) {
        RequsterAction = event.srcElement.id.replace('OToolBar_', '')
    }

    url = "../BaseInfo/Person/SelectPerson.aspx?ShowFlag=0 &Page=GroupMember &GroupID=" + document.getElementById(MasterObj + "txtGroupAccessID").value
                + " &RequsterPageID=1129"
                + " &RequsterAction=" + RequsterAction
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value


    var returnValue
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no")

    if (returnValue != undefined) {
        ModifyXML(returnValue);

        $get(MasterObj + "txtSubmit").value = "Search";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//=========================================================================
function ModifyXML(strselect) {
    var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")//xml انتخاب شده
    oXmlDocTemp.async = "false";
    oXmlDocTemp.loadXML(strselect)
    var xmlNodesTemp = oXmlDocTemp.documentElement.selectNodes("/Root/Tb")
    //--------------------------------------
    if ($get(MasterObj + "txtSaveXml").value == "")
        $get(MasterObj + "txtSaveXml").value = "<Root></Root>"
    var strXml = $get(MasterObj + "txtSaveXml").value

    str = strXml.replace("<Root>", "");
    str = str.replace("</Root>", "");

    //---------------------------------------
    if (xmlNodesTemp.length > 0) {
        for (var i = 0; i < xmlNodesTemp.length; i++) {

            str += "<Tb>"
            str += "<PID>" + xmlNodesTemp.item(i).selectSingleNode("PID").text + "</PID>"
            str += "<PCode>" + xmlNodesTemp.item(i).selectSingleNode("PID").text + "</PCode>"
            str += "<PName>" + xmlNodesTemp.item(i).selectSingleNode("PName").text + "</PName>"
            str += "<Selected>1</Selected>"
            str += "</Tb>"
        }
    }
    strXml = strXml.replace("</Root>", str + "</Root>");
    $get(MasterObj + "txtSaveXml").value = strXml
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onblurcmbPersonCode() {
    $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "CmbPerson_txtCode").value;

    $get(MasterObj + "txtSubmit").value = "Search";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    var StrXml = $get(MasterObj + "txtXMLModify").value;
    if (StrXml != "") {
        var StrConf = "آيا از حذف مطمئنيد؟"
        if (confirm(StrConf)) {
            //                    alert($get(MasterObj + "txtXMLModify").value)
            $get(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("لطفا ابتدا يک سطر انتخاب نماييد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {

    var TbObj = obj.parentElement;
    while (TbObj.tagName != "TR")
        TbObj = TbObj.parentElement

    var RowIndex = TbObj.rowIndex;

    while (TbObj.tagName != "TABLE")
        TbObj = TbObj.parentElement
    //            //========================================================
    //            if (obj.checked == true && CountChkSelected != TbObj.rows.length - 1)
    //                CountChkSelected++;
    //            else if (obj.checked == false)
    //                CountChkSelected--;

    //            if (CountChkSelected == TbObj.rows.length - 1 && TbObj.rows(0).cells(0).firstChild.checked != true)
    //                TbObj.rows(0).cells(0).firstChild.checked = true
    //            else if (CountChkSelected != TbObj.rows.length - 1 && TbObj.rows(0).cells(0).firstChild.checked != false)
    //                TbObj.rows(0).cells(0).firstChild.checked = false
    //========================================================

    var StrXml = $get(MasterObj + "txtSaveXml").value;

    var personCode = TbObj.rows(RowIndex).cells(1).innerText

    if (StrXml == "") {

        StrXml += "<Root><Tb>"
        StrXml += "<PID>" + TbObj.rows(RowIndex).cells(1).innerText + "</PID>"
        StrXml += "<PCode>" + TbObj.rows(RowIndex).cells(1).innerText + "</PCode>"
        StrXml += "<PName>" + TbObj.rows(RowIndex).cells(2).innerText + "</PName>"
        StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
        StrXml += "</Tb></Root>"

        $get(MasterObj + "txtSaveXml").value = StrXml;
    }
    else if (StrXml != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(StrXml);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PCode='" + personCode + "']");
        if (oXmlNodes.length != 0) {
            oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
            $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
        }
        else {
            var tstr = ""
            tstr += "<Tb>";
            tstr += "<PID>" + TbObj.rows(RowIndex).cells(1).innerText + "</PID>"
            tstr += "<PCode>" + TbObj.rows(RowIndex).cells(1).innerText + "</PCode>"
            tstr += "<PName>" + TbObj.rows(RowIndex).cells(2).innerText + "</PName>"
            tstr += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
            tstr += "</Tb>"
            $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("</Root>", tstr + "</Root>");
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetChk() {

    var i = 0;
    var j = 0;
    var OGrid = document.getElementById("GrdGroupMember");
    if (OGrid == null)
        return

    var PageSize = OGrid.rows.length
    var strXml = $get(MasterObj + "txtSaveXml").value
    if (strXml == "")
        strXml = "<Root></Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

    for (j = 0; j < oXmlNodes.length; j++) {
        for (i = 1; i < PageSize; i++) {
            if ((OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("PCode").text)) {
                OGrid.rows(i).cells(0).firstChild.checked = true;
                CountChkSelected++;
            }
        }
    }

    var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=0]");

    for (j = 0; j < oXmlNodes1.length; j++) {
        for (i = 1; i < PageSize; i++) {
            if ((OGrid.rows(i).cells(1).innerText == oXmlNodes1.item(j).selectSingleNode("PCode").text)) {
                OGrid.rows(i).cells(0).firstChild.checked = false;
                CountChkSelected--;
            }
        }
    }
    if (CountChkSelected == OGrid.rows.length - 1)
        OGrid.rows(0).cells(0).firstChild.checked = true
    else
        OGrid.rows(0).cells(0).firstChild.checked = false
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById("GrdGroupMember");
    var oLen = OGrid.rows.length

    if (obj.checked == true)
        CountChkSelected = oLen - 1
    else
        CountChkSelected = 0


    for (var i = 1; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrdGroupMember() {
    //alert(GroupID)
    OnClickBtnShowGroupPerson()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickchkAllSelected(obj) {
    document.getElementById(MasterObj + "txtSubmit").value = "Search"
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {
    window.close()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    $get(MasterObjSearch + "TxtGroupDesc").value = ""
    $get(MasterObjSearch + "txtGroupName").value = ""
    $get(MasterObj + "txtPersonCode").value = ""
    $get(MasterObj + "CmbPerson_txtCode").value = ""
    $get(MasterObj + "txtGroupAccessID").value = "0"
    $get(MasterObj + "txtSubmit").value = "Search";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!