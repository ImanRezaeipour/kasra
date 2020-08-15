document.dir = "RTL";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var idx = 0;
var SumArray = new Array;
var TimeOut = null, TimeoutObj = null, ISClose = false, txtFocusText = null, Top, Left;
for (var i = 0; i < 100; i++)
    SumArray[i] = 0;
$get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
// document.getElementsByTagName("body")[0].scroll = "no"; 
SetSumRowColor();
AddRowForDiffValue();
GetAccessBtn();
//==================================PageLoad====================================================
$("document").ready(function () {
    //            $('#DivDesc').draggable();
    $('#DivDesc').bind('dragstop', function (event, ui) {
        Top = ui.offset.top;
        Left = ui.offset.left;
    });
    $("#DivDesc").hide();
});
//---------------------------------------------------------------------------------------------
execScript("1");
//----------------------------------مربوط به تنظیمات کمبوی واحد سازماني-------------------------------
if (document.getElementById(MasterObj + "txtKaraneComboboxOption").value != "1") {
    document.getElementById("TDNewCombo").style.display = "none";
    document.getElementById("TDOldCombo").style.display = "inline";
}
//-------------------------------------------------------------------------------------------------
if ($get(MasterObj + "txtTableName").value != "") {
    if ($get(MasterObj + "txtModifyFlag").value != "" && $get(MasterObj + "txtModifyFlag").value == "0")
        document.getElementById('OToolBar_BtnSave').style.display = "none";
    document.getElementById('OToolBar_BtnFilter').style.display = "none";
    document.getElementById('OToolBar_BtnConfirm').style.display = "none";

    if ($get(MasterObj + "txtKaraneComboboxOption").value != "1") {
        $get(MasterObj + "UCDepartment_cmbDepartment").value = $get(MasterObj + "txtMemberID").value;
        $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").disabled = true;
        $get(MasterObj + "UCDepartment_cmbDepartment").disabled = true;
    }
    else {
        $("#" + MasterObj + "MultiDepartment_cmbPerson_txtCode").val($get(MasterObj + "txtMemberID").value);
        $("#" + MasterObj + "MultiDepartment_cmbPerson_txtPCode").val($get(MasterObj + "txtMemberID").value);
        $("#" + MasterObj + "MultiDepartment_cmbPerson_txtName").val($get(MasterObj + "txtMName").value);
        $get(MasterObj + "MultiDepartment_cmbPerson_txtPCode").disabled = true;
        $get(MasterObj + "MultiDepartment_cmbPerson_txtName").disabled = true;
        $get(MasterObj + "MultiDepartment_cmbPerson_BtnDown").disabled = true;
        $("#ctl00_ContentPlaceHolder1_MultiDepartment_TBMain").show("slow")
        $get(MasterObj + "MultiDepartment_TBMain").all("BtnShowActive").disabled = true;
    }
    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow");
    $("#RDDepartment").click();
    SetSumRowInEditMode();
}
else {
    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow");
    if ($get(MasterObj + "txtKaraneComboboxOption").value != "1") {
        $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow");
        $("#ctl00_ContentPlaceHolder1_UCDepartment_tdBtn").hide()
    }
    else
        $("#ctl00_ContentPlaceHolder1_MultiDepartment_TBMain").show("slow");
    $("#RDDepartment").click();
}
//*****************************************************************************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//*****************************************************************************************************
function BeginRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value
    //-------------------------------------------------------------------------------------------------
    if (StrVal != "Modify" && StrVal != "Filter") {
        // ------------------------------Set Sum Row Attribute-----------------------------------------
        var OGrid = $get(MasterObj + "GrdKaraneReport");
        if (OGrid) {
            //----------------------------------------------
            var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
            var CNature = 0;
            CNameNatureArr = CNameNatureArr.split(',');
            //----------------------------------------------
            for (var i = 0; i < OGrid.rows(1).cells.length; i++)
                if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                    for (var j = 0; j < CNameNatureArr.length; j++) {
                        if (CNameNatureArr[j].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                            var CNature = CNameNatureArr[j].split('#')[1]
                    }
                    if (CNature == "18701")
                        SumArray[i] = SetMinuteTime(OGrid.rows(idx).cells(i).innerText) - SetMinuteTime(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                    else
                        SumArray[i] = parseInt(OGrid.rows(idx).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                }
        }
        //---------------------------------------------------------------------------------------------
    }
    else
        for (var i = 0; i < 100; i++)
            SumArray[i] = 0;

}
//*****************************************************************************************************
function EndRequestHandler(sender, args) {
    $('#DivDesc').bind('dragstop', function (event, ui) {
        Top = ui.offset.top;
        Left = ui.offset.left;
    });
    $("#DivDesc").hide();

    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal == "BtnFirst" || StrVal == "BtnPrev" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "Const" || StrVal == "Confirm")
        SetChk();
    if (StrVal == "Filter" || StrVal == "Modify")
        $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
    //------------------------------------------ 
    if (document.getElementById(MasterObj + "txtAlert").value != "") {
        if (document.getElementById(MasterObj + "txtValidate").value != "1")
            alert($get(MasterObj + "txtAlert").value);
        else
            SetMsg($get(MasterObj + "txtAlert").value);
    }
    //-------------------------------------------------------------------------------------------------
    SetSumRowColor();
    AddRowForDiffValue();
    //------------------------------Set Sum Row Attribute---------------------------------------------- 
    var OGrid = $get(MasterObj + "GrdKaraneReport");
    if (OGrid) {
        //----------------------------------------------
        var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
        var CNature = 0;
        CNameNatureArr = CNameNatureArr.split(',');
        //----------------------------------------------
        for (var i = 0; i < OGrid.rows(1).cells.length; i++) {
            if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                var PageVal = 0;
                for (var k = 0; k < CNameNatureArr.length; k++) {
                    if (CNameNatureArr[k].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                        var CNature = CNameNatureArr[k].split('#')[1]
                }
                for (var j = 1; j < idx; j++) {
                    if (OGrid.rows(j).cells(i).firstChild.value != "" && OGrid.rows(j).cells(i).firstChild.value != "00:00")
                        if (CNature == "18701")
                            PageVal += parseInt(SetMinuteTime(OGrid.rows(j).cells(i).firstChild.value));
                        else
                            PageVal += parseInt(OGrid.rows(j).cells(i).firstChild.value);
                }
                OGrid.rows(idx).cells(i).PageVal = PageVal;
                if (CNature == "18701") {
                    OGrid.rows(idx).cells(i).innerText = SetHourlyTime(parseInt(SumArray[i]) + SetMinuteTime(OGrid.rows(idx).cells(i).innerText));
                    OGrid.rows(idx + 2).cells(i).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx + 1).cells(i).innerText)) - parseInt(SetMinuteTime(OGrid.rows(idx).cells(i).innerText)));
                }
                else {
                    OGrid.rows(idx).cells(i).innerText = parseInt(SumArray[i]) + parseInt(OGrid.rows(idx).cells(i).innerText);
                    OGrid.rows(idx + 2).cells(i).innerText = parseInt(OGrid.rows(idx + 1).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).innerText);
                }


            }
        }
    }

    //             ------------------------------------------------------------------------------------------------
    if ($get(MasterObj + "txtStatusID").value == "0") {
        document.getElementById('OToolBar_BtnSave').style.display = "none";
        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
    }
    else {
        document.getElementById('OToolBar_BtnSave').style.display = "inline";
        document.getElementById('OToolBar_BtnConfirm').style.display = "inline";
    }
    //-------------------------------------------------------------------------------------------------
    if ($get(MasterObj + "txtTableName").value != "") {
        if ($get(MasterObj + "txtModifyFlag").value != "" && $get(MasterObj + "txtModifyFlag").value == "0")
            document.getElementById('OToolBar_BtnSave').style.display = "none";
        document.getElementById('OToolBar_BtnFilter').style.display = "none";
        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
    }
    execScript("1");
    //-------------------------------------------------------------------------------------------------
    document.getElementById(MasterObj + "txtAlert").value = ""
    document.getElementById(MasterObj + "txtValidate").value = ""
    document.getElementById(MasterObj + "txtSubmit").value = ""
    LastSelectedRow = null;
}
//===============================================Paging=================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        document.getElementById(MasterObj + "txtSubmit").value = "Const"
        document.getElementById(MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
    document.getElementById(MasterObj + "BtnSubmit").click()
}
//=============================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//=============================================================================
function OnKeyEnter(Obj) {
    if (event.keyCode == 13) {
        switch (Obj.id) {
            case MasterObj + "CmbWorkPeriod":
                $get(MasterObj + "CmbPerson_txtCode").focus();
                $get(MasterObj + "CmbPerson_txtCode").setActive();
                break;
        }
    }
}
//=============================================================================
$(document).ready(function () {
    $("#RDPerson").click(function () {
        var CheckVal = $('[name="RDFilter"]:checked').val()
        if (CheckVal == 0) {
            if ($get(MasterObj + "txtKaraneComboboxOption").value != "1")
                $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
            else
                $("#ctl00_ContentPlaceHolder1_MultiDepartment_TBMain").hide();
            $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow")
        }
    })
    $("#RDDepartment").click(function () {
        var CheckVal = $('[name="RDFilter"]:checked').val()
        if (CheckVal == 2) {
            $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
            if ($get(MasterObj + "txtKaraneComboboxOption").value != "1")
                $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow")
            else
                $("#ctl00_ContentPlaceHolder1_MultiDepartment_TBMain").show("slow")
        }
    })

})
//=============================================================================
function OnClickBtnFilter() {
    //----------------------------------------------------------------------------------------------
    var PrsCode = "", MultiDepartment = "", DepartmentID = "0", DeptName;
    if ($get(MasterObj + "txtKaraneComboboxOption").value != "1") {
        DepartmentID = $get(MasterObj + "UCDepartment_cmbDepartment").value;
        DeptName = $get(MasterObj + "UCDepartment_cmbDepartment").all.item($get(MasterObj + "UCDepartment_cmbDepartment").selectedIndex).text;
    }
    //----------------------------------------------------------------------------------------------
    else {
        MultiDepartment = $("#" + MasterObj + "MultiDepartment_txtHidden").val();
        if (MultiDepartment != "") {
            var Departments = "<Root>" + $("#" + MasterObj + "MultiDepartment_txtHidden").val() + "</Root>", DeptString = '';
            if (window.ActiveXObject) {
                xml = new ActiveXObject("Microsoft.XMLDOM");
                xml.async = "false";
                xml.loadXML(Departments);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Departments, 'text/xml');
            }
            $(xml)
                .find("Root").find("Tb").each(function () {
                    DeptString = DeptString + "," + $(this).find('DepartmentID').text();
                });
            DepartmentID = DeptString.substring(1, DeptString.length)
        } else
            DepartmentID = $("#" + MasterObj + "MultiDepartment_cmbDepartment").val()

        DeptName = $("#" + MasterObj + "MultiDepartment_cmbPerson_txtName").val();
    }
    //----------------------------------------------------------------------------------------------
    if ($get(MasterObj + "CmbPerson_txtCode").value != undefined)
        PrsCode = $get(MasterObj + "CmbPerson_txtCode").value.trim();


    if ((DepartmentID == "0" || DepartmentID == undefined) && (MultiDepartment == "" || MultiDepartment == "<Root></Root>")) {
        alert("لطفا فيلتر واحدسازماني را انتخاب کنيد")
    }
    else {
        $get(MasterObj + "txtMType").value = "D";
        $get(MasterObj + "txtMemberID").value = DepartmentID;
        $get(MasterObj + "txtMName").value = DeptName;
        $get(MasterObj + "txtDepartment").value = "<Root>" + MultiDepartment + "</Root>";
        $get(MasterObj + "txtWPID").value = $get(MasterObj + "CmbWorkPeriod").value;
        $get(MasterObj + "txtGroupID").value = $get(MasterObj + "CmbGroup").value;
        $get(MasterObj + "txtPCodeTemp").value = PrsCode;
        $get(MasterObj + "txtChkChildren").value = $get(MasterObj + "chkChildren").checked == true ? "1" : "0";
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//=========================================================================================================
function SetChk() {
    var OGrid = document.getElementById(MasterObj + "GrdKaraneReport");
    if (OGrid == null)
        return
    var PageSize = OGrid.rows.length - 1;
    var ColCount = OGrid.rows(0).cells.length;
    var strXml = $get(MasterObj + 'txtXmlSave').value
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB");
    if (oXmlNodes.length > 0) {
        for (j = 0; j < oXmlNodes.length; j++) {
            for (i = 1; i < PageSize; i++) {
                if (OGrid.rows(i).PersonelID == oXmlNodes.item(j).selectSingleNode("PId").text) {
                    for (var k = 2; k < ColCount; k++) {
                        if (OGrid.rows(i).cells(k).cellIndex == oXmlNodes.item(j).selectSingleNode("cellIndex").text) {
                            var cellIndex = OGrid.rows(i).cells(k).cellIndex;
                            OGrid.rows(i).cells(cellIndex).firstChild.value = oXmlNodes.item(j).selectSingleNode("RealVal").text
                            OGrid.rows(i).cells(cellIndex).childNodes[1].setAttribute("Descr", oXmlNodes.item(j).selectSingleNode("Descr").text);
                        }
                    }
                }
            }
        }
    }
}
//==================================================================================
function OnBlurCellCode(Obj) {
    var oRow = Obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    var cellIndex = Obj.parentElement.cellIndex;
    var CName = Obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
    var PId = Obj.parentElement.parentElement.PersonelID;
    var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
    var CNature = 0;
    CNameNatureArr = CNameNatureArr.split(',');
    for (var i = 0; i < CNameNatureArr.length; i++) {
        if (CNameNatureArr[i].split('#')[0] == CName)
            var CNature = CNameNatureArr[i].split('#')[1]
    }
    if (Obj.value != "" || Obj.value != "0") {
        if (CNature == "18701")
            TimechkNew(Obj);
        else
            Obj.value = Obj.value.split(":")[0];
    }
    //-------------------------------------------------------------------------------------------------
    execScript("2", Obj);
    //-------------------------------------------------------------------------------------------------
    var strXml = "";
    var OGrid = $get(MasterObj + "GrdKaraneReport");
    var CellVal = 0;
    if (Obj.value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB[PId=" + PId + " and CName='" + CName + "']");
        ///////////////////////////////////////////////////////////////////////////////
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
        }
        var Value = Obj.value;
        if (CNature == "18701")
            Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
        //                if (Value != "0") {

        strXml += "<TB>";
        strXml += "<PId>" + PId + "</PId>";
        strXml += "<CName>" + CName + "</CName>";

        strXml += "<Val>" + Value + "</Val>";
        strXml += "<RealVal>" + Obj.value + "</RealVal>";
        strXml += "<cellIndex>" + cellIndex + "</cellIndex>";
        strXml += "<Descr>" + OGrid.rows(oIndex).cells(cellIndex).childNodes[1].Descr + "</Descr>";
        strXml += "</TB>";
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + strXml + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/TB");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
    }
    //---------------------------Set Sum Row Value-----------------------------------------------------
    if (OGrid) {
        for (var i = 1; i < idx; i++) {
            if (OGrid.rows(i).cells(cellIndex).firstChild.value != "" && OGrid.rows(i).cells(cellIndex).firstChild.value != "00:00")
                if (CNature == "18701")
                    CellVal += parseInt(SetMinuteTime(OGrid.rows(i).cells(cellIndex).firstChild.value));
                else
                    CellVal += parseInt(OGrid.rows(i).cells(cellIndex).firstChild.value);
        }
        if (CNature == "18701") {
            OGrid.rows(idx).cells(cellIndex).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal"))) + parseInt((CellVal - OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex]);
            OGrid.rows(idx + 2).cells(cellIndex).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx + 1).cells(cellIndex).innerText)) - parseInt(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).innerText)));
        }
        else {
            OGrid.rows(idx).cells(cellIndex).innerText = parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal") == "00:00" ? 0 : OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal")) + parseInt(CellVal - parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex];
            OGrid.rows(idx + 2).cells(cellIndex).innerText = parseInt(OGrid.rows(idx + 1).cells(cellIndex).innerText) - parseInt(OGrid.rows(idx).cells(cellIndex).innerText);
        }
    }
}
//==============================================================================================================
function OnClickBtnSave() {
    $get(MasterObj + "txtConfirm").value = 0;
    $get(MasterObj + "txtSubmit").value = "Modify";
    $get(MasterObj + "BtnSubmit").click();
}
//==============================================================================================================
function OnClickBtnConfirm() {
    if ($get(MasterObj + "txtGroupID").value != "0")
        alert("امکان تاييد با انتخاب فيلتر گروه وجود ندارد");
    else {
        $get(MasterObj + "txtConfirm").value = 1;
        $get(MasterObj + "txtSubmit").value = "Confirm";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//==============================================================================================================
function OnClickBtnNotAccept() {
    var Msg = "آیا برای عدم تاييد مطمئنید؟"
    if (confirm(Msg)) {
        $get(MasterObj + "txtConfirm").value = 2;
        $get(MasterObj + "txtSubmit").value = "Modify";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//==============================================================================================================
function OnClickBtnErjaToStepBefor() {
    var Msg = "آیا برای ارجاع به مرحله قبل مطمئنید؟"
    if (confirm(Msg)) {
        $get(MasterObj + "txtConfirm").value = -1;
        $get(MasterObj + "txtSubmit").value = "Modify";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//==============================================================================================================
function OnClickBtnErjaToRequester() {
    $get(MasterObj + "txtConfirm").value = -2;
    $get(MasterObj + "txtSubmit").value = "Modify";
    $get(MasterObj + "BtnSubmit").click();
}
//==============================================================================================================
function OnFocusCellCode(obj) {
    obj.select();
    obj.focus();
}
//==============================================================================================================
function checkEnter(obj) {
    var OGrid = obj.parentElement.parentElement.parentElement;
    var grdLen = OGrid.rows.length;
    if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
        grdLen = grdLen - 1;

    var row = obj.parentElement.parentElement;
    var CellIndex = obj.parentElement.cellIndex;
    var CellLeng = ColCount = OGrid.rows(0).cells.length;
    //-----------------------مقدار دهی نوع کلید فشرده شده-----------      
    WindowEvent = window.event.keyCode
    //-----------------------------------------------تشخیص نوع کلید
    switch (WindowEvent) {
        case 40: //---------------اروکی بالا
            var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
            if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
            }
            else if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                rowIndex = rowIndex + 1
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
            }
            break;
        case 39: //---------------اروکی راست    
            CellIndex = CellIndex - 1;
            while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex > 1) {
                CellIndex = CellIndex - 1;
            }
            if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus();
                OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
            }
            break;
        case 38: //----------------اروکی پایین
            var rowIndex = parseInt(row.rowIndex) - 1; //----------index ردیف جدید
            if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
            }
            else if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                rowIndex = rowIndex - 1;
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
            }
            break;
        case 37: //----------------اروکی چپ
            CellIndex = CellIndex < ColCount - 1 ? CellIndex + 1 : CellIndex;
            while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex < ColCount - 1)
                CellIndex = CellIndex + 1;
            if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
            }
            break;
        case 13:
            var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
            if (OGrid.rows(rowIndex) != null && rowIndex != 0) {
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
            }
            break;
    }
}
//==============================================================================================================
function OnKeyDownTimeNew(obj) {
    var cellIndex = obj.parentElement.cellIndex;
    var CName = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
    var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
    var CNature = 0;
    CNameNatureArr = CNameNatureArr.split(',');
    for (var i = 0; i < CNameNatureArr.length; i++) {
        if (CNameNatureArr[i].split('#')[0] == CName)
            CNature = CNameNatureArr[i].split('#')[1]
    }
    if (CNature == "18701")
        OnKeyDownTime();
    else
        OnKeyDownInt(obj);
}
//===============================================================================================================
function TimechkNew(Obj) {
    if (Obj.value.split(":").length == 1)
        Obj.value = Obj.value + ":00";
    else
        if (Obj.value.split(":")[1] > 59) {
            alert("!لطفا ساعت صحيح را وارد کنيد");
            Obj.select();
            Obj.focus();
        }
}
//===============================================================================================================
function OnClickBtnFlow() {
    var DocID = $get(MasterObj + "txtDocID").value;
    var DocTypeID = $get(MasterObj + "txtDocTypeID").value;

    var OGrid = document.getElementById(MasterObj + "GrdKaraneReport");
    if (OGrid != null) {
        if (DocID == 0)
            DocID = 999999999;

        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    }
}
//===============================================================================================================
function SetSumRowColor() {
    var oGrd = document.getElementById(MasterObj + "GrdKaraneReport"), i = 0
    if (oGrd)
        var len = oGrd.rows.length
    else
        return

    if (oGrd.rows(len - 3).cells(i) && oGrd.rows(len - 3).PersonelID == "-1")
        idx = len - 3
    else if (oGrd.rows(len - 2).cells(i) && oGrd.rows(len - 2).PersonelID == "-1")
        idx = len - 2
    try {
        if (idx != 0) {

            while (oGrd.rows(idx).cells(i)) {
                oGrd.rows(idx).className = ""
                oGrd.rows(idx).cells(i).className = ""
                oGrd.rows(idx).className = "CssSumItemStyle"
                oGrd.rows(idx).cells(i).className = "CssSumItemStyle"
                oGrd.rows(idx).cells(0).innerText = "مجموع کل";

                i++
            }
            i = 0;
            while (oGrd.rows(idx + 1).cells(i)) {
                oGrd.rows(idx + 1).className = ""
                oGrd.rows(idx + 1).cells(i).className = ""
                oGrd.rows(idx + 1).className = "CssSumItemStyle"
                oGrd.rows(idx + 1).cells(i).className = "CssSumItemStyle"
                oGrd.rows(idx + 1).cells(0).innerText = " سقف ";

                i++
            }
        }
    }
    catch (ex) { }

}
//================================================================================================================
function SetMinuteTime(Time) {
    var Hour = Time.split(':')[0]
    var Minute = Time.split(':')[1];
    if (Hour.substr(0, 1) == '0')
        Hour = Hour.substr(1, 2);
    if (Minute.substr(0, 1) == '0')
        Minute = Minute.substr(1, 2);
    return parseInt(Hour) * 60 + parseInt(Minute)
}
//================================================================================================================
function SetHourlyTime(Sum) {
    var SignFlag = Sum < 0 ? 1 : 0;
    Sum = Math.abs(Sum);
    var Hour = parseInt(Sum / 60).toString();
    var Minute = Sum % 60
    if (Hour.toString().length == 1)
        Hour = "0" + Hour;
    if (Minute.toString().length == 1)
        Minute = "0" + Minute;
    return Hour + ":" + Minute + (SignFlag == 1 ? "-" : "");
}
//================================================================================================================
function SetSumRowInEditMode() {
    // ------------------------------Set Sum Row Attribute-----------------------------------------
    var OGrid = $get(MasterObj + "GrdKaraneReport");
    if (OGrid) {
        //----------------------------------------------
        var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
        var CNature = 0;
        CNameNatureArr = CNameNatureArr.split(',');
        //----------------------------------------------
        for (var i = 0; i < OGrid.rows(1).cells.length; i++)
            if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                for (var j = 0; j < CNameNatureArr.length; j++) {
                    if (CNameNatureArr[j].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                        var CNature = CNameNatureArr[j].split('#')[1]
                }
                if (CNature == "18701")
                    SumArray[i] = SetMinuteTime(OGrid.rows(idx).cells(i).innerText) - SetMinuteTime(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                else
                    SumArray[i] = parseInt(OGrid.rows(idx).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
            }

        //------------------------------Set Sum Row Attribute---------------------------------------------- 
        var OGrid = $get(MasterObj + "GrdKaraneReport");
        if (OGrid) {
            //----------------------------------------------
            var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
            var CNature = 0;
            CNameNatureArr = CNameNatureArr.split(',');
            //----------------------------------------------
            for (var i = 0; i < OGrid.rows(1).cells.length; i++) {
                if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                    var PageVal = 0;
                    for (var k = 0; k < CNameNatureArr.length; k++) {
                        if (CNameNatureArr[k].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                            var CNature = CNameNatureArr[k].split('#')[1]
                    }
                    for (var j = 1; j < idx; j++) {
                        if (OGrid.rows(j).cells(i).firstChild.value != "" && OGrid.rows(j).cells(i).firstChild.value != "00:00")
                            if (CNature == "18701")
                                PageVal += parseInt(SetMinuteTime(OGrid.rows(j).cells(i).firstChild.value));
                            else
                                PageVal += parseInt(OGrid.rows(j).cells(i).firstChild.value);
                    }
                    OGrid.rows(idx).cells(i).PageVal = PageVal;
                    if (CNature == "18701") {
                        OGrid.rows(idx).cells(i).innerText = SetHourlyTime(parseInt(SumArray[i]) + SetMinuteTime(OGrid.rows(idx).cells(i).innerText));
                        OGrid.rows(idx + 2).cells(i).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx + 1).cells(i).innerText)) - parseInt(SetMinuteTime(OGrid.rows(idx).cells(i).innerText)));
                    }
                    else {
                        OGrid.rows(idx).cells(i).innerText = parseInt(SumArray[i]) + parseInt(OGrid.rows(idx).cells(i).innerText);
                        OGrid.rows(idx + 2).cells(i).innerText = parseInt(OGrid.rows(idx + 1).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).innerText);
                    }


                }
            }
        }
    }
}
//===============================================================================================================
function AddRowForDiffValue() {
    var OGrid = $get(MasterObj + "GrdKaraneReport");
    if (OGrid != null) {
        var len = OGrid.rows.length, rowIndex = 0;
        if (OGrid.rows(len - 1).getAttribute("Footer") == 1)
            rowIndex = len - 1;
        else
            rowIndex = len;
        var oRow = OGrid.insertRow(rowIndex);
        for (var i = 0; i < OGrid.rows(0).cells.length; i++) {
            var oCell = oRow.insertCell();
            oCell.innerHTML = OGrid.rows((oRow.rowIndex) - 1).cells(i).innerHTML;
            oCell.className = "CssSumItemStyle"
        }
        OGrid.rows(oRow.rowIndex).cells(0).innerText = "تفاوت مقادير ";
    }
}
//===============================================================================================================
function OnClickBtnLog() {
    var CheckVal = $('[name="RDFilter"]:checked').val()
    var MemberID, MType;

    switch (CheckVal) {
        case "0":
            MType = "P";
            MemberID = PrsCode;
            break;
        case "2":
            MType = "D";
            if ($get(MasterObj + "txtKaraneComboboxOption").value != "1")
                MemberID = $get(MasterObj + "UCDepartment_cmbDepartment").value;
            else
                MemberID = $("#" + MasterObj + "MultiDepartment_cmbPerson_txtCode").val()
            break;
    }
    var url = "KaraneLog.aspx?ReportID=" + $get(MasterObj + "txtReportID").value
             + "&WPID=" + $get(MasterObj + "CmbWorkPeriod").value
             + "&MemberID=" + MemberID
             + "&MType=" + MType
             + "&Creator=" + $get(MasterObj + "txtCreator").value
             + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    if (LastSelectedRow != null && LastSelectedRow != "")
        url += "&PersonCode=" + LastSelectedRow.cells(0).innerText;
    else
        url += "&PersonCode=";

    window.showModalDialog(url, "", "dialogHeight:600px;dialogWidth:950px;center: Yes;help: no;status: no")
}
//*******************************************************************************
function OnClickBtnDescr(obj) {
    txtFocusText = obj;
    $("#DivDesc").slideUp();
    if (TimeOut != null)
        clearTimeout(TimeOut)
    if (!ISClose) {
        TimeOut = setTimeout("ShowDescription()", 0)
    }
}
//*******************************************************************************
function onclickBtnCloseDesc() {
    $("#DivDesc").slideUp("fast");
    ISClose = false;
    TimeoutObj = null;
}
//*******************************************************************************
function onblurtxtDescript() {
    if (TimeoutObj != null) {
        if (TimeoutObj.getAttribute("Descr") != $get(MasterObj + "txtDescript").value) {
            TimeoutObj.setAttribute("Descr", $get(MasterObj + "txtDescript").value);
            OnChangeTxtDescr(TimeoutObj);
            $get(MasterObj + "txtDescript").value = "";
        }
        $("#DivDesc").slideUp();
        TimeoutObj = null;
    }
}
//*******************************************************************************
function ShowDescription() {
    TimeoutObj = txtFocusText;
    if (TimeoutObj != null) {
        $("#DivDesc").slideUp();
        $("#" + MasterObj + "txtDescript").val(TimeoutObj.getAttribute("Descr"));
        SetPosition(TimeoutObj, $get("DivDesc"));
        $("#DivDesc").slideDown("fast");
    }
}
//*******************************************************************************
function SetPosition(NewObj, Div) {
    var posX = NewObj.offsetLeft;
    var posY = NewObj.offsetTop;

    if (Left != null && Top != null && Div.id == "DivDesc") {
        Div.style.top = Top;
        Div.style.left = Left;
    }
    else {
        while (NewObj.offsetParent) {
            posX = posX + NewObj.offsetParent.offsetLeft;
            posY = posY + NewObj.offsetParent.offsetTop;
            if (NewObj == document.getElementsByTagName('body')[0]) { break }
            else { NewObj = NewObj.offsetParent; }
        }
        Div.style.top = posY + 22;
        Div.style.left = posX - 80;
    }
}
//*******************************************************************************
function OnkeyDownF(obj) {
    if (window.event.keyCode == 113) {
        ISClose = false;
        obj.focus();
    }
    if (window.event.keyCode == 27) {
        onblurtxtDescript();
    }
}
//*******************************************************************************
function OnChangeTxtDescr(obj) {
    var oGrid = obj.parentElement;
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement
    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    var cellIndex = obj.parentElement.cellIndex;
    //========================================================
    var CName = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
    var PId = obj.parentElement.parentElement.PersonelID;

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB[PId=" + PId + " and CName='" + CName + "']");
    if (oXmlNodes.length > 0) {
        var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
        f.selectSingleNode("Descr").text = oGrid.rows(oIndex).cells(cellIndex).childNodes[1].Descr;
        oXmlDoc.childNodes[0].appendChild(f);
        $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
    }
    else {
        if (oGrid.rows(oIndex).cells(cellIndex).firstChild.value != ""
                 && oGrid.rows(oIndex).cells(cellIndex).firstChild.value != "00:00")
            OnBlurCellCode(oGrid.rows(oIndex).cells(cellIndex).firstChild);
    }
}
//=================================================================================================================
function OnClickBtnAllPDF() {
    document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//=================================================================================================================
function OnClickBtnOnePDF() {
    document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//=================================================================================================================
function OnClickBtnAllExcel() {
    document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//=================================================================================================================
function OnClickBtnOneExcel() {
    document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
    document.getElementById(MasterObj + "BtnSubmitSend").click()
}
//=================================================================================================================
function GetAccessBtn() {

    if (window.ActiveXObject) {
        // code for IE6, IE5
        xmlDoc = new ActiveXObject("MsXml2.DomDocument")
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")

        var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")

        if (xmlNodes.length != 0) {
            if (xmlNodes.item(0).selectSingleNode('GroupFilter')
                      && xmlNodes.item(0).selectSingleNode('GroupFilter').text == 2) {
                document.getElementById(MasterObj + "CmbGroup").style.display = "none"
                document.getElementById("TDGroup").style.display = "none"
                document.getElementById("TDGroupName").style.display = "none"

            }
            if (xmlNodes.item(0).selectSingleNode('chkChildrenFilter')
                      && xmlNodes.item(0).selectSingleNode('chkChildrenFilter').text == 2) {
                document.getElementById("TDCHKChildren").style.display = "none";
                document.getElementById("TDChildren").style.display = "none";
            }
        }
    }
}
//=================================================================================================================
function execScript(StepID, Obj) {
    var ScriptID, ScriptStep, ScriptCommand, HasMember;
    var StrScripts = $("#" + MasterObj + "txtJsScript").val();
    var ScriptCount = StrScripts.split('#').length;
    var PersonelID = $(Obj).parent().parent().attr("PersonelID");
    //-------------------------------------------------------------
    for (var i = 0; i < ScriptCount; i++) {
        ScriptID = StrScripts.split('#')[i].split('$')[0];
        ScriptStep = StrScripts.split('#')[i].split('$')[1];
        ScriptCommand = StrScripts.split('#')[i].split('$')[2];
        HasMember = StrScripts.split('#')[i].split('$')[3];
        //---------------------------------------------------------
        if (ScriptStep == StepID
        && (HasMember == 0 || chkExistsMember(PersonelID, ScriptID)))
            eval(ScriptCommand);
    }
}
//=================================================================================================================
function chkExistsMember(PersonelID, ScriptID) {
    var Data = $("#" + MasterObj + "txtXMLJsScriptMember").val(), XmlNodes;
    var retVal = false;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML(Data);
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString(Data, 'text/xml');
    }
    XmlNodes = $(xml).find("KaraneEntity").find("JsScriptMember").find("PersonelID").filter(function () {
        return $(this).text().toString().trim() == PersonelID.toString().trim()
    });
  
    if ($(XmlNodes).length > 0) {
        $(XmlNodes).each(function () {
            if ($(this).siblings("ScriptID").text() == ScriptID)
                retVal = true;
        });
    }
    return retVal;
}
//=================================================================================================================