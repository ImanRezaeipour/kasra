var Symbols;
var PageSize = 15;
var TblFooterWidth = 0;
$(document).ready(function () {
    //    $("#" + MasterObj + "CmbPerson_txtOnChangeFunc").val("OnClickBtnFilter()");
    //    $("#" + MasterObj + "CmbPeriod").change(function () {
    //        OnClickBtnFilter();
    //    });

});
function OnClickBtnFilter(PageFlag) {
    if (PageFlag == undefined || PageFlag == "undefined")
        $("#" + MasterObj + "txtPageNumber").val("1")
    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MonthlyCodeStatusReport.aspx/BindGrid?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{PersonCode:'" + $("#" + MasterObj + "CmbPerson_txtCode").val() + "' , DepartmentID: '" + $("#" + MasterObj + "CmbDepartment_txtID").val() + "',GroupID:'" + $("#" + MasterObj + "CmbGroup_txtCode").val() + "' ,PeriodID:'" + $("#" + MasterObj + "CmbPeriod").val() + "', MenuItemID:'" + $("#" + MasterObj + "txtPageID").val() + "', PageSize:'" + $("#" + MasterObj + "txtPageSize").val() + "', PageNumber:'" + $("#" + MasterObj + "txtPageNumber").val() + "', CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
        success: function (Data) {
            CreateGrid(Data.d);
            CloseModelPopup();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}
//-----------------
function CreateGrid(Data) {
    $("#TbDayName").find("tr").remove();
    $("#TblPerson").find("tr").remove();
    $("#TblDays").find("tr").remove();
    $("#TblSums").find("tr").remove();
    $("#TblSign").find("tr").remove();
    $("#TblHeader").find("tr").remove();
    $("#TblOtherCodes").find("tr").remove();
    var xml;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML(Data);
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString(Data, 'text/xml');
    }
    CreateHeader(xml);
    CreateSign(xml);
    if ($(xml).find("NewDataSet").find("ReportDay").length > 0) {
        $(xml).find("NewDataSet").find("ReportDay").find("RowNumber").filter(function () { return $(this).text() == "1" }).each(function () {
            $("#" + MasterObj + "txtTotalPage").val($(this).siblings("TotalPage").text())
        });

    }
    else {
        $("#" + MasterObj + "txtTotalPage").val("0");
    }
    SetPagingInfo();
    $(xml).find("NewDataSet").find("ReportDay").each(function () {
        AddRow($(this), xml);
    });
    // CreateFooter(xml);
   
}

//------------------------
function AddRow(Obj, xml) {
    $("#TblPerson").append("<tr style='height:20px;' class='CssHeader'><td style='height:20px;' class='CssRowNumber' align='center'>" + Obj.find("RowNumber").text() + "</td><td  style='height:20px;' class='CssHeader' align='right' >" + " &nbsp;&nbsp; " + Obj.find("PersonName").text() + " </td><td style='height:20px;' class='CssHeader'> &nbsp;&nbsp;&nbsp;" + Obj.find("PersonCode").text() + "</td></tr>");
    $("#TblDays").append("<tr></tr>");
    $("#TblSums").append("<tr></tr>");
    var Row = $("#TblDays").find("tr:eq(" + ($("#TblPerson").find("tr").length) + ")");
    var DateName, DateDay, Holiday, HolidayDesc, CodeName, Value, CDay, Flag;
    var Credits = "";

    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             if ($(Obj).find("CDay" + $(this).siblings("Code").text()).text().split(";")[0] == "1") {
                 Holiday = $(this).siblings("Holiday").text()
                 HolidayDesc = $(this).siblings("HolidayDesc").text()
                 DateDay = $(this).siblings("Date").text()
                 DateName = $(this).siblings("FullDayName").text()
                 CDay = $(this).siblings("Code").text()

                 Credits = $(Obj).find("CDay" + CDay).text().split(";")[3]
                 CodeName = $(Obj).find("CDay" + CDay).text().split(";")[1]
                 Value = $(Obj).find("CDay" + CDay).text().split(";")[2]

                 Row.append("<td class='CssCellsStyle'  align='center' style='height:20px;" + (Holiday == 1 ? "background-color:#C5B6C9" : "") + "' title='" + DateDay + "\n" + DateName + " " + HolidayDesc + "\n" + CodeName + ":" + Value + "'>" + CreateHtmlCredit(Credits, CodeName, Value, xml) + "</td>");
             }
             else {
                 Holiday = $(this).siblings("Holiday").text()
                 HolidayDesc = $(this).siblings("HolidayDesc").text()
                 DateDay = $(this).siblings("Date").text()
                 DateName = $(this).siblings("FullDayName").text()
                 CDay = "";
                 Row.append("<td class='CssCellsStyle'  align='center' style='height:20px;" + (Holiday == 1 ? "background-color:#C5B6C9" : "") + "' title='" + DateDay + "\n" + DateName + "\n" + HolidayDesc + "'></td>");
             }
         });
       
    //    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
    //              function () {
    //                  $("#TblSums").find("tr:eq(" + ($("#TblSums").find("tr").length - 1) + ")").append("<td class='CssHeader'  align='center' style='height:20px;' title='" + $(Obj).find("H" + $(this).siblings("Value").text() + "0").text() + "' >" + $(Obj).find("H" + $(this).siblings("Code").text() + "0").text() + "</td>");
    //              });
}
//-------------------
function CreateHtmlCredit(Credits, CodeName, Value, xml) {

    var Code, XmlNode;
    var StrHtml = "";
    var StrOther = "";
    var DefImg = $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "D" }).siblings("Value").text();
    if (Credits != "") {
        Code = Credits;
        XmlNode = $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "S" && $(this).siblings("Code").text() == Code });
        if (XmlNode.length > 0) {
            //            StrHtml += "<img src='../../App_Utility/Images/Symbol/" + XmlNode.siblings("Value").text() + "' title='" + CodeName + ":" + Value + "'/>";
            StrHtml +=  XmlNode.siblings("Value").text() 
        }
        else {
            StrOther += CodeName + ":" + Value + "\n";
        }
    }
    return StrHtml + (StrOther == "" ? "" : DefImg);

}
//------------------------------------------------
function CreateHeader(xml) {
    $("#TblPerson").append("<tr><td class='CssHeader' style='width:50px; height:24px;border-left-style:groove;border-left-width:1px;border-left-color:Black' align='center'>رديف</td><td class='CssHeader' style='width:200px; height:24px' align='center' colspan='2' >نام  و نام خانوادگی </td></tr>");
    $("#TblDays").append("<tr></tr><tr></tr>");
    //    $("#TbDayName").append("<tr></tr>");
    $("#TblSums").append("<tr></tr>");

    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             $("#TblDays").find("tr:eq(0)").append("<td class='CssDayName' style='width:130px;overflow:visible;' align='center'>" + $(this).siblings("DayNames").text() + "</td>");
             $("#TblDays").find("tr:eq(1)").append("<td class='CssHeader' style='width:130px;overflow:visible' align='center'>" + $(this).siblings("Code").text() + "</td>");
         });
    //    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
    //         function () {
    //             $("#TblSums").find("tr:eq(0)").append("<td class='CssHeader' style='width:100px; height:24px' align='center'>" + $(this).siblings("Value").text() + "</td>");
    //         });
}
//--------------------------------
function CreateFooter(xml) {
    $("#TblPerson").append("<tr><td class='CssHeader' style='width:200px;height:20px;' align='center' colspan='3'> جمع</td></tr>");
    $("#TblDays").append("<tr></tr>");
    $("#TblSums").append("<tr></tr>");

    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             $("#TblDays").find("tr:eq(" + ($("#TblDays").find("tr").length - 1) + ")").append("<td class='CssHeader' style='width:50px;height:20px;;overflow:visible' align='center'></td>");
         });
    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
         function () {
             $("#TblSums").find("tr:eq(" + ($("#TblSums").find("tr").length - 1) + ")").append("<td class='CssHeader' style='width:100px;height:20px;' align='center'>" + $(this).siblings("SumVal").text() + "</td>");
         });
}
//----------------------
function CreateSign(xml) {
    $("#TblSign").append("<tr></tr>");
    $("#TblHeader").append("<tr></tr>");
    $("#TblOtherCodes").append("<tr></tr>");
    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "S" }).each(
         function () {
             $("#TblSign").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='right'><div style='float:right'>" + $(this).siblings("CodeName").text() + ":</div><div style=';color:#a11212'>" + $(this).siblings("Value").text() + "</div></td>");
             Symbols += "," + $(this).siblings("Code").text() + ",";
         });
    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "D" }).each(
         function () {
             $("#TblSign").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='right'><div style='float:right'>سایر:</div><div style=';color:#a11212'>" + $(this).siblings("Value").text() + "</div></td>");
         });
    //----------------
    //    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
    //         function () {
    //             $("#TblSign").find("tr:eq(1)").append("<td class='CssHeaderInfo' style='overflow:visible' align='center'><div style='float:right;color:black;'>" + $(this).siblings("Value").text() + ":</div><div>" + $(this).siblings("CodeName").text() + "&nbsp;&nbsp;&nbsp;&nbsp;</div></td>");
    //         });
    $(xml).find("NewDataSet").find("ReportInfo").find("Type").filter(function () { return $(this).text() == "F" }).each(
         function () {
             $("#TblOtherCodes").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='right'><div style='float:right;color:black;'>" + $(this).siblings("CodeName").text() + ":</div><div>" + $(this).siblings("Value").text() + "</div></td>");
         });
}
//----------------------------
function OnClickBtnShowAll() {
    $("#" + MasterObj + "CmbPerson_txtCode").val("")
    $("#" + MasterObj + "CmbPerson_txtPCode").val("")
    $("#" + MasterObj + "CmbPerson_txtName").val("")
    $("#" + MasterObj + "CmbDepartment_txtCode").val("")
    $("#" + MasterObj + "CmbDepartment_txtPCode").val("")
    $("#" + MasterObj + "CmbDepartment_txtName").val("")
    $("#" + MasterObj + "CmbGroup_txtCode").val("")
    $("#" + MasterObj + "CmbGroup_txtPCode").val("")
    $("#" + MasterObj + "CmbGroup_txtName").val("")
    $("#" + MasterObj + "CmbDepartment_txtID").val("")
    $get(MasterObj + "CmbPeriod").selectedIndex = "0"
    OnClickBtnFilter(1);

}
//---------------------------
function OnClickBtnExcel() {
    $("#" + MasterObj + "txtSubmit").val("OneExcel");
    $("#" + MasterObj + "BtnSubmit").click()
}
//---------------------------
function OnClickBtnPDF() {
    $("#" + MasterObj + "txtSubmit").val("OnePDF");
    $("#" + MasterObj + "BtnSubmit").click()
}
//---------------------------
//====================================================CreateGrid==========================
function GetData(direction) {
    switch (direction) {
        case "First": $("#" + MasterObj + "txtPageNumber").val(1); break;
        case "Next": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) + 1); break;
        case "Previous": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) - 1); break;
        case "Last": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#TotalPage").text())); break;
        case "Const": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val())); break;
    }
}
//**************************paging***********************************************
function OnBlurtxtCurPage() {
    $("#txtCurPage").val($("#txtCurPage").val().replace(" ", ""));
    var TotalPage = parseInt($("#TotalPage").text());
    if ($("#txtCurPage").val() != "" && $("#txtCurPage").val() != "0") {
        if (parseInt($("#txtCurPage").val()) > parseInt(TotalPage)) {
            $("#txtCurPage").val(TotalPage);
        }
        GetData('Const')
        //        $("#" + MasterObj + "txtSubmit").val('Const');
        //        $("#" + MasterObj + "BtnSubmit").click();
        OnClickBtnFilter(1);
    }
    else {
        $("#txtCurPage").val("1");
        GetData('Const');
        //        $("#" + MasterObj + "txtSubmit").val('Const');
        //        $("#" + MasterObj + "BtnSubmit").click();
        OnClickBtnFilter(1);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    if (parseInt($("#txtCurPage").val()) < parseInt($("#TotalPage").text())) {
        GetData('Next')
        //        $("#" + MasterObj + "txtSubmit").val('Next');
        //        $("#" + MasterObj + "BtnSubmit").click();
        OnClickBtnFilter(1);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    GetData('Last')
    //    $("#" + MasterObj + "txtSubmit").val('Last');
    //    $("#" + MasterObj + "BtnSubmit").click();
    OnClickBtnFilter(1);
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    if (parseInt($("#txtCurPage").val()) > 1) {
        GetData('Previous')
        //        $("#" + MasterObj + "txtSubmit").val('Last');
        //        $("#" + MasterObj + "BtnSubmit").click();
        OnClickBtnFilter(1);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    GetData('First')
    //    $("#" + MasterObj + "txtSubmit").val('First');
    //    $("#" + MasterObj + "BtnSubmit").click();
    OnClickBtnFilter(1);
}
//*******************************************************************************
function SetPagingInfo() {
    $("#txtCurPage").val($("#" + MasterObj + "txtPageNumber").val());
    $("#TotalPage").text(Math.ceil($("#" + MasterObj + "txtTotalPage").val() / PageSize));

    $("#txtFrom").text((($("#txtCurPage").val() - 1) * PageSize) + 1);

    $("#txtTo").text((($("#txtCurPage").val() - 1) * PageSize) + PageSize > $("#" + MasterObj + "txtTotalPage").val() ? $("#" + MasterObj + "txtTotalPage").val() : (($("#txtCurPage").val() - 1) * PageSize) + PageSize);

    $("#txtTotalRow").text($("#" + MasterObj + "txtTotalPage").val());

    if ($("#txtCurPage").val() == "" | $("#txtCurPage").val() == "0")
        $('#BtnPrv').disabled = true
    else
        $('#BtnPrv').disabled = false;

    if (parseInt($("#txtCurPage").val()) == parseInt($("#TotalPage").text()))
        $('#BtnNext').disabled = true
    else
        $('#BtnNext').disabled = false;

    if (parseInt($("#" + MasterObj + "txtTotalPage").val()) <= PageSize)
        $("#TrFooter").css("display", "none");
    else {
        $("#TrFooter").css("display", "inline");
        $("#TblFooter").css("width", "1310px");
        $("#TblFooter").css("height", "35px");
    }
}
//*******************************************************************************
function onfocusItem(obj) {
    obj.focus();
}
//-------------------------------------------
function OnClickBtnInsertCode() {
    var url = "MonthlyCodeStatusInsertCode.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value;
    var strOptions = "dialogHeight: 390px;dialogWidth: 500px;center: Yes;help: no;status: no"
    var Result = Result = window.showModalDialog(url, "", strOptions);
    if (Result == 1) {
        OnClickBtnFilter(1);
    }
}