var StrDept = "";
var StrGroup = "";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var AllPerson = 0;
var Present = 0;
var Absent = 0;
var DepID = 0;
var DepName = "";
var DetailDialogObj = null;
var DetailState = 0;
document.dir = "RTL"
//raftane taghrat dar pach
var MasterObj = "ctl00_ContentPlaceHolder1_";
document.body.scroll = "no";
//===========================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    var elem = args.get_postBackElement();
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    //----------------------------------
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRow = null
    //----------------------------------
    $get(MasterObj + "txtSubmit").value = "";
}
//======================================childFunc============================
function childFunc(Node, ID, Chk) {
    var rootNodes = Node.get_nodes();
    for (var j = 0; j < rootNodes.get_length(); j++) {
        if (rootNodes.getNode(j).get_id() == ID) {
            rootNodes.getNode(j).set_checked(Chk);
            TreeView1_onNodeCheckChange('', rootNodes.getNode(j));
        }
        if (rootNodes.getNode(j).get_nodes().get_length() > 0)
            childFunc(rootNodes.getNode(j), ID, Chk);
    }
}
//**********************************EndOnLoad*************************************
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnAllPDF() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOnePDF() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnAllExcel() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
function OnClickBtnOneExcel() {
    $get(MasterObj + "txtReportDate").value = $get(MasterObj + "KCalDate_txtDay").value + "/" + $get(MasterObj + "KCalDate_txtMonth").value + "/" + $get(MasterObj + "KCalDate_txtYear").value
    document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//*************************************ThisPage***************************************
function onclickImgClose() {
    if (window.parent.document.all.item("ImgRestore").style.display == "inline")
        document.body.scroll = "no"
    document.getElementById("shadowMessage").style.display = "none"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgRestor() {
    document.body.scroll = "yes"
    document.documentElement.scrollTop = "yes"
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
document.body.attachEvent('onkeydown', onkeydownBody)
var keyCode = 0
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onkeydownBody() {
    keyCode = event.keyCode
    setTimeout("keyCode=0", 1000)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {

    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
    CheckDailyClick();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckDailyClick() {

    var oGrd = document.getElementById(MasterObj + "GrdAbsentPresentManagment");

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
    if ((oCell.cellIndex == 1 || oCell.cellIndex == 2 || oCell.cellIndex == 3 || oCell.cellIndex == 4 ||
                                  oCell.cellIndex == 5 || oCell.cellIndex == 6) && oCell.innerText != 0) {
        OnClickGrdAllperson(oCell);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrdAllperson(obj) {
    var DepIDAll = "";
    var GroupID = "";

    var row = window.event.srcElement.parentElement
    var index;
    if (obj == 0) {
        obj = window.event.srcElement;
        index = window.event.srcElement.cellIndex;
    }
    else index = obj.cellIndex;

    

    var kind, RptKind;
    switch (index) {
        case 2:
            kind = "Allperson";
            RptKind = "کل پرسنل";
            break;
        case 3:
            kind = "wPresent";
            RptKind = "حاضرين موظف";
            break;
        case 4:
            kind = "Present";
            RptKind = "اضافه کار پرسنل";
            break;
        case 5:
            kind = "Absent";
            RptKind = "غايبين";
            break;
        case 6:
            kind = "noPresent";
            RptKind = "غايبين مجاز";
            break;
    }
    if (DetailState == 0) {
        while (row.tagName != 'TR')
            row = row.parentElement
        if (DetailState != 1) {
            if (row != null) {

                AllPerson = row.cells(2).innerText;
                Present = row.cells(3).innerText;
                Absent = row.cells(5).innerText;
                $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
                if (row.getAttribute("dept") == "999999999") {
                    DepID = document.getElementById(MasterObj + "txtTreeDepartmentID").value
                    DepName = document.getElementById(MasterObj + "txtTreeDepartmentName").value
                }
                else {
                    DepID = row.getAttribute("dept");
                    DepName = row.cells(0).innerText;
                   
//                    if (DepID == "" || DepID == null || DepID=="-1") {
//                        //=========بدست آوردن واحد سارمانی در حالت کلی============
//                        if ($("#" + MasterObj + "ChkDepartment").attr("checked") != true && strChk != "") {
//                            MakeStrDept();
//                            DepID = $("#" + MasterObj + "txtDepartment").val();
//                            $("#" + MasterObj + "txtDepartment").val("");
//                        }
//                        //=================================================
//                    }
                }

                GroupID = row.getAttribute("GroupID");
                if (GroupID == "-1")
                    GroupID = "0";
//                //=========بدست آوردن گروه در حالت کلی============
//                if ($("#" + MasterObj + "ChkGroup").attr("checked") != true) {
//                    MakeStrGroup();
//                    GroupID = $("#" + MasterObj + "txtGroup").val();
//                    $("#" + MasterObj + "txtGroup").val("");
//                }
//                //===================================================

                var url = "AllPersonelDailyReport.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&Kind=" + kind
                + "&RptKind=" + RptKind
                + "&DepID=" + DepID
                + "&GroupID=" + row.getAttribute("GroupID")
                + "&Date=" + $get(MasterObj + "txtDate").value
                + "&AllPerson=" + AllPerson
                + "&Absent=" + Absent
                + "&DepName=" + DepName
                + "&Present=" + Present
                + "&STime=" + $get(MasterObj + "txtSTimeSearch").value
                + "&ETime=" + $get(MasterObj + "txtETimeSearch").value
                + "&MenuItemID=" + $get(MasterObj + "txtPageID").value
                var winPro = "dialogWidth:1250px;dialogHeight:550px;center: Yes;help: no;status:no;minimize: yes;"
                //alert($("#" + MasterObj + "ChkDepartment").attr("checked"))
               // alert($("#" + MasterObj + "ChkDepartment"))
                if ($("#" + MasterObj + "ChkGroup").attr("checked") != "checked" && $("#" + MasterObj + "ChkDepartment").attr("checked") != "checked")
                    alert("يکی از انواع گزارش گيری بايد انتخاب شود")
                else {
                    DetailDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
                    DetailState = 1;
                }
            
            }
        }
    }
    else {
        try {
            if (DetailState == 1) {
                if (DetailDialogObj != null) {
                    var oGrd = document.getElementById(MasterObj + "GrdAbsentPresentManagment");
                    var len = oGrd.rows.length - 2;
                    if (LastSelectedRow.rowIndex == len) {
                        DepID = document.getElementById(MasterObj + "txtTreeDepartmentID").value
                        DepName = document.getElementById(MasterObj + "txtTreeDepartmentName").value
                    }
                    else {
                        DepID = LastSelectedRow.getAttribute('dept')
                        DepName = LastSelectedRow.cells(0).innerText;
                        GroupID = row.getAttribute("GroupID");
                        if (GroupID == "-1")
                            GroupID = "0";
                    }
                   
                    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
                    DetailDialogObj.document.getElementById(MasterObj + "txtDate").value = $get(MasterObj + "txtDate").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentID").value = DepID
                    DetailDialogObj.document.getElementById(MasterObj + "txtDepartmentName").value = DepName
                    DetailDialogObj.document.getElementById(MasterObj + "txtKind").value = kind;
                    DetailDialogObj.document.getElementById(MasterObj + "DivRole").innerText = DepName
                    DetailDialogObj.document.getElementById(MasterObj + "DivAllPerson").innerText = LastSelectedRow.cells(2).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "DivAbsent").innerText = LastSelectedRow.cells(5).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "DivPresent").innerText = LastSelectedRow.cells(3).innerText;
                    DetailDialogObj.document.getElementById(MasterObj + "txtSTime").value = $get(MasterObj + "txtSTimeSearch").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtETime").value = $get(MasterObj + "txtETimeSearch").value;
                    DetailDialogObj.document.getElementById(MasterObj + "txtAllPerson").value = LastSelectedRow.cells(2).innerText;

                    DetailDialogObj.OnClickBtnFilter();
                }
            }
        }
        catch (e) {
            DetailState = 0
            OnClickGrdAllperson(obj)
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    MakeStrDept()
    MakeStrGroup()

    $get(MasterObj + "txtDate").value = document.getElementById(MasterObj + "KCalDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDate_txtDay").value
    $get(MasterObj + "txtSTimeSearch").value = $get(MasterObj + "txtSTime").value;
    $get(MasterObj + "txtETimeSearch").value = $get(MasterObj + "txtETime").value;
    if ($get(MasterObj + "txtETimeSearch").value == "00:00")
        $get(MasterObj + "txtETimeSearch").value = "";

    if ($get(MasterObj + "txtSTimeSearch").value == "00:00")
        $get(MasterObj + "txtSTimeSearch").value = "";

    if ($get(MasterObj + "txtETimeSearch").value < $get(MasterObj + "txtSTimeSearch").value)
        alert("ساعت شروع بزرگتر از ساعت پایان است");
    else if ($("#" + MasterObj + "ChkGroup").attr("checked") == true && $("#" + MasterObj + "txtGroup").val() == "") {
        alert("هيچ گروهی برای گزارش گيری انتخاب نشده است")
    }
    else if ($("#" + MasterObj + "ChkDepartment").attr("checked") == true && $("#" + MasterObj + "txtDepartment").val() == "") {
        alert("هيچ واحد سازمانی برای گزارش گيری انتخاب نشده است")
    }
    else {
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeStrDept() {
    $get(MasterObj + "txtDepartment").value = "";
    var strXml = $get(MasterObj + "txtTreeXml").value
    if (strXml == '')
        strXml='<Root></Root>'
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [S=1]");
        if (oXmlNodes.length > 0) {
            for (var i = 0; i < oXmlNodes.length; i++) {
                $get(MasterObj + "txtDepartment").value += oXmlNodes.item(i).selectSingleNode("D").text + ",";
            }
            if ($get(MasterObj + "txtDepartment").value != "") {
                $get(MasterObj + "txtDepartment").value = $get(MasterObj + "txtDepartment").value.substring(0, $get(MasterObj + "txtDepartment").value.length - 1)
            }
        }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeStrGroup() {
    if ($("#" + MasterObj + "MultiGroups_txtHidden").val() != "") {
        var Groups = $("#" + MasterObj + "MultiGroups_txtHidden").val();
        //به خاطر اینکه از صفحه گروه به صورت ایکس ام ال می امد
        var xml;
        var GroupString = '';
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(Groups)
        }
        else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Groups, 'text/xml');
        }
        $(xml).find("Root").find("Tb").each(function () {
            GroupString = GroupString + "," + $(this).find('GroupId').text();
        });
        GroupString = GroupString.substring(1, GroupString.length)
        $("#" + MasterObj + "txtGroup").val(GroupString);
    }
    else
        $("#" + MasterObj + "txtGroup").val($("#" + MasterObj + "MultiGroups_cmbPerson_txtPCode").val());
}
//====================================================
function OnClickChkDepartment(obj) {
    if (obj.checked)
        $get(MasterObj + "txtRDepartmentID").value = "1";
    else
        $get(MasterObj + "txtRDepartmentID").value = "0";
}
//====================================================
function OnClickChkGroup(obj) {
    if (obj.checked)
        $get(MasterObj + "txtRGroupID").value = "1";
    else
        $get(MasterObj + "txtRGroupID").value = "0";
}
//====================================================
function OnFocuseTxtSTime() {
    document.getElementById(MasterObj + "txtSTime").select();
}
//====================================================
function OnFocuseTxtETime() {
    document.getElementById(MasterObj + "txtETime").select();
}
//=====================================================
function OnBlurSTime() {
    if ($get(MasterObj + "txtSTime").value != "00:00"
        && $get(MasterObj + "txtSTime").value <= '23:59')
        $get(MasterObj + "txtETime").value = $get(MasterObj + "txtSTime").value;

    if ($get(MasterObj + "txtSTime").value == "")
        $get(MasterObj + "txtSTime").value = "00:00"
}
//====================================================
function OnBlurETime() {
     if ($get(MasterObj + "txtETime").value == "")
        $get(MasterObj + "txtETime").value = "00:00"
}