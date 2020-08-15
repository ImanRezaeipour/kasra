var LastSelectedRow = null;
var LastSelectedRowClass = "";
var strChk = "";
var SelectedFlag = 0;
window.name = "ExecCardexRule.aspx"
aspnetForm.target = window.name;
//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//=====================================================================================================
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    if ($get(MasterObj + "txtValidate").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value);
        else
            alert($get(MasterObj + "txtAlert").value);
    }
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "")
        SetChk();
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
//--------------------------------------------------------------------------------------------
function OnClickBtnOk() {
    $get(MasterObj + "txtXml").value = "<Root>" + strChk + "</Root>"
    //=======================================================================
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXml").value);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
    var strScript = "";
    if (oXmlNodes.length > 0) {
        for (var i = 0; i < oXmlNodes.length; i++) {
            {
                if (strScript == "")
                    strScript = oXmlNodes.item(i).selectSingleNode("ScriptName").text
                else
                    strScript = strScript + "," + oXmlNodes.item(i).selectSingleNode("ScriptName").text
            }
        }
        document.getElementById(MasterObj + "txtXml").value = strScript;
        $get(MasterObj + "txtSubmit").value = "RunScript";
        $get(MasterObj + "BtnSubmit").click();
    }
    else {
        document.getElementById(MasterObj + "txtXml").value = "";
        alert("هيچ قانوني انتخاب نشده است");
    }

}
//--------------------------------------------------------------------------------------------
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById(MasterObj + "GrdCardexRule");
    var oLen = OGrid.rows.length - 1;
    for (var i = 1; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//--------------------------------------------------------------------------------------------
function OnClickChk(obj) {
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ ScriptID=" + oGrid.rows(oIndex).getAttribute("ScriptID") + "]");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            f.selectSingleNode("Selected").text = 1;
            oXmlDoc.childNodes[0].appendChild(f);
        }
        else {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            f.selectSingleNode("Selected").text = 0;
            oXmlDoc.childNodes[0].appendChild(f);
        }


        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<Tb>"
        strChk += "<ScriptID>" + oGrid.rows(oIndex).getAttribute("ScriptID") + "</ScriptID>"
        if (oGrid.rows[oIndex].cells(0).firstChild.checked == false)
            strChk += "<Selected>0</Selected>"
        else
            strChk += "<Selected>1</Selected>"
        strChk += "<ScriptName>" + oGrid.rows(oIndex).cells(1).firstChild.innerText + "</ScriptName>";
        strChk += "</Tb>"
    }
}
//--------------------------------------------------------------------------------------------
function SetChk() {
    var i = 0;
    var j = 0;
    var OGrid = document.getElementById(MasterObj + "GrdCardexRule");
    if (OGrid == null)
        return
    var PageSize = OGrid.rows.length
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
    for (j = 0; j < oXmlNodes.length; j++) {
        for (i = 1; i < PageSize; i++) {
            if (OGrid.rows(i).getAttribute("ScriptID") == oXmlNodes.item(j).selectSingleNode("ScriptID").text) {
                if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                    OGrid.rows(i).cells(0).firstChild.checked = true;
                else
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
        }
    }
}
//--------------------------------------------------------------------------------------------