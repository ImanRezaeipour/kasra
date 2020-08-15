
document.getElementsByTagName("body")[0].scroll = "no";
window.name = "RegisterCredit.aspx"
aspnetForm.target = window.name
//window.target = "SchedulingProg.aspx";
//*************************************Declaration*************************************
var IsChanged = false;
var ChangeCredit=false;
var SaveNewFlag = 0;
var SaveFlag = 0;

var counter = 1;
$("#" + MasterObj + "KCalSDate_txtCalendar").change(function () { onchangeElem() });
function onchangeElem() {
    var SDate1 = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    if ($get(MasterObj + "RdDaily").checked == true) {
        if (counter == 2) {
            if (SDate1 > $("#" + MasterObj + "txtToday").val()) {
                $("#" + MasterObj + "KCalEDate_txtCalendar").val($get(MasterObj + "KCalSDate_txtCalendar").value);
            }
        }
        if(counter==1)
            counter++;
        else
            counter=1;
    }
}

OnChangeCmbGrdGroupCode();
$("#" + MasterObj + "endarKCalEDate_txtCal").change(function () { onchangeItem() });
$("#" + MasterObj + "KCalSDate_txtCalendar").change(function () { onchangeItem() });
$get(MasterObj + "KCalEDate_txtOnChangeFunc").value = "onchangeItem()";
$get(MasterObj + "KCalSDate_txtOnChangeFunc").value = "onchangeItem()";
$get(MasterObj + "CmbPerson_txtOnChangeFunc").value = "onchangeItem()";
$get(MasterObj + "CmbJPerson_txtOnChangeFunc").value = "onchangeItem()";
if ($get(MasterObj + "txtSubmit").value != "ShouldBeOpen")
    PageLoad();

function PageLoad() {
    if (document.getElementById(MasterObj + "txtTableName").value != "")
        onload();
    else {
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value
        $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "KCalSDate_txtDay").value
        $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "KCalSDate_txtMonth").value
        $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "KCalSDate_txtYear").value

        if ($get(MasterObj + "txtTimelyCreditForDaysOption").value != "1") {
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDate_btnImg").disabled = true;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        }
    }
    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
        document.getElementById("TDPersonTxt").style.display = "inline";
        document.getElementById("TDPersonCombo").style.display = "none";
        document.getElementById("TDJPersonTxt").style.display = "inline";
        document.getElementById("TDJPersonCombo").style.display = "none";
    }
}
//**************************************EndDeclaration*****************************************
function onload() {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
    var xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/RegisterDetail");
    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
        $get(MasterObj + "txtPersonCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
        $get(MasterObj + "txtPersonName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
        $get(MasterObj + "txtPersonName").setAttribute("PersonCode",  xmlNodes.item(0).selectSingleNode('PersonCode').text);
    }
    else {
        $get(MasterObj + "CmbPerson_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
        $get(MasterObj + "CmbPerson_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
        $get(MasterObj + "CmbPerson_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
    }
    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
        $get(MasterObj + "txtJPersonCode").value = xmlNodes.item(0).selectSingleNode('JPCode').text
        $get(MasterObj + "txtJPersonName").value = xmlNodes.item(0).selectSingleNode('JPName').text
        $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", xmlNodes.item(0).selectSingleNode('JPCode').text);
    }
    else {
        $get(MasterObj + "CmbJPerson_txtCode").value = xmlNodes.item(0).selectSingleNode('JPCode').text
        $get(MasterObj + "CmbJPerson_txtPCode").value = xmlNodes.item(0).selectSingleNode('JPCode').text
        $get(MasterObj + "CmbJPerson_txtName").value = xmlNodes.item(0).selectSingleNode('JPName').text
    }
    $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(0, 2);
    $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(3, 2);
    $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(6, 4);
    $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('StartDate').text
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
    $get(MasterObj + "KCalEDate_txtDay").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(0, 2);
    $get(MasterObj + "KCalEDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(3, 2);
    $get(MasterObj + "KCalEDate_txtYear").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(6, 4);
    $get(MasterObj + "KCalEDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('EndDate').text
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
    $get(MasterObj + "CmbGroupCode").value = xmlNodes.item(0).selectSingleNode('Type').text
    OnChangeCmbGrdGroupCode();
    $get(MasterObj + "CmbCreditType").value = xmlNodes.item(0).selectSingleNode('CreditType').text

    $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Des').text
    $get(MasterObj + "txtCreditID").value = xmlNodes.item(0).selectSingleNode('CreditID').text

    //-----------------------Disable For Modify---------------------------------------------------
    $get(MasterObj + "CmbPerson_txtPCode").disabled = true;
    $get(MasterObj + "CmbJPerson_txtPCode").disabled = true;
    $get(MasterObj + "CmbPerson_btnDown").disabled = true;
    $get(MasterObj + "CmbJPerson_btnDown").disabled = true;
    $get(MasterObj + "txtPersonCode").disabled = true;
    $get(MasterObj + "txtPersonName").disabled = true;
    $get("btnRefreshPerson").disabled = true;
    $get(MasterObj + "txtJPersonCode").disabled = true;
    $get(MasterObj + "txtJPersonName").disabled = true;
    $get("BtnRefreshJPerson").disabled = true;
    $get(MasterObj + "RdDaily").disabled = true;
    $get(MasterObj + "RdHourly").disabled = true;
    $get(MasterObj + "CmbGroupCode").disabled = true;
    $get(MasterObj + "CmbCreditType").disabled = true;
    if (typeof document.getElementById("OToolBar_BtnNew") == "object") {
        if (document.getElementById("OToolBar_BtnNew") != null)
            document.getElementById("OToolBar_BtnNew").style.display = "none";
    }
    if (typeof document.getElementById("OToolBar_BtnSaveNew") == "object") {
        if (document.getElementById("OToolBar_BtnSaveNew") != null)
            document.getElementById("OToolBar_BtnSaveNew").style.display = "none";
    }
    if (typeof document.getElementById("OToolBar_BtnSelectGroup") == "object") {
        if (document.getElementById("OToolBar_BtnSelectGroup"))
            document.getElementById("OToolBar_BtnSelectGroup").style.display = "none";
    }
    if (typeof document.getElementById("OToolBar_BtnScheduling") == "object") {
        if (document.getElementById("OToolBar_BtnScheduling") != null)
            document.getElementById("OToolBar_BtnScheduling").style.display = "none";
    }
    //--------------------------------------------------------------------------------------------
    if (xmlNodes.item(0).selectSingleNode('StartTime') && xmlNodes.item(0).selectSingleNode('StartTime').text != "00:00") {
        $get(MasterObj + "txtSTime").value = xmlNodes.item(0).selectSingleNode('StartTime').text
        $get(MasterObj + "txtETime").value = xmlNodes.item(0).selectSingleNode('EndTime').text
        Timechk(document.getElementById(MasterObj + "txtSTime"));
        Timechk(document.getElementById(MasterObj + "txtETime"));
    }
    else {
        $get(MasterObj + "txtSTime").value = "";
        $get(MasterObj + "txtETime").value = "";
        $get(MasterObj + "txtSTime").disabled = true;
        $get(MasterObj + "txtETime").disabled = true;
        $get(MasterObj + "RdDaily").checked = true;
        $get(MasterObj + "RdHourly").checked = false;
        OnChangeCmbGrdGroupCode();
    }
    if ($get(MasterObj + "txtModifyFlag").value == "0") {
        $get(MasterObj + "CmbPerson_txtPCode").disabled = true;
        $get(MasterObj + "CmbJPerson_txtPCode").disabled = true;
        $get(MasterObj + "txtPersonCode").disabled = true;
        $get(MasterObj + "txtPersonName").disabled = true;
        $get("btnRefreshPerson").disabled = true;
        $get(MasterObj + "txtJPersonCode").disabled = true;
        $get(MasterObj + "txtJPersonName").disabled = true;
        $get("BtnRefreshJPerson").disabled = true;
        $get(MasterObj + "KCalSDate_txtCalendar").disabled = true;
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
        $get(MasterObj + "CmbGroupCode").disabled = true;
        $get(MasterObj + "CmbCreditType").disabled = true;
        $get(MasterObj + "txtSTime").disabled = true;
        $get(MasterObj + "txtETime").disabled = true;
        $get(MasterObj + "txtDesc").disabled = true;
        $get(MasterObj + "RdDaily").disabled = true;
        $get(MasterObj + "RdHourly").disabled = true;

        if (typeof document.getElementById("OToolBar_BtnNew") == "object") {
            if (document.getElementById("OToolBar_BtnNew")!=null)
                document.getElementById("OToolBar_BtnNew").style.visibility = "hidden";
        }
        if (typeof document.getElementById("OToolBar_BtnSave") == "object") {
            if (document.getElementById("OToolBar_BtnSave")!=null)
                document.getElementById("OToolBar_BtnSave").style.visibility = "hidden";
        }

        if (typeof document.getElementById("OToolBar_BtnSaveNew") == "object") {
            if (document.getElementById("OToolBar_BtnSaveNew")!=null)
                document.getElementById("OToolBar_BtnSaveNew").style.visibility = "hidden";
        }

        if (typeof document.getElementById("OToolBar_BtnSelectGroup") == "object") {
            if (document.getElementById("OToolBar_BtnSelectGroup"))
                document.getElementById("OToolBar_BtnSelectGroup").style.visibility = "hidden";
        }

        if (typeof document.getElementById("OToolBar_BtnScheduling") == "object") {
            if (document.getElementById("OToolBar_BtnScheduling")!=null)
                document.getElementById("OToolBar_BtnScheduling").style.visibility = "hidden";
        }
    }
    if ($get(MasterObj + "txtDesc").disabled == 'false')
        $get(MasterObj + "txtDesc").focus();
    $get(MasterObj + "CmbCreditType").value = xmlNodes.item(0).selectSingleNode('CreditType').text
}
//*************************************OnLoad*************************************
function resize(obj) {
    if (obj == document.getElementById("ImgOpen")) {
        document.getElementById("tdOpen").style.display = "none";
        document.getElementById("tdClose").style.display = "inline";
        document.getElementById("DownRow").style.display = "inline";
    }
    if (obj == document.getElementById("ImgClose")) {
        document.getElementById("tdClose").style.display = "none";
        document.getElementById("tdOpen").style.display = "inline";
        document.getElementById("DownRow").style.display = "none";
    }
}
//*******************************************************************************
function OnChangeCmbGrdGroupCode() {
    var Timely = $get(MasterObj + "RdHourly").checked ? "1" : "0";
    var Daily = $get(MasterObj + "RdHourly").checked ? "0" : "1";


    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
    var xmlNodes;
    $get(MasterObj + "CmbCreditType").innerHTML = ""

    if ($get(MasterObj + "CmbGroupCode").value != 0 && $get(MasterObj + "CmbGroupCode").value != "")
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGroupCode").value + " and (Daily=" + Daily + " or Timely=" + Timely + ") ]");
    else
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");

    var j = 1
    if ($get(MasterObj + "CmbGroupCode").value != 0) {
        optionEl = document.createElement("OPTION")
        $get(MasterObj + "CmbCreditType").options.add(optionEl)
        $get(MasterObj + "CmbCreditType").all(0).innerText = "انتخاب نشده";
        $get(MasterObj + "CmbCreditType").all(0).value = "0";
    }
    for (var i = 0; i < xmlNodes.length; ++i) {
        optionEl = document.createElement("OPTION")
        $get(MasterObj + "CmbCreditType").options.add(optionEl)
        $get(MasterObj + "CmbCreditType").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
        $get(MasterObj + "CmbCreditType").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
        j++

    }
    $get(MasterObj + "CmbCreditType").value = $get(MasterObj + "txtCreditType").value;
}
//*******************************************************************************
function LoadCodes() {
    if ($get(MasterObj + "CmbGroupCode").value == "0")
        alert("لطفا گروه مجوز را وارد نماييد");
    else {
        OnChangeCmbGrdGroupCode();
    }
}
//*******************************************************************************
function OnClickBtnNew() {
    var Today = $get(MasterObj + "txtToday").value;
    $get(MasterObj + "CmbPerson_txtCode").value = ""
    $get(MasterObj + "CmbPerson_txtPCode").value = ""
    $get(MasterObj + "CmbPerson_txtName").value = "";
//    $get(MasterObj + "CmbPerson_txtPCode").focus();
    $get(MasterObj + "CmbPerson_txtPCode").select();
    $get(MasterObj + "txtPersonCode").value = ""
    $get(MasterObj + "txtPersonName").value = "";
    $get(MasterObj + "KCalSDate_txtYear").value = Today.substr(0, 4)
    $get(MasterObj + "KCalSDate_txtMonth").value = Today.substr(5, 2)
    $get(MasterObj + "KCalSDate_txtDay").value = Today.substr(8, 2)
    $get(MasterObj + "KCalEDate_txtYear").value =  Today.substr(0, 4)
    $get(MasterObj + "KCalEDate_txtMonth").value = Today.substr(5, 2)
    $get(MasterObj + "KCalEDate_txtDay").value = Today.substr(8, 2)
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value;
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value;
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
    $get(MasterObj + "CmbGroupCode").selectedIndex = "0"
    $get(MasterObj + "RdHourly").checked = true;
    $get(MasterObj + "txtSTime").value = "00:00"
    $get(MasterObj + "txtETime").value = "00:00"
    $get(MasterObj + "txtDesc").value = ""
    onchangeForGetCodePermission(1);
    $get(MasterObj + "CmbCreditType").selectedIndex = "0"
    if (DivExtended.firstChild.tagName == "TABLE")
        DivExtended.removeChild(DivExtended.firstChild);
    SaveNewFlag = 0;
    $get(MasterObj + "txtScriptGroupXML").value = "";
    
}
//*******************************************************************************
function chkIsEmpty() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode");
    var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

    var STime = $get(MasterObj + "txtSTime").value;
    STime = STime.split(':')[0] * 60 + STime.split(':')[1];
    var ETime = $get(MasterObj + "txtETime").value;
    ETime = ETime.split(':')[0] * 60 + ETime.split(':')[1];
    if ($get(MasterObj + "RdHourly").checked == true 
    && (EDate == "//"  || $get(MasterObj + "txtTimelyCreditForDaysOption").value != "1"))
        EDate = SDate;

    if (PersonCode == "" &&
               ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>" || $get(MasterObj + "txtScriptGroupXML").value == ""
               || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")) {
        alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
        return false;
    }
    if (SDate == "//") {
        alert("لطفا تاريخ شروع مجوز را وارد نماييد");
        $get(MasterObj + "KCalSDate_txtCalendar").focus();
        return false;
    }
    if (EDate == "//") {
        alert("لطفا تاريخ پايان مجوز را وارد نماييد");
        $get(MasterObj + "KCalEDate_txtCalendar").focus();
        return false;
    }
    if ($get(MasterObj + "RdHourly").checked == true && ($get(MasterObj + "txtSTime").value == "" || $get(MasterObj + "txtSTime").value == "00:00")) {
        alert("لطفا ساعت شروع را وارد نماييد");
        $get(MasterObj + "txtSTime").focus();
        return false;
    }
    if ($get(MasterObj + "RdHourly").checked == true && ($get(MasterObj + "txtETime").value == "" || $get(MasterObj + "txtETime").value == "00:00")) {
        alert("لطفا ساعت پايان را وارد نماييد");
        $get(MasterObj + "txtETime").focus();
        return false;
    }
    if ($get(MasterObj + "CmbGroupCode").value == "0") {
        alert("لطفا گروه مجوز را انتخاب نماييد");
        $get(MasterObj + "CmbGroupCode").focus();
        return false;
    }
    if ($get(MasterObj + "CmbCreditType").value == "0" || $get(MasterObj + "CmbCreditType").value == "") {
        alert("لطفا نوع مجوز را انتخاب نماييد ");
        $get(MasterObj + "CmbCreditType").focus();
        return false;
    }
    if (SDate > EDate) {
        alert("تاريخ شروع بزرگتر از تاریخ پايان است");
        $get(MasterObj + "KCalEDate_txtCalendar").focus();
        return false;
    }
    if ($get(MasterObj + "RdHourly").checked == true && parseInt(STime) > parseInt(ETime) && SDate == EDate) {
        alert("ساعت شروع بزرگتر از ساعت پايان است");
        $get(MasterObj + "txtETime").focus();
        return false;
    }
    else
        return true;
}
//*******************************************************************************
function SaveXml() {
    var xmlStr;
    var PersonCode = "", JPersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode");
    if ($get(MasterObj + "CmbJPerson_txtCode").value != "")
        JPersonCode = $get(MasterObj + "CmbJPerson_txtCode").value;
    else if ($get(MasterObj + "txtJPersonName").value != "")
        JPersonCode = $get(MasterObj + "txtJPersonName").getAttribute("PersonCode");
    var SDate = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
    var EDate = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

    if ($get(MasterObj + "RdHourly").checked == true
    && (EDate == "//" || $get(MasterObj + "txtTimelyCreditForDaysOption").value != "1"))
        EDate = SDate;
    if ($get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>"
            || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>"
            || $get(MasterObj + "txtScriptGroupXML").value == "undefined"
            || $get(MasterObj + "txtScriptGroupXML").value == ""
            || ($get(MasterObj + "txtCreditID").value != "" && $get(MasterObj + "txtCreditID").value != "0")) {
        xmlStr = "<Root><Tb>";
        xmlStr = xmlStr + "<PersonID>" + PersonCode + "</PersonID>";
        xmlStr = xmlStr + "<PersonCode>" + PersonCode + "</PersonCode>";
        xmlStr = xmlStr + "<StartDate>" + SDate + "</StartDate>";
        xmlStr = xmlStr + "<EndDate>" + EDate + "</EndDate>";
        xmlStr = xmlStr + "<Type>" + $get(MasterObj + "CmbGroupCode").value + "</Type>";
        xmlStr = xmlStr + "<CreditType>" + $get(MasterObj + "CmbCreditType").value + "</CreditType>";
        xmlStr = xmlStr + "<StartTime>" + $get(MasterObj + "txtSTime").value + "</StartTime>";
        xmlStr = xmlStr + "<EndTime>" + $get(MasterObj + "txtETime").value + "</EndTime>";
        xmlStr = xmlStr + "<Des>" + $get(MasterObj + "txtDesc").value + "</Des>";
        xmlStr = xmlStr + "<StatusType></StatusType>";
        xmlStr = xmlStr + "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";

        if (JPersonCode != "")
            xmlStr = xmlStr + "<JPersonelID>" + JPersonCode + "</JPersonelID>";
        else
            xmlStr = xmlStr + "<JPersonelID>0</JPersonelID>";
        if ($get(MasterObj + "txtFieldValue").value == "")
            $get(MasterObj + "txtFieldValue").value = "0";
        xmlStr = xmlStr + "<CreditID>" + $get(MasterObj + "txtFieldValue").value + "</CreditID>";
        xmlStr = xmlStr + "<_Flags>1</_Flags>";
        xmlStr = xmlStr + "</Tb><Setting><Flag>2</Flag></Setting></Root>";
    }
    else {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + "txtScriptGroupXML").value);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        var XmlNodesLen = oXmlNodes.length;
        if (oXmlNodes.length > 0) {
            xmlStr = "<Root>";
            for (var i = 0; i < XmlNodesLen; i++) {
                xmlStr = xmlStr + "<Tb>";
                xmlStr = xmlStr + "<RowIndex>" + i + "</RowIndex>";
                xmlStr = xmlStr + "<PersonID>" + oXmlNodes.item(i).selectSingleNode("MID").text + "</PersonID>";
                xmlStr = xmlStr + "<PersonCode>" + oXmlNodes.item(i).selectSingleNode("MID").text + "</PersonCode>";
                xmlStr = xmlStr + "<MType>" + oXmlNodes.item(i).selectSingleNode("Type").text + "</MType>";
                xmlStr = xmlStr + "<StartDate>" + SDate + "</StartDate>";
                xmlStr = xmlStr + "<EndDate>" + EDate + "</EndDate>";
                xmlStr = xmlStr + "<Type>" + $get(MasterObj + "CmbGroupCode").value + "</Type>";
                xmlStr = xmlStr + "<CreditType>" + $get(MasterObj + "CmbCreditType").value + "</CreditType>";
                xmlStr = xmlStr + "<StartTime>" + $get(MasterObj + "txtSTime").value + "</StartTime>";
                xmlStr = xmlStr + "<EndTime>" + $get(MasterObj + "txtETime").value + "</EndTime>";
                xmlStr = xmlStr + "<Des>" + $get(MasterObj + "txtDesc").value + "</Des>";
                xmlStr = xmlStr + "<StatusType></StatusType>";
                xmlStr = xmlStr + "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";
                if (JPersonCode != "")
                    xmlStr = xmlStr + "<JPersonelID>" + JPersonCode + "</JPersonelID>";
                else
                    xmlStr = xmlStr + "<JPersonelID>0</JPersonelID>";
                xmlStr = xmlStr + "<_Flags>1</_Flags>";
                xmlStr = xmlStr + "</Tb>";
            }
            xmlStr = xmlStr + "</Root>";
        }
    }
    $get(MasterObj + "txtXml").value = xmlStr;
}
//===============================================================================
function OnClickBtnSave() {
    if (chkIsEmpty()) {
        if (SaveExtendedCode("txtExSaveXml")) {
            SaveXml();
            $get(MasterObj + "txtSubmit").value = "Modify";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
}
//*******************************************************************************
function onBlurtxtETime() {
//    if ($get(MasterObj + "txtSTime").value == "00:00" && $get(MasterObj + "txtETime").value == "00:00") {
//        $get(MasterObj + "RdDaily").checked = true;
//        onchangeForGetCodePermission();
//    }
}
//*******************************************************************************
function onchangeForGetCodePermission(Sign) {
    if ($get(MasterObj + "RdDaily").checked == true) {
        $get(MasterObj + "txtSTime").disabled = true;
        $get(MasterObj + "txtETime").disabled = true;
        $get(MasterObj + "txtSTime").value = "";
        $get(MasterObj + "txtETime").value = "";
        $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
        $get(MasterObj + "KCalEDate_btnImg").disabled = false;
        $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        if ($get(MasterObj + "KCalEDate_txtCalendar").value == '') {
            $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "KCalSDate_txtMonth").value;
            $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "KCalSDate_txtYear").value;
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value
        }
    }
    else if ($get(MasterObj + "RdHourly").checked == true) {
        $get(MasterObj + "txtSTime").disabled = false;
        $get(MasterObj + "txtETime").disabled = false;
        if ($get(MasterObj + "txtTimelyCreditForDaysOption").value != "1") {
            $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "KCalSDate_txtMonth").value;
            $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "KCalSDate_txtYear").value;
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDate_btnImg").disabled = true;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        }
    }
    if ($get(MasterObj + "KCalSDate_txtCalendar").value != "" && $get(MasterObj + "KCalEDate_txtCalendar").value != "")
        IsChanged = true;
    LoadCodes();
    if (Sign != 1)
        ChangeCredit = true;
}
//*******************************************************************************
function ShouldBeOpen() {
    ChangeCredit = true;
    $get(MasterObj + "txtCreditType").value = $get(MasterObj + "CmbCreditType").value;
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeID=" + $get(MasterObj + "CmbCreditType").value + "]");
    
    if (xmlNodes.length > 0 && $get(MasterObj + "CmbCreditType").value != "0")
        if (xmlNodes[0].selectSingleNode("HaveExtended").text == "1") {
            $get(MasterObj + "txtVCredit").value = "VCredit_" + $get(MasterObj + "CmbCreditType").value;
            $get(MasterObj + "txtSubmit").value = "ShouldBeOpen";
            $get(MasterObj + "BtnSubmit2").click();
        }
        else {
            if (DivExtended.firstChild.tagName == "TABLE")
                DivExtended.removeChild(DivExtended.firstChild);
        } 
}
//*******************************************************************************
function OnFocuseTxtSTime() {
    document.getElementById(MasterObj + "txtSTime").select()
}
//*******************************************************************************
function OnFocuseTxtETime() {
    document.getElementById(MasterObj + "txtETime").select();
}
//*******************************************************************************
function OnClickBtnSaveNew() {
    SaveNewFlag = 1;
    OnClickBtnSave();
}
//*******************************************************************************
function OnClickBtnSelectGroup() {
    var strUrl = "CreditScriptGroup.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CreditScriptGroup=" + $get(MasterObj + "txtScriptGroupXML").value
                            + "&CreditID=" + $get(MasterObj + "txtCreditID").value;
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 420px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
    $get(MasterObj + "txtScriptGroupXML").value = rValue;
}
//*******************************************************************************
function OnClickBtnScheduling() {
    document.getElementById(MasterObj + "txtSchedulingID").value = "0";
    url = "/FrmPresentation/App_Pages/BaseInfo/Scheduling/SchedulingNew.aspx?SchedulingID=0" + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:590px;dialogWidth: 800px;center: Yes;help: no;status: no")
}
//*******************************************************************************
//function GetAccessBtn() {
//    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
//    xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
//    xmlDoc.setProperty("SelectionLanguage", "XPath")
//    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
//    if (xmlNodes.length != 0) {
//        if (xmlNodes.item(0).selectSingleNode('BtnSelectGroup') && xmlNodes.item(0).selectSingleNode('BtnSelectGroup').text == 2)
//            document.getElementById('OToolBar_BtnSelectGroup').style.display = "none"
//    }
//}
//*******************************************************************************
function RefreshParentRow() {
    try {
        if ($get(MasterObj + "txtCalcOption").value != "0") {
            win = window.dialogArguments
            if (win.RefreshThisRowCreditInfo)
                win.RefreshThisRowCreditInfo()
        }
    }
    catch (e) {
        /**/
    }
}
/******************************************************************************************/
function OnBlurtxtPersonCode() {
    if ($get(MasterObj + "txtPersonCode").value == "" || $get(MasterObj + "txtPersonCode").value == "0") {
        $get(MasterObj + "txtPersonName").value = "";
        $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
    }
    else {
        $get(MasterObj + "txtSubmit").value = "RefreshPerson";
        $get(MasterObj + "ImgRefreshPersonSubmit").click();
    }
}
/******************************************************************************************/
function onClickbtnRefreshPerson(obj) {
    var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value + "&MenuItemID=1306"  
    var strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    var Result = Result = window.showModalDialog(url, "", strOptions);
    if (Result != "" && Result != undefined) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(Result);
        oXmlDoc.setProperty("SelectionLanguage", "XPath");
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (oXmlNodes.length != 0) {
            $get(MasterObj + "txtPersonCode").value = oXmlNodes.item(0).selectSingleNode('PCode').text;
            $get(MasterObj + "txtPersonName").value = oXmlNodes.item(0).selectSingleNode('PName').text;
            $get(MasterObj + "txtPersonName").setAttribute("PersonCode", oXmlNodes.item(0).selectSingleNode('PCode').text);
        }
    }
}
/******************************************************************************************/
function OnBlurtxtJPersonCode() {
    if ($get(MasterObj + "txtJPersonCode").value == "" || $get(MasterObj + "txtJPersonCode").value == "0") {
        $get(MasterObj + "txtJPersonName").value = "";
        $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", "");
    }
    else {
        $get(MasterObj + "txtSubmit").value = "RefreshJPerson";
        $get(MasterObj + "ImgRefreshPersonSubmit").click();
    }
}
/******************************************************************************************/
function onClickbtnRefreshJPerson(obj) {
    var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value + "&MenuItemID=999999" 
    var strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    var Result = Result = window.showModalDialog(url, "", strOptions);
    if (Result != "" && Result != undefined) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(Result);
        oXmlDoc.setProperty("SelectionLanguage", "XPath");
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (oXmlNodes.length != 0) {
            $get(MasterObj + "txtJPersonCode").value = oXmlNodes.item(0).selectSingleNode('PCode').text;
            $get(MasterObj + "txtJPersonName").value = oXmlNodes.item(0).selectSingleNode('PName').text;
            $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", oXmlNodes.item(0).selectSingleNode('PCode').text);
        }
    }
}
/******************************************************************************************/
//**********************************EndThisPage*************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    if (document.getElementById(MasterObj + "txtSubmit").value == "RefreshPerson"
     || document.getElementById(MasterObj + "txtSubmit").value == "RefreshJPerson")
        document.getElementById("ctl00_ProgressState").value = 1
}

//====================================================================================
function EndRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value
    //------------------------------------------------------------
    if (StrVal == "Modify") {
        if (document.getElementById("tdClose").style.display == "inline")
            resize(document.getElementById("ImgClose"));

        if ($get(MasterObj + "txtAlert").value != "") {
            if ($get(MasterObj + "txtValidate").value != "1" || $get(MasterObj + "txtValidate").value == "") {
                alert($get(MasterObj + "txtAlert").value)
            }
            else {
                ChangeCredit = false;
                if ($get(MasterObj + "txtAlert").value == "ذخيره با موفقيت انجام شد")
                    SetMsg($get(MasterObj + "txtAlert").value);
                else
                    alert($get(MasterObj + "txtAlert").value);
                SaveFlag = 1;
                window.returnValue = SaveFlag;

                if ($get(MasterObj + "txtMonthly").value == "1")
                    RefreshParentRow();

                if (SaveNewFlag == 1)
                    OnClickBtnNew();
                else
                    window.close();
            }
        }
        else {
            if ($get(MasterObj + "txtValidate").value == "1") {
                SetMsg($get(MasterObj + "txtAlert").value);
                window.returnValue = 1;
                ChangeCredit = false;
                if ($get(MasterObj + "txtMonthly").value == "1")
                    RefreshParentRow();

                if (SaveNewFlag == 1)
                    OnClickBtnNew();
                else 
                    window.close();
            }
        }

    }
    //------------------------------------------------------------
    if (StrVal == "GetCodePermision") {
        IsChanged = false;
        $get(MasterObj + "CmbCreditType").focus();
        $get(MasterObj + "CmbCreditType").setActive();
    }
    //------------------------------------------------------------
    if (StrVal == "ShouldBeOpen") {
        IsChanged = false;
        if (document.getElementById(MasterObj + "ShouldBeOpen").value == 1)
            resize(document.getElementById("ImgOpen"));
        else
            if (document.getElementById("tdClose").style.display == "inline")
                resize(document.getElementById("ImgClose"));
    }
    //------------------------------------------------------------
    if (StrVal == "RefreshPerson") {
        if ($get(MasterObj + "txtPersonName").value == "" && $get(MasterObj + "txtPersonCode").value != "") {
            alert("کد پرسنلي نا معتبر است")
            $get(MasterObj + "txtPersonCode").value = "";
            $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
        }
        else
            $get(MasterObj + "txtPersonName").setAttribute("PersonCode", $get(MasterObj + "txtPersonCode").value);
        $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", $get(MasterObj + "txtJPersonCode").value);
    }
    if (StrVal == "RefreshJPerson") {
        if ($get(MasterObj + "txtJPersonName").value == "" && $get(MasterObj + "txtJPersonCode").value != "") {
            alert("کد پرسنلي نا معتبر است")
            $get(MasterObj + "txtJPersonCode").value = "";
            $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", "");
        }
        else
            $get(MasterObj + "txtJPersonName").setAttribute("PersonCode", $get(MasterObj + "txtJPersonCode").value);
        $get(MasterObj + "txtPersonName").setAttribute("PersonCode", $get(MasterObj + "txtPersonCode").value);
    }
   
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    SaveFlagNew = 0;
    if ($get(MasterObj + "CmbCreditType").innerHTML == "") {
        optionEl = document.createElement("OPTION")
        $get(MasterObj + "CmbCreditType").options.add(optionEl)
    }

}
//====================================================================================
function window.onbeforeunload() {
    if (ChangeCredit && document.getElementById(MasterObj + "txtSubmit").value != "ShouldBeOpen") {
        if ($get(MasterObj + "txtSTime").value >= 24 || $get(MasterObj + "txtETime").value >= 24) {
            $get(MasterObj + "txtSTime").value = '00:00';
            $get(MasterObj + "txtETime").value = '00:00';
        }
        return "آيا مايل به بستن فرم هستيد؟";
    }
    if (document.getElementById(MasterObj + "txtSubmit").value != "ShouldBeOpen" && ($get(MasterObj + "txtSTime").value >= 24 || $get(MasterObj + "txtETime").value >= 24)) {
        if ($get(MasterObj + "txtSTime").value >= 24 || $get(MasterObj + "txtETime").value >= 24) {
            $get(MasterObj + "txtSTime").value = '00:00';
            $get(MasterObj + "txtETime").value = '00:00';
        }
        return "آيا مايل به بستن فرم هستيد؟";
    }
}
//------------------
function onchangeItem() {
    ChangeCredit = true;
}
//----------------
function OnClickBtnShowCredit() {
    var SDate = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
    var EDate = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        SDate = SDate.split("/")[2] + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0]
        EDate = EDate.split("/")[2] + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0]
    var PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    var PersonName = $get(MasterObj + "CmbPerson_txtName").value;
        if (SDate == "" || EDate == "" || PersonCode == "") {
            alert("اطلاعات وارد شده کافي نمي باشد")
        }
        else {
            var url = "../Reports/DocInfo.aspx?PersonCode=" + encode64(PersonCode)
               + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
               + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
               + "&PageMode=1&GrdHeight=480px"
               + "&PersonName=" + PersonName
               + "&SD=" + SDate + "&ED=" + EDate
               + "&SDate=" + encode64(SDate)
               + "&EDate=" + encode64(EDate)
               + "&ModeDaily=1"          
               + "&HashFlag=1";           
            window.showModelessDialog(encodeURI(url), window, "dialogHeight: 550px;dialogWidth: 1100px;Bottom:0pX;center: no;help: no;resizable:1;status: no;minimize: yes;");
        }
}