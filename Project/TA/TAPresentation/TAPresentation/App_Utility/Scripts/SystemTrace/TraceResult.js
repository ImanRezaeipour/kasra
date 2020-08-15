var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
//document.body.scroll = "no";
function onload() {
    OnClickBtnFilter();
}
//----------------------------------------------------ToolBar---------------------
function OnClickBtnFilter() {
    LastSelectedRow = "";
    $("#" + MasterObj + "txtTraceStep").val("-1")
    $("#" + MasterObj + "txtTraceStep1").val("1-")
    $("#" + MasterObj + "txtpersonCode").val($("#" + MasterObj + "CmbPerson_txtCode").val());
    $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
    $("#" + MasterObj + "txtCode").val($("#" + MasterObj + "CmbCode_txtCode").val());
    $("#" + MasterObj + "txtScript").val($("#" + MasterObj + "CmbScriptName").val());
    $("#" + MasterObj + "txtStep").val($("#" + MasterObj + "cmbStep").val());
    $("#" + MasterObj + "txtGroupCode").val($("#" + MasterObj + "CmbGroupCode").val());
    if ($("#" + MasterObj + "txtpersonCode").val() == "" || $("#" + MasterObj + "txtDate").val() == "") {
        alert('لطفا پرسنل و تاریخ را وارد کنید')
    } else {
        $("#" + MasterObj + "txtSubmit").val("Filter")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//-----------------------------------------------------------------------
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('class', 'CssSelectedItemStyles1');
}
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    var oRow = window.event.srcElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }
    oRow = oRow.parentElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }

    if (oRow.id == MasterObj + "GrdFirstCode") {
        if (obj.value != 0 && obj.value.replace(" ", "") != "")
            $("#" + MasterObj + "txtCurPage").val(obj.value);
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit").click();
    }
    if (oRow.id == MasterObj + "GrdTimeCode") {
        if (obj.value != 0 && obj.value.replace(" ", "") != "")
            $("#" + MasterObj + "txtCurPage1").val(obj.value);
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit1").click();
    }
    if (oRow.id == MasterObj + "GrdDailyCode") {
        if (obj.value != 0 && obj.value.replace(" ", "") != "")
            $("#" + MasterObj + "txtCurPage2").val(obj.value);
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit2").click();
    }
    if (oRow.id == MasterObj + "GrdPeriodCode") {
        if (obj.value != 0 && obj.value.replace(" ", "") != "")
            $("#" + MasterObj + "txtCurPage3").val(obj.value)
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit3").click();
    }

}

//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    var oRow = window.event.srcElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }
    oRow = oRow.parentElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }

    if (oRow.id == MasterObj + "GrdFirstCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnNext");
        $("#" + MasterObj + "BtnSubmit").click();
    }
    if (oRow.id == MasterObj + "GrdTimeCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnNext");
        $("#" + MasterObj + "BtnSubmit1").click();
    }
    if (oRow.id == MasterObj + "GrdDailyCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnNext");
        $("#" + MasterObj + "BtnSubmit2").click();
    }
    if (oRow.id == MasterObj + "GrdPeriodCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnNext");
        $("#" + MasterObj + "BtnSubmit3").click();
    }

}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    var oRow = window.event.srcElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }
    oRow = oRow.parentElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }

    if (oRow.id == MasterObj + "GrdFirstCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnLast")
        $("#" + MasterObj + "BtnSubmit").click()
    }
    if (oRow.id == MasterObj + "GrdTimeCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnLast")
        $("#" + MasterObj + "BtnSubmit1").click()
    }
    if (oRow.id == MasterObj + "GrdDailyCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnLast")
        $("#" + MasterObj + "BtnSubmit2").click()
    }
    if (oRow.id == MasterObj + "GrdPeriodCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnLast")
        $("#" + MasterObj + "BtnSubmit3").click()
    }

}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    var oRow = window.event.srcElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }
    oRow = oRow.parentElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }

    if (oRow.id == MasterObj + "GrdFirstCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnPrev")
        $("#" + MasterObj + "BtnSubmit").click()
    }
    if (oRow.id == MasterObj + "GrdTimeCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnPrev")
        $("#" + MasterObj + "BtnSubmit1").click()
    }
    if (oRow.id == MasterObj + "GrdDailyCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnPrev")
        $("#" + MasterObj + "BtnSubmit2").click()
    }
    if (oRow.id == MasterObj + "GrdPeriodCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnPrev")
        $("#" + MasterObj + "BtnSubmit3").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    var oRow = window.event.srcElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }
    oRow = oRow.parentElement
    for (var i = 0; oRow.tagName != "TABLE"; i++) {
        oRow = oRow.parentElement
    }

    if (oRow.id == MasterObj + "GrdFirstCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit").click()
    }
    if (oRow.id == MasterObj + "GrdTimeCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit1").click()
    }
    if (oRow.id == MasterObj + "GrdDailyCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit2").click()
    }
    if (oRow.id == MasterObj + "GrdPeriodCode") {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit3").click()
    }
}

//=========================Move Level Toolbar======================================================================
var NextLevel = '111';
var BackLevel = '111';
var FirstLevel = '111';
var LastLevel = '111';
function OnClickBtnFirstLevel() {
    LastLevel = '111';
    if (FirstLevel == '111') {
        if (LastSelectedRow == "" || LastSelectedRow == null) {
            alert(" لطفا يک سطر را انتخاب کنيد");
            return;
        } else {
            $("#" + MasterObj + "txtTraceStep").val("0")

            $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
            $("#" + MasterObj + "txtSubmit").val("FirstLevel");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        FirstLevel = '0';
    }
    $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
    BackLevel = '0';
    NextLevel = '0';
}
//---------------------------------------------
function OnClickBtnBackLevel() {
    LastLevel = '111';
    FirstLevel = '111';
    if (NextLevel != '111')
        BackLevel = NextLevel;
    NextLevel = '111';
    if (LastSelectedRow == "" || LastSelectedRow == null) {
        alert(" لطفا يک سطر را انتخاب کنيد");
        return;
    } else {
        if (BackLevel == '111') {
            $("#" + MasterObj + "txtTraceStep").val($(LastSelectedRow).attr("TraceStepID"))
            if ($("#" + MasterObj + "txtTraceStep").val() == '0')
                return;
            else {
                var k = parseInt($("#" + MasterObj + "txtTraceStep").val())

                k = k - 1;
                $("#" + MasterObj + "txtTraceStep").val(k);

                $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
                $("#" + MasterObj + "txtSubmit").val("BackLevel");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        } else {
            $("#" + MasterObj + "txtTraceStep").val(BackLevel);
            if ($("#" + MasterObj + "txtTraceStep").val() == '0')
                return;
            else {
                var k = parseInt($("#" + MasterObj + "txtTraceStep").val())

                k = k - 1;
                $("#" + MasterObj + "txtTraceStep").val(k);
                $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
                $("#" + MasterObj + "txtSubmit").val("BackLevel");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        BackLevel = $("#" + MasterObj + "txtTraceStep").val();
    }
    $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
}
//---------------------------------------------     
function OnClickBtnNextLevel() {
    LastLevel = '111';
    FirstLevel = '111';
    if (BackLevel != '111')
        NextLevel = BackLevel;
    BackLevel = '111';
    var traceStep = "0"; //if Select grid ==null then traceStep=+1
    if (LastSelectedRow == "" || LastSelectedRow == null) {
        alert(" لطفا يک سطر را انتخاب کنيد");
        return;
    } else {
        if (NextLevel == '111') {
            $("#" + MasterObj + "txtTraceStep").val($(LastSelectedRow).attr("TraceStepID"))
            if ($("#" + MasterObj + "txtTraceStep").val() == $(LastSelectedRow).attr("TraceStepIDMax"))
                return;
            else {
                var k = parseInt($("#" + MasterObj + "txtTraceStep").val())

                k = k + 1;
                $("#" + MasterObj + "txtTraceStep").val(k);
                $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
                $("#" + MasterObj + "txtSubmit").val("NextLevel");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        } else {
            $("#" + MasterObj + "txtTraceStep").val(NextLevel);
            if ($("#" + MasterObj + "txtTraceStep").val() == $(LastSelectedRow).attr("TraceStepIDMax"))
                return;
            else {
                var k = parseInt($("#" + MasterObj + "txtTraceStep").val())

                k = k + 1;
                $("#" + MasterObj + "txtTraceStep").val(k);
                $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
                $("#" + MasterObj + "txtSubmit").val("NextLevel");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        NextLevel = $("#" + MasterObj + "txtTraceStep").val();
    }
    $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
}
//---------------------------------------------
function OnClickBtnLastLevel() {
    if (LastLevel == '111') {
        var traceStep = "0"; //if Select grid ==null then MAX
        if (LastSelectedRow == "" || LastSelectedRow == null) {
            alert(" لطفا يک سطر را انتخاب کنيد")
            return;
        } else {
            $("#" + MasterObj + "txtTraceStep").val($(LastSelectedRow).attr("TraceStepIDMax"))

            $("#" + MasterObj + "txtTraceStep1").val($("#" + MasterObj + "txtTraceStep").val());
            $("#" + MasterObj + "txtSubmit").val("LastLevel");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        LastLevel = '0';
    }
    $("#" + MasterObj + "txtTraceStep1").val($(LastSelectedRow).attr("TraceStepIDMax"));
    BackLevel = $(LastSelectedRow).attr("TraceStepIDMax");
    NextLevel = $(LastSelectedRow).attr("TraceStepIDMax");
}
function OnBlurTraceStep() {
    $("#" + MasterObj + "txtTraceStep").val($("#" + MasterObj + "txtTraceStep1").val());
    $("#" + MasterObj + "txtSubmit").val("FirstLevel");
    $("#" + MasterObj + "BtnSubmit").click();
    BackLevel = $("#" + MasterObj + "txtTraceStep1").val();
    NextLevel = $("#" + MasterObj + "txtTraceStep1").val(); 
}
//-----------------------------------------------------------
function onclickScriptName(SelectTd) {
    OnClickGrd($(SelectTd).parent(0));
    if ($(SelectTd).parent(0).attr("ScriptType") == 1) {
        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + $(SelectTd).parent(0).attr("CodeID")
                                            + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
                                            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val())
                                            + "&New=0&System=1"; //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }
    else if ($(SelectTd).parent(0).attr("ScriptType") == 2) {//قانون هاي الگويي

        var strUrl = "../../App_Pages/BaseInfo/ScriptTemplateNew.aspx?ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&ViewMode=1"
            + "&ScriptID=" + $(SelectTd).parent(0).attr("ScriptID")
            + '&CategoryID=' + $(SelectTd).parent(0).attr("CategoryID")
            + "&System=" + $(SelectTd).parent(0).attr("ScriptSystem")
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val());
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')
    }
    else if ($(SelectTd).parent(0).attr("ScriptType") == 3) {//قانون هاي عادي
        var url = "/TAPresentation/App_Pages/BaseInfo/ScriptsNew.aspx?ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&ViewMode=1"
            + "&ScriptID=" + $(SelectTd).parent(0).attr("ScriptID")
            + '&CategoryID=' + $(SelectTd).parent(0).attr("CategoryID")
            + "&System=" + $(SelectTd).parent(0).attr("ScriptSystem")
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val());
        var winPro = "dialogWidth:1000px;dialogHeight:800px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        DailyInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro);
    }
    else if ($(SelectTd).parent(0).attr("ScriptType") == 4) {

        var strUrl = "../../App_Pages/BaseInfo/DifinitionCodeNew.aspx?CodeID=" + $(SelectTd).parent(0).attr("CodeID")
            + "&ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
            + "&SessionID=" + ($("#" + MasterObj + "txtSessionID").val() == "" ? "0" : $("#" + MasterObj + "txtSessionID").val())
            + "&New=0&System=1"; //+ LastSelectedRow.System
        strUrl = encodeURI(strUrl);
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
    }

}
//---------------------------------------------------------------------
function onChangeCmbStep() { //txtXmlScript--txtXmlStep

    if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML($("#" + MasterObj + "txtXmlScript").val())
    } else {
        var parser = new DOMParser();
        xmlDoc = parser.parseFromString($("#" + MasterObj + "txtXmlScript").val(), 'text/xml');
    }
    var xmlNodes;

    $("#" + MasterObj + "CmbScriptName")[0].innerHTML = "";
    if ($("#" + MasterObj + "cmbStep").val() != 0 && $("#" + MasterObj + "cmbStep").val() != "") {
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[StepID=" + $("#" + MasterObj + "cmbStep").val() + " ]");
    } else {
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo"); 
    }
    var j = 1
        optionEl = document.createElement("OPTION")
        document.getElementById(MasterObj + "CmbScriptName").options.add(optionEl)
       
        if ($("#" + MasterObj + "cmbStep").val() != '0') {
            document.getElementById(MasterObj + "CmbScriptName").all(0).innerText = "انتخاب نشده";
            document.getElementById(MasterObj + "CmbScriptName").all(0).value = "0";
            document.getElementById(MasterObj + "CmbScriptName").all(0).value = "0";
        }

    for (var i = 0; i < xmlNodes.length; ++i) {
        optionEl = document.createElement("OPTION")
        document.getElementById(MasterObj + "CmbScriptName").options.add(optionEl)
        document.getElementById(MasterObj + "CmbScriptName").all(j).innerText = xmlNodes.item(i).selectSingleNode('Title').text
        document.getElementById(MasterObj + "CmbScriptName").all(j).value = xmlNodes.item(i).selectSingleNode('Val').text
        j++
    }
    if ($("#" + MasterObj + "cmbStep").val() == '0') {//در این حالت دوبار انتخاب نشده می اورد
        document.getElementById(MasterObj + "CmbScriptName").options.remove(optionEl)
    }
}

//-------------------------------------------------------------------------
function onChangeCmbScriptName() {
    if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML($("#" + MasterObj + "txtXmlScript").val())
    } else {
        var parser = new DOMParser();
        xmlDoc = parser.parseFromString($("#" + MasterObj + "txtXmlScript").val(), 'text/xml');
    }
    $(xmlDoc)
        .find("GeneralEntity").find("LCombo").each(function() {
            if ($(this).find("Val").text() == $("#" + MasterObj + "CmbScriptName").val()) {
                $("#" + MasterObj + "cmbStep").val($(this).find("StepID").text());
            }
        });
    }
    //-----------------------------
    function OnKeyDownIntTrace(number) {
        var key = window.event.keyCode
        var key2 = window.event.shiftKey;

        window.event.returnValue =
		(
        (key <= 31 && (key >= 48 || key <= 57))
         || (key == 8) || (key == 9) || (key == 46) || (key == 16)
         || ((key >= 96) && (key <= 105))
         || ((key2 == false) && ((key <= 65) || (key >= 90)))

		)
    }