Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {

}

function EndRequestHandler(sender, args) {

    if (document.getElementById(MasterObj + "txtAlert").value != "") {
        if (document.getElementById(MasterObj + "txtValidate").value == 0)
            alert($get(MasterObj + "txtAlert").value);
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
            returnValue = 1
        }
        document.getElementById(MasterObj + "txtAlert").value = ""
    }
    if (document.getElementById(MasterObj + "txtAlertSp").value != "") {
        alert($get(MasterObj + "txtAlertSp").value);
        document.getElementById(MasterObj + "txtAlertSp").value = ""
    }

    var StrVal = $get(MasterObj + "txtSubmit").value
    document.getElementById(MasterObj + "txtQuery").value = document.getElementById(MasterObj + "txtGetQuery").value
    $get(MasterObj + "txtSubmit").value = ""
    if (StrVal == "Filter") {
        LoadData()
    }
    else if (StrVal == "Save" && SaveDesignMode == 1) {
        SaveDesignMode = 0
        RedirectToDeDesign()
    }
    else if (StrVal == "OnChangeCmbPages")
        LoadGrdPageParam()
    $get(MasterObj + "txtSubmit").value = ""
}


var MasterObj = "ctl00_ContentPlaceHolder1_", LastSelectedRowGrdParam = null, LastSelectedRowClassGrdParam = ""
        , GrdNewParamLastSelectedRow = null, GrdNewParamLastSelectedRowClass = "", GrdNewParamRowIdx = -1;

var LastSelectedRowGrdField = null, LastSelectedRowClassGrdField = ""
        , GrdNewFieldLastSelectedRow = null, GrdNewFieldLastSelectedRowClass = "", GrdNewFieldRowIdx = -1;

var VariableTypeID = 10 //شناسه تايپ کمبو
var nGrdNewParam = "GrdNewParam", nGrdNewField = "GrdNewField"
var SaveDesignMode = 0
var GrdPageParamRowIdx = 0;
//*******************************************************************************
LoadData()
document.dir = "RTL"
//*******************************************************************************
function OnClickGrdParam(SelectedRow) {
    if (LastSelectedRowGrdParam != null) {
        LastSelectedRowGrdParam.className = LastSelectedRowClassGrdParam;
    }
    LastSelectedRowClassGrdParam = SelectedRow.className;
    LastSelectedRowGrdParam = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OndbClickGrdParam() {
    OnClickBtnAddItem(nGrdNewParam);
}
//*******************************************************************************
function OnClickGrdField(SelectedRow) {
    if (LastSelectedRowGrdField != null) {
        LastSelectedRowGrdField.className = LastSelectedRowClassGrdField;
    }
    LastSelectedRowClassGrdField = SelectedRow.className;
    LastSelectedRowGrdField = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OndbClickGrdField() {
    OnClickBtnAddItem(nGrdNewField);
}
//*******************************************************************************
function OnClickBtnAddItem(GrdName) {

    if (GrdName == nGrdNewParam) {
        if (LastSelectedRowGrdParam != null) {
            var oGrdParam = document.getElementById("GrdParam")
            var oGrdNewParam = document.getElementById("GrdNewParam")
            if (!oGrdParam || !oGrdNewParam) //If No Row
                return

            if (oGrdNewParam.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdParam.getAttribute("Parameter_Name")))//If Add Befor
                return

            AddRow_GrdNewParam(0,
                                        LastSelectedRowGrdParam.getAttribute("TypeID")
                                        , LastSelectedRowGrdParam.getAttribute("Size")
                                        , LastSelectedRowGrdParam.getAttribute("Parameter_Name")
                                        , LastSelectedRowGrdParam.getAttribute("Parameter_Name"), 0, "", "", "", "", 1)

        }
    }
    else if (GrdName == nGrdNewField) {
        if (LastSelectedRowGrdField != null) {
            var oGrdField = document.getElementById("GrdField")
            var oGrdNewField = document.getElementById("GrdNewField")
            if (!oGrdField || !oGrdNewField) //If No Row
                return

            if (oGrdNewField.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdField.getAttribute("Parameter_Name")))//If Add Befor
                return

            AddRow_GrdNewField(0
                                        , LastSelectedRowGrdField.getAttribute("Parameter_Name")
                                        , LastSelectedRowGrdField.getAttribute("Parameter_Name")
                                        , 0
                                        , LastSelectedRowGrdField.getAttribute("TypeID")
                                        , "", "", "", "", "", LastSelectedRowGrdField.getAttribute("Size"), 1, "",0)

        }
    }

}
//*******************************************************************************
function OnClickBtnDelItem(GrdName) {
    if (GrdName == nGrdNewParam) {
        var oGrdNewParam = document.getElementById("GrdNewParam")
        if (GrdNewParamLastSelectedRow == null)
            return
        oGrdNewParam.deleteRow(GrdNewParamLastSelectedRow.rowIndex)
        GrdNewParamRowIdx--;
        GrdNewParamLastSelectedRow = null
        SetRowStyle(GrdName)
    }
    else if (GrdName == nGrdNewField) {
        var oGrdNewField = document.getElementById("GrdNewField")
        if (GrdNewFieldLastSelectedRow == null)
            return
        oGrdNewField.deleteRow(GrdNewFieldLastSelectedRow.rowIndex)
        GrdNewFieldRowIdx--;
        GrdNewFieldLastSelectedRow = null
        SetRowStyle(GrdName)
    }
}
//*******************************************************************************
function OnClickBtnDelAllItem(GrdName) {
    ClearGrd(GrdName)
}
//*******************************************************************************
function OnClickBtnAddAllItem(GrdName) {
    ClearGrd(GrdName)
    if (GrdName == nGrdNewParam) {
        var oGrdParam = document.getElementById("GrdParam")
        if (!oGrdParam)
            return
        var len = oGrdParam.rows.length
        for (var i = 1; i < len; i++) {

            AddRow_GrdNewParam(0
                                        , oGrdParam.rows(i).getAttribute("TypeID")
                                        , oGrdParam.rows(i).getAttribute("Size")
                                        , oGrdParam.rows(i).getAttribute("Parameter_Name")
                                        , oGrdParam.rows(i).getAttribute("Parameter_Name"), 0, "", "", "", "", 1
                                        )
        }
    }
    else if (GrdName == nGrdNewField) {
        var oGrdField = document.getElementById("GrdField")
        if (!oGrdField)
            return
        var len = oGrdField.rows.length
        for (var i = 1; i < len; i++) {
            AddRow_GrdNewField(0, oGrdField.rows(i).getAttribute("Parameter_Name")
                                        , oGrdField.rows(i).getAttribute("Parameter_Name")
                                        , 0
                                        , oGrdField.rows(i).getAttribute("TypeID")
                                        , "", "", "", "", ""
                                        , oGrdField.rows(i).getAttribute("Size")
                                        , 1, "",0
                                        )
        }
    }
}
//*******************************************************************************
function AddRow_GrdNewParam(ID, TypeID, Size, Name, Caption, DisplayTypeID, DefaultValue
                                    , LookupName, LookupValue, LookupParam, Editable) {

    var oGrdNewParam = document.getElementById("GrdNewParam")
    oGrdNewParam.insertRow();
    GrdNewParamRowIdx++;

    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()

    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()

    if (GrdNewParamRowIdx % 2 == 0)
        oGrdNewParam.rows(GrdNewParamRowIdx).className = "CssItemStyle"
    else
        oGrdNewParam.rows(GrdNewParamRowIdx).className = "CssAlternatingItemStyle"

    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("TypeID", TypeID)//oRow.getAttribute("TypeID")
    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("Size", Size)//oRow.getAttribute("Size")
    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("Name", Name)// oRow.getAttribute("Parameter_Name")
    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("ParamID", ID)

    var strName = ""

    if (Name.length > 10)
        strName = Name.substr(0, 7) + "..."
    else
        strName = Name

    var strCheck = "checked"
    if (Editable == 0)
        strCheck = ""

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(0).innerHTML = "<INPUT type='CheckBox' " + strCheck + "  style='WIDTH:60px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).innerHTML = strName
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).title = Name
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(2).innerHTML = "<INPUT type='text' class='txtControls' value='" + Caption + "' style='WIDTH:100px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).innerHTML = CreatCombo(nGrdNewParam, TypeID)

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(4).innerHTML = "<INPUT type='text' class='txtControls' value='" + DefaultValue + "' style='WIDTH:60px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(5).innerHTML = "<INPUT type='text' class='txtControls' value='" + LookupName + "' style='WIDTH:70px' disabled/>"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(6).innerHTML = "<INPUT type='text' class='txtControls' value='" + LookupValue + "' style='WIDTH:70px' disabled/>"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(7).innerHTML = "<INPUT type='text' class='txtControls' value='" + LookupParam + "' style='WIDTH:70px' disabled />"

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).firstChild.value = DisplayTypeID
    OnChangeCmbNewParam(oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).firstChild)

    oGrdNewParam.rows(GrdNewParamRowIdx).align = "center"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(0).style.width = "30px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).style.width = "160px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(2).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(4).style.width = "60px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(5).style.width = "75px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(6).style.width = "75px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(7).style.width = "75px"
}
//*******************************************************************************
function ClearGrd(GrdName) {
    if (GrdName == nGrdNewParam) {
        var oGrdNewParam = document.getElementById("GrdNewParam")
        var len = oGrdNewParam.rows.length
        for (var i = 0; i < len; i++) {
            oGrdNewParam.deleteRow(0)
        }
        GrdNewParamRowIdx = -1
    }
    else if (GrdName == nGrdNewField) {
        var oGrdNewField = document.getElementById("GrdNewField")
        var len = oGrdNewField.rows.length
        for (var i = 0; i < len; i++) {
            oGrdNewField.deleteRow(0)
        }
        GrdNewFieldRowIdx = -1
    }
    else if (GrdName == "GrdPageParam") {
        var oGrdPageParam = document.getElementById("GrdPageParam")
        var len = oGrdPageParam.rows.length
        for (var i = 0; i < len; i++) {
            oGrdPageParam.deleteRow(0)
        }
        GrdPageParamRowIdx = 0
    }
}
//*******************************************************************************
function AddRow_GrdNewField(ID, Name, Caption, DisplayTypeID, TypeID, DefaultValue, LinkUrl
                                    , UrlParam, UrlParamVal, UrlFeatur, Size, Editable, Condition,IsUsed) {

    var oGrdNewField = document.getElementById("GrdNewField")
    oGrdNewField.insertRow();
    GrdNewFieldRowIdx++;
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    //            oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    //            oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()

    if (GrdNewFieldRowIdx % 2 == 0)
        oGrdNewField.rows(GrdNewFieldRowIdx).className = "CssItemStyle"
    else
        oGrdNewField.rows(GrdNewFieldRowIdx).className = "CssAlternatingItemStyle"

    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("TypeID", TypeID)

    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("Name", Name)
    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("FieldID", ID)
    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("Size", Size)


    var strName = ""
    if (Name.length > 11)
        strName = Name.substr(0, 8) + "..."
    else
        strName = Name

    var strCheck = "checked"
    if (Editable == 0)
        strCheck = ""

    var strCheckIsUsed = "checked"
    if (IsUsed == 0)
        strCheckIsUsed = ""

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).innerHTML = "<INPUT type='CheckBox' " + strCheck + " style='WIDTH:15px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).innerHTML = strName
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).title = Name
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(2).innerHTML = "<INPUT type='text' class='txtControls' value='" + Caption + "' style='WIDTH:60px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).innerHTML = CreatCombo(nGrdNewField, TypeID)

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).firstChild.value = DisplayTypeID
    if (DisplayTypeID == 0)
        oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).firstChild.value = 14
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(4).innerHTML = "<INPUT type='text' class='txtControls' value='" + DefaultValue + "' style='WIDTH:60px' />"

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).innerHTML = CreateOperandCombo()
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(6).innerHTML = "<INPUT type='text' class='txtControls' value='" + GetVal1FromCondition(Condition) + "' style='WIDTH:40px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(7).innerHTML = "<INPUT type='text' class='txtControls' value='" + GetVal2FromCondition(Condition) + "' style='WIDTH:40px' />"


    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).firstChild.value = GetValFromOperand(Condition);


    oGrdNewField.rows(GrdNewFieldRowIdx).cells(8).innerHTML = "<INPUT type='CheckBox' " + strCheckIsUsed + "  style='WIDTH:15px' />"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(9).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParam + "' style='WIDTH:75px' />"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(10).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParamVal + "' style='WIDTH:75px' />"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlFeatur + "' style='WIDTH:75px' />"

    oGrdNewField.rows(GrdNewFieldRowIdx).align = "center"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).style.width = "15px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).style.width = "110px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(2).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(4).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(6).style.width = "40px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(7).style.width = "40px"
                oGrdNewField.rows(GrdNewFieldRowIdx).cells(8).style.width = "15px"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(9).style.width = "80px"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(10).style.width = "80px"
    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).style.width = "80px"



}
//*******************************************************************************
function CheckExists(GrdName, idx) {

    if (GrdName == nGrdNewParam) {
        var oGrdParam = document.getElementById("GrdParam")
        var oGrdNewParam = document.getElementById("GrdNewParam")
        if (!oGrdParam || !oGrdNewParam)
            return
        var len = oGrdNewParam.rows.length
        for (var i = 0; i < len; i++) {
            if (oGrdNewParam.rows(i).Name == idx)
                return false
        }
    }
    else if (GrdName == nGrdNewField) {
        var oGrdField = document.getElementById("GrdField")
        var oGrdNewField = document.getElementById("GrdNewField")
        if (!oGrdField || !oGrdNewField)
            return
        var len = oGrdNewField.rows.length
        for (var i = 0; i < len; i++) {
            if (oGrdNewField.rows(i).Name == idx)
                return false
        }
    }
    return true
}
//*******************************************************************************
var oSelectedLinkRow = null
function onkeypressLink() {
    var oRow = window.event.srcElement.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    oSelectedLinkRow = oRow
    if (window.event.keyCode == 13)
        ShowPopUpLink()
}
//*******************************************************************************
var oPopup = window.createPopup()
function ShowPopUpLink() {

    var NewObj = window.event.srcElement;
    var posX = NewObj.offsetLeft;
    var posY = NewObj.offsetTop;

    while (NewObj.offsetParent) {
        posX = posX + NewObj.offsetParent.offsetLeft;
        posY = posY + NewObj.offsetParent.offsetTop;
        if (NewObj == document.getElementsByTagName('body')[0]) { break }
        else { NewObj = NewObj.offsetParent; }
    }
    document.getElementById("LinkDiv").style.top = posY ///+ 22;
    document.getElementById("LinkDiv").style.left = posX + 100
    document.getElementById("LinkDiv").style.display = "inline";

    if (oSelectedLinkRow.cells(8).firstChild.value == "")
        document.getElementById(MasterObj + "cmbPages").value = ""
    else {
        document.getElementById(MasterObj + "cmbPages").value = oSelectedLinkRow.cells(8).firstChild.value
        OnChangeCmbPages();
        ClearGrd("GrdPageParam")
        //                LoadComboCmbPages(oSelectedLinkRow.cells(9).firstChild.value, oSelectedLinkRow.cells(10).firstChild.value);
    }
}
//*******************************************************************************
function OnClickBtnLinkOk() {
    oSelectedLinkRow.cells(8).firstChild.value = document.getElementById(MasterObj + "cmbPages").value //document.getElementById(MasterObj + "cmbPages").options[document.getElementById(MasterObj + "cmbPages").selectedIndex].text;
    oSelectedLinkRow.cells(9).firstChild.value = GenerateUrlParam()
    oSelectedLinkRow.cells(10).firstChild.value = GenerateUrlParamVal()
    document.getElementById("LinkDiv").style.display = "none";
}
//        function LoadComboCmbPages(UrlParam, UrlParamVal) {
//            
//            
//        }
//*******************************************************************************
function GenerateUrlParam() {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    var Len = oGrdPageParam.rows.length, v0, v1
    var strParam = 'OnLineUser@ToPersonId@SessionID'
    for (var i = 0; i < Len; i++) {
        v0 = oGrdPageParam.rows(i).cells(0).firstChild.value
        v1 = oGrdPageParam.rows(i).cells(1).firstChild.value
        if (v0 != "0" && v0 != "" && v1 != "0" && v1 != "") {
            strParam += "@" + oGrdPageParam.rows(i).cells(0).firstChild.value
        }
    }
    return strParam
}
//*******************************************************************************
function GenerateUrlParamVal() {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    var Len = oGrdPageParam.rows.length
    var strParamVal = '3;5@3;5@3;4', v0, v1
    for (var i = 0; i < Len; i++) {
        v0 = oGrdPageParam.rows(i).cells(0).firstChild.value
        v1 = oGrdPageParam.rows(i).cells(1).firstChild.value
        if (v0 != "0" && v0 != "" && v1 != "0" && v1 != "") {
            if (oGrdPageParam.rows(i).cells(1).firstChild.tagName == "input")
                strParamVal += "@4;" + oGrdPageParam.rows(i).cells(1).firstChild.value
            else
                strParamVal += "@4;" + ((oGrdPageParam.rows(i).cells(1).firstChild.selectedIndex) - 1)
        }
    }
    return strParamVal
}
//*******************************************************************************
function OnClickBtnLinkCancel() {
    document.getElementById("LinkDiv").style.display = "none";
}
//*******************************************************************************
function CreateLinkCombo() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlMenuItems").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/TreeMainMenu[_flag=1]")
    strHtml = "<select   class='txtControls' style='width:100%'> "
    strHtml += "<option value='0'>انتخاب نشده</option>"
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("ContentPageID").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Caption").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;

}
//*******************************************************************************
function CreateOperandCombo() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand")
    strHtml = "<select  class='txtControls' style='width:60px'> "
    //            strHtml += "<option value='0'>انتخاب نشده</option>"
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;

}
//*******************************************************************************
function CreatCombo(GrdName, TypeID) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strHtml = '';
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtMappingType").value);
    //var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetVariableType");
    if (GrdName == nGrdNewParam) {
        XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMappingType[TypeID=" + TypeID + "]");
        strHtml = "<select onchange='OnChangeCmbNewParam(this)' class='txtControls' style='width:80px'> "
        strHtml += " <option value='0'>انتخاب نشده</option>"
        var len = XmlNode.length
        for (var i = 0; i < len; i++) {
            strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("MappedTypeID").text + "'>"
            strHtml += XmlNode.item(i).selectSingleNode("MappedTitle").text
            strHtml += "</option>"
        }
        strHtml += "</select>"
        return strHtml;
    }
    else if (GrdName == nGrdNewField) {
        XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetVariableType[Acronym='Link' or Acronym='Lable']");
        strHtml = " <select  class='txtControls' style='width:60px' > "
        strHtml += " <option value='0'>انتخاب نشده</option>"
        var len = XmlNode.length
        for (var i = 0; i < len; i++) {
            strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("ID").text + "'>"
            strHtml += XmlNode.item(i).selectSingleNode("Name").text
            strHtml += "</option>"
        }
        strHtml += "</select>"
        return strHtml;
    }
    return '';
}
//*******************************************************************************
function OnChangeCmbNewParam(obj) {
    var oRow = obj
    var rIndex
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement

    if (oRow.parentElement.parentElement.id != nGrdNewParam)
        return
    if (obj.value == VariableTypeID) {
        oRow.cells(5).firstChild.disabled = false
        oRow.cells(6).firstChild.disabled = false
        oRow.cells(7).firstChild.disabled = false
    }
    else {
        oRow.cells(5).firstChild.disabled = true
        oRow.cells(6).firstChild.disabled = true
        oRow.cells(7).firstChild.disabled = true

        oRow.cells(5).firstChild.value = ""
        oRow.cells(6).firstChild.value = ""
        oRow.cells(7).firstChild.value = ""
    }
}
//*******************************************************************************
function OnClickGrdParamSub(grdNewParamSelectedRow) {
    var oRow = window.event.srcElement.parentElement
    var rIndex
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement
    if (oRow.parentElement.parentElement.id != nGrdNewParam)
        return
    if (GrdNewParamLastSelectedRow != null) {

        GrdNewParamLastSelectedRow.className = GrdNewParamLastSelectedRowClass;
    }
    GrdNewParamLastSelectedRowClass = oRow.className;
    GrdNewParamLastSelectedRow = oRow;
    oRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OnClickGrdNewField(grdNewFieldSelectedRow) {
    var oRow = window.event.srcElement.parentElement
    var rIndex
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement

    if (oRow.parentElement.parentElement.id != nGrdNewField)
        return
    if (GrdNewFieldLastSelectedRow != null) {

        GrdNewFieldLastSelectedRow.className = GrdNewFieldLastSelectedRowClass;
    }
    GrdNewFieldLastSelectedRowClass = oRow.className;
    GrdNewFieldLastSelectedRow = oRow;
    oRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function SetRowStyle(GrdName) {
    var oGrd;
    if (GrdName == nGrdNewParam) {
        oGrd = document.getElementById("GrdNewParam")
    }
    else if (GrdName == nGrdNewField) {
        oGrd = document.getElementById("GrdNewField")
    }
    var len = oGrd.rows.length
    for (var i = 0; i < len; i++) {
        if (oGrd.rows(i).rowIndex % 2 == 0)
            oGrd.rows(i).className = "CssItemStyle"
        else
            oGrd.rows(i).className = "CssAlternatingItemStyle"
    }
}
//*******************************************************************************
function OnClickBtnNew() {
    ClearGrd(nGrdNewParam)
    ClearGrd(nGrdNewField)
    document.getElementById(MasterObj + "txtReportName").value = ""
    document.getElementById(MasterObj + "txtQuery").value = ""
    document.getElementById(MasterObj + "cmbSubSystem").value = "0"
    document.getElementById(MasterObj + "cmbSp").value = "0"
    document.getElementById(MasterObj + "txtTemplateID").value = "0"
    document.getElementById(MasterObj + "ChkIsCode").checked = false


}
//*******************************************************************************
function OnClickBtnSave() {

    if (CheckEmpty())
        return
    var GLen = 0
    var StrXml = "<Root>"
    var oCmbSp = document.getElementById(MasterObj + "cmbSp")
    //------------------------------------------
    StrXml += "<Info>"
    StrXml += "<ReportName>" + document.getElementById(MasterObj + "txtReportName").value + "</ReportName>"
    StrXml += "<SubSysID>" + document.getElementById(MasterObj + "cmbSubSystem").value + "</SubSysID>"
    StrXml += "<TemplateID>" + document.getElementById(MasterObj + "txtTemplateID").value + "</TemplateID>"
    //            StrXml+="<Query>"+ document.getElementById(MasterObj + "txtQuery").value+"</Query>"
    StrXml += "</Info>"
    //------------------------------------------
    StrXml += "<Proc>"
    StrXml += "<Type>16701</Type>"
    StrXml += "<ProcName>" + oCmbSp.options[oCmbSp.selectedIndex].text + "</ProcName>"
    if (document.getElementById(MasterObj + "ChkIsCode").checked == true || document.getElementById(MasterObj + "ChkIsCode").checked == 'true')
        StrXml += "<IsCodeReport>1</IsCodeReport>"
    else
        StrXml += "<IsCodeReport>0</IsCodeReport>"

    StrXml += "</Proc>"
    //------------------------------------------
    var oGrdParam = document.getElementById("GrdParam")
    var oGrdNewParam = document.getElementById("GrdNewParam")
    var strTmp = '';
    if (oGrdParam != null) {
        GLen = oGrdParam.rows.length
        for (var i = 1; i < GLen; i++) {//کل پارامترها به همان ترتیب ذخیره میشوند
            strTmp = IsSelectedByUser(oGrdParam.rows(i).getAttribute("Parameter_Name"))
            if (strTmp != '')
                StrXml += strTmp
            else {
                StrXml += "<Param>"
                StrXml += "<ParamID>0</ParamID>"
                StrXml += "<CurrentName>" + oGrdParam.rows(i).getAttribute("Parameter_Name") + "</CurrentName>"
                StrXml += "<TypeID>" + oGrdParam.rows(i).getAttribute('TypeID') + "</TypeID>"
                StrXml += "<Size>" + oGrdParam.rows(i).getAttribute('Size') + "</Size>"
                StrXml += "<Viewable>0</Viewable>"
                StrXml += "<Editable>0</Editable>"
                StrXml += "</Param>"
            }
        }
    }
    //------------------------------------------
    var oGrdNewField = document.getElementById("GrdNewField")
    var oGrdField = document.getElementById("GrdField")
    GLen = oGrdField.rows.length
    strTmp = '';
    if (oGrdField == null)
        return
    for (var i = 1; i < GLen; i++) {
        strTmp = IsSelectedByUserField(oGrdField.rows(i).getAttribute("Parameter_Name"))
        if (strTmp != '')
            StrXml += strTmp
        else {
            StrXml += "<Field>"
            StrXml += "<FieldID>0</FieldID>"
            StrXml += "<CurrentName>" + oGrdField.rows(i).getAttribute("Parameter_Name") + "</CurrentName>"
            StrXml += "<TypeID>" + oGrdField.rows(i).getAttribute('TypeID') + "</TypeID>"
            StrXml += "<Size>" + oGrdField.rows(i).getAttribute('Size') + "</Size>"
            StrXml += "<Viewable>0</Viewable>"
            StrXml += "<Editable>0</Editable>"
            StrXml += "<IsUsed>0</IsUsed>"
            StrXml += "</Field>"
        }

    }
    //------------------------------------------
    StrXml += "</Root>"
    document.getElementById(MasterObj + "txtXmlSave").value = StrXml
    //            alert(document.getElementById(MasterObj + "txtXmlSave").value)
    document.getElementById(MasterObj + 'txtSubmit').value = "Save"
    document.getElementById(MasterObj + 'BtnSubmit2').click()
}
//*******************************************************************************
function GenerateCondition(ORowField) {
    var StrWhere = ''
    var op = ORowField.cells(5).firstChild.value
    op = GetOperandFromVal(op)
    var v1 = ORowField.cells(6).firstChild.value
    var v2 = ORowField.cells(7).firstChild.value
    var Name = ORowField.getAttribute("Name")
    if (op != 0 && (v1 != "" || v2 != "")) {
        switch (op) {
            case "Between":
                if (v1 != "" && v2 != "")
                    StrWhere = Name + " Between " + v1 + " and " + v2
                break;
            case ">":
                StrWhere = Name + "&gt;" + v1
                break;
            case "<":
                StrWhere = Name + "&lt;" + v1
                break;
            case "=":
                StrWhere = Name + op + v1
                break;
            case "<>":
                StrWhere = Name + "&lt;&gt; " + v1
                break;
            case "in":
                StrWhere = Name + " in ("

                if (v1 != "" && v2 != "")
                    StrWhere += v1 + "," + v2

                else if (v1 != "" && v2 == "")
                    StrWhere += v1

                else if (v1 == "" && v2 != "")
                    StrWhere += v2

                StrWhere += ")"

                break;
            case "Like":
                if (v1 != "")
                    StrWhere = Name + " Like '%" + v1 + "%'"

                break;
        }
    }
    return StrWhere;
}
//*******************************************************************************
function GetOperandFromVal(val) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[Val=" + val + "]")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("StrVal").text
    return '';
}
//*******************************************************************************
function GetValFromOperand(Condition) {
    var op = GetOperandFromCondition(Condition)

    if (op == "")
        return 0;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[StrVal='" + op + "']")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("Val").text
    return 0;
}
//*******************************************************************************
function GetVal1FromCondition(Condition) {
    var op = GetOperandFromCondition(Condition);
    var v1 = '';
    if (op == ">" || op == "<" || op == "=")
        v1 = Condition.substring(Condition.lastIndexOf(op) + 1, Condition.length);
    if (op == "<>")
        v1 = Condition.substring(Condition.search("<>") + 2, Condition.length);
    if (op == "in")
        v1 = Condition.substring(Condition.lastIndexOf("(") + 1, Condition.lastIndexOf(","));
    if (op == "Between") {
        v1 = Condition.substring(Condition.search("Between") + 7, Condition.search("and"));
    }
    if (op == "Like") {
        v1 = Condition.substring(Condition.indexOf("%") + 1, Condition.lastIndexOf("%"));
    }
    return ReplaceAll(v1, " ", "");
}
//*******************************************************************************
function GetVal2FromCondition(Condition) {
    var op = GetOperandFromCondition(Condition);
    var v2 = '';
    if (op == "in")
        v2 = Condition.substring(Condition.lastIndexOf(",") + 1, Condition.lastIndexOf(")"));
    if (op == "Between")
        v2 = Condition.substring(Condition.lastIndexOf("and") + 3, Condition.length);
    return ReplaceAll(v2, " ", "");
}
//*******************************************************************************
function GetOperandFromCondition(Condition) {
    if (Condition.search("<>") != -1)
        return "<>";
    if (Condition.lastIndexOf(">") != -1)
        return ">";
    if (Condition.lastIndexOf("<") != -1)
        return "<";
    if (Condition.lastIndexOf("=") != -1)
        return "=";
    if (Condition.lastIndexOf("(") != -1)
        return "in";
    if (Condition.lastIndexOf("%") != -1)
        return "Like";
    if (Condition.search("Between") != -1)
        return "Between";
    return "";

}
//*******************************************************************************
function IsSelectedByUserField(FieldName) {

    var strtmpXml = ''
    var oGrdNewField = document.getElementById("GrdNewField")
    if (oGrdNewField == null)
        return false
    GLen = oGrdNewField.rows.length
    for (var i = 0; i < GLen; i++) {
        if (oGrdNewField.rows(i).getAttribute("Name") == FieldName) {
            strtmpXml += "<Field>"
            strtmpXml += "<FieldID>" + oGrdNewField.rows(i).getAttribute('FieldID') + "</FieldID>"
            strtmpXml += "<CurrentName>" + oGrdNewField.rows(i).getAttribute("Name") + "</CurrentName>"
            strtmpXml += "<TypeID>" + oGrdNewField.rows(i).getAttribute('TypeID') + "</TypeID>"
            strtmpXml += "<Size>" + oGrdNewField.rows(i).getAttribute('Size') + "</Size>"
            strtmpXml += "<NewName>" + oGrdNewField.rows(i).cells(2).firstChild.value + "</NewName>"
            strtmpXml += "<DisplayTypeID>" + oGrdNewField.rows(i).cells(3).firstChild.value + "</DisplayTypeID>"

            if (oGrdNewField.rows(i).cells(5).firstChild.value != 0 && oGrdNewField.rows(i).cells(6).firstChild.value != "")
                strtmpXml += "<Condition>" + GenerateCondition(oGrdNewField.rows(i)) + "</Condition>"

            //                    if (oGrdNewField.rows(i).cells(8).firstChild.value != "")
            //                        strtmpXml += "<LinkUrl>" + oGrdNewField.rows(i).cells(8).firstChild.value + "</LinkUrl>"

            //                    if (oGrdNewField.rows(i).cells(9).firstChild.value != "")
            //                        strtmpXml += "<UrlParam>" + oGrdNewField.rows(i).cells(9).firstChild.value + "</UrlParam>"

            //                    if (oGrdNewField.rows(i).cells(10).firstChild.value != "")
            //                        strtmpXml += "<UrlParamVal>" + oGrdNewField.rows(i).cells(10).firstChild.value + "</UrlParamVal>"

            //                    if (oGrdNewField.rows(i).cells(11).firstChild.value != "")
            //                        strtmpXml += "<UrlFeatur>" + oGrdNewField.rows(i).cells(11).firstChild.value + "</UrlFeatur>"

            if (oGrdNewField.rows(i).cells(4).firstChild.value != "")
                strtmpXml += "<DefaultValue>" + oGrdNewField.rows(i).cells(4).firstChild.value + "</DefaultValue>"

            if (oGrdNewField.rows(i).cells(0).firstChild.checked == true)
                strtmpXml += "<Editable>1</Editable>"
            else
                strtmpXml += "<Editable>0</Editable>"
            strtmpXml += "<Viewable>1</Viewable>"
           
            if (oGrdNewField.rows(i).cells(8).firstChild.checked == true)
                strtmpXml += "<IsUsed>1</IsUsed>"
            else
                strtmpXml += "<IsUsed>0</IsUsed>"
            strtmpXml += "</Field>"

        }
    }
    return strtmpXml;
}
//*******************************************************************************
function IsSelectedByUser(ParamName) {
    var strtmpXml = ''
    var oGrdNewParam = document.getElementById("GrdNewParam")
    if (oGrdNewParam == null)
        return false
    GLen = oGrdNewParam.rows.length
    for (var i = 0; i < GLen; i++) {
        if (oGrdNewParam.rows(i).getAttribute("Name") == ParamName) {
            strtmpXml += "<Param>"
            strtmpXml += "<ParamID>" + oGrdNewParam.rows(i).getAttribute('ParamID') + "</ParamID>"
            strtmpXml += "<CurrentName>" + oGrdNewParam.rows(i).getAttribute("Name") + "</CurrentName>"
            strtmpXml += "<TypeID>" + oGrdNewParam.rows(i).getAttribute('TypeID') + "</TypeID>"
            strtmpXml += "<Size>" + oGrdNewParam.rows(i).getAttribute('Size') + "</Size>"
            strtmpXml += "<NewName>" + oGrdNewParam.rows(i).cells(2).firstChild.value + "</NewName>"
            strtmpXml += "<DisplayTypeID>" + oGrdNewParam.rows(i).cells(3).firstChild.value + "</DisplayTypeID>"

            if (oGrdNewParam.rows(i).cells(5).firstChild.value != "")
                strtmpXml += "<LookupName>" + oGrdNewParam.rows(i).cells(5).firstChild.value + "</LookupName>"

            if (oGrdNewParam.rows(i).cells(6).firstChild.value != "")
                strtmpXml += "<LookupValue>" + oGrdNewParam.rows(i).cells(6).firstChild.value + "</LookupValue>"

            if (oGrdNewParam.rows(i).cells(7).firstChild.value != "")
                strtmpXml += "<LookupParam>" + oGrdNewParam.rows(i).cells(7).firstChild.value + "</LookupParam>"

            if (oGrdNewParam.rows(i).cells(4).firstChild.value != "")
                strtmpXml += "<DefaultValue>" + oGrdNewParam.rows(i).cells(4).firstChild.value + "</DefaultValue>"

            if (oGrdNewParam.rows(i).cells(0).firstChild.checked == true)
                strtmpXml += "<Editable>1</Editable>"
            else
                strtmpXml += "<Editable>0</Editable>"
            strtmpXml += "<Viewable>1</Viewable>"
            strtmpXml += "</Param>"
        }
    }
    return strtmpXml;
}
//*******************************************************************************
function CheckEmpty() {
    if (document.getElementById(MasterObj + "cmbSp").value == "" || document.getElementById(MasterObj + "cmbSp").value == "0") {
        alert('لطفا روال را انتخاب کنيد')
        return true
    }
    if (document.getElementById(MasterObj + "txtReportName").value == "") {
        alert('لطفا نام الگو را وارد کنيد')
        return true
    }
    if (document.getElementById(MasterObj + "cmbSubSystem").value == "0") {
        alert('لطفا سيستم را انتخاب کنيد')
        return true
    }

    if (document.getElementById("GrdNewParam").rows.length == 0 && document.getElementById("GrdParam") != null) {
        alert('لطفا پارامترهاي موردنظر را انتخاب کنيد')
        return true
    }
    if (document.getElementById("GrdNewField").rows.length == 0) {
        alert('لطفا فيلدهای موردنظر را انتخاب کنيد')
        return true
    }
    //--------------------------
    var oGrdNewParam = document.getElementById("GrdNewParam")
    if (oGrdNewParam == null)
        return false
    GLen = oGrdNewParam.rows.length
    var FlagParm = 0
    for (var i = 0; i < GLen; i++) {

        if (oGrdNewParam.rows(i).cells(2).firstChild.value == ""
                || oGrdNewParam.rows(i).cells(3).firstChild.value == 0) {
            FlagParm = 1
            break
        }
    }
    if (FlagParm == 1) {
        alert('لطفا اطلاعات گريد پارامترها را تکمیل کنيد')
        return true
    }
    //--------------------------------
    var oGrdNewField = document.getElementById("GrdNewField")
    if (oGrdNewField == null)
        return false
    GLen = oGrdNewField.rows.length
    FlagParm = 0
    for (var i = 0; i < GLen; i++) {

        if (oGrdNewField.rows(i).cells(2).firstChild.value == ""
                || oGrdNewField.rows(i).cells(3).firstChild.value == 0) {
            FlagParm = 1
            break
        }
    }
    if (FlagParm == 1) {
        alert('لطفا اطلاعات گريد فيلدها را تکمیل کنيد')
        return true
    }
    //--------------------------------
    return false
}
//*******************************************************************************
function OnChangeCmbSp() {
    var oCmbSp = document.getElementById(MasterObj + "cmbSp")
    if (oCmbSp.value == 0)
        return
    //-------------------------------
    ClearGrd(nGrdNewField)
    ClearGrd(nGrdNewParam)
    document.getElementById(MasterObj + "txtReportName").value = ""
    document.getElementById(MasterObj + "cmbSubSystem").value = "0"
    //-------------------------------
    document.getElementById(MasterObj + 'txtSelectedSpName').value = oCmbSp.options[oCmbSp.selectedIndex].text
    document.getElementById(MasterObj + 'txtSubmit').value = "RunSp"
    document.getElementById(MasterObj + 'BtnSubmit').click()
}
//*******************************************************************************
function OnClickBtnDesign() {
    if (confirm("آیا مايل به ذخيره تغييرات ميباشيد؟") == true) {
        SaveDesignMode = 1
        OnClickBtnSave();
    }
}
//*******************************************************************************
function OnClickBtnRun() {
    var URL = "ReportShow.aspx?ToPersonId=" + document.getElementById(MasterObj + 'txtOnLineUser').value
            + "&SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value
    window.open(URL, "_self");
}
//*******************************************************************************
function RedirectToDeDesign() {
    var URL = "ReportDefinition.aspx?ToPersonId=" + document.getElementById(MasterObj + 'txtOnLineUser').value
            + "&SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value
            + "&TemplateID=" + document.getElementById(MasterObj + 'txtTemplateID').value
    window.open(URL, "_self");
}
//*******************************************************************************
function OnClickBtnFilter() {
    //            if (document.getElementById(MasterObj + "cmbTemplate").value != "" && document.getElementById(MasterObj + "cmbTemplate").value != 0) {
    //                OnClickBtnNew()
    //                document.getElementById(MasterObj + 'txtTemplateID').value = document.getElementById(MasterObj + "cmbTemplate").value
    //                SetTemplateName();
    //                document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
    //                document.getElementById(MasterObj + 'BtnSubmit').click()
    //            }
    OnClickBtnNew()
    document.getElementById(MasterObj + 'txtSubmit').value = "FilterSP"
    document.getElementById(MasterObj + 'BtnSubmit2').click()
}
//*******************************************************************************
function SetTemplateName() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    //            alert(document.getElementById(MasterObj + "txtXmlTemplate").value)
    if (document.getElementById(MasterObj + "txtXmlTemplate").value == "")
        return;
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlTemplate").value);
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetTemplate[Val=" + document.getElementById(MasterObj + "txtTemplateID").value + "]");
    var oCmbSp = document.getElementById(MasterObj + "cmbSp")
    //            alert(XmlNode.length)
    if (XmlNode.length) {
        document.getElementById(MasterObj + 'txtSelectedSpName').value = XmlNode.item(0).selectSingleNode("ObjectName").text
        document.getElementById(MasterObj + 'cmbSubSystem').value = XmlNode.item(0).selectSingleNode("SubsystemID").text
        document.getElementById(MasterObj + 'txtReportName').value = XmlNode.item(0).selectSingleNode("Name").text
        oCmbSp.value = SetComboIndex(document.getElementById(MasterObj + 'txtSelectedSpName').value, "cmbSp")

    }
}
//*******************************************************************************
function SetComboIndex(title, comboName) {
    if (title == "")
        return 0;
    var oCmbSp = document.getElementById(MasterObj + comboName)
    var len = oCmbSp.length
    for (var i = 0; i < len; i++) {
        if (oCmbSp.options[i].text == title)
            return i;
    }
    return 0;
}
//*******************************************************************************
function LoadData() {
    LoadGrdNewField()
    LoadGrdNewParam()
    //            SetTemplateName()
}
//*******************************************************************************
function LoadGrdNewParam() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    if (document.getElementById(MasterObj + "txtXmlParam").value == "")
        return
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlParam").value)
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetTmpParam")
    var len = XmlNode.length
    var Editable;
    for (var i = 0; i < len; i++) {
        Editable = 1
        if (XmlNode.item(i).selectSingleNode("Editable").text == 0)
            Editable = 0
        AddRow_GrdNewParam(
                                     XmlNode.item(i).selectSingleNode("ID").text
                                    , XmlNode.item(i).selectSingleNode("TypeID").text
                                    , XmlNode.item(i).selectSingleNode("Size").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("Caption").text
                                    , XmlNode.item(i).selectSingleNode("DisplayTypeID").text
                                    , XmlNode.item(i).selectSingleNode("DefaultValue").text
                                    , XmlNode.item(i).selectSingleNode("LookupName").text
                                    , XmlNode.item(i).selectSingleNode("LookupValue").text
                                    , XmlNode.item(i).selectSingleNode("LookupParam").text
                                    , Editable
                                    )

    }
}
//*******************************************************************************
function LoadGrdNewField() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);

    if (document.getElementById(MasterObj + "txtXmlField").value == "")
        return
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetTmpFieldNew");
    var len = XmlNode.length;
    var Editable = 1;
    for (var i = 0; i < len; i++) {
        Editable = 1

        if (XmlNode.item(i).selectSingleNode("Editable").text == 0)
            Editable = 0

        AddRow_GrdNewField(XmlNode.item(i).selectSingleNode("ID").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("Caption").text
                                    , XmlNode.item(i).selectSingleNode("DisplayTypeID").text
                                    , XmlNode.item(i).selectSingleNode("TypeID").text
                                    , XmlNode.item(i).selectSingleNode("DefaultValue").text
                                    , XmlNode.item(i).selectSingleNode("LinkURL").text
                                    , XmlNode.item(i).selectSingleNode("UrlParam").text
                                    , XmlNode.item(i).selectSingleNode("UrlParamVal").text
                                    , XmlNode.item(i).selectSingleNode("UrlFeatur").text
                                    , XmlNode.item(i).selectSingleNode("Size").text
                                    , Editable
                                    , XmlNode.item(i).selectSingleNode("Condition").text
                                    , XmlNode.item(i).selectSingleNode("IsUsed").text)
    }
}

//*******************************************************************************
function OnChangeCmbPages() {
    //SelParamOfPage
    document.getElementById(MasterObj + 'txtSubmit').value = "OnChangeCmbPages"
    document.getElementById(MasterObj + 'BtnSubmit3').click()
}
//*******************************************************************************
function LoadGrdPageParam() {
    //alert(document.getElementById(MasterObj + 'SelParamOfPage').innerHTML)
    var oSel = document.getElementById(MasterObj + 'SelParamOfPage')
    ClearGrd("GrdPageParam")
    if (oSel.length > 0)
        AddRow_GrdPageParam(1)
    else
        AddRow_GrdPageParam(0)
}
//*******************************************************************************
function AddRow_GrdPageParam(RowType) {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    oGrdPageParam.insertRow();
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()

    if (GrdPageParamRowIdx % 2 == 0)
        oGrdPageParam.rows(GrdPageParamRowIdx).className = "CssItemStyle"
    else
        oGrdPageParam.rows(GrdPageParamRowIdx).className = "CssAlternatingItemStyle"

    if (RowType == 1) {
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).innerHTML = CreateComboFromCombo('SelParamOfPage')
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).innerHTML = CreateComboFromCombo('CmbTmpField')
    }
    else {
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).innerHTML = "<INPUT type='text' class='txtControls'  style='WIDTH:100px' />"
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).innerHTML = "<INPUT type='text' class='txtControls'  style='WIDTH:100px' />"
    }
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).innerHTML = "<IMG src='../../App_Utility/Images/Icons/NewIcon.gif' Style='cursor:pointer' onclick='OnClickBtnAdd(this," + RowType + ")'>"

    oGrdPageParam.rows(GrdPageParamRowIdx).align = "center"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).style.width = "100px"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).style.width = "100px"

    GrdPageParamRowIdx++;
}
//*******************************************************************************
function OnClickBtnAdd(obj, RowType) {
    obj.style.display = "none"
    AddRow_GrdPageParam(RowType)
}
//*******************************************************************************
function CreateComboFromCombo(objName) {
    var strHtml = "<select class='txtControls' style='width:100px'> "
    strHtml += "<option value='0'>انتخاب نشده</option>"
    var oSel = document.getElementById(MasterObj + objName)
    var len = oSel.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + oSel.options(i).value + "'>"
        strHtml += oSel.options(i).text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;
}
//*******************************************************************************