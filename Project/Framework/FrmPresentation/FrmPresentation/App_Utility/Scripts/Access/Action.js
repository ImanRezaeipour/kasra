var MasterObj = "ctl00_ContentPlaceHolder1_";
/////-------------------------------------------
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

var LastSelectedRow = null;
var LastSelectedRowClass = "";
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {

    var TbObj = obj.parentElement;
    while (TbObj.tagName != "TR")
        TbObj = TbObj.parentElement

    var RowIndex = TbObj.rowIndex;

    while (TbObj.tagName != "TABLE")
        TbObj = TbObj.parentElement


    var StrXml = $get(MasterObj + "txtSaveXml").value;

    var ID = TbObj.rows(RowIndex).getAttribute("ID")

    if (StrXml == "") {

        StrXml += "<Root><Tb>"
        StrXml += "<ID>" + TbObj.rows(RowIndex).getAttribute("ID") + "</ID>"
        StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
        StrXml += "</Tb></Root>"

        $get(MasterObj + "txtSaveXml").value = StrXml;
    }
    else if (StrXml != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(StrXml);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ID='" + ID + "']");
        if (oXmlNodes.length != 0) {
            oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
            $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
        }
        else {
            var tstr = ""
            tstr += "<Tb>";
            tstr += "<ID>" + TbObj.rows(RowIndex).getAttribute("ID") + "</ID>"
            tstr += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
            tstr += "</Tb>"
            $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("</Root>", tstr + "</Root>");
        }
    }
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var TbObj = obj.parentElement;
    while (TbObj.tagName != "TR")
        TbObj = TbObj.parentElement

    while (TbObj.tagName != "TABLE")
        TbObj = TbObj.parentElement

    var OGrid = TbObj

    var oLen = OGrid.rows.length
    //             if (OGrid.id == "GrdAction")
    for (var i = 1; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
    //             else if (OGrid.id == "GrdActionShortkey")
    //                 for (var i = 1; i < oLen; i++) {
    //                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked
    //                 OnClickChk1(OGrid.rows(i).cells(0).firstChild);
    //             }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    returnValue = 1;
    //             alert($get(MasterObj + "txtSaveXmlShortkey").value)
    //             alert($get(MasterObj + "txtSaveXml").value)
    document.getElementById(MasterObj + "txtSubmit").value = "Save";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!