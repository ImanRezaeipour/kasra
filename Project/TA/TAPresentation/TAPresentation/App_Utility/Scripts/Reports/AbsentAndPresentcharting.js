//*************************************Declaration*************************************
var str = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var SearchFlag = 0;
var AllPerson = 0;
var Present = 0;
var Absent = 0;
var DepID = 0;
var DepName = "";
document.body.scroll = "no"
document.dir = "RTL"
document.getElementById(MasterObj + "CmbType").value = "3"
document.getElementById("OToolBar_ImgRestor").style.display = "none"
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckDailyClick() {

    var oGrd = document.getElementById("GrdAbsentPresent");

    if (oGrd)
        var len = oGrd.rows.length
    else
        return
    //--------------------------------------------- 

    var oCell = window.event.srcElement
    var oRow = window.event.srcElement
    while (oCell.tagName != "TD")
        oCell = oCell.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    //---------------------------------------------
    if (oCell.cellIndex == 1 || oCell.cellIndex == 2 || oCell.cellIndex == 3 || oCell.cellIndex == 4 ||
                                  oCell.cellIndex == 5) {
        OnClickGrdAllperson(oCell);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickImgClose() {

    if ($get(MasterObj + "txtShowModal").value == "1") {
        if (win.parent.document.all.item("ImgRestore").style.display == "inline") {
            document.body.scroll = "no"
        }
    }
    else {
        if (window.parent.document.all.item("ImgRestore").style.display == "inline") {
            document.body.scroll = "no"
        }
    }
    document.getElementById("shadowMessage").style.display = "none"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgRestor() {
    //            document.body.scroll = "yes"
    //            document.documentElement.scrollTop = "yes"
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
}
//*********************************Attach Event Enter**************************************
//        document.body.attachEvent('onkeydown', onkeydownBody)
//        document.body.attachEvent('onkeypress', SetEnterSearch)
//        var keyCode = 0
//        //*************************************ThisPage***************************************
//        function SetEnter() {
//            if (event.srcElement.id == MasterObj + "txtValueSearch") {
//                if (window.event.keyCode == 13)
//                    OnClickBtnSearch()
//            }
//            else
//                window.event.keyCode = 9
//        }
//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function onkeydownBody() {
//            keyCode = event.keyCode
//            setTimeout("keyCode=0", 1000)
//        }
//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function SetEnterSearch() {
//            if (event.srcElement.id == "OToolBar_txtCurPage")
//                return;

//            if (event.srcElement.id == MasterObj + "txtValueSearch") {
//                if (window.event.keyCode == 13)
//                    OnClickBtnSearch()
//            }
//        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnTreeClick(evt) {
    var src = window.event != window.undefined ? window.event.srcElement : evt.target;
    var nodeClick = src.tagName.toLowerCase() == "a";
    var index;
    var len;
    if (nodeClick) {

        var nodeText = src.innerText || src.innerHTML;
        var nodeValue = GetNodeValue(src);
        // alert("Text: " + nodeText + "," + "Value: " + nodeValue);
        index = nodeValue.indexOf('#', 0);
        len = nodeValue.length;
        nodeValue = nodeValue.substr(index + 1, len - index);
    }
    return false; //comment this if you want postback on node click
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function GetNodeValue(node) {
    var nodeValue = "";
    var nodePath = node.href.substring(node.href.indexOf(",") + 2, node.href.length - 2);
    var nodeValues = nodePath.split("\\");
    if (nodeValues.length > 1)
        nodeValue = nodeValues[nodeValues.length - 1];
    else
        nodeValue = nodeValues[0].substr(1);

    return nodeValue;
}
//*******************************************************************************
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0"
    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
    $get(MasterObj + "txtSTimeSearch").value = $get(MasterObj + "txtSTime").value;
    $get(MasterObj + "txtETimeSearch").value = $get(MasterObj + "txtETime").value;
    if ($get(MasterObj + "txtETimeSearch").value == "00:00")
        $get(MasterObj + "txtETimeSearch").value = "";

    if ($get(MasterObj + "txtSTimeSearch").value == "00:00")
        $get(MasterObj + "txtSTimeSearch").value = "";

    if ($get(MasterObj + "txtETimeSearch").value < $get(MasterObj + "txtSTimeSearch").value)
        alert("ساعت شروع بزرگتر از ساعت پایان است");
    else {
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }

}
//*******************************************************************************
function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "1"
    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
    $get(MasterObj + "txtSTimeSearch").value = $get(MasterObj + "txtSTime").value;
    $get(MasterObj + "txtETimeSearch").value = $get(MasterObj + "txtETime").value;
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0"
    $get(MasterObj + "txtETimeSearch").value = ""
    $get(MasterObj + "txtSTimeSearch").value = ""
    $get(MasterObj + "txtSTime").value = "00:00"
    $get(MasterObj + "txtETime").value = "00:00"
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
//*******************************************************************************
function OnFocuseTxtSTime() {
    document.getElementById(MasterObj + "txtSTime").select();
}
//*******************************************************************************
function OnFocuseTxtETime() {
    document.getElementById(MasterObj + "txtETime").select();
}
//=======================================================================
function OnBlurSTime() {
    if (document.getElementById(MasterObj + "txtSTime").value != "00:00" && $get(MasterObj + "CmbType").value == "2")
        document.getElementById(MasterObj + "txtETime").value = document.getElementById(MasterObj + "txtSTime").value;
}
//=======================================================================
var DetailDialogObj = null;
var DetailState = 0;

//        //==================================================================================
function OnClickGrdAllperson(info) {

    DepName = info.substr(1, info.length - 1)

    if ($get(MasterObj + 'txtXml').value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXml').value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes("/ReportsEntity/AbsentPresent[DepartmentName='" + DepName + "']")

        if (xmlNodes.length > 0) {

            AllPerson = xmlNodes.item(0).selectSingleNode('Allperson').text
            wPresent = xmlNodes.item(0).selectSingleNode('wPresent').text
            Present = xmlNodes.item(0).selectSingleNode('Present').text
            Absent = xmlNodes.item(0).selectSingleNode('Absent').text
            noPresent = xmlNodes.item(0).selectSingleNode('noPresent').text
            // document.getElementById(MasterObj + "txtDepartmentName").value = DepName
            DepID = xmlNodes.item(0).selectSingleNode('department').text
        }

        if (DepName == "جمع") {
            DepID = document.getElementById(MasterObj + "txtDepartmentID").value
            DepName = document.getElementById(MasterObj + "txtDepartmentName").value
        }

    }
    var index = info.substr(0, 1)
    var kind = "";
    switch (index) {
        case "0":
            kind = "Allperson";
            break;
        case "2":
            kind = "Present";
            break;
        case "1":
            kind = "wPresent";
            break;
        case "4":
            kind = "noPresent";
            break;
        case "3":
            kind = "Absent";
            break;
    }

    if (DetailState == 0) {
        //                while (row.tagName != 'TR')
        //                    row = row.parentElement
        if (DetailState == 0) {
            $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value

            var url = "AllPersonelDailyReport.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&Kind=" + kind
                + "&DepID=" + DepID//document.getElementById(MasterObj + "txtDepartmentID").value
                + "&DepName=" + DepName//document.getElementById(MasterObj + "txtDepartmentName").value
                + "&Date=" + $get(MasterObj + "txtDate").value
                + "&AllPerson=" + AllPerson
                + "&Absent=" + Absent
                + "&Present=" + Present;
+"&STime=" + $get(MasterObj + "txtSTime").value
                + "&ETime=" + $get(MasterObj + "txtETime").value
            //alert(url);
            var winPro = "dialogWidth:1250px;dialogHeight:750px;center: Yes;help: no;status:no;minimize: yes;"
            DetailDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)

            DetailState = 1;
        }
    }
    else
        try {
        if (DetailState == 1) {
            if (DetailDialogObj != null) {

                $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
                DetailDialogObj.document.getElementById(MasterObj + "txtDate").value = $get(MasterObj + "txtDate").value;
                DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentID").value = DepID// LastSelectedRow.getAttribute('department')
                DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentName").value = DepName// LastSelectedRow.cells(0).innerText;
                DetailDialogObj.document.getElementById(MasterObj + "txtKind").value = kind;
                DetailDialogObj.document.getElementById(MasterObj + "DivRole").innerText = DepName// LastSelectedRow.cells(0).innerText;
                DetailDialogObj.document.getElementById(MasterObj + "DivAllPerson").innerText = AllPerson// LastSelectedRow.cells(1).innerText;
                DetailDialogObj.document.getElementById(MasterObj + "DivAbsent").innerText = Absent// LastSelectedRow.cells(4).innerText;
                DetailDialogObj.document.getElementById(MasterObj + "DivPresent").innerText = Present// LastSelectedRow.cells(2).innerText;
                DetailDialogObj.document.getElementById(MasterObj + "txtSTime").value = $get(MasterObj + "txtSTimeSearch").value;
                DetailDialogObj.document.getElementById(MasterObj + "txtETime").value = $get(MasterObj + "txtETimeSearch").value;
                DetailDialogObj.document.getElementById(MasterObj + "txtAllPerson").value = AllPerson// LastSelectedRow.cells(1).innerText;

                DetailDialogObj.OnClickBtnFilter();
            }
            else {
                DetailState = 0
                OnClickGrdAllperson(document.getElementById(MasterObj + "txtChartDetail").value)
            }
        }

    }

    catch (e) {

        DetailState = 0
        OnClickGrdAllperson(document.getElementById(MasterObj + "txtChartDetail").value)
    }
}
//=======================================================================
function OnChangeCmbType() {
    var SDate = document.getElementById(MasterObj + "txtCurDate").value;

    if (document.getElementById(MasterObj + "CmbType").value == "1") {//روز خاص

        document.getElementById(MasterObj + "txtSTime").disabled = true;
        document.getElementById(MasterObj + "txtETime").disabled = true;
        document.getElementById(MasterObj + "txtSTime").value = "";
        document.getElementById(MasterObj + "txtSTimeSearch").value = "";
        document.getElementById(MasterObj + "txtETime").value = "";
        document.getElementById(MasterObj + "txtETimeSearch").value = "";
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = false;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = false;
    }
    else if (document.getElementById(MasterObj + "CmbType").value == "2") {//ساعت خاص
        document.getElementById(MasterObj + "txtSTime").disabled = false;
        document.getElementById(MasterObj + "txtETime").disabled = true;
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = true;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = true;
        document.getElementById(MasterObj + "txtDate").value = document.getElementById(MasterObj + "txtCurDate").value;

        $get(MasterObj + "KCalDate_txtDay").value = SDate.substr(8, 2);
        $get(MasterObj + "KCalDate_txtMonth").value = SDate.substr(5, 2);
        $get(MasterObj + "KCalDate_txtYear").value = SDate.substr(0, 4);
        $get(MasterObj + "KCalDate_txtCalendar").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
        $get(MasterObj + "KCalDate_txtCalendar").value = $get(MasterObj + "KCalDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value)

    }
    else if (document.getElementById(MasterObj + "CmbType").value == "3") {//بازه زمانی خاص
        document.getElementById(MasterObj + "txtSTime").disabled = false;
        document.getElementById(MasterObj + "txtETime").disabled = false;
        document.getElementById(MasterObj + "KCalDate_TxtCalendar").disabled = false;
        document.getElementById(MasterObj + "KCalDate_btnCalender").disabled = false;
    }

}
//=======================================================================