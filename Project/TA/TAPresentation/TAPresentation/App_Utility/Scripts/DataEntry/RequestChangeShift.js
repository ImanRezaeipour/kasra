
var oXmlData = new ActiveXObject("Microsoft.XMLDOM")

oXmlData.async = "false";
oXmlData.loadXML($get(MasterObj + 'txtXml').value)
document.getElementsByTagName("body")[0].scroll = "no";
//-----------------------------------------------
$get(MasterObj + "txtSave").value = "<Root></Root>";
$get("OToolBar_TDTopToolBar").style.display = "none";

if ($get(MasterObj + "txtPCode").value != "")
    BindStruct();
//GetAccessBtn();
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//----------------------------------------------------
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
function EndRequestHandler(sender, args) {
    //GetAccessBtn();
    if ($get(MasterObj + "txtSubmit").value == "Refresh") {
        $get(MasterObj + 'txtSave').value = "<Root/>";
        BindStruct();
    }
    else if ($get(MasterObj + "txtSubmit").value == "Save") {
        alert($get(MasterObj + "txtAlert").value);
        if ($get(MasterObj + "txtValidate").value == 1) {
            $get(MasterObj + "TxtDescript").value = "";
            $get(MasterObj + 'txtSave').value = "<Root/>";
            BindStruct();
        }
    }
}
//-=====================================================
function OnClickBtnNew() {
    document.getElementById(MasterObj + "CmbPerson_txtCode").value = ""
    document.getElementById(MasterObj + "CmbPerson_txtName").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtYear").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtMonth").value = ""
    document.getElementById(MasterObj + "KCalSDate_txtDay").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtYear").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtMonth").value = ""
    document.getElementById(MasterObj + "KCalEDate_txtDay").value = ""
    $get(MasterObj + "KCalSDate_txtCalendar").value = ""
    $get(MasterObj + "KCalEDate_txtCalendar").value = ""
    $get(MasterObj + "TxtDescript").value = ""
}
//====================================================
function OnClickBtnFilter() {
    $get(MasterObj + "txtPCode").value = $get(MasterObj + "CmbPerson_txtCode").value;
    $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    if ($get(MasterObj + "txtSDate").value == "//") {
        alert("لطفا تاريخ را وارد کنيد")
        $get(MasterObj + "KCalSDate_txtCalendar").focus();
    }
    else if ($get(MasterObj + "txtEDate").value == "//") {
        alert("لطفا تاريخ را وارد کنيد")
        $get(MasterObj + "KCalEDate_txtCalendar").focus();
    } else {
        $get(MasterObj + "txtSubmit").value = "Refresh";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//================================================
function BindStruct() {
    DeleteGrid();
    oXmlData.loadXML($get(MasterObj + 'txtXml').value)
    MakeHeader();
    var XmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/DateStructure")

    var XmlNodesIntval;
    var intval = 1;
    var Flag = true;
    if (XmlNodes.length > 0) {
        while (Flag) {
            XmlNodesIntval = oXmlData.documentElement.selectNodes("/DataEntryEntity/DateStructure[Intval=" + intval + "]");
            if (XmlNodesIntval.length > 0)
                AddToGrid(XmlNodesIntval);
            else Flag = false;
            intval++;
        }
    }
}
//=================================================
function DeleteGrid() {
    while (XtableStruct.rows.length > 0)
        XtableStruct.deleteRow();
    while (XtableHeader.rows.length > 0)
        XtableHeader.deleteRow();
}
//=============================================
function MakeHeader() {
    var Row = XtableHeader.insertRow();
    Row.insertCell();
    Row.cells(0).innerHTML = "<div style='width:80px;' align='center'> تاريخ</div>";
    Row.cells(0).align = "center";
    Row.cells(0).style.width = "80px";
    Row.cells(0).className = "CssHeaderStyle";
    var XmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/DataHeader")
    for (var i = 1; i <= XmlNodes.length; i++) {
        Row.insertCell();
        Row.cells(i).className = "CssHeaderStyle";
        Row.cells(i).innerHTML = "<div style'width:100px;' align='center' InstanceID=" + XmlNodes[i - 1].selectSingleNode("InstanceID").text + "> " + XmlNodes[i - 1].selectSingleNode("Name").text + "</div>"
        Row.cells(i).style.width = "100px";
    }
}
//================================================
function AddToGrid(XmlNode) {
    var Orow = XtableStruct.insertRow();
    Orow.insertCell();
    Orow.cells(0).innerText = XmlNode[0].selectSingleNode("Date").text.substr(6, 2) + "/" + XmlNode[0].selectSingleNode("Date").text.substr(3, 2) + "/" + XmlNode[0].selectSingleNode("Date").text.substr(0, 2);
    Orow.cells(0).style.width = "80px";
    Orow.cells(0).align = "center";
    var Len = XmlNode.length;
    for (var i = 0; i < Len; i++) {
        Orow.insertCell();
        $get(MasterObj + "CmbStruct").value = XmlNode[i].selectSingleNode("SID").text;
        if (XmlNode[i].selectSingleNode("Curr").text == 1)
            Orow.cells(i + 1).innerHTML += "<img style='cursor:pointer'  src='../../App_Utility/Images/Icons/default_phase_icon.gif' onclick='onclickImg(" + XmlNode[i].selectSingleNode("WFDocID").text + "," + XmlNode[i].selectSingleNode("DocID").text + ")' />";
        else if (XmlNode[i].selectSingleNode("ISChange").text == 1)
            Orow.cells(i + 1).innerHTML += "<img style='cursor:pointer'  src='../../App_Utility/Images/Icons/BlueTick.gif' onclick='onclickImg(" + XmlNode[i].selectSingleNode("WFDocID").text + "," + XmlNode[i].selectSingleNode("DocID").text + ")' />";
        var Flag = XmlNode[i].selectSingleNode("Flag").text;
        Orow.cells(i + 1).innerHTML += "<select class='TxtControls' style='width:170px'  " + (Flag == 1 ? "" : "disabled") + " onchange='onchangeCmbStruct(this)'  >" + $get(MasterObj + "CmbStruct").innerHTML + "</select> ";
        Orow.cells(i + 1).style.width = "100px";
        Orow.cells(i + 1).align = "center";
    }
}
//====================================================
function onchangeCmbStruct(Obj) {

    var oXmlSave = new ActiveXObject("Microsoft.XMLDOM")
    oXmlSave.async = "false";
    oXmlSave.loadXML($get(MasterObj + 'txtSave').value)

    var Instance = Obj.parentElement.cellIndex;
    Instance = XtableHeader.rows(0).cells(Instance).firstChild.InstanceID;

    var Cell = Obj.parentElement.parentElement.cells(0);
    var SDate = Cell.innerText;
    var Date = SDate.substr(6, 2) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2);
    var Str = "<Root><TB><D>" + Date + "</D><SID>" + Obj.value + "</SID><Instance>" + Instance + "</Instance></TB></Root>";
    var XmlNodeNew = oXmlSave.documentElement.selectNodes("/Root/TB[D='" + Date + "' and Instance=" + Instance + "]");
    var XmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/DateStructure[Date='" + Date + "' and Flag=1 and InstanceID=" + Instance + "]");

    if (XmlNodeNew.length > 0) {
        oXmlSave.childNodes[0].removeChild(XmlNodeNew.item(0));
        Obj.parentElement.className = "";
        var XmlNodeNew1 = oXmlSave.documentElement.selectNodes("/Root/TB[D='" + Date + "']");
        if (XmlNodeNew1.length == 0) {
            Cell.style.color = "#000066";
        }
    }
    if (XmlNodes[0].selectSingleNode("SID").text != Obj.value) {
        var oXml = new ActiveXObject("Microsoft.XMLDOM")
        oXml.async = "false";
        oXml.loadXML(Str)
        var XmlNodeTemp = oXml.documentElement.selectNodes("/Root/TB");

        oXmlSave.childNodes[0].appendChild(XmlNodeTemp[0]);
        Cell.style.color = "green";
        Obj.parentElement.className = "ChangedCell";
    }

    $get(MasterObj + 'txtSave').value = oXmlSave.xml;
}
//===============================
function OnClickBtnSave() {
    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML("<Root/>")

    var oXmlSave = new ActiveXObject("Microsoft.XMLDOM")
    oXmlSave.async = "false";
    oXmlSave.loadXML($get(MasterObj + 'txtSave').value)
    if (oXmlSave.xml != oXml.xml) {
        $get(MasterObj + "txtSubmit").value = "Save";
        $get(MasterObj + "BtnSubmit").click();
    }
    else alert("موردي براي ذخيره وجود ندارد")
}
//=====================================================
function onclickImg(WFDocID, DocID) {
     window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}
//===================================================