//document.getElementsByTagName("body")[0].scroll = "no";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
document.body.style.overflowX = "hidden";
document.body.style.overflowY = "hidden";
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}

function EndRequestHandler(sender, args) {

    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";

    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {

        alert($get(MasterObj + "txtAlert").value);
        $get(MasterObj + "txtAlert").value = ""

    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtSaveXml").value = "";

    if (StrVal == "Save") {
        RefreshParentRow()
        if (document.getElementById(MasterObj + "txtClosePage").value == "1") {
            document.getElementById(MasterObj + "txtClosePage").value = 0
            window.close()
        }
    }

}
//----------------------------------------------------------------
function RefreshParentRow() {
    try {
        if ($get(MasterObj + "txtCalcOption").value != "0") {
            win = window.dialogArguments
            if (win.RefreshThisRow)
                win.RefreshThisRow()
            else {
                Pageunload()
            }
        }
    }
    catch (e) {
        Pageunload()
    }
}

var win = null;
var lastValue = ''
var LastSelectedRow = null;
var LastSelectedRowClass = "";
/////-------------------------------------------
//PageLoad
win = window.dialogArguments
window.name = "EnterCredit"
aspnetForm.target = window.name
////------------------------
$get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
$get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
$get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);
$get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
$get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
$get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
$get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
$get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);
$get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
$get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
PageLoad()
function PageLoad() {

    if ($get(MasterObj + "txtAdminCredit").value == "1") {

        var OGrid = document.getElementById("GrdCreditRd");

        document.getElementById("FilterTable").style.display = "none";
        document.getElementById("TdToolBar").style.display = "none";

        if (OGrid != null)
            OnClickGrd(OGrid.rows(1));
        else {
            window.returnValue = ""
            window.close();
        }
    }


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetDate(TbObj, RowIndex, CellIndex) {
    var GridSDate = '', GridEDate = '';
    var Year = '';
    var Month = '';
    var Day = '';

    var ReverseRealVal = TbObj.rows(RowIndex).cells(1).getAttribute("RealVal");
    var RealVal = ReverseRealVal.split("/")[2] + "/" + ReverseRealVal.split("/")[1] + "/" + ReverseRealVal.split("/")[0];
  
    if (TbObj.rows(RowIndex).cells(6).firstChild.value < TbObj.rows(RowIndex).cells(5).firstChild.value) {
        TbObj.rows(RowIndex).cells(1).innerText = ReverseRealVal;
        var NextDate = shdAdd("13" + RealVal, 1);
        TbObj.rows(RowIndex).cells(2).innerText = NextDate.split("/")[2] + "/" + NextDate.split("/")[1] + "/" + NextDate.split("/")[0].substr(2, 2);
    }
    else {
        TbObj.rows(RowIndex).cells(1).innerText = ReverseRealVal;
        TbObj.rows(RowIndex).cells(2).innerText = ReverseRealVal;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function ModifyXMLCredit(obj) {  
    var TbObj = obj.parentElement.parentElement.parentElement;
    if (TbObj.tagName != "Table")
        TbObj = obj.parentElement.parentElement.parentElement.parentElement;
    var RowIndex = obj.parentElement.parentElement.rowIndex;
    var CellIndex = obj.parentElement.cellIndex;
    var SaveXml = $get(MasterObj + "txtSaveXml").value;

    SetDate(TbObj, RowIndex, CellIndex);

    if (SaveXml == "") {
        SaveXml = '<Root>' + MakeXML(TbObj, RowIndex, CellIndex) + "</Root>"
    }
    else if (SaveXml != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(SaveXml);


        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[RowIndex=" + RowIndex + " and PersonCode='" + TbObj.rows(RowIndex).cells(3).innerText + "']");

        if (oXmlNodes.length == 0) {
            if (TbObj.rows(RowIndex).cells(9).firstChild.value != "0") {
                SaveXml = SaveXml.replace("</Root>", MakeXML(TbObj, RowIndex, CellIndex) + "</Root>")
            }
        }

        else if (oXmlNodes.length != 0) {
            oXmlNodes.item(0).selectSingleNode("StartTime").text = TbObj.rows(RowIndex).cells(5).firstChild.value;
            oXmlNodes.item(0).selectSingleNode("EndTime").text = TbObj.rows(RowIndex).cells(6).firstChild.value;
            oXmlNodes.item(0).selectSingleNode("CreditType").text = TbObj.rows(RowIndex).cells(8).firstChild.value
            oXmlNodes.item(0).selectSingleNode("Des").text = TbObj.rows(RowIndex).cells(9).firstChild.value;
            SaveXml = oXmlDoc.xml;
        }
    }
    $get(MasterObj + "txtSaveXml").value = SaveXml;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeXML(TbObj, RowIndex, CellIndex) {

    var SaveXml = "";
    var GridSDate = '', GridEDate = '';
    var Year = '';
    var Month = '';
    var Day = '';

    Year = TbObj.rows(RowIndex).cells(1).innerText.substring(6, 8);
    Month = TbObj.rows(RowIndex).cells(1).innerText.substring(3, 5);
    Day = TbObj.rows(RowIndex).cells(1).innerText.substring(0, 2);
    GridSDate = Day + "/" + Month + "/" + "13" + Year

    Year = TbObj.rows(RowIndex).cells(2).innerText.substring(6, 8);
    Month = TbObj.rows(RowIndex).cells(2).innerText.substring(3, 5);
    Day = TbObj.rows(RowIndex).cells(2).innerText.substring(0, 2);
    GridEDate = Day + "/" + Month + "/" + "13" + Year

    SaveXml += "<Tb>"
    SaveXml += "<RowIndex>" + RowIndex + "</RowIndex>"
    SaveXml += "<PersonCode>" + TbObj.rows(RowIndex).cells(2).innerText + "</PersonCode>"
    SaveXml += "<Type>" + TbObj.rows(RowIndex).CodeGroupID + "</Type>"
    SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
    SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
    SaveXml += "<CreditType>" + TbObj.rows(RowIndex).cells(8).firstChild.value + "</CreditType>"
    if (TbObj.rows(RowIndex).cells(5).firstChild.value == '00:00' && TbObj.rows(RowIndex).cells(6).firstChild.value == '00:00') {

        SaveXml += "<Daily>1</Daily>"
        SaveXml += "<StartTime>00:00</StartTime>"
        SaveXml += "<EndTime>00:00</EndTime>"
    }
    else {
        SaveXml += "<Daily>2</Daily>"
        SaveXml += "<StartTime>" + TbObj.rows(RowIndex).cells(5).firstChild.value + "</StartTime>"
        SaveXml += "<EndTime>" + TbObj.rows(RowIndex).cells(6).firstChild.value + "</EndTime>"
    }

    SaveXml += "<Des>" + TbObj.rows(RowIndex).cells(9).firstChild.value + "</Des>"
    SaveXml += "<PersonID>" + TbObj.rows(RowIndex).PersonelID + "</PersonID>"
    SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
    if ((GridSDate != GridEDate && TbObj.rows(RowIndex).cells(6).firstChild.value < TbObj.rows(RowIndex).cells(5).firstChild.value))
        SaveXml += "<_Flags>1</_Flags>";
    SaveXml += "</Tb>"
    return SaveXml;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function Pageunload() {
    //            win.document.getElementById(MasterObj + "txtSubmit").value = "Show";
    //            win.document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {
    window.returnValue = "";
    window.close()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function OnClickBtnOk() {
//            var OGrid = document.getElementById("GrdCreditRd");
//            var str = "";
//            if (OGrid != null) {
//                if ($get(MasterObj + "txtAdminCredit").value == "1") {
//                    for (var i = 1; i < OGrid.rows.length; i++) {
//                        if (OGrid.rows(i).cells(0).firstChild.checked == true)
//                            str = OGrid.rows(i).cells(2).firstChild.value + "#" + OGrid.rows(i).cells(3).firstChild.value;
//                    }

//                }
//            }
//            window.returnValue = str;
//            window.close();

//        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function OnKeydowntxtPersonCode() {
//            if (event.keyCode == 13) {
//                OnClickBtnFilter()
//            }
//        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    var FromPersonCode = "";
    if ($get(MasterObj + "CmbFromPersonelInfo_txtCode").value != undefined)
        FromPersonCode = $get(MasterObj + "CmbFromPersonelInfo_txtCode").value.trim();
    $get(MasterObj + "txtFromPersonCode").value = FromPersonCode

    var ToPrsCode = "";
    if ($get(MasterObj + "CmbToPersonelInfo_txtCode").value != undefined)
        ToPrsCode = $get(MasterObj + "CmbToPersonelInfo_txtCode").value.trim();
    $get(MasterObj + "txtToPersonCode").value = ToPrsCode
    $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
    $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
    $get(MasterObj + "txtSubmit").value = "Search";
    $get(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function OnClickBtnSave() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (CreateXmlSave() && $get(MasterObj + "txtSaveXml").value != "<Root></Root>") {
        if (checkNotEmpty()) {
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateXmlSave() {
    var OGrid = document.getElementById("GrdCredit");
    var SaveXml = "<Root>";
    var GridSDate = '', GridEDate = '';
    var Year = '';
    var Month = '';
    var Day = '';
    var TbObj;
    var flagDo = 0
    $get(MasterObj + "txtSaveXml").value = ""

    if (OGrid)
        var len = OGrid.rows.length
    else
        return false

    for (var RowIndex = 1; RowIndex < len; RowIndex++) {
        if (OGrid.rows(RowIndex).cells(8).firstChild.value != 0 && OGrid.rows(RowIndex).cells(8).firstChild.value != ""
                && OGrid.rows(RowIndex).cells(8).firstChild.disabled != true
                ) {
            flagDo = 1
            Year = OGrid.rows(RowIndex).cells(1).innerText.substring(6, 8);
            Month = OGrid.rows(RowIndex).cells(1).innerText.substring(3, 5);
            Day = OGrid.rows(RowIndex).cells(1).innerText.substring(0, 2);
            GridSDate = Day + "/" + Month + "/" + "13" + Year

            Year = OGrid.rows(RowIndex).cells(2).innerText.substring(6, 8);
            Month = OGrid.rows(RowIndex).cells(2).innerText.substring(3, 5);
            Day = OGrid.rows(RowIndex).cells(2).innerText.substring(0, 2);
            GridEDate = Day + "/" + Month + "/" + "13" + Year

            SaveXml += "<Tb>"
            SaveXml += "<RowIndex>" + (parseInt(RowIndex, 10) - 1) + "</RowIndex>"
            SaveXml += "<PersonCode>" + OGrid.rows(RowIndex).cells(3).innerText + "</PersonCode>"
            SaveXml += "<Type>" + OGrid.rows(RowIndex).CodeGroupID + "</Type>"
            SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
            SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
            SaveXml += "<CreditType>" + OGrid.rows(RowIndex).cells(8).firstChild.value + "</CreditType>"
            if (OGrid.rows(RowIndex).cells(5).firstChild.value == '00:00' && OGrid.rows(RowIndex).cells(6).firstChild.value == '00:00') {

                SaveXml += "<Daily>1</Daily>"
                SaveXml += "<StartTime>00:00</StartTime>"
                SaveXml += "<EndTime>00:00</EndTime>"
            }
            else {
                SaveXml += "<Daily>2</Daily>"
                SaveXml += "<StartTime>" + OGrid.rows(RowIndex).cells(5).firstChild.value + "</StartTime>"
                SaveXml += "<EndTime>" + OGrid.rows(RowIndex).cells(6).firstChild.value + "</EndTime>"
            }

            SaveXml += "<Des>" + OGrid.rows(RowIndex).cells(9).firstChild.value + "</Des>"
            SaveXml += "<PersonID>" + OGrid.rows(RowIndex).PersonelID + "</PersonID>"
            SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
            if (((GridSDate != GridEDate && OGrid.rows(RowIndex).cells(6).firstChild.value < OGrid.rows(RowIndex).cells(5).firstChild.value)))
                SaveXml += "<_Flags>1</_Flags>";
            SaveXml += "</Tb>"
        }

    }
    SaveXml += "</Root>"
    $get(MasterObj + "txtSaveXml").value = SaveXml

    if (flagDo == 0)//هیچ سطری عوض نشده است
        return false

    if (len > 0)
        return true
    else
        return false

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function onClickImgRefreshPersonSearch() {
//            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=" + $get(MasterObj + "txtMenuItemID").value + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
//            var Result = "";
//            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

//            if (Result != "") {
//                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
//                xmlDoc.loadXML(Result);
//                xmlDoc.setProperty("SelectionLanguage", "XPath");
//                var xmlNodes;
//                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
//                if (xmlNodes.length != 0) {
//                    var PCode;
//                    PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
//                    $get(MasterObj + "txtPersonCode").value = PCode;
//                    $get(MasterObj + "PersonNameSearch").value = xmlNodes.item(0).selectSingleNode('Family').text
//                }
//            }
//        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function OnBlurtxtPersonCode() {
//            if ($get(MasterObj + "txtPersonCode").value == "") {
//                $get(MasterObj + "PersonNameSearch").value = "";
//                lastPersonCode = "";
//            }
//            else
//                if ($get(MasterObj + "txtPersonCode").value != lastPersonCode) {
//                lastPersonCode = $get(MasterObj + "txtPersonCode").value
//                $get(MasterObj + "txtSubmit").value = "PersonCodeSearch";
//                $get(MasterObj + "BtnSubmit").click();

//            }
//        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onblurtxtTime(obj) {
    var oRow = obj;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement

    if (oRow.cells(5).firstChild.value == "") {
        oRow.cells(5).firstChild.value = "00:00"
        oRow.cells(5).firstChild.select()
    }
    if (oRow.cells(6).firstChild.value == "") {
        oRow.cells(6).firstChild.value = "00:00"
        oRow.cells(5).firstChild.select()
    }
    if ((oRow.cells(5).firstChild.value == "00:00") && (oRow.cells(5).firstChild.value == "00:00")) {
        oRow.cells(7).firstChild.innerText = "کامل"
        return;
    }
    var STime = GetMinute(oRow.cells(5).firstChild.value)
    var ETime = GetMinute(oRow.cells(6).firstChild.value)
    if (STime > ETime) {
        ETime = ETime + 1440;
    }
    var VTime = parseInt(ETime) - parseInt(STime)
    oRow.cells(7).firstChild.innerText = GetTime(VTime)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function GetTime(minute) {

    var hour = minute / 60
    hour = parseInt(hour, 10)
    var min = minute % 60
    min = parseInt(min, 10)
    var time = ""
    if (hour < 10) {
        time = "0" + hour + ":"
    }
    else {
        time = hour + ":"
    }
    if (min < 10) {
        time += "0" + min
    }
    else {
        time += min
    }
    return time
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function GetMinute(time) {
    if (time == "")
        return 0
    var arr
    arr = time.split(":")
    arr[0] = parseInt(arr[0], 10)
    arr[1] = parseInt(arr[1], 10)
    return (arr[0] * 60 + arr[1])
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onfocusTxtTime(obj) {
    obj.select();
    obj.focus();
    lastValue = obj.value
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmpty() {
    var TbObj = document.getElementById("GrdCredit")
    var SaveXml = $get(MasterObj + "txtSaveXml").value;

    if (SaveXml != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(SaveXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");

        for (var i = 0; i < oXmlNodes.length; i++) {
            var RowIndex = parseInt(oXmlNodes.item(0).selectSingleNode("RowIndex").text)
            if (oXmlNodes.item(0).selectSingleNode("StartTime").text > oXmlNodes.item(0).selectSingleNode("EndTime").text
             && oXmlNodes.item(0).selectSingleNode("StartDate").text == oXmlNodes.item(0).selectSingleNode("EndDate").text) {
                alert("زمان شروع بايد کوچکتر از زمان خاتمه باشد")
                TbObj.rows(RowIndex).cells(5).firstChild.focus()
                return false
            }
            else if (oXmlNodes.item(0).selectSingleNode("CreditType").text == "0") {
                alert(" لطفا نوع مجوز را انتخاب نماييد")
                TbObj.rows(RowIndex).cells(8).firstChild.focus()
                return false
            }
        }
    }
    else {
        alert("هيچ آيتمی جهت ذخيره انتخاب نشده")
        return false
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickRdSelectCredit(obj) {
    var SelectedRow = obj.parentElement.parentElement;
    var OGrid = document.getElementById("GrdCreditRd");

    for (var i = 1; i < OGrid.rows.length; i++) {
        if (OGrid.rows(i).cells(1).firstChild.checked == true)
            OGrid.rows(i).cells(1).firstChild.checked = false;
    }
    OGrid.rows(SelectedRow.rowIndex).cells(1).firstChild.checked = true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//**********************************************************************************************
function checkEnter(obj) {
    var row = obj.parentElement.parentElement;
    var OGrid = document.getElementById("GrdCreditRd");

    var str = "";
    if (OGrid != null) {
        if (window.event.keyCode == 13) {

            if ($get(MasterObj + "txtAdminCredit").value == "1") {
                for (var i = 0; i < OGrid.rows.length; i++) {
                    if (OGrid.rows(i).className == "CssSelectedItemStyle") {
                        str = OGrid.rows(i).cells(2).firstChild.value
                                + "#" + OGrid.rows(i).cells(3).firstChild.value + "#" + OGrid.rows(i).cells(1).innerText;
                    }
                }
            }
            window.returnValue = str;
            window.close();
        }
        if (window.event.keyCode == 40) {
            var rowIndex = parseInt(row.rowIndex) + 1;

            if (row.parentElement.rows(rowIndex) != null) {
                OGrid.rows(rowIndex).cells(2).firstChild.focus();
                OnClickGrd(OGrid.rows(rowIndex));
            }
        }
        if (window.event.keyCode == 38) {
            var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) - 1;
            if (rowIndex != 0) {
                OGrid.rows(rowIndex).cells(2).firstChild.focus();
                OnClickGrd(OGrid.rows(rowIndex));
            }
        }
        if (window.event.keyCode == 27) {
            window.returnValue = "";
            window.close();

        }
    }
}
//========================================================
function onchangeCmbCreditType() {
    document.getElementById(MasterObj + "txtMainCode").value = document.getElementById(MasterObj + "CmbCodeType").value;

}
function OnClickBtnCardexInfo() {
    var PersonID = $get(MasterObj + "CmbFromPersonelInfo_txtCode").value
    var url2 = "../Cardex/CardexReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
              + "&PersonCode=" + PersonID
               + "&WPID=" + document.getElementById(MasterObj + "txtWPID").value
    var winPro = "dialogHeight: 760px;dialogWidth: 950px;center: Yes;help: no;status: no";
    var CardexInfoDialogObj = window.showModalDialog(encodeURI(url2), window, winPro)
}
//==========================================================
function OnClickbtnCopy() {
    var OGrid = document.getElementById("GrdCredit");
    var OldVal;
    if (OGrid !=null)
        for (var i = 1; i < OGrid.rows.length; i++) {
            OldVal = OGrid.rows(i).cells(8).childNodes(0).value;
            OGrid.rows(i).cells(8).childNodes(0).value = document.getElementById(MasterObj + "cmbDfaultCredit").value;
            if (OGrid.rows(i).cells(8).childNodes(0).value != document.getElementById(MasterObj + "cmbDfaultCredit").value)
                OGrid.rows(i).cells(8).childNodes(0).value = OldVal;
            else         
            OGrid.rows(i).cells(9).childNodes(0).value = document.getElementById(MasterObj + "txtDefaultDesc").value;
    }
}
//==========================================================
function OnClickBtnStatus(obj) {
    var OGrid = document.getElementById("GrdCredit");
    var Row = obj.parentElement.parentElement;
    var RowIndex = Row.rowIndex;
    var WfNew = OGrid.rows(RowIndex).getAttribute("WfNew");
    var WfDocID = OGrid.rows(RowIndex).getAttribute("WfDocID");
    var DocID = OGrid.rows(RowIndex).getAttribute("CreditID");
    if (WfNew == 1) {
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WfDocID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    }
    else
        window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WfDocID + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
}
//=========================================================
function window.onbeforeunload() {
//    if ($("#GrdCreditRd").find("tr").length > 0)
//        if ($("#GrdCreditRd").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != true }).length > 0)
//            return "آيا مايل به بستن فرم هستيد؟";
//    if ($("#GrdCredit").find("tr").length > 0) {
//        if ($("#GrdCredit").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != disabled }).length > 0)
//            return "آيا مايل به بستن فرم هستيد؟";
//    }
}
/******************************************************/
function shdAdd(Sdate, days) {
    if (!Isvaliddate(Sdate))
        return false
    days = parseInt(days)
    if (days != 0)
        return (InttoSHD1(this.SHDtoInt1(Sdate) + days))
    else
        return Sdate
}
/******************************************************/
function Isvaliddate(txt) {
    var le, t1, t2, sal, mah, roz
    var arr1, arr2, arr3
    var x = 0
    while (x < getCntChar('/', txt + "/")) {
        arr1 = getArray(txt + "/", x, '/')
        ++x
        arr2 = getArray(txt + "/", x, '/')
        ++x
        arr3 = getArray(txt + "/", x, '/')
        ++x
    }
    if (getCntChar('/', txt) == 2) {
        roz = arr3
        mah = arr2
        sal = arr1

        le = 0
        if (sal < 100)
            sal = sal + 1300


        if (isshleap(sal))
            le = 1
        t1 = ((mah >= 1) && (mah <= 12))
        t2 = ((roz >= 1) && (roz <= 29 + le))
        t2 = (t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11))))
        t2 = (t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6))))

        return (t1 && t2)
    }
    else {
        return false
    }
}
/******************************************************/
function InttoSHD1(roz) {
    var leap, Esal, sal, mahbase, tag

    sal = 0
    mah = 0
    leap = 0
    tag = 0
    Esal = 0

    do {
        roz = roz + 36159
        sal = sal - 99
    } while (roz < 00000)

    do {
        roz = roz - 36159
        sal = sal + 99
    } while (roz > 36158)
    if ((roz != 10591) && (roz != 22644) && (roz != 36158)) {
        if ((roz >= 00000) && (roz <= 10225)) {
            tag = 1
            Esal = 0
            mahbase = 00000
        }
        if ((roz >= 10226) && (roz <= 10590)) {
            tag = 2
            Esal = 1
            mahbase = 10226
        }
        if ((roz >= 10592) && (roz <= 22278)) {
            tag = 3
            Esal = 1
            mahbase = 10592
        }
        if ((roz >= 22279) && (roz <= 22643)) {
            tag = 4
            Esal = 2
            mahbase = 22279
        }
        if ((roz >= 22645) && (roz <= 35792)) {
            tag = 5
            Esal = 2
            mahbase = 22645
        }
        if ((roz >= 35793) && (roz <= 36157)) {
            tag = 6
            Esal = 3
            mahbase = 35793
        }
    }
    else if (roz == 10591) //1342/12/30
    {
        roz = 365
        sal = sal + 1342
    }
    else if (roz == 22644) //1375/12/30
    {
        roz = 365
        sal = sal + 1375
    }
    else if (roz == 36158) //1412/12/30
    {
        roz = 365
        sal = sal + 1412
    }
    if (((tag % 2) == 1) && (((roz - mahbase + 1) % 1461) == 0)) {
        roz = roz - 1
        leap = 1
    }

    if (tag > 0) {
        roz = roz - Esal * 365
        roz = roz - parseInt(roz / 1461)
        sal = Esal + sal + parseInt(roz / 365) + 1314
        roz = roz % 365 + leap
    }

    if (roz >= 186) {
        roz = roz - 186
        mah = 6 + parseInt(roz / 30)
        roz = roz % 30
    }
    else {
        mah = parseInt(roz / 31)
        roz = roz % 31
    }
    return datechk(sal + "/" + (mah + 1) + "/" + (roz + 1))
}
/******************************************************/
function datechk(val) {
    if ((val != "") && !Isvaliddate(val)) {
        alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
        return false
    }
    else
        if (val != "") {
            var arr1, arr2, arr3
            var x = 0
            while (x < getCntChar('/', val + "/")) {
                arr1 = getArray(val + "/", x, '/')
                ++x
                arr2 = getArray(val + "/", x, '/')
                ++x
                arr3 = getArray(val + "/", x, '/')
                ++x
            }
            arr1 = arr1
            arr2 = arr2
            arr3 = arr3

            if (arr1 < 100)
                century = "13"
            else
                century = ""

            if (arr2 < 10)
                val = century + "" + arr1 + "/0" + arr2
            else
                val = century + "" + arr1 + "/" + arr2

            if (arr3 < 10)
                val += "/0" + arr3
            else
                val += "/" + arr3
            return val
        }
}
/******************************************************/
function SHDtoInt1(shd) {

    var sal, mah, roz, Tr
    var arr1, arr2, arr3


    var x = 0
    while (x < getCntChar('/', shd + "/")) {

        arr1 = getArray(shd + "/", x, '/')
        ++x
        arr2 = getArray(shd + "/", x, '/')
        ++x
        arr3 = getArray(shd + "/", x, '/')
        ++x
    }

    if (getCntChar('/', shd) == 2) {
        roz = arr3 - 1
        mah = arr2 - 1
        sal = arr1
        Tr = 0

        if (sal < 100)
            sal = 1300 + sal

        sal = sal - 1314

        while (sal < 0) {
            Tr = Tr - 36159 - 366
            sal = sal + 100
        }

        while (sal > 98) {
            Tr = Tr + 36159
            sal = sal - 99
        }

        if ((sal >= 0) && (sal <= 27))
            Tr = Tr + sal * 365 + parseInt(sal / 4)

        if ((sal >= 28) && (sal <= 60))
            Tr = Tr + sal * 365 + parseInt((sal - 1) / 4)

        if ((sal >= 61) && (sal <= 97))
            Tr = Tr + sal * 365 + parseInt((sal - 2) / 4)

        if (sal == 98)
            Tr = Tr + sal * 365 + parseInt((sal - 3) / 4)


        if (mah > 6)
            Tr = Tr + (mah - 6) * 30 + 186
        else
            Tr = Tr + mah * 31

        return (Tr + roz)

    }
    else {
        alert("اشكال در تاريخ شمسي")
        return 0
    }

}
/******************************************************/
function isshleap(sal) {
    var ybase_sh, L1

    if (sal < 100)
        sal = sal + 1300


    ybase_sh = parseInt((sal - 125) / 99) * 99 + 125


    L1 = ((sal - ybase_sh) % 99)
    if (L1 >= 98)
        return (((L1 - 89) % 4) == 0)
    else {
        if (L1 >= 61)
            return (((L1 - 62) % 4) == 0)
        else
            if (L1 >= 28)
                return (((L1 - 29) % 4) == 0)
            else
                return ((L1 % 4) == 0)
        }
    }
    /******************************************************/