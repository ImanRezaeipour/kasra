var CodeValueV = "", CodeNamesV = "", CodeNamesTitleV = "", CodeValueE = "", CodeNamesE = "", CodeNamesTitleE = "", OldVal = "", OldPVal = "";
var TimeOut = null, TimeoutObj = null, ISClose = false, txtFocusText = null;
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var PageNumber = 1, PageSize = 10;
var xmlRepeatedItemGrd = "";
$("#" + MasterObj + 'txtXmlSave').val("<Root></Root>");
document.body.style.overflowX = "hidden";
document.body.style.overflowY = "hidden";
$("document").ready(function () {
    $('#DivDesc').draggable();
    $('#DivDesc').bind('dragstop', function (event, ui) {
        Top = ui.offset.top;
        Left = ui.offset.left;
    });
    $("#DivDesc").hide();
});
//*******************************************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
}
//====================================================================================
function EndRequestHandler(sender, args) {
    switch ($get(MasterObj + "txtSubmit").value) {
        case "New":
            $("#" + MasterObj + 'txtXmlSave').val("<Root></Root>");
            if ($("#" + MasterObj + 'txtValidate').val() == "0") {
                alert($("#" + MasterObj + "txtAlert").val());
            }
            break;
        case "Modify":
            var OGrd = $("#" + MasterObj + "GrdGrantCode");
            if ($("#" + MasterObj + "txtValidate").val() == "1") {
                if (OGrd != null)
                    SetGrdVal();
                SetMsg($("#" + MasterObj + "txtAlert").val());
                $("#" + MasterObj + 'txtXmlSave').val("<Root></Root>");
            }
            else if ($("#" + MasterObj + "txtValidate").val() == "2") {
                if (OGrd != null)
                    SetGrdVal();
                xmlRepeatedItemGrd = $("#" + MasterObj + "txtAlert").val();
                MakeDivPopup(xmlRepeatedItemGrd);
            }
            else {
                if (OGrd != null)
                    SetGrdVal();
                alert($("#" + MasterObj + "txtAlert").val());
            }
            break;
        case "ReadExcel":
            var Data = $("#" + MasterObj + "txtCodeXml").val();
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            }
            else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            XmlNodes = $(xml).find("Root").find("Tb");
            //---------------------Set Str Code For Bind Grid---------
            var StrCodes = "";
            $(XmlNodes).each(function () {
                StrCodes = StrCodes == "" ? $(this).find("CodeID").text() : StrCodes + "," + $(this).find("CodeID").text();
            });
            $("#" + MasterObj + "txtEditableCodeStr").val(StrCodes);
            //--------------------------------------------------------
            break;
        case "Filter":
            if ($("#" + MasterObj + 'txtValidate').val() == "0") {
                alert($("#" + MasterObj + "txtAlert").val());
            }
            break;
    }
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");
    $("#" + MasterObj + "txtValidate").val("");
    $("#" + MasterObj + "chkSelected").attr("checked", false);
    PageNumber = 1;
}
//===========================================================================================================
function OnClickBtnNew() {
    if ($("#" + MasterObj + "txtEditableCode").val()=="") {
        alert("لطفا کدهاي مورد نظر را انتخاب نماييد");
        $("#" + MasterObj + "btnEditableCode").focus();
        return
    }
    if ($("#" + MasterObj + "txtMemberXML").val() != "<Root></Root>" &&
          $("#" + MasterObj + "txtMemberXML").val() != "" &&
          $("#" + MasterObj + "txtMemberXML").val() != "<Root/>") {
        $("#" + MasterObj + "txtMode").val("New");
        $("#" + MasterObj + "txtSubmit").val("New");
        $("#" + MasterObj + "BtnSubmit").click();
    }
    else {
        $("#" + MasterObj + "txtMemberXML").val("<Root></Root>")
        $("#" + MasterObj + "txtMode").val("New");
        $("#" + MasterObj + "txtSubmit").val("New");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//===========================================================================================================
function OnClickBtnSave() {
    var IsEmpty = false;
    var StrMsg = "";
    //----------check PersonID Not Empty------------------
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML($("#" + MasterObj + "txtXmlSave").val());
    }
    else {
        var parser = new DOMParser();
        xml = parser.parseFromString(Data, 'text/xml');
    }
    XmlNodes = $(xml).find("Root").find("Tb").find("PID").filter(function () {
        return $(this).text().toString().trim() == "0";
    });
   
    if ($(XmlNodes).length > 0) {
        $(XmlNodes).each(function () {
            if ($(this).siblings("Chk").text() == "1") {
                IsEmpty = true;
                StrMsg += " در سطر " + $(this).siblings("Row").text() + " کد پرسنلي را وارد نماييد  ";
                $("#" + MasterObj + "GrdGrantCode").find("tr:eq(" + $(this).siblings("Row").text() + ")").find("td:eq(1)").children().focus();
            }
        });
    }
    if (!IsEmpty) {
        //----------------------------------------------------
        $("#" + MasterObj + "txtSubmit").val("Modify");
        $("#" + MasterObj + "BtnSubmit").click();
        //----------------------------------------------------
    }
    else
        alert(StrMsg);
}
//===========================================================================================================
function OnClickBtnDel() {
    var OGrid = $("#" + MasterObj + "GrdGrantCode");
    var rowLen = OGrid.find("tr").length;
    var colLen = OGrid.find("tr:eq(1)").find("td").length;
    var XmlDel = "<Root>";
    for (var i = 0; i < rowLen; i++) {
        if (OGrid.find("tr:eq(" + i + ")").find("td:eq(0)").children().attr("checked")) {
            for (var j = 4; j < colLen; j++) {
                if (OGrid.find("tr:eq(" + i + ")").find("td:eq(" + j + ")").children().length > 1
                && OGrid.find("tr:eq(" + i + ")").find("td:eq(" + j + ")").children().attr("SCVID") != "0") {
                    XmlDel += "<Tb>";
                    XmlDel += "<SCVID>" + OGrid.find("tr:eq(" + i + ")").find("td:eq(" + j + ")").children().attr("SCVID") + "</SCVID>";
                    XmlDel += "<Chk>-1</Chk>";
                    XmlDel += "</Tb>";
                }
            }
        }
    }
    XmlDel += "</Root>";
    if (XmlDel != "<Root></Root>") {
        $("#" + MasterObj + "txtMode").val("Save");
        $("#" + MasterObj + "txtSubmit").val("Modify");
        $("#" + MasterObj + "txtXmlSave").val(XmlDel)
        $("#" + MasterObj + "BtnSubmit").click();
    }
    else
        alert("مقداری برای حذف وجود ندارد");
}
//===========================================================================================================
function OnClickBtnFilter() {
    if ($("#" + MasterObj + "txtEditableCode").val() == "") {
        alert("لطفا کدهاي مورد نظر را انتخاب نماييد");
        $("#" + MasterObj + "btnEditableCode").focus();
        return
    }
    else if ($("#" + MasterObj + "txtMemberXML").val() == "<Root></Root>" ||
          $("#" + MasterObj + "txtMemberXML").val() == "" ||
          $("#" + MasterObj + "txtMemberXML").val() == "<Root/>") {
        alert("لطفا مشمولين مورد نظر را انتخاب نماييد");
        return;
    }
    else {
        $("#" + MasterObj + "txtMode").val("Update");
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//===========================================================================================================
function OnClickBtnMemberFile() {
    var strUrl = "/TAPresentation/App_Pages/DataEntry/GrantCodeMemberFile.aspx"
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, window, 'dialogHeight: 300px;dialogWidth: 450px;center: Yes;help: no;status: no;scroll:no');
    if (rValue != "" && rValue != undefined) {
        $("#" + MasterObj + "txtMode").val("New");
        $("#" + MasterObj + "txtSubmit").val("ReadExcel");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//===========================================================================================================
function OnClickBtnMemberFileDirect() {
    var strUrl = "/TAPresentation/App_Pages/DataEntry/GrantCodeMemberFile.aspx?DirectSend=1&WPID=" + $get(MasterObj + "CmbWorkPeriod").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value;
    strUrl = encodeURI(strUrl)
    window.showModalDialog(strUrl, window, 'dialogHeight: 300px;dialogWidth: 450px;center: Yes;help: no;status: no;scroll:no');
    if ($("#" + MasterObj + "txtRepeatedItem").val() != "") {
        $("#" + MasterObj + "txtAlert").val($("#" + MasterObj + "txtRepeatedItem").val())
        xmlRepeatedItemGrd = $("#" + MasterObj + "txtAlert").val();
        MakeDivPopup(xmlRepeatedItemGrd);
    }
}
//===========================================================================================================
function OnClickBtnSelectGroup() {
    var strUrl = "CreditScriptGroup.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CreditScriptGroup="
                            + "&XmlMode=2";
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, window, 'dialogHeight: 420px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
    if (rValue != "" && rValue != undefined)
        $get(MasterObj + "txtMemberXML").value = rValue;
}
//===========================================================================================================
function onclickbtnEditableCode() {
    var strUrl = "../BaseInfo/CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + CodeValueE
    var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')

    if (rValue != null) {
        LoadXMLCodeSelectorE(rValue);
        $("#" + MasterObj + "txtEditableCodeStr").val(CodeValueE);
        if (CodeNamesE.length > 50)
            CodeNamesTitleE = CodeNamesE.substr(0, 50) + '...';
        else
            CodeNamesTitleE = CodeNamesE;
        $("#" + MasterObj + "txtEditableCode").val(CodeNamesTitleE);
        $("#" + MasterObj + "txtEditableCode").attr("title", CodeNamesE);
    }
}
//===========================================================================================================
function onclickBtnViewableCode() {
    var strUrl = "../BaseInfo/CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + CodeValueV

    var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')

    if (rValue != null) {
        LoadXMLCodeSelectorV(rValue);
        $("#" + MasterObj + "txtViewableCodeStr").val(CodeValueV);
        if (CodeNamesV.length > 50)
            CodeNamesTitleV = CodeNamesV.substr(0, 50) + '...';
        else
            CodeNamesTitleV = CodeNamesV;
        $("#" + MasterObj + "txtViewCode").val(CodeNamesTitleV);
        $("#" + MasterObj + "txtViewCode").attr("title", CodeNamesV);
    }
}
//===========================================================================================================
function LoadXMLCodeSelectorV(rValue) {
    var strXml = rValue;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    if (oXmlDoc.documentElement != null) {
        var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (XmlNodes.length != 0) {
            CodeNamesV = XmlNodes.item(0).selectSingleNode('Name').text;
            CodeValueV = XmlNodes.item(0).selectSingleNode('ID').text;
        }
    }
}
//===========================================================================================================
function LoadXMLCodeSelectorE(rValue) {
    var strXml = rValue;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    if (oXmlDoc.documentElement != null) {
        var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (XmlNodes.length != 0) {
            CodeNamesE = XmlNodes.item(0).selectSingleNode('Name').text;
            CodeValueE = XmlNodes.item(0).selectSingleNode('ID').text;
        }
    }
}
//===========================================================================================================
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
var Type, Top, Left;
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
//===============================================================================================
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
    var CodeID = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).getAttribute("CodeID");
    var PID = obj.parentElement.parentElement.PID;

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[PID =" + PID + " and CodeID='" + CodeID + "']");
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
//===========================================================================================================
function OnFocusPCode(obj) {
    obj.select();
    obj.focus();
    OldPVal = obj.value;
}
//===========================================================================================================
function OnFocusCellCode(obj) {
    obj.select();
    obj.focus();
    OldVal = obj.value;
}
//==================================================================================
function OnBlurCellCode(Obj) {
    var OGrid = $get(MasterObj + "GrdGrantCode");
    var cellIndex = Obj.parentElement.cellIndex;
    var PID = Obj.parentElement.parentElement.PID;
    var CNature = Obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).getAttribute("CodeNature");
    var CodeID = Obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).getAttribute("CodeID");
    var RowIndex = Obj.parentElement.parentElement.rowIndex;

    if (Obj.value != "") {
        if (CNature == "1")
            TimechkNew(Obj);
        else
            Obj.value = Obj.value.split(":")[0];
    }
    if (Obj.value != "" && OldVal != Obj.value) {
        Obj.parentElement.parentElement.parentElement.rows(RowIndex).cells(0).firstChild.checked = true;

        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[PID=" + PID + " and CodeID ='" + CodeID + "']");
        ///////////////////////////////////////////////////////////////////////////////
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
        }
        var Value = Obj.value;
        if (CNature == "1")
            Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
        var strXml = "";
        strXml += "<Tb>";
        strXml += "<PID>" + PID + "</PID>";
        strXml += "<Row>" + RowIndex + "</Row>";
        strXml += "<CodeID>" + CodeID + "</CodeID>";
        strXml += "<Val>" + Value + "</Val>";
        strXml += "<RVal>" + Obj.value + "</RVal>";
        strXml += "<Descr>" + OGrid.rows(RowIndex).cells(cellIndex).childNodes[1].Descr + "</Descr>";
        strXml += "<SCVID>" + Obj.getAttribute("SCVID") + "</SCVID>";
        strXml += "<CIndx>" + cellIndex + "</CIndx>";
        strXml += "<Chk>1</Chk>";
        strXml += "</Tb>";
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + strXml + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
    }
}
//==============================================================================================================
function OnKeyDownTimeNew(obj) {
    var cellIndex = obj.parentElement.cellIndex;
    var CNature = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).getAttribute("CodeNature");
    if (CNature == 1)
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
//==============================================================================================================
function checkEnter(obj) {
    try {
        var OGrid = obj.parentElement.parentElement.parentElement;
        var grdLen = OGrid.rows.length;

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
                CellIndex = CellIndex < ColCount - 1 ? CellIndex + 1 : CellIndex;
                while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex < ColCount - 1)
                    CellIndex = CellIndex + 1;

                if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                    OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus()
                    OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
                }
                if (obj.parentElement.cellIndex + 1 == ColCount) {
                    if (OGrid.rows(row.rowIndex + 1) != null) {
                        if (OGrid.rows(row.rowIndex + 1).cells(1).firstChild.disabled == false) {
                            OGrid.rows(row.rowIndex + 1).cells(1).firstChild.focus()
                            OGrid.rows(row.rowIndex + 1).cells(1).firstChild.select()
                        }
                        else
                            checkEnter(OGrid.rows(row.rowIndex + 1).cells(1).firstChild);
                    }
                    else {
                        InsertNewRow(row.rowIndex);
                        //                        OGrid.rows(row.rowIndex + 1).cells(1).firstChild.focus()
                        //                        OGrid.rows(row.rowIndex + 1).cells(1).firstChild.select()
                    }
                }
                break;
        }
    }
    catch (ex) { }
}
//===========================================================================================================
function InsertNewRow(rowIndex) {
    var OGrd = $("#" + MasterObj + "GrdGrantCode");
    OGrd.append("<tr></tr>");
    OGrd.find("tr:eq(" + rowIndex + ")").find("td").each(function () {
        OGrd.find("tr:eq(" + (rowIndex + 1) + ")").append("<td>" + $(this).html() + "</td>");
    });
    OGrd.find("tr:eq(" + (rowIndex + 1) + ")").attr("PID", 0);
    OGrd.find("tr:eq(" + (rowIndex + 1) + ")").find("td:eq(0)").children().attr("checked", false);

    OGrd.find("tr:eq(" + (rowIndex + 1) + ")").find("td").each(function () {
        switch ($(this).children().length) {
            case 0:
                $(this).text("");
                break;
            case 1:
                $(this).children().val("");
                break;
            case 2:
                $(this).children(0).val("");
                $(this).children(1).attr("Descr", "");
                break;
        }
    });
}
//===========================================================================================================
function OnBlurTxtPCode(obj) {
    DelPrevPerson();
    if ($(obj).val() != "" && OldPVal != $(obj).val()) {
        var oGrid = $("#" + MasterObj + "GrdGrantCode");
        var RowIndex = obj.parentElement.parentElement.rowIndex;
        var RepeatedCode = true;
        oGrid.find("tr").each(function () {
            if ($(this).find("td:eq(1)").children().val() == $(obj).val() && RowIndex != $(this).index() && RepeatedCode == true) {
                alert("کد پرسنلي تکراري است");
                $(obj).parent().parent().find("td:eq(1)").children().select();
                $(obj).parent().parent().find("td:eq(1)").children().val("");
                $(obj).parent().parent().find("td:eq(2)").text("");
                $(obj).parent().parent().find("td:eq(3)").text("");
                RepeatedCode = false;
                return;
            }
        });
        if (RepeatedCode)
            FindPerson(obj);
    }
    else {
        if ($(obj).val() == "") {
//            alert("کد پرسنلي را وارد نماييد");
//            $(obj).parent().parent().find("td:eq(1)").children().focus();
            $(obj).parent().parent().find("td:eq(2)").text("");
            $(obj).parent().parent().attr("PID", "0");
        }
    }
}
//---------------------------------------------------------------------------------------------------
function DelPrevPerson() {
    var oXmlDocMember = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDocMember.async = "false";
    oXmlDocMember.loadXML($get(MasterObj + 'txtMemberXML').value);
    if (OldPVal != "") {
        var oXmlNodesMember = oXmlDocMember.documentElement.selectNodes("/Root/Tb[MID=" + OldPVal + "]");
        if (oXmlNodesMember.length > 0) {
            var f = oXmlDocMember.documentElement.removeChild(oXmlNodesMember.item(0));
            $get(MasterObj + 'txtMemberXML').value = oXmlDocMember.xml;
        }
    }
}
//لود نام پرسنلی وقتی کد را تغییر می دهیم-----------------------------------------------------------
function FindPerson(PersonCodeObj) {
    var XmlMember = "<Root><Tb><MID>" + $(PersonCodeObj).val() + "</MID><Type>U</Type></Tb></Root>";
    $.ajax({
        type: "POST",
        url: "GrantStaticCode.aspx/GetPesonStaticCode?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{WPID:" + $("#" + MasterObj + "CmbWorkPeriod").val() + ",EditableCode:'" + $("#" + MasterObj + "txtEditableCodeStr").val() + "',ViewableCode:'" + $("#" + MasterObj + "txtViewableCodeStr").val() + "',XmlMember:'" + XmlMember + "',CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " }",
        success: function (Data) {
            var strXml = Data.d, XmlNodes;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml)

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/NewDataSet/PersonelGrantCode[PCode=" + $(PersonCodeObj).val() + "]");

            if (oXmlNodes.length > 0) {
                //---------------------Update New Row Values-------------------------------
                var oGrid = $("#" + MasterObj + "GrdGrantCode");
                var RowIndex = PersonCodeObj.parentElement.parentElement.rowIndex;
                var PID = oXmlNodes.item(0).selectSingleNode("PID").text
                var PName = oXmlNodes.item(0).selectSingleNode("PName").text
                var DeptName = oXmlNodes.item(0).selectSingleNode("DeptName").text
                $(PersonCodeObj).parent().parent().find("td:eq(2)").text(PName);
                $(PersonCodeObj).parent().parent().find("td:eq(3)").text(DeptName);
                $(PersonCodeObj).parent().parent().attr("PID", PID);
                for (var i = 4; i < oGrid.find("tr:eq(1)").find("td").length; i++) {
                    for (var j = 7; j < oXmlNodes.item(0).childNodes.length; j++) {
                        var colName = $get(MasterObj + "GrdGrantCode").rows(0).children(i).innerText;
                        colName = ReplaceAll(colName, " ", "_")
                        if (oXmlNodes.item(0).childNodes[j].tagName == colName) {
                            oGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(" + i + ")").text(oXmlNodes.item(0).selectSingleNode(oXmlNodes.item(0).childNodes[j].tagName).text)
                        }
                    }
                }
                //-----------------------------Update Xml Save-----------------------------
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[Row=" + RowIndex + "]");
                if (oXmlNodes.length > 0) {
                    for (var i = 0; i < oXmlNodes.length; i++) {
                        var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(i));
                        f.selectSingleNode("PID").text = PID
                        oXmlDoc.childNodes[0].appendChild(f);
                        $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
                    }
                }
                //-----------------------------Update Xml Persons-----------------------------
                var oXmlDocMember = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDocMember.async = "false";
                oXmlDocMember.loadXML($get(MasterObj + 'txtMemberXML').value);
                var oXmlNodesMember = oXmlDocMember.documentElement.selectNodes("/Root/Tb[MID=" + $(PersonCodeObj).val() + "]");
                if (oXmlNodesMember.length == 0) {
                    var strXml = "";
                    strXml += "<Tb>";
                    strXml += "<MID>" + $(PersonCodeObj).val() + "</MID>";
                    strXml += "<MName>" + PName + "</MName>";
                    strXml += "<MPID>" + PID + "</MPID>";
                    strXml += "<Type>U</Type>";
                    strXml += "</Tb>";
                    var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
                    oXmlDocTemp.async = "false";
                    oXmlDocTemp.loadXML("<Root>" + strXml + "</Root>")
                    var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
                    oXmlDocMember.childNodes[0].appendChild(XmlNodeTemp);
                    $get(MasterObj + 'txtMemberXML').value = oXmlDocMember.xml;
                }
                //=========================================================================
            }
            else {
                $(PersonCodeObj).parent().parent().attr("PCode", "")
                $(PersonCodeObj).val("");
                $(PersonCodeObj).parent().parent().find("td:eq(2)").text("");
                $(PersonCodeObj).parent().parent().find("td:eq(3)").text("");
                alert("کد پرسنلی نا معتبر است");
                $(PersonCodeObj).select();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
        }
    });
}
//===========================================================================================================
function OnClickChkHeader(Obj) {
    var OGrid = $get(MasterObj + "GrdGrantCode");
    var PageSize = OGrid.rows.length;
    for (var i = 0; i < PageSize; i++) {
        if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
            OGrid.rows(i).cells(0).firstChild.checked = Obj.checked
            OnClickChk(OGrid.rows(i).cells(0).firstChild);
        }
    }
}
//===========================================================================================================
function OnClickChk(Obj) {
    var PID = Obj.parentElement.parentElement.PID
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[PID=" + PID + "]");
    if (oXmlNodes.length > 0) {
        if (Obj.checked == true) {
            for (var i = 0; i < oXmlNodes.length; i++) {
                var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(i));
                f.selectSingleNode("Chk").text = 1;
                oXmlDoc.childNodes[0].appendChild(f);
            }
        }
        else {
            for (var i = 0; i < oXmlNodes.length; i++) {
                var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(i));
                f.selectSingleNode("Chk").text = 0;
                oXmlDoc.childNodes[0].appendChild(f);
            }
        }
    }
    $("#" + MasterObj + "txtXmlSave").val(oXmlDoc.xml);
}
//===========================================================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//===========================================================================================================
function MakeDivPopup(XmlGrid) {
    DivPopup.style.display = "inline";
    ClearGrdDivPopup();
    MakeGridRepeatedData("<Root>" + XmlGrid + "</Root>");
    $get("BtnSaveChange").select();
}
//===========================================================================================================
function MakeGridRepeatedData(XmlGrd) {
    var endFor = 0;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML(XmlGrd);
    }
    else {
        var parser = new DOMParser();
        xml = parser.parseFromString(Data, 'text/xml');
    }
    var XmlNodes = $(xml).find("Root").find("WP");
    $("#" + MasterObj + "txtTotalPage").val(parseInt($(XmlNodes).length));

    if ($("#" + MasterObj + "txtTotalPage").val() < PageNumber * PageSize)
        endFor = $("#" + MasterObj + "txtTotalPage").val();
    else
        endFor = PageNumber * PageSize;
    //----------------------------------------------------------------
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)
    //----------------------------------------------------------------
    for (var i = ((PageNumber - 1) * PageSize) + 1; i <= endFor; i++) {
        //---------------Set Checkbox------------------------------------------
        var checked = false;
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb  [SCVID=" + $($(XmlNodes)[i - 1]).find("ID").text() + "and Chk=-1 ]");
        if (oXmlNodes.length > 0)
            checked = true;
        //---------------------------------------------------------------------
        $("#RepeatedDataTable").append("<tr class='CssNewRow'  valign='middle'  SCVID='" + $($(XmlNodes)[i - 1]).find("ID").text() + "' >" +
                "<td  style='width: 20px' align='right'> <input type='checkbox' > </td>" +
                "<td style='width: 50px' align='right'>" + $($(XmlNodes)[i - 1]).find("PCode").text() + "</td>" +
                "<td style='width: 150px;text-align:right' align='right'> " + $($(XmlNodes)[i - 1]).find("PName").text() + " </td>" +
                "<td  style='width: 100px;text-align:right' align='right' > " + $($(XmlNodes)[i - 1]).find("CName").text() + " </td>" +
                "<td  style='width: 50px;text-align:center' align='right'  >" + $($(XmlNodes)[i - 1]).find("Value").text() + "</td>" +
                "<td  style='width: 250px;text-align:right' align='right'  >" + $($(XmlNodes)[i - 1]).find("Descr").text() + "</td></tr>");
        $("#RepeatedDataTable").find("tr").last().find("td:eq(0)").children(0).attr("checked", checked);
        $("#RepeatedDataTable").find("tr").last().find("td:eq(0)").children(0).click(function () {
            OnClickBtnDelItem(this);
        });
        if (checked)
            $("#RepeatedDataTable").find("tr").last().addClass("DelClass");
    }
    $("#RepeatedDataTable").find("tr:eq(0)").find("td:eq(0)").children(0).attr("checked", false);
    SetPagingInfo();
}
//===========================================================================================================
function ClearGrdDivPopup() {
    $(".CssNewRow").remove();
}
//===========================================================================================================
function OnClickBtnDelItem(Obj) {
    var SCVID = Obj.parentElement.parentElement.SCVID
    var RowIndex = Obj.parentElement.parentElement.rowIndex;
    var XmlStr = "";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb  [SCVID=" + SCVID + "and Chk=-1 ]");
    //========================================================
    if (oXmlNodes.length > 0) {
        $("#RepeatedDataTable").find("tr:eq(" + RowIndex + ")").removeClass("DelClass");
        if ($(Obj).attr("checked") == false)
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
        $("#" + MasterObj + 'txtXmlSave').val(oXmlDoc.xml);
    }
    else {
        $("#RepeatedDataTable").find("tr:eq(" + RowIndex + ")").addClass("DelClass");
        XmlStr += "<Tb>";
        XmlStr += "<SCVID>" + SCVID + "</SCVID>";
        XmlStr += "<Chk>-1</Chk>";
        XmlStr += "</Tb>";
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + XmlStr + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        $("#" + MasterObj + 'txtXmlSave').val(oXmlDoc.xml);
    }
}
//===========================================================================================================
function OnkeyDownModal(Obj) {
    var key = window.event.keyCode;
    switch (key) {
        case 13:
            if (Obj.id == "BtnSaveChange")
                onclickBtnSaveChanges();
            else if (Obj.id == "BtnCloseItem")
                onclickBtnCloseItem();
            break;
        case 37:
            if (Obj.id == "BtnCloseItem")
                $get("BtnNewItem").focus();
            else if (Obj.id == "BtnSaveChange")
                $get("BtnSaveChange").focus();
            break;
        case 39:
            if (Obj.id == "BtnCloseItem")
                $get("BtnEditItem").focus();
            else if (Obj.id == "BtnSaveChange")
                $get("BtnSaveChange").focus();
            break;
    }
}
//===========================================================================================================
function onclickBtnCloseItem() {
    PageNumber = 1;
    DivPopup.style.display = "none";
}
//===========================================================================================================
function onclickBtnSaveChanges() {
    PageNumber = 1;
    DivPopup.style.display = "none";
    $("#" + MasterObj + "txtMode").val("Save");
    $("#" + MasterObj + "txtSubmit").val("Modify");
    $("#" + MasterObj + "BtnSubmit").click();
}
//===========================================================================================================
function SetGrdVal() {
    var OGrid = $("#" + MasterObj + "GrdGrantCode");
    var Data = $("#" + MasterObj + "txtXmlSave").val(), XmlNodes;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML(Data);
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString(Data, 'text/xml');
    }
    for (var i = 1; i < OGrid.find("tr").length; i++) {
        var Chk = 0;
        XmlNodes = $(xml).find("Root").find("Tb").find("PID").filter(function () {
            return $(this).text().toString().trim() == OGrid.find("tr:eq(" + i + ")").attr("PID");
        });
        if ($(XmlNodes).length > 0) {
            $(XmlNodes).each(function () {
                var cellIndex = $(this).siblings("CIndx").text();
                var RealVal = $(this).siblings("RVal").text();
                var SCVID = $(this).siblings("SCVID").text();
                var Descr = $(this).siblings("Descr").text();
                if ($(this).siblings("Chk").text() == "1" && Chk == 0)
                    Chk = $(this).siblings("Chk").text();
                OGrid.find("tr:eq(" + i + ")").find("td:eq(" + cellIndex + ")").children(0).val(RealVal);
                OGrid.find("tr:eq(" + i + ")").find("td:eq(" + cellIndex + ")").children(0).attr("SCVID", SCVID);
                OGrid.find("tr:eq(" + i + ")").find("td:eq(" + cellIndex + ")").children(1).attr("Descr", Descr);

            });
        }
        OGrid.find("tr:eq(" + i + ")").find("td:eq(0)").children().attr("checked", Chk);
    }
}
//===========================================================================================================
function OnClickChkShowSelected() {
    var OGrid = $("#" + MasterObj + "GrdGrantCode");
    if ($("#" + MasterObj + "chkSelected").attr("checked")) {
        for (var i = 0; i < OGrid.find("tr").length; i++) {
            if (OGrid.find("tr:eq(" + i + ")").find("td:eq(0)").children().attr("checked") == false)
                OGrid.find("tr:eq(" + i + ")").css("display", "none");
        }
    }
    else {
        for (var i = 0; i < OGrid.find("tr").length; i++)
            OGrid.find("tr:eq(" + i + ")").css("display", "inline");
    }
}
//===========================================================================================================
//====================================================CreateGrid==========================
function GetData(direction) {
    switch (direction) {
        case "First": PageNumber = 1; break;
        case "Next": PageNumber = parseInt($("#txtCurPage").val()) + 1; break;
        case "Previous": PageNumber = parseInt($("#txtCurPage").val()) - 1; break;
        case "Last": PageNumber = parseInt($("#TotalPage").text()); break;
        case "Const": PageNumber = parseInt($("#txtCurPage").val()); break;
    }
    MakeDivPopup(xmlRepeatedItemGrd);
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
    }
    else {
        $("#txtCurPage").val("1");
        GetData('Const');
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    if (parseInt($("#txtCurPage").val()) < parseInt($("#TotalPage").text())) {
        GetData('Next')
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    GetData('Last')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    if (parseInt($("#txtCurPage").val()) > 1) {
        GetData('Previous')
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    GetData('First')
}
//*******************************************************************************
function SetPagingInfo() {
    $("#txtCurPage").val(PageNumber);
    $("#TotalPage").text(Math.ceil(parseInt($("#" + MasterObj + "txtTotalPage").val()) / PageSize));
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
        $("#TblFooter").css("height", "35px");
    }
}
//=======================================
function onfocusItem(obj) {
    if (obj.tagName != "select")
        obj.select();
    else obj.setActive();
    obj.focus();
}
//=======================================
function OnClickHeaderChk(obj) {
    var OGrid = RepeatedDataTable;
    var PageSize = OGrid.rows.length;
    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
        PageSize = PageSize - 1;
   
    for (var i = 1; i < PageSize; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickBtnDelItem(OGrid.rows(i).cells(0).firstChild);
    }
}
//*******************************************************************************