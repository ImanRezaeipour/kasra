
$("#divBase").css("height", $(window).height() - 90);
$("#TblCal").css("height", $(window).height() - 100);
$(".CssDayCal").css("width", ($(window).width() - 100) / 7);
$(".CssDayCal").css("height", ($(window).height() - 105) / 5);

$("body").click(function () {
    $("#divBase").css("height", $(window).height() - 90);
    $("#TblCal").css("height", $(window).height() - 100);
    $(".CssDayCal").css("width", ($(window).width() - 100) / 7);
    $(".CssDayCal").css("width", ($(window).height() - 105) / 5);
});
$("#Layer1").removeClass("cssMenu");
$("#Layer1")[0].bgColor = "white";

var oXmlDoc;
var oxmlDocWP;
var xmlNodeWP;
var xmlNodeAtt;
var xmlNodeCredit;
//-----------------------------------------------------------------------------------------------
$(document).ready(function () {
    $("#ImgProgresss").hide();
    $("#divSave").click(function () {
        var StrSave = "<Root>";
        var Code = $("#" + MasterObj + "SpanPageName").attr("Code");
        var PCode = $("#" + MasterObj + "txtInfo").attr("PersonCode");
        var Type = $("#" + MasterObj + "SpanPageName").attr("Type");
        var PID = $("#" + MasterObj + "txtInfo").attr("PersonID");
        var Counter = 1;
        var Date;
        $(".CssDayCalSelect").each(function () {
            Date = $(this).attr("Date").split("/")[2] + "/" + $(this).attr("Date").split("/")[1] + "/" + $(this).attr("Date").split("/")[0];
            StrSave += "<Tb><DD>" + $(this).attr("Date") + "</DD><RowIndex>" + Counter + "</RowIndex><PersonID>" + PID + "</PersonID><PersonCode>" + PCode + "</PersonCode><StartDate>" + Date + "</StartDate><EndDate>" + Date + "</EndDate><Type>" + Type + "</Type><CreditType>" + Code + "</CreditType><StartTime>00:00</StartTime><EndTime>00:00</EndTime><Des></Des><StatusType></StatusType><UserPersonelID>" + PID + "</UserPersonelID></Tb>";
            Counter++;
        });
        StrSave += "</Root>";
        if (StrSave != "<Root></Root>")
            Save(StrSave);

    });

    $("#" + MasterObj + "divToday").click(function () {
        var Today = $("#" + MasterObj + "divToday").attr("Today");
        Today = "1390/10/01";
        var CurrentMonth = $(xmlNodeWP).filter(function () { return $(this).find("SD").text() >= Today && Today >= $(this).find("ED").text(); });

        if ($(CurrentMonth).length > 0)
            SetMonth(CurrentMonth[0]);
    });
    $("#BtnNextWP").click(function () {
        if ($(".CssDayCalSelect").length == 0 || ($(".CssDayCalSelect").length > 0 && confirm("با تغيير دوره تغييرات شما هم از بين ميرود .آيا مايل به ادامه هستيد؟"))) {
            var WPID = $("#tdWP").attr("WID");

            var Next = $(xmlNodeWP).filter(function () {
                return $(this).find("WID").text() == WPID;
            }).next();
            if ($(Next).length > 0) {
                SetMonth(Next[0]);
            }
        }
    });
    $("#BtnExit").click(function () {
        window.close();
    });
    $("#BtnPrevWP").click(function () {
        if ($(".CssDayCalSelect").length == 0 || ($(".CssDayCalSelect").length > 0 && confirm("با تغيير دوره ، تغييرات شما هم از بين ميرود .آيا مايل به ادامه هستيد؟"))) {
            var WPID = $("#tdWP").attr("WID");

            var Next = $(xmlNodeWP).filter(function () {
                return $(this).find("WID").text() == WPID;
            }).prev();
            if ($(Next).length > 0) {
                SetMonth(Next[0]);
            }

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
        $(this).toggleClass("CssDayCal");
        $(this).toggleClass("CssDayCalSelect");
    }));
    $(document).delegate(".CssClickDelete", "click", (function () {
        if (confirm("آيا براي حذف مجوز مطمئن هستيد؟")) {
            DeleteCredit(this);
        }
    }));
});
//-----------------------------------------------------------------------------------------------
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
            Cell.find(".CssDivDay").text("");
            Cell.find(".CssDivData").text("");
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
                    var DivCount = 0;
                    $(xmlNodeCredit).filter(function () { return DateCount >= $(this).find("SD").text() && DateCount <= $(this).find("SD").text(); }).each(function () {
                        Cell.removeClass();
                        Cell.addClass(($(this).find("SID").text() == "203" ? "CssDayCalSelectCredit" : "CssDayCalRavandCredit"));
                        Cell.attr("CID", $(this).find("CID").text());
                        Cell.addClass("CssClickDelete");
                    });
                    StrData += DateCount.split("/")[2] + "&nbsp;";
                    Cell.find(".CssDivDay").text("   " + DateCount.split("/")[2]);

                    $(xmlNodeAtt).filter(function () { return $(this).find("date").text() == DateCount; }).each(function () {
                        Cell.find(".CssDivData:eq(" + DivCount + ")").text($(this).find("Name").text() + "   ");
                        DivCount++;
                    });
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
            ShowMessageSave(Data.d, Str);
            $("#ImgProgresss").hide();
            FilterData();
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
function ShowMessageSave(Data, Savestr) {
    var oxmlDocMSg, xmlNodeMsg;
    var OxmlSaveDoc, xmlNodeSave;
    if (window.ActiveXObject) {
        oxmlDocMSg = new ActiveXObject("Microsoft.XMLDOM")
        oxmlDocMSg.async = "false";
        oxmlDocMSg.loadXML(Data)
    }
    else {
        var parser = new DOMParser(); oxmlDocMSg = parser.parseFromString(Data, 'text/xml');
    }

    if (window.ActiveXObject) {
        OxmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
        OxmlSaveDoc.async = "false";
        OxmlSaveDoc.loadXML(Savestr)
    }
    else {
        var parser = new DOMParser(); OxmlSaveDoc = parser.parseFromString(Savestr, 'text/xml');
    }
    var Result;
    xmlNodeSave = OxmlSaveDoc.selectNodes("/Root/Tb");
    xmlNodeMsg = oxmlDocMSg.selectNodes('/ReportsEntity/ModifyCredit');
    var StrMsg = "";
    $(xmlNodeMsg).filter(function () { return $(this).find("ResultId").text() == 0; }).each(function () {
        Result = this;
        $(xmlNodeSave).filter(function () { return $(this).find("RowIndex").text() == $(Result).find("RowIndex").text(); }).each(function () {
            StrMsg += " تاريخ " + $(this).find("DD").text() + " :مجوز ثبت نشد   \n" + $(Result).find("StrResult").text() + "\n";
        });
    });
    if (StrMsg == "") {
        SetMsg("ذخيره با موفقيت انجام شد");
    }
    else alert(StrMsg);
}
function ShowMessageDelete(Data) {
    var oxmlDocMSg, xmlNodeMsg;
    if (window.ActiveXObject) {
        oxmlDocMSg = new ActiveXObject("Microsoft.XMLDOM")
        oxmlDocMSg.async = "false";
        oxmlDocMSg.loadXML(Data)
    }
    else {
        var parser = new DOMParser(); oxmlDocMSg = parser.parseFromString(Data, 'text/xml');
    }
    xmlNodeMsg = oxmlDocMSg.selectSingleNode("/NewDataSet/ShowMessage");
    if ($(xmlNodeMsg).find("Validate").text() == 1) {
        SetMsg($(xmlNodeMsg).find("Message").text())
        return true;
    }
    else {
        alert($(xmlNodeMsg).find("Message").text())
        return false;
    }
}
function DeleteCredit(Cell) {
    $("#ImgProgresss").show();
    $.ajax({
        type: "POST",
        url: "DailyCredit.aspx/DeleteCredit?SubmitMode=Ajax",
        dataType: "json",
        contentType: "application/json; charset=utf-8",

        data: "{CreditID:'" + $(Cell).attr("CID") + "', CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ",Extended:''}",
        success: function (Data) {
            if (ShowMessageDelete(Data.d))
                FilterData();
            $("#ImgProgresss").hide();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
            $("#ImgProgresss").hide();
        }
    });
}