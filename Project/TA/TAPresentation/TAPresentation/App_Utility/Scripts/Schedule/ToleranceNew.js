
window.name = "ToleranceNew"
aspnetForm.target = "ToleranceNew"
//========================================Ajax=================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1") {
            SetMsg($get(MasterObj + "txtAlert").value);
            window.returnValue = 1
        }
        else
            alert($get(MasterObj + "txtAlert").value);
        $get(MasterObj + "txtAlert").value = "";
    }

    if ($get(MasterObj + "txtUpdateXml").value != "") {
        if (document.getElementById(MasterObj + "txtSubmit").value == "Combo") {
            var strXml = $get(MasterObj + "txtUpdateXml").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/ScheduleEntity/ToleranceDescription");
            if (oXmlNodes.length > 0)
                $get(MasterObj + "cmbDetailCollection").value = oXmlNodes.item(0).selectSingleNode("DetailCollectionID").text
        }
    }
    $get(MasterObj + "txtSubmit").value = "";
}
//==========================================On Load==============================================
BindPage();
//=========================================Functionality=========================================
function BindPage() {

    if ($get(MasterObj + "txtUpdateXml").value != "") {
        var strXml = $get(MasterObj + "txtUpdateXml").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/ScheduleEntity/ToleranceDescription");
        //        alert(strXml)
        if (oXmlNodes.length > 0) {
            var Active = oXmlNodes.item(0).selectSingleNode("Active").text
            if (Active == 1)
                $get(MasterObj + "rdbActive").checked = true
            else
                $get(MasterObj + "rdbNoActive").checked = true
            var InOut = oXmlNodes.item(0).selectSingleNode("Type").text
            if (InOut == 1) {
                $get(MasterObj + "chkIn").checked = true
            }
            else if (InOut == 2) {
                $get(MasterObj + "chkOut").checked = true
            }
            else if (InOut == 3) {
                $get(MasterObj + "chkIn").checked = true
                $get(MasterObj + "chkOut").checked = true
            }
            else {
                $get(MasterObj + "chkIn").checked = false
                $get(MasterObj + "chkOut").checked = false
            }

            var Day = oXmlNodes.item(0).selectSingleNode("DayBeforeAfter").text
            if (Day == 0) {
                $get(MasterObj + "ChkNextDay").checked = false
                $get(MasterObj + "ChkLastDay").checked = false
            }
            if (Day == 1) {
                $get(MasterObj + "ChkNextDay").checked = true
                $get(MasterObj + "ChkLastDay").checked = false
            }
            if (Day == 2) {
                $get(MasterObj + "ChkNextDay").checked = false
                $get(MasterObj + "ChkLastDay").checked = true
            }

            var SDate = oXmlNodes.item(0).selectSingleNode("StartDate").text
            if (SDate.substr(0, 2) != '13')
                SDate = '13' + SDate;
            $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
            $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
            $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            var EDate = oXmlNodes.item(0).selectSingleNode("EndDate").text
            if (EDate.substr(0, 2) != '13')
                EDate = '13' + EDate;
            $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
            $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
            $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Description").text
            $get(MasterObj + "txtStime").value = oXmlNodes.item(0).selectSingleNode("StartTime").text
            $get(MasterObj + "txtEtime").value = oXmlNodes.item(0).selectSingleNode("endTime").text
            $get(MasterObj + "txtRtime").value = oXmlNodes.item(0).selectSingleNode("ReplaceTime").text
            $get(MasterObj + "cmbSchedule").value = oXmlNodes.item(0).selectSingleNode("Scheduleid").text
            $get(MasterObj + "cmbGroup").value = oXmlNodes.item(0).selectSingleNode("GroupID").text
            $get(MasterObj + "cmbStructure").value = oXmlNodes.item(0).selectSingleNode("Structureid").text
            onchangecmbStructure()
            //            $get(MasterObj + "cmbDetailCollection").value = oXmlNodes.item(0).selectSingleNode("DetailCollectionID").text
            //            alert(oXmlNodes.item(0).selectSingleNode("DetailCollectionID").text)
            $get(MasterObj + "cmbDetailCollection").value = oXmlNodes.item(0).selectSingleNode("DetailCollectionID").text
            if (oXmlNodes.item(0).selectSingleNode("Personelid").text != "0")
                $get(MasterObj + "CmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("Personelid").text;
            $get(MasterObj + "CmbPerson_txtName").value = oXmlNodes.item(0).selectSingleNode("PersonelName").text;
            if (oXmlNodes.item(0).selectSingleNode("Cardkhanno").text != "0")
                $get(MasterObj + "txtCardKhanNo").value = oXmlNodes.item(0).selectSingleNode("Cardkhanno").text;
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    if (CheckNotEmptyData()) {
        MakeXML()
        document.getElementById(MasterObj + "txtSubmit").value = "Save";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeXML() {
    var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
    if (SDate == "//") SDate = ""
    if (EDate == "//") EDate = ""
    SDate = SDate.substr(2, 8);
    EDate = EDate.substr(2, 8);

    var Active = 0
    if ($get(MasterObj + "rdbActive").checked)
        Active = 1

    var InOut = 0
    if ($get(MasterObj + "chkIn").checked)
        InOut = 1
    else if ($get(MasterObj + "chkOut").checked)
        InOut = 2

    if (($get(MasterObj + "chkIn").checked) && ($get(MasterObj + "chkOut").checked))
        InOut = 3

    var Day = 0
    if ($get(MasterObj + "ChkNextDay").checked)
        Day = 1
    if ($get(MasterObj + "ChkLastDay").checked)
        Day = 2

    var str = ""
    str += "<Root>"
    //====================================================================================
    var strXml = document.getElementById(MasterObj + "txtMultiStructure").value;
    var oXmlDoc = "";
    if (window.ActiveXObject) {
        oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml)
    }
    else {
        var parser = new DOMParser();
        oXmlDoc = parser.parseFromString(strXml, 'text/xml');
    }
    if (strXml != '' && strXml != 'undefined' && strXml != '<Root></Root>') {
    $(oXmlDoc)
        .find("ID")
        .each(function () {
            str += "<Tb>"
            str += "<DayBeforeAfter>" + Day + "</DayBeforeAfter>"
            str += "<STime>" + $get(MasterObj + "txtStime").value + "</STime>"
            str += "<ETime>" + $get(MasterObj + "txtEtime").value + "</ETime>"
            str += "<RTime>" + $get(MasterObj + "txtRtime").value + "</RTime>"
            if (SDate != "")
                str += "<StartDate>" + SDate + "</StartDate>";
            if (EDate != "")
                str += "<EndDate>" + EDate + "</EndDate>";

            str += "<Active>" + Active + "</Active>"
            if (InOut != 0)
                str += "<InOut>" + InOut + "</InOut>";
            if ($get(MasterObj + "txtDesc").value != "")
                str += "<Desc>" + $get(MasterObj + "txtDesc").value + "</Desc>";
            if ($get(MasterObj + "cmbSchedule").value != "0")
                str += "<Schedule>" + $get(MasterObj + "cmbSchedule").value + "</Schedule>";
            if ($get(MasterObj + "cmbGroup").value != "0")
                str += "<Group>" + $get(MasterObj + "cmbGroup").value + "</Group>";
            //===========================================================================
            //if ($get(MasterObj + "cmbStructure").value != "0")
            //str += "<Structure>" + $get(MasterObj + "cmbStructure").value + "</Structure>";
           str += "<Structure>" + $(this).text() + "</Structure>";
            //=================================================================================
            if ($get(MasterObj + "cmbDetailCollection").value != "0")
                str += "<DetailCollection>" + $get(MasterObj + "cmbDetailCollection").value + "</DetailCollection>";

            if ($get(MasterObj + "CmbPerson_txtCode").value != "")
                str += "<PersonCode>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonCode>";
            if ($get(MasterObj + "txtCardKhanNo").value != "")
                str += "<CardKhanNo>" + $get(MasterObj + "txtCardKhanNo").value + "</CardKhanNo>";
            str += "</Tb>"
        });
    } else {
        str += "<Tb>"
        str += "<DayBeforeAfter>" + Day + "</DayBeforeAfter>"
        str += "<STime>" + $get(MasterObj + "txtStime").value + "</STime>"
        str += "<ETime>" + $get(MasterObj + "txtEtime").value + "</ETime>"
        str += "<RTime>" + $get(MasterObj + "txtRtime").value + "</RTime>"
        if (SDate != "")
            str += "<StartDate>" + SDate + "</StartDate>";
        if (EDate != "")
            str += "<EndDate>" + EDate + "</EndDate>";

        str += "<Active>" + Active + "</Active>"
        if (InOut != 0)
            str += "<InOut>" + InOut + "</InOut>";
        if ($get(MasterObj + "txtDesc").value != "")
            str += "<Desc>" + $get(MasterObj + "txtDesc").value + "</Desc>";
        if ($get(MasterObj + "cmbSchedule").value != "0")
            str += "<Schedule>" + $get(MasterObj + "cmbSchedule").value + "</Schedule>";
        if ($get(MasterObj + "cmbGroup").value != "0")
            str += "<Group>" + $get(MasterObj + "cmbGroup").value + "</Group>";
        //===========================================================================
        if ($get(MasterObj + "cmbStructure").value != "0")
        str += "<Structure>" + $get(MasterObj + "cmbStructure").value + "</Structure>";
        //=================================================================================
        if ($get(MasterObj + "cmbDetailCollection").value != "0")
            str += "<DetailCollection>" + $get(MasterObj + "cmbDetailCollection").value + "</DetailCollection>";

        if ($get(MasterObj + "CmbPerson_txtCode").value != "")
            str += "<PersonCode>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonCode>";
        if ($get(MasterObj + "txtCardKhanNo").value != "")
            str += "<CardKhanNo>" + $get(MasterObj + "txtCardKhanNo").value + "</CardKhanNo>";
        str += "</Tb>"
    }
    //======================================================================================
       str += "</Root>";
    $get(MasterObj + "txtXMLSave").value = str
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckNotEmptyData() {

    var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
    if (SDate == "//") SDate = ""
    if (EDate == "//") EDate = ""

    if ((SDate == "" && EDate != "") || (SDate != "" && EDate == "")
     || SDate > EDate) {
        alert("تاریخ را درست وارد کنید")
        return;
    }

    if ($get(MasterObj + "txtStime").value == "") {
        alert('ساعت شروع را وارد نماييد')
        $get(MasterObj + "txtStime").focus()
        return false
    }
    else if ($get(MasterObj + "txtEtime").value == "") {
        alert('ساعت پايان را وارد نماييد')
        $get(MasterObj + "txtEtime").focus()
        return false
    }
    else if ($get(MasterObj + "txtRtime").value == "") {
        alert('ساعت جايگزين را وارد نماييد')
        $get(MasterObj + "txtRtime").focus()
        return false
    }
    else if ($get(MasterObj + "cmbStructure").value == "0") {
        if (document.getElementById(MasterObj + "txtMultiStructure").value == '' || document.getElementById(MasterObj + "txtMultiStructure").value=='undefined') {
            var Msg = "  ساختار انتخاب نشده و تلورانس برای همه ساختارها اعمال می شود";
            if (confirm(Msg) == true) {
                return true;
            } else {
                return false;
            }
        }
    }
    return true
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    ClearAll()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function ClearAll() {
    $get(MasterObj + "KCalSDate_txtDay").value = "";
    $get(MasterObj + "KCalSDate_txtMonth").value = "";
    $get(MasterObj + "KCalSDate_txtYear").value = "";
    $get(MasterObj + "KCalEDate_txtDay").value = "";
    $get(MasterObj + "KCalEDate_txtMonth").value = "";
    $get(MasterObj + "KCalEDate_txtYear").value = "";
    $get(MasterObj + "KCalSDate_txtCalendar").value = "";
    $get(MasterObj + "KCalEDate_txtCalendar").value = "";
    $get(MasterObj + "chkIn").checked = false
    $get(MasterObj + "chkOut").checked = false
    $get(MasterObj + "txtStime").value = ""
    $get(MasterObj + "txtEtime").value = ""
    $get(MasterObj + "txtRtime").value = ""
    $get(MasterObj + "rdbActive").checked = true
    $get(MasterObj + "cmbSchedule").value = 0
    $get(MasterObj + "cmbGroup").value = 0
    $get(MasterObj + "CmbPerson_txtPCode").value = ""
    $get(MasterObj + "CmbPerson_txtName").value = ""
    $get(MasterObj + "txtDesc").value = ""
    $get(MasterObj + "cmbDetailCollection").value = 0
    $get(MasterObj + "cmbStructure").value = 0
    $get(MasterObj + "txtCardKhanNo").value = ""
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChkNextDay(obj) {
    if ($get(MasterObj + "ChkNextDay").checked) {
        $get(MasterObj + "ChkLastDay").disabled = true
        $get(MasterObj + "ChkLastDay").checked = false
    } else {
        $get(MasterObj + "ChkLastDay").disabled = false
        $get(MasterObj + "ChkLastDay").checked = false
    }
}

function OnClickChkLastDay(obj) {
    if ($get(MasterObj + "ChkLastDay").checked)

        $get(MasterObj + "ChkNextDay").disabled = true
    else
        $get(MasterObj + "ChkNextDay").disabled = false
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onchangecmbStructure() {
    document.getElementById(MasterObj + "txtMultiStructure").value = '';
    document.getElementById(MasterObj + "txtSubmit").value = "Combo";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
// ================================================================
function onClickselectStructure() {
    $get(MasterObj + "txtStructure").value = $get(MasterObj + "cmbStructure").value;
    $get(MasterObj + "cmbStructure").value = "0";
    onchangecmbStructure();

    var strUrl = "SelectStructure.aspx?StructureID=" + $get(MasterObj + "txtStructure").value;
   
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 800px;dialogWidth: 800px;center: Yes;help: no;status: no');
    document.getElementById(MasterObj + "txtMultiStructure").value = rValue;
}