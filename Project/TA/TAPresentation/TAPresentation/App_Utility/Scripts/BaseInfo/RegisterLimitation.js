//-----------------------------------------------AJAX---------

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    /*
    $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(0, 2);
    $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(3, 2);
    $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(6, 4);
    $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('StartDate').text
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                */
}
window.returnValue = 0;
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value

    if ($get(MasterObj + "txtAlert").value != "") {
        SetMsg($get(MasterObj + "txtAlert").value);
        window.returnValue = document.getElementById(MasterObj + "txtValidate").value
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    if (StrVal == "Filter" | StrVal == "BtnNext" | StrVal == "BtnPrv" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {

        if (document.getElementById(MasterObj + "txtSelectedCode").value == 1 && SelectedFlag == 1) {
            document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
            document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
            strChk = ""
            //strChk += document.getElementById(MasterObj + "txtXmlChecked").value;
            clearGrid(oGrid);
            bindGrid(oGrid);

            ////////////                                document.getElementById("Tr1").style.display = "none";
            ////////////                                document.getElementById("Tr2").style.display = "inline";
        }
        ////////////                            else {
        ////////////                                document.getElementById("Tr1").style.display = "inline";
        ////////////                                document.getElementById("Tr2").style.display = "none";
        ////////////                            }


    }

}
//=====================================================================
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var oGrid = document.getElementById(MasterObj + "GrdSelectCode");
var strChk = "";
var newrowindex = 0;
var SelectedFlag = 0;
var SelectedFlagEdit = 0;
var ScriptName1 = 'محدوديت روزي ثبت';  //'BeforeDaysCredit';
var ScriptName2 = 'محدوديت تاريخي ثبت'; //'MonthDayCredit'

if (document.getElementById(MasterObj + "txtAllowEdit").value == "0") {
    document.getElementById(MasterObj + "txtGroupCodeName").disabled = true;
    document.getElementById(MasterObj + "chkVisible").disabled = true;
    document.getElementById('OToolBar_BtnSave').disabled = true;
    document.getElementById('OToolBar_BtnNew').disabled = true;
}
//-------------------------------------------------------------------
if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {
    strChk = $get(MasterObj + "txtParamVal").value
//    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
//    oXmlDoc.async = "false";
//    oXmlDoc.loadXML($get(MasterObj + "txtXmlChecked").value);
//    alert($get(MasterObj + "txtXmlChecked").value)
//    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/TbCode"); //[Selected=1]
//    //========================================================
//    alert(oXmlNodes.length)
//    if (oXmlNodes.length > 0)
//        for (var i = 0; i < oXmlNodes.length; i++)
//            strChk += ((strChk == "") ? oXmlNodes.item(i).selectSingleNode('CodeID').text : "," + oXmlNodes.item(i).selectSingleNode('CodeID').text);

    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
    //alert(strChk)
}
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnBlurtxtCurPage() {
    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    if (document.getElementById("OToolBar_txtCurPage").value != "" &&
    document.getElementById("OToolBar_txtCurPage").value != "0") {
    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
    }
    document.getElementById(MasterObj + "txtSubmit").value = "Const";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
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
    function OnClickBtnCancel() {
    window.close()
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnNew() {
    strChk = '';
    document.getElementById(MasterObj + "txtXml").value = '';
    document.getElementById(MasterObj + "txtScriptName").value = '';
    document.getElementById(MasterObj + "txtInstanceID").value = '0';
    document.getElementById(MasterObj + "txtScriptID").value = '0';
    document.getElementById(MasterObj + "rbtnIns1").checked = true;
    document.getElementById(MasterObj + "txtIns1").value = '';
    document.getElementById(MasterObj + "txtIns2").value = '';
    document.getElementById(MasterObj + "rbtnRegisterStep").checked = true;
    document.getElementById(MasterObj + "rbtnConfirmStep").checked = false;

}
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnSelectGroup() {
    var strUrl = "ScriptGroups.aspx?ScriptID=0"
    + "&Type=chk"
    + "&InstanceID=0"
    + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
    + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    + "&System=13"
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 670px;center: Yes;help: no;status: no')
    //alert(rValue)
    document.getElementById(MasterObj + "txtXml").value = rValue;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnSelectScriptGroups() {
    var strUrl = "ScriptGroups.aspx?ScriptID=0"
    + "&Type=chk"
    + "&InstanceID=0"
    + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
    + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    + "&System=13"
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 670px;center: Yes;help: no;status: no')
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnSave() {
    if (checkNotEmpty() == true) {
    MakeXML()
    //alert(document.getElementById(MasterObj + "txtXml").value)
    document.getElementById(MasterObj + "txtSubmit").value = "Save";
    document.getElementById(MasterObj + "BtnSubmit").click();
    }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function MakeXML() {
    var SDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtDay").value
    var EDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtDay").value
    //alert(strChk)
    var XMLStr = '<Root><Tb><ID>';
    XMLStr += document.getElementById(MasterObj + "txtScriptID").value
    XMLStr += '</ID><Step>' + (($get(MasterObj + 'rbtnRegisterStep').checked)? '80' : '81') + '</Step><Desc>'
    XMLStr += document.getElementById(MasterObj + "txtScriptName").value
    XMLStr += '</Desc><Parameters>2</Parameters><ParametersDesc>کدها$روز چندم$</ParametersDesc>'
    XMLStr += '<Parametersvalue>'
    XMLStr += 'P01=' + strChk + '$P06=' + ((document.getElementById(MasterObj + "rbtnIns1").checked) ? document.getElementById(MasterObj + "txtIns1").value : document.getElementById(MasterObj + "txtIns2").value)
    XMLStr += '</Parametersvalue><Name>'
    XMLStr += document.getElementById(MasterObj + "txtScriptName").value
    XMLStr += '</Name> <SDate>' + SDate + '</SDate><EDate>' + EDate + '</EDate><Priority>1</Priority><Active>1</Active>'
    XMLStr += '<TemplateName>' + ((document.getElementById(MasterObj + "rbtnIns1").checked) ? ScriptName1 : ScriptName2)
    XMLStr += '</TemplateName>'
    XMLStr += '<Type>2</Type></Tb>'
    XMLStr += document.getElementById(MasterObj + "txtXml").value+'</Root>'
    document.getElementById(MasterObj + "txtXml").value = XMLStr;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function checkNotEmpty() {
    if (strChk == '') {
        alert('لطفا کدهاي مورد نظر خود را انتخاب نماييد')
        return false;
    }
    else if (document.getElementById(MasterObj + "txtScriptName").value=="") {
        alert("لطفا نام محدوديت را وارد نماييد")
        document.getElementById(MasterObj + "txtScriptName").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "rbtnIns1").checked == true &
        document.getElementById(MasterObj + "txtIns1").value == "") {
        alert("لطفا تعداد روز از زمان وقوع را وارد نماييد")
        document.getElementById(MasterObj + "txtIns1").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "rbtnIns2").checked == true &
        document.getElementById(MasterObj + "txtIns2").value == "") {
        alert("لطفا روز چندم از ماه را وارد نماييد")
        document.getElementById(MasterObj + "txtIns2").focus()
        return false;
    }
    else if (document.getElementById(MasterObj + "rbtnIns2").checked == true &
        parseInt($get(MasterObj + "txtIns2").value) >"31") {
        alert("روز ماه بايد کوچکتر مساوي 31 باشد")
        document.getElementById(MasterObj + "txtIns2").focus()
        return false;
    }
        return true;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickOP(obj) {
    switch (obj.id) {
    case MasterObj + 'rbtnIns1':
    $get(MasterObj + "txtIns1").disabled = false;
    $get(MasterObj + "txtIns2").disabled = true;
    $get(MasterObj + "txtIns1").focus()
    break

        case MasterObj + 'rbtnIns2':
    $get(MasterObj + "txtIns1").disabled = true;
    $get(MasterObj + "txtIns2").disabled = false;
    $get(MasterObj + "txtIns2").focus()
    break    
    }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById(MasterObj+"GrdSelectCode");
    var oLen = OGrid.rows.length

    for (var i = 1; i < oLen; i++) {
    OGrid.rows(i).cells(0).firstChild.checked = obj.checked
    OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickChk(obj) {
    var StrClientChk = "";
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
    oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
    oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    //========================================================  
    var CodeID = oGrid.rows(oIndex).cells(1).innerText;
    if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
    if (strChk.search(CodeID) == -1)
    strChk = ((strChk == '') ? CodeID : strChk + ',' + CodeID);
    }
    else {
    if (strChk.search(CodeID) != -1)
    strChk = strChk.replace(CodeID + ',', '');
    }    
    //========================================================
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetChk() {

    var i = 0;
    var j = 0;

    var OGrid = document.getElementById(MasterObj + "GrdSelectCode");
    if (OGrid == null)
        return
    var PageSize = OGrid.rows.length
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode");

    for (j = 0; j < oXmlNodes.length; j++) {
        for (i = 1; i < PageSize; i++) {
            if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("CodeID").text) {
                if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                    OGrid.rows(i).cells(0).firstChild.checked = true;
                else
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChkSelectedGroup() {
    if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {
        if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {

            SelectedFlag = 1;
            document.getElementById(MasterObj + "txtSelectedCode").value = 1;
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //////////////            else if (document.getElementById(MasterObj + "chkSelectedCode").checked == true && SelectedFlag == 1) {
        //////////////                clearGrid(oGrid);
        //////////////                bindGrid(oGrid);
        ////////////                document.getElementById("Tr1").style.display = "none";
        ////////////                document.getElementById("Tr2").style.display = "inline";
        //////////////            }
        else if (document.getElementById(MasterObj + "chkSelectedCode").checked == false) {
            document.getElementById(MasterObj + "txtSelectedCode").value = 0;
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {
            if (strChk != "<Root></Root>")
                clearGrid(oGrid);
            bindGrid(oGrid);
        }
        else {
            //////////////                document.getElementById("Tr1").style.display = "inline";
            //////////////                document.getElementById("Tr2").style.display = "none";
            SetChk();
        }

    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function clearGrid(oGrid) {
    while (oGrid.rows.length > 0) {
        oGrid.deleteRow(0);
    }
}
//====================================================
function bindGrid(oGrid) {

    clearGrid(oGrid);
    newrowindex = 0;

    // strChk.replace();
    var strXml = "<Root>" + strChk + "</Root>";

    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    xmlDoc.loadXML(strXml)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var XmlNodes = xmlDoc.documentElement.selectNodes("/Root/TbCode[Selected=1]")

    var len = XmlNodes.length

    var oIndex = 0
    //////////////        document.getElementById("Tr1").style.display = "none";
    //////////////        document.getElementById("Tr2").style.display = "inline";
    for (var i = 0; i < len; i++) {
        AddRow(oGrid,
                                 XmlNodes.item(i).selectSingleNode('CodeID').text,
                                 XmlNodes.item(i).selectSingleNode('CodeName').text);
    }


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function AddRow(oGrid, CodeNo, CodeName) {
    oGrid.insertRow();
    oGrid.rows(newrowindex).insertCell()
    oGrid.rows(newrowindex).insertCell()
    oGrid.rows(newrowindex).insertCell()
    oGrid.rows(newrowindex).className = "CssItemStyle"
    oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' checked=true   style='WIDTH:20px' onclick='OnClickChkSelectedGrid(this)'  />";
    oGrid.rows(newrowindex).cells(1).innerHTML = "<asp:Label  runat='server'>" + CodeNo + "</asp:Label>"

    oGrid.rows(newrowindex).cells(2).innerHTML = "<asp:Label  runat='server' >" + CodeName + "</asp:Label>"

    oGrid.rows(newrowindex).align = "center"
    oGrid.rows(newrowindex).dir = "rtl"

    oGrid.rows(newrowindex).cells(0).style.width = "20px"
    oGrid.rows(newrowindex).cells(1).style.width = "120px"
    oGrid.rows(newrowindex).cells(2).style.width = "230px"
    oGrid.rows(newrowindex).cells(1).align = "right"
    oGrid.rows(newrowindex).cells(2).align = "right"

    newrowindex = newrowindex + 1
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickGrdSub() {
    var oGrdSub = document.getElementById("grdSub")
    var index = -1
    var oRow = event.srcElement

    //_______Find Row
    for (var i = 0; oRow.tagName != "TR"; i++)
        oRow = oRow.parentElement
    index = oRow.rowIndex
    if (oRow.parentElement.parentElement.id == "grdSub") {
        for (i = 0; i < oGrdSub.rows.length; i++) {
            if (oGrdSub.rows(i).className == "CssSelectedItemStyle") {
                oGrdSub.rows(i).className = "CssItemStyle"
            }
        }
        oRow.className = "CssSelectedItemStyle"
        LastSelectedRow = oRow
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChkSelectedGrid(obj) {
    var strXml = "<Root>" + strChk + "</Root>";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml)


    if (obj.checked == false) {
        obj.parentElement.parentElement.style.display = "none";
        var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc1.async = "false";
        oXmlDoc1.loadXML("<Root></Root>")

        if (oXmlDoc.xml != oXmlDoc1.xml && oXmlDoc.xml != "<Root></Root>") {
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[CodeID=" + obj.parentElement.parentElement.cells(1).innerText + "]");

            if (xmlNodes.length != 0) {
                var f = oXmlDoc.documentElement.removeChild(xmlNodes.item(0));
                f.selectSingleNode("Selected").text = 0;
                oXmlDoc.childNodes[0].appendChild(f);
                strChk = oXmlDoc.xml;

            }
        }
    }
    strChk = strChk.replace("<Root>", "");
    strChk = strChk.replace("</Root>", "");

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!