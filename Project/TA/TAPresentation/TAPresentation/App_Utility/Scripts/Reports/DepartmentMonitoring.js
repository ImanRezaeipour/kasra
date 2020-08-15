document.body.style.overflowX = "hidden";
document.body.style.overflowY = "hidden";
var widthPage = window.screen.width
var heightPage = window.screen.height
var Column = 8, Row = 4;
var oInterval = "";
var Counter = 0;
var TimeCount = 0
var RowCount = 0;
var AbsentWithAttendance = 0;
var TblMain;
var ColumnChange = 7;
var whichTable = "AbsentPresent";
var PersonNumber, Factor;
var ImgOption, PersonInfoOption, RoleOption, AttendanceOption
var AbsentCnt = "0", PresentCnt = "0", ValidAbsentCnt = "0";
var TimeSign = $("#" + MasterObj + "txtCurrentTime").val().substring(20, 23);

var time = new Date($("#" + MasterObj + "txtCurrentTime").val().substring(0, 20));

//------------------------------------
$(document).ready(function () {
    $(".DateSystem").html($("#" + MasterObj + "txtCurrentDate").val());
    $(".TimeSystem").html(TimeSign+"   "+$("#" + MasterObj + "txtCurrentTime").val());
   
    setInterval('ShowTime()', 1000);

});
//------------------------------------
function ShowTime() {
    time.setTime(time.getTime() + 1000);
    var wtime = formatDate(time);
    $(".TimeSystem").html( TimeSign+"   " +wtime );
}
//----------------------------------
function formatDate(date) {
    var hours = date.getHours().toString();
    if (hours.length < 2) hours = '0' + hours;
    var minutes = date.getMinutes().toString();
    if (minutes.length < 2) minutes = '0' + minutes;
    var seconds = date.getSeconds().toString();
    if (seconds.length < 2) seconds = '0' + seconds;
    return hours + ':' + minutes + ':' + seconds;
}
//----------------------------------
$(".TblMainStyle").css("width", widthPage-100)
//----------------------------------
$("#" + MasterObj + "cmbDepartment_txtOnChangeFunc").val("OnChangecmbDepartment()");
//--------------TimerForClient------
fnStartInterval();
function fnStartInterval() {
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
    $("#" + MasterObj + "txtDepartmentID").val($("#" + MasterObj + "cmbDepartment_txtPCode").val())
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
            url: "DepartmentMonitoring.aspx/BindGrd?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",

            data: "{DepartmentID:'" + $("#" + MasterObj + "txtDepartmentID").val() + "',CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
            success: function (Data) {
                if (Data.d != "") {
                    CreateHeader(Data.d);
                    ClearGrid(Data.d);
                    CreateGrid(Data.d);
                }
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
function CreateHeader(Data) {
    ClearHeader();
    if (Data != "{\"AbsentPresent\" : ]}") {
        var myObjectjson = eval('(' + Data + ')');
        $(myObjectjson.AbsentPresent).each(function () {
            if (this.Validate == "1") {
                $(".MeetingName").html(this.MeetingName)
                $(".StartTime").html(this.TimeOption)
            }
        });
    }
}
//------------------------------------
function ClearHeader() {
    $(".MeetingName").html("")
    $(".StartTime").html("")
}
//------------------------------------
function CreateGrid(Data) {
    
    if (Data != "{\"AbsentPresent\" : ]}") {
        var myObjectjson = eval('(' + Data + ')');
        var notValid;
        var row, col, DepartmentName, whichStyle;


        $(myObjectjson.AbsentPresent).each(function () {
            if (this.Validate == "1") {
                RowCount += 1;

                if (RowCount == 1) {
                    //------------اطللاعات اصلی-----------
                    DepartmentName = $("#" + MasterObj + "cmbDepartment_txtName").val();
                    AbsentCnt = this.AbsentCnt;
                    PresentCnt = this.PresentCnt;
                    ValidAbsentCnt = this.ValidAbsentCnt;
                    //------------------------------------تعیین مقادیر نمایشی در هر سلول
                    ImgOption = this.Image;
                    PersonInfoOption = this.PersonInfo;
                    RoleOption = this.Role;
                    AttendanceOption = this.AttendancePreson;
                    //------------------------------------
                }
                //---------------در حالت عدم نمایش تعداد افراد حاضر
                if (this.ShowPersonNumber == 0) {
                    if (this.TotalPerson <= 34) {
                        if (RowCount == 1) {
                            $(".Bigtr").css("display", "none")
                            $(".BigtrOption").css("display", "none")
                            $(".SmalltrOption").css("display", "none")
                            $(".Smalltr").css("display", "inline")
                            Column = 8;
                            whichTable = "AbsentPresent";
                        }
                    }
                    //--------برای نمایش گرید بزرگتر برای داده ای بین 32 تا 60
                    else {
                        if (RowCount == 1) {
                            $(".Smalltr").css("display", "none")
                            $(".BigtrOption").css("display", "none")
                            $(".SmalltrOption").css("display", "none")
                            $(".Bigtr").css("display", "inline")
                            Column = 10;
                            whichTable = "BigAbsentPresent";
                        }
                    }

                    //GiveMatrixInfo-------
                    col = (RowCount % Column);
                    if (col == 0)
                        col = Column - 1;
                    else
                        col -= 1;

                    row = Math.ceil((RowCount / Column)) - 1;
                    //---------------------

                }
                else {
                    if (RowCount == 1) {
                        //---------------تعیین مقدار ضریب و رنگ مربوط به سلول افراد حاضر
                        if (this.Factor.split("/").length > 0) {
                            Factor = this.Factor.split("/")[0] / this.Factor.split("/")[1]
                            PersonNumber = Factor * this.TotalPerson
                        }
                    }

                    //---------------------------------------------------------------------
                    if (this.TotalPerson <= 34) {
                        if (RowCount == 1) {
                            $(".Bigtr").css("display", "none")
                            $(".BigtrOption").css("display", "none")
                            $(".SmalltrOption").css("display", "inline")
                            $(".Smalltr").css("display", "none")
                            Column = 10;
                            whichTable = "AbsentPresentOption";
                            //----------------------
                            if (PresentCnt >= Math.floor(PersonNumber))
                                $(".PersonNumberDiv").css("color", "Green");
                            else
                                $(".PersonNumberDiv").css("color", "#4c0583");

                            $(".PersonNumberDiv").text(PresentCnt)
                        }
                        //GiveMatrixInfo-------


                        row = Math.ceil((RowCount / Column)) - 1;
                        //----------------مشخص کردن محدوده سطرها بعد از شکستن سلول ها
                        if (RowCount >= 28)
                            row = 3;
                        //-----------------------------------
                        if (row < 2) {
                            col = (RowCount % Column);
                            if (col == 0)
                                col = Column - 1;
                            else
                                col -= 1;
                        }
                        if (row >= 2) {
                            col = (RowCount % ColumnChange);
                        }
                    }
                    else {
                        if (RowCount == 1) {
                            $(".Bigtr").css("display", "none")
                            $(".BigtrOption").css("display", "inline")
                            $(".SmalltrOption").css("display", "none")
                            $(".Smalltr").css("display", "none")
                            Column = 10;
                            whichTable = "BigAbsentPresentOption";
                            //---------------------

                            if (PresentCnt >= Math.floor(PersonNumber))
                                $(".PersonNumberBigDiv").css("color", "Green");
                            else
                                $(".PersonNumberBigDiv").css("color", "#4c0583");

                            $(".PersonNumberBigDiv").html(PresentCnt)
                        }
                        //GiveMatrixInfo-------

                        row = Math.ceil((RowCount / Column)) - 1;

                        //----------------مشخص کردن محدوده سطرها بعد از شکستن سلول ها
                        if (RowCount > 47 && RowCount < 55)
                            row = 5;
                        else if (RowCount > 54 && RowCount < 62)
                            row = 6;
                        else if (RowCount > 61 && RowCount < 68)
                            row = 7;
                        //----------------------------------------
                        if (row < 4) {
                            col = (RowCount % Column);
                            if (col == 0)
                                col = Column - 1;
                            else
                                col -= 1;
                        }
                        else if (row >= 4) {
                            col = (RowCount % ColumnChange);
                            if (col == 6)
                                col = 0;
                            else
                                col += 1;
                        }
                    }
                }
                AddRow(this.PersonelID, this.DisplayName, this.RoleName, this.Date, this.DepartmentName, this.InOutTime, this.PAType, this.Type, this.ImageContent, this.ImageFormat, col, row)
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

        if (whichTable == "AbsentPresent")
            whichStyle = $(".tdstyle")
        else if (whichTable == "BigAbsentPresent")
            whichStyle = $(".tdstyleBig")
        else if (whichTable == "AbsentPresentOption")
            whichStyle = $(".tdstyleOption")
        else
            whichStyle = $(".tdstyleBigOption")

        PresentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#0aaf1d" }).length;
        AbsentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#f73d3d" }).length;
        AbsentWithAttendance = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#f9ba34" }).length;
        ValidAbsentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#8cbfeb" }).length;

        $(".AbsentPresentInfo").append("<table><tr><td style='color:#080896;font-family:B Titr;font-size:14'>حاضرين:</td><td style='color:Green;font-family:B Titr;font-size:14;width:20px' class='PresentPrs' >" + PresentCnt + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين:</td><td style='color:red;font-family:B Titr;font-size:14;width:20px' class='AbsentPrs'  > " + AbsentCnt + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين با تردد:</td><td style='color:Orange;font-family:B Titr;font-size:14;width:20px' class='AbsentWithAttendancePrs' >" + AbsentWithAttendance + "</td>"
        + "<td style='color:#080896;font-family:B Titr;font-size:14'>غايبين مجاز:</td><td style='color:#8cbfeb;font-family:B Titr;font-size:14;width:20px' class='ValidAbsentPrs' >" + ValidAbsentCnt + "</td>"
        + "</tr></table>");
        //AbsentWithAttendance = 0;
    }
}
//------------------------------------
function AddRow(PersonelID, DisplayName, RoleName, Date, DepartmentName, InOutTime, PAType, Type, ImageContent, ImageFormat, col, row) {

    var st, et;
    var ObjImg, ObjInfo, ObjTime, ObjTdImg;

    TblMain = $("#"+whichTable)
    if (InOutTime.split(",").length > 0) {

        st = InOutTime.split(",")[0];
        if (InOutTime.split(",").length % 2 == 0 && Type == 2)
            et = InOutTime.split(",")[InOutTime.split(",").length - 1];
        else
            et = "";
    }
    else if (InOutTime != "") {
        st = InOutTime;
        et = "";
    }
    var widthDiv,heightDiv
    if (whichTable == "AbsentPresent") {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").attr("col", col);
        widthDiv = widthPage / 8 - 30
        heightDiv = heightPage /5 - 60
    }
    else if (whichTable == "BigAbsentPresent") {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").attr("col", col);
        widthDiv = widthPage / 10 - 30
        heightDiv = heightPage / 9 - 50
    }
    else if (whichTable == "AbsentPresentOption") {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").attr("col", col);
        widthDiv = widthPage / 10 - 30
        heightDiv = heightPage / 5 - 50
    }
    else {
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").attr("PersonelID", PersonelID);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").attr("row", row);
        TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").attr("col", col);
        widthDiv = widthPage / 10 - 30
        heightDiv = heightPage / 9 - 50
    }

    ObjImg = TblMain.find(".trMain:eq(" + row + ")").find(".DImg:eq(" + col + ")");
    ObjInfo = TblMain.find(".trMain:eq(" + row + ")").find(".DInfo:eq(" + col + ")");
    ObjTime = TblMain.find(".trMain:eq(" + row + ")").find(".DTime:eq(" + col + ")");

    ObjImg.attr("position", "relative");
    if (PersonInfoOption == 0 && RoleOption == 0 && AttendanceOption == 0) {
        heightDiv = heightDiv + 15;
    }
    ObjImg.css("width", widthDiv+ "px");
    ObjImg.css("height", heightDiv + "px");
    //--حضور---
    if (Type == "1") {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
        else if (whichTable == "BigAbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
        else if (whichTable == "AbsentPresentOption")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").css("backgroundColor", "#0aaf1d");
    }
    //--غیبت---
    else if (Type == "2" && InOutTime == "") {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#f73d3d");
        else if (whichTable == "BigAbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#f73d3d");
        else if (whichTable == "AbsentPresentOption")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").css("backgroundColor", "#f73d3d");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").css("backgroundColor", "#f73d3d");
    }
    //--غیبت با وجود تردد---
    else if (Type == "2" && InOutTime.split(",").length > 0) {
        if (whichTable == "AbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#f9ba34");
        else if (whichTable == "BigAbsentPresent")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#f9ba34");
        else if (whichTable == "AbsentPresentOption")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").css("backgroundColor", "#f9ba34");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").css("backgroundColor", "#f9ba34");

        AbsentWithAttendance += 1;
    }
    //--غیبت مجاز---
    else if (Type == "3") {
        if (whichTable == "AbsentPresent")
            TblMain.find("tr:eq(" + row + ")").find(".tdstyle:eq(" + col + ")").css("backgroundColor", "#8cbfeb");
        else if (whichTable == "BigAbsentPresent")
            TblMain.find("tr:eq(" + row + ")").find(".tdstyleBig:eq(" + col + ")").css("backgroundColor", "#8cbfeb");
        else if (whichTable == "AbsentPresentOption")
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleOption:eq(" + col + ")").css("backgroundColor", "#8cbfeb");
        else
            TblMain.find(".trMain:eq(" + row + ")").find(".tdstyleBigOption:eq(" + col + ")").css("backgroundColor", "#8cbfeb");

    }   

    if (ImageFormat != "")
        $(ObjImg).html("<img src='../../App_Utility/Images/Upload/PersonPic/Pic" + PersonelID.toString().trim() + "." + ImageFormat + " ' style='width:" + widthDiv + "px;height:" + heightDiv + "px' class='tdImagePerson'  />");
    else
        $(ObjImg).html("<img src='/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg' style='width:" + widthDiv + "px;height:" + heightDiv + "px' class='tdImagePerson' />");

    ObjTdImg = TblMain.find(".trMain:eq(" + row + ")").find(".tdImagePerson:eq(" + col + ")");

    if (PersonInfoOption != 0 || RoleOption != 0) {
        var DisplayDivPerson = PersonInfoOption == 0 ? "none" : "inline";
        var DisplayDivRole = RoleOption == 0 ? "none" : "inline";
        $(ObjInfo).html("<Div class='tdStyleInfo' style='Display:" + DisplayDivPerson + "'>" + DisplayName + " " + PersonelID + "</Div><Div class='tdStyleRole' style='Display:" + DisplayDivRole + "' >" + RoleName + "</Div>")//"<label class='tdStyleInfo'>" + DisplayName + " " + PersonelID + "</label><label class='tdStyleRole'>" + RoleName + "</label>");
    }
    if (AttendanceOption != 0)
        $(ObjTime).html("<label class='tdStyleTimein'>" + st + "</label>&nbsp;&nbsp;&nbsp;&nbsp;<label class='tdStyleTimeout'>" + et + "</label>"); //<label class='tdStyleTime'>ساعت ورود :" + InOutTime.split(",").length > 0 ? InOutTime.split(",")[0] : InOutTime + "  ساعت خروج:" + InOutTime.split(",").length > 0 ? InOutTime.split(",")[1] : "" + "</label>")
    else {
        $(ObjTime).css("display", "none");
    }
    
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
            url: "DepartmentMonitoring.aspx/RefreshGrd?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",

            data: "{DepartmentID:'" + DepartmentID + "',CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
            success: function (Data) {
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
    widthPage = window.screen.width
    $(".TblMainStyle").css("width", widthPage - 100)
    if (Data != "{\"AbsentPresentFB\" : ]}" && Data != "") {
        var myObjectjson = eval('(' + Data + ')');
        var notValid;
        var row = "", col = ""
        var PersonelID
        var whichStyle
        var Type

        $(myObjectjson.AbsentPresentFB).each(function () {
            if (whichTable == "AbsentPresent")
                whichStyle = $(".tdstyle")
            else if (whichTable == "BigAbsentPresent")
                whichStyle = $(".tdstyleBig")
            else if (whichTable == "AbsentPresentOption")
                whichStyle = $(".tdstyleOption")
            else
                whichStyle = $(".tdstyleBigOption")

            //------------------------------------------------
            PersonelID = this.PersonelID
            whichStyle.filter(function () { return $(this).attr("PersonelID") == PersonelID }).each(function () {
                row = $(this).attr("row");
                col = $(this).attr("col");
            });
            if (row != "" && col != "") {
                //------------------------------------تعیین مقادیر نمایشی در هر سلول
                ImgOption = this.Image;
                PersonInfoOption = this.PersonInfo;
                RoleOption = this.Role;
                AttendanceOption = this.AttendancePreson;
                //------------------------------------
                TblMain.find(".trMain:eq(" + row + ")").find(".DImg:eq(" + col + ")").html("");
                TblMain.find(".trMain:eq(" + row + ")").find(".DInfo:eq(" + col + ")").html("");
                TblMain.find(".trMain:eq(" + row + ")").find(".DTime:eq(" + col + ")").html("");
                AddRow(this.PersonelID, this.DisplayName, this.RoleName, this.Date, this.DepartmentName, this.InOutTime, this.PAType, this.Type, this.ImageContent, this.ImageFormat, col, row)
                row = "";
                col = "";
            }

        });
        PresentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#0aaf1d" }).length;
        AbsentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#f73d3d" }).length;
        AbsentWithAttendance = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#f9ba34" }).length;
        ValidAbsentCnt = whichStyle.filter(function () { return $(this).css("backgroundColor") == "#8cbfeb" }).length;
        $(".PresentPrs").html(PresentCnt);
        $(".AbsentPrs").html(AbsentCnt);
        $(".AbsentWithAttendancePrs").html(AbsentWithAttendance);
        $(".ValidAbsentPrs").html(ValidAbsentCnt);
        if (whichTable == "AbsentPresentOption")
            $(".PersonNumberDiv").html(PresentCnt)
        else if (whichTable == "BigAbsentPresentOption")
            $(".PersonNumberBigDiv").html(PresentCnt)
        //----------------------بدست آوردن تعداد حاضرین
        Type = this.Type
        if (Type == "1") {
            if (whichTable == "AbsentPresentOption") {
                if (PresentCnt >= PersonNumber)
                    $(".PersonNumberDiv").css("color", "Green");
                else
                    $(".PersonNumberDiv").css("color", "#4c0583");
            }
            else if (whichTable == "BigAbsentPresentOption") {
                if (PresentCnt >= PersonNumber)
                    $(".PersonNumberBigDiv").css("color", "Green");
                else
                    $(".PersonNumberBigDiv").css("color", "#4c0583");
            }
        }
    }
}
//------------------------------------
function onClickSelectOption() {
    var DialogProperty = "dialogHeight:220px;dialogWidth:800px;center: Yes;help: no;status: no;resizable=1";

    var url = "../../App_Pages/Reports/DepartmentMonitoringOption.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val();
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
}
//--------------for Dont Display Stop Script-------------
RepeatingOperation = function (op, yieldEveryIteration) {

    //keeps count of how many times we have run heavytask() 
    //before we need to temporally check back with the browser.
    var count = 0;

    this.step = function () {

        //Each time we run heavytask(), increment the count. When count
        //is bigger than the yieldEveryIteration limit, pass control back 
        //to browser and instruct the browser to immediately call op() so
        //we can pick up where we left off.  Repeat until we are done.
        if (++count >= yieldEveryIteration) {
            count = 0;

            //pass control back to the browser, and in 1 millisecond, 
            //have the browser call the op() function.  
            setTimeout(function () { op(); }, 1, [])

            //The following return statement halts this thread, it gives 
            //the browser a sigh of relief, your long-running javascript
            //loop has ended (even though technically we havn't yet).
            //The browser decides there is no need to alarm the user of
            //an unresponsive javascript process.
            return;
        }
        op();
    };
};
process30000HeavyTasks = function () {
    var len =30000;
    for (var i = len - 1; i >= 0; i--) {
        heavytask();   //heavytask() can be run about 20  times before
        //an 'unresponsive script' dialog appears.
        //If heavytask() is run more than 20 times in one
        //javascript thread, the browser informs the user that
        //an unresponsive script needs to be dealt with.  

        //This is where we need to terminate this long running
        //thread, instruct the browser not to panic on an unresponsive
        //script, and tell it to call us right back to pick up
        //where we left off.
    }
}
process30000HeavyTasks = function () {

    var global_i = 30000; //initialize your 'for loop stepper' (i) here.

    var repeater = new this.RepeatingOperation(function () {

        heavytask();

        if (--global_i >= 0) {     //Your for loop conditional goes here.
            repeater.step();        //while we still have items to process,
            //run the next iteration of the loop.
        }
    }, 10);                   //10 means process 10 heavytask(), then
    //yield back to the browser, and have the
    //browser call us right back.

    repeater.step();          //this command kicks off the recursive closure.

};