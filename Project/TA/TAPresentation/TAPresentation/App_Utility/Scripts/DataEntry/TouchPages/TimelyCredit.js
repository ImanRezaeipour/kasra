
var oXmlDoc;
var oxmlDocWP;
var xmlNodeWP;
var xmlNodeAtt;
var xmlNodeCredit;
var SelectedDate;
//-----------------------------------------------------------------------------------------------
$(document).ready(function () {
    $("#ImgProgresss").hide();
    $(".CssHUp").click(function () {
        var Divtime = $("#TblSelectTime").find("tr:eq(2)").find("td:eq(" + $(this).index() + ")").find("div:eq(0)");
        if (parseInt($(Divtime).text()) + 1 <= 23)
            $(Divtime).text(parseInt($(Divtime).text()) + 1);
    });
    $(".CssHDown").click(function () {
        var Divtime = $("#TblSelectTime").find("tr:eq(2)").find("td:eq(" + $(this).index() + ")").find("div:eq(0)");
        if (parseInt($(Divtime).text()) - 1 >= 0)
            $(Divtime).text(parseInt($(Divtime).text()) - 1);
    });
    $(".CssMUp1").click(function () {
        var Divtime = $("#TblSelectTime").find("tr:eq(2)").find("td:eq(" + $(this).index() + ")").find("div:eq(0)");
        if (parseInt($(Divtime).text()) + 1 < 6)
            $(Divtime).text(parseInt($(Divtime).text()) + 1);
    });
    $(".CssMUp2").click(function () {
        var Divtime = $("#TblSelectTime").find("tr:eq(2)").find("td:eq(" + $(this).index() + ")").find("div:eq(0)");
        if (parseInt($(Divtime).text()) + 1 <= 9)
            $(Divtime).text(parseInt($(Divtime).text()) + 1);
    });
    $(".CssBtn").click(function () {
        $(".CssBtnSelect").removeClass("CssBtnSelect");
        $(this).addClass("CssBtnSelect");
        SelectedDate = $(this);
    });
    $("#BtnExit").click(function () {
        window.close();
    });
    $("#BtnSDate").addClass("CssBtnSelect");
    SelectedDate = $("#BtnSDate");

    $("#divSave").click(function () {
        var StrSave = "<Root>";
        var Code = $("#" + MasterObj + "SpanPageName").attr("Code");
        var PCode = $("#" + MasterObj + "txtInfo").attr("PersonCode");
        var Type = $("#" + MasterObj + "SpanPageName").attr("Type");
        var PID = $("#" + MasterObj + "txtInfo").attr("PersonID");
        var STime;
        var ETime;
        STime = parseInt($("#DivSH").text()) < 10 ? "0" + $("#DivSH").text() + ":" + $("#DivSM1").text() + $("#DivSM2").text() : $("#DivSH").text() + ":" + $("#DivSM1").text() + $("#DivSM2").text();
        ETime = parseInt($("#DivEH").text()) < 10 ? "0" + $("#DivEH").text() + ":" + $("#DivEM1").text() + $("#DivEM2").text() : $("#DivEH").text() + ":" + $("#DivEM1").text() + $("#DivEM2").text();
        STime = ReplaceAll(STime, " ", "")
        ETime = ReplaceAll(ETime, " ", "")

        if (checkValidData(STime, ETime)) {
            SDate = $("#SpanEDate").text();
            EDate = $("#SpanSDate").text();
            SDate = SDate.split("/")[2] + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0];
            EDate = EDate.split("/")[2] + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0];
            StrSave = "<Root><Tb><RowIndex>1</RowIndex><PersonID>" + PID + "</PersonID><PersonCode>" + PCode + "</PersonCode><StartDate>" + SDate + "</StartDate><EndDate>" + EDate + "</EndDate><Type>" + Type + "</Type><CreditType>" + Code + "</CreditType><StartTime>" + STime + "</StartTime><EndTime>" + ETime + "</EndTime><Des></Des><StatusType></StatusType><UserPersonelID>" + PID + "</UserPersonelID></Tb></Root>";
            Save(StrSave);
        }
    });

    $("#BtnNextWP").click(function () {
        var WPID = $("#tdWP").attr("WID");
        var Next = $(xmlNodeWP).filter(function () {
            return $(this).find("WID").text() == WPID;
        }).next();
        if ($(Next).length > 0) {
            SetMonth(Next[0]);
        }
    });
    $("#BtnPrevWP").click(function () {
        var WPID = $("#tdWP").attr("WID");
        var Next = $(xmlNodeWP).filter(function () {
            return $(this).find("WID").text() == WPID;
        }).prev();
        if ($(Next).length > 0) {
            SetMonth(Next[0]);
        }
    });
    if (window.ActiveXObject) {
        oxmlDocWP = new ActiveXObject("Microsoft.XMLDOM")
        oxmlDocWP.async = "false";
        oxmlDocWP.loadXML($("#" + MasterObj + "txtWP").val())
    }
    else {
        var parser = new DOMParser(); oxmlDocWP = parser.parseFromString($("#" + MasterObj + "txtData").val(), 'text/xml');
    }
    xmlNodeWP = oxmlDocWP.selectNodes('/NewDataSet/WPTbl')
    //------------------------------------------------------       
    PageLoad();
    CreateGrid();
    $(document).delegate(".CssClick", "click", (function () {
        $(".CssDayCalSelect").removeClass("CssDayCalSelect");
        $(this).addClass("CssDayCalSelect");
        if (SelectedDate != null) {
            $(SelectedDate).find("span:eq(0)").text($(this).attr("Date"));
        }
        SetExtendedInfo(this);
    }));
});
//-----------------------------------------------------------------------------------------------
function SetExtendedInfo(Cell) {
    var DateCount = $(Cell).attr("Date");

    var Str = "";
    $(xmlNodeAtt).filter(function () { return $(this).find("date").text() == DateCount; }).each(function () {
        Str += "<br />" + $(this).find("Name").text();
    });
    Str += "<br />مجوزها: "

    $(xmlNodeCredit).filter(function () { return DateCount >= $(this).find("SD").text() && DateCount <= $(this).find("SD").text(); }).each(function () {
        Str += "<br />" + "از ساعت :" + $(this).find("ST").text() + " تا ساعت : " + $(this).find("ET").text() + ($(this).find("SD").text() == "203" ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif' />" : "<img src='../../../App_Utility/Images/Icons/default_phase_icon.gif' />")
    });
    $("#DivExtended").html(Str);
}
//------------------------------------------------------------------------------------------------
function PageLoad() {
    var SelectValue;
    SelectValue = $(xmlNodeWP).filter(function () {
        return $(this).find("CUW").text() == 1;
    });
    SetMonth(SelectValue[0], 0);
    $("#SpanInfo").append($("#" + MasterObj + "txtInfo").val().split("##")[0]);
    $("#SpanInfo").append("<br />");
    $("#SpanInfo").append($("#" + MasterObj + "txtInfo").val().split("##")[1]);
}
//-----------------------------------------------------------------------------------------------
function CreateGrid() {
    var DayNu = $("#tdWP").attr("DNu");
    var SD = $("#tdWP").attr("SD");
    var ED = $("#tdWP").attr("ED");
    var DateCount = shdAdd(SD, -1);
    var DayNuTmp = DayNu;
    var DateAdd = 0;
    var Cell;
    var StrData = "";

    if (window.ActiveXObject) {
        oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($("#" + MasterObj + "txtData").val())
    }
    else {
        var parser = new DOMParser(); oXmlDoc = parser.parseFromString($("#" + MasterObj + "txtData").val(), 'text/xml');
    }
    xmlNodeAtt = oXmlDoc.selectNodes('/NewDataSet/AttTbl');
    xmlNodeCredit = oXmlDoc.selectNodes('/NewDataSet/CreditTbl');

    for (var RowCount = 1; RowCount < 7; RowCount++) {
        for (var ColumnCount = 0; ColumnCount < 7; ColumnCount++) {
            Cell = $("#TblCal").find("tr:eq(" + RowCount + ")").find("td:eq(" + ColumnCount + ")");
            Cell.html("<div style='font-weight: bold'></div><div></div><div></div><div></div>");
            Cell.removeClass();
            if (DayNuTmp > ColumnCount) {
                Cell.toggleClass("CssDayCalOver");
            }
            else {
                DateCount = shdAdd(DateCount, 1);
                Cell.attr("Date", DateCount);
                if (DateCount <= ED) {
                    Cell.addClass("CssDayCal");
                    Cell.addClass("CssClick");
                    var DivCount = 1;
                    StrData += DateCount.split("/")[2] + "&nbsp;";
                    Cell.text("   " + DateCount.split("/")[2]);

                }
                else {
                    Cell.addClass("CssDayCalOver");
                }
            }
        }
        DayNuTmp = 0;
    }
}
//-----------------------------------------------------------------------------------------------
function FilterData() {
    $("#ImgProgresss").show();
    $.ajax({
        type: "POST",
        url: "DailyCredit.aspx/GetDailyData?SubmitMode=Ajax",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: "{WPID:" + $("#tdWP").attr("WID") + ", MenuItemID:" + $("#" + MasterObj + "txtPageID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ", CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + "}",
        success: function (Data) {
            $("#" + MasterObj + "txtData").val(Data.d);
            CreateGrid();
            $("#ImgProgresss").hide();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
            $("#ImgProgresss").hide();
        }
    });
}
//-----------------------------------------------------------------------------------------------
function Save(Str) {
    $("#ImgProgresss").show();
    $.ajax({
        type: "POST",
        url: "DailyCredit.aspx/SaveData?SubmitMode=Ajax",
        dataType: "json",
        contentType: "application/json; charset=utf-8",

        data: "{StrSave:'" + Str + "', CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ",Extended:''}",
        success: function (Data) {
            ShowMessageSave(Data.d);
            $("#ImgProgresss").hide();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
            $("#ImgProgresss").hide();
        }
    });
}
//-----------------------------------------------------------------------------------------------
function SetMonth(WP, DoFilter) {
    $("#tdWP").html("");
    $("#tdWP").append($(WP).find("WName:eq(0)").text());
    $("#tdWP").append("<div style='font-size:11px'>" + $(WP).find("ED:eq(0)").text() + "-" + $(WP).find("SD:eq(0)").text() + "</div>");
    $("#tdWP").attr("WID", $(WP).find("WID:eq(0)").text());
    $("#tdWP").attr("DNu", $(WP).find("DNu:eq(0)").text());
    $("#tdWP").attr("SD", $(WP).find("SD:eq(0)").text());
    $("#tdWP").attr("ED", $(WP).find("ED:eq(0)").text());
    if (DoFilter != 0)
        FilterData();
}
//-----------------------------------------------------------------------------------------------
function ShowMessageSave(Data) {
    var oxmlDocMSg, xmlNodeMsg;

    if (window.ActiveXObject) {
        oxmlDocMSg = new ActiveXObject("Microsoft.XMLDOM")
        oxmlDocMSg.async = "false";
        oxmlDocMSg.loadXML(Data)
    }
    else {
        var parser = new DOMParser(); oxmlDocMSg = parser.parseFromString(Data, 'text/xml');
    }
    var Result;
    xmlNodeMsg = oxmlDocMSg.selectNodes('/ReportsEntity/ModifyCredit');
    var StrMsg = "";
    $(xmlNodeMsg).filter(function () { return $(this).find("ResultId").text() == 0; }).each(function () {
        StrMsg += " :مجوز ثبت نشد   \n" + $(this).find("StrResult").text() + "\n";
    });
    if (StrMsg == "") {
        SetMsg("ذخيره با موفقيت انجام شد");
    }
    else alert(StrMsg);
}
function checkValidData(STime, ETime) {
    if ($("#SpanSDate").text() == "") {
        alert("تاريخ شروع مجوز را وارد کنيد");
        return false;
    }
    if ($("#SpanEDate").text() == "") {
        $("#SpanEDate").text($("#SpanSDate").text())       
    }
    if ($("#SpanEDate").text() < $("#SpanSDate").text()) {
        alert("زمان شروع مجوز از زمان پايان آن کوچکتر است !!!");
        return false;
    }
    else if (($("#SpanEDate").text() == $("#SpanSDate").text()) && (STime > ETime)) {
        alert("زمان شروع مجوز از زمان پايان آن کوچکتر است !!!");
        return false;
    }
    return true;
}