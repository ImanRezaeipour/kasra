var LastSelectedRow = null;
var LastSelectedRowClass = "";
//*******************************************************************************************
$(document).ready(function () {
    document.getElementById("ctl00_ProgressState").value = 1;
    $(".CssTabStyle").click(function () {
        $(".CssTabStyle").removeClass("SelectedTabStyle");
        $(this).addClass("SelectedTabStyle");
        $(".CssGrdStyle").css("display", "none");
        var TblID = "TBL" + $(this).attr("id");
        $("#" + TblID).css("display", "inline");
        if ($(this).attr("hasload") == "0") {
            LoadTab(this);
        }
    });
    //----انتخاب اولین تب در لود اولیه
    if ($("#" + MasterObj + "txtSubmit").val() == "CalculateEnd")
        $("#GrdEnd").click();
    else
        $("#GrdCard").click();
});
//----------------------------------------------------------
function LoadTab(SelectedTab) {
    eval("Get" + $(SelectedTab).attr("id") + "();");
    $(SelectedTab).attr("hasload", "1");
}
//--------------------------------------------------گرید محاسبه تا مرحله زوج کردن کارتها
function ClearGrdCard() {
   $("#TBLGrdCard").find(".CssRowCard").remove();
}
//--------------------------------------------------
function AddRowStructure(RowInfo) {
    var TaradodStyle = RowInfo.InOutColor;
    while (TaradodStyle.indexOf('&quot') != -1) {
        TaradodStyle = TaradodStyle.replace('&quot', '"')
    }
    $("#TBLStructure").append("<tr class='CssRowCard'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.date + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.scheduleGroupName + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StructureID + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StructureName + "</td>" +
                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickStructure(this)' DetailCollectionID =" + RowInfo.DetailCollectionID + ">" + RowInfo.Name + "</td>" +
    //                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Name + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + TaradodStyle + "</td>" +
                "</tr>");
}
function AddRowScript(RowInfo) {
    $("#TBLScript").append("<tr class='CssRowCard'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StepName + " </td>" +
                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickScriptName(this)' ScriptID=" + RowInfo.ScriptID + " ScriptType=" + RowInfo.ScriptType + " CategoryID=" + RowInfo.CategoryID + " ScriptSystem=" + RowInfo.ScriptSystem + " CodeID=" + RowInfo.CodeID + ">" + RowInfo.ScriptName + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StartDate + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.EndDate + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Priority + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.scriptGroupName + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Description + "</td>" +
                "</tr>");
}
function AddRowOption(RowInfo) {
    $("#TBLOption").append("<tr class='CssRowCard'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Variable + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Value + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Description + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.SystemName + "</td>" +
                "</tr>");
}
function GetGrdCard() {
    var Date = $("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val();
    var PersonCode = $("#" + MasterObj + "CmbPerson_txtCode").val();
    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "CalculateTrace.aspx/GetCalculateInformation?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{Date:'" + Date + "' ,PersonCode:'" + PersonCode + "' }",
        success: function (Data) {
            $("#" + MasterObj + "txtCardInfo").val(Data.d);
            CreateGrdCard();
            CloseModelPopup();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });

}
function CreateGrdCard() {
    ClearGrdCard();
    var JSonObject;
    if ($("#" + MasterObj + "txtCardInfo").val().split("@@")[0] != "{\"StructureInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCardInfo").val().split("@@")[0] + ')');
        for (var Counter = 0; Counter < JSonObject.StructureInfo.length; Counter++) {
            AddRowStructure(JSonObject.StructureInfo[Counter]);
        }
    }
    if ($("#" + MasterObj + "txtCardInfo").val().split("@@")[1] != "{\"ScriptInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCardInfo").val().split("@@")[1] + ')');
        for (var Counter = 0; Counter < JSonObject.ScriptInfo.length; Counter++) {
            AddRowScript(JSonObject.ScriptInfo[Counter]);
        }
    }
    if ($("#" + MasterObj + "txtCardInfo").val().split("@@")[2] != "{\"OptionInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCardInfo").val().split("@@")[2] + ')');
        for (var Counter = 0; Counter < JSonObject.OptionInfo.length; Counter++) {
            AddRowOption(JSonObject.OptionInfo[Counter]);
        }
    }
}
//-----------------------------------------------------------گرید محاسبه تا آخر 
function ClearGrdEnd() {
    $("#TBLGrdEnd").find(".CssRowEnd").remove();
}
function AddRowCalc(RowInfo) {
    $("#TBLCalc").append("<tr class='CssRowEnd'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StepName + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.ScriptName + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StartDate + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.EndDate + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.kind + "</td>" +
                "<td class='CssDataRowStyle' style='color:" + RowInfo.Color + "'  align='center'>" + RowInfo.Description + "</td>" +
                "</tr>");
}
function GetGrdEnd() {
    var Date = $("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val();
    var PersonCode = $("#" + MasterObj + "CmbPerson_txtCode").val();

     OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "CalculateTrace.aspx/GetCalculateProcess?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{Date:'" + Date + "' ,PersonCode:'" + PersonCode + "' }",
        success: function (Data) {
            $("#" + MasterObj + "txtEndInfo").val(Data.d);
            CreateGrdEnd();
            CloseModelPopup();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}
function CreateGrdEnd() {
    ClearGrdEnd();
    if ($("#" + MasterObj + "txtEndInfo").val().toString() != "{\"CalcInfo\" : ]}") {
        var JSonObject = eval('(' + $("#" + MasterObj + "txtEndInfo").val() + ')');
        for (var Counter = 0; Counter < JSonObject.CalcInfo.length; Counter++) {
            AddRowCalc(JSonObject.CalcInfo[Counter]);
        }
    }
}
//----------------------------------------------------گرید نتایج کدها 
function ClearGrdCode() {
    $("#TBLGrdCode").find(".CssRowCode").remove();
}
function AddRowFirstCode(RowInfo) {
    var m = '';
    if (RowInfo.Hozor == '10001')
        m = "<img id='ImgHozor' src='../../App_Utility/Images/Icons/BlueTick.gif' />";

    var HasScript = '';
    if (RowInfo.ScriptID != '0')
        HasScript = "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickScriptName(this)' ScriptID=" + RowInfo.ScriptID + " ScriptSystem=" + RowInfo.ScriptSystem + " CategoryID=" + RowInfo.CategoryID + " ScriptType=" + RowInfo.ScriptType + " CodeID=" + RowInfo.Code + ">" + RowInfo.ScriptName + "</td>";
    else
        HasScript = "<td class='CssDataRowStyle'  align='center' >" + RowInfo.ScriptName + "</td>";
    

    $("#TBLFisrtCode").append("<tr class='CssRowCode'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Date + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StartTime + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.EndTime + "</td>" +

                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StructType + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + m + "</td>" +

                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickValue(this)' >" + RowInfo.value + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.TimeValue + "</td>" +

                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Code + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.CodeName + "</td>" +
                 "<td class='CssDataRowStyle'  align='center'>" + RowInfo.FinalCode + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.FinalCodename + "</td>" +
                 "<td class='CssDataRowStyle'  align='center'>" + RowInfo.sourceStep + "</td>" +
                 HasScript+
               "</tr>");
}
function AddRowTimeCode(RowInfo) {
    var HasScript = '';
    if (RowInfo.ScriptID != '0')
        HasScript = "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickScriptName(this)' ScriptID=" + RowInfo.ScriptID + " ScriptSystem=" + RowInfo.ScriptSystem + " CategoryID=" + RowInfo.CategoryID + " ScriptType=" + RowInfo.ScriptType + " CodeID=" + RowInfo.Code + ">" + RowInfo.ScriptName + "</td>";
    else
        HasScript = "<td class='CssDataRowStyle'  align='center' >" + RowInfo.ScriptName + "</td>";
    
    $("#TBLTimeCode").append("<tr class='CssRowCode'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.date + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.StartTime + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.EndTime + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.FinalCode + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.CodeName + "</td>" +
                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickValue(this)' >" + RowInfo.value + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.TimeValue + "</td>" + /*مقدار ساعتی*/
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.sourceStep + "</td>" +
                HasScript+
                "</tr>");
}
function AddRowDailyCode(RowInfo) {
    var HasScript = '';
    if (RowInfo.ScriptID != '0')
        HasScript = "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickScriptName(this)' ScriptID=" + RowInfo.ScriptID + " ScriptSystem=" + RowInfo.ScriptSystem + " CategoryID=" + RowInfo.CategoryID + " ScriptType=" + RowInfo.ScriptType + " CodeID=" + RowInfo.Code + ">" + RowInfo.ScriptName + "</td>";
    else 
        HasScript = "<td class='CssDataRowStyle'  align='center' >" + RowInfo.ScriptName + "</td>";
    
    $("#TBLDailyCode").append("<tr class='CssRowCode'>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.date + " </td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.Code + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.CodeName + "</td>" +
                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickValue(this)'>" + RowInfo.value + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.TimeValue + "</td>" +
                "<td class='CssDataRowStyle'  align='center'>" + RowInfo.sourceStep + "</td>" +
                 HasScript +
                "</tr>");
}
function AddRowPeriodCode(RowInfo) {
    var HasScript = '';
    if (RowInfo.ScriptID != '0')
        HasScript = "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickScriptName(this)' ScriptID=" + RowInfo.ScriptID + " ScriptSystem=" + RowInfo.ScriptSystem + " CategoryID=" + RowInfo.CategoryID + " ScriptType=" + RowInfo.ScriptType + " CodeID=" + RowInfo.Code + ">" + RowInfo.ScriptName + "</td>";
    else
        HasScript = "<td class='CssDataRowStyle'  align='center' >" + RowInfo.ScriptName + "</td>";
    
    $("#TBLPeriodCode").append("<tr class='CssRowCode' onclick='onclickGrid(this)' >" +
                "<td class='CssDataRowStyle'  align='center' >" + RowInfo.WorkPeriodName + " </td>" +
                "<td class='CssDataRowStyle'  align='center' >" + RowInfo.Code + "</td>" +
                "<td class='CssDataRowStyle'  align='center' >" + RowInfo.CodeName + "</td>" +
                "<td class='CssDataRowStyle'  align='center' style='border-right-color: #000000;color:blue;cursor:hand;text-decoration:underline' onclick='onclickValue(this)'>" + RowInfo.value + "</td>" +
                "<td class='CssDataRowStyle'  align='center' >" + RowInfo.TimeValue + "</td>" +
                "<td class='CssDataRowStyle'  align='center' >" + RowInfo.sourceStep + "</td>" +
                HasScript+
                "</tr>");
}
function GetGrdCode() {
    var Date = $("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val();
    var PersonCode = $("#" + MasterObj + "CmbPerson_txtCode").val();

     OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "CalculateTrace.aspx/GetCalculateCodeResult?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{Date:'" + Date + "' ,PersonCode:'" + PersonCode + "' }",
        success: function (Data) {
            $("#" + MasterObj + "txtCodeInfo").val(Data.d);
            CreateGrdCode();
            CloseModelPopup();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}
function CreateGrdCode() {
    ClearGrdCode();
    var JSonObject;
    if ($("#" + MasterObj + "txtCodeInfo").val().split("@@")[0] != "{\"FirstCodeInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCodeInfo").val().split("@@")[0] + ')');
        for (var Counter = 0; Counter < JSonObject.FirstCodeInfo.length; Counter++) {
            AddRowFirstCode(JSonObject.FirstCodeInfo[Counter]);
        }
    }
    if ($("#" + MasterObj + "txtCodeInfo").val().split("@@")[1] != "{\"TimeCodeInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCodeInfo").val().split("@@")[1] + ')');
        for (var Counter = 0; Counter < JSonObject.TimeCodeInfo.length; Counter++) {
            AddRowTimeCode(JSonObject.TimeCodeInfo[Counter]);
        }
    }
    if ($("#" + MasterObj + "txtCodeInfo").val().split("@@")[2] != "{\"DailyCodeInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCodeInfo").val().split("@@")[2] + ')');
        for (var Counter = 0; Counter < JSonObject.DailyCodeInfo.length; Counter++) {
            AddRowDailyCode(JSonObject.DailyCodeInfo[Counter]);
        }
    }
    if ($("#" + MasterObj + "txtCodeInfo").val().split("@@")[3] != "{\"PeriodCodeInfo\" : ]}") {
        JSonObject = eval('(' + $("#" + MasterObj + "txtCodeInfo").val().split("@@")[3] + ')');
        for (var Counter = 0; Counter < JSonObject.PeriodCodeInfo.length; Counter++) {
            AddRowPeriodCode(JSonObject.PeriodCodeInfo[Counter]);
        }
    }
}
//----------------------------------------------------ToolBar---------------------
function OnClickBtnFilter() {
    $(".CssTabStyle").each(function () { $(this).attr("hasload", "0"); });
    $(".CssTabStyle").filter(function () { return $(this).hasClass("SelectedTabStyle") }).each(function () {
        LoadTab(this);
    });
}
//-mohasebe ta zoj kardane kartha-------------------------------------------------------------------
function OnClickBtnCalcCard() {
    $("#GrdCard").click();
    $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
    $("#" + MasterObj + "txtEndStep").val("2");
    $("#" + MasterObj + "txtSubmit").val("CalculateCard")
    $("#" + MasterObj + "BtnSubmit").click()
}
//-mohasebe End-------------------------------------------------------------------
function OnClickBtnCalc() {
    $("#GrdEnd").click();
    $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
    $("#" + MasterObj + "txtEndStep").val("4");
    $("#" + MasterObj + "txtSubmit").val("CalculateEnd")
    $("#" + MasterObj + "BtnSubmit").click()
}
//---------------------------------------Link-------------------------------
function onclickValue(SelectTd) {
    var RunScript = '';
    var ScriptName = '';
    var CodeID = '';

    onclickGrid($(SelectTd).parent(0));
    if ($(SelectTd).parent(0).parent(0).parent(0).parent(0).find("TABLE").attr("id") == "TBLFisrtCode") {
        RunScript = "31";
        ScriptName = $(LastSelectedRow).find("td:eq(" + 10 + ")").text();
        CodeID = $(LastSelectedRow).find("td:eq(" + 9 + ")").text();
    }
    if ($(SelectTd).parent(0).parent(0).parent(0).parent(0).find("TABLE").attr("id") == "TBLTimeCode") {
        RunScript = "32";
        ScriptName = $(LastSelectedRow).find("td:eq(" + 9 + ")").text();
        CodeID = $(LastSelectedRow).find("td:eq(" + 3 + ")").text();
    }
    if ($(SelectTd).parent(0).parent(0).parent(0).parent(0).find("TABLE").attr("id") == "TBLDailyCode") {
        RunScript = "34";
        ScriptName = $(LastSelectedRow).find("td:eq(" + 6 + ")").text();
        CodeID = $(LastSelectedRow).find("td:eq(" + 1 + ")").text();
    }
    if ($(SelectTd).parent(0).parent(0).parent(0).parent(0).find("TABLE").attr("id") == "TBLPeriodCode") {
        RunScript = "40";
        ScriptName = $(LastSelectedRow).find("td:eq(" + 6 + ")").text();
        CodeID = $(LastSelectedRow).find("td:eq(" + 1 + ")").text();
    }
    //--------------------------------------------------------------
    var Date = $("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val();
    var url = "/TAPresentation/App_Pages/SystemTrace/TraceResult.aspx?PersonCode=" + $("#" + MasterObj + "CmbPerson_txtCode").val()
                + "&Date=" + Date
                + "&ScriptName=" + ScriptName
                + "&SourceStepID=" + RunScript //$(LastSelectedRow).find("td:eq(" + 5 + ")").text();
                + "&CodeID=" + CodeID;
    var winPro = "dialogWidth:1300px;dialogHeight:800px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes"
    DailyInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro);
}
//-----------------------------------------------------------------------
function onclickGrid(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyles');

}
//-------sp=uspGetAllWPResult------------------------------------------------------------------
function onclickScriptName(SelectTd) {
    //alert($(SelectTd).parent(0).context.innerText)
    onclickGrid($(SelectTd).parent(0));
    if ($(SelectTd).attr("ScriptType") == 1) {
        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + $(SelectTd).attr("CodeID")
            + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val())
            + "&New=0&System=1";  //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }
    else if ($(SelectTd).attr("ScriptType") == 2) {//قانون هاي الگويي

        var strUrl = "../../App_Pages/BaseInfo/ScriptTemplateNew.aspx?ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&ViewMode=1"
            + "&ScriptID=" + $(SelectTd).attr("ScriptID")
            + '&CategoryID=' + $(SelectTd).attr("CategoryID")
            + "&System=" + $(SelectTd).attr("ScriptSystem")
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val());
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')
    }
    else if ($(SelectTd).attr("ScriptType") == 3) {//قانون هاي عادي
        var url = "/TAPresentation/App_Pages/BaseInfo/ScriptsNew.aspx?ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&ViewMode=1"
            + "&ScriptID=" + $(SelectTd).attr("ScriptID")
            + '&CategoryID=' + $(SelectTd).attr("CategoryID")
            + "&System=" + $(SelectTd).attr("ScriptSystem")
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val());
        var winPro = "dialogWidth:1000px;dialogHeight:800px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        DailyInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro);
    }
    else if ($(SelectTd).attr("ScriptType") == 4) {

        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + $(SelectTd).attr("CodeID")
            + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val())
            + "&New=0&System=1";  //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }
}
//--------------------------------------------------------------
function OnClickBtnDashbordPersoneli() {
    var Date = $("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val();
    var url = "/FrmPresentation/App_Pages/BaseInfo/personelDashboard.aspx"
               + "?SessionID=" + $("#" + MasterObj + "txtSessionID").val()
               + "&PersonCode=" + encode64($("#" + MasterObj + "CmbPerson_txtCode").val())
               + "&Date=" + encode64(Date)
               + "&HashFlag=1";
    var winPro = "dialogHeight:600px;dialogWidth:900px;center: Yes;help: no;status: no"
    window.showModelessDialog(encodeURI(url), window, winPro)

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickStructure(SelectTd) {
    onclickGrid($(SelectTd).parent(0));
    url = "../../App_Pages/Schedule/DifinitionDetailCollection.aspx?StructureID=" + $(LastSelectedRow).find("td:eq(" + 2 + ")").text()
                    + " &SessionID=" + $get(MasterObj + "txtSessionID").value
                    + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                    + "&DetailCollectionID=" + $(SelectTd).attr("DetailCollectionID");
    url = encodeURI(url)
    var rValue = window.showModalDialog(url, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no');

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgGrdStatus(Obj, Tbl, IsLoad) {
    if (IsLoad != 1) {
        switch ($(Obj).attr("statusDisplay")) {
            case "1":
                $(Obj).attr("statusDisplay", "0");
                if ($("#" + Tbl).find("tr").length > 1) {/////////
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                }
                else {
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                }
                //-----------------------------------------------------------------------------
                if ((Obj).id == "ImgShiftStatus" && ShiftCount > 1) {
                    $("#ImgShiftStatus").attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                }
                //-----------------------------------------------------------------------------
                $("#" + Tbl).find("tr").each(function () {//////////
                    $(this).css("display", "none");
                });
                switch (Tbl) {
                    case "TBLFisrtCode":
                        $("#TBLFisrtCode").css("display", "none");
                        break;
                    case "TBLTimeCode":
                        $("#TBLTimeCode").css("display", "none");
                        break;
                    case "TBLDailyCode":
                        $("#TBLDailyCode").css("display", "none");
                        break;
                    case "TBLPeriodCode":
                        $("#TBLPeriodCode").css("display", "none");
                        break;
                }
                break;
            case "0":
                $(Obj).attr("statusDisplay", "1");
                if ($("#" + Tbl).find("tr").length > 1) {//--------------
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddOk.png");
                }
                else {
                    $(Obj).attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                }
                //-----------------------------------------------------------------------------
                if ((Obj).id == "ImgShiftStatus" && ShiftCount > 1) {
                    $("#ImgShiftStatus").attr("src", "../../App_Utility/Images/Icons/AddNoOk.png");
                }
                //-----------------------------------------------------------------------------
                $("#" + Tbl).find("tr").each(function () {//-----------------
                    $(this).css("display", "inline");
                });
                switch (Tbl) {
                    case "TBLFisrtCode":
                        $("#TBLFisrtCode").css("display", "inline");
                        break;
                    case "TBLTimeCode":
                        $("#TBLTimeCode").css("display", "inline");
                        break;
                    case "TBLDailyCode":
                        $("#TBLDailyCode").css("display", "inline");
                        break;
                    case "TBLPeriodCode":
                        $("#TBLPeriodCode").css("display", "inline");
                        break;
                }
                break;
        }
    }
    
}