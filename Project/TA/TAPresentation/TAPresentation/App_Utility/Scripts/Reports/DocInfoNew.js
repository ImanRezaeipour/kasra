var ActorDescrCellIndex = 0;
var colCounts = 0;
var newrowindex = 0;
var PageSize = 15;
var TblFooterWidth = 0;
var DynamicGrid = 0;
var AccessEdit = true;
var ChangeDocType = false;
//-------نوع نمایش فیلدهای تکمیلی--------
$("#DivEX").hide();
$("#TDEX").hide();
$("#TDFilterItem").width = "100%";
//=========================================
WidthScreen = window.screen.width;
document.body.style.overflow = "auto";
//document.body.style.overflowY = "hidden";
window.document.dir = "RTL";

//$get("GridViewCountainer").style.width = WidthScreen - 20;
//TBLBase.style.width = WidthScreen - 100;
$get("OToolBar_TDTopToolBar").style.display = "none"
var LastSelectedRow = null;
var LastSelectedRowClass = "";
//GetAccessBtn();
onclickTab(1)
if ($get(MasterObj + "GrdImport") == null) {
    onclickTab(1);
    $get("TblTabs").style.display = "none";
}
else $get("TblTabs").style.display = "inline";
//====================================
//********برای حالت باز شدن صفحه نمایش مجوزها از صفحه روزانه*********
if ($get(MasterObj + "txtModeRD").value == "1") {
    $get(MasterObj + "rdDate").checked = true;
    OnClickRdDate()
}
else
    OnClickRdWpID()
//===============================================
DynamicGrid = 1;
onchangeCmbDocType();
SetValuCombo();
if ($get(MasterObj + "txtMode").value == "1") {
    TblExport.style.display = "none";
    TblImport.style.display = "none";
}
if ($get(MasterObj + "CmbDocType").value != 0) {
    //----------تعیین مقدار پیش فرض------------
    if ($get(MasterObj + "txtXmlComboDef").value != "")
        SetValuComboDef();
    OnClickBtnFilter();
}
CreateGridHeader(DynamicGrid);
CreateGrid();


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//--------------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
}
//--------------------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    //    $get("GridViewCountainer").style.width = WidthScreen - 20;
    //----------------------------------------------------------------------------------------
    if ($get(MasterObj + "txtSubmit").value != "") {
        if ($get(MasterObj + "txtAlert").value != "") {
            if ($get(MasterObj + "txtValidate").value == "1")
                SetMsg($get(MasterObj + "txtAlert").value);
            else
                alert($get(MasterObj + "txtAlert").value);
        }
        if ($get(MasterObj + "txtSubmit").value == "Delete")
            OnClickBtnFilter();

        if ($get(MasterObj + "txtSubmit").value == "Filter") {
            if ($get(MasterObj + "GrdImport") == null) {
                onclickTab(1);
                $get("TblTabs").style.display = "none";
            }
            else $get("TblTabs").style.display = "inline";

            //----------------ساختن گرید داینامیک مجوزها-----------
            if ($get(MasterObj + "CmbDocType").value != 0)
                DynamicGrid = 1;
            else
                DynamicGrid = 0;
            CreateGridHeader(DynamicGrid);
            CreateGrid();
            SetValuCombo();
            //----------تعیین مقدار پیش فرض------------
            if ($get(MasterObj + "txtXmlComboDef").value != "" && ($get(MasterObj + "txtMode").value == "1"))
                SetValuComboDef();
            TblExport.style.display = "inline";
            TblImport.style.display = "inline";
        }
        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
        $get(MasterObj + "txtShowAll").value = "";
        $get(MasterObj + "txtXmlComboDef").value = ""
        $get(MasterObj + "txtMode").value = ""
        LastSelectedRow = null;
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
    if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value && $get(MasterObj + "rdDate").checked == true)
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
    else if ($get(MasterObj + "CmbWorkPeriod").value > $get(MasterObj + "CmbWorkPeriodTo").value && $get(MasterObj + "rdWPID").checked == true)
        alert(" دوره شروع بزرگتر از پايان دوره است");
    else {
        if ($get(MasterObj + "txtShowAll").value != "1")
            MakeStrExtended();
        //----------------------------------------------------------------------------------
        $get(MasterObj + "txtDocMemberCode").value = $get(MasterObj + "CmbPerson_txtCode").value
        $get(MasterObj + "txtAccepter").value = $get(MasterObj + "CmbAccepter_txtCode").value
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    $get(MasterObj + "CmbPerson_txtCode").value = "";
    $get(MasterObj + "CmbPerson_txtPCode").value = "";
    $get(MasterObj + "CmbPerson_txtName").value = "";
    $get(MasterObj + "CmbAccepter_txtCode").value = "";
    $get(MasterObj + "CmbAccepter_txtPCode").value = "";
    $get(MasterObj + "CmbAccepter_txtName").value = "";
    $get(MasterObj + "txtDocMemberCode").value = "";
    $get(MasterObj + "txtAccepter").value = "";
    $get(MasterObj + "CmbDocStatus").value = "0";
    $get(MasterObj + "CmbDocType").value = "0";
    $get(MasterObj + "txtXmlCombo").value = "";
    $get(MasterObj + "txtStrFilter").value = "";
    $get(MasterObj + "txtShowAll").value = "1";
    $get(MasterObj + "CmbWorkPeriod").value = $get(MasterObj + "txtCurrWorkPeriod").value;
    $get(MasterObj + "CmbWorkPeriodTo").value = $get(MasterObj + "txtCurrWorkPeriod").value;
    if ($get(MasterObj + "CmbWorkPeriod").value == "")
        $get(MasterObj + "CmbWorkPeriod").selectedIndex = "0";
    if ($get(MasterObj + "CmbWorkPeriodTo").value == "")
        $get(MasterObj + "CmbWorkPeriodTo").selectedIndex = "0";
    $("#DivEX").hide();
    $("#TDEX").hide();
    //    OnChangeCmbWorkPeiod();
    OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        var Msg = "آیا برای حذف مطمئنید؟"
        // if (confirm(Msg)) {
        if ($get(MasterObj + "txtDescDeleteOption").value == "1") {
            var name = prompt(Msg, "");
            if (name != null && name != "") {
                $get(MasterObj + "txtDescDelete").value = name;
                $get(MasterObj + "txtDocID").value = LastSelectedRow.getAttribute('DocID');
                $get(MasterObj + "txtDocTypeID").value = LastSelectedRow.getAttribute('DocTypeID');
                $get(MasterObj + "txtSubmit").value = "Delete";
                $get(MasterObj + "BtnSubmit").click();
            }

        }
        else
            if (confirm(Msg)) {
                $get(MasterObj + "txtDocID").value = LastSelectedRow.getAttribute('DocID');
                $get(MasterObj + "txtDocTypeID").value = LastSelectedRow.getAttribute('DocTypeID');
                $get(MasterObj + "txtSubmit").value = "Delete";
                $get(MasterObj + "BtnSubmit").click();
            }
    }
    else
        alert("به منظور حذف يک سطر را انتخاب نماييد");

}
//==============================================================================================================
function OnClickImgFlow(obj) {
    var OGrid = GrdDocInfo
    if (OGrid != null) {
        var oRow = window.event.srcElement.parentElement
        while (oRow.tagName != "TR")
            oRow = oRow.parentElement
        var DocID = oRow.getAttribute('DocID')
        var DocTypeID = oRow.getAttribute('DocTypeID')
        var ActorPID = oRow.getAttribute('ActorPID')
        var WFDocId = oRow.getAttribute('WFDocId')
    }
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}
//==============================================================================================================
function OnChangeCmbWorkPeiod() {
    var WPID = $get(MasterObj + "CmbWorkPeriod").value;
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlWorkPeriod").value)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo [Val=" + WPID + "]");
    if (xmlNodes.length != 0) {
        var SDate = "13" + xmlNodes.item(0).selectSingleNode('SDate').text;
        var EDate = "13" + xmlNodes.item(0).selectSingleNode('EDate').text;
        $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

        $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

    }
}
//==============================================================================================================
function onclickTab(Number) {
    $get(MasterObj + "txtTabNumber").value = Number;
    switch (Number) {
        case 1:
            $get("TblExport").style.display = "inline";
            $get("TabExport").style.backgroundColor = "";
            $get("TabImport").style.backgroundColor = "#E3EFFF";
            $get("TblImport").style.display = "none";
            break;
        case 2:
            $get("TblExport").style.display = "none";
            $get("TblImport").style.display = "inline";
            $get("TabImport").style.backgroundColor = "";
            $get("TabExport").style.backgroundColor = "#E3EFFF";
            break;
    }
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
        LastSelectedRow = null;
    }
}
//=================================
function OnClickBtnExcel() {
    $get(MasterObj + "txtSubmit").value = "SendToExcel"
    $get(MasterObj + "BtnSubmitSend").click()
}
//=================================
function OnClickBtnPDF() {
    $get(MasterObj + "txtSubmit").value = "SendToPDF"
    $get(MasterObj + "BtnSubmitSend").click()
}
//=================================
function CreateGridHeader(DynamicGrid) {
    var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
    xmlDoc.async = "false"

    if (document.getElementById(MasterObj + "txtXmlGrd").value != '') {
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGrd").value)
        var XmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/GrdHeader")
        ClearGrd(TblHeaderGrd)
        AddRowGrdHeader(TblHeaderGrd, XmlNodes, DynamicGrid)
    }
   
}
//=================================
function AddRowGrdHeader(oGrid, XmlNodes, DynamicGrid) {
    TblFooterWidth = 360;
    var len = XmlNodes.length, cellIndex = 0;
    oGrid.insertRow()

    oGrid.rows(0).className = "CssHeaderStyle"
    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "روند";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocID');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '8');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "30px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "وضعيت";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'StatusID');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '8');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "30px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "نوع سند ";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocTypeName');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 12);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "110px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "متقاضی";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocMemberName');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 12);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "110px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "واحد سازماني ";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DepartmentName ');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 15);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "110px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";


    if (DynamicGrid)
        for (var i = 0; i < len; i++) {
            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerHTML = XmlNodes.item(i).selectSingleNode('ColTitle').text;
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', XmlNodes.item(i).selectSingleNode('ColName').text);
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', XmlNodes.item(i).selectSingleNode('IsTitle').text);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = XmlNodes.item(i).selectSingleNode('Width').text;
            oGrid.rows(0).cells(cellIndex).style.color = "black";
            cellIndex++;
            TblFooterWidth += parseInt(XmlNodes.item(i).selectSingleNode('Width').text);
        }
    else {
        oGrid.rows(0).insertCell()
        oGrid.rows(0).cells(cellIndex).innerText = "از تاريخ";
        oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'NwSDate ');
        oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
        oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
        oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
        oGrid.rows(0).cells(cellIndex).style.width = "70px";
        oGrid.rows(0).cells(cellIndex++).style.color = "black";

        oGrid.rows(0).insertCell()
        oGrid.rows(0).cells(cellIndex).innerText = "تا تاريخ";
        oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'NwEDate ');
        oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
        oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
        oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
        oGrid.rows(0).cells(cellIndex).style.width = "70px";
        oGrid.rows(0).cells(cellIndex++).style.color = "black";

        oGrid.rows(0).insertCell()
        oGrid.rows(0).cells(cellIndex).innerText = "موضوع سند";
        oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocTitle');
        oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
        oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 20);
        oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
        oGrid.rows(0).cells(cellIndex).style.width = "200px";
        oGrid.rows(0).cells(cellIndex++).style.color = "black";

        oGrid.rows(0).insertCell()
        oGrid.rows(0).cells(cellIndex).innerText = "شرح سند";
        oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocDescr');
        oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
        oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 20);
        oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
        oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
        oGrid.rows(0).cells(cellIndex).style.width = "200px";
        oGrid.rows(0).cells(cellIndex++).style.color = "black";

        TblFooterWidth += 600;
    }

    ActorDescrCellIndex = cellIndex;
    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "درخواست کننده";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DisplayName');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 12);
    oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "120px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerHTML = "تاييد کننده";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'Accepter');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 12);
    oGrid.rows(0).cells(cellIndex).setAttribute('SortDirection', 'Blank');
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "120px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";

    oGrid.rows(0).insertCell()
    oGrid.rows(0).cells(cellIndex).innerText = "تاريخ درخواست";
    oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'Actiondate');
    oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
    oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
    oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
    oGrid.rows(0).cells(cellIndex).style.width = "80px";
    oGrid.rows(0).cells(cellIndex++).style.color = "black";
    TblFooterWidth += 360;

    colCounts = cellIndex;
}
//============================================
function CreateGrid() {
    ClearGrd(GrdDocInfo)
    //-----------------------------Xml Grid------------------------------
    var xmlDocGrd = new ActiveXObject("MICROSOFT.XMLDOM")
    xmlDocGrd.async = "false"
    xmlDocGrd.loadXML($("#" + MasterObj + "txtXmlGrd").val());
    //---------------------------------------------------------------------------
    if ($("#" + MasterObj + "txtXmlGrd").val() != "<ReportsEntity />"
            && $("#" + MasterObj + "txtXmlGrd").val() != "<ReportsEntity></ReportsEntity>"
            && $("#" + MasterObj + "txtXmlGrd").val() != "") {
        var XmlNodes = xmlDocGrd.documentElement.selectNodes("/ReportsEntity/GetDocInfo")
        if (XmlNodes.length > 0) {
            var len = XmlNodes.length

            for (var i = 0; i < len; i++)
                AddRowGrd(GrdDocInfo, XmlNodes.item(i), i);
        }
    }

}
//===============================================================================================
function AddRowGrd(oGrid, item, row) {
    var ColType, ColName, ColTitle, isTitle, Name, Title, Width;
    var oRow = oGrid.insertRow();
    //--------------------------------------------------------------
    var DocID = item.selectSingleNode("DocID").text;
    var DocTypeID = item.selectSingleNode("DocTypeID").text;
    //--------------------------------------------------------------
    for (var i = 0; i < colCounts; i++) {
        oGrid.rows(newrowindex).insertCell()

        ColType = TblHeaderGrd.rows(0).cells(i).getAttribute("ColType");
        ColName = TblHeaderGrd.rows(0).cells(i).getAttribute("ColName");
        ColTitle = TblHeaderGrd.rows(0).cells(i).innerText;
        isTitle = TblHeaderGrd.rows(0).cells(i).getAttribute("isTitle");
        Width = TblHeaderGrd.rows(0).cells(i).style.width;

        if (item.selectSingleNode(ColName)) {
            if (isTitle > 0 && item.selectSingleNode(ColName).text.length > isTitle) {
                Name = item.selectSingleNode(ColName).text.substr(0, isTitle) + "..."
                Title = item.selectSingleNode(ColName).text
            }
            else {
                Name = item.selectSingleNode(ColName).text
                Title = ''
            }
        }
        switch (ColType) {
            case "4":
                if (ColName == "RequesterDescr" || ColName == "description")
                    oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:right' title='" + Title + "' >" + Name + "</div>";
                else
                    oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:center' title='" + Title + "' >" + Name + "</div>";
                break;
            case "8":
                if (ColName == "DocID") {
                    oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/FrmPresentation/App_Utility/Images/Icons/btnSubNodes.gif' style='width:30px; cursor: pointer'  title='روند' onclick='OnClickImgFlow()' />";
                }
                else if (ColName == "StatusID") {
                    if (item.selectSingleNode(ColName).text == "203")
                        oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/TAPresentation/App_Utility/Images/Icons/BlueTick.gif' style='width:20px;'  title='تاييد شده' />";
                    else if (item.selectSingleNode(ColName).text == "204")
                        oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/TAPresentation/App_Utility/Images/Icons/Cross.gif' style='width:20px;'  title='باطل شده' />";
                    else
                        oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/TAPresentation/App_Utility/Images/Icons/default_phase_icon.gif' style='width:20px;'  title='در جريان' />";
                }
                break;
        }
        oGrid.rows(newrowindex).cells(i).style.border = "1px solid #E9E9E9";
        oGrid.rows(newrowindex).cells(i).style.width = Width
    }
    oGrid.rows(newrowindex).setAttribute("StatusID", item.selectSingleNode("StatusID").text);
    oGrid.rows(newrowindex).setAttribute("DocID", DocID);
    oGrid.rows(newrowindex).setAttribute("DocTypeID", DocTypeID);
    oGrid.rows(newrowindex).setAttribute("ActorPID ", item.selectSingleNode("ActorPID ").text);
    oGrid.rows(newrowindex).setAttribute("WFDocId", item.selectSingleNode("WfDocID").text);
    oGrid.rows(newrowindex).setAttribute("DocTable", item.selectSingleNode("DocTable").text);
    oGrid.rows(newrowindex).setAttribute("IsCredit", item.selectSingleNode("IsCredit").text);

    if (newrowindex % 2 == 0)
        oGrid.rows(newrowindex).className = "CssItemStyle"
    else
        oGrid.rows(newrowindex).className = "CssAlternatingItemStyle"

    //----------------------------------------------------------------------------------------
    oGrid.rows(newrowindex).align = "center"
    newrowindex = newrowindex + 1
}
//===============================================================================================
function ClearGrd(obj) {
    var j = obj.rows.length - 1
    for (; j >= 0; --j)
        obj.deleteRow(j)
    newrowindex = 0
}
//===============================================================================================
function OnClickGrdDocInfo(obj) {
    var index = -1
    var oRow = event.srcElement
    var oCell = window.event.srcElement
    //_______Find Row------------------------
    for (var i = 0; oRow.tagName != "TR"; i++)
        oRow = oRow.parentElement
    while (oCell.tagName != "TD")
        oCell = oCell.parentElement
    index = oRow.rowIndex
    if (oRow.parentElement.parentElement.id == "GrdDocInfo") {
        for (i = 0; i < GrdDocInfo.rows.length; i++) {
            if (GrdDocInfo.rows(i).className == "CssSelectedItemStyle") {
                if (i % 2 == 0)
                    GrdDocInfo.rows(i).className = "CssItemStyle"
                else
                    GrdDocInfo.rows(i).className = "CssAlternatingItemStyle"
            }
        }
        oRow.className = "CssSelectedItemStyle"
        LastSelectedRow = oRow

    }
}
//****************************************************
function OndbClickGrd() {
    if (AccessEdit == true && LastSelectedRow.StatusId != "205" && LastSelectedRow.StatusId != "204") {
        var url = "", DialogProperty = "", DocTable = "";

        if (LastSelectedRow.DocTable == 'att.StaticCodeValue' && LastSelectedRow.DocTypeID == '12')
            DocTable = 'Att.KaranePack';
        else
            DocTable = LastSelectedRow.DocTable;
        switch (LastSelectedRow.DocTable) {
            case "att.attendance":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "att.Attendance":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "att.credit":
                switch (LastSelectedRow.IsCredit) {
                    case "0":
                        var url = "/TAPresentation/App_Pages/Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                        var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
                        break;

                    case "1":
                        url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
                        DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no;resizable=1"
                        break;
                }
                break;
            case "att.StaticCodeValue":
                switch (LastSelectedRow.DocTypeID) {
                    case "4":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "5":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "6":
                        url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                        DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                        break;
                    case "12":
                        url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                        DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                        break;
                }
                break;
            case "att.DayContinuation":
                url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "Att.ReplaceDetail":
                url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
                DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "Att.ScheduleChanges":
                url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
                DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no;resizable=1";
                break;

            case "TSH.TimeSheetCell":
                var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
                var DialogProperty = "dialogHeight:550px;dialogWidth:990px;center: Yes;help: no;status: no;resizable=1"

            case "att.DutyGeneral":
                var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
                var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                break;
            case "Att.KaranePack":
                url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                break;
            case "Gim.Request":
                url = "/GimPresentation/App_Pages/Requisition/RegisterRequestion.aspx";
                DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                break;
        }

        url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&TableName=" + DocTable
                + "&FieldName=ID"
                + "&FieldValue=" + LastSelectedRow.DocID
        returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);

        if (returnValue == 1)
            OnClickBtnFilter();
    }
    else if (LastSelectedRow.StatusID == "205" || LastSelectedRow.StatusID == "204")
        alert("امکان ويرايش مجوز حذف شده وجود ندارد");
}
//===========================================================
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        OndbClickGrd();
    }
    else
        alert("لطفا به منظور ويرايش یک سطر را انتخاب کنید")
}
//=======================================
function OnChangeCmbOneFilter() {
    OnClickBtnFilter();
}
////=========================================================
function onchangeCmbDocType(Filter) {
    $("#DivEX").show();
    $("#TDEX").show();
    $("#TDFilterItem").width = "100%";

    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML($get(MasterObj + "txtXmlFilter").value)
    var oxmlNode = oXml.documentElement.selectNodes("/GeneralEntity/LCombo[Val=" + $get(MasterObj + "CmbDocType").value + "]");
    if (oxmlNode.length > 0) {
        var Flag = MakeItems(oxmlNode[0].selectSingleNode("Extended").text);
        if (Flag) {
            $("#TDEX").show()
            $("#DivEX").show()
        }
    }

    if (Filter == 1) {
        ChangeDocType = true;
        $("#" + MasterObj + "CmbDocType").attr("ChangeElem", "1");
        OnClickBtnFilter();
    }
}
//=======================================
function MakeItems(Str) {
    ClearTableExtended();
    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML(Str)
    if (Str != "") {
        var oxmlNode = oXml.documentElement.selectNodes("/Root/Item");

        if (oxmlNode.length == 0)
            return false;
        var i = 0;
        while (i < oxmlNode.length) {
            var ORow = TBEX.insertRow();
            ORow.insertCell();
            ORow.insertCell();
            ORow.cells(0).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";

            ORow.cells(1).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
            ORow.cells(1).style.textAlign = "right";

            i++;
            if (i < oxmlNode.length) {
                ORow.insertCell();
                ORow.insertCell();
                ORow.cells(2).innerText = oxmlNode[i].selectSingleNode("SName").text + ": ";
                ORow.cells(3).innerHTML = CreateItem(oxmlNode[i], oxmlNode[i].selectSingleNode("Constractor").text);
                ORow.cells(3).style.textAlign = "right";
                i++;
            }
        }
    }
    else
        return false;
    return true;
}
//=======================================
function ClearTableExtended() {
    while (TBEX.rows.length > 0)
        TBEX.deleteRow();
}
//=========================================ساختن آیتم های تکمیلی
function CreateItem(XmlNode, Constractor) {
    var ReturnV = "";
    var Type = XmlNode.selectSingleNode("Type").text;
    switch ((Type).toLowerCase()) {
        case "string":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px' class='TxtControls' type='text' onchange='OnChangeCmbOneFilter()'/>";
            break;
        case "time":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:50px;text-align:right' onblur='Timechk(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text'  onchange='OnChangeCmbOneFilter()'/>";
            break;
        case "bit":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "'  Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "  class='TxtControls' type='checkbox' onchange='OnChangeCmbOneFilter()'/>";
            break;
        case "int":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + " style='width:100px;text-align:center' onkeydown='OnKeyDownInt(this)' onfocus='onfocusItem(this)' class='TxtControls' type='text' onchange='OnChangeCmbOneFilter()'/>";
            break;
        case "date":
            ReturnV = "<input name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' type='text' style='display:none' Const='" + Constractor + "' Default=" + XmlNode.selectSingleNode("Default").text + "/> <input  style='width:130px;text-align:right' onchange='onchangeDate(this),OnChangeCmbOneFilter()' onfocus='onfocusItem(this)' class='TxtControls' type='text'/><img src='/FrmPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' onclick='onclickImgDate(this)'/>";
            break;
        case "select":
            ReturnV = "<select name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' Const='" + Constractor + "'  Default=" + XmlNode.selectSingleNode("Default").text + " style='width:150px' TYPE='Creator' class='TxtControls'  onchange='OnChangeCmbOneFilter()'><option value='0'>انتخاب همه</option></select>";
            break;
        default:
            ReturnV = "<select   name='" + XmlNode.selectSingleNode("Name").text + "' FName='" + XmlNode.selectSingleNode("FName").text + "' style='width:150px' Default=" + XmlNode.selectSingleNode("Default").text + " Const='" + Constractor + "' class='TxtControls' onchange='OnChangeCmbOneFilter()'>" + MakeCombo(XmlNode.selectSingleNode("Type").xml) + "</select>";
            break;
    }
    return ReturnV;
}
//=======================================
function MakeCombo(XmlData) {
    var oXml = new ActiveXObject("Microsoft.XMLDOM")
    oXml.async = "false";
    oXml.loadXML(XmlData)
    var Str = "";
    var oxmlNode = oXml.documentElement.selectNodes("/Type/N");
    for (var i = 0; i < oxmlNode.length; i++) {
        Str = Str + "<option value='" + oxmlNode[i].selectSingleNode("V").text + "'>" + oxmlNode[i].selectSingleNode("T").text + "</option>";
    }
    return Str;
}
//=======================================
function onfocusItem(obj) {
    if (obj.tagName != "select")
        obj.select();
    else obj.setActive();
    obj.focus();
}
//================================تغییر کنترل تاریخ تکمیلی
function onchangeDate(obj) {
    var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value;
    var Year = objNow.substr(0, 4)
    var Month = objNow.substr(5, 2)
    var Day = objNow.substr(8, 2)
    var RealVal = "";
    var sal;
    if (obj.value != "") {
        var Date = "";
        var s = obj.value.split('/');
        if (s.length > 3) {
            obj.value = "";
            return;
        }
        if (s[2] != null) {

            sal = s[2].split('  ');
        }
        if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
            obj.value = "";
            return;
        }
        if (s.length == 3) {
            if (s[1].length == 1 && s[1] != "0")
                Date = Date + "0" + s[1] + "/"
            if (s[1].length == 1 && s[1] == "0")
                Date = Date + "01" + "/"
            if (s[1].length == 2 && s[1] != "00")
                Date = Date + s[1] + "/"
            if (s[1].length == 2 && s[1] == "00")
                Date = Date + "01" + "/"
            if (s[1].length == 0)
                Date = Date + Month + "/"
            if (s[0].length == 1 && s[0] != "0")
                Date = Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Date + "01";
            if (s[0].length == 0)
                Date = Date + Day
            if (s[2] == null)
                Date = Year + "/" + Date
            if (s[2] != null) {
                var sal;
                sal = s[2].split('  ');
                if (sal[0].length == 0)
                    Date = Year + "/" + Date
                if (sal[0].length == 1)
                    Date = Year.substr(0, 3) + sal[0] + "/" + Date
                if (sal[0].length == 2)
                    Date = Year.substr(0, 2) + sal[0] + "/" + Date
                if (sal[0].length == 3)
                    Date = Year.substr(0, 1) + sal[0] + "/" + Date
                if (sal[0].length == 4 && sal[0] != "0000")
                    Date = sal[0] + "/" + Date
                if (sal[0].length == 4 && sal[0] == "0000")
                    Date = Year + "/" + Date
            }
        }
        if (s.length == 2) {
            if (s[1].length == 1 && s[1] != "0")
                Date = Date + "0" + s[1] + "/"
            if (s[1].length == 1 && s[1] == "0")
                Date = Date + "01" + "/"
            if (s[1].length == 2 && s[1] != "00")
                Date = Date + s[1] + "/"
            if (s[1].length == 2 && s[1] == "00")
                Date = Date + "01" + "/"
            if (s[1].length == 0)
                Date = Date + Month + "/"
            if (s[0].length == 1 && s[0] != "0")
                Date = Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Date + "01";
            if (s[0].length == 0)
                Date = Date + Day
            Date = Year + "/" + Date
        }
        if (s.length == 1) {
            if (s[0].length == 1 && s[0] != "0")
                Date = Year + "/" + Month + "/" + Date + "0" + s[0]
            if (s[0].length == 1 && s[0] == "0")
                Date = Year + "/" + Month + "/" + Date + "01"
            if (s[0].length == 2 && s[0] != "00")
                Date = Year + "/" + Month + "/" + Date + s[0]
            if (s[0].length == 2 && s[0] == "00")
                Date = Year + "/" + Month + "/" + Date + "01"
        }
        RealVal = Date;
        Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
        obj.value = Date
        obj.value = obj.value + "  " + F_adbsghh(obj.value)
    }
    obj.parentElement.firstChild.value = RealVal;
    // OnChangeCmbOneFilter();
}
//====================================ساخت جدول فیلد تکمیلی 
function MakeStrExtended(obj) {
    var Obj;
    var Context = "";
    var Str = "";
    for (var i = 0; i < TBEX.rows.length; i++) {
        var j = 1;
        while (j < TBEX.rows(i).cells.length) {
            Obj = TBEX.rows(i).cells(j).firstChild;
            if (Obj.getAttribute("Default").trim() != Obj.value.trim() && obj != Obj) {
                Context = Obj.getAttribute("Const");
                Context = ReplaceAll(Context, "@", Obj.value);
                Str = Str + " " + Context.substr(0, Context.indexOf("«") == -1 ? Context.length : Context.indexOf("«"));
                var Start, End
                if (Context.indexOf("«") > -1) {
                    Start = Context.indexOf("«") + 1;
                    End = Context.indexOf("»") - Start;
                    var TEXT = ReplaceAll(Context.substr(Start, End), '"', "'");
                    Str = Str + eval(TEXT)
                }
                Str = ReplaceAll(Str, '"', "'");
            }
            j += 2;
        }
    }
    $get(MasterObj + "txtStrFilter").value = Str;
}
//============================لود مقدار پیش فرض کمبو
function SetValuComboDef() {
    $("#" + MasterObj + "txtXmlComboDef").val("<Root>" + $("#" + MasterObj + "txtXmlComboDef").val() + "</Root>");
    var xml;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML($("#" + MasterObj + "txtXmlComboDef").val());
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString($("#" + MasterObj + "txtXmlCombo").val(), 'text/xml');
    }
    var XmlNode = $(xml).find("Root").find("Code");
    if ($(XmlNode).length > 0) {
        var iIndex = 0
        var Code
        while (iIndex < $(XmlNode).length) {
            if ($($(XmlNode)[iIndex]).find("Val") != "0")
                Code = $($(XmlNode)[iIndex]).find("Val").text();
            iIndex++;
        }
        for (var i = 0; i < TBEX.rows.length; i++) {
            var j = 1;
            while (j < TBEX.rows(i).cells.length) {
                Obj = TBEX.rows(i).cells(j).firstChild;
                var ObjCh = $(xml).find($(Obj).attr("FName"));
                if ($(Obj).attr("tagName") == "SELECT") {
                    $(Obj).val(Code)
                }
                j++;
            }
        }
    }

}
//============================لود داده های مربوط به فیلد تکمیلی
function SetValuCombo() {
    $("#" + MasterObj + "txtXmlCombo").val("<Root>" + $("#" + MasterObj + "txtXmlCombo").val() + "</Root>");
    var xml;
    if (window.ActiveXObject) {
        xml = new ActiveXObject('Microsoft.XMLDOM');
        xml.async = 'false';
        xml.loadXML($("#" + MasterObj + "txtXmlCombo").val());
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString($("#" + MasterObj + "txtXmlCombo").val(), 'text/xml');
    }
    for (var i = 0; i < TBEX.rows.length; i++) {
        var j = 1;
        while (j < TBEX.rows(i).cells.length) {
            Obj = TBEX.rows(i).cells(j).firstChild;

            var ObjCh = $(xml).find($(Obj).attr("FName"));
            switch ($(Obj).attr("tagName")) {
                case "SELECT":
                    $(Obj).html("");
                    $(ObjCh).each(function () {
                        var title = $(this).find('Title').text();
                        var Val = $(this).find('Val').text();
                        $(Obj).append("<option value=" + Val + ">" + title + "</option>");
                    });
                    break;
                case "INPUT":
                    if (Obj.parentElement.childNodes[2] != null && Obj.parentElement.childNodes[2] != undefined) {
                        Obj.parentElement.childNodes[2].value = "";
                        onchangeDate(Obj.parentElement.childNodes[2]);
                        $(ObjCh).find($(Obj).attr("name")).each(function () {
                            Obj.parentElement.childNodes[2].value = $(this).text();
                            onchangeDate(Obj.parentElement.childNodes[2]);
                        });
                    }
                    else {
                        Obj.value = "";
                        $(ObjCh).find($(Obj).attr("name")).each(function () {
                            $(Obj).val($(this).text());
                        });
                    }
                    break;
            }
            j++;
        }
    }

}
//====================================باز شدن پنجره تقویمهای فیلدهای تکمیلی
function onclickImgDate(obj) {
    if (obj.parentElement.firstChild.value != "") {
        var Year = obj.parentElement.firstChild.value.substr(0, 4);
        var Month = obj.parentElement.firstChild.value.substr(5, 2);
        var Day = obj.parentElement.firstChild.value.substr(8, 2);
    }
    else {

        var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value

        var Year = objNow.substr(0, 4)
        var Month = objNow.substr(5, 2)
        var Day = objNow.substr(8, 2)
    }
    var strFeature = "dialogHeight:266px;dialogWidth:277px;dialogLeft:200px;dialogTop:200px;status=no";
    var strUrl = "/FrmPresentation/App_Utility/NewCalendar/SolarCalendar.htm";

    var oCurrentDate = new Object();
    oCurrentDate.Year = Year;
    oCurrentDate.Month = Month;
    oCurrentDate.Day = Day;
    oCurrentDate.Holiday = $get('txtHoliday').value;
    var oDate = showModalDialog(strUrl, oCurrentDate, strFeature);
    var strYear = "";
    var strMonth = "";
    var strDay = "";
    if (oDate != null) {
        var strYear = oDate.Year;
        var strMonth = ((parseInt(oDate.Month, 10) < 10) ? "0" + parseInt(oDate.Month, 10).toString() : oDate.Month.toString());
        var strDay = ((parseInt(oDate.Day, 10) < 10) ? "0" + parseInt(oDate.Day, 10).toString() : oDate.Day.toString());
    }
    Year = strYear;
    Month = strMonth;
    Day = strDay;
    oDate = Day + '/' + Month + '/' + Year;
    if (oDate != "//") {
        obj.parentElement.childNodes[2].value = oDate;
        onchangeDate(obj.parentElement.childNodes[2]);
        obj.parentElement.firstChild.value = Year + '/' + Month + '/' + Day;
    }
}
//================================
//taghirat narafte bood dar pach
function OnClickRdWpID() {
    $get(MasterObj + "rdDate").checked = false;
    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("disabled", true)
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("disabled", true)
    $("#" + MasterObj + "CmbWorkPeriod").attr("disabled", false)
    $("#" + MasterObj + "CmbWorkPeriodTo").attr("disabled", false)
    $("#" + MasterObj + "txtRD").val("1");
}
//================================
function OnClickRdDate() {
    $get(MasterObj + "rdWPID").checked = false;
    $("#" + MasterObj + "KCalSDate_txtCalendar").attr("disabled", false)
    $("#" + MasterObj + "KCalEDate_txtCalendar").attr("disabled", false)
    $("#" + MasterObj + "CmbWorkPeriod").attr("disabled", true)
    $("#" + MasterObj + "CmbWorkPeriodTo").attr("disabled", true)
    $("#" + MasterObj + "txtRD").val("2");
}