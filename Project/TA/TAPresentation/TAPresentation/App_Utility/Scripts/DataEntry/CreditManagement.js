WidthScreen = window.screen.width;
$get("GridViewCountainer").style.width = WidthScreen - 20;
//----------------------------------------------------------------------------
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var strChk = "<WFEntity></WFEntity>";
var AccessEdit = true, AccessErja = true;
var SortArray = new Array;
var OldPriorityVal = "";
window.dir = "RTL";
//document.getElementsByTagName("body")[0].scroll = "no";
var DateDirect = "Asc", PIDDirect = "Asc", PNameDirect = "Asc", DeptDirect = "Asc", DocTypeDirect = "Asc", DocTimeDirect = "Asc";
$get(MasterObj + "CmbType").disabled = true;
$get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
$get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
$get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
$get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;

$get(MasterObj + "CmbStatus").value = "0";
$get(MasterObj + "CmbAction").value = "0";
PageLoad();
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//--------------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
}
//--------------------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    $get("GridViewCountainer").style.width = WidthScreen - 20;
    //-------------------------------------------------------------------
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    var StrVal = $get(MasterObj + "txtSubmit").value
    $get(MasterObj + "txtSubmit").value = "";
    if (StrVal == "ShowCartabl" || StrVal == "ShowCredit")
        OnChangeCmbDocType();
    //------------------------------------------------------------------
    if (StrVal == "CountDocGroup") {
        var Msg = " تعداد " + $get(MasterObj + "txtCommonCreditCount").value + " مجوز مشابه پرسنل انتخاب شده وجود دارد \r\nآيا مايل به حذف تمامي آن ها هستيد ؟";
        if (confirm(Msg) == true) {
            document.getElementById("ctl00_ProgressState").value = "0";
            $get(MasterObj + "txtSubmit").value = "DelDocGroup";
            document.getElementById(MasterObj + "BtnSubmit2").click();
            document.getElementById("ctl00_ProgressState").value = "1";
        }
        else {
            $get(MasterObj + "txtSaveXml").value = strChk;
            switch ($get(MasterObj + "CmbShow").value) {
                case "16601":
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    break;
                default:
                    $get(MasterObj + "txtSubmit").value = "DeleteCredit";
            }
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //------------------------------------------------------------------
    if ($get(MasterObj + "txtAlert").value != "" && StrVal != "DelDocGroup") {
        if ($get(MasterObj + "txtAlertStatus").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value);
        else
            alert($get(MasterObj + "txtAlert").value);
    }
    //------------------------------------------------------------------
    if (StrVal == "DelDocGroup") {
        if ($get(MasterObj + "txtValidateDelDocGroup").value == "1")
            SetMsg($get(MasterObj + "txtMsgDelDocGroup").value);
        else
            alert($get(MasterObj + "txtMsgDelDocGroup").value);
    }
    //------------------------------------------------------------------
    if (StrVal != "CountDocGroup") {
        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtAlertStatus").value = "";
        $get(MasterObj + "txtNotAcceptDesc").value = "";
        LastSelectedRow = null;
        strChk = "<WFEntity></WFEntity>";
    }
}
//--------------------------------------------------------------------------------------------
function PageLoad() {
    if ($get(MasterObj + "txtNewWFO").value == "1")
        $get(MasterObj + "CmbShow").disabled = true;
    $get(MasterObj + "txtOnlineUserName").value = $get(MasterObj + "cmbPersonCode_txtName").value;
    switch ($get(MasterObj + "CmbShow").value) {
        case "16602":
            document.getElementById('TdDepartment').style.display = "none";
            document.getElementById('TdCmbDepartment').style.display = "none";
            document.getElementById('TdAccepter').style.display = "none";
            document.getElementById('TdAccepterPerson').style.display = "none";

            if (typeof document.getElementById('OToolBar_BtnAccept') == "object") {
                if (document.getElementById('OToolBar_BtnAccept') != null)
                    document.getElementById('OToolBar_BtnAccept').style.display = "none";
            }

            if (typeof document.getElementById('OToolBar_BtnNotAccept') == "object") {
                if (document.getElementById('OToolBar_BtnNotAccept') != null)
                    document.getElementById('OToolBar_BtnNotAccept').style.display = "none";
            }

            if (typeof document.getElementById('OToolBar_BtnErja') == "object") {
                if (document.getElementById('OToolBar_BtnErja') != null)
                    document.getElementById('OToolBar_BtnErja').style.display = "none";
            }

            $get(MasterObj + 'CmbStatus').style.display = "inline";
            $get(MasterObj + 'CmbAction').style.display = "none";
            break;
        case "16601":
            document.getElementById('TdDepartment').style.display = "inline";
            document.getElementById('TdCmbDepartment').style.display = "inline";
            document.getElementById('TdAccepterPerson').style.display = "inline";
            document.getElementById('TdAccepter').style.display = "inline";

            if (typeof document.getElementById('OToolBar_BtnAccept') == "object") {
                if (document.getElementById('OToolBar_BtnAccept') != null)
                    document.getElementById('OToolBar_BtnAccept').style.display = "inline";
            }

            if (typeof document.getElementById('OToolBar_BtnNotAccept') == "object") {
                if (document.getElementById('OToolBar_BtnNotAccept') != null)
                    document.getElementById('OToolBar_BtnNotAccept').style.display = "inline";
            }

            if (typeof document.getElementById('OToolBar_BtnErja') == "object") {
                if (document.getElementById('OToolBar_BtnErja') != null)
                    document.getElementById('OToolBar_BtnErja').style.display = "inline";
            }

            $get(MasterObj + 'CmbStatus').style.display = "none";
            $get(MasterObj + 'CmbAction').style.display = "inline";
            break;
    }
    // GetAccessBtn();
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
function OndbClickGrd() {
    if (AccessEdit == true && LastSelectedRow.StatusId != "205" && LastSelectedRow.StatusId != "204" && LastSelectedRow.StatusId != "206") {
        var url = "";
        var DialogProperty = "";
        switch (LastSelectedRow.TableName.toString().toLowerCase()) {
            case "att.attendance":
                url = "RegisterGooing.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.daycontinuation":
                url = "RequestDayContinuation.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no";
                break;
            case "att.credit":
                switch (LastSelectedRow.IsCredit) {
                    case "0":
                        var url = "/TAPresentation/App_Pages/Reports/DefineDutyCredit.aspx"
                        var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
                        break;

                    case "1":
                        url = "RegisterCredit.aspx";
                        DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no"
                        break;
                }
                break;
            case "att.scvrepeat":
                url = "RequestRepeatMonthlyItem.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.staticcodevaluewp":
                url = "RequestMonthlyItem.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.staticcodevalue":
                url = "RequestDailyItem.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.replacedetail":
                url = "RegisterChangeStructure.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.karanepack":
                url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "att.schedulechanges":
                url = "ShiftRequest.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
        }
        url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&TableName=" + LastSelectedRow.TableName
            + "&FieldName=" + LastSelectedRow.FieldName
            + "&FieldValue=" + LastSelectedRow.DocID
        if (LastSelectedRow.TableName.toString().toLowerCase() == "att.credit" && LastSelectedRow.IsCredit == "0")
            url += "&ModifyFlag=0";
        returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
        if (returnValue == 1)
            OnClickBtnFilter();
    }
    else if (LastSelectedRow.StatusId == "204" || LastSelectedRow.StatusId == "205" || LastSelectedRow.StatusId == "206")
        alert("امکان ويرايش مجوز حذف شده وجود ندارد");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    if ($get(MasterObj + "cmbPersonCode_txtName").value != "" && $get(MasterObj + "cmbPersonCode_txtCode").value != "" && $get(MasterObj + "CmbShow").value == "16601"
    || ($get(MasterObj + "CmbRelatedPerson_txtName").value != "" && $get(MasterObj + "CmbRelatedPerson_txtCode").value != ""
    || ($get(MasterObj + "CmbRelatedPerson_txtName").value == "" && $get(MasterObj + "CmbRelatedPerson_txtCode").value == "")
    && $get(MasterObj + "CmbShow").value == "16602")) {
        $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
        $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
        $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
        $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
        if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
            alert("تاريخ شروع بزرگتر از تاريخ پايان است");
        else {
            switch ($get(MasterObj + "CmbType").style.display) {
                case "none":
                    switch ($get(MasterObj + "CmbDocType").value) {
                        case "16401":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbCreditGroupCode").value;
                            break;
                        case "16402":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbAttendance").value;
                            break;
                        case "16403":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbDayContinuation").value;
                            break;
                        case "16404":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbMonthlyItem").value;
                            break;
                        case "16405":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbReplaceDetail").value;
                        case "16406":
                            $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbDailyItem").value;
                            break;
                        case "0":
                            $get(MasterObj + "txtCredit").value = "";
                            break;
                    }
                    break;
                default:
                    $get(MasterObj + "txtCredit").value = $get(MasterObj + "CmbType").value
            }
            //----------------------------------------------------------------------------------
            switch ($get(MasterObj + "CmbShow").value) {
                case "16601":
                    if ($get(MasterObj + "cmbPersonCode_txtCode").value == "") {
                        $get(MasterObj + "cmbPersonCode_txtCode").value = $get(MasterObj + "txtOnLineUser").value;
                        $get(MasterObj + "cmbPersonCode_txtName").value = $get(MasterObj + "txtOnlineUserName").value;
                    }
                    $get(MasterObj + "txtPersonID").value = $get(MasterObj + "cmbPersonCode_txtCode").value
                    $get(MasterObj + "txtCreatorPersonID").value = $get(MasterObj + "CmbRelatedPerson_txtCode").value
                    document.getElementById(MasterObj + "txtSubmit").value = "ShowCartabl";
                    break;
                case "16602":
                    $get(MasterObj + "txtPersonID").value = $get(MasterObj + "CmbRelatedPerson_txtCode").value
                    document.getElementById(MasterObj + "txtSubmit").value = "ShowCredit";
                    break;
            }
            MakeSortExpression();
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    xmlDoc.loadXML(strChk);
    xmlDoc.setProperty("SelectionLanguage", "XPath");
    var xmlNodes = xmlDoc.documentElement.selectNodes("/WFEntity/vDocs[Selected=1]");
    if (xmlNodes.length > 0) {
        var Msg = "آیا برای حذف مطمئنید؟"
        if (confirm(Msg) == true) {
            $get(MasterObj + "txtSaveXml").value = strChk;
            switch ($get(MasterObj + "CmbShow").value) {
                case "16601":
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    break;
                default:
                    $get(MasterObj + "txtSubmit").value = "DeleteCredit";
            }
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("به منظور حذف حداقل یک سطر را انتخاب کنید")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        OndbClickGrd();
    }
    else
        alert("لطفا به منظور ويرايش یک سطر را انتخاب کنید")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    if ($get(MasterObj + "txtKCalSFirstDate").value != "") {
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "txtKCalSFirstDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "txtKCalSFirstDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "txtKCalSFirstDate").value.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value;
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
        $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "txtKCalSFirstDate").value
    }
    if ($get(MasterObj + "txtKCalEFirstDate").value != "") {
        $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "txtKCalEFirstDate").value.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "txtKCalEFirstDate").value.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "txtKCalEFirstDate").value.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
        $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "txtKCalEFirstDate").value
    }
    $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
    $get(MasterObj + "CmbAttendance").style.display = "none";
    $get(MasterObj + "CmbDayContinuation").style.display = "none";
    $get(MasterObj + "CmbMonthlyItem").style.display = "none";
    $get(MasterObj + "CmbDailyItem").style.display = "none";
    $get(MasterObj + "CmbReplaceDetail").style.display = "none";
    $get(MasterObj + "CmbType").style.display = "inline";

    $get(MasterObj + "cmbPersonCode_txtCode").value = $get(MasterObj + "txtOnLineUser").value;
    $get(MasterObj + "cmbPersonCode_txtName").value = $get(MasterObj + "txtOnlineUserName").value;
    $get(MasterObj + "txtPersonID").value = document.getElementById(MasterObj + "cmbPersonCode_txtCode").value;

    $get(MasterObj + "txtCreatorPersonID").value = "";

    $get(MasterObj + "CmbStatus").value = "0";
    $get(MasterObj + "CmbAction").value = "0";
    $get(MasterObj + "CmbDocType").value = "0";
    $get(MasterObj + "CmbType").value = "0";
    $get(MasterObj + "txtCredit").value = "";

    $get(MasterObj + "CmbCreditGroupCode").value = "0";
    $get(MasterObj + "CmbMonthlyItem").value = "0";

    $get(MasterObj + "CmbRelatedPerson_txtCode").value = "";
    $get(MasterObj + "CmbRelatedPerson_txtName").value = "";

    switch ($get(MasterObj + "CmbShow").value) {
        case "16601":
            $get(MasterObj + "txtSubmit").value = "ShowCartabl";
            break;
        case "16602":
            $get(MasterObj + "txtPersonID").value = "";
            $get(MasterObj + "txtSubmit").value = "ShowCredit";
            break;
    }
    $get(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnAccept() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    xmlDoc.loadXML(strChk);
    xmlDoc.setProperty("SelectionLanguage", "XPath");
    var xmlNodes = xmlDoc.documentElement.selectNodes("/WFEntity/vDocs[Selected=1]");
    if (xmlNodes.length > 0) {
        //======================================================
        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
        xmlDoc2.loadXML($get(MasterObj + "txtGridData").value);
        xmlDoc2.setProperty("SelectionLanguage", "XPath");
        var xmlNodes2 = xmlDoc2.documentElement.selectNodes("/DataEntryEntity/GetCreditManage[Selected=1]");
        for (var i = 0; i < xmlNodes2.length; i++)
            var f = xmlDoc2.documentElement.removeChild(xmlNodes2.item(i));
        $get(MasterObj + "txtGridData").value = xmlDoc2.xml;
        //======================================================
        $get(MasterObj + "XMLvDocs").value = strChk;
        $get(MasterObj + "txtSubmit").value = 'Action';
        $get(MasterObj + "txtActionTypeID").value = "1";
        $get(MasterObj + "BtnSubmit").click();
    }
    else
        alert("هيچ موردي جهت تاييد انتخاب نشده است")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNotAccept() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    xmlDoc.loadXML(strChk);
    xmlDoc.setProperty("SelectionLanguage", "XPath");
    var xmlNodes = xmlDoc.documentElement.selectNodes("/WFEntity/vDocs[Selected=1]");

    if (xmlNodes.length > 0) {
        //======================================================
        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
        xmlDoc2.loadXML($get(MasterObj + "txtGridData").value);
        xmlDoc2.setProperty("SelectionLanguage", "XPath");
        var xmlNodes2 = xmlDoc2.documentElement.selectNodes("/DataEntryEntity/GetCreditManage[Selected=1]");
        for (var i = 0; i < xmlNodes2.length; i++)
            var f = xmlDoc2.documentElement.removeChild(xmlNodes2.item(i));
        $get(MasterObj + "txtGridData").value = xmlDoc2.xml;
        //======================================================
        if ($get(MasterObj + "txtFlagNotAccept").value == "1") {
            var url = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/CardTableNotAcceptDesc.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            var StrFeatur = "dialogHeight: 200px;dialogWidth: 440px;center: Yes;help: no;status: no"
            returnValue = window.showModalDialog(encodeURI(url), window, StrFeatur)

            if (returnValue != undefined)
                $get(MasterObj + "txtNotAcceptDesc").value = returnValue;
        }
        $get(MasterObj + "XMLvDocs").value = strChk;
        $get(MasterObj + "txtSubmit").value = 'Action';
        $get(MasterObj + "txtActionTypeID").value = "2";
        $get(MasterObj + "BtnSubmit").click();
    }
    else
        alert("هيچ موردي جهت عدم تاييد انتخاب نشده است")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    var oLen = OGrid.rows.length
    for (var i = 1; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    var oGrid = obj.parentElement;
    var StrTemp = "";
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    //========================================================
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/WFEntity/vDocs [ DocId=" + oGrid.rows(oIndex).DocID + "]");
    //========================================================
    if ($get(MasterObj + "CmbShow").value == "16601") {
        var oXmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
        oXmlDoc2.loadXML($get(MasterObj + "txtGridData").value);
        oXmlDoc2.setProperty("SelectionLanguage", "XPath");
        var oXmlNodes2 = oXmlDoc2.documentElement.selectNodes("/DataEntryEntity/GetCreditManage [ DocID=" + oGrid.rows(oIndex).DocID + "]");
        //========================================================
        if (oXmlNodes2.length > 0) {
            if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                var f = oXmlDoc2.documentElement.removeChild(oXmlNodes2.item(0));
                f.selectSingleNode("Selected").text = 1;
                oXmlDoc2.childNodes[0].appendChild(f);
            }
            else {
                var f = oXmlDoc2.documentElement.removeChild(oXmlNodes2.item(0));
                f.selectSingleNode("Selected").text = 0;
                oXmlDoc2.childNodes[0].appendChild(f);
            }
        }
        else {
            var f = oXmlDoc2.documentElement.removeChild(oXmlNodes2.item(0));
            f.selectSingleNode("Selected").text = 1;
            oXmlDoc2.childNodes[0].appendChild(f);
        }
        document.getElementById(MasterObj + "txtGridData").value = oXmlDoc2.xml;
    }
    //================================================================
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
    }
    else {
        StrTemp += "<vDocs>"
        StrTemp += "<WFDocId>" + oGrid.rows(oIndex).WFDocId + "</WFDocId>"
        StrTemp += "<DocId>" + oGrid.rows(oIndex).DocID + "</DocId>"
        StrTemp += "<TableName>" + oGrid.rows(oIndex).TableName + "</TableName>"
        StrTemp += "<FieldName>" + oGrid.rows(oIndex).FieldName + "</FieldName>"
        StrTemp += "<RowIndex>" + oIndex + "</RowIndex>"
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
            StrTemp += "<Selected>0</Selected>"
        else
            StrTemp += "<Selected>1</Selected>"
        StrTemp += "</vDocs>"
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<WFEntity>" + StrTemp + "</WFEntity>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/WFEntity/vDocs");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);

    }
    strChk = oXmlDoc.xml;
    //============================================
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetChk() {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    if (OGrid == null)
        return
    var PageSize = OGrid.rows.length
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/WFEntity/vDocs");
    var oXmlNodesLen = oXmlNodes.length;
    for (var j = 0; j < oXmlNodesLen; j++) {
        for (var i = 1; i < PageSize; i++) {
            if (OGrid.rows(i).DocID == oXmlNodes.item(j).selectSingleNode("DocId").text) {
                if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                    OGrid.rows(i).cells(0).firstChild.checked = true;
                else
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
        }
    }
    strChk = "<WFEntity></WFEntity>";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnRegisterCredit() {
    var url = "RegisterCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnAttendance() {
    var url = "RegisterGooing.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDayContinuation() {
    var url = "RequestDayContinuation.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnMonthly() {
    var url = "RequestMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnRepeatMonthlyItem() {
    var url = "RequestRepeatMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnChangeStructure() {
    var url = "RegisterChangeStructure.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDailyItem() {
    var url = "RequestDailyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnReplaceShift() {
    if (LastSelectedRow != null && LastSelectedRow != undefined && LastSelectedRow != "" && LastSelectedRow.getAttribute("TableName") == "Att.ReplaceDetail") {
        var url = "SchedulingProg.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&DocID=" + LastSelectedRow.DocID;
        returnValue = window.showModelessDialog(encodeURI(url), window, "dialogHeight:900px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1;minimize: yes")
        if (returnValue == 1)
            OnClickBtnFilter();
    }
    else
        alert("تغيير ساختار مورد نظر را انتخاب کنید");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPersonShift() {
    if (LastSelectedRow != null && LastSelectedRow != undefined && LastSelectedRow != "" && LastSelectedRow.getAttribute("TableName") == "Att.ReplaceDetail") {
        var url = "SchedulingProgForPersonel.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&DocID=" + LastSelectedRow.DocID;
        returnValue = window.showModelessDialog(encodeURI(url), window, "dialogHeight:900px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1;minimize: yes")
        if (returnValue == 1)
            OnClickBtnFilter();
    }
    else
        alert("تغيير ساختار مورد نظر را انتخاب کنید");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnScheduleChange() {
    var url = "ShiftRequest.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnChangeCmbDocType() {
    switch ($get(MasterObj + "CmbDocType").value) {
        case "16401":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "inline";
            break;
        case "16402":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "inline";
            $get(MasterObj + "CmbAttendance").disabled = true;
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            break;
        case "16403":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "inline";
            $get(MasterObj + "CmbDayContinuation").disabled = true;
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            break;
        case "16404":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "inline";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            break;
        case "16405":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "inline";
            $get(MasterObj + "CmbReplaceDetail").disabled = true;
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            break;
        case "16406":
            $get(MasterObj + "CmbType").style.display = "none";
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "inline";
            break;
        case "0":
            $get(MasterObj + "CmbType").style.display = "inline";
            $get(MasterObj + "CmbType").disabled = true;
            $get(MasterObj + "CmbReplaceDetail").style.display = "none";
            $get(MasterObj + "CmbCreditGroupCode").style.display = "none";
            $get(MasterObj + "CmbAttendance").style.display = "none";
            $get(MasterObj + "CmbDayContinuation").style.display = "none";
            $get(MasterObj + "CmbMonthlyItem").style.display = "none";
            $get(MasterObj + "CmbDailyItem").style.display = "none";
            break;
    }
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgFlow(obj) {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    if (OGrid != null) {
        var oRow = window.event.srcElement.parentElement
        while (oRow.tagName != "TR")
            oRow = oRow.parentElement
        var DocID = oRow.getAttribute('DocID')
        var WFDocId = oRow.getAttribute('WFDocId')
        var DocTypeID = oRow.getAttribute('DocTypeID')

        if (DocTypeID == 0)
            window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
        else
            window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnChangeCmbShow() {
    switch ($get(MasterObj + "CmbShow").value) {
        case "16602":
            document.getElementById('TdDepartment').style.display = "none";
            document.getElementById('TdCmbDepartment').style.display = "none";
            document.getElementById('TdAccepter').style.display = "none";
            document.getElementById('TdAccepterPerson').style.display = "none";

            if (typeof document.getElementById('OToolBar_BtnAccept') == "object") {
                if (document.getElementById('OToolBar_BtnAccept') != null)
                    document.getElementById('OToolBar_BtnAccept').style.display = "none";
            }

            if (typeof document.getElementById('OToolBar_BtnNotAccept') == "object") {
                if (document.getElementById('OToolBar_BtnNotAccept') != null)
                    document.getElementById('OToolBar_BtnNotAccept').style.display = "none";
            }

            if (typeof document.getElementById('OToolBar_BtnErja') == "object") {
                if (document.getElementById('OToolBar_BtnErja') != null)
                    document.getElementById('OToolBar_BtnErja').style.display = "none";
            }

            $get(MasterObj + 'CmbStatus').style.display = "inline";
            $get(MasterObj + 'CmbAction').style.display = "none";
            break;
        case "16601":
            document.getElementById('TdDepartment').style.display = "inline";
            document.getElementById('TdCmbDepartment').style.display = "inline";
            document.getElementById('TdAccepterPerson').style.display = "inline";
            document.getElementById('TdAccepter').style.display = "inline";

            if (typeof document.getElementById('OToolBar_BtnAccept') == "object") {
                if (document.getElementById('OToolBar_BtnAccept') != null)
                    document.getElementById('OToolBar_BtnAccept').style.display = "inline";
            }

            if (typeof document.getElementById('OToolBar_BtnNotAccept') == "object") {
                if (document.getElementById('OToolBar_BtnNotAccept') != null)
                    document.getElementById('OToolBar_BtnNotAccept').style.display = "inline";
            }

            if (AccessErja == true) {
                if (typeof document.getElementById('OToolBar_BtnErja') == "object") {
                    if (document.getElementById('OToolBar_BtnErja') != null)
                        document.getElementById('OToolBar_BtnErja').style.display = "inline";
                }
            }
            $get(MasterObj + 'CmbStatus').style.display = "none";
            $get(MasterObj + 'CmbAction').style.display = "inline";
            break;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickCreateDateTime(obj) {
    var url = "";
    var DialogProperty = "";
    switch (obj.parentElement.TableName.toString().toLowerCase()) {
        case "att.attendance":
            url = "RegisterGooing.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.daycontinuation":
            url = "RequestDayContinuation.aspx";
            DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no";
            break;
        case "att.credit":
            url = "RegisterCredit.aspx";
            DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no"
            break;
        case "att.scvrepeat":
            url = "RequestRepeatMonthlyItem.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.staticcodevaluewp":
            url = "RequestMonthlyItem.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.staticcodevalue":
            url = "RequestDailyItem.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.replacedetail":
            url = "RegisterChangeStructure.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.karanepack":
            url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
            DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
            break;
        case "att.schedulechanges":
            url = "ShiftRequest.aspx";
            DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
    }
    url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&TableName=" + obj.parentElement.TableName
            + "&FieldName=" + obj.parentElement.FieldName
            + "&FieldValue=" + obj.parentElement.DocID
            + "&ModifyFlag=0";
    window.showModalDialog(encodeURI(url), "", DialogProperty);
}
//----------------------------------------------------------------------------------------------------------------------
function OnChangeCmbType(obj) {
    var CreditGroupCodeLen = $get(MasterObj + "CmbCreditGroupCode").length;
    var AttendanceLen = $get(MasterObj + "CmbAttendance").length;
    var DayContinuationLen = $get(MasterObj + "CmbDayContinuation").length;
    var MonthlyItemLen = $get(MasterObj + "CmbMonthlyItem").length
    var ReplaceDetailLen = $get(MasterObj + "CmbReplaceDetail").length
    var DailyItemLen = $get(MasterObj + "CmbDailyItem").length
    if (obj.value == "0") {
        $get(MasterObj + "CmbDocType").value = "0";
        return;
    }
    for (var i = 0; i < CreditGroupCodeLen; i++)
        if ($get(MasterObj + "CmbCreditGroupCode").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16401";
            return;
        }
    for (var i = 0; i < AttendanceLen; i++)
        if ($get(MasterObj + "CmbAttendance").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16402";
            return;
        }
    for (var i = 0; i < DayContinuationLen; i++)
        if ($get(MasterObj + "CmbDayContinuation").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16403";
            return;
        }
    for (var i = 0; i < MonthlyItemLen; i++)
        if ($get(MasterObj + "CmbMonthlyItem").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16404";
            return;
        }
    for (var i = 0; i < ReplaceDetailLen; i++)
        if ($get(MasterObj + "CmbReplaceDetail").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16405";
            return;
        }
    for (var i = 0; i < DailyItemLen; i++)
        if ($get(MasterObj + "CmbDailyItem").all(i).value == obj.value) {
            $get(MasterObj + "CmbDocType").value = "16406";
            return;
        }
}
//----------------------------------------------------------------------------------------------------------------------
//function GetAccessBtn() {
//    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
//    xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
//    xmlDoc.setProperty("SelectionLanguage", "XPath")
//    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
//    if (xmlNodes.length != 0) {
//        if (xmlNodes.item(0).selectSingleNode('BtnRegisterCredit') && xmlNodes.item(0).selectSingleNode('BtnRegisterCredit').text == 2)
//            document.getElementById('OToolBar_BtnRegisterCredit').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnAttendance') && xmlNodes.item(0).selectSingleNode('BtnAttendance').text == 2)
//            document.getElementById('OToolBar_BtnAttendance').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnDayContinuation') && xmlNodes.item(0).selectSingleNode('BtnDayContinuation').text == 2)
//            document.getElementById('OToolBar_BtnDayContinuation').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnMonthly') && xmlNodes.item(0).selectSingleNode('BtnMonthly').text == 2)
//            document.getElementById('OToolBar_BtnMonthly').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnRepeatMonthlyItem') && xmlNodes.item(0).selectSingleNode('BtnRepeatMonthlyItem').text == 2)
//            document.getElementById('OToolBar_BtnRepeatMonthlyItem').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnDaily') && xmlNodes.item(0).selectSingleNode('BtnDaily').text == 2)
//            document.getElementById('OToolBar_BtnDailyItem').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnChangeStructure') && xmlNodes.item(0).selectSingleNode('BtnChangeStructure').text == 2)
//            document.getElementById('OToolBar_BtnChangeStructure').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnGroupDel') && xmlNodes.item(0).selectSingleNode('BtnGroupDel').text == 2)
//            document.getElementById('OToolBar_BtnGroupDel').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnEdit') && xmlNodes.item(0).selectSingleNode('BtnEdit').text == 2) {
//            document.getElementById('OToolBar_BtnEdit').style.display = "none"
//            AccessEdit = false;
//        }
//        if (xmlNodes.item(0).selectSingleNode('BtnDel') && xmlNodes.item(0).selectSingleNode('BtnDel').text == 2)
//            document.getElementById('OToolBar_BtnDel').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnAccept') && xmlNodes.item(0).selectSingleNode('BtnAccept').text == 2)
//            document.getElementById('OToolBar_BtnAccept').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnNotAccept') && xmlNodes.item(0).selectSingleNode('BtnNotAccept').text == 2)
//            document.getElementById('OToolBar_BtnNotAccept').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnReplaceShift') && xmlNodes.item(0).selectSingleNode('BtnReplaceShift').text == 2)
//            document.getElementById('OToolBar_BtnReplaceShift').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnScheduleChange') && xmlNodes.item(0).selectSingleNode('BtnScheduleChange').text == 2)
//            document.getElementById('OToolBar_BtnScheduleChange').style.display = "none"
//        if (xmlNodes.item(0).selectSingleNode('BtnPersonShift') && xmlNodes.item(0).selectSingleNode('BtnPersonShift').text == 2)
//            document.getElementById('OToolBar_BtnPersonShift').style.display = "none"      
//        if (xmlNodes.item(0).selectSingleNode('BtnErja') && xmlNodes.item(0).selectSingleNode('BtnErja').text == 2) {
//            AccessErja = false;
//            document.getElementById('OToolBar_BtnErja').style.display = "none"
//        }
//    }
//    CorrectToolBar()
//}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnGroupDel() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    xmlDoc.loadXML(strChk);
    xmlDoc.setProperty("SelectionLanguage", "XPath");
    var xmlNodes = xmlDoc.documentElement.selectNodes("/WFEntity/vDocs[Selected=1]");
    if (xmlNodes.length > 0) {
        $get(MasterObj + "txtDelTableName").value = xmlNodes.item(0).selectSingleNode('TableName').text
        $get(MasterObj + "txtDelID").value = xmlNodes.item(0).selectSingleNode('DocId').text 
        $get(MasterObj + "txtSubmit").value = "CountDocGroup";
        document.getElementById(MasterObj + "BtnSubmit2").click();
          
     
    }
    else
        alert("به منظور حذف گروهي يک سطر را انتخاب کنيد")
}

//----------------------------------------------------------------------------------------------------------------------
function OnClickImgSort(Item, Direction) {
    switch (Item) {
        case "Date":
            {
                switch (Direction) {
                    case 1:
                        $get("ImgAscDate").style.display = "none";
                        $get("ImgDescDate").style.display = "inline";
                        DateDirect = "Desc";
                        break;
                    case 0:
                        $get("ImgAscDate").style.display = "inline";
                        $get("ImgDescDate").style.display = "none";
                        DateDirect = "Asc";
                        break;
                }
            }
            break;
        case "PID":
            switch (Direction) {
                case 1:
                    $get("ImgAscPID").style.display = "none";
                    $get("ImgDescPID").style.display = "inline";
                    PIDDirect = "Desc";
                    break;
                case 0:
                    $get("ImgAscPID").style.display = "inline";
                    $get("ImgDescPID").style.display = "none";
                    PIDDirect = "Asc";
                    break;
            }
            break;
        case "PName":
            switch (Direction) {
                case 1:
                    $get("ImgAscPName").style.display = "none";
                    $get("ImgDescPName").style.display = "inline";
                    PNameDirect = "Desc";
                    break;
                case 0:
                    $get("ImgAscPName").style.display = "inline";
                    $get("ImgDescPName").style.display = "none";
                    PNameDirect = "Asc";
                    break;
            }
            break;
        case "Dept":
            switch (Direction) {
                case 1:
                    $get("ImgAscDept").style.display = "none";
                    $get("ImgDescDept").style.display = "inline";
                    DeptDirect = "Desc";
                    break;
                case 0:
                    $get("ImgAscDept").style.display = "inline";
                    $get("ImgDescDept").style.display = "none";
                    DeptDirect = "Asc";
                    break;
            }
            break;
        case "DocType":
            switch (Direction) {
                case 1:
                    $get("ImgAscDocType").style.display = "none";
                    $get("ImgDescDocType").style.display = "inline";
                    DocTypeDirect = "Desc";
                    break;
                case 0:
                    $get("ImgAscDocType").style.display = "inline";
                    $get("ImgDescDocType").style.display = "none";
                    DocTypeDirect = "Asc";
                    break;
            }
            break;
        case "DocTime":
            switch (Direction) {
                case 1:
                    $get("ImgAscDocTime").style.display = "none";
                    $get("ImgDescDocTime").style.display = "inline";
                    DocTimeDirect = "Desc";
                    break;
                case 0:
                    $get("ImgAscDocTime").style.display = "inline";
                    $get("ImgDescDocTime").style.display = "none";
                    DocTimeDirect = "Asc";
                    break;
            }
            break;
    }
}
//----------------------------------------------------------------------------------------------------------------------
function MakeSortExpression() {
    var StrSortXml = "";
    if ($get("ChkDate").checked == true && $get("txtPriorityDate").value != "0" && $get("txtPriorityDate").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtPriorityDate").value + "</Priority>";
        StrSortXml += "<ColName>SDate</ColName>";
        StrSortXml += "<Direction>" + DateDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    if ($get("ChkPersonID").checked == true && $get("txtPIDPriority").value != "0" && $get("txtPIDPriority").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtPIDPriority").value + "</Priority>";
        StrSortXml += "<ColName>PersonID</ColName>";
        StrSortXml += "<Direction>" + PIDDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    if ($get("ChkPName").checked == true && $get("txtPNamePriority").value != "0" && $get("txtPNamePriority").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtPNamePriority").value + "</Priority>";
        StrSortXml += "<ColName>DisplayName</ColName>";
        StrSortXml += "<Direction>" + PNameDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    if ($get("ChkDepartment").checked == true && $get("txtDeptPriority").value != "0" && $get("txtDeptPriority").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtDeptPriority").value + "</Priority>";
        StrSortXml += "<ColName>DepartmentName</ColName>";
        StrSortXml += "<Direction>" + DeptDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    if ($get("ChkDocType").checked == true && $get("txtDocTypePriority").value != "0" && $get("txtDocTypePriority").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtDocTypePriority").value + "</Priority>";
        StrSortXml += "<ColName>DocType</ColName>";
        StrSortXml += "<Direction>" + DocTypeDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    if ($get("ChkDocTime").checked == true && $get("txtDocTimePriority").value != "0" && $get("txtDocTimePriority").value != "") {
        StrSortXml += "<Tb>"
        StrSortXml += "<Priority>" + $get("txtDocTimePriority").value + "</Priority>";
        StrSortXml += "<ColName>CreateDateTime</ColName>";
        StrSortXml += "<Direction>" + DocTimeDirect + "</Direction>";
        StrSortXml += "</Tb>";
    }
    StrSortXml = "<Root>" + StrSortXml + "</Root>"
    $get(MasterObj + "txtSortXml").value = StrSortXml;
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickCHK(obj, Item) {
    if ($get(obj).checked == true) {
        if (SortArray[0] == null)
            SortArray[0] = 1 + '#' + Item;
        else {
            for (var i = SortArray.length; i > 0; i--)
                SortArray[i] = SortArray[i - 1];
            SortArray[0] = (parseInt(SortArray[0].split('#')[0]) + 1) + '#' + Item;
        }
        $get(Item).value = SortArray[0].split('#')[0];
    }
    else {
        var len = SortArray.length;
        if (SortArray[0].split('#')[1] == Item)             //-------------------------اگر اولین عنصر آرایه باشد
            SortArray.shift();
        else if (SortArray[len - 1].split('#')[1] == Item) {//-------------------------اگر آخرین عنصر آرایه باشد
            SortArray.pop(len - 1);
            for (var i = 0; i < SortArray.length; i++) {
                SortArray[i] = (parseInt(SortArray[i].split('#')[0]) - 1) + '#' + SortArray[i].split('#')[1];
                $get(SortArray[i].split('#')[1]).value = SortArray[i].split('#')[0];
            }
        }
        else {
            var Index = 0;                                          //-------------------------اگر عنصر میانی  آرایه باشد
            for (var i = 0; i < SortArray.length; i++) {
                if (SortArray[i].split('#')[0] == $get(Item).value)
                    Index = i;
            }
            for (var i = 0; i < Index; i++) {
                SortArray[i] = (parseInt(SortArray[i].split('#')[0]) - 1) + '#' + SortArray[i].split('#')[1];
                $get(SortArray[i].split('#')[1]).value = SortArray[i].split('#')[0];
            }
            for (var i = Index; i < SortArray.length; i++)
                SortArray[i] = SortArray[i + 1];
            SortArray.pop();
        }
        $get(Item).value = "";
    }
}
//----------------------------------------------------------------------------------------------------------------------
function OnFocusTxtPriority(obj) {
    OldPriorityVal = obj.value;
}
//----------------------------------------------------------------------------------------------------------------------
function OnBlurTxtPriority(Item, checkBox) {
    if ($get(checkBox).checked == true) {
        if ($get(Item).value != OldPriorityVal) {
            if ($get(Item).value > SortArray.length)
                $get(Item).value = SortArray.length;
            if ($get(Item).value < 1 || $get(Item).value == "")
                $get(Item).value = 1;
            var Flag = true, Index = 0, FFlag = true, FIndex = 0;
            while (Flag && Index <= SortArray.length) {
                if (SortArray[Index].split('#')[0] == $get(Item).value)
                    Flag = false;
                Index++;
            }
            while (FFlag && FIndex <= SortArray.length) {
                if (SortArray[FIndex].split('#')[0] == OldPriorityVal)
                    FFlag = false;
                FIndex++;
            }

            if (!Flag) {
                Index = Index - 1;
                FIndex = FIndex - 1;
                var Sum = OldPriorityVal - $get(Item).value;
                SortArray[Index] = parseInt(parseInt(SortArray[Index].split('#')[0]) + parseInt(Sum)) + "#" + SortArray[Index].split('#')[1];
                SortArray[FIndex] = $get(Item).value + "#" + SortArray[FIndex].split('#')[1];
                $get(SortArray[Index].split('#')[1]).value = SortArray[Index].split('#')[0];
                SortArray.sort();
                SortArray.reverse();
            }
        }
    }
    else {
        $get(checkBox).checked = true
        OnClickCHK(checkBox, Item);
    }
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnErja() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
    xmlDoc.loadXML(strChk);
    xmlDoc.setProperty("SelectionLanguage", "XPath");
    var xmlNodes = xmlDoc.documentElement.selectNodes("/WFEntity/vDocs[Selected=1]");
    if (xmlNodes.length > 0) {
        //======================================================
        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
        xmlDoc2.loadXML($get(MasterObj + "txtGridData").value);
        xmlDoc2.setProperty("SelectionLanguage", "XPath");
        var xmlNodes2 = xmlDoc2.documentElement.selectNodes("/DataEntryEntity/GetCreditManage[Selected=1]");
        for (var i = 0; i < xmlNodes2.length; i++)
            var f = xmlDoc2.documentElement.removeChild(xmlNodes2.item(i));
        $get(MasterObj + "txtGridData").value = xmlDoc2.xml;
        //======================================================
        var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=361105&SessionID=" + $get(MasterObj + "txtSessionID").value;
        var Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");
        if (Result != "" && Result != undefined) {
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(Result);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
            if (xmlNodes.length != 0)
                $get(MasterObj + "txtJPersonelID").value = xmlNodes.item(0).selectSingleNode('PersonID').text
            if ($get(MasterObj + "txtJPersonelID").value != "") {
                $get(MasterObj + "XMLvDocs").value = strChk;
                $get(MasterObj + "txtSubmit").value = "Erja";
                $get(MasterObj + "BtnSubmit").click();
            }
            else
                alert("هيچ پرسنلي براي ارجاع انتخاب نشده است");
        }
        else
            alert("هيچ پرسنلي براي ارجاع انتخاب نشده است");
    }
    else
        alert("هيچ موردي براي ارجاع انتخاب نشده است");
}
//----------------------------------------------------------------------------------------------------------------------
