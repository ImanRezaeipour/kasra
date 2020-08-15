document.dir = "RTL";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var strChk = "";
PageLoad();
//===============================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
function EndRequestHandler(sender, args) {
    if ($get(MasterObj + "txtValidate").value == "0")
        alert($get(MasterObj + "txtAlert").value);
    else
        SetMsg($get(MasterObj + "txtAlert").value);

    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtXmlSave").value = "";
    strChk = "";
    LastSelectedRow = null;
}
//===============================================================================
function PageLoad() {

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);

    if ($get(MasterObj + "txtIsAdmin").value == "1") {
        $get(MasterObj + "txtDomainServer").disabled = false;
        $get(MasterObj + "txtSmsNo").disabled = false;
        $get(MasterObj + "txtSmsUserName").disabled = false;
        $get(MasterObj + "txtSmsPass").disabled = false;
        $get(MasterObj + "txtSmtpServer").disabled = false;
        $get(MasterObj + "txtKasraMail").disabled = false;
        $get(MasterObj + "txtActiveFinance").disabled = false;
        $get(MasterObj + "txtUserCount").disabled = false;
        $get(MasterObj + "txtPersonCount").disabled = false;
        $get(MasterObj + "txtMissCardTime").disabled = false;
        $get(MasterObj + "txtCardCodeSetting").disabled = false;
        $get(MasterObj + "BtnSelectGroup").disabled = false;
        //---------------------------------------------------
        $get("picker").style.display = "inline";
        $get(MasterObj + "txtInColor").disabled = false;
        $get(MasterObj + "txtOutColor").disabled = false;
        $get(MasterObj + "txtManagerColor").disabled = false;
        $get(MasterObj + "txtUserColor").disabled = false;
        $get(MasterObj + "txtSchedulChange").disabled = false;
        $get(MasterObj + "txtShiftChange").disabled = false;
        $get(MasterObj + "txtTwoShiftChangeSPerson").disabled = false;
        $get(MasterObj + "txtTwoShiftChangeFPerson").disabled = false;
        $get(MasterObj + "txtShiftReplaceChange").disabled = false;

        $get("colorPickerDoc").style.display = "inline";
        $get(MasterObj + "txtHourlyDoc").disabled = false;
        $get(MasterObj + "txtDayDoc").disabled = false;
        $get(MasterObj + "txtAttendanceDoc").disabled = false;
        $get(MasterObj + "txtMonthlyDoc").disabled = false;
        $get(MasterObj + "txtDailyDoc").disabled = false;
        $get(MasterObj + "txtRepeatMonthlyDoc").disabled = false;
        $get(MasterObj + "txtDayCountinutionDoc").disabled = false;
        $get(MasterObj + "txtComissionDoc").disabled = false;
        $get(MasterObj + "txtReplaceDetailDoc").disabled = false;
        $get(MasterObj + "txtSchedulChangeDoc").disabled = false;
        $get(MasterObj + "txtTimeSheetDoc").disabled = false;
        $get(MasterObj + "txtShiftDoc").disabled = false;
        $get(MasterObj + "txtRequestionDoc").disabled = false;
        $get(MasterObj + "txtErjaToRequester").disabled = false;
        $get(MasterObj + "txtErjaStepBefor").disabled = false;
        $get(MasterObj + "txtErjaForReport").disabled = false;
        $get(MasterObj + "txtErjaForReportAndEdit").disabled = false;
        //---------------------------------------------------
        $get(MasterObj + "BtnSelectCode").disabled = false;
        $get(MasterObj + "txtCardexPageSize").disabled = false;
        $get(MasterObj + "txtAttendancePageSize").disabled = false;
        $get(MasterObj + "txtCartablePageSize").disabled = false;
        $get(MasterObj + "txtMonthlyPageSize").disabled = false;
        $get(MasterObj + "txtMailServiceTimer").disabled = false;
        //------------------------------------------------
        $get(MasterObj + "txtBackUpMailAddress").disabled = false;
        $get(MasterObj + "txtGetUrl").disabled = false;
        $get(MasterObj + "txtArxUser").disabled = false;
        $get(MasterObj + "txtArxPass").disabled = false;
        $get(MasterObj + "txtShiftCellsWidth").disabled = false;
        $get(MasterObj + "txtShiftCellsFont").disabled = false;
        $get(MasterObj + "txtDayLength").disabled = false;
        $get(MasterObj + "txtDailyCodeReportSTime").disabled = false;
        $get(MasterObj + "txtDailyCodeReportETime").disabled = false;
        $get(MasterObj + "txtInsertCreditCount").disabled = false;
    }
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopSelect']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtTopSelect").value = xmlNodes.item(0).selectSingleNode('Value').text;

    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopOfEventLog']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtTopOfEventLog").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSfrom']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtSmsNo").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSusername']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtSmsUserName").value = xmlNodes.item(0).selectSingleNode('Value').text;


    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSpassword']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtSmsPass").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SmtpServer']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtSmtpServer").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='kasramail']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtKasraMail").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ActiveFinance']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtActiveFinance").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='UserCount']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtUserCount").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='PersonCount']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtPersonCount").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopOfCardReaderStatus']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtTopOfCardReaderStatus").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MinIOGap']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtMissCardTime").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CreditStatus']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtCardCodeSetting").value = xmlNodes.item(0).selectSingleNode('Value').text;

    //    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='NightWorking']");
    //    if (xmlNodes.item(0) != null)
    //        $get(MasterObj + "txtNightWorking").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCreditFilter']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbFilterDaily").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MonthlyCreditFilter']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbFilterMonthly").value = xmlNodes.item(0).selectSingleNode('Value').text;


    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DefultFoodTerm']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbFoodTerm").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShowInMonitoring']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbShowMonitor").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CopiesNumber']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtCopiesNumber").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='KaraneMostaghel']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbKaraneType").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='WorkperiodForKarane']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "cmbDefaultworkPeriod").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='RestStructure']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "CmbStructure").value = xmlNodes.item(0).selectSingleNode('Value').text;

    //    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='AttendanceCalculate']");
    //    if (xmlNodes.item(0) != null)
    //        $get(MasterObj + "txtAttendanceCalculate").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MonthlyPageSize']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtMonthlyPageSize").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CardexPageSize']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtCardexPageSize").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MaxRecordMonitotingPersonel']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtAttendancePageSize").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CartablePageSize']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtCartablePageSize").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MailServiceTimer']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtMailServiceTimer").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ValidDomainName']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtDomainServer").value = xmlNodes.item(0).selectSingleNode('Value').text;

    //    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OnlinePair']");
    //    if (xmlNodes.item(0) != null)
    //        $get(MasterObj + "txtOnlinePair").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DefaultPassPCode']");
    if (xmlNodes.item(0) != null) {
        if (xmlNodes.item(0).selectSingleNode('Value').text == "1")
            $get(MasterObj + "chkDefaultPass").checked = true;
        //------------------------------------------------------------
        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='BackUpMailAddress']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtBackUpMailAddress").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='GetUrl']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtGetUrl").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ArxUser']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtArxUser").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ArxPass']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtArxPass").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShiftCellsWidth']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtShiftCellsWidth").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShiftCellsFont']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtShiftCellsFont").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DayLength']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtDayLength").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='InsertCreditCount']");
        if (xmlNodes.item(0) != null)
            $get(MasterObj + "txtInsertCreditCount").value = xmlNodes.item(0).selectSingleNode('Value').text;

        xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCodeReportTime']");
        if (xmlNodes.item(0) != null && xmlNodes.item(0).selectSingleNode('Value').text.split('-').length > 1) {
            $get(MasterObj + "txtDailyCodeReportSTime").value = xmlNodes.item(0).selectSingleNode('Value').text.split('-')[0];
            $get(MasterObj + "txtDailyCodeReportETime").value = xmlNodes.item(0).selectSingleNode('Value').text.split('-')[1];
       
           xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OnlinePair']");
            if (xmlNodes.item(0) != null)
                $get(MasterObj + "CmbOnlinePair").value = xmlNodes.item(0).selectSingleNode('Value').text;

            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='NightWorking']");
            if (xmlNodes.item(0) != null)
                $get(MasterObj + "CmbNightWorking").value = xmlNodes.item(0).selectSingleNode('Value').text;

            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='AttendanceCalculate']");
            if (xmlNodes.item(0) != null)
                $get(MasterObj + "CmbAttendanceCalculate").value = xmlNodes.item(0).selectSingleNode('Value').text;
        }
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DepartmantGroupPersonel']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "DDlFilterType").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedAfterFirstLogin']");
    if (xmlNodes.item(0) != null) {
        if (xmlNodes.item(0).selectSingleNode('Value').text == "1")
            $get(MasterObj + "chkChangePassNeedAfterFirstLogin").checked = true;
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithTime']");
    if (xmlNodes.item(0) != null) {
        if (xmlNodes.item(0).selectSingleNode('Value').text != "" && xmlNodes.item(0).selectSingleNode('Value').text != "0") {
            $get(MasterObj + "chkChangePassNeedWithTime").checked = true;
            $get(MasterObj + "txtChangePassNeedWithTime").value = xmlNodes.item(0).selectSingleNode('Value').text
        }
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithLogin']");
    if (xmlNodes.item(0) != null) {
        if (xmlNodes.item(0).selectSingleNode('Value').text != "" && xmlNodes.item(0).selectSingleNode('Value').text != "0") {
            $get(MasterObj + "chkChangePassNeedWithLogin").checked = true;
            $get(MasterObj + "txtChangePassNeedWithLogin").value = xmlNodes.item(0).selectSingleNode('Value').text
        }
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithIncorrectPass']");
    if (xmlNodes.item(0) != null) {
        if (xmlNodes.item(0).selectSingleNode('Value').text != "" && xmlNodes.item(0).selectSingleNode('Value').text != "0") {
            $get(MasterObj + "chkChangePassNeedWithIncorrectPass").checked = true;
            $get(MasterObj + "txtChangePassNeedWithIncorrectPass").value = xmlNodes.item(0).selectSingleNode('Value').text
        }
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCols']");
    if (xmlNodes.item(0) != null) {
        var strColVal = xmlNodes.item(0).selectSingleNode('Value').text;
        $get(MasterObj + "txtDay").value = strColVal.split(',')[0];
        $get(MasterObj + "txtGoing").value = strColVal.split(',')[1];
        $get(MasterObj + "txtMazad").value = strColVal.split(',')[2];
        $get(MasterObj + "txtKasr").value = strColVal.split(',')[3];
        $get(MasterObj + "txtNobatKari").value = strColVal.split(',')[4];
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='HolidayShift']");
    if (xmlNodes.item(0) != null) {
        var strHolidayShifts = xmlNodes.item(0).selectSingleNode('Value').text;
        for (var i = 0; i < strHolidayShifts.split(',').length; i++) {
            if (strHolidayShifts.split(',')[i] == 0)
                $get(MasterObj + "ChkSatur").checked = true;
            else if (strHolidayShifts.split(',')[i] == 1)
                $get(MasterObj + "ChkSun").checked = true;
            else if (strHolidayShifts.split(',')[i] == 2)
                $get(MasterObj + "ChkMon").checked = true;
            else if (strHolidayShifts.split(',')[i] == 3)
                $get(MasterObj + "ChkTus").checked = true;
            else if (strHolidayShifts.split(',')[i] == 4)
                $get(MasterObj + "ChkWen").checked = true;
            else if (strHolidayShifts.split(',')[i] == 5)
                $get(MasterObj + "ChkThers").checked = true;
            else if (strHolidayShifts.split(',')[i] == 6)
                $get(MasterObj + "ChkFri").checked = true;

        }
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='Skin']");
    if (xmlNodes != null) {
        switch (xmlNodes.item(0).selectSingleNode('Value').text) {
            case "18201":
                $get(MasterObj + "rdBlue").checked = true;
                break;
            case "18202":
                $get(MasterObj + "rdGreen").checked = true;
                break;
            case "18203":
                $get(MasterObj + "rdViolet").checked = true;
                break;
            case "18204":
                $get(MasterObj + "rdSilver").checked = true;
                break;
        }
    }
    if ($get(MasterObj + "txtArxUser").value != '' || $get(MasterObj + "txtArxPass").value != '') {
        $get(MasterObj + "ChkArks").checked = true;
        $get(MasterObj + "txtArxUser").disabled = false;
        $get(MasterObj + "txtArxPass").disabled = false;
    }
    else {
        $get(MasterObj + "ChkArks").checked = false;
        $get(MasterObj + "txtArxUser").disabled = true;
        $get(MasterObj + "txtArxPass").disabled = true;
    }

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='InputCardReader']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtInputCardReader").value = xmlNodes.item(0).selectSingleNode('Value').text;

    xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OutputCardReader']");
    if (xmlNodes.item(0) != null)
        $get(MasterObj + "txtOutputCardReader").value = xmlNodes.item(0).selectSingleNode('Value').text;
}
//===============================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//===============================================================================
function OnClickChk(obj) {
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement

    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/OP [ ID=" + oGrid.rows(oIndex).getAttribute("ID") + "]");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            f.selectSingleNode("Val").text = 1;
            oXmlDoc.childNodes[0].appendChild(f);
        }
        else {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            f.selectSingleNode("Val").text = 0;
            oXmlDoc.childNodes[0].appendChild(f);
        }
        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<OP>"
        strChk += "<ID>" + oGrid.rows(oIndex).getAttribute("ID") + "</ID>"
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
            strChk += "<Val>0</Val>"
        else
            strChk += "<Val>1</Val>"
        strChk += "</OP>"
    }
}
//===============================================================================
function OnClickBtnSave() {
    if ($get(MasterObj + "txtDailyCodeReportSTime").value != "" && $get(MasterObj + "txtDailyCodeReportETime").value == "")
        alert("در تنظيمات گزارشات تاریخ خاتمه گزارشگيري را وارد نماييد");
    else if ($get(MasterObj + "txtDailyCodeReportETime").value != "" && $get(MasterObj + "txtDailyCodeReportSTime").value == "")
        alert("در تنظيمات گزارشات تاریخ شروع گزارشگيري را وارد نماييد");
    else if ($get(MasterObj + "txtDailyCodeReportSTime").value > $get(MasterObj + "txtDailyCodeReportETime").value)
        alert("در تنظيمات گزارشات تاریخ شروع گزارشگيري از تاريخ خاتمه بزرگتر است");
    else if (parseInt($get(MasterObj + "txtInsertCreditCount").value) > 30)
            alert(" تعداد مجوز برای ثبت در صفحه ثبت مجوز مدیرسیستمی کمتر از 30 انتخاب شود");
    else {
        if ($get(MasterObj + "txtIsAdmin").value == "1") {
            var Strconfirm = "آيا مايل به ذخيره تنظيمات به صورت عمومي هستيد؟"
            if (confirm(Strconfirm))
                $get(MasterObj + "txtMemberID").value = "0";
            else
                $get(MasterObj + "txtMemberID").value = $get(MasterObj + "txtOnLineUser").value;
        }
        else
            $get(MasterObj + "txtMemberID").value = $get(MasterObj + "txtOnLineUser").value;

        OnChkHolidayShifts();
        //-------------------------------------
        $("#GrdTASetting")
             .find('TBODY')
             .find('tr')
             .each(function () {
                 if ($(this).attr("variable") == 'ScriptGroupDetail' && $(this).find('input:checkbox').attr("checked")) {
                     $get(MasterObj + "txtIsCheckScriptGroupDetail").value = '1';
                 }
             });
        //-------------------------------------
        $get(MasterObj + "txtXmlSave").value = "<Root>" + strChk + "</Root>";
        $get(MasterObj + "txtSubmit").value = "Modify";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//===============================================================================
function OnChangeVariable(obj) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
    var xmlNodes;
    switch (obj.id) {
        case MasterObj + "txtTopSelect":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopSelect']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + ID + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtTopSelect").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtTopOfEventLog":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopOfEventLog']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + ID + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtTopOfEventLog").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtSmsNo":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSfrom']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtSmsNo").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtDomainServer":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ValidDomainName']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtDomainServer").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtSmsUserName":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSusername']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtSmsUserName").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtSmsPass":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SMSpassword']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtSmsPass").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtSmtpServer":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SmtpServer']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtSmtpServer").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtKasraMail":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='kasramail']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtKasraMail").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtActiveFinance":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ActiveFinance']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtActiveFinance").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtUserCount":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='UserCount']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtUserCount").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtPersonCount":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='PersonCount']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtPersonCount").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtTopOfCardReaderStatus":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='TopOfCardReaderStatus']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtTopOfCardReaderStatus").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtMissCardTime":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MinIOGap']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtMissCardTime").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtCardCodeSetting":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CreditStatus']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtCardCodeSetting").value + "</Val>"
            strChk += "</OP>"
            break;

        //        case MasterObj + "txtNightWorking": 
        //            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='NightWorking']"); 
        //            var ID = xmlNodes.item(0).selectSingleNode('ID').text 
        //            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM"); 
        //            oXmlDoc2.async = "false"; 
        //            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>"); 
        //            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]"); 
        //            if (xmlNodes2.length > 0) { 
        //                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0)); 
        //                strChk = oXmlDoc2.xml; 
        //                strChk = strChk.replace("<Root>", ""); 
        //                strChk = strChk.replace("</Root>", ""); 
        //            } 
        //            strChk += "<OP>" 
        //            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>" 
        //            strChk += "<Val>" + $get(MasterObj + "txtNightWorking").value + "</Val>" 
        //            strChk += "</OP>" 
        //            break; 

        case MasterObj + "CmbFilterDaily":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCreditFilter']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbFilterDaily").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "DDlFilterType":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DepartmantGroupPersonel']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "DDlFilterType").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "CmbFilterMonthly":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MonthlyCreditFilter']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbFilterMonthly").value + "</Val>"
            strChk += "</OP>"
            break;

        //=============ForRest======== 
        case MasterObj + "CmbFoodTerm":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DefultFoodTerm']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbFoodTerm").value + "</Val>"
            strChk += "</OP>"
            break;
        //=============ForRest========  
        case MasterObj + "CmbShowMonitor":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShowInMonitoring']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbShowMonitor").value + "</Val>"
            strChk += "</OP>"
            break;
        //==========ForRest==========  
        case MasterObj + "txtCopiesNumber":
            if ($get(MasterObj + "txtCopiesNumber").value == "")
                $get(MasterObj + "txtCopiesNumber").value = "1"
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CopiesNumber']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtCopiesNumber").value + "</Val>"
            strChk += "</OP>"
            break;
        //======================  

        case MasterObj + "txtAttendanceCalculate":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='AttendanceCalculate']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtAttendanceCalculate").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtMonthlyPageSize":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MonthlyPageSize']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtMonthlyPageSize").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtCardexPageSize":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CardexPageSize']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtCardexPageSize").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtAttendancePageSize":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MaxRecordMonitotingPersonel']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtAttendancePageSize").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtCartablePageSize":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='CartablePageSize']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtCartablePageSize").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtMailServiceTimer":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='MailServiceTimer']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtMailServiceTimer").value + "</Val>"
            strChk += "</OP>"
            break;

        //        case MasterObj + "txtOnlinePair": 
        //            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OnlinePair']"); 
        //            var ID = xmlNodes.item(0).selectSingleNode('ID').text 
        //            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM"); 
        //            oXmlDoc2.async = "false"; 
        //            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>"); 
        //            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]"); 
        //            if (xmlNodes2.length > 0) { 
        //                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0)); 
        //                strChk = oXmlDoc2.xml; 
        //                strChk = strChk.replace("<Root>", ""); 
        //                strChk = strChk.replace("</Root>", ""); 
        //            } 
        //            strChk += "<OP>" 
        //            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>" 
        //            strChk += "<Val>" + $get(MasterObj + "txtOnlinePair").value + "</Val>" 
        //            strChk += "</OP>" 
        //            break; 

        case MasterObj + "rdBlue":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='Skin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "rdBlue").checked == true)
                strChk += "<Val>18201</Val>";
            else if ($get(MasterObj + "rdGreen").checked == true)
                strChk += "<Val>18202</Val>";
            else if ($get(MasterObj + "rdViolet").checked == true)
                strChk += "<Val>18203</Val>";
            else if ($get(MasterObj + "rdSilver").checked == true)
                strChk += "<Val>18204</Val>";
            strChk += "</OP>"
            break;
        case MasterObj + "rdGreen":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='Skin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "rdBlue").checked == true)
                strChk += "<Val>18201</Val>";
            else if ($get(MasterObj + "rdGreen").checked == true)
                strChk += "<Val>18202</Val>";
            else if ($get(MasterObj + "rdViolet").checked == true)
                strChk += "<Val>18203</Val>";
            else if ($get(MasterObj + "rdSilver").checked == true)
                strChk += "<Val>18204</Val>";
            strChk += "</OP>"
            break;
        case MasterObj + "rdViolet":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='Skin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "rdBlue").checked == true)
                strChk += "<Val>18201</Val>";
            else if ($get(MasterObj + "rdGreen").checked == true)
                strChk += "<Val>18202</Val>";
            else if ($get(MasterObj + "rdViolet").checked == true)
                strChk += "<Val>18203</Val>";
            else if ($get(MasterObj + "rdSilver").checked == true)
                strChk += "<Val>18204</Val>";
            strChk += "</OP>"
            break;
        case MasterObj + "rdSilver":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='Skin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "rdBlue").checked == true)
                strChk += "<Val>18201</Val>";
            else if ($get(MasterObj + "rdGreen").checked == true)
                strChk += "<Val>18202</Val>";
            else if ($get(MasterObj + "rdViolet").checked == true)
                strChk += "<Val>18203</Val>";
            else if ($get(MasterObj + "rdSilver").checked == true)
                strChk += "<Val>18204</Val>";
            strChk += "</OP>"
            break;

        case MasterObj + "chkDefaultPass":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DefaultPassPCode']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "chkDefaultPass").checked == true)
                strChk += "<Val>1</Val>";
            else
                strChk += "<Val>0</Val>";
            strChk += "</OP>"
            break;

        case MasterObj + "txtChangePassNeedWithTime":
            $get(MasterObj + "chkChangePassNeedWithTime").checked = true;
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithTime']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithTime").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithTime").value + "</Val>";
                strChk += "</OP>"
            }
            break;

        case MasterObj + "chkChangePassNeedWithTime":
            $get(MasterObj + "chkChangePassNeedWithTime").checked = true;
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithTime']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithTime").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithTime").value + "</Val>";
                strChk += "</OP>"
            }
            break;

        case MasterObj + "txtChangePassNeedWithLogin":
            $get(MasterObj + "chkChangePassNeedWithLogin").checked = true;
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithLogin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithLogin").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithLogin").value + "</Val>";
                strChk += "</OP>"
            }
            break;

        case MasterObj + "chkChangePassNeedWithLogin":
            $get(MasterObj + "chkChangePassNeedWithLogin").checked = true;
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithLogin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithLogin").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithLogin").value + "</Val>";
                strChk += "</OP>"
            }
            break;

        case MasterObj + "chkChangePassNeedAfterFirstLogin":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedAfterFirstLogin']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if ($get(MasterObj + "chkChangePassNeedAfterFirstLogin").checked == true)
                strChk += "<Val>1</Val>";
            else
                strChk += "<Val>0</Val>";
            strChk += "</OP>"
            break;

        case MasterObj + "txtChangePassNeedWithIncorrectPass":
            $get(MasterObj + "chkChangePassNeedWithIncorrectPass").checked = true;
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithIncorrectPass']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithIncorrectPass").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithIncorrectPass").value + "</Val>";
                strChk += "</OP>"
            }
            break;

        case MasterObj + "chkChangePassNeedWithIncorrectPass":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ChangePassNeedWithIncorrectPass']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            if ($get(MasterObj + "chkChangePassNeedWithIncorrectPass").checked) {
                strChk += "<OP>"
                strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
                strChk += "<Val>" + $get(MasterObj + "txtChangePassNeedWithIncorrectPass").value + "</Val>";
                strChk += "</OP>"
            }
            break;
        //======================================= 
        case MasterObj + "CmbKaraneType":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='KaraneMostaghel']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbKaraneType").value + "</Val>"
            strChk += "</OP>"
            break;
        //=======================================
        case MasterObj + "cmbDefaultworkPeriod":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='WorkperiodForKarane']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "cmbDefaultworkPeriod").value + "</Val>"
            strChk += "</OP>"
            break;
        //======================================= 
        case MasterObj + "CmbStructure":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='RestStructure']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbStructure").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtBackUpMailAddress":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='BackUpMailAddress']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtBackUpMailAddress").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtGetUrl":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='GetUrl']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtGetUrl").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtArxUser":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ArxUser']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtArxUser").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtArxPass":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ArxPass']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtArxPass").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtShiftCellsWidth":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShiftCellsWidth']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtShiftCellsWidth").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtShiftCellsFont":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='ShiftCellsFont']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtShiftCellsFont").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "txtDayLength":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DayLength']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtDayLength").value + "</Val>"
            strChk += "</OP>"
            break;
        //        case MasterObj + "txtDailyCodeReportTime": 
        //            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCodeReportTime']"); 
        //            var ID = xmlNodes.item(0).selectSingleNode('ID').text 
        //            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM"); 
        //            oXmlDoc2.async = "false"; 
        //            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>"); 
        //            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]"); 
        //            if (xmlNodes2.length > 0) { 
        //                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0)); 
        //                strChk = oXmlDoc2.xml; 
        //                strChk = strChk.replace("<Root>", ""); 
        //                strChk = strChk.replace("</Root>", ""); 
        //            } 
        //            strChk += "<OP>" 
        //            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>" 
        //            strChk += "<Val>" + $get(MasterObj + "txtDailyCodeReportTime").value + "</Val>" 
        //            strChk += "</OP>" 
        //            break;  
        case MasterObj + "txtDailyCodeReportSTime":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCodeReportTime']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if (($get(MasterObj + "txtDailyCodeReportSTime").value == "" && $get(MasterObj + "txtDailyCodeReportETime").value == "")
            || ($get(MasterObj + "txtDailyCodeReportSTime").value == "00:00" && $get(MasterObj + "txtDailyCodeReportETime").value == "00:00"))
                strChk += "<Val></Val>"
            else
                strChk += "<Val>" + $get(MasterObj + "txtDailyCodeReportSTime").value + '-' + $get(MasterObj + "txtDailyCodeReportETime").value + "</Val>";
            strChk += "</OP>"
            break;

        case MasterObj + "txtDailyCodeReportETime":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCodeReportTime']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            if (($get(MasterObj + "txtDailyCodeReportSTime").value == "" && $get(MasterObj + "txtDailyCodeReportETime").value == "")
            || ($get(MasterObj + "txtDailyCodeReportSTime").value == "00:00" && $get(MasterObj + "txtDailyCodeReportETime").value == "00:00"))
                strChk += "<Val></Val>"
            else
                strChk += "<Val>" + $get(MasterObj + "txtDailyCodeReportSTime").value + '-' + $get(MasterObj + "txtDailyCodeReportETime").value + "</Val>";
            strChk += "</OP>"
            break;

        case MasterObj + "CmbOnlinePair":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OnlinePair']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbOnlinePair").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "CmbNightWorking":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='NightWorking']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbNightWorking").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "CmbAttendanceCalculate":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='AttendanceCalculate']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "CmbAttendanceCalculate").value + "</Val>"
            strChk += "</OP>"
            break;
        case MasterObj + "CmbFonts":  //for  menu and cartable
        case MasterObj + "CmbSize":
        case MasterObj + "CmbColor":
            $get(MasterObj + "txtFonts").value = "1";
            break;
        case MasterObj + "CmbFontlogin": //for login
        case MasterObj + "CmbSizeLogin":
            $get(MasterObj + "txtloginFont").value = "1";
            break;
        case MasterObj + "CmbtxtFont": //for TxtControl
        case MasterObj + "CmbtxtSize":
            $get(MasterObj + "txtTxtFont").value = "1";
            break;
        case MasterObj + "CmbGridFont": //for Grid
        case MasterObj + "CmbGridSize":
            $get(MasterObj + "txtGridFont").value = "1";
            break;
        case MasterObj + "txtInsertCreditCount":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='InsertCreditCount']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtInsertCreditCount").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtInputCardReader":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='InputCardReader']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtInputCardReader").value + "</Val>"
            strChk += "</OP>"
            break;

        case MasterObj + "txtOutputCardReader":
            xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='OutputCardReader']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            strChk += "<OP>"
            strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
            strChk += "<Val>" + $get(MasterObj + "txtOutputCardReader").value + "</Val>"
            strChk += "</OP>"
            break;
    }
}
function OnClickchkEPK(obj) {
    if ($get(MasterObj + "ChkKasraDefaultStyle").checked == true) {
        $get(MasterObj + "txtkasraDefaultStyle").value = "1";
        $get(MasterObj + "ChkDefaultStyle").disabled = true;
    }
    else {
        $get(MasterObj + "txtkasraDefaultStyle").value = "0";
        $get(MasterObj + "ChkDefaultStyle").disabled = false;
    }
    if ($get(MasterObj + "ChkDefaultStyle").checked == true) {
        $get(MasterObj + "txtDefaultStyle").value = "1";
        $get(MasterObj + "ChkKasraDefaultStyle").disabled = true;
    }
    else {
        $get(MasterObj + "txtDefaultStyle").value = "0";
        $get(MasterObj + "ChkKasraDefaultStyle").disabled = false;
    }
}
//===============================================================================
function OnChaneDayColumns() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='DailyCols']");
    var ID = xmlNodes.item(0).selectSingleNode('ID').text;
    var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc2.async = "false";
    oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
    var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
    if (xmlNodes2.length > 0) {
        var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
        strChk = oXmlDoc2.xml;
        strChk = strChk.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    strChk += "<OP>"
    strChk += "<ID>" + xmlNodes.item(0).selectSingleNode('ID').text + "</ID>"
    strChk += "<Val>"
    strChk += $get(MasterObj + "txtDay").value
    strChk += "," + $get(MasterObj + "txtGoing").value
    strChk += "," + $get(MasterObj + "txtMazad").value
    strChk += "," + $get(MasterObj + "txtKasr").value
    strChk += "," + $get(MasterObj + "txtNobatKari").value
    strChk += "</Val>"
    strChk += "</OP>"
}
//===============================================================================
function OnClickBtnSelectGroup() {
    //----برای لود کردن گروه هايي که قبلا ذخیره شده اند در ص انتخاب گروه-----
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SortCardsGroups']");
    var ID = xmlNodes.item(0).selectSingleNode('ID').text
    var strSelectedGroup = xmlNodes.item(0).selectSingleNode('Value').text;
    if (strSelectedGroup != null && strSelectedGroup != "") {
        var strGroup = strSelectedGroup.split(',');
        strSelectedGroup = "";
        for (var i = 0; i < strGroup.length; i++) {
            strSelectedGroup += "<Tb>"
            strSelectedGroup += "<GroupId>" + strGroup[i] + "</GroupId>"
            strSelectedGroup += "<Selected>1</Selected>"
            strSelectedGroup += "</Tb>"
        }
    }
    //------------------------------------------------------------------------
    $get(MasterObj + "txtSelectedGroupFromParent").value = strSelectedGroup;
    var url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value
         + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
         + "&ParentPage=DefineSetting" + "&SelectedGoup=1";
    strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    if (url != "") {
        OSelectedMamber = "";
        OSelectedMamber = window.showModalDialog(url, window, strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(OSelectedMamber);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        var StrGroupId = "";
        if (oXmlNodes.length > 0) {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='SortCardsGroups']");
            var ID = xmlNodes.item(0).selectSingleNode('ID').text
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            for (var i = 0; i < oXmlNodes.length; i++) {
                {
                    if (StrGroupId == "")
                        StrGroupId = oXmlNodes.item(i).selectSingleNode("GroupId").text
                    else
                        StrGroupId = StrGroupId + "," + oXmlNodes.item(i).selectSingleNode("GroupId").text;
                }
            }
            strChk += "<OP>"
            strChk += "<ID>" + ID + "</ID>";
            strChk += "<Val>" + StrGroupId + "</Val>"
            strChk += "</OP>"
        }
    }
}

//================================================================================================
function OnClickBtnSelectCode() {
    //----برای لود کردن کدهایی که قبلا ذخیره شده اند در ص انتخاب کد-----
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='JCodeNeed']");
    var ID = xmlNodes.item(0).selectSingleNode('ID').text
    var strSelectedCode = xmlNodes.item(0).selectSingleNode('Value').text;
    if (strSelectedCode != null && strSelectedCode != "") {
        var strCode = strSelectedCode.split(',');
        strSelectedCode = "";
        for (var i = 0; i < strCode.length; i++) {
            strSelectedCode += "<TbCode>"
            strSelectedCode += "<CodeID>" + strCode[i] + "</CodeID>"
            strSelectedCode += "<Selected>1</Selected>"
            strSelectedCode += "</TbCode>"
        }
    }
    //------------------------------------------------------------------------
    var url = "/TAPresentation/App_Pages/BaseInfo/SelectMultiCode.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
    + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SelectedCode=" + strSelectedCode;
    strOptions = "dialogHeight: 450px;dialogWidth:500px;center: Yes;help: no;status: no"
    if (url != "") {
        var OSelectedCode = "";
        OSelectedCode = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedCode != undefined && OSelectedCode != "" && OSelectedCode != "<Root></Root>") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(OSelectedCode);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[ Selected=1]");
        var StrCodeId = "";
        if (oXmlNodes.length > 0) {
            var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc2.async = "false";
            oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
            var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
            if (xmlNodes2.length > 0) {
                var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
                strChk = oXmlDoc2.xml;
                strChk = strChk.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            for (var i = 0; i < oXmlNodes.length; i++) {
                {
                    if (StrCodeId == "")
                        StrCodeId = oXmlNodes.item(i).selectSingleNode("CodeID").text
                    else
                        StrCodeId = StrCodeId + "," + oXmlNodes.item(i).selectSingleNode("CodeID").text;
                }
            }
            strChk += "<OP>"
            strChk += "<ID>" + ID + "</ID>";
            strChk += "<Val>" + StrCodeId + "</Val>"
            strChk += "</OP>"
        }
    }
}
//================================================================================================
function OnChkHolidayShifts() {
    var strHolidayShifts = "";
    if ($get(MasterObj + "ChkSatur").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkSatur").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkSatur").value;
    }
    if ($get(MasterObj + "ChkSun").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkSun").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkSun").value;
    }
    if ($get(MasterObj + "ChkMon").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkMon").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkMon").value;
    }
    if ($get(MasterObj + "ChkTus").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkTus").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkTus").value;
    }
    if ($get(MasterObj + "ChkWen").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkWen").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkWen").value;
    }
    if ($get(MasterObj + "ChkThers").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkThers").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkThers").value;
    }
    if ($get(MasterObj + "ChkFri").checked == true) {
        if (strHolidayShifts == "")
            strHolidayShifts = $get(MasterObj + "ChkFri").value
        else
            strHolidayShifts += "," + $get(MasterObj + "ChkFri").value;
    }
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXmlOption").value);
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/SettingEntity/VariableOption [ Variable='HolidayShift']");
    var ID = xmlNodes.item(0).selectSingleNode('ID').text;
    var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc2.async = "false";
    oXmlDoc2.loadXML("<Root>" + strChk + "</Root>");
    var xmlNodes2 = oXmlDoc2.documentElement.selectNodes("/Root/OP [ ID=" + ID + "]");
    if (xmlNodes2.length > 0) {
        var f = oXmlDoc2.documentElement.removeChild(xmlNodes2.item(0));
        strChk = oXmlDoc2.xml;
        strChk = strChk.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    strChk += "<OP>"
    strChk += "<ID>" + ID + "</ID>"
    strChk += "<Val>"
    strChk += strHolidayShifts
    strChk += "</Val>"
    strChk += "</OP>"
}

//================================================================================================
$(document).ready(function () {
    $('#demo').hide();
    var f = $.farbtastic('#picker');
    var p = $('#picker').css('opacity', 0.25);
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
      .focus(function () {
          if (selected) {
              $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
          }
          f.linkTo(this);
          p.css('opacity', 1);
          $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });

    $('#demo').hide();
    var f = $.farbtastic('#colorPickerDoc');
    var p = $('#colorPickerDoc').css('opacity', 0.25);
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
      .focus(function () {
          if (selected) {
              $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
          }
          f.linkTo(this);
          p.css('opacity', 1);
          $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
});
//**********************************Show Personel Image***************************

function OnFocuseObject(obj) {
    obj.focus();
    obj.select()
}
//*******************on change Arks*******************************************
function OnChangeArks() {
    if ($get(MasterObj + "ChkArks").checked == true) {
        $get(MasterObj + "txtArxUser").disabled = false;
        $get(MasterObj + "txtArxPass").disabled = false;
    }
    else {
        $get(MasterObj + "txtArxUser").disabled = true;
        $get(MasterObj + "txtArxPass").disabled = true;
    }
}
//=====================================
function getNumKeyjeton() {
    var keyStroke;
    keyStroke = window.event.keyCode
    if (((keyStroke > 48) && (keyStroke <= 57)) || (keyStroke == 13))
        window.event.keyCode = keyStroke;
    else
        window.event.keyCode = null;

    window.event.returnValue = true
}
//==================================
