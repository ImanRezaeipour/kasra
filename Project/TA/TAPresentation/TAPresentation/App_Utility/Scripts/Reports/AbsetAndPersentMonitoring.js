document.body.style.overflowX = "hidden";
document.body.style.overflowY = "hidden";
var Column = 8, Row = 4;
var oInterval = "";
var Counter = 0;
var TimeCount = 0
var RowCount = 0;
var AbsentWithAttendance = 0;
var TblMain;
var whichTable;     
//----------------------------------
$("#" + MasterObj + "cmbDepartment_txtOnChangeFunc").val("OnChangecmbDepartment()");
//--------------TimerForClient------
fnStartInterval();
function     fnStartInterval() {
    if (oInterval == "")
        oInterval = window.setInterval("fnRecycle()", 9000);
    else {
        fnStopInterval();
    }
}
function fnStopInterval() {
    if (oInterval != "") {
        window.clearInterval(oInterval);
        resetVariable();
    }
}
function fnRecycle() {
    onChangeForBrocker();
}
function resetVariable() {
    oInterval = "";
    Counter = 0;
    TimeCount = 0;
}
//---------------------------------
function OnChangecmbDepartment() {
    RowCount = 0;
    $("#" + MasterObj + "txtDepartmentID").val($("#" + MasterObj + "cmbDepartment_txtID").val())
    OnClickFilter();
}
//----------------------------------
function OnClickFilter() {
    if ($("#" + MasterObj + "txtDepartmentID").val() == "") {
        SetMsg("لطفا واحد سازمانی را وارد کنيد")
    }
    else {
        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "AbsetAndPersentMonitoring.aspx/BindGrd?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            
            data: "{DepartmentID:'" + $("#" + MasterObj + "txtDepartmentID").val() + "',CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
            success: function (Data) {
                if(Data.d!='')
                  CreateGrid(Data.d);
                CloseModelPopup();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                CloseModelPopup();
            }
        });
    }
}
//------------------------------------
function CreateGrid(Data) {
    ClearGrid();
    if (Data != "{\"AbsentPresent\" : ]}") {
        var myObjectjson = eval('(' + Data + ')');
        var notValid;
        var row, col, DepartmentName;
        var AbsentCnt = "0", PresentCnt = "0", ValidAbsentCnt = "0";
        whichTable = "AbsentPresent";
        $(myObjectjson.AbsentPresent).each(function () {
            if (this.Validate == "1") {
                //------------اطللاعات اصلی-----------
                DepartmentName = $("#" + MasterObj + "cmbDepartment_txtName").val();
                AbsentCnt = this.AbsentCnt;
                PresentCnt = this.PresentCnt;
                ValidAbsentCnt = this.ValidAbsentCnt;
                //------------------------------------
                RowCount += 1;
                if (this.TotalPerson <= 32) {
                    $(".Bigtr").css("display", "none")
                    $(".Smalltr").css("display", "inline")
                    Column = 8;
                    whichTable = "AbsentPresent";

                }
                //--------برای نمایش گرید بزرگتر برای داده ای بین 32 تا 60
                else {
                    $(".Smalltr").css("display", "none")
                    $(".Bigtr").css("display", "inline")
                    Column = 10;
                    whichTable = "BigAbsentPresent";
                }

                //GiveMatrixInfo-------
                col = (RowCount % Column);
                if (col == 0)
                    col = Column - 1;
                else
                    col -= 1;

                row = Math.ceil((RowCount / Column)) - 1;
                //---------------------
                AddRow(this.PersonelID, this.DisplayName, this.RoleName, this.Date, this.DepartmentName, this.InOutTime, this.PAType, this.Type, this.ImageContent, this.ImageFormat, col, row, whichTable)
            }
            else {
                notValid = 1;
                return
            }
        });
        if (notValid == 1) {
            SetMsg("تعداد واحد انتخاب شده بيشتر از تعداد مجاز است");
            DepartmentName = "";
        }
        if (DepartmentName != "")
            $(".DepartmentName").html(DepartmentName);

        $(".AbsentPresentInfo").append("<table><tr><td style='color:#080896;font-family:B Titr;font-size:14'>حاضرين:</td><td style='color:Green;font-family:B Titr;font-size:14;width:20px' >" + PresentCnt + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين:</td><td style='color:red;font-family:B Titr;font-size:14;width:20px' >" + AbsentCnt + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين با تردد:</td><td style='color:Orange;font-family:B Titr;font-size:14;width:20px' >" + AbsentWithAttendance + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين مجاز:</td><td style='color:#8cbfeb;font-family:B Titr;font-size:14;width:20px' >" + ValidAbsentCnt + "</td>"
        +"</tr></table>");
        AbsentWithAttendance = 0;
    }
}
//------------------------------------
function AddRow(PersonelID, DisplayName, RoleName, Date, DepartmentName, InOutTime, PAType, Type, ImageContent, ImageFormat, col, row, whichTable) {

    var st, et;
    var ObjImg, ObjInfo, ObjTime;

    if (whichTable == "AbsentPresent")
        TblMain = $("#AbsentPresent")
    else
        TblMain = $("#BigAbsentPresent")

    if (InOutTime.split(",").length > 0) {

        st = InOutTime.split(",")[0];
        if (InOutTime.split(",").length % 2 == 0 && Type==2)
            et = InOutTime.split(",")[InOutTime.split(",").length - 1];
        else
            et = "";
    }
    else if (InOutTime != "") {
        st = InOutTime;
        et = "";
    }

    if (whichTable == "AbsentPresent") {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("col", col);
    }
    else {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("col", col);
    }
   
    ObjImg = TblMain.find(".trMain:eq(" + row + ")").find(".DImg:eq(" + col + ")");
    ObjInfo = TblMain.find(".trMain:eq(" + row + ")").find(".DInfo:eq(" + col + ")");
    ObjTime = TblMain.find(".trMain:eq(" + row + ")").find(".DTime:eq(" + col + ")");

    
    //--حضور---
    if (Type == "1") {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
    }
    //--غیبت---
    else if (Type == "2" && InOutTime == "") {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#f73d3d");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#f73d3d");
    }
    //--غیبت با وجود تردد---
    else if (Type == "2" && InOutTime.split(",").length > 0) {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "Orange");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "Orange");
        AbsentWithAttendance += 1;
    }
    //--غیبت مجاز---
    else if (Type == "3") {
        if (whichTable == "AbsentPresent")
            TblMain.find("tr:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#8cbfeb");
        else
            TblMain.find("tr:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#8cbfeb");
    }

    if (ImageFormat != "")
        $(ObjImg).html("<img src='../../App_Utility/Images/Upload/PersonPic/Pic" + PersonelID.toString().trim() + "." + ImageFormat + " ' class='tdStyleImg' />");
    else
        $(ObjImg).html("<img src='/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg' class='tdStyleImg' />");
    
    $(ObjInfo).html("<Div class='tdStyleInfo'>" + DisplayName + " " + PersonelID + "</Div><Div class='tdStyleRole'>" + RoleName + "</Div>")//"<label class='tdStyleInfo'>" + DisplayName + " " + PersonelID + "</label><label class='tdStyleRole'>" + RoleName + "</label>");

    $(ObjTime).html("<label class='tdStyleTimein'>" + st + "</label>&nbsp;&nbsp;&nbsp;&nbsp;<label class='tdStyleTimeout'>" + et + "</label>")//<label class='tdStyleTime'>ساعت ورود :" + InOutTime.split(",").length > 0 ? InOutTime.split(",")[0] : InOutTime + "  ساعت خروج:" + InOutTime.split(",").length > 0 ? InOutTime.split(",")[1] : "" + "</label>");

   
}
//------------------------------------
function ClearGrid() {
    $(".DImg").html("")
    $(".DInfo").html("")
    $(".DTime").html("")
    $(".DepartmentName").html("")
    $(".AbsentPresentInfo").html("")
    $(".tdstyle").css("backgroundColor", "#e7e6ef");
    $(".tdstyleBig").css("backgroundColor", "#e7e6ef");
}
//------------------------------------
function onChangeForBrocker() {
    var DepartmentID = $("#" + MasterObj + "cmbDepartment_txtID").val() == "" ? "0" : $("#" + MasterObj + "cmbDepartment_txtID").val();
    if (DepartmentID != "0") {
        $.ajax({
            type: "POST",
            url: "AbsetAndPersentMonitoring.aspx/RefreshGrd?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",

            data: "{DepartmentID:'" + DepartmentID + "',CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
            success: function (Data) {
                if(Data.d!='')
                  UpdateGrid(Data.d);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
            }
        });
    }
}
//------------------------------------
function UpdateGrid(Data) {
    if (Data != "{\"AbsentPresentFB\" : ]}") {
        var myObjectjson = eval('(' + Data + ')');
        var notValid;
        var row="", col=""
        var PersonelID
        var whichStyle

        $(myObjectjson.AbsentPresentFB).each(function () {
            if (whichTable == "AbsentPresent")
                whichStyle = $(".tdstyle")
            else
                whichStyle = $(".tdstyleBig")

            PersonelID = this.PersonelID
            whichStyle.filter(function () { return $(this).attr("PersonelID") == PersonelID }).each(function () {
                row = $(this).attr("row");
                col = $(this).attr("col");
            });
            if (row != "" && col != "") {
                TblMain.find(".trMain:eq(" + row + ")").find(".DImg:eq(" + col + ")").html("");
                TblMain.find(".trMain:eq(" + row + ")").find(".DInfo:eq(" + col + ")").html("");
                TblMain.find(".trMain:eq(" + row + ")").find(".DTime:eq(" + col + ")").html("");
                AddRow(this.PersonelID, this.DisplayName, this.RoleName, this.Date, this.DepartmentName, this.InOutTime, this.PAType, this.Type, this.ImageContent, this.ImageFormat, col, row)
                row = "";
                col = "";
            }
        });
    }
}
//------------------------------------