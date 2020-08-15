var MasterObj = "ctl00_ContentPlaceHolder1_";

WidthScreen = window.screen.width;
document.body.style.overflow = "auto";
//        document.body.style.overflowY = "hidden";
window.document.dir = "RTL";
OnClickBtnFilter();
//        $get("GridViewCountainer").style.width = WidthScreen - 20;
//        TBLBase.style.width = WidthScreen - 20;
$get("OToolBar_TDTopToolBar").style.display = "none"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var AccessEdit = true;
var StrChk = "";

var ConfirmerCode = $get(MasterObj + "CmbCartablOwner_txtCode").value;
$('#txtHoliday').val($("#" + MasterObj + "KCalSDate_txtXmlHoliday").val());

$("document").ready(function () {
    $("#DivEX").hide();
    $("#TDEX").hide();
    $("#TDFilterItem").width = "100%";
    SetAttribFilter();

});
function SetAttribFilter() {
    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("TrueVal", $("#" + MasterObj + "KCalSDate_txtCalendar").val());
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("TrueVal", $("#" + MasterObj + "KCalEDate_txtCalendar").val());
    $("#" + MasterObj + "CmbCartablOwner_txtPCode").attr("TrueVal", $("#" + MasterObj + "CmbCartablOwner_txtCode").val());

    $("#" + MasterObj + "UCDepartment_cmbDepartment").attr("TrueVal", $("#" + MasterObj + "UCDepartment_cmbDepartment").val());
    $("#" + MasterObj + "UCGroup_cmbGroup").attr("TrueVal", $("#" + MasterObj + "UCGroup_cmbGroup").val());

    $("#" + MasterObj + "CmbDepartment").attr("TrueVal", $("#" + MasterObj + "CmbDepartment").val());
    $("#" + MasterObj + "CmbGroup").attr("TrueVal", $("#" + MasterObj + "CmbGroup").val());
    $("#" + MasterObj + "CmbDocType").attr("TrueVal", $("#" + MasterObj + "CmbDocType").val());
    $("#" + MasterObj + "CmbRequestor").attr("TrueVal", $("#" + MasterObj + "CmbRequestor").val());

    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("ChangeElem", "0");
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("ChangeElem", "0");
    $("#" + MasterObj + "CmbCartablOwner_txtPCode").attr("ChangeElem", "0");

    $("#" + MasterObj + "UCDepartment_cmbDepartment").attr("ChangeElem", "0");
    $("#" + MasterObj + "UCGroup_cmbGroup").attr("ChangeElem", "0");

    $("#" + MasterObj + "CmbDepartment").attr("ChangeElem", "0");
    $("#" + MasterObj + "CmbGroup").attr("ChangeElem", "0");
    $("#" + MasterObj + "CmbDocType").attr("ChangeElem", "0");
    $("#" + MasterObj + "CmbRequestor").attr("ChangeElem", "0");

    $get(MasterObj + "KCalSDate_txtCalendar").attachEvent("onchange", OnChangeKCalSDate);
    $get(MasterObj + "KCalEDate_txtCalendar").attachEvent("onchange", OnChangeKCalEDate);
    $get(MasterObj + "CmbCartablOwner_txtPCode").attachEvent("onblur", OnChangeCartablOwner);
    $get(MasterObj + "UCDepartment_cmbDepartment").attachEvent("onchange", OnChangeCmbDepartment);
    $get(MasterObj + "UCGroup_cmbGroup").attachEvent("onchange", OnChangeCmbGroup);

    var obj = $("[ChangeElem=1]");
    obj.attr("ChangeElem", "0");
    SetImgSrc();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//--------------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
}
//--------------------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    if (ConfirmerCode != $get(MasterObj + "CmbCartablOwner_txtCode").value) {
        $("#" + MasterObj + "CmbCartablOwner_txtPCode").attr("ChangeElem", "1");
        SetImgSrc(1);
        ConfirmerCode = $get(MasterObj + "CmbCartablOwner_txtCode").value
    }

    if (ConfirmerCode != $get(MasterObj + "UCDepartment_cmbDepartment").value) {
        $("#" + MasterObj + "UCDepartment_cmbDepartment").attr("ChangeElem", "1");
        SetImgSrc(1);
        ConfirmerCode = $get(MasterObj + "UCDepartment_cmbDepartment").value
    }

    if (ConfirmerCode != $get(MasterObj + "UCGroup_cmbGroup").value) {
        $("#" + MasterObj + "UCGroup_cmbGroup").attr("ChangeElem", "1");
        SetImgSrc(1);
        ConfirmerCode = $get(MasterObj + "UCGroup_cmbGroup").value
    }

    var StrVal = $get(MasterObj + "txtSubmit").value;
    //            $get("GridViewCountainer").style.width = WidthScreen - 20;
    //----------------------------------------------------------------------------------------  
    if ($get(MasterObj + "txtAlert").value != "") {

        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value);
      
        else
            alert($get(MasterObj + "txtAlert").value);
    }
    if ($get(MasterObj + "txtSubmit").value == "LoadCreator") {
        SetAttribFilter();
        SetValuCombo();

    }
    else if ($get(MasterObj + "txtSubmit").value == "FilterValue") {
        onchangeCmbDocType();
        SetAttribFilter();
        SetFilterValueState();
    }
    else if ($get(MasterObj + "txtSubmit").value != "") {
        if ($("#" + MasterObj + "txtPartOneCH").val() == "1")
            onchangeCmbDocType();
        SetAttribFilter();
        SetFilterValueState();
    }
    if (StrVal == "BtnFirst" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "BtnPrev" || StrVal == "Const" || StrVal == "Filter")
        SetChk();
    else
        StrChk = "";
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    LastSelectedRow = null;
}
//--------------------------------------------------------------------------------------------
function MakeXmlAction(Action, RPID, RPType) {
    StrChk += "<ActionTb>"
    StrChk += "<Action>" + Action + "</Action>"
    if (RPID != "")
        StrChk += "<R_P_ID>" + RPID + "</R_P_ID>"
    if (RPType != "")
        StrChk += "<R_P_Type>" + RPType + "</R_P_Type>"
    StrChk += "</ActionTb>"
    return StrChk;
}
//--------------------------------------------------------------------------------------------
function OnClickBtnAccept() {
    if (StrChk.toString().trim() != "") {
        GetPageNumber();
        $get(MasterObj + "txtAction").value = "1";
        $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(1, "", "") + "</Root>";
        $get(MasterObj + "txtSubmit").value = "Action";
        $get(MasterObj + "BtnSubmit").click();
    }
    else
        alert("هيچ موردي جهت تاييد انتخاب نشده است");
}
//--------------------------------------------------------------------------------------------
function GetPageNumber() {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    var PageSizeAccept = OGrid.rows.length - 1;
    var ChkCount;
    var PageSize;
    var PageNumberAccess;
    var PageNumberMain
    var strXml = "<Root>" + StrChk + "</Root>"
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[PageNumber<=" + $get(MasterObj + "txtCurPage").value + "]");
    ChkCount = oXmlNodes.length;
    PageSize = parseInt($get(MasterObj + "txtPageSize").value)
    if (OGrid.rows(PageSizeAccept).getAttribute("Footer") == 1)
        PageSizeAccept = PageSizeAccept - 1;
    PageNumberAccess = parseInt($get(MasterObj + "txtCurPage").value)
    if ((PageNumberAccess == parseInt($get(MasterObj + "Totalpage").value)) && parseInt(PageSizeAccept) < PageSize) {
        PageNumberMain = 1;
    }
    else {
        PageNumberMain = ((PageSize * PageNumberAccess) - ChkCount) / PageSize;
    }

    $get(MasterObj + "txtPageNumber").value = Math.ceil(PageNumberMain).toString();
    if ($get(MasterObj + "txtPageNumber").value == "0")
        $get(MasterObj + "txtPageNumber").value = "1";
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNotAccept() {
    if (StrChk.toString().trim() != "") {
        var Msg = "آيا براي عدم تاييد مطمئنيد؟"
        if (confirm(Msg)) {
            $get(MasterObj + "txtAction").value = "2";
            $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(2, "", "") + "</Root>";
            $get(MasterObj + "txtSubmit").value = "Action";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("هيچ موردي جهت عدم تاييد انتخاب نشده است");
}
//--------------------------------------------------------------------------------------------
function OnClickBtnErjaToRequester() {
    if (StrChk.toString().trim() != "") {
        var Msg = "آيا براي ارجاع به درخواست کننده مطمئنيد؟"
        if (confirm(Msg)) {
            $get(MasterObj + "txtAction").value = "-2";
            $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(-2, "", "") + "</Root>";
            $get(MasterObj + "txtSubmit").value = "Action";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("هيچ موردي جهت ارجاع به درخواست کننده انتخاب نشده است");
}
//--------------------------------------------------------------------------------------------
function OnClickBtnErjaToStepBefor() {
    if (StrChk.toString().trim() != "") {
        var Msg = "آيا براي ارجاع به مرحله قبل مطمئنيد؟"
        if (confirm(Msg)) {
            $get(MasterObj + "txtAction").value = "-1";
            $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(-1, "", "") + "</Root>";
            $get(MasterObj + "txtSubmit").value = "Action";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    else
        alert("هيچ موردي جهت ارجاع به مرحله قبل انتخاب نشده است");
}
//--------------------------------------------------------------------------------------------
function OnClickBtnErjaToPerson() {
    if (StrChk.toString().trim() != "") {
        var Msg = "آيا براي ارجاع به شخص خاص مطمئنيد؟"
        if (confirm(Msg)) {
            var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=1&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
            strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            Result = window.showModalDialog(url, "", strOptions)
            if (Result != "" && Result != undefined) {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
                if (xmlNodes.length != 0) {
                    var JPersonID = xmlNodes.item(0).selectSingleNode('PCode').text
                    //------------------------------------------------------------------------------------------------------
                    $get(MasterObj + "txtAction").value = "-3";
                    $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(-3, JPersonID, "P") + "</Root>";
                    $get(MasterObj + "txtSubmit").value = "Action";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
        }
    }
    else
        alert("هيچ موردي جهت ارجاع به شخص خاص انتخاب نشده است");
}
//--------------------------------------------------------------------------------------------
function OnClickBtnErjaForReport() {
    if (StrChk.toString().trim() != "") {
        var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=1&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
        Result = window.showModalDialog(url, "", strOptions)
        if (Result != "" && Result != undefined) {
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(Result);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length != 0) {
                var JPersonID = xmlNodes.item(0).selectSingleNode('PCode').text;
                //------------------------------------------------------------------------------------------------------
                $get(MasterObj + "txtAction").value = "-4";
                $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(-4, JPersonID, "P") + "</Root>";
                $get(MasterObj + "txtSubmit").value = "Action";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
    }
    else
        alert("هيچ موردي جهت ارجاع بمنظور اطلاع انتخاب نشده است");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    var PageSize = OGrid.rows.length;
    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
        PageSize = PageSize - 1;

    for (var i = 1; i < PageSize; i++) {
        if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
            OGrid.rows(i).cells(0).firstChild.checked = obj.checked
            OnClickChk(OGrid.rows(i).cells(0).firstChild);
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    var strXml = "<Root>" + StrChk + "</Root>"
    //========================================================
    var DocID = oGrid.rows(oIndex).DocID;
    var DocTypeID = oGrid.rows(oIndex).DocTypeID;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
        strXml = oXmlDoc.xml;
        StrChk = strXml.replace("<Root>", "");
        StrChk = StrChk.replace("</Root>", "");
        StrChk = StrChk.replace("<Root/>", "");
    }
    else {
        StrChk += "<Tb>"
        StrChk += "<RowNo>" + oGrid.rows(oIndex).RowNumber + "</RowNo>";
        StrChk += "<DocID>" + DocID + "</DocID>"
        StrChk += "<DocTypeID>" + DocTypeID + "</DocTypeID>"
        StrChk += "<Action></Action>"
        StrChk += "<ActorDesc>" + oGrid.rows(oIndex).cells(9).firstChild.value + "</ActorDesc>"
        StrChk += "<PageNumber>" + $get(MasterObj + "txtCurPage").value + "</PageNumber>"
        StrChk += "</Tb>"
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
    if (LastSelectedRow.DocTable == 'att.StaticCodeValue' && LastSelectedRow.DocTypeID == '12')
        DocTable = 'Att.KaranePack';
    else
        DocTable = LastSelectedRow.DocTable;
    if (AccessEdit == true && LastSelectedRow.StatusId != "205") {
      
        var url = "";
        var DialogProperty = "";
        //        alert(LastSelectedRow.DocTable)

        switch (LastSelectedRow.DocTable) {
            case "att.attendance":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.Attendance":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;
            case "att.credit":
                switch (LastSelectedRow.IsCredit) {
                    case "0":
                        var url = "/TAPresentation/App_Pages/Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                        var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
                        break;

                    case "1":
                        url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
                        DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no"
                        break;
                }
                break;
            case "att.StaticCodeValue":
                switch (LastSelectedRow.DocTypeID) {
                    case "4":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                        break;
                    case "5":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                        break;
                    case "6":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                        break;
                    case "12":
                        url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                        DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                        break;
                }
                break;
            case "att.DayContinuation":
                url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no";
                break;
            case "Att.ReplaceDetail":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "Att.PackInstance":
                url = "/TAPresentation/App_Pages/DataEntry/SchedulingProg.aspx";
                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "Att.ScheduleChanges":
                url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no";
                break;

            case "TSH.TimeSheetCell":
                var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
                var DialogProperty = "dialogHeight:550px;dialogWidth:990px;center: Yes;help: no;status: no;resizable=1"


                break;
            case "att.DutyGeneral":
                var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
                var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                break;
            case "Gim.Request":
                url = "/GimPresentation/App_Pages/Requisition/RegisterRequestion.aspx";
                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                break;
        }

        url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&TableName=" + DocTable
                + "&FieldName=ID"
                + "&FieldValue=" + LastSelectedRow.DocID
            returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
       
        if (returnValue == 1)
            OnClickBtnFilter();
    }
    else if (LastSelectedRow.StatusId == "205")
        alert("امکان ويرايش مجوز حذف شده وجود ندارد");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        OndbClickGrd();
    }
    else
        alert("لطفا به منظور ويرايش يک سطر را انتخاب کنيد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    if ($("#" + MasterObj + "UCGroup_txtHidden").val() != "") {
        var Groups = $("#" + MasterObj + "UCGroup_txtHidden").val(), xml, GroupString = '';
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(Groups)
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Groups, 'text/xml');
        }
        $(xml)
                .find("Root").find("Tb").each(function () {
                    GroupString = GroupString + "," + $(this).find('GroupId').text();
                });
        GroupString = GroupString.substring(1, GroupString.length)
        $("#" + MasterObj + "txtUCGroup").val(GroupString);
    }
    else
        $("#" + MasterObj + "txtUCGroup").val($("#" + MasterObj + "UCGroup_cmbGroup").val());
    //---------------------------------------------------------------------------------------------
    if ($("#" + MasterObj + "UCDepartment_txtHidden").val() != "") {

        var Departments = "<Root>" + $("#" + MasterObj + "UCDepartment_txtHidden").val() + "</Root>", DeptString = '';
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(Departments);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Departments, 'text/xml');
        }
        $(xml)
                .find("Root").find("Tb").each(function () {
                    DeptString = DeptString + "," + $(this).find('DepartmentID').text();
                });
        DeptString = DeptString.substring(1, DeptString.length)
        $("#" + MasterObj + "txtUCDepartment").val(DeptString);
    } else
        $("#" + MasterObj + "txtUCDepartment").val($("#" + MasterObj + "MultiDepartment_cmbDepartment").val());
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
    if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
    else {
        $get(MasterObj + "txtAction").value = "";
        //----------------------------------------------------------------------------------
        $get(MasterObj + "txtCartablOwner").value = $get(MasterObj + "CmbCartablOwner_txtCode").value
        MakeStrExtended();
        MakeSortItemStr();
        if ($("[ChangeElem=1]").length > 0) {
            
            if ($("#" + MasterObj + "CmbCartablOwner_txtPCode").attr("ChangeElem") == "1" || $("#" + MasterObj + "CmbDocStatus").attr("ChangeElem") == "1")
                $("#" + MasterObj + "txtPartOneCH").val(1);
            else $("#" + MasterObj + "txtPartTwoCH").val(1);
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";

            document.getElementById(MasterObj + "BtnBoth").click();
        }
        else {
            $("#" + MasterObj + "txtPartOneCH").val(0);
            $("#" + MasterObj + "txtPartTwoCH").val(0);
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }

    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeSortItemStr() {//رشته سورت را ازآيتم هاي سورت مي سازد

    var Str1 = "", Str2 = "", Str3 = "", Str4 = "";
    
    var ImgItem, StrDirectionSort;
    $("#" + MasterObj + "txtSortStr").val("");
    $("[SortText=1]").each(function () {
        if (this.value != "") {
            ImgItem = this.parentElement.childNodes(1);
            StrDirectionSort = (ImgItem.src.split("/")[ImgItem.src.split("/").length - 1] == "Up11.png" ? " asc " : " desc ");
            eval("Str" + this.value.toString() + "='" + this.itemname + StrDirectionSort + "'");
        }
    });
   


    if (Str1 != "") {
        $("#" + MasterObj + "txtSortStr").val($('#' + MasterObj + 'txtSortStr').val() + Str1);
        if ($("#" + MasterObj + "txtSortStr").val() != "")
            $("#" + MasterObj + "txtSortStr").val($("#" + MasterObj + "txtSortStr").val() + ",");
    }
    if (Str2 != "") {
        $("#" + MasterObj + "txtSortStr").val($('#' + MasterObj + 'txtSortStr').val() + Str2);
        if ($("#" + MasterObj + "txtSortStr").val() != "")
            $("#" + MasterObj + "txtSortStr").val($("#" + MasterObj + "txtSortStr").val() + ",");
    }
    if (Str3 != "") {
        $("#" + MasterObj + "txtSortStr").val($('#' + MasterObj + 'txtSortStr').val() + Str3);
        if ($("#" + MasterObj + "txtSortStr").val() != "")
            $("#" + MasterObj + "txtSortStr").val($("#" + MasterObj + "txtSortStr").val() + ",");
    }
    if (Str4 != "") {
        $("#" + MasterObj + "txtSortStr").val($('#' + MasterObj + 'txtSortStr').val() + Str4);
        if ($("#" + MasterObj + "txtSortStr").val() != "")
            $("#" + MasterObj + "txtSortStr").val($("#" + MasterObj + "txtSortStr").val() + ",");
    }
    if ($("#" + MasterObj + "txtSortStr").val().substr($("#" + MasterObj + "txtSortStr").val().length - 1) == ",")
        $("#" + MasterObj + "txtSortStr").val($("#" + MasterObj + "txtSortStr").val().substr(0, $("#" + MasterObj + "txtSortStr").val().length - 2));

}
//----------------------------------------
function OnClickImgFlow(obj) {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    if (OGrid != null) {
        var oRow = window.event.srcElement.parentElement
        while (oRow.tagName != "TR")
            oRow = oRow.parentElement
        var DocID = oRow.getAttribute('DocID')
        var DocTypeID = oRow.getAttribute('DocTypeID')
    }
    window.showModalDialog("DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickRequestDate(obj) {
    var url = "", DialogProperty = "", DocTable = "";
    if (obj.parentElement.DocTable == 'att.StaticCodeValue' && obj.parentElement.DocTypeID == '12')
        DocTable = 'Att.KaranePack';
    else
        DocTable = obj.parentElement.DocTable;
    switch (obj.parentElement.DocTable) {
        case "att.attendance":
            url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.Attendance":
            url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "att.credit":
            url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
            DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no"
            break;
        case "att.StaticCodeValue":
            switch (obj.parentElement.DocTypeID) {
                case "4":
                    url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "5":
                    url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "6":
                    url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "12":
                    url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                    DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                    break;
            }
            break;
        case "att.DayContinuation":
            url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
            DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no";
            break;
        case "Att.ReplaceDetail":
            url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
            break;

        case "Att.PackInstance":
            url = "/TAPresentation/App_Pages/DataEntry/SchedulingProg.aspx";
            DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
            break;
        case "Att.ScheduleChanges":
            url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
            DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no";
            break;
        case "TSH.TimeSheetCell":
            var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
            var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
            break;
        case "att.DutyGeneral":
            var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
            var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
            break;
        case "Att.KaranePack":
            url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
            DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
            break;
        case "Gim.Request":
            url = "/GimPresentation/App_Pages/Requisition/RegisterRequestion.aspx";
            DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
            break;
    }
    url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&TableName=" + DocTable
            + "&FieldName=ID"
            + "&FieldValue=" + obj.parentElement.DocID
            + "&ModifyFlag=0"
    window.showModalDialog(encodeURI(url), "", DialogProperty);
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onchangeCmbDocType() {
    $("#DivEX").hide("slow");
    $("#TDEX").hide("slow");
    $("#TDFilterItem").width = "100%";

    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML($get(MasterObj + "txtXmlFilter").value)

    var oxmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/FilterValue[Type='D' and DocTypeID=" + $get(MasterObj + "CmbDocType").value + "]");
    if (oxmlNode.length > 0) {
        var Flag = MakeItems(oxmlNode[0].selectSingleNode("Extended").text);
        if (Flag) {
            TDEX.style.width = WidthScreen - 750;
            $("#TDFilterItem").width = 750;
            $("#TDEX").show("slow");
            $("#DivEX").show("slow");
            onclickImgCreator();
        }
    }
}
//=======================================
function MakeItems(Str) {
    ClearTableExtended();
    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML(Str)

    if (Str != "") {
        var oxmlNode = oXml.documentElement.selectNodes("/Root/Item");
        if (oxmlNode.length == 0)
            return false;
        var i = 0;
        while (i < oxmlNode.length) {
            var ORow = TBEX.insertRow();
            ORow.insertCell();
            ORow.insertCell();
            ORow.cells(0).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";

            ORow.cells(1).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
            ORow.cells(1).style.textAlign = "right";

            i++;
            if (i < oxmlNode.length) {
                ORow.insertCell();
                ORow.insertCell();
                ORow.cells(2).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";
                ORow.cells(3).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
                ORow.cells(3).style.textAlign = "right";
                i++;
            }
        }
    }
    else
        return false;
    return true;
}
//=======================================
function ClearTableExtended() {
    while (TBEX.rows.length > 0)
        TBEX.deleteRow();
}
//=========================================ساختن آيتم هاي تکميلي
function CreateItem(XmlNode, Constractor) {
    var ReturnV = "";
    var Type = XmlNode.selectSingleNode("Type").text;
    switch ((Type).toLowerCase()) {
        case "string":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px' class='TxtControls' type='text'/>";
            break;
        case "time":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:50px;text-align:right' onblur='Timechk(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text'/>";
            break;
        case "bit":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "  class='TxtControls' type='checkbox'/>";
            break;
        case "int":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px;text-align:center' onkeydown='OnKeyDownInt(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text'/>";
            break;
        case "date":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' type='text' style='display:none' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "/> <input  style='width:130px;text-align:right' onchange='onchangeDate(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text'/><img src='/FrmPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' onclick='onclickImgDate(this)'/>";
            break;
        case "select":
            ReturnV = "<select name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "'  Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px' TYPE='Creator' class='TxtControls'><option value='0'>انتخاب همه</option></select>";
            break;
        default:
            ReturnV = "<select  name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' style='width:100px' Default=" + XmlNode.selectSingleNode("Default").text + " Const='" + Constractor + "' class='TxtControls'>" + MakeCombo(XmlNode.selectSingleNode("Type").xml) + "</select>";
            break;
    }
    return ReturnV;
}
//=======================================
function MakeCombo(XmlData) {
    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML(XmlData)
    var Str = "";
    var oxmlNode = oXml.documentElement.selectNodes("/Type/N");
    for (var i = 0; i < oxmlNode.length; i++) {
        Str = Str + "<option value='" + oxmlNode[i].selectSingleNode("V").text + "'>" + oxmlNode[i].selectSingleNode("T").text + "</option>";
    }
    return Str;
}
//=======================================
function onfocusItem(obj) {
    if (obj.tagName != "select")
        obj.select();
    else obj.setActive();
    obj.focus();
}
//================================تغيير کنترل تاريخ تکميلي
function onchangeDate(obj) {
    var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value;
    var Year = objNow.substr(0, 4)
    var Month = objNow.substr(5, 2)
    var Day = objNow.substr(8, 2)
    var RealVal = "";
    var sal;
    if (obj.value != "") {
        var Date = "";
        var s = obj.value.split('/');
        if (s.length > 3) {
            obj.value = "";
            return;
        }
        if (s[2] != null) {

            sal = s[2].split('  ');
        }
        if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
            obj.value = "";
            return;
        }
        if (s.length == 3) {
            if (s[1].length == 1 && s[1] != "0")
                Date = Date + "0" + s[1] + "/"
            if (s[1].length == 1 && s[1] == "0")
                Date = Date + "01" + "/"
            if (s[1].length == 2 && s[1] != "00")
                Date = Date + s[1] + "/"
            if (s[1].length == 2 && s[1] == "00")
                Date = Date + "01" + "/"
            if (s[1].length == 0)
                Date = Date + Month + "/"
            if (s[0].length == 1 && s[0] != "0")
                Date = Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Date + "01";
            if (s[0].length == 0)
                Date = Date + Day
            if (s[2] == null)
                Date = Year + "/" + Date
            if (s[2] != null) {
                var sal;
                sal = s[2].split('  ');
                if (sal[0].length == 0)
                    Date = Year + "/" + Date
                if (sal[0].length == 1)
                    Date = Year.substr(0, 3) + sal[0] + "/" + Date
                if (sal[0].length == 2)
                    Date = Year.substr(0, 2) + sal[0] + "/" + Date
                if (sal[0].length == 3)
                    Date = Year.substr(0, 1) + sal[0] + "/" + Date
                if (sal[0].length == 4 && sal[0] != "0000")
                    Date = sal[0] + "/" + Date
                if (sal[0].length == 4 && sal[0] == "0000")
                    Date = Year + "/" + Date
            }
        }
        if (s.length == 2) {
            if (s[1].length == 1 && s[1] != "0")
                Date = Date + "0" + s[1] + "/"
            if (s[1].length == 1 && s[1] == "0")
                Date = Date + "01" + "/"
            if (s[1].length == 2 && s[1] != "00")
                Date = Date + s[1] + "/"
            if (s[1].length == 2 && s[1] == "00")
                Date = Date + "01" + "/"
            if (s[1].length == 0)
                Date = Date + Month + "/"
            if (s[0].length == 1 && s[0] != "0")
                Date = Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Date + "01";
            if (s[0].length == 0)
                Date = Date + Day
            Date = Year + "/" + Date
        }
        if (s.length == 1) {
            if (s[0].length == 1 && s[0] != "0")
                Date = Year + "/" + Month + "/" + Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Year + "/" + Month + "/" + Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Year + "/" + Month + "/" + Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Year + "/" + Month + "/" + Date + "01"
        }
        RealVal = Date;
        Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
        obj.value = Date
        obj.value = obj.value + "  " + F_adbsghh(obj.value)
    }
    obj.parentElement.firstChild.value = RealVal;
}
//====================================ساخت جدول فيلد تکميلي 
function MakeStrExtended(obj) {
    var Obj;
    var Context = "";
    var Str = "";
    for (var i = 0; i < TBEX.rows.length; i++) {
        var j = 1;
        while (j < TBEX.rows(i).cells.length) {
            Obj = TBEX.rows(i).cells(j).firstChild;
            if (Obj.getAttribute("Default").trim() != Obj.value.trim() && obj != Obj) {
                Context = Obj.getAttribute("Const");
                Context = ReplaceAll(Context, "@", Obj.value);
                Str = Str + " " + Context.substr(0, Context.indexOf("«") == -1 ? Context.length : Context.indexOf("«"));
                var Start, End
                if (Context.indexOf("«") > -1) {
                    Start = Context.indexOf("«") + 1;
                    End = Context.indexOf("»") - Start;
                    var TEXT = ReplaceAll(Context.substr(Start, End), '"', "'");
                    Str = Str + eval(TEXT)
                }
                Str = ReplaceAll(Str, '"', "'");
            }
            j += 2;
        }
    }
    $get(MasterObj + "txtStrFilter").value = Str;
}
//==============================کليک آيکن به روز رساني فيلد تکميلي
function onclickImgCreator(obj) {
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
    if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
    else {
        //----------------------------------------------------------------------------------
        $get(MasterObj + "txtCartablOwner").value = $get(MasterObj + "CmbCartablOwner_txtCode").value
        MakeStrExtended(obj);
        $get(MasterObj + "txtSubmit").value = "LoadCreator";
        $get(MasterObj + "BtnLoadCombo").click();
    }
}
//=============================روي تغيير هر کدام از آيتم هاي فيلتر هاي ثابت بايد فيلد تکميلي هم علامت تغيير بخورد
function OnChangeKCalSDate() {
    var Flag = 0;
    obj = "#" + MasterObj + "KCalSDate_txtCalendar";
    OnChangeElement(obj)
}
function OnChangeKCalEDate() {
    var Flag = 0;
    obj = "#" + MasterObj + "KCalEDate_txtCalendar";
    OnChangeElement(obj)
}
function OnChangeCartablOwner() {
    obj = "#" + MasterObj + "CmbCartablOwner_txtPCode";
    Flag = 1;
    OnChangeElement(obj)
}
function OnChangeCmbDepartment() {
    obj = "#" + MasterObj + "UCDepartment_cmbDepartment";
    Flag = 1;
    OnChangeElement(obj)
}
function OnChangeCmbGroup() {
    obj = "#" + MasterObj + "UCGroup_cmbGroup";
    Flag = 1
    OnChangeElement(obj)
}
function OnChangeElement(obj) {
    if ($(obj).attr("TrueVal") == undefined)
        obj = obj.srcElement;
    if ($(obj).attr("TrueVal") != null)
        if ($(obj).attr("TrueVal").trim() != $(obj).val().trim())
            $(obj).attr("ChangeElem", 1);
        else
            $(obj).attr("ChangeElem", "0");
    SetImgSrc(Flag);
}
function onchangeElem(obj) {
    var Flag = 0;
    if ($(obj).attr("TrueVal") == undefined)
        obj = obj.srcElement;
    if ($(obj).attr("TrueVal") != null)
    //    alert($(obj).val().trim())
        if ($(obj).attr("TrueVal").trim() != $(obj).val().trim()) {
            $(obj).attr("ChangeElem", 1);
        }
        else
            $(obj).attr("ChangeElem", "0");
    if ($(obj).id != null)
        if ($(obj).id == MasterObj + "CmbCartablOwner_txtPCode" || $(obj).id == MasterObj + "UCDepartment_cmbDepartment" || $(obj).id == MasterObj + "UCGroup_cmbGroup")
            Flag = 1;
    SetImgSrc(Flag);
}
//==============================ست کردن آيکن به روز رساني براي فيلد تکميلي
function SetImgSrc(Flag) {
    //alert(10)

    var obj = $("[ChangeElem=1]");
//    alert(obj.length)
    if (obj.length > 0) {
        $(".ImageClass").css("backgroundColor", "Red");
        $(".ImageClass").attr("title", "بارگذاري مجدد");
        if (Flag == 1)
            $("#DivPartOne").css("background-color", "Red");
    }
    else {
        $("#txtPartTwoCH").val("0");
        $(".ImageClass").css("backgroundColor", "green");
        $(".ImageClass").attr("title", "");
        if (Flag == 1)
            $("#DivPartOne").css("background-color", "green");
    }
}
//============================لود داده هاي مربوط به فيلد تکميلي
function SetValuCombo() {
    $("#" + MasterObj + "txtXmlCombo").val("<Root>" + $("#" + MasterObj + "txtXmlCombo").val() + "</Root>");
    var xml;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML($("#" + MasterObj + "txtXmlCombo").val());
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString($("#" + MasterObj + "txtXmlCombo").val(), 'text/xml');
    }
    for (var i = 0; i < TBEX.rows.length; i++) {
        var j = 1;
        while (j < TBEX.rows(i).cells.length) {
            Obj = TBEX.rows(i).cells(j).firstChild;

            var ObjCh = $(xml).find($(Obj).attr("FName"));
            switch ($(Obj).attr("tagName")) {
                case "SELECT":
                    $(Obj).html("");
                    $(ObjCh).each(function () {
                        var title = $(this).find('Title').text();
                        var Val = $(this).find('Val').text();
                        $(Obj).append("<option value=" + Val + ">" + title + "</option>");
                    });
                    break;
                case "INPUT":
                    if (Obj.parentElement.childNodes[2] != null && Obj.parentElement.childNodes[2] != undefined) {
                        Obj.parentElement.childNodes[2].value = "";
                        onchangeDate(Obj.parentElement.childNodes[2]);
                        $(ObjCh).find($(Obj).attr("name")).each(function () {
                            Obj.parentElement.childNodes[2].value = $(this).text();
                            onchangeDate(Obj.parentElement.childNodes[2]);
                        });
                    }
                    else {
                        Obj.value = "";
                        $(ObjCh).find($(Obj).attr("name")).each(function () {
                            $(Obj).val($(this).text());
                        });
                    }
                    break;
            }
            j++;
        }
    }

}
//====================================باز شدن پنجره تقويمهاي فيلدهاي تکميلي
function onclickImgDate(obj) {
    if (obj.parentElement.firstChild.value != "") {
        var Year = obj.parentElement.firstChild.value.substr(0, 4);
        var Month = obj.parentElement.firstChild.value.substr(5, 2);
        var Day = obj.parentElement.firstChild.value.substr(8, 2);
    }
    else {

        var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value

        var Year = objNow.substr(0, 4)
        var Month = objNow.substr(5, 2)
        var Day = objNow.substr(8, 2)
    }
    var strFeature = "dialogHeight:266px;dialogWidth:277px;dialogLeft:200px;dialogTop:200px;status=no";
    var strUrl = "/FrmPresentation/App_Utility/NewCalendar/SolarCalendar.htm";

    var oCurrentDate = new Object();
    oCurrentDate.Year = Year;
    oCurrentDate.Month = Month;
    oCurrentDate.Day = Day;
    oCurrentDate.Holiday = $get('txtHoliday').value;
    var oDate = showModalDialog(strUrl, oCurrentDate, strFeature);
    var strYear = "";
    var strMonth = "";
    var strDay = "";
    if (oDate != null) {
        var strYear = oDate.Year;
        var strMonth = ((parseInt(oDate.Month, 10) < 10) ? "0" + parseInt(oDate.Month, 10).toString() : oDate.Month.toString());
        var strDay = ((parseInt(oDate.Day, 10) < 10) ? "0" + parseInt(oDate.Day, 10).toString() : oDate.Day.toString());
    }
    Year = strYear;
    Month = strMonth;
    Day = strDay;
    oDate = Day + '/' + Month + '/' + Year;
    if (oDate != "//") {
        obj.parentElement.childNodes[2].value = oDate;
        onchangeDate(obj.parentElement.childNodes[2]);
        obj.parentElement.firstChild.value = Year + '/' + Month + '/' + Day;
    }
}
//====================================
function onclickImgFilterValue(obj) {
    $get(MasterObj + "txtSubmit").value = "FilterValue";
    $get(MasterObj + "BtnLoadCombo").click();
}
//=================================
function SetFilterValueState() {
    var Date = $get(MasterObj + "txtKCalSDate").value;
    if (Date.substr(8, 2) != "" && Date.substr(5, 2) != "" && Date.substr(0, 4) != "") {
        $get(MasterObj + "KCalSDate_txtDay").value = Date.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = Date.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = Date.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtCalendar").value = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4) + " " + F_adbsghh(Date);
    }
    else {
        $get(MasterObj + "KCalSDate_txtDay").value = "";
        $get(MasterObj + "KCalSDate_txtMonth").value = "";
        $get(MasterObj + "KCalSDate_txtYear").value = "";
        $get(MasterObj + "KCalSDate_txtCalendar").value = "";
    }

    Date = $get(MasterObj + "txtKCalEDate").value;
    if (Date.substr(8, 2) != "" && Date.substr(5, 2) != "" && Date.substr(0, 4) != "") {
        $get(MasterObj + "KCalEDate_txtDay").value = Date.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = Date.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = Date.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtCalendar").value = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4) + " " + F_adbsghh(Date);
    }
    else {
        $get(MasterObj + "KCalEDate_txtDay").value = "";
        $get(MasterObj + "KCalEDate_txtMonth").value = "";
        $get(MasterObj + "KCalEDate_txtYear").value = "";
        $get(MasterObj + "KCalEDate_txtCalendar").value = "";
    }
    $("#" + MasterObj + "txtPartOneCH").val("0");
    $("#DivPartOne").css("background-color", "green");
}
//=============================================================================
//function OnChangeCmbDocStaus() {
//    if ($get(MasterObj + "CmbDocStatus").selectedIndex == 1)
//        $get("OToolBar_BtnAccept").style.display = "none"
//    else
//        $get("OToolBar_BtnAccept").style.display = "inline"
//}
//=============================================================================
function GetAccessBtn() {
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
    if (xmlNodes.length != 0) {
        if (xmlNodes.item(0).selectSingleNode('BtnErjaToRequester') && xmlNodes.item(0).selectSingleNode('BtnErjaToRequester').text == 2)
            document.getElementById('OToolBar_BtnErjaToRequester').style.display = "none"
        if (xmlNodes.item(0).selectSingleNode('BtnErjaToPerson') && xmlNodes.item(0).selectSingleNode('BtnErjaToPerson').text == 2)
            document.getElementById('OToolBar_BtnErjaToPerson').style.display = "none"
    }
}
//=============================================================================
function onclickImgSort(obj) {
    obj.src = obj.src.split("/")[obj.src.split("/").length - 1] == "Up11.png" ? "../../../App_Utility/Images/Icons/Down11.png" : "../../../App_Utility/Images/Icons/Up11.png";
}
//----------------------------------------       
function OnFocusSortItem(obj) {
    obj.select();
    SortItemLastVal = obj.value;
}
//-------------------------------------
function onchangeSortNo(obj) {
    if (obj.value > 4) obj.value = 4;
    if (obj.value == "0") obj.value = "";
    var SortItems = $("[SortText=1]");
    $("[SortText=1]").each(function () {
        if (this != obj && obj.value != "")
            if (this.value == obj.value && SortItemLastVal != "")
                this.value = SortItemLastVal;
    });
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//===============================================================================================
function SetChk() {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    if (OGrid == null)
        return
    var PageSize = OGrid.rows.length;
    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
        PageSize = PageSize - 1;
    var strXml = "<Root>" + StrChk + "</Root>"
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
    for (var j = 0; j < oXmlNodes.length; j++) {
        for (var i = 1; i < PageSize; i++) {
            if (OGrid.rows(i).DocID == oXmlNodes.item(j).selectSingleNode("DocID").text
                    && OGrid.rows(i).DocTypeID == oXmlNodes.item(j).selectSingleNode("DocTypeID").text) {
                OGrid.rows(i).cells(0).firstChild.checked = true;
                OGrid.rows(i).cells(9).firstChild.value = oXmlNodes.item(j).selectSingleNode("ActorDesc").text
            }
        }
    }
}
//===============================================================================================
function OnChangeTxtDescr(obj) {
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    var strXml = "<Root>" + StrChk + "</Root>"
    //========================================================
    var DocID = oGrid.rows(oIndex).DocID;
    var DocTypeID = oGrid.rows(oIndex).DocTypeID;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DocID=" + DocID + "  and DocTypeID=" + DocTypeID + " ]");

    if (oXmlNodes.length > 0) {
        if (oGrid.rows(oIndex).cells(0).firstChild.checked) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            f.selectSingleNode("ActorDesc").text = oGrid.rows(oIndex).cells(9).firstChild.value
            oXmlDoc.childNodes[0].appendChild(f);
        }
        strXml = oXmlDoc.xml;
        StrChk = strXml.replace("<Root>", "");
        StrChk = StrChk.replace("</Root>", "");
        StrChk = StrChk.replace("<Root/>", "");
    }
}
//===============================================================================================
function OnFocusTxtDescr(obj) {
    obj.select();
}
//===============================================================================================
function OnClickBtnDocInfo() {
    if (LastSelectedRow != null) {
        var PersonID = LastSelectedRow.DocMemberID
        var DocTypeID = LastSelectedRow.DocTypeID
        var url = "/TaPresentation/App_Pages/Reports/DocInfo.aspx"
               + "?PersonCode=" + PersonID
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&DocTypeID=" + DocTypeID
               + "&PageMode=1&GrdHeight=480px"
        //               + "&WPeriodID=" + document.getElementById(MasterObj + "CmbPeriod").value
        //               + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        //               + "&EDate=" + document.getElementById(MasterObj + "EDate").value
        CreditState = 1
        var winPro = "dialogHeight: 550px;dialogWidth: 900px;Bottom:0pX;center: No;help: no;resizable:1;status: no;minimize: yes;"
        CreditInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
    }
    else
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
}
//===============================================================================================
function OnClickBtnExpire() {
    if (StrChk.toString().trim() != "") {
       GetPageNumber();
        $get(MasterObj + "txtAction").value = "1";
        $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(3, "", "") + "</Root>";
        $get(MasterObj + "txtSubmit").value = "Expire";
        $get(MasterObj + "BtnSubmit").click();
    }
    else
        alert("هيچ موردي جهت نهایی کردن انتخاب نشده است");
}
//-------------------------------------
function OnClickSendToPDF() {
    var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
    if(OGrid!=null){
        $get(MasterObj + "txtSubmit").value = "AllPDF";
        $get(MasterObj + "BtnSubmitSend").click();
    }
}

function OnClickSendToExcel() {
 var OGrid = document.getElementById(MasterObj + "GrdCreditManage");
 if (OGrid != null) {
     $get(MasterObj + "txtSubmit").value = "AllExcel";
     $get(MasterObj + "BtnSubmitSend").click();
 }
}
