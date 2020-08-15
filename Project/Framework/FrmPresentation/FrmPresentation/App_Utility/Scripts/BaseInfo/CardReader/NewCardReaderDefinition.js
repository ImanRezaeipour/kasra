var vConnectionType = 3//"Ethernet"
var vComPort = 2
var vBaudRate = 7 // 115200
var vBlkLen = 4// 4000
var vBaudAdjust = 2
var vUseOnceConnect = 1
var vViaMaster = 1
var vViaType = 2
var vDontUseTapi = 1
var vTimeOut = 2000
var vMaxRetry = 3
var vPlayBeep = 2
var PressBtnNew = 0
//----------------------------------
window.name = "NewCardReaderDefinition"
aspnetForm.target = "NewCardReaderDefinition"
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var flagEditOrIns = false;
var PropertyTable = document.getElementById("PropertyTable");
var cmbBrandName = document.getElementById(MasterObj + "cmbBrandName");
//=================================================================================

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {
    window.returnValue = 0;
}
////==================================================================================
function EndRequestHandler(sender, args) {

    var StrVal = $get(MasterObj + "txtSubmit").value;


    if (StrVal == "Save") {
        SetMsg($get(MasterObj + "txtAlert").value);
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtSubmit").value = "";
        PressBtnNew = 0
        window.returnValue = document.getElementById(MasterObj + "txtCardReaderID").value
    }
}

//===============================================================

OnLoad();
function OnLoad() {

    // در صورتی که صفحه مودال برای درج اطلاعات جدید باز شده باشد
    if (document.getElementById(MasterObj + "txtmodalPageStatus").value == 0) {
        PressBtnNew = 1
        for (var i = 1; i < PropertyTable.rows.length - 1; i++) {
            PropertyTable.rows[i].cells[0].firstChild.style.visibility = "hidden";
            PropertyTable.rows[i].cells[1].firstChild.style.visibility = "hidden";
        }
    }
    else { // در صورتی که صفحه مودال به منظور ویرایش اطلاعات باز شده باشد
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";

        oXmlDoc.loadXML($get(MasterObj + "XMLCardReaderInfo").value);
        var root = oXmlDoc.documentElement;
        $get(MasterObj + "cmbBrandName").value = root.selectSingleNode("BrandNameCode").text
        cmbBrandNameOnchange($get(MasterObj + "cmbBrandName"))

        $get(MasterObj + "txteCardReaderName").value = root.selectSingleNode("Name").text
        $get(MasterObj + "txtCardReaderCode").value = root.selectSingleNode("Code").text
        $get(MasterObj + "txtLocation").value = root.selectSingleNode("Location").text

        if (root.selectSingleNode("Active").text == "1")
            $get(MasterObj + "rdoActive").checked = true
        else
            $get(MasterObj + "rdoInActive").checked = true

        $get(MasterObj + "txtCardReaderNo").value = root.selectSingleNode("CardReaderNo").text
        $get("txtComPort").value = root.selectSingleNode("Com").text

        $get(MasterObj + "cmbBaudRate").value = root.selectSingleNode("BuadRate").text

        if (root.selectSingleNode("BrandNameCode").text == "2") {
            $get(MasterObj + "cmbDeviceType").value = root.selectSingleNode("Device").text
            onchangeCmbDeviceType($get(MasterObj + "cmbDeviceType"))
            $get(MasterObj + "cmbSystem").value = root.selectSingleNode("System").text
            $get("txtIPAddress").value = root.selectSingleNode("IP").text
            $get(MasterObj + "cmbBlkLen").value = root.selectSingleNode("BlkLen").text
            $get(MasterObj + "cmbBaudAdjust").selectedIndex = (root.selectSingleNode("BaudAdjust").text == "True") ? 2 : 1
            $get(MasterObj + "cmbUseOnceConnect").selectedIndex = (root.selectSingleNode("UseOnceConnect").text == "True") ? 2 : 1
            $get(MasterObj + "cmbViaMaster").selectedIndex = (root.selectSingleNode("ViaMaster").text == "True") ? 2 : 1
            $get(MasterObj + "cmbViaType").selectedIndex = (root.selectSingleNode("ViaType").text == "True") ? 2 : 1
            $get(MasterObj + "cmbDontUseTapi").selectedIndex = (root.selectSingleNode("DontUseTapi").text == "True") ? 2 : 1
            $get("txtTimeOut").value = root.selectSingleNode("TimeOut").text
            $get("txtMaxRetry").value = root.selectSingleNode("MaxRetry").text
            $get(MasterObj + "cmbPlayBeep").selectedIndex = (root.selectSingleNode("PlayBeep").text == "True") ? 2 : 1
        }

        if (root.selectSingleNode("BrandNameCode").text == "1")
            $get(MasterObj + "cmbSystem").value = root.selectSingleNode("ConnectionTypeID").text

        $get("cmbConnectionType").value = root.selectSingleNode("ConnectionTypeID").text
    }
}
// وقتی دکمۀ ذخیره کلیک شود __________________________________________________________________________
function OnClickBtnSave() {
    var cmbBrandName = $get(MasterObj + "cmbBrandName");
    var txteCardReaderName = $get(MasterObj + "txteCardReaderName");
    var txtCardReaderCode = $get(MasterObj + "txtCardReaderCode");
    var oTable = document.getElementById("PropertyTable");

    var flag = 0 // در صورتی که همه پارامترها پر باشند، 0 در غیر اینصورت 1 می باشد 

    if (cmbBrandName.value == "" || txteCardReaderName.value == "" || txtCardReaderCode.value == "")
        flag = 1

    else {
        if (cmbBrandName.value == 1) {
            for (var i = 1; i < 5; i++) {
                if (oTable.rows(i).cells(1).firstChild.getAttribute("type") == "text" && oTable.rows(i).cells(1).firstChild.value == "")
                    flag = 1
                else if (oTable.rows(i).cells(1).firstChild.getAttribute("type") == "select-one" && oTable.rows(i).cells(1).firstChild.value == 0)
                    flag = 1
            }
        }
        else if (cmbBrandName.value == 4) {
            for (var i = 1; i < oTable.rows.length - 1; i++) {
                if (oTable.rows(i).cells(1).firstChild.getAttribute("type") == "text" && oTable.rows(i).cells(1).firstChild.value == "")
                    flag = 1
                else if (oTable.rows(i).cells(1).firstChild.getAttribute("type") == "select-one" && oTable.rows(i).cells(1).firstChild.value == 0)
                    flag = 1
            }
        }
    }

    if (flag == 1) {
        alert("وارد کردن همه موارد الزامی است");
        return
    }
    if ($get(MasterObj + "cmbSystem").value == "" || $get(MasterObj + "cmbSystem").value == 0) {
        alert('لطفا مدل را وارد کنید')
        return
    }
    if (cmbBrandName.value != 0) {
        //var CardReaderNo = $get("txtCardReaderNo").value
        //var ConnectionType = $get(MasterObj + "cmbConnectionType").options[$get(MasterObj + "cmbConnectionType").selectedIndex].text
        var ComPort = $get("txtComPort").value
        var BaudRate = $get(MasterObj + "cmbBaudRate").options[$get(MasterObj + "cmbBaudRate").selectedIndex].text

        var xmlStr = "<Root>"
        xmlStr += "<ConnectionProperty>"
        //xmlStr += "<CardReaderNo>" + CardReaderNo + "</CardReaderNo>"
        //xmlStr += "<ConnectionTypeID>" + ConnectionType + "</ConnectionTypeID>"
        xmlStr += "<Com>" + ComPort + "</Com>"
        xmlStr += "<BuadRate>" + BaudRate + "</BuadRate>"
        if (cmbBrandName.value == 1) {
            var TRT = $get(MasterObj + "txtCardReaderNo").value;
            var RsProtocol = document.getElementById("cmbConnectionType").options[document.getElementById("cmbConnectionType").selectedIndex].text;
            xmlStr += "<TRT>" + TRT + "</TRT>"
            xmlStr += "<RsProtocol>" + RsProtocol + "</RsProtocol>"
        }

        if (cmbBrandName.value == 2) {
            var IP = $get("txtIPAddress").value
            var Device = $get(MasterObj + "cmbDeviceType").options[$get(MasterObj + "cmbDeviceType").selectedIndex].text
            //                    if (Device == "PW1xxx")
            //                        System = $get(MasterObj + "cmbSystem").options[$get(MasterObj + "cmbSystem").selectedIndex].text
            //                    else
            //                        System = ""
            var System = $get(MasterObj + "cmbSystem").options[$get(MasterObj + "cmbSystem").selectedIndex].text
            var BlkLen = $get(MasterObj + "cmbBlkLen").options[$get(MasterObj + "cmbBlkLen").selectedIndex].text
            var BaudAdjust = $get(MasterObj + "cmbBaudAdjust").options[$get(MasterObj + "cmbBaudAdjust").selectedIndex].text
            var UseOnceConnect = $get(MasterObj + "cmbUseOnceConnect").options[$get(MasterObj + "cmbUseOnceConnect").selectedIndex].text
            var ViaMaster = $get(MasterObj + "cmbViaMaster").options[$get(MasterObj + "cmbViaMaster").selectedIndex].text
            var ViaType = $get(MasterObj + "cmbViaType").options[$get(MasterObj + "cmbViaType").selectedIndex].text
            var DontUseTapi = $get(MasterObj + "cmbDontUseTapi").options[$get(MasterObj + "cmbDontUseTapi").selectedIndex].text
            var TimeOut = $get("txtTimeOut").value
            var MaxRetry = $get("txtMaxRetry").value
            var PlayBeep = $get(MasterObj + "cmbPlayBeep").options[$get(MasterObj + "cmbPlayBeep").selectedIndex].text

            xmlStr += "<IP>" + IP + "</IP>"
            xmlStr += "<Device>" + Device + "</Device>"
            xmlStr += "<System>" + System + "</System>"
            xmlStr += "<BlkLen>" + BlkLen + "</BlkLen>"
            xmlStr += "<BaudAdjust>" + BaudAdjust + "</BaudAdjust>"
            xmlStr += "<UseOnceConnect>" + UseOnceConnect + "</UseOnceConnect>"
            xmlStr += "<ViaMaster>" + ViaMaster + "</ViaMaster>"
            xmlStr += "<ViaType>" + ViaType + "</ViaType>"
            xmlStr += "<DontUseTapi>" + DontUseTapi + "</DontUseTapi>"
            xmlStr += "<TimeOut>" + TimeOut + "</TimeOut>"
            xmlStr += "<MaxRetry>" + MaxRetry + "</MaxRetry>"
            xmlStr += "<PlayBeep>" + PlayBeep + "</PlayBeep>"
        }
        xmlStr += "</ConnectionProperty>"
        xmlStr += "</Root>"

        document.getElementById(MasterObj + "xmlStr").value = xmlStr
        document.getElementById(MasterObj + "txtConnectionType").value = document.getElementById("cmbConnectionType").options[document.getElementById("cmbConnectionType").selectedIndex].value
        document.getElementById(MasterObj + "txtSystem").value = document.getElementById(MasterObj + "cmbSystem").options[document.getElementById(MasterObj + "cmbSystem").selectedIndex].value

        $get(MasterObj + "txtSubmit").value = "Save";
        $get(MasterObj + "btnSubmit").click();
    }
}
//__________________________________________________________________________________________________
function OnBlurTxtCardReaderNo(obj) {
    document.getElementById(MasterObj + "txtCardReaderCode").value = obj.value

}
// وقتی دکمۀ جدید کلیک شود__________________________________________________________________________
function OnClickBtnNew() {
    PressBtnNew = 1
    var PropertyTable = document.getElementById("PropertyTable");
    var PropertyTableLength = PropertyTable.rows.length

    if ($get(MasterObj + "cmbBrandName").getAttribute("disabled") == "disabled")
        $get(MasterObj + "cmbBrandName").removeAttribute("disabled")

    $get(MasterObj + "txtCardReaderID").value = "0"
    $get(MasterObj + "cmbBrandName").value = "0"
    $get(MasterObj + "txteCardReaderName").value = ""
    $get(MasterObj + "txtCardReaderCode").value = ""
    $get(MasterObj + "txtLocation").value = ""
    $get(MasterObj + "rdoActive").checked = true

    for (var i = 1; i < PropertyTableLength - 1; i++) {
        if (PropertyTable.rows(i).cells(1).firstChild.getAttribute("type") == "text")
            PropertyTable.rows(i).cells(1).firstChild.value = "";
        else if (PropertyTable.rows(i).cells(1).firstChild.getAttribute("type") == "select-one")
            PropertyTable.rows(i).cells(1).firstChild.value = 0

        PropertyTable.rows[i].cells[0].firstChild.style.visibility = "hidden";
        PropertyTable.rows[i].cells[1].firstChild.style.visibility = "hidden";
    }
    //------------------------------


    cmbSystem = document.getElementById(MasterObj + "cmbSystem")
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "XMLcmbSystem").value);
    cmbSystem.innerHTML = ""
    var XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[STitle=2]");

    var optionEl;
    optionEl = document.createElement("OPTION")
    cmbSystem.options.add(optionEl)
    cmbSystem.all(0).innerText = "انتخاب نشده";
    cmbSystem.all(0).value = 0;

    for (var i = 0; i < XmlNodes.length; i++) {
        optionEl = document.createElement("OPTION")
        cmbSystem.options.add(optionEl)
        cmbSystem.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
        cmbSystem.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
    }
    //------------------------------

}
//_______________________________________________________________________________________________
function SetDefualt() {
    $get("cmbConnectionType").value = vConnectionType
    $get("txtComPort").value = vComPort
    $get(MasterObj + "cmbBaudRate").value = vBaudRate
    $get(MasterObj + "cmbBlkLen").value = vBlkLen
    $get(MasterObj + "cmbBaudAdjust").selectedIndex = vBaudAdjust
    $get(MasterObj + "cmbUseOnceConnect").selectedIndex = vUseOnceConnect
    $get(MasterObj + "cmbViaMaster").selectedIndex = vViaMaster
    $get(MasterObj + "cmbViaType").selectedIndex = vViaType
    $get(MasterObj + "cmbDontUseTapi").selectedIndex = vDontUseTapi
    $get("txtTimeOut").value = vTimeOut
    $get("txtMaxRetry").value = vMaxRetry
    $get(MasterObj + "cmbPlayBeep").selectedIndex = vPlayBeep

}
//_______________________________________________________________________________________________
function ClearAll() {
    $get("cmbConnectionType").value = 0
    $get("txtComPort").value = ""
    $get(MasterObj + "cmbBaudRate").value = 0
    $get(MasterObj + "cmbBlkLen").value = 0
    $get(MasterObj + "cmbBaudAdjust").selectedIndex = 0
    $get(MasterObj + "cmbUseOnceConnect").selectedIndex = 0
    $get(MasterObj + "cmbViaMaster").selectedIndex = 0
    $get(MasterObj + "cmbViaType").selectedIndex = 0
    $get(MasterObj + "cmbDontUseTapi").selectedIndex = 0
    $get("txtTimeOut").value = ""
    $get("txtMaxRetry").value = ""
    $get(MasterObj + "cmbPlayBeep").selectedIndex = 0
}
//_______________________________________________________________________________________________

// وقتی دکمۀ انصراف کلیک شود________________________________________________________________________
function OnClickBtnCancel() {
    window.close();
}
//__________________________________________________________________________________________________

// ی 'شرکت سازنده' تغییر کندCombo وقتی ________________________________________________________________________
function cmbBrandNameOnchange(object) {

    var cmbConnectionType = document.getElementById("cmbConnectionType");
    var cmbSystem = document.getElementById(MasterObj + "cmbSystem");

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    var XmlNodes

    cmbConnectionType.innerHTML = ""
    var optionEl;
    //            optionEl = document.createElement("OPTION")
    //            cmbConnectionType.options.add(optionEl)
    //            cmbConnectionType.all(0).innerText = "انتخاب نشده";
    //            cmbConnectionType.all(0).value = 0;

    cmbSystem.innerHTML = ""
    var optionEl;
    optionEl = document.createElement("OPTION")
    cmbSystem.options.add(optionEl)
    cmbSystem.all(0).innerText = "انتخاب نشده";
    cmbSystem.all(0).value = 0;
    var oTable = document.getElementById("PropertyTable");
    //if (cmbBrandName.options[cmbBrandName.selectedIndex].value == 0) {

    if (object.value == 0) {
        if (PressBtnNew == 1)
            ClearAll()
        for (var i = 1; i < PropertyTable.rows.length - 1; i++) {
            PropertyTable.rows[i].cells[0].firstChild.style.visibility = "hidden";
            PropertyTable.rows[i].cells[1].firstChild.style.visibility = "hidden";
        }

    } // علم و صنعت ---------------------------------------------------------------
    //else if (object.options[object.selectedIndex].value == 1) {
    else if (object.value == 1) {
        if (PressBtnNew == 1)
            ClearAll()

        for (var i = 1; i < 6; i++) {
            oTable.rows[i].cells[0].firstChild.style.visibility = "visible";
            oTable.rows[i].cells[1].firstChild.style.visibility = "visible";
        }

        for (var i = 6; i < oTable.rows.length - 1; i++) {
            oTable.rows[i].cells[0].firstChild.style.visibility = "hidden";
            oTable.rows[i].cells[1].firstChild.style.visibility = "hidden";
        }
        oXmlDoc.loadXML($get(MasterObj + "XMLcmbSystem").value);
        XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[STitle=1]");

        for (var i = 0; i < XmlNodes.length; i++) {
            optionEl = document.createElement("OPTION")
            cmbSystem.options.add(optionEl)
            cmbSystem.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
            cmbSystem.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
        }
        oXmlDoc.loadXML($get(MasterObj + "XMLcmbConnectionType").value);
        XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[Val<3]");

        if (XmlNodes != null) {
            for (var i = 0; i < XmlNodes.length; i++) {
                optionEl = document.createElement("OPTION")
                cmbConnectionType.options.add(optionEl)
                cmbConnectionType.all(i).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
                cmbConnectionType.all(i).value = XmlNodes.item(i).selectSingleNode('Val').text;
            }
        }

    } // دنیای پردازش --------------------------------------------------------------
    //else if (object.options[object.selectedIndex].value == 2) {
    else if (object.value == 2) {

        for (var i = 1; i < oTable.rows.length - 1; i++) {
            oTable.rows[i].cells[0].firstChild.style.visibility = "visible";
            oTable.rows[i].cells[1].firstChild.style.visibility = "visible";
        }


        optionEl = document.createElement("OPTION")
        cmbConnectionType.options.add(optionEl)
        cmbConnectionType.all(0).innerText = "انتخاب نشده";
        cmbConnectionType.all(0).value = 0;

        oXmlDoc.loadXML($get(MasterObj + "XMLcmbSystem").value);
        XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[STitle=2]");

        for (var i = 0; i < XmlNodes.length; i++) {
            optionEl = document.createElement("OPTION")
            cmbSystem.options.add(optionEl)
            cmbSystem.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
            cmbSystem.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
        }


        oXmlDoc.loadXML($get(MasterObj + "XMLcmbConnectionType").value);
        XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[Val>2]");

        if (XmlNodes != null) {
            for (var i = 0; i < XmlNodes.length; i++) {
                optionEl = document.createElement("OPTION")
                cmbConnectionType.options.add(optionEl)
                cmbConnectionType.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
                cmbConnectionType.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
            }
        }
        if (PressBtnNew == 1)
            SetDefualt()
    } //------------------------------------------------------------------------------


}
//__________________________________________________________________________________________________
function onchangeCmbDeviceType(object) {
    cmbSystem = document.getElementById(MasterObj + "cmbSystem")

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "XMLcmbSystem").value);
    cmbSystem.innerHTML = ""

    var optionEl;
    optionEl = document.createElement("OPTION")
    cmbSystem.options.add(optionEl)
    cmbSystem.all(0).innerText = "انتخاب نشده";
    cmbSystem.all(0).value = 0;
    if (object.options[object.selectedIndex].text == "PW1xxx") {
        var XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[STitle=2]");
        for (var i = 0; i < XmlNodes.length; i++) {
            optionEl = document.createElement("OPTION")
            cmbSystem.options.add(optionEl)
            cmbSystem.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
            cmbSystem.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
        }
    }
    else if (object.options[object.selectedIndex].text == "JT1xxx") {

        var XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[Val=5]")
        for (var i = 0; i < XmlNodes.length; i++) {
            optionEl = document.createElement("OPTION")
            cmbSystem.options.add(optionEl)
            cmbSystem.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
            cmbSystem.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
        }
    }
}
//__________________________________________________________________________________________________
        