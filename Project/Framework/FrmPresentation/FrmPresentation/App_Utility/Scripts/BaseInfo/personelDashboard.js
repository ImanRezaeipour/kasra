var MasterObj = "ctl00_ContentPlaceHolder1_";
var ActiveTabNo;
var ShiftCount=0;
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

PageLoad();
function PageLoad() {
    onclickTab(TabBaseInfo, "1");
    CreateGrdBasicInfo();
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    var Strval = $('#' + MasterObj + 'txtSubmit').val();
    switch (Strval) {
        case "BaseInfo":
            CreateGrdBasicInfo();
            break;
        case "AttendanceInfo":
            CreateGrdAttendanceInfo();
            break;
        case "ShiftInfo":
            CreateGrdShiftInfo();
            CreateGrdStrustureInfo();
            break;
        case "DocInfo":
            CreateGrdDocInfo();
            break;
    }
}
//====================================================================================================
function CreateGrdBasicInfo() {
    ClearGrid();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlGrdInfo").val() != "<NewDataSet />") {
        Data = $("#" + MasterObj + "txtXmlGrdInfo").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("PersonBaseInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdBasicInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("DeptInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdDepartmentInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
    }
    OnClickImgGrdStatus($("#imgEmployeeStatus"), 'TblBasicInfo', 1);
    OnClickImgGrdStatus($("#ImgDeptStatus"), 'TblDepartmentInfo', 1);
}
//====================================================================================================
function AddRowGrdBasicInfo(obj) {
    $("#TblBasicInfo").append("<tr class='CssNewRow'  valign='middle'  >" +
                "<td style='width: 100px;height:20px' align='right'>" + obj.find("PID").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("PCode").text() + " </td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'> " + obj.find("PName").text() + " </td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("EmployDate").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("ExitDate").text() + "</td></tr>");
}
//====================================================================================================
function AddRowGrdDepartmentInfo(obj) {
    var HeadURL;
    if (obj.find("Head").text() == "1")
        HeadURL = "../../App_Utility/Images/Icons/OK2.png"
    else
        HeadURL = "../../App_Utility/Images/Icons/Cancel.png";
    $("#TblDepartmentInfo").append("<tr class='CssNewRow'  valign='middle'  >" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("PCode").text() + " </td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'> " + obj.find("PName").text() + " </td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("DCode").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("DName").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("RoleTitle").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'><img src='" + HeadURL + "' ></td></tr>");
}
//====================================================================================================
function CreateGrdAttendanceInfo() {
    $(".CssNewRow2").remove();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlAttInfo").val() != "<NewDataSet />") {
        Data = $("#" + MasterObj + "txtXmlAttInfo").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("AttendanceInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdAttendanceInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("ToleranceInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdToleranceInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        BindCmbCardCode();
        BindCmbDelStatus();
        BindCmbCmbAcceptStatus();
        //---------------------------------------------------------------------------------
    }
    OnClickImgGrdStatus($("#imgAttendanceStatus"), 'TblAttendance', 1)
    OnClickImgGrdStatus($("#ImgToleranceStatus"), 'TblTolerance', 1);
}
//===========================================================================================================
function AddRowGrdAttendanceInfo(obj) {
    var StatusURL, StatusTitle, DeletedURL, DeleteStatus;
    if (obj.find("Deleted").text() == "true") {
        DeletedURL = "../../App_Utility/Images/Icons/OK2.png"
        DeleteStatus = "حذف شده";
    }
    else {
        DeletedURL = "../../App_Utility/Images/Icons/Cancel.png";
        DeleteStatus = "حذف نشده";
    }
    switch (obj.find("StatusID").text()) {
        case "201":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/default_phase_icon.gif"
            StatusTitle = "در جريان";
            break;
        case "203":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/BlueTick.gif"
            StatusTitle = "تاييد شده";
            break;
        case "204":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
        case "205":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
    }
    $("#TblAttendance").append("<tr Deleted='" + obj.find("Deleted").text() + "' StatusID='" + obj.find("StatusID").text() + "'  DocID='" + obj.find("AttendanceID").text() + "' DocTypeID=3 class='CssNewRow2'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("CardCode").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("Date").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("Time").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("Type").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("CardKhanNo").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img style='cursor:hand' title='" + StatusTitle + "' src='" + StatusURL + "' ></td>" +
                "<td style='width: 50px;text-align:center;height:20px' align='right'><img title='" + DeleteStatus + "' src='" + DeletedURL + "' ></td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("Status").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("pooledrecord").text() + "</td></tr>");

    $("#TblAttendance").find("tr").last().find("td:eq(5)").children(0).click(function () {
        OnClickBtnStatus(this);
    });
}
//===========================================================================================================
function AddRowGrdToleranceInfo(obj) {
    var ActiveURL, ActiveTitle;
    if (obj.find("Active").text() == "1") {
        ActiveURL = "../../App_Utility/Images/Icons/OK2.png"
        ActiveTitle = "فعال";
    }
    else {
        ActiveURL = "../../App_Utility/Images/Icons/Cancel.png";
        ActiveTitle = "غير فعال";
    }
    $("#TblTolerance").append("<tr DocID='" + obj.find("AttendanceID").text() + "' DocTypeID=3 class='CssNewRow2'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("StartDate").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("EndDate").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("starttime").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("endtime").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("ReplaceTime").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img title='" + ActiveTitle + "' src='" + ActiveURL + "' ></td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("description").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("Code").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("Name").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("Type").text() + "</td></tr>");
}
//===========================================================================================================
function BindCmbCardCode() {
    $("#CmbCardCode").html("");
    $("#CmbCardCode").append("<option value=0>انتخاب نشده</option>");
    $("#TblAttendance").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbCardCode").val($(this).find("td:eq(7)").text());
            if ($("#CmbCardCode").val() != $(this).find("td:eq(7)").text())
                $("#CmbCardCode").append("<option value='" + $(this).find("td:eq(7)").text() + "' >" + $(this).find("td:eq(7)").text() + "</option>");
        }
    });
    $("#CmbCardCode").val("0");
}
//===========================================================================================================
function BindCmbDelStatus() {
    $("#CmbDelStatus").html("");
    $("#CmbDelStatus").append("<option value=0>انتخاب نشده</option>");
    $("#TblAttendance").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbDelStatus").val($(this).attr("Deleted"));
            if ($("#CmbDelStatus").val() != $(this).attr("Deleted"))
                $("#CmbDelStatus").append("<option value='" + $(this).attr("Deleted") + "'>" + $(this).find("td:eq(6)").children(0).attr("title") + "</option>");
        }
    });
    $("#CmbDelStatus").val("0");
}
//===========================================================================================================
function BindCmbCmbAcceptStatus() {
    $("#CmbAcceptStatus").html("");
    $("#CmbAcceptStatus").append("<option value=0>انتخاب نشده</option>");
    $("#TblAttendance").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbAcceptStatus").val($(this).attr("StatusID"));
            if ($("#CmbAcceptStatus").val() != $(this).attr("StatusID"))
                $("#CmbAcceptStatus").append("<option value='" + $(this).attr("StatusID") + "' >" + $(this).find("td:eq(5)").children(0).attr("title") + "</option>");
        }
    });
    $("#CmbAcceptStatus").val("0");
}
//==========================================================
function CreateGrdShiftInfo() {
    $(".CssNewRow3").remove();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlShiftInfo").val() != "<NewDataSet />") {
        Data = $("#" + MasterObj + "txtXmlShiftInfo").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("ShiftInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdShiftInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        BindCmbShift();
        BindCmbGroup();
        //---------------------------------------------------------------------------------
    }
    //---------------------------------------------------------------------------------
    ShiftCount = 0;
    $("#TblGroupShift").find("tr").each(function () {
        if ($(this).attr("ISMember") == "1") {
            $(this).css("background-color", "#85f81b");
            $(this).attr("title", "عضويت در گروه ");
        }
        if ($(this).attr("ISMember") == "1" && $(this).attr("ScheduleID") != "0")
            ShiftCount++;
    });
    if (ShiftCount > 1)
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).attr("ISMember") == "1" && $(this).attr("ScheduleID") != "0") {
                $(this).css("background-color", "#f6684c");
                $(this).attr("title", "تداخل تاريخي گروه هاي شيفتي");
            }
        });
    //---------------------------------------------------------------------------------
    OnClickImgGrdStatus($("#ImgShiftStatus"), 'TblGroupShift', 1);
}
//==========================================================
function CreateGrdStrustureInfo() {
    $(".CssNewRow5").remove();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlShiftInfo").val() != "<NewDataSet />") {
        Data = $("#" + MasterObj + "txtXmlShiftInfo").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("StructureInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdStructureInfo($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        BindCmbStructureShift();
        BindCmbStructure();
    }
    OnClickImgGrdStatus($("#ImgStructureStatus"), 'TblStructure', 1);
}
//==========================================================
function AddRowGrdShiftInfo(obj) {
    $("#TblGroupShift").append("<tr ISMember='" + obj.find("ISMember").text() + "' GroupID='" + obj.find("GroupID").text() + "' ScheduleID='" + obj.find("ScheduleID").text() + "' class='CssNewRow3'  valign='middle'  >" +
                "<td style='width: 150px;text-align:center;height:20px' align='right'> " + obj.find("GName").text() + " </td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("Acronym").text() + " </td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'>" + obj.find("CName").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("StartDate").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("EndDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("ScheduleID").text() + "</td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("SName").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("SStartDate").text() + "</td></tr>");
}
//==========================================================
function AddRowGrdStructureInfo(obj) {
    $("#TblStructure").append("<tr StructureID=" + obj.find("StructureID").text() + " DetailCollectionID=" + obj.find("DetailCollectionID").text() + "  class='CssNewRow5'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("ScheduleID").text() + " </td>" +
                "<td style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("SName").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("StructureID").text() + "</td>" +
                "<td style='width: 150px;text-align:center;height:20px' align='right'>" + obj.find("StName").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("SDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("EDate").text() + "</td>" +
                "<td style='width: 150px;text-align:center;height:20px;color:blue; text-decoration:underline;cursor:hand' align='right'>" + obj.find("DCollection").text() + "</td></tr>");

    $("#TblStructure").find("tr").last().find("td:eq(6)").click(function () {
        OnClickBtnShowStructure(this);
    });
}
//==========================================================
function OnClickBtnShowStructure(Obj) {
    var StructureID = $(Obj).parent().attr("StructureID");
    var DetailCollectionID = $(Obj).parent().attr("DetailCollectionID");
    window.showModalDialog("/TAPresentation/App_Pages/Schedule/DifinitionDetailCollection.aspx?StructureID=" + StructureID + "&DetailCollectionID=" + DetailCollectionID + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val() + "&ReportFlag=1", "", "dialogHeight: 400px;dialogWidth: 600px;center: Yes;help: no;status: no");
}
//==========================================================
function BindCmbShift() {
    $("#CmbShift").html("");
    $("#CmbShift").append("<option value=0>انتخاب نشده</option>");
    $("#TblGroupShift").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbShift").val($(this).find("td:eq(5)").text());
            if ($("#CmbShift").val() != $(this).find("td:eq(5)").text())
                $("#CmbShift").append("<option value='" + $(this).find("td:eq(5)").text() + "' >" + $(this).find("td:eq(6)").text() + "</option>");
        }
    });
    $("#CmbShift").val("0");
}
//==========================================================
function BindCmbGroup() {
    $("#CmbGroup").html("");
    $("#CmbGroup").append("<option value=0>انتخاب نشده</option>");
    $("#TblGroupShift").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbGroup").val($(this).attr("GroupID"));
            if ($("#CmbGroup").val() != $(this).attr("GroupID"))
                $("#CmbGroup").append("<option value='" + $(this).attr("GroupID") + "' >" + $(this).find("td:eq(0)").text() + "</option>");
        }
    });
    $("#CmbGroup").val("0");
}
//==========================================================
function BindCmbStructureShift() {
    $("#CmbStructureShift").html("");
    $("#CmbStructureShift").append("<option value=0>انتخاب نشده</option>");
    $("#TblStructure").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbStructureShift").val($(this).find("td:eq(0)").text());
            if ($("#CmbStructureShift").val() != $(this).find("td:eq(0)").text())
                $("#CmbStructureShift").append("<option value='" + $(this).find("td:eq(0)").text() + "' >" + $(this).find("td:eq(1)").text() + "</option>");
        }
    });
    $("#CmbStructureShift").val("0");
}
//==========================================================
function BindCmbStructure() {
    $("#CmbStructure").html("");
    $("#CmbStructure").append("<option value=0>انتخاب نشده</option>");
    $("#TblStructure").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbStructure").val($(this).find("td:eq(2)").text());
            if ($("#CmbStructure").val() != $(this).find("td:eq(2)").text())
                $("#CmbStructure").append("<option value='" + $(this).find("td:eq(2)").text() + "' >" + $(this).find("td:eq(3)").text() + "</option>");
        }
    });
    $("#CmbStructure").val("0");
}
//==========================================================
function OnClickBtnStatus(obj) {
    var WfNew = 1;
    var DocTypeID = $(obj).parent().parent().attr("DocTypeID");
    var DocID = $(obj).parent().parent().attr("DocID");
    if (WfNew == 1) {
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    }
    else
        window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WfDocID + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
}
//==========================================================
function CreateGrdDocInfo() {
    $(".CssNewRow4").remove();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlDocInfo").val() != "<NewDataSet />") {
        Data = $("#" + MasterObj + "txtXmlDocInfo").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("CreditInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdCredit($(XmlNodes[i]));
        BindCmbCredit();
        BindCmbStatus();
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("SchedulChangeInfo");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdSchedulChanges($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("ReplaceDetail");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdReplaceDetail($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("NewDataSet").find("DayContinuation");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrdDayContinuation($(XmlNodes[i]));
        //---------------------------------------------------------------------------------
    }
    OnClickImgGrdStatus($("#ImgCreditStatus"), 'TblCredit', 1);
    OnClickImgGrdStatus($("#ImgSchedulChangesStatus"), 'TblSchedulChanges', 1);
    OnClickImgGrdStatus($("#ImgReplaceDetailStatus"), 'TblReplaceDetail', 1);
    OnClickImgGrdStatus($("#ImgDayContinuationStatus"), 'TblDayContinuation', 1);
}
//===========================================================================================================
function BindCmbCredit() {
    $("#CmbCredit").html("");
    $("#CmbCredit").append("<option value=0>انتخاب نشده</option>");
    $("#TblCredit").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbCredit").val($(this).find("td:eq(0)").text());
            if ($("#CmbCredit").val() != $(this).find("td:eq(0)").text())
                $("#CmbCredit").append("<option value='" + $(this).find("td:eq(0)").text() + "' >" + $(this).find("td:eq(1)").text() + "</option>");
        }
    });
    $("#CmbCredit").val("0");
}
//===========================================================================================================
function BindCmbStatus() {
    $("#CmbStatus").html("");
    $("#CmbStatus").append("<option value=0>انتخاب نشده</option>");
    $("#TblCredit").find("tr").each(function () {
        if ($(this).index() != 0) {
            $("#CmbStatus").val($(this).attr("StatusID"));
            if ($("#CmbStatus").val() != $(this).attr("StatusID"))
                $("#CmbStatus").append("<option value='" + $(this).attr("StatusID") + "' >" + $(this).find("td:eq(6)").children(0).attr("title") + "</option>");
        }
    });
    $("#CmbStatus").val("0");
}
//===========================================================================================================
function AddRowGrdCredit(obj) {
    var StatusURL, StatusTitle;
    switch (obj.find("StatusID").text()) {
        case "201":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/default_phase_icon.gif"
            StatusTitle = "در جريان";
            break;
        case "203":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/BlueTick.gif"
            StatusTitle = "تاييد شده";
            break;
        case "204":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
        case "205":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
    }
    $("#TblCredit").append("<tr StatusID=" + obj.find("StatusID").text() + " DocID=" + obj.find("CreditID").text() + " DocTypeID=" + obj.find("DocTypeID").text() + "  class='CssNewRow4'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("Code").text() + " </td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'> " + obj.find("CodeName").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("StartDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("EndDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("StartTime").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("EndTime").text() + "</td>" +
                    "<td style='width: 80px;text-align:center;height:20px' align='right'><img style='cursor:hand' title='" + StatusTitle + "' src='" + StatusURL + "' ></td></tr>");
    $("#TblCredit").find("tr").last().find("td:eq(6)").children(0).click(function () {
        OnClickBtnStatus(this);
    });
}
//===========================================================================================================
function AddRowGrdSchedulChanges(obj) {
    var StatusURL, StatusTitle;
    switch (obj.find("StatusID").text()) {
        case "201":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/default_phase_icon.gif"
            StatusTitle = "در جريان";
            break;
        case "203":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/BlueTick.gif"
            StatusTitle = "تاييد شده";
            break;
        case "204":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
        case "205":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
    }
    $("#TblSchedulChanges").append("<tr DocID=" + obj.find("ReplacementID").text() + " DocTypeID=10  class='CssNewRow4'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("FPCode").text() + " </td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'> " + obj.find("FPName").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("FPCode").text() + "</td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'>" + obj.find("SPName").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("SDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("EDate").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("_Flags").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img style='cursor:hand' title='" + StatusTitle + "' src='" + StatusURL + "' ></td></tr>");
    $("#TblSchedulChanges").find("tr").last().find("td:eq(7)").children(0).click(function () {
        OnClickBtnStatus(this);
    });
}
//===========================================================================================================
function AddRowGrdReplaceDetail(obj) {
    var StatusURL, StatusTitle, MTypeTitle, MTypeURL;
    switch (obj.find("StatusID").text()) {
        case "201":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/default_phase_icon.gif"
            StatusTitle = "در جريان";
            break;
        case "203":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/BlueTick.gif"
            StatusTitle = "تاييد شده";
            break;
        case "204":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
        case "205":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
    }
    switch (obj.find("Type").text()) {
        case "P":
            MTypeURL = "../../App_Utility/Images/Icons/Personel.gif"
            MTypeTitle = "پرسنلي";
            break;
        case "G":
            MTypeURL = "../../App_Utility/Images/Icons/PGroup.gif"
            MTypeTitle = "گروه";
            break;
        case "D":
            MTypeURL = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
            MTypeTitle = "واحدسازماني";
            break;
        case "S":
            MTypeURL = "../../App_Utility/Images/Icons/Icons/DefineWorkTimes1.gif"
            MTypeTitle = "برنامه کاري";
            break;
        case "T":
            MTypeURL = "../../App_Utility/Images/Icons/Icons/Icons/uoGroup3.gif"
            MTypeTitle = "دفتر تابل";
            break;
    }
    $("#TblReplaceDetail").append("<tr DocID=" + obj.find("ReplaceDetailID").text() + " DocTypeID=9  class='CssNewRow4'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("StartDate").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("EndDate").text() + " </td>" +
                "<td style='width: 120px;text-align:center;height:20px' align='right'>" + obj.find("CurrStr").text() + "</td>" +
                "<td style='width: 120px;text-align:center;height:20px' align='right'>" + obj.find("NewStr").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'>" + obj.find("MemberID").text() + "</td>" +
                "<td style='width: 180px;text-align:center;height:20px' align='right'>" + obj.find("MName").text() + "</td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img  title='" + MTypeTitle + "' src='" + MTypeURL + "' ></td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img style='cursor:hand' title='" + StatusTitle + "' src='" + StatusURL + "' ></td></tr>");
    $("#TblReplaceDetail").find("tr").last().find("td:eq(7)").children(0).click(function () {
        OnClickBtnStatus(this);
    });
}
//===========================================================================================================
function AddRowGrdDayContinuation(obj) {
    var StatusURL, StatusTitle, DeletedURL, DeleteStatus;
    if (obj.find("Deleted").text() == "1") {
        DeletedURL = "../../App_Utility/Images/Icons/OK2.png"
        DeleteStatus = "حذف شده";
    }
    else {
        DeletedURL = "../../App_Utility/Images/Icons/Cancel.png";
        DeleteStatus = "حذف نشده";
    }

    switch (obj.find("StatusID").text()) {
        case "201":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/default_phase_icon.gif"
            StatusTitle = "در جريان";
            break;
        case "203":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/BlueTick.gif"
            StatusTitle = "تاييد شده";
            break;
        case "204":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
        case "205":
            StatusURL = "/FrmPresentation/App_Utility/Images/Icons/Cross.gif"
            StatusTitle = "باطل شده";
            break;
    }
    $("#TblDayContinuation").append("<tr DocID=" + obj.find("ID").text() + " DocTypeID=7  class='CssNewRow4'  valign='middle'  >" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'> " + obj.find("Date").text() + " </td>" +
                "<td style='width: 80px;text-align:center;height:20px' align='right'><img style='cursor:hand' title='" + StatusTitle + "' src='" + StatusURL + "' ></td>" +
                 "<td style='width: 80px;text-align:center;height:20px' align='right'><img title='" + DeleteStatus + "' src='" + DeletedURL + "' ></td></tr>");
    $("#TblDayContinuation").find("tr").last().find("td:eq(1)").children(0).click(function () {
        OnClickBtnStatus(this);
    });
}
//===========================================================================================================
function ClearGrid() {
    $(".CssNewRow").remove();
}
//===========================================================================================================
function OnClickImgGrdStatus(Obj, Tbl, IsLoad) {
    if (IsLoad != 1) {
        switch ($(Obj).attr("statusDisplay")) {
            case "1":
                $(Obj).attr("statusDisplay", "0");
                if ($("#" + Tbl).find("tr").length > 1)
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/SubOk.png");
                else
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/SubNoOk.png");
                //-----------------------------------------------------------------------------
                if ((Obj).id == "ImgShiftStatus" && ShiftCount > 1)
                    $("#ImgShiftStatus").attr("src", "../../App_Utility/Images/Icons/SubNoOk.png");
                //-----------------------------------------------------------------------------
                $("#" + Tbl).find("tr").each(function () {
                    $(this).css("display", "none");
                });
                switch (Tbl) {
                    case "TblAttendance":
                        $("#TrAttendanceFilter").css("display", "none");
                        $("#TrTblAttendance").css("display", "none");
                        break;
                    case "TblGroupShift":
                        $("#TrGroupShiftFilter").css("display", "none");
                        break;
                    case "TblStructure":
                        $("#TrStructureFilter").css("display", "none");
                        break;
                    case "TblCredit":
                        $("#TrCreditFilter").css("display", "none");
                        break;


                }
                break;
            case "0":
                $(Obj).attr("statusDisplay", "1");
                if ($("#" + Tbl).find("tr").length > 1)
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddOk.png");
                else
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                //-----------------------------------------------------------------------------
                if ((Obj).id == "ImgShiftStatus" && ShiftCount > 1)
                    $("#ImgShiftStatus").attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                //-----------------------------------------------------------------------------
                $("#" + Tbl).find("tr").each(function () {
                    $(this).css("display", "inline");
                });
                switch (Tbl) {
                    case "TblAttendance":
                        $("#TrAttendanceFilter").css("display", "inline");
                        $("#TrTblAttendance").css("display", "inline");
                        break;
                    case "TblGroupShift":
                        $("#TrGroupShiftFilter").css("display", "inline");
                        break;
                    case "TblStructure":
                        $("#TrStructureFilter").css("display", "inline");
                        break;
                    case "TblCredit":
                        $("#TrCreditFilter").css("display", "inline");
                        break;
                }
                break;
        }
    }
    else {
        if ($("#" + Tbl).find("tr").length > 1)
            $(Obj).attr("src", "../../App_Utility/Images/Icons/AddOk.png");
        else
            $(Obj).attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
        //-----------------------------------------------------------------------------
        if ($(Obj)[0]!=undefined && $(Obj)[0].id == "ImgShiftStatus" && ShiftCount > 1)
            $("#ImgShiftStatus").attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
    }
}
//====================================================================================================
function onclickTab(Obj, TabNo) {
    $(".DataTable").css("display", "none");
    $(".SelectedTab").addClass("Tab");
    $(".SelectedTab").removeClass("SelectedTab")
    Obj.className = "SelectedTab";
    eval("Table" + TabNo + ".style.display='inline'");
    ActiveTabNo = TabNo;
    switch (TabNo) {
        case "1":
            $('#' + MasterObj + 'txtSubmit').val("BaseInfo");
            break;
        case "2":
            $('#' + MasterObj + 'txtSubmit').val("AttendanceInfo");
            break;
        case "3":
            $('#' + MasterObj + 'txtSubmit').val("ShiftInfo");
            break;
        case "4":
            $('#' + MasterObj + 'txtSubmit').val("DocInfo");
            break;
    }
    if ($(Obj).attr("IsLoad") == "0") {
        $(Obj).attr("IsLoad", "1");
        OnClickBtnFilter();
    }
}
//====================================================================================================
function OnClickBtnFilter() {
    $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
    if ($("#" + MasterObj + "txtDate").val() == "//") {
        alert("لطفا تاريخ را وارد نماييد");
        $("#" + MasterObj + "KCalDate_txtCalendar").focus();
    }
    else if ($("#" + MasterObj + "CmbPerson_txtPCode").val() == "") {
        alert("لطفا پرسنلي را وارد نماييد");
        $("#" + MasterObj + "CmbPerson_txtPCode").focus();
    }
    else {
        $('#' + MasterObj + 'txtPersonCode').val($("#" + MasterObj + "CmbPerson_txtPCode").val());
        $('#' + MasterObj + 'BtnSubmit').click();
    }
}
//====================================================================================================
function OnClickBtnFilterAtt() {
    var CardKhanVal = $("#txtCardKhanNo").val();
    var CardCodeVal = $("#CmbCardCode").val();
    var DelStatusVal = $("#CmbDelStatus").val();
    var AcceptStatusVal = $("#CmbAcceptStatus").val();
    CreateGrdAttendanceInfo();
    $("#txtCardKhanNo").val(CardKhanVal);
    $("#CmbCardCode").val(CardCodeVal);
    $("#CmbDelStatus").val(DelStatusVal);
    $("#CmbAcceptStatus").val(AcceptStatusVal);
    if ($("#txtCardKhanNo").val() != "") {
        $("#TblAttendance").find("tr").each(function () {
            if ($(this).find("td:eq(4)").text() != $("#txtCardKhanNo").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbCardCode").val() != "" && $("#CmbCardCode").val() != "0") {
        $("#TblAttendance").find("tr").each(function () {
            if ($(this).find("td:eq(7)").text() != $("#CmbCardCode").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbDelStatus").val() != "" && $("#CmbDelStatus").val() != "0") {
        $("#TblAttendance").find("tr").each(function () {
            if ($(this).attr("Deleted") != $("#CmbDelStatus").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbAcceptStatus").val() != "" && $("#CmbAcceptStatus").val() != "0") {
        $("#TblAttendance").find("tr").each(function () {
            if ($(this).attr("StatusID") != $("#CmbAcceptStatus").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
}
//====================================================================================================
function OnClickBtnShowAllAtt() {
    $("#txtCardKhanNo").val("");
    $("#CmbCardCode").val("0");
    $("#CmbDelStatus").val("0");
    $("#CmbAcceptStatus").val("");
    CreateGrdAttendanceInfo();
}
//====================================================================================================
function OnClickBtnFilterGroupShift() {
    var ShiftVal = $("#CmbShift").val();
    var GroupVal = $("#CmbGroup").val();
    var SDate = $("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val();
    var EDate = $("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val();
    CreateGrdShiftInfo();
    $("#CmbShift").val(ShiftVal);
    $("#CmbGroup").val(GroupVal);
    if ($("#CmbShift").val() != "" && $("#CmbShift").val() != "0") {
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).find("td:eq(5)").text().trim() != $("#CmbShift").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbGroup").val() != "" && $("#CmbGroup").val() != "0") {
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).attr("GroupID") != $("#CmbGroup").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if (SDate != "//" && EDate != "//") {
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).index() != 0) {
                GSDate = $(this).find("td:eq(3)").text();
                GSDate = "13" + GSDate.substr(6, 2) + "/" + GSDate.substr(3, 2) + "/" + GSDate.substr(0, 2);
                GEDate = $(this).find("td:eq(4)").text();
                GEDate = "13" + GEDate.substr(6, 2) + "/" + GEDate.substr(3, 2) + "/" + GEDate.substr(0, 2);

                if (!(GSDate <= EDate && GSDate >= SDate)
                       && !(GEDate <= EDate && GEDate >= SDate)
                       && !(SDate <= GEDate && SDate >= GSDate)
                       && !(EDate <= GEDate && EDate >= GSDate))
                    $(this).remove();
            }
        });
    }
    if ($("#chkShift").attr("checked") == true && $("#chkNoShift").attr("checked") == false) {
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).attr("ScheduleID") == "0" && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#chkNoShift").attr("checked") == true && $("#chkShift").attr("checked") == false) {
        $("#TblGroupShift").find("tr").each(function () {
            if ($(this).attr("ScheduleID") != "0" && $(this).index() != 0)
                $(this).remove();
        });
    }
}
//====================================================================================================
function OnClickBtnShowAllGroupShift() {
    $("#CmbShift").val("0");
    $("#CmbGroup").val("0");
    $("#chkNoShift").attr("checked", false);
    $("#chkShift").attr("checked", false);
    $("#" + MasterObj + "KCalSDate_txtYear").val("");
    $("#" + MasterObj + "KCalSDate_txtMonth").val("");
    $("#" + MasterObj + "KCalSDate_txtDay").val("");
    $("#" + MasterObj + "KCalEDate_txtDay").val("");
    $("#" + MasterObj + "KCalEDate_txtDay").val("");
    $("#" + MasterObj + "KCalEDate_txtDay").val("");
    $("#" + MasterObj + "KCalSDate_txtCalendar").val("");
    $("#" + MasterObj + "KCalEDate_txtCalendar").val("");
    CreateGrdShiftInfo();
}
//====================================================================================================
function OnClickBtnFilterStructure() {
    var ShiftVal = $("#CmbStructureShift").val();
    var StructureVal = $("#CmbStructure").val();
    var SDate = $("#" + MasterObj + "KCalStrSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalStrSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalStrSDate_txtDay").val();
    var EDate = $("#" + MasterObj + "KCalStrEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalStrEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalStrEDate_txtDay").val();
    CreateGrdStrustureInfo();
    $("#CmbStructureShift").val(ShiftVal);
    $("#CmbStructure").val(StructureVal);

    if ($("#CmbStructureShift").val() != "" && $("#CmbStructureShift").val() != "0") {
        $("#TblStructure").find("tr").each(function () {
            if ($(this).find("td:eq(0)").text().trim() != $("#CmbStructureShift").val().trim() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbStructure").val() != "" && $("#CmbStructure").val() != "0") {
        $("#TblStructure").find("tr").each(function () {
            if ($(this).find("td:eq(2)").text() != $("#CmbStructure").val().trim() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if (SDate != "//" && EDate != "//") {
        $("#TblStructure").find("tr").each(function () {
            if ($(this).index() != 0) {
                GSDate = $(this).find("td:eq(4)").text();
                GSDate = "13" + GSDate.substr(6, 2) + "/" + GSDate.substr(3, 2) + "/" + GSDate.substr(0, 2);
                GEDate = $(this).find("td:eq(5)").text();
                GEDate = "13" + GEDate.substr(6, 2) + "/" + GEDate.substr(3, 2) + "/" + GEDate.substr(0, 2);

                if (!(GSDate <= EDate && GSDate >= SDate)
                       && !(GEDate <= EDate && GEDate >= SDate)
                       && !(SDate <= GEDate && SDate >= GSDate)
                       && !(EDate <= GEDate && EDate >= GSDate))
                    $(this).remove();
            }
        });
    }
}
//====================================================================================================
function OnClickBtnShowAllStructure() {
    $("#" + MasterObj + "CmbStructureShift").val("0");
    $("#" + MasterObj + "CmbStructure").val("0");
    $("#" + MasterObj + "KCalStrSDate").val("");
    $("#" + MasterObj + "KCalStrEDate").val("");
    $("#" + MasterObj + "KCalStrEDate_txtYear").val("");
    $("#" + MasterObj + "KCalStrEDate_txtMonth").val("");
    $("#" + MasterObj + "KCalStrEDate_txtDay").val("");
    $("#" + MasterObj + "KCalStrSDate_txtDay").val("");
    $("#" + MasterObj + "KCalStrSDate_txtDay").val("");
    $("#" + MasterObj + "KCalStrSDate_txtDay").val("");
    $("#" + MasterObj + "KCalStrEDate_txtCalendar").val("");
    $("#" + MasterObj + "KCalStrSDate_txtCalendar").val("");
    CreateGrdStrustureInfo();
}
//====================================================================================================
function OnClickBtnFilterCredit() {
    var CreditVal = $("#CmbCredit").val();
    var StatusVal = $("#CmbStatus").val();
    CreateGrdDocInfo();
    $("#CmbCredit").val(CreditVal);
    $("#CmbStatus").val(StatusVal);
    //------------------------------------------------------------------------------------------------
    if ($("#CmbCredit").val() != "0" && $("#CmbCredit").val() != "") {
        $("#TblCredit").find("tr").each(function () {
            if ($(this).find("td:eq(0)").text() != $("#CmbCredit").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
    if ($("#CmbStatus").val() != "0" && $("#CmbStatus").val() != "") {
        $("#TblCredit").find("tr").each(function () {
            if ($(this).attr("StatusID") != $("#CmbStatus").val() && $(this).index() != 0)
                $(this).remove();
        });
    }
}
//====================================================================================================
function OnClickBtnShowAllCredit() {
    $("#CmbCredit").val("0");
    $("#CmbStatus").val("0");
    CreateGrdDocInfo();
}
//====================================================================================================
             