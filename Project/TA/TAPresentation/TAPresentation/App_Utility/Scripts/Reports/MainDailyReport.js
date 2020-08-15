window.name = "MainDailyReport"

//---این متغیر برای این تعریف شده است که در حالت پرسنل قبلی و بعدی در زمانی که پرسنل تغییر می کند تا زمان تغییر کارکرد روزانه windآن پرگرس برداشته نشود
var FilterPerson = 0
var lastPersonCode = "";
var CreditState = 0, CardexState = 0
var win = null;
var arrColor = {
    0: ["lightgrey", "روزهاي جمعه"],
    1: ["#ffdfe7", "تعطيلات رسمي"],
    2: ["OldLace", "کارت ناقصي"],
    3: ["#E0C1FF", "تغيير ساختار"],
    4: ["#FFFFB7", "مداومت کاري تائيد نشده"],
    5: ["#37FF78", "مداومت کاري تائيد شده"],
    6: ["Red", "مجوز وارد نشده"],
    7: ["#ff33ff", "بخشي از مجوز وارد شده"],
    8: ["#009900", "مجوز تائيد نشده"]
};
var keyCode = 0
var CreditInfoDialogObj = null;
var DayContinuationRow = null;
var SelectRow = null;
/*****************************Grid Information*******************************/
var GridName = "GrdDailyReport";
var Grid = GrdDailyReport;
var XmlGridProperty = document.getElementById(MasterObj + "txtXmlGridProperty").value;
var XmlGridSetting = document.getElementById(MasterObj + "txtXmlGridSetting").value;
var XmlGridData = document.getElementById(MasterObj + "txtXmlRptGetPersonelDailyReport").value;

XmlGridData = XmlGridData.replace(/_x0020_/g, "_");

var arrGridEvent = {
    0: ["cell","", "DOW", "oncontextmenu", OnContextMenuDOW]
};


/*****************************Grid Information*******************************/


$(document).ready(function () {
    $('#TxtSDate').datepicker({
        showWeek: true,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        showOn: 'button',
        buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
        buttonText: '',
        buttonImageOnly: true,
        HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
    });

    $('#TxtEDate').datepicker({
        showWeek: true,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        showOn: 'button',
        buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
        buttonText: '',
        buttonImageOnly: true,
        HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
    });


    var startDate = document.getElementById(MasterObj + "SDate").value;
    var endDate = document.getElementById(MasterObj + "EDate").value;

    document.getElementById("TxtSDate").value = ReverceDate(document.getElementById(MasterObj + "SDate").value);
    document.getElementById("TxtEDate").value = ReverceDate(document.getElementById(MasterObj + "EDate").value);

    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;

    /*****************************Create Grid*******************************/

    BindGrid(Grid, XmlGridData, XmlGridProperty, XmlGridSetting, startDate, revStartDate, endDate, revEndDate, document.getElementById(MasterObj + "txtCompanyID").value, document.getElementById(MasterObj + "txtSessionID").value, document.getElementById(MasterObj + "txtOnLineUser").value, "", "IsSum;1", OnClickGrd, arrGridEvent, 1, true);

    /*****************************Create Grid*******************************/

    /*****************************Scroll Managing*******************************/
    if (document.getElementById(MasterObj + "txtMenuItemID").value != '1302') {
        var ParentDialog = dialogArguments;
        ParentDialog.CloseModelPopup();
        document.body.scroll = "no"
    }
    else {
        document.body.scroll = "yes"
    }
    /*****************************Scroll Managing*******************************/


    /*****************************HideToolbarMonthly*******************************/
    if (typeof document.getElementById("OToolBar_ImgRestor") == "object") {
        if (document.getElementById("OToolBar_ImgRestor") != null)
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
    }
    if (typeof document.getElementById("OToolBar_BtnShowAll") == "object") {
        if (document.getElementById("OToolBar_BtnShowAll") != null)
            document.getElementById("OToolBar_BtnShowAll").style.display = "none"
    }
    if (typeof document.getElementById("OToolBar_BtnSearch") == "object") {
        if (document.getElementById("OToolBar_BtnSearch") != null)
            document.getElementById("OToolBar_BtnSearch").style.display = "none"
    }
    /*****************************HideToolbarMonthly*******************************/


    document.body.attachEvent('onunload', Pageunload);
    document.body.attachEvent('onclick', HideLinkDiv);

    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        lastPersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else
        lastPersonCode = $get(MasterObj + "txtPersonCode").value;
    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
        document.getElementById("TDSearchTxt").style.display = "inline";
        document.getElementById("TDSearchCombo").style.display = "none";
    }
    else {
        document.getElementById("TDSearchTxt").style.display = "none";
        document.getElementById("TDSearchCombo").style.display = "inline";
    }


    CheckResolution();
    PageLoad();
    SetDeptNameAndToolTip();
    CheckMode();

    document.body.attachEvent('onkeydown', onkeydownBody)
});

/*****************************Page Event*******************************/
function Pageunload() {
    try {
        //                win.document.getElementById(MasterObj + "txtSubmit").value = "Show";
        //                if (dialogArguments && dialogArguments.DailyState)
        //                    dialogArguments.DailyState = 0
        //                win.document.getElementById(MasterObj + "BtnSubmit").click();
    } catch (e) { }
}

function PageLoad() {
    LastSelectedGridRow = null;
    FillDate();

    win = window.dialogArguments




}

function HideLinkDiv() {
    document.getElementById("LinkDiv").style.display = "none"
}

function CheckResolution() {
    GridViewCountainer.style.width = window.screen.width - 15 + "px"
    GridViewCountainer.style.height = window.screen.height - 190 + "px"
}

function SetDeptNameAndToolTip() {
    document.getElementById("DivRole").title = document.getElementById(MasterObj + "txtToolTipDept").value; //.replace("$","\n");
    document.getElementById("DivRole").innerText = document.getElementById(MasterObj + "txtDivDept").value;
    document.getElementById("DivRoleTitle").title = document.getElementById(MasterObj + "txtToolTipRole").value; //.replace("$","\n");
    document.getElementById("DivRoleTitle").innerText = document.getElementById(MasterObj + "txtRoleTitle").value;
}

function CheckMode() {

    if (document.getElementById(MasterObj + "txtMenuItemID").value != '1302')
        dialogArguments.DailyState = 1
}

function onkeydownBody() {
    keyCode = event.keyCode
    setTimeout("keyCode=0", 1000)
    $get(MasterObj + "CmbPerson_txtSDate").value = ReverceDate(document.getElementById("TxtSDate").value);
    $get(MasterObj + "CmbPerson_txtEDate").value = ReverceDate(document.getElementById("TxtEDate").value);
}


/*****************************Page Event*******************************/

/*****************************Date Control*******************************/
function onchangeDate() {
    $get(MasterObj + "CmbPerson_txtSDate").value = ReverceDate(document.getElementById("TxtSDate").value);
    $get(MasterObj + "CmbPerson_txtEDate").value = ReverceDate(document.getElementById("TxtEDate").value);

}

function GetDateFromCal() {

    DatePicker_OnBlur(document.getElementById("TxtSDate"));
    DatePicker_OnBlur(document.getElementById("TxtEDate"));


    if (!IsValidDateRev(document.getElementById("TxtSDate").value)) {

        alert("فرمت تاريخ شروع اشتباه است")
        return false
    }
    else
        if (!IsValidDateRev(document.getElementById("TxtEDate").value)) {
            alert("فرمت تاريخ خاتمه اشتباه است")
            return false
        }
        else {


            document.getElementById(MasterObj + "SDate").value = ReverceDate(document.getElementById("TxtSDate").value);
            document.getElementById(MasterObj + "EDate").value = ReverceDate(document.getElementById("TxtEDate").value);
            if (document.getElementById(MasterObj + "SDate").value > document.getElementById(MasterObj + "EDate").value) {
                alert("تاريخ شروع از تاريخ خاتمه بزرگتر است ");
                return false
            }
        }

    return true
}

function FillDate() {

    if (document.getElementById(MasterObj + "SDate").value != "") {

        document.getElementById("TxtSDate").value = ReverceDate(document.getElementById(MasterObj + "SDate").value);
    }
    if (document.getElementById(MasterObj + "EDate").value != "") {

        document.getElementById("TxtEDate").value = ReverceDate(document.getElementById(MasterObj + "EDate").value);
    }


}
/*****************************Date Control*******************************/

/*****************************PersonCode Control*******************************/
function onkeydownEnterPersonCode() {

    if (window.event != null) {
        if (window.event.keyCode == 13) {
            if (event.srcElement.id == MasterObj + "txtPersonCode") {
                $get(MasterObj + "CmbPerson_txtSDate").value = ReverceDate(document.getElementById("TxtSDate").value);
                $get(MasterObj + "CmbPerson_txtEDate").value = ReverceDate(document.getElementById("TxtEDate").value);
                OnClickBtnRefreshPersonGrid();
            }
        }
    }
}

function OnClickBtnRefreshPersonGrid() {

    if (GetDateFromCal()) {
        //$get(MasterObj + "txtSubmit").value = "RefreshPersonGridSubmit";
        //$get(MasterObj + "RefreshPersonGridSubmit").click();
        RefreshPerson();
    }
}

function RefreshPerson() {
    var PersonCode, OnLineUserID, MenuItemID, CompanyID, SessionID;


    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
        PersonCode = $("#" + MasterObj + "txtPersonCode").val();
    else
        PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();

    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();

    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();



    //OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/RefreshPerson?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCode:'" + PersonCode + "' , OnLineUserID:'" + OnLineUserID + "', MenuItemID:'" + MenuItemID + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            //                    var x = 0;
            //                    var XmlPersonInfo = "", XmlGrid = "";
            //                    x = xmlSave.search("</Tb></Root>");
            //                    x = x + 12;
            //                    XmlPersonInfo = xmlSave.substring(0, x);
            //                    XmlGrid = xmlSave.substring(x, xmlSave.length);
            //                    XmlGrid = XmlGrid.replace(/_x0020_/g, "_");

            var XmlPersonInfo = xmlSave;

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(XmlPersonInfo)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {
                if (xmlNodes.item(0).selectSingleNode("PersonName") != null) {
                    $get(MasterObj + "txtPersonName").value = xmlNodes.item(0).selectSingleNode("PersonName").text;
                }
                $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "txtPersonCode").value;

                document.getElementById(MasterObj + "txtToolTipDept").value = xmlNodes.item(0).selectSingleNode("DeptTooltip").text;
                document.getElementById(MasterObj + "txtDivDept").value = xmlNodes.item(0).selectSingleNode("Dept").text;
                document.getElementById(MasterObj + "txtRoleTitle").value = xmlNodes.item(0).selectSingleNode("Role").text;
                document.getElementById(MasterObj + "txtToolTipRole").value = xmlNodes.item(0).selectSingleNode("RoleTooltip").text;
                SetDeptNameAndToolTip();
            }

            if ($get(MasterObj + "txtPersonName").value == "" && $get(MasterObj + "txtPersonCode").value != "") {
                alert("کد پرسنلي نا معتبر است")
                $get(MasterObj + "txtPersonCode").value = "";
                $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
            }
            else
                $get(MasterObj + "txtPersonName").setAttribute("PersonCode", $get(MasterObj + "txtPersonCode").value);



            // CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            //CloseModelPopup();
        }
    });
}

function OnBlurtxtPersonCode() {

    if ($get(MasterObj + "txtPersonCode").value == "" || $get(MasterObj + "txtPersonCode").value == "0") {
        $get(MasterObj + "txtPersonName").value = "";
        $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
    }
    else {
        //                $get(MasterObj + "txtSubmit").value = "RefreshPerson";
        //                $get(MasterObj + "ImgRefreshPersonSubmit").click();
        RefreshPerson();
    }
}

function findPerson(Mode) {
    //Mode=1 Next //Mode=0 previous
    var ShiftID = "", GroupID = "", DepartmentID = "", chkChildren = "", CreditNeed = "", ShowManager = "", ShowDaftarTabl = "", UserPersonID = ""
    var PersonCode
    var MenuItemID
    if (document.getElementById(MasterObj + "txtMenuItemID").value != '1302') {
        var ParentDialog = dialogArguments;
        ShiftID = ParentDialog.$get(MasterObj + "CmbShift").value
        GroupID = ParentDialog.$get(MasterObj + "cmbGroup").value
        DepartmentID = ParentDialog.$get(MasterObj + "txtDepartmentID").value
        chkChildren = ParentDialog.$get(MasterObj + "chkChildren").checked == true ? "1" : "0";
        CreditNeed = ParentDialog.$get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";
        ShowManager = ParentDialog.$get(MasterObj + "chkManager").checked == true ? "1" : "0";
        //ShowDaftarTabl = ParentDialog.$get(MasterObj + "ChkDaftarTabl").checked == true ? "1" : "0";
        ShowDaftarTabl = "0";
        if (ParentDialog.$get(MasterObj + "txtOptionCmbPerson").value != "1")
            UserPersonID = ParentDialog.$get(MasterObj + "txtPersonCode").value
        else
            UserPersonID = ParentDialog.$get(MasterObj + "cmbPerson_txtPCode").value;
    }
    ShiftID = ShiftID == "" ? "0" : ShiftID;
    GroupID = GroupID == "" ? "0" : GroupID;
    DepartmentID = DepartmentID == "" ? "0" : DepartmentID;
    chkChildren = chkChildren == "" ? "0" : chkChildren;
    CreditNeed = CreditNeed == "" ? "0" : CreditNeed;
    ShowManager = ShowManager == "" ? "0" : ShowManager;
    ShowDaftarTabl = ShowDaftarTabl == "" ? "0" : ShowDaftarTabl;
    UserPersonID = UserPersonID == "" ? "" : UserPersonID;

    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
        PersonCode = $("#" + MasterObj + "txtPersonCode").val();
    else
        PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();
    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();
    if (PersonCode != "") {
        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "MainDailyReport.aspx/FindPerson?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{PersonCode:'" + PersonCode + "',UserPersonID:'" + UserPersonID + "', Mode:'" + Mode + "' , OnLineUserID:'" + $("#" + MasterObj + "txtOnLineUser").val() + "', MenuItemID:'" + MenuItemID + "', ShiftID:'" + ShiftID + "', GroupID:'" + GroupID + "', DepartmentID:'" + DepartmentID + "', chkChildren:'" + chkChildren + "', CreditNeed:'" + CreditNeed + "', ShowManager:'" + ShowManager + "', ShowDaftarTabl:'" + ShowDaftarTabl + "', SDate:'" + $("#" + MasterObj + "SDate").val() + "', EDate:'" + $("#" + MasterObj + "EDate").val() + "' , CompanyID:'" + $("#" + MasterObj + "txtCompanyID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
            success: function (Data) {

                var xmlSave;
                if (window.ActiveXObject) {
                    xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                    xmlSave.async = 'false';
                    xmlSave.loadXML(Data.d);
                } else {
                    var parser = new DOMParser();
                    xmlSave = parser.parseFromString(Data.d, 'text/xml');
                }
                if ($(xmlSave).find("NewDataSet").find("FindPerson").length > 0) {
                    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
                        $("#" + MasterObj + "txtPersonCode").val($(xmlSave).find("NewDataSet").find("FindPerson").find("Code").text());
                        $("#" + MasterObj + "txtPersonName").val($(xmlSave).find("NewDataSet").find("FindPerson").find("Name").text());
                        $("#" + MasterObj + "txtPersonName").attr("PersonCode", $(xmlSave).find("NewDataSet").find("FindPerson").find("Code").text())
                    }
                    else {
                        $("#" + MasterObj + "CmbPerson_txtPCode").val($(xmlSave).find("NewDataSet").find("FindPerson").find("Code").text());
                        $("#" + MasterObj + "CmbPerson_txtCode").val($(xmlSave).find("NewDataSet").find("FindPerson").find("Code").text());
                        $("#" + MasterObj + "CmbPerson_txtName").val($(xmlSave).find("NewDataSet").find("FindPerson").find("Name").text());
                    }
                    OnClickBtnFilter();
                    FilterPerson = 1

                }
                else {
                    alert("پرسنل ديگری در این مرحله موجود نمی باشد")
                    CloseModelPopup();
                    FilterPerson = 0;
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("با خطا مواجه شد" + jqXHR.responseText);
                CloseModelPopup();
            }
        });
    }
    else {
        alert("هيچ شماره پرسنلی انتخاب نشده است")
    }


}

function OnClickBtnNextPerson() {
    findPerson(1)
}

function OnClickBtnPrePerson() {
    findPerson(0)
}

/*****************************PersonCode Control*******************************/

/*****************************Inputs Control Event*******************************/
function OnClickBtnFilter() {
    OnClickBtnSearch()
}

function Search() {

    var PersonCode, OnLineUserID, MenuItemID, CompanyID, SessionID, ReportID, StartDate, EndDate, CreditNeed;
    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;

    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
        PersonCode = $("#" + MasterObj + "txtPersonCode").val();
    else
        PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();

    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();

    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    ReportID = $("#" + MasterObj + "txtReportID").val();
    StartDate = $("#" + MasterObj + "SDate").val();
    EndDate = $("#" + MasterObj + "EDate").val();

    CreditNeed = $get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";

    document.getElementById(MasterObj + "txtCreditNeed").value = CreditNeed;

    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/Search?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCode:'" + PersonCode + "' , OnLineUserID:'" + OnLineUserID + "', MenuItemID:'" + MenuItemID + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' ,ReportID:'" + ReportID + "' ,SDate:'" + StartDate + "' , EDate:'" + EndDate + "' ,CreditNeed:'" + CreditNeed + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            var x = 0;
            var XmlPersonInfo = "", XmlGrid = "";
            x = xmlSave.search("</Tb></Root>");
            x = x + 12;
            XmlPersonInfo = xmlSave.substring(0, x);
            XmlGrid = xmlSave.substring(x, xmlSave.length);
            XmlGrid = XmlGrid.replace(/_x0020_/g, "_");

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(XmlPersonInfo)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {
                if (xmlNodes.item(0).selectSingleNode("PersonName") != null) {
                    $get(MasterObj + "txtPersonName").value = xmlNodes.item(0).selectSingleNode("PersonName").text;
                }
                $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "txtPersonCode").value;

                document.getElementById(MasterObj + "txtToolTipDept").value = xmlNodes.item(0).selectSingleNode("DeptTooltip").text;
                document.getElementById(MasterObj + "txtDivDept").value = xmlNodes.item(0).selectSingleNode("Dept").text;
                document.getElementById(MasterObj + "txtRoleTitle").value = xmlNodes.item(0).selectSingleNode("Role").text;
                document.getElementById(MasterObj + "txtToolTipRole").value = xmlNodes.item(0).selectSingleNode("RoleTooltip").text;
                SetDeptNameAndToolTip();
            }


            BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, StartDate, revStartDate, EndDate, revEndDate, CompanyID, SessionID, OnLineUserID, "", "IsSum;1", OnClickGrd, arrGridEvent, 1, true);

            if (FilterPerson == 1) {

                FilterPerson = 0;
            }

            LastSelectedGridRow = null;

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}

function OnClickBtnSearch() {
    if (GetDateFromCal()) {
        if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
            $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "CmbPerson_txtCode").value;
            $get(MasterObj + "txtPName").value = $get(MasterObj + "CmbPerson_txtName").value;
            //                    $get(MasterObj + "txtSubmit").value = "Show"
            //                    $get(MasterObj + "BtnSubmit").click()
            Search();
        }
        else if ($get(MasterObj + "txtPersonName").value != "" && $get(MasterObj + "txtPersonName").getAttribute("PersonCode") != "") {
            $get(MasterObj + "txtPersonCodeSearch").value = $get(MasterObj + "txtPersonName").getAttribute("PersonCode");
            $get(MasterObj + "txtPName").value = $get(MasterObj + "txtPersonName").value;
            //                    $get(MasterObj + "txtSubmit").value = "Show"
            //                    $get(MasterObj + "BtnSubmit").click()
            Search();
        }
        else
            alert("لطفا پرسنلي مورد نظر را وارد نماييد");
    }

}

function OnClickbtnCodeLimit() {
    var strUrl = "/TAPresentation/App_Pages/DataEntry/DefineLimitOnCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    strUrl = encodeURI(strUrl)
    window.showModalDialog(strUrl, '', 'dialogHeight: 770px;dialogWidth:800px;center: Yes;help: no;status: no')
}

function OnClickBtnCalc() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    if (LastSelectedGridRow != null) {
        document.getElementById(MasterObj + "txtRowDate").value = LastSelectedGridRow.getAttribute('Rdate')
    }
    if (keyCode == 16) { // =>  را گرفته براي همه محاسبه کن shift اگر کليد
        document.getElementById(MasterObj + "txtRowDate").value = ""
    }
    if (PersonCode != "") {
        document.getElementById(MasterObj + "txtPersonCodeSearch").value = PersonCode
        //                document.getElementById(MasterObj + "txtSubmit").value = "Calc";
        //                document.getElementById(MasterObj + "BtnSubmit").click();
        Calc();
    }
    else
        alert("لطفا پرسنلي مورد نظر را وارد نماييد");
}

function Calc() {
    var PersonCodeSearch, OnLineUserID, MenuItemID, CompanyID, SessionID, ReportID, StartDate, EndDate, CreditNeed;
    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;

    PersonCodeSearch = $("#" + MasterObj + "txtPersonCodeSearch").val();

    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();

    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    ReportID = $("#" + MasterObj + "txtReportID").val();
    StartDate = $("#" + MasterObj + "SDate").val();
    EndDate = $("#" + MasterObj + "EDate").val();
    var ParentDialog = dialogArguments;
    CreditNeed = ParentDialog.$get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";

    document.getElementById(MasterObj + "txtCreditNeed").value = CreditNeed;

    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/Calc?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCodeSearch:'" + PersonCodeSearch + "' , OnLineUserID:'" + OnLineUserID + "', MenuItemID:'" + MenuItemID + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' ,ReportID:'" + ReportID + "' ,SDate:'" + StartDate + "' , EDate:'" + EndDate + "' ,CreditNeed:'" + CreditNeed + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            var x = 0;
            var XmlCalcResult = "", XmlGrid = "";
            x = xmlSave.search("</Tb></Root>");
            x = x + 12;
            XmlCalcResult = xmlSave.substring(0, x);
            XmlGrid = xmlSave.substring(x, xmlSave.length);
            XmlGrid = XmlGrid.replace(/_x0020_/g, "_");


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(XmlCalcResult)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {
                if (xmlNodes.item(0).selectSingleNode("ValidateCalc") != null) {
                    $get(MasterObj + "txtValidateCalc").value = xmlNodes.item(0).selectSingleNode("ValidateCalc").text;
                }
                if (xmlNodes.item(0).selectSingleNode("Alert") != null) {
                    $get(MasterObj + "txtAlert").value = xmlNodes.item(0).selectSingleNode("Alert").text;
                }

            }


            BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, StartDate, revStartDate, EndDate, revEndDate, CompanyID, SessionID, OnLineUserID, "", "IsSum;1", OnClickGrd, arrGridEvent, 1, true);
            if ($get(MasterObj + "txtValidateCalc").value == "1" || $get(MasterObj + "txtValidateCalc").value == "True")
                SetMsg($get(MasterObj + "txtAlert").value)
            else
                alert($get(MasterObj + "txtAlert").value)

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}

function OnClickbtnCardtable() {
    var resource = ""
    if ($get(MasterObj + "txtNewWFO").value == "1") {
        if ($get(MasterObj + "txtShowWorkCartable").value == "1")
            resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/ShowCartable.aspx";
        else
            resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/CartableNew.aspx";
    }
    else
        resource = "../DataEntry/CreditManagement.aspx";
    //-------------------------------------------------------------------------------------

    SD = ReverceDate(document.getElementById("TxtSDate").value);
    ED = ReverceDate(document.getElementById("TxtSDate").value);
    url = resource + "?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                    + "&SDate=" + encode64(SD)
                    + "&EDate=" + encode64(ED)
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&Creator= "
                    + "&Flag=1"
                    + "&HashFlag=1";

    var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
    window.showModalDialog(url, window, winPro)
}

function OnClickbtnCalendar() {
    var Day = "", PersonCode = "";
    if (LastSelectedGridRow != "" && LastSelectedGridRow != null) {

        Day = LastSelectedGridRow.cells(1).innerText;

        if (Day.length == 8) {
            Day = "13" + Day.substr(6, 2) + "/" + Day.substr(3, 2) + "/" + Day.substr(0, 2);
        }
        else {
            Day = Day.substr(6, 4) + "/" + Day.substr(3, 2) + "/" + Day.substr(0, 2);
        }

    }



    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")

    if (PersonCode != "") {
        var url = "/Ta/TAPeresentation/Pages/SpecialCal/SpecialCal.aspx?GroupId=0&PersonId=" + PersonCode + "&P=1" + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&FocusDay=" + Day;
        window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 1000px;center: Yes;help: no;status: no")
    }
    else
        alert("لطفا پرسنلي مورد نظر را وارد نماييد");
}

function OnClickbtnDefineGroup() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    var url = "/TAPresentation/App_Pages/Schedule/DefineGroup.aspx?PersonId="
            + PersonCode
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&PersonCode=" + encode64(PersonCode)
            + "&HashFlag=1"
    var returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 1000px;center: Yes;help: no;status: no")
}

function OnClickBtnRegCredit() {

    try {
        var Date = ''
        var PersonCode = "", PersonName = "";
        if (LastSelectedGridRow != null) {
            Date = LastSelectedGridRow.cells(1).innerText
            if (Date.length == 8) {
                Date = '13' + Date.substring(6, 10) + "/" + Date.substring(3, 5) + "/" + Date.substring(0, 2)
            }
            else {
                Date = Date.substring(6, 10) + "/" + Date.substring(3, 5) + "/" + Date.substring(0, 2)
            }
        }

        if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
            PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
            PersonName = $get(MasterObj + "CmbPerson_txtName").value
        }
        else if ($get(MasterObj + "txtPersonName").value != "") {
            PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
            PersonName = $get(MasterObj + "txtPersonName").value;
        }
        if (Date == '')
            Date = Date;
        else
            Date = encode64(Date);
        var url = "../DataEntry/RegisterCredit.aspx?SessionID="
        + document.getElementById(MasterObj + "txtSessionID").value
        + "&PCode=" + encode64(PersonCode)
        + "&SDate=" + Date
        + "&EDate=" + Date
        + "&Name=" + PersonName + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
        + "&MonthlyPage=1"
        + "&HashFlag=1"
        var returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no")


    } catch (ex) { }
}

function OnClickbtnDefinitionDayStructure() {
    url = "/TAPresentation/App_Pages/Schedule/DefinitionDayStructure.aspx?ModalFlag=1" + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 550px;dialogWidth: 800px;center: Yes;help: no;status: no")
}

function OnClickbtnDefineٌWorkTimes() {
    var url = "/Ta/TAPeresentation/Pages/BaseInfo/DefineWorkTimes.aspx?flag=11" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    var returnValue = window.showModalDialog(url, window, "dialogHeight: 750px;dialogWidth: 1000px;center: Yes;help: no;status: no")
}

function OnClickbtnReplaceChanges() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    url = "/Ta/TAPeresentation/Pages/BaseInfo/RplaceChanges.aspx?flag=11" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&PersonID=" + PersonCode
                + "&PersonCode=" + PersonCode
    returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 900px;center: Yes;help: no;status: no")
}

function OnClickBtnCreditInfo() {
    var resource, url, PersonCode = "", winPro, SD, ED, PersonName = "";
    if (document.getElementById(MasterObj + "txtShowDocInfoNew").value == "1")
        resource = "DocInfoNew.aspx";
    else
        resource = "DocInfo.aspx";
    var winPro = "dialogHeight: 550px;dialogWidth: 900px;Bottom:0pX;center: No;help: no;resizable:1;status: no;minimize: yes;"

    if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        PersonName = $get(MasterObj + "CmbPerson_txtName").value
    }
    else if ($get(MasterObj + "txtPersonName").value != "") {
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        PersonName = $get(MasterObj + "txtPersonName").value;
    }

    if (LastSelectedGridRow != null) {
        SD = LastSelectedGridRow.getAttribute('Rdate')
        url = resource
               + "?PersonCode=" + encode64(PersonCode)
               + "&SD=" + SD + "&ED=" + SD
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&PageMode=1&GrdHeight=80px"
               + "&PersonName=" + PersonName
               + "&SDate=" + encode64(SD) + "&EDate=" + encode64(SD)

               + "&ModeDaily=1"
               + "&HashFlag=1";
    }
    else {
        SD = ReverceDate(document.getElementById("TxtSDate").value);
        ED = ReverceDate(document.getElementById("TxtEDate").value);

        url = resource
               + "?PersonCode=" + PersonCode
               + "&SD=" + SD + "&ED=" + ED
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&PageMode=1&GrdHeight=100px"
               + "&PersonName=" + PersonName
               + "&SDate=" + SD + "&EDate=" + ED

               + "&ModeDaily=1";
    }
    CreditState = 1
    if (PersonCode != "")
        CreditInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
    else
        alert("لطفا پرسنلی مورد نظر را وارد نماييد");
}

function OnClickBtnCardexInfo() {

    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    var url2 = "../Cardex/CardexReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&PersonCode=" + encode64(PersonCode)
               + "&wpid=" + document.getElementById(MasterObj + "txtWorkPeriodID").value
               + "&HashFlag=1";
    var winPro = "dialogHeight:600px;dialogWidth:900px;center: Yes;help: no;status: no"
    var CardexInfoDialogObj = window.showModalDialog(encodeURI(url2), window, winPro)
}

function OnClickBtnLinkOk() {
    if (DayContinuationRow != null) {
        var PersonCode = "";
        if ($get(MasterObj + "CmbPerson_txtCode").value != "")
            PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        else if ($get(MasterObj + "txtPersonName").value != "")
            PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        document.getElementById(MasterObj + "txtRDate").value = DayContinuationRow.getAttribute('Rdate')
        $get(MasterObj + "txtPersonCodeSearch").value = PersonCode
        //                $get(MasterObj + "txtSubmit").value = "DayContinuation"
        //                $get(MasterObj + "BtnSubmit3").click()
        DayContinuation();
    }
}

function DayContinuation() {
    var PersonCodeSearch, CompanyID, SessionID, RDate, FlagDayContinuation;


    PersonCodeSearch = $("#" + MasterObj + "txtPersonCodeSearch").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    RDate = $("#" + MasterObj + "txtRDate").val();
    FlagDayContinuation = $("#" + MasterObj + "txtFlagDayContinuation").val();


    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/ModifyDayContinuation?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCodeSearch:'" + PersonCodeSearch + "' , RDate:'" + RDate + "', FlagDayContinuation:'" + FlagDayContinuation + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(xmlSave)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {
                if (xmlNodes.item(0).selectSingleNode("AlertDayContinuation") != null) {
                    $get(MasterObj + "txtAlertDayContinuation").value = xmlNodes.item(0).selectSingleNode("AlertDayContinuation").text;
                }
                if (xmlNodes.item(0).selectSingleNode("Validate") != null) {
                    $get(MasterObj + "txtValidate").value = xmlNodes.item(0).selectSingleNode("Validate").text;
                }
                if (xmlNodes.item(0).selectSingleNode("Status") != null) {
                    $get(MasterObj + "txtStatus").value = xmlNodes.item(0).selectSingleNode("Status").text;
                }

            }

            OnClickBtnSearch();

            if ($get(MasterObj + "txtValidate").value != "0") {
                if ($get(MasterObj + "txtFlagDayContinuation").value == 0) //ذخيره
                {
                    switch ($get(MasterObj + "txtStatus").value) {
                        case "203": //تائيد شده
                            DayContinuationRow.cells(2).className = "CssOKDayContinuation"
                            break
                        default:
                            DayContinuationRow.cells(2).className = "CssDayContinuation"
                    }
                }
                else    //حذف
                    DayContinuationRow.cells(2).className = DayContinuationRow.cells(1).className

                if ($get(MasterObj + "txtFlagDayContinuation").value == 1) {
                    Grid.rows(DayContinuationRow.rowIndex).setAttribute('DayContinuation', 0)
                }
                else if ($get(MasterObj + "txtFlagDayContinuation").value == 0) {
                    Grid.rows(DayContinuationRow.rowIndex).setAttribute('DayContinuation', 1)
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1") {
                SetMsg($get(MasterObj + "txtAlertDayContinuation").value)
            }
            else {
                alert($get(MasterObj + "txtAlertDayContinuation").value)
            }
            $get(MasterObj + "txtAlertDayContinuation").value = ""
            document.getElementById("LinkDiv").style.display = "none"
            if (LastSelectedGridRow != null) {
                for (var i = 0; i < LastSelectedGridRow.cells.cellIndex; ++i) {
                    LastSelectedGridRow.cells[i].style.backgroundColor = "#FFD599";
                }
            }



            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}
function OnClickBtnLinkCancel() {
    DayContinuationRow = null
    document.getElementById("LinkDiv").style.display = "none"
}

function OnClickBtnWPResult() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")

    var url = "WPResult.aspx?WorkPeriodID=" + document.getElementById(MasterObj + "txtWorkPeriodID_Decode").value
                                                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                                                + "&PersonCode=" + PersonCode;
    window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 1180px;center: Yes;help: no;status: no");
}

function OnClickBtnDailyResult() {
    if (LastSelectedGridRow != "" && LastSelectedGridRow != null) {
        var PersonCode = "";
        if ($get(MasterObj + "CmbPerson_txtCode").value != "")
            PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        else if ($get(MasterObj + "txtPersonName").value != "")
            PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        var SDate = LastSelectedGridRow.cells(1).innerText.trim();
        if (SDate.length == 8) {
            SDate = "13" + SDate.substr(6, 2) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2)
        }
        else {
            SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2);
        }

        var url = "DailyResult.aspx?SDate=" + SDate + "&EDate=" + SDate
        + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonCode=" + PersonCode
        window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 1180px;center: Yes;help: no;status: no");
    }
    else
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
}
function OnClickBtnCodeReport() {
    var url = "../BaseInfo/DetailCodeReport.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value;
    window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;help: no;resizable:1;status: no;");

}

function OnClickBtnRequestIO() {
    if (LastSelectedGridRow != null && LastSelectedGridRow != "") {
        var PersonCode = "";
        if ($get(MasterObj + "CmbPerson_txtCode").value != "")
            PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        else if ($get(MasterObj + "txtPersonName").value != "")
            PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        var SDate = LastSelectedGridRow.cells(1).innerText.trim();
        if (SDate.length == 8) {
            SDate = "13" + SDate.substr(6, 2) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2);
        }
        else {
            SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2);
        }

        var url = "../DataEntry/RegisterGooing.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&PersonCode=" + encode64(PersonCode) + "&Date=" + SDate + "&HashFlag=1";
        window.showModalDialog(encodeURI(url), window, "dialogHeight:300px;dialogWidth:630px;center: Yes;help: no;status: no")
    }
    else alert('لطفا يک سطر از گريد را انتخاب کنيد')
}

function OnClickBtnInOut() {
    onClickInOutImg()
}
function onClickInOutImg() {
    if (LastSelectedGridRow == null) {
        alert('لطفا يک سطر از گريد انتخاب کنيد')
        return
    }
    var oRow = window.event.srcElement.parentElement, PersonCode = "";
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement
    oRow = oRow.parentElement
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    var DayDate = oRow.getAttribute("Rdate")
    var SDate = document.getElementById("TxtSDate").value.substr(0, 10)
    SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2)
    var EDate = document.getElementById("TxtEDate").value.substr(0, 10)
    EDate = EDate.substr(6, 4) + "/" + EDate.substr(3, 2) + "/" + EDate.substr(0, 2)
    var url = "../DataEntry/Admin/GoingManage.aspx?PersonID=" + PersonCode + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + SDate + "&EDate=" + EDate
    window.showModalDialog(url, window, "dialogHeight: 620px;dialogWidth: 1000px;center: Yes;help: no;status: no")
}

function OnClickBtnReplaceShift() {
    var url = "../DataEntry/SchedulingProg.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModelessDialog(encodeURI(url), window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no;resizable=1;minimize: yes")
}

function OnClickBtnRequestDuty() {
    try {
        var Date = '', PersonCode = "", PersonName = "";
        if (LastSelectedGridRow != null) {
            Date = LastSelectedGridRow.cells(1).innerText
            Date = Date.substring(6, 10) + "/" + Date.substring(3, 5) + "/" + Date.substring(0, 2)
        }
        if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
            PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
            PersonName = $get(MasterObj + "CmbPerson_txtName").value
        }
        else if ($get(MasterObj + "txtPersonName").value != "") {
            PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
            PersonName = $get(MasterObj + "txtPersonName").value
        }
        if (Date == '')
            Date = Date;
        else
            Date = encode64(Date);
        var url = "DefineDutyCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        + "&PCode=" + encode64(PersonCode) + "&SDate=" + Date + "&EDate=" + Date
        + "&Name=" + PersonName + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
        + "&MonthlyPage=1"
        + "&HashFlag=1";
        var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
        returnValue = window.showModalDialog(encodeURI(url), window, DialogProperty);
    } catch (ex) { }
}

function OnClickBtnScheduleChange() {
    var url = "../DataEntry/ShiftRequest.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    var DialogProperty = "dialogHeight:300px;dialogWidth:650px;center: Yes;help: no;status: no;resizable=1"
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
}

function onClickbtnRefreshPerson(obj) {
    var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value + "&MenuItemID=" + $get(MasterObj + "txtPageID").value;
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

function OnClickBtnLoadReport() {
    var url = "/../../frmPresentation/App_Pages/FormGenerator/DailyReportDesign.aspx?Mode=Design"
        + "&PageID=1302"
        + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCodeSearch").value
        + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        + "&EDate=" + document.getElementById(MasterObj + "EDate").value
        + "&CreditNeed=" + document.getElementById(MasterObj + "txtCreditNeed").value
        + "&OnlineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value
        + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtCompanyID").value
        + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    var DialogProperty = "dialogHeight:700px;dialogWidth:1100px;center: Yes;help: no;status: no;resizable=1"
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
}

function OnClickBtnViewReport() {
    var url = "/../../frmPresentation/App_Pages/FormGenerator/DailyReportDesign.aspx?Mode=View"
        + "&PageID=1302"
        + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCodeSearch").value
        + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        + "&EDate=" + document.getElementById(MasterObj + "EDate").value
        + "&CreditNeed=" + document.getElementById(MasterObj + "txtCreditNeed").value
        + "&OnlineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value
        + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtCompanyID").value
        + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    var DialogProperty = "dialogHeight:700px;dialogWidth:1100px;center: Yes;help: no;status: no;resizable=1"
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);

}

function OnClickBtnDayContinuation() {
    var url = "../DataEntry/RequestDayContinuation.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

function OnClickBtnMonthly() {
    if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        PersonName = $get(MasterObj + "CmbPerson_txtName").value
    }
    else if ($get(MasterObj + "txtPersonName").value != "") {
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        PersonName = $get(MasterObj + "txtPersonName").value;
    }
    var url = "../DataEntry/RequestMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

function OnClickBtnChangeStructure() {
    if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        PersonName = $get(MasterObj + "CmbPerson_txtName").value
    }
    else if ($get(MasterObj + "txtPersonName").value != "") {
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        PersonName = $get(MasterObj + "txtPersonName").value;
    }
    var url = "../DataEntry/RegisterChangeStructure.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

function OnClickBtnDailyItem() {
    if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
        PersonName = $get(MasterObj + "CmbPerson_txtName").value
    }
    else if ($get(MasterObj + "txtPersonName").value != "") {
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
        PersonName = $get(MasterObj + "txtPersonName").value;
    }
    var url = "../DataEntry/RequestDailyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

function OnClickBtnRepeatMonthlyItem() {
    var url = "../DataEntry/RequestRepeatMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

function OnClickBtnTolerance() {
    var Url = "../Schedule/Tolerance.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:500px;dialogWidth:730px;center: Yes;help: no;status: no")
}

function OnClickBtnRegisterCredit() {
    var Url = "../DataEntry/Admin/AdminCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no")
}

function OnClickBtnRegisterCreditNew() {
    var Url = "../DataEntry/Admin/AdminCreditNew.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no")
}

function OnClickBtnDashbordPersoneli() {
    var Date;
    var PersonCode;
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode");
    if (LastSelectedGridRow != null && LastSelectedGridRow != "") {
        Date = LastSelectedGridRow.cells(1).innerText
        Date = Date.substring(6, 10) + "/" + Date.substring(3, 5) + "/" + Date.substring(0, 2)
    }
    else {
        //Date = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
        Date = ReverceDate(document.getElementById("TxtSDate").value);
    }
    var url = "/FrmPresentation/App_Pages/BaseInfo/personelDashboard.aspx"
               + "?SessionID=" + $get(MasterObj + "txtSessionID").value
               + "&PersonCode=" + encode64(PersonCode)
               + "&Date=" + encode64(Date)
               + "&HashFlag=1";
    var winPro = "dialogHeight:600px;dialogWidth:900px;center: Yes;help: no;status: no"
    window.showModalDialog(encodeURI(url), window, winPro)
}

function OnClickBtnCalculateTrace() {
    var PersonCode = "";
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")

    if (LastSelectedGridRow == null) {
        alert('لطفا يک سطر ازگريد انتخاب کنيد');
        return;
    }
    else {
        var url = "/TAPresentation/App_Pages/SystemTrace/CalculateTrace.aspx?PersonCode=" + PersonCode
               + "&Date=" + document.getElementById(MasterObj + "SDate").value
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value; ;

        var winPro = "dialogWidth:1300px;dialogHeight:800px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        DailyInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro);
    }
}

/*****************************Inputs Control Event*******************************/

/*****************************Grid Control Event*******************************/
function OnClickGrd() {

    if (CreditState == 1)
        RefreshCreditInfoPage()
}

function OnContextMenuDOW() {

    if ($get(MasterObj + "txtDayContinuation").value == "1") {
        document.getElementById("LinkDiv").style.display = "none";
        DayContinuationRow = window.event.srcElement.parentElement
        while (DayContinuationRow.tagName != 'TR')
            DayContinuationRow = DayContinuationRow.parentElement
        var NewObj = window.event.srcElement;
        while (NewObj.tagName != 'TR') {
            NewObj = NewObj.parentElement
        }
        NewObj = NewObj.parentElement
        while (NewObj.tagName != 'TR') {
            NewObj = NewObj.parentElement
        }
        var posX = NewObj.offsetLeft
        var posY = NewObj.offsetTop
        while (NewObj.offsetParent) {
            posX = posX + NewObj.offsetParent.offsetLeft
            posY = posY + NewObj.offsetParent.offsetTop
            if (NewObj == document.getElementsByTagName('body')[0]) { break }
            else { NewObj = NewObj.offsetParent }
        }
        document.getElementById("LinkDiv").style.top = posY + 260
        document.getElementById("LinkDiv").style.left = posX + 350
        if (DayContinuationRow.getAttribute('DayContinuation') == "True" || DayContinuationRow.getAttribute('DayContinuation') == 1 || DayContinuationRow.getAttribute('DayContinuation') == 2) {
            document.getElementById("TDDayContinuation").innerHTML = ' آيا مايل به حذف مداومت کاري برای تاريخ ' + DayContinuationRow.cells(1).innerText + ' هستيد؟ '
            $get(MasterObj + "txtFlagDayContinuation").value = 1//Delete
        }
        else {
            document.getElementById("TDDayContinuation").innerHTML = ' آيا مايل به ذخيره مداومت کاري برای تاريخ ' + DayContinuationRow.cells(1).innerText + ' هستيد؟ '
            $get(MasterObj + "txtFlagDayContinuation").value = 0//Save
        }
        document.getElementById("LinkDiv").style.display = "inline"
        return false
    }
}

function Grid_RowDataBound(oGrid) {

    var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
    var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
    var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];

    Header.rows[0].cells[6].style.backgroundColor = "#ffdfe7";
    Header.rows[0].cells[9].style.backgroundColor = "#ffdfe7";

    for (var i = 0; i < Body.rows.length; ++i) {
        Body.rows[i].cells[3].style.overflow = "visible";

        if (Body.rows[i].UnCompletCard == 1) {
            Body.rows[i].cells[3].style.backgroundColor = "#FEF8ED";
            Body.rows[i].cells[3].title = "لازم وارد کردن کارت ناقصي";
        }

        if (Body.rows[i].DayContinuation == 1 || Body.rows[i].DayContinuation == "True") {
            Body.rows[i].cells[2].style.backgroundColor = "#FFFFB7";
        }
        else if (Body.rows[i].DayContinuation == 2) {
            Body.rows[i].cells[2].style.backgroundColor = "#37FF78";
        }

        if (Body.rows[i].Friday == 1) {
            if (Body.rows[i].HolidayDescr != undefined) {
                Body.rows[i].title = Body.rows[i].HolidayDescr;
            }
            for (var j = 0; j < Body.rows[i].cells.length; ++j) {
                Body.rows[i].cells[j].style.backgroundColor = "lightgrey";

            }
        }

        if (Body.rows[i].HolidayFlag == 1) {
            if (Body.rows[i].HolidayDescr != undefined) {
                Body.rows[i].title = Body.rows[i].HolidayDescr;
            }
            for (var j = 0; j < Body.rows[i].cells.length; ++j) {
                Body.rows[i].cells[j].style.backgroundColor = "lightgrey";

            }
        }



        if (Body.rows[i].ovflag == 1) {
            Body.rows[i].cells[6].firstChild.style.color = "#ff33ff";
        }
        else if (Body.rows[i].ovflag == 2) {
            Body.rows[i].cells[6].firstChild.style.color = "#009900";
        }
        else if (Body.rows[i].ovflag == 0) {
            Body.rows[i].cells[6].firstChild.style.color = "#FF3300";
        }

        if (Body.rows[i].OvToolTip != undefined) {
            Body.rows[i].cells[6].title = Body.rows[i].OvToolTip;
        }

        if ($get(MasterObj + "txtLMazadKar").value == 2) {
            var MazadKar = Body.rows[i].cells[6].innerText;
            Body.rows[i].cells[6].innerHTML = MazadKar;
        }



        if (Body.rows[i].kasrflag == 1) {
            Body.rows[i].cells[9].firstChild.style.color = "#ff33ff";
        }
        else if (Body.rows[i].kasrflag == 2) {
            Body.rows[i].cells[9].firstChild.style.color = "#009900";
        }
        else if (Body.rows[i].kasrflag == 0) {
            Body.rows[i].cells[9].firstChild.style.color = "#FF3300";
        }

        if (Body.rows[i].KasrToolTip != undefined) {
            Body.rows[i].cells[9].title = Body.rows[i].KasrToolTip;
        }

        if ($get(MasterObj + "txtLkasrkar").value == 2) {
            var KasrKar = Body.rows[i].cells[9].innerText;
            Body.rows[i].cells[9].innerHTML = KasrKar;
        }

        for (var h = 0; h < Header.rows[0].cells.length; ++h) {
            switch (Header.rows[0].cells[h].ColName) {
                case "SNobatKari":
                    Body.rows[i].cells[h].title = Body.rows[i].Shift;
                    break;
                case "DOW":
                    if ($get(MasterObj + "txtLDow").value == 2) {
                        Body.rows[i].cells[h].onclick = "";
                        Body.rows[i].cells[h].style.color = "";
                        Body.rows[i].cells[h].style.textDecoration = "none";
                    }
                    break;
                case "structure":
                    if (Body.rows[i].ScheduleChange == 1 || Body.rows[i].ScheduleChange == "True") {
                        Body.rows[i].cells[h].style.backgroundColor = "#812ba6";
                    }

                    switch (Body.rows[i].ShiftChanges) {
                        case 1:
                            Body.rows[i].cells[h].style.backgroundColor = "#de0db1";
                            break;
                        case 2:
                            Body.rows[i].cells[h].style.backgroundColor = "#de860d";
                            break;
                        case 3:
                            Body.rows[i].cells[h].style.backgroundColor = "#f1fe3e";
                            break;
                        case 4:
                            Body.rows[i].cells[h].style.backgroundColor = "#0dde24";
                            break;
                    }
                    break;
                case "كل_حضور":
                    if (Body.rows[i].StrTooltip != undefined)
                        Body.rows[i].cells[h].title = Body.rows[i].StrTooltip;
                    break;
                case "InOut":

                    break;
            }
        }

        if ($get(MasterObj + "txtLMazadKar").value == 2) {
            Body.rows[i].cells[6].onclick = "";
            Body.rows[i].cells[6].style.color = "";
            Body.rows[i].cells[6].style.textDecoration = "none";
            Body.rows[i].cells[6].style.cursor = "none";
        }

        if ($get(MasterObj + "txtLkasrkar").value == 2) {
            Body.rows[i].cells[9].onclick = "";
            Body.rows[i].cells[9].style.color = "";
            Body.rows[i].cells[9].style.textDecoration = "none";
            Body.rows[i].cells[9].style.cursor = "none";
        }
    }


    if (Grid)
        len = Grid.rows.length
    else
        return


    var InOutShowCount = 20, cell = 0, p = new String, x = 0, Cnt = 0, h = 0, S, Complete, C
            , InOutType, TempInOutComplet, ColorInOut = '', color = '', subTitle = '', P = 0, IOType
            , tmpStr, crn, CardReaderNo, CardReaderName, subStr = "", InOutComplet = "", InOut = ""
            , UnCompletCard = 0, InoutTitle = "", vIOType;
    for (var i = 0; i < len - 1; ++i) {
        Grid.cellpadding = "0"
        Grid.cellspacing = "0"
        Grid.rows(i).style.margin = 0

        InOutComplet = Grid.rows(i).InOutComplete
        UnCompletCard = Grid.rows(i).UnCompletCard
        InOut = Grid.rows(i).cells(3).innerText
        TempInOutComplet = InOutComplet
        Cnt = 0


        if (InOutComplet != "" && InOutComplet != undefined) {
            Cnt = parseInt(getCntChar(';', InOutComplet) + 1)
            h = 0
            S = ""
            Complete = ""
            C = 0
            InOutType = 0
            TempInOutComplet = InOutComplet
            ColorInOut = ''
            color = ''
            subTitle = ''
            P = 0
            IOType = 0
            tmpStr = ""
            crn = 0
            CardReaderNo = 0
            CardReaderName = ""
            subStr = ""
            vIOType = '';

            for (; h < parseInt(InOutShowCount); ++h) {
                S = TempInOutComplet.search(';')

                if (S == '-1')
                    S = TempInOutComplet.length
                Complete = TempInOutComplet.substring(0, S)
                C = Complete.search(',')
                if (C == '-1')
                    C = Complete.length
                InOutType = Complete.substring(0, C)
                tmpStr = Complete.substring(parseInt(C) + 1, Complete.length)

                crn = tmpStr.search('/')
                CardReaderNo = tmpStr.substring(parseInt(crn) + 1, tmpStr.lenght)
                CardReaderName = "کارتخوان" + CardReaderNo

                if (tmpStr != "--:--" && tmpStr != "") {
                    P = tmpStr.search('#')
                    IOType = tmpStr.substring(parseInt(P) + 1, tmpStr.lenght)
                    tmpStr = tmpStr.substring(0, P)
                }

                if (tmpStr != "") {
                    if (parseInt(InOutType) == 1) {
                        vIOType = IOType.split('/')
                        if (parseInt(vIOType[1]) == 1) {
                            IOType = ""
                            //                            color = '#009900'   //سبز
                            color = "InColor";
                            CardReaderNo = vIOType[0]
                            CardReaderName = "کارتخوان" + CardReaderNo
                            subTitle = CardReaderName
                        }
                        else if (parseInt(vIOType[1]) == 2) {
                            //                            color = '#660066'   //قرمز
                            color = "OutColor";
                            CardReaderNo = vIOType[0]
                            CardReaderName = "کارتخوان" + CardReaderNo
                            subTitle = CardReaderName
                        }
                    }
                    if (parseInt(InOutType) == 2) {
                        if (tmpStr.split('#')[0] != "--:--" && CardReaderNo.toString().trim() != "0") {
                            //                              color = '#ff33ff'//صورتی
                            color = "ManagerColor";
                            subTitle = 'مدير سيستم'
                        }
                        else
                            subTitle = "";
                    }
                    if (parseInt(InOutType) == 3) {
                        //color = '#FF9933'   //
                        color = "UserColor";
                        subTitle = 'کاربر'
                    }

                    if (InOut.length >= 5)
                        ColorInOut += "&nbsp;&nbsp;<SPAN Width='50px' title='" + subTitle + "' ><font size='2px' class='" + color + "'> " + tmpStr + "</font></SPAN> ";
                    else
                        ColorInOut += "&nbsp;&nbsp;<SPAN Width='50px' title='" + subTitle + "' ><font size='2px' class='" + color + "'> " + tmpStr + "</font></SPAN> ";
                }
                TempInOutComplet = TempInOutComplet.substring(parseInt(S) + 1, TempInOutComplet.length)
            }

            var Str = ""



            if (Grid.rows(i).SInOut != undefined && ReplaceAll(Grid.rows(i).SInOut.trim(), " ", "") == ReplaceAll(InOut.trim(), " ", "")) {

                Str = "<DIV width='100%' title='" + InOut + "'>" + ColorInOut + "</Div>"
            }
            else {

                Str = "<DIV  width='100%' title='" + Grid.rows(i).SInOut + "'>" + ColorInOut + "<font size='2px' class='" + color + "'>...</font></Div>"
            }


            Grid.rows(i).cells(3).innerHTML = Str
        }

    }

}

function BtnSendToExcel_OnClick() {

    var PersonCode, OnLineUserID, MenuItemID, CompanyID, SessionID, ReportID, StartDate, EndDate, CreditNeed;
    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;

    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
        PersonCode = $("#" + MasterObj + "txtPersonCode").val();
    else
        PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();

    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();

    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    ReportID = $("#" + MasterObj + "txtReportID").val();
    StartDate = $("#" + MasterObj + "SDate").val();
    EndDate = $("#" + MasterObj + "EDate").val();
    var ParentDialog = dialogArguments;
    CreditNeed = ParentDialog.$get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";

    document.getElementById(MasterObj + "txtCreditNeed").value = CreditNeed;

    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/SendExcel?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCode:'" + PersonCode + "' , OnLineUserID:'" + OnLineUserID + "', MenuItemID:'" + MenuItemID + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' ,ReportID:'" + ReportID + "' ,SDate:'" + StartDate + "' , EDate:'" + EndDate + "' ,CreditNeed:'" + CreditNeed + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/ExcelReport/RptGetPersonelDailyReport.xls");
            }


            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });


}

function BtnSendToPDF_OnClick() {

    var PersonCode, OnLineUserID, MenuItemID, CompanyID, SessionID, ReportID, StartDate, EndDate, CreditNeed;
    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;

    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
        PersonCode = $("#" + MasterObj + "txtPersonCode").val();
    else
        PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();

    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();

    if ($("#" + MasterObj + "txtMenuItemID").val() != "1302")
        MenuItemID = "1306"
    else
        MenuItemID = $("#" + MasterObj + "txtMenuItemID").val();

    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    ReportID = $("#" + MasterObj + "txtReportID").val();
    StartDate = $("#" + MasterObj + "SDate").val();
    EndDate = $("#" + MasterObj + "EDate").val();
    var ParentDialog = dialogArguments;
    CreditNeed = ParentDialog.$get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";

    document.getElementById(MasterObj + "txtCreditNeed").value = CreditNeed;

    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/SendPDF?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCode:'" + PersonCode + "' , OnLineUserID:'" + OnLineUserID + "', MenuItemID:'" + MenuItemID + "' , CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "' ,ReportID:'" + ReportID + "' ,SDate:'" + StartDate + "' , EDate:'" + EndDate + "' ,CreditNeed:'" + CreditNeed + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/PDFReport/RptGetPersonelDailyReport.pdf");
            }


            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}



/*****************************Grid Control Event*******************************/

/****************************Other*******************************/
function RefreshCreditInfoPage() {
    try {

        if (CreditInfoDialogObj) {

            var PersonCode = "", PersonName = "";
            if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
                PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
                PersonName = $get(MasterObj + "CmbPerson_txtName").value;
            }
            else if ($get(MasterObj + "txtPersonName").value != "") {
                PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
                PersonName = $get(MasterObj + "txtPersonName").value;
            }
            if ($get(MasterObj + "txtNewWFO").value == "1") {
                CreditInfoDialogObj.document.getElementById(MasterObj + "txtDocMemberCode").value = LastSelectedGridRow.cells(1).innerText
                var sDate = LastSelectedGridRow.getAttribute('Rdate')
                var eDate = LastSelectedGridRow.getAttribute('Rdate')
                var rsDate, reDate
                rsDate = sDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
                reDate = eDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = rsDate + "  " + F_adbsghh(rsDate)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = reDate + "  " + F_adbsghh(reDate)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtYear").value = sDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtMonth").value = sDate.substring(5, 7)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtDay").value = sDate.substring(8, 10)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtYear").value = eDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtMonth").value = eDate.substring(5, 7)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtDay").value = eDate.substring(8, 10)
                CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtCode").value = PersonCode
                CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtName").value = PersonName
                CreditInfoDialogObj.OnClickBtnFilter()
            }
            else {
                CreditInfoDialogObj.document.getElementById(MasterObj + "txtPersonCode").value = PersonCode
                CreditInfoDialogObj.document.getElementById(MasterObj + "NameTD").innerHTML = PersonName
                CreditInfoDialogObj.document.getElementById(MasterObj + "PersonIDTD").innerHTML = PersonCode
                var sDate = LastSelectedGridRow.getAttribute('Rdate')
                var eDate = LastSelectedGridRow.getAttribute('Rdate')
                var rsDate, reDate
                rsDate = sDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
                reDate = eDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSD_txtCalendar").value = rsDate + "  " + F_adbsghh(rsDate)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalED_txtCalendar").value = reDate + "  " + F_adbsghh(reDate)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSD_txtYear").value = sDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSD_txtMonth").value = sDate.substring(5, 7)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSD_txtDay").value = sDate.substring(8, 10)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalED_txtYear").value = eDate.substring(0, 4)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalED_txtMonth").value = eDate.substring(5, 7)
                CreditInfoDialogObj.document.getElementById(MasterObj + "KCalED_txtDay").value = eDate.substring(8, 10)
                CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPersonelInfo_txtCode").value = PersonCode
                CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPersonelInfo_txtName").value = PersonName

                CreditInfoDialogObj.OnClickBtnFilter()
            }
        }
    } catch (e) { }
}

function RefreshThisRow() {
    var PersonCode = "";
    //SelectRow = window.event.srcElement.parentElement
    SelectRow = LastSelectedGridRow;
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    while (SelectRow.tagName != 'TR')
        SelectRow = SelectRow.parentElement
    document.getElementById(MasterObj + "txtRDate").value = SelectRow.getAttribute('Rdate')
    document.getElementById(MasterObj + "txtPersonCodeSearch").value = PersonCode
    //$get(MasterObj + "txtSubmit").value = "RefreshRow"
    //$get(MasterObj + "BtnSubmit2").click()
    RefreshRow();
}

function RefreshThisRowCreditInfo() {
    var PersonCode = "";
    SelectRow = LastSelectedGridRow;
    if ($get(MasterObj + "CmbPerson_txtCode").value != "")
        PersonCode = $get(MasterObj + "CmbPerson_txtCode").value;
    else if ($get(MasterObj + "txtPersonName").value != "")
        PersonCode = $get(MasterObj + "txtPersonName").getAttribute("PersonCode")
    if (SelectRow == null)
        return
    $get(MasterObj + "txtRDate").value = SelectRow.getAttribute('Rdate')
    $get(MasterObj + "txtPersonCodeSearch").value = PersonCode
    //            $get(MasterObj + "txtSubmit").value = "RefreshRow"
    //            $get(MasterObj + "BtnSubmit2").click()

    RefreshRow();
}

function RefreshRow() {
    var PersonCodeSearch, OnLineUserID, CompanyID, SessionID, ReportID, RDate, CreditNeed;
    var revStartDate = document.getElementById("TxtSDate").value;
    var revEndDate = document.getElementById("TxtEDate").value;


    PersonCodeSearch = $("#" + MasterObj + "txtPersonCodeSearch").val();


    OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();



    CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    SessionID = $("#" + MasterObj + "txtSessionID").val();

    ReportID = $("#" + MasterObj + "txtReportID").val();
    RDate = $("#" + MasterObj + "RDate").val();

    var ParentDialog = dialogArguments;
    CreditNeed = ParentDialog.$get(MasterObj + "chkCreditNeed").checked == true ? "1" : "0";

    document.getElementById(MasterObj + "txtCreditNeed").value = CreditNeed;

    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainDailyReport.aspx/RefreshRow?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonCodeSearch:'" + PersonCodeSearch + "', RDate:'" + RDate + "' , CreditNeed:'" + CreditNeed + "' , OnLineUserID:'" + OnLineUserID + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            alert(xmlSave)
            XmlGrid = xmlSave;
            XmlGrid = XmlGrid.replace(/_x0020_/g, "_");

            document.getElementById(MasterObj + "txtXmlRowInfo").value = XmlGrid;
            UpdateRow();


            //BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, StartDate, revStartDate, EndDate, revEndDate, CompanyID, SessionID, OnLineUserID, "", "IsSum;1", OnClickGrd, arrGridEvent, 1);

            if (FilterPerson == 1) {

                FilterPerson = 0;
            }

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}

function UpdateRow() {
    //            try {
    var resultVal = document.getElementById(MasterObj + "txtXmlRowInfo").value
    if (document.getElementById(MasterObj + "txtXmlRowInfo").value == ""
                        || document.getElementById(MasterObj + "txtXmlGridProperty").value == "")
        return
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlRowInfo").value)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/RptGetPersonelDailyReport")
    var xmlDoc1 = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc1.loadXML(document.getElementById(MasterObj + "txtXmlGridProperty").value)
    xmlDoc1.setProperty("SelectionLanguage", "XPath")
    var xmlNodes1 = xmlDoc1.documentElement.selectNodes("/NewDataSet/GridSetting[Attributable=0]")
    var len1 = xmlNodes1.length

    if (xmlNodes.length != 0) {
        var OGrid = document.getElementById(MasterObj + "GrdDailyReport");
        var InOutShowCount = 20
                , p = new String, x = 0, Cnt = 0, h = 0, S, Complete, C, InOutType, TempInOutComplet
                , ColorInOut = '', color = '', subTitle = '', P = 0, IOType, tmpStr, crn, CardReaderNo
                , CardReaderName, subStr = "", InOutComplet = "", InOut = "", UnCompletCard = 0, InoutTitle = "";

        InOutComplet = xmlNodes.item(0).selectSingleNode('InOutComplete').text
        UnCompletCard = xmlNodes.item(0).selectSingleNode('UnCompletCard').text
        InOut = xmlNodes.item(0).selectSingleNode('InOut').text
        TempInOutComplet = InOutComplet
        Cnt = 0

        if (InOutComplet == "")//نمایش نام مجوز
            SelectRow.cells(3).innerHTML = "<Div width='100%' >" + InOut + "</Div>";

        if (InOutComplet != "") {
            Cnt = parseInt(getCntChar(';', InOutComplet) + 1)
            h = 0,
            S = ""
            Complete = ""
            C = 0
            InOutType = 0
            TempInOutComplet = InOutComplet
            ColorInOut = ''
            color = ''
            subTitle = ''
            P = 0
            IOType = 0
            tmpStr = ""
            crn = 0
            CardReaderNo = 0
            CardReaderName = ""
            subStr = ""
            var vIOType;
            for (; h < parseInt(InOutShowCount); ++h) {
                S = TempInOutComplet.search(';')
                if (S == '-1')
                    S = TempInOutComplet.length
                Complete = TempInOutComplet.substring(0, S)
                C = Complete.search(',')
                if (C == '-1')
                    C = Complete.length
                InOutType = Complete.substring(0, C)
                tmpStr = Complete.substring(parseInt(C) + 1, Complete.length)
                crn = tmpStr.search('/')
                CardReaderNo = tmpStr.substring(parseInt(crn) + 1, tmpStr.lenght)
                CardReaderName = "کارتخوان" + CardReaderNo
                P = tmpStr.search('#')
                IOType = tmpStr.substring(parseInt(P) + 1, tmpStr.lenght)
                tmpStr = tmpStr.substring(0, P)

                if (tmpStr != "") {
                    if (parseInt(InOutType) == 1) {
                        vIOType = IOType.split('/')
                        if (parseInt(vIOType[1]) == 1) {
                            IOType = ""
                            //                            color = '#009900'
                            color = "InColor";
                            CardReaderNo = vIOType[0]
                            CardReaderName = "کارتخوان" + CardReaderNo
                            subTitle = CardReaderName
                        }
                        else if (parseInt(vIOType[1]) == 2) {
                            //                            color = '#660066'
                            color = "OutColor";
                            CardReaderNo = vIOType[0]
                            CardReaderName = "کارتخوان" + CardReaderNo
                            subTitle = CardReaderName
                        }
                    }
                    if (parseInt(InOutType) == 2) {
                        //                        color = '#ff33ff'
                        color = "ManagerColor";
                        subTitle = 'مدير سيستم'
                    }
                    if (parseInt(InOutType) == 3) {
                        //                        color = '#FF9933'
                        color = "UserColor";
                        subTitle = 'کاربر'
                    }
                    if (InOut.length >= 5)
                        ColorInOut += "&nbsp;&nbsp;<SPAN Width='50px' title='" + subTitle + "'><font size='2px' class='" + color + "'> " + tmpStr + "</font></SPAN> "
                    else
                        ColorInOut += "&nbsp;&nbsp;<SPAN Width='50px' title='" + subTitle + "'><font size='2px' class='" + color + "'> " + tmpStr + "</font></SPAN> "
                }
                TempInOutComplet = TempInOutComplet.substring(parseInt(S) + 1, TempInOutComplet.length)
            }
            var Str = "";
            if (xmlNodes.item(0).selectSingleNode('SInOut').text.trim() == InOut.trim())
                Str = "<Div width='100%' title='" + InOut + "'>" + ColorInOut + "</Div>"
            else {
                Str = "<Div  width='100%' title='" + xmlNodes.item(0).selectSingleNode('SInOut').text + "'>" + ColorInOut + "<font size='2px' class='" + color + "'>...</font></Div>";
            }

            SelectRow.cells(3).innerHTML = Str;
        }
        var colName, GLen = OGrid.rows.length, idxKasr = "-1", idxMazad = "-1", ColIntval = "-1"
        for (var i = 3; i < len1 - 1; i++) {
            colName = xmlNodes1.item(i).selectSingleNode("ColName").text
            colName = ReplaceAll(colName, " ", "_")
            ColIntval = xmlNodes1.item(i).selectSingleNode("Intval").text
            if (ColIntval == "6")
                idxMazad = i + 1
            if (ColIntval == "9")
                idxKasr = i + 1
            if (xmlDoc.selectSingleNode("/ReportsEntity/RptGetPersonelDailyReport/" + colName) != null
                     && xmlNodes.item(0).selectSingleNode(colName) != null
                    ) {
                if (ReplaceAll(xmlNodes.item(0).selectSingleNode(colName).text, " ", "") == "") {
                    SelectRow.cells(i + 1).style.textDecoration = "none"
                    SelectRow.cells(i + 1).firstChild.style.textDecoration = "none"
                }
                SelectRow.cells(i + 1).firstChild.innerText = xmlNodes.item(0).selectSingleNode(colName).text

            }
            else
                SelectRow.cells(i + 1).firstChild.innerText = ""
        }
        if (idxMazad != "-1" && document.getElementById(MasterObj + "txtLMazadKar").value == "1")
            switch (xmlNodes.item(0).selectSingleNode('ovflag').text.toString()) {
            case "1":
                SelectRow.cells(idxMazad).firstChild.className = "SomeCredit"
                break;
            case "2":
                SelectRow.cells(idxMazad).firstChild.className = "AllCredit"
                break;
            case "0":
                SelectRow.cells(idxMazad).firstChild.className = "NoCredit"
                break;
        }
        if (idxKasr != "-1" && document.getElementById(MasterObj + "txtLkasrkar").value == "1")
            switch (xmlNodes.item(0).selectSingleNode('kasrflag').text.toString()) {
            case "1":
                SelectRow.cells(idxKasr).firstChild.className = "SomeCredit"
                break;
            case "2":
                SelectRow.cells(idxKasr).firstChild.className = "AllCredit"
                break;
            case "0":
                SelectRow.cells(idxKasr).firstChild.className = "NoCredit"
                break;
        }
    }
    //            }catch (e) { }<DIV title="استحقاقي روزانه" width="100%"></DIV>
}

var keyStr = "ABCDEFGHIJKLMNOP" +
                "QRSTUVWXYZabcdef" +
                "ghijklmnopqrstuv" +
                "wxyz0123456789+/" +
                "=";
function encode64(input) {

    input = escape(input);

    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;

    do {

        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (isNaN(chr2)) {
            enc3 = enc4 = 64;

        } else if (isNaN(chr3)) {
            enc4 = 64;
        }

        output = output +
            keyStr.charAt(enc1) +
            keyStr.charAt(enc2) +
            keyStr.charAt(enc3) +
            keyStr.charAt(enc4);

        chr1 = chr2 = chr3 = "";
        enc1 = enc2 = enc3 = enc4 = "";
    } while (i < input.length);
    return output;
}
/****************************Other*******************************/
