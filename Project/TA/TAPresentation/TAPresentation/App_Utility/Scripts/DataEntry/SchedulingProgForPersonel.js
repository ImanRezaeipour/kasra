window.name = "SchedulingProg"
aspnetForm.target = "SchedulingProg"
window.target = "SchedulingProg.aspx";


document.dir = "RTL"
document.getElementsByTagName("body")[0].scroll = "no";
//--------------------------------------ساختارهاXml
var oXmlStruct = new ActiveXObject("Microsoft.XMLDOM")
oXmlStruct.async = "false";
oXmlStruct.loadXML($get(MasterObj + 'txtXmlInfo').value)
//-----------------------------------------ایکس ام ال ترکیب ساختارها
var oXmlCombStruct = new ActiveXObject("Microsoft.XMLDOM")
oXmlCombStruct.async = "false";
oXmlCombStruct.loadXML($get(MasterObj + 'txtXmlInfo').value)
//--------------------------------------دوره هاXml  
var oXmlWP = new ActiveXObject("Microsoft.XMLDOM")
oXmlWP.async = "false";
oXmlWP.loadXML($get(MasterObj + 'txtXmlInfo').value)
var EDate, SDate, CountDay, WPDayName, xmlNodesme; //اطلاعات دوره انتخاب شده براي جستجو
//--------------------------------------داده هاي گريدXml
var oXmlData = new ActiveXObject("Microsoft.XMLDOM")
oXmlData.async = "false";
oXmlData.loadXML($get(MasterObj + 'txtXml').value)
var XmlNodeForHoliday  //----------------------For تعطیلات
//--------------------------------------پيش فرضXml
//--------------------------------------DetailCollection Xml
var oXmlDCOll = new ActiveXObject("Microsoft.XMLDOM")
oXmlDCOll.async = "false";
oXmlDCOll.loadXML($get(MasterObj + 'txtXmlInfo').value)
//----------------------------------------------ساختار خالی
var oXmlDoc2 = new ActiveXObject("Microsoft.XMLDOM")
oXmlDoc2.async = "false";
oXmlDoc2.loadXML("<DataEntryEntity/>");
//-------------PopupStruct
var XTabTableRow = 0
var LastSelectedRow = ""
var InputPopupStc = null;
var Readonly = false;
var StrDelete = "<Root></Root>";
var DeletedIndex;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!راهنماي رنگ ها
var arrColor = {
    0: ["Black", "ساختار قبلي"],
    1: ["Blue", "ساختار تغيير يافته"],
    2: ["Red", "ساختار نادرست"]
};
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!راهنمای ShortKeys
ShowDefaultShortKeys(0)
var arrShortKey = {
    0: ["F2", "نمايش ساختارها"],
    1: ["F7", "بازگشت به ساختار قبلي"],
    2: ["دابل کليک روی هر سلول", "فعال سازي مود استفاده از موس"]
};
//=========================================================
var S = new Array();
var StructRow = null;
var NewObj = null;
var PersonCode = "";
var SelectWPDate = "";
var FocusStyle;
var SelectPopupMode = 0;
var SelectedRow, SelectedColumn;
//==================================PageLoad========
$get("OToolBar_TDTopToolBar").style.display = "none"
var WidthScreen = window.screen.width;
$get("TDMain").style.width = WidthScreen - 10;
$get("DivMain").style.width = WidthScreen - 10;
$get("DivGrid").style.width = WidthScreen - 10;
$get("DivCount").style.width = WidthScreen - 10;
var ObjIntval = null
var FlagForIntval = false;
//------------------------------------------SCROLL------------------------
var scrollTips = {
    dx: null,
    init: function () {
        var right = document.getElementById('arright');
        right.onmouseover = function () { this.dx = setInterval('scrollTips.arrowScroll(1)', 100); return false; }
        right.onmouseout = function () { clearInterval(this.dx); return false; }
        var left = document.getElementById('arleft');
        left.onmouseover = function () { this.dx = setInterval('scrollTips.arrowScroll(0)', 100); return false; }
        left.onmouseout = function () { clearInterval(this.dx); return false; }
    },
    arrowScroll: function (val) {
        var Speed = 50;
        var SC = $get("DivGridData").scrollLeft;
        if (val == 1) {
            $get("DivGridData").scrollLeft = SC - Speed;
            $get("DivBaseCount").scrollLeft = $get("DivGridData").scrollLeft;
        } else {
            $get("DivGridData").scrollLeft = SC + Speed;
            $get("DivBaseCount").scrollLeft = $get("DivGridData").scrollLeft;
        }
    }
}
$('document').ready(function () {
    scrollTips.init();

});
if ($get(MasterObj + "CmbPerson_txtCode").value != "") {
    oXmlData.loadXML($get(MasterObj + 'txtXml').value)
    SelectedColumnAndRow = null;
    //------اطلاعات مربوط به دوره انتخابي در متغيير های مربوطه ریخته می شود 
    xmlNodesme = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + $get(MasterObj + "TemptxtWP").value + "]")
    EDate = xmlNodesme.item(0).selectSingleNode('E').text;
    SDate = xmlNodesme.item(0).selectSingleNode('S').text;
    CountDay = xmlNodesme.item(0).selectSingleNode('C').text;
    WPDayName = xmlNodesme.item(0).selectSingleNode('DN').text;
    //-----------                
    XmlNodeForHoliday = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily");
    WidthScreen = window.screen.width;
    if (CountDay * 35 + 425 > WidthScreen) {
        $get("DivGridData").style.width = WidthScreen - 425;
        $get("TDDivData").style.width = WidthScreen - 425;
        $get("DivBaseCount").style.width = WidthScreen - 425;
    }
    Readonly = true;
    MakeHeader();
    CreateGrid();

    var SelectedCell = XTableData.rows(parseInt($get(MasterObj + "txtPersonels").value) - 1).cells(parseInt($get(MasterObj + "txtType").value) - 1).firstChild;
    if (SelectedCell != null && SelectedCell != undefined) {
        onclickGrd(SelectedCell);
    }
    $get(MasterObj + "txtType").value = "";
    $get(MasterObj + "txtPersonels").value = "";
    $get(MasterObj + "txtSubmit").value = "";
}
//================================================================================  
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {
    $get("ImgProgresss").style.display = "inline";
}
function EndRequestHandler(sender, args) {
    $get("ImgProgresss").style.display = "none";
    if ($get(MasterObj + "txtSubmit").value == "Filter") {
        //------------------------------------------         
        oXmlData.loadXML($get(MasterObj + 'txtXml').value)
        SelectedColumnAndRow = null;
        //------اطلاعات مربوط به دوره انتخابي در متغيير های مربوطه ریخته می شود 
        xmlNodesme = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + $get(MasterObj + "TemptxtWP").value + "]")
        EDate = xmlNodesme.item(0).selectSingleNode('E').text;
        SDate = xmlNodesme.item(0).selectSingleNode('S').text;
        CountDay = xmlNodesme.item(0).selectSingleNode('C').text;
        WPDayName = xmlNodesme.item(0).selectSingleNode('DN').text;
        //-----------                
        XmlNodeForHoliday = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily");
        WidthScreen = window.screen.width;
        if (CountDay * 35 + 425 > WidthScreen) {
            $get("DivGridData").style.width = WidthScreen - 425;
            $get("TDDivData").style.width = WidthScreen - 425;
            $get("DivBaseCount").style.width = WidthScreen - 425;
        }
        Readonly = true;
        MakeHeader();
        CreateGrid();

        $get(MasterObj + "txtSubmit").value = "";
    }
}
//###############################################################################################
var oPopupDay = window.createPopup()
var ObjPopupDay = "";
function contextMenuDays(Obj) {
    var lefter = event.screenX
    var topper = event.screenY
    var str = $get("DivPopupDays").innerHTML;
    str = str.replace("onclickChangeShift(0)", "parent.onclickChangeShift()");
    oPopupDay.document.body.innerHTML = str;
    ObjPopupDay = Obj;
    oPopupDay.show(lefter, topper, 80, 29)
}
//==================================================
function onclickChangeShift() {
    var index = ObjPopupDay.parentElement.cellIndex;
    var date = XTabTable.rows(1).cells(index).firstChild.title;
    var PID = XtableName.rows(ObjPopupDay.parentElement.parentElement.rowIndex).cells(0).firstChild.innerText;
    var Instance = ObjPopupDay.parentElement.parentElement.Ins;
    var url = "RequestChangeShift.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&SDate=13" + date + "&EDate=13" + date + "&PersonCode=" + PID + "&InstanceID=" + Instance;
    window.showModalDialog(encodeURI(url), window, "dialogHeight:480px;dialogWidth:450px;center: Yes;help: no;status: no");
}
//==================================================    
function MakePopupStruct(Obj) {
    if ($get(MasterObj + "txtChk").value == "1")
        if (PopupStruct.getAttribute("Entity") == "" || (PopupStruct.getAttribute("Entity") != "" && PopupStruct.getAttribute("Entity").P != Obj.parentElement.parentElement.P)) {
            ClearTBS();
            DivForStruct.style.height = "10";
            var str = Obj.parentElement.parentElement.getAttribute("Struct");
            for (var i = 0; i < str.split("#").length - 1; i++) {
                var Str1 = str.split("#")[i];
                if (parseInt(DivForStruct.style.height) + 25 < 500)
                    DivForStruct.style.height = parseInt(DivForStruct.style.height) + 25;
                else DivForStruct.style.height = 500;
                var NewRow = TBS.insertRow();
                var OCell1 = NewRow.insertCell();
                OCell1.style.width = "50";
                OCell1.innerText = Str1.split(":")[1];
                var OCell2 = NewRow.insertCell();
                OCell2.innerText = Str1.split(":")[2];
                OCell1.style.width = "136";
            }
        }
    var posX = Obj.offsetLeft; var posY = Obj.offsetTop;

    while (Obj.offsetParent) {
        posX = posX + Obj.offsetParent.offsetLeft;
        posY = posY + Obj.offsetParent.offsetTop;
        if (Obj == document.getElementsByTagName('body')[0]) { break }
        else { Obj = Obj.offsetParent; }
    }
    PopupStruct.style.top = posY + 20;
    PopupStruct.style.left = posX + 20;
    PopupStruct.style.display = "inline";
    InputPopupStc = event.srcElement;
    SelectRow(XTabTableRow)
}
//------------------------------------------------------
function onkeydownTBS(obj) {
    if (event.keyCode == 40) {
        if (XTabTableRow < TBS.rows.length - 1) {
            XTabTableRow = XTabTableRow + 1
            SelectRow(XTabTableRow)
        }
    }
    else if (event.keyCode == 38) {
        if (XTabTableRow > 0) {
            XTabTableRow = XTabTableRow - 1
            SelectRow(XTabTableRow)
        }
    }
    else if (event.keyCode == 13) {
        InputPopupStc.value = TBS.rows(LastSelectedRow).cells(0).innerText;
        if (PopupStruct.style.display == "inline")
            PopupStruct.style.display = "none"
        XTabTableRow = 0
        InputPopupStc.select();
        InputPopupStc.focus();
    }
    else if (event.keyCode == 27) {
        if (PopupStruct.style.display == "inline")
            PopupStruct.style.display = "none"
        XTabTableRow = 0
        InputPopupStc.select();
        InputPopupStc.focus();
    }
}
//--------------------------------------------------
function onclickTBS() {
    SelectRow(event.srcElement.parentElement.rowIndex)
    InputPopupStc.value = TBS.rows(LastSelectedRow).cells(0).innerText;
    if (PopupStruct.style.display == "inline")
        PopupStruct.style.display = "none"
    XTabTableRow = 0
    InputPopupStc.select();
    InputPopupStc.focus();
}
//==========================================================
function SelectRow(RowNum) {
    SelectPopupMode = 1;
    var SelectedRow = TBS.rows(RowNum)
    TBS.focus()
    var obj;
    obj = TBS
    if (LastSelectedRow != "")
        if (parseInt(LastSelectedRow) < obj.rows.length) {
            if (parseInt(LastSelectedRow) % 2 == 0)
                obj.rows(parseInt(LastSelectedRow)).className = ""
            else
                obj.rows(parseInt(LastSelectedRow)).className = "";
        }
    if (LastSelectedRow == "0")
        if (obj.rows.length > 0)
            obj.rows(parseInt(LastSelectedRow)).className = "";

    LastSelectedRow = SelectedRow.rowIndex;
    SelectedRow.className = "CssSelectedItemStyle";
}
//###################################Create Grid#########################################
function CreateGrid() {
    ClearRowGrid()
    ClearCountGrid();
    DeleteStructure();
    var xmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift")
    if (xmlNodes.length > 0) {
        if (xmlNodes.length * 28 + 45 < 380) {
            DivGrid.style.height = xmlNodes.length * 28 + 48;
            DivCount.style.height = 80 + (380 - parseInt(DivGrid.style.height));
        }
        else {
            DivGrid.style.height = 380;
            DivCount.style.height = 100;
        }
        var XmlStructM;
        for (var i = 0; i < xmlNodes.length; i++) {
            if (document.getElementById(MasterObj + "txtChk").value == 1)
                XmlStructM = oXmlData.documentElement.selectNodes("/DataEntryEntity/ValidS[M=" + xmlNodes[i].selectSingleNode("P").text + "]");
            else XmlStructM = "";
            AddToGrid(xmlNodes[i], XmlStructM, i)
        }
        SetSumE_K_M();
    }
}
//********************************************************************************
function ClearRowGrid() {
    while (XTableData.rows.length > 0) {
        XTableData.deleteRow();
        XtableName.deleteRow();
        XtableKarkard.deleteRow();
    }
    var UL = $get("IntvalUL");
    UL.innerHTML = "";
}
//*******************************************************************************
function AddToGrid(XMLNODE, XmlStructM, Intval) {
    //----------------------شماره پرسنلی و نام   

    var oRow = XtableName.insertRow(Intval);
    var OrowData = XTableData.insertRow(Intval);
    var OrowKarkard = XtableKarkard.insertRow(Intval);
    var StrClassName;
    //-------------------------------------------
    if ((XtableName.rows.length - 1) % 2 == 0) {
        oRow.className = "CssItemStyle";
        OrowData.className = "CssItemStyle";
        OrowKarkard.className = "CssItemStyle";
        StrClassName = "background-color: #d5e1fd;";
    }
    else {
        oRow.className = "CssAlternatingItemStyle";
        OrowData.className = "CssAlternatingItemStyle";
        OrowKarkard.className = "CssAlternatingItemStyle";
        StrClassName = "background-color :OldLace";
    }
    var val = "";
    //---------------------  
    oRow.setAttribute("P", XMLNODE.selectSingleNode('P').text)//--------------------------------------پرسنلی
    OrowData.setAttribute("P", XMLNODE.selectSingleNode('P').text)//--------------------------------------پرسنلی
    OrowData.setAttribute("Ins", XMLNODE.selectSingleNode('Ins').text);
    OrowKarkard.setAttribute("P", XMLNODE.selectSingleNode('P').text)//--------------------------------------پرسنلی
    //---------------------
    oRow.setAttribute("ISD", XMLNODE.selectSingleNode('ISD').text)
    var XmlNodeTmp;
    var Maxim = 0
    if (!Readonly) {
        var STRC = "";
        OrowData.setAttribute("Struct", STRC);
    }
    //--------------------------رديف
    Intval = Intval + 1;
    var UL = $get("IntvalUL");
    UL.innerHTML += "<li><div style='width:20px;height:28px;" + StrClassName + "' align='center' >" + Intval + "</div> </li>";
    //--------------------------پرسنلی
    val = XMLNODE.selectSingleNode('C').text;
    var oCell1 = oRow.insertCell()
    if (Readonly) oCell1.innerHTML = "<div align='center' onclick='ClickRows(this)'  style='width:50px;font-weight:bold' >" + val + "</div>";
    else {
        if (val != "") oCell1.innerHTML = "<input class='TxtControls' onclick='ClickRows(this)' align='center' type='text' value='" + val + "' style='width:50px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
        else oCell1.innerHTML = "<input class='TxtControls' align='center' onclick='ClickRows(this)' type='text' value='' style='width:50px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
    }
    //------------------------------نام
    val = XMLNODE.selectSingleNode("Name").text;
    var oCell2 = oRow.insertCell()
    var StrColor = ""
    if (oRow.ISD == 0)
        StrColor = "color:Green;";
    oCell2.innerHTML = "<div onclick='ClickRows(this)'  style='width:120px;" + StrColor + "'" + (Readonly ? "" : "oncontextmenu='contextMenu(this);return false;") + "'></div>";

    if (val != "") {
        if (val.length > 18) {
            oCell2.firstChild.innerText = val.substring(0, 15) + "...";
            oCell2.title = val;
        }
        else
            oCell2.firstChild.innerText = val;
    }
    oCell2.align = "right"
    oCell1.style.height = "28px";
    oCell2.style.height = "28px";
    //-----------------------------------سمت سازماني
    var oCell6 = oRow.insertCell()
    var ImgStr = " ";
    var StrSemat = XMLNODE.selectSingleNode("F").text;
    if (StrSemat.length > 7) {
        StrSemat = StrSemat.substr(0, 5) + "..";
    }
    if (XMLNODE.selectSingleNode("A").text == 9701)
        ImgStr = "<img src='../../App_Utility/images/Icons/Male.png' title='مرد'/>"
    else if (XMLNODE.selectSingleNode("A").text == 9702)
        ImgStr = "<img  src='../../App_Utility/images/Icons/Female.png' title='زن'/>";
    else ImgStr = "<img  src='../../App_Utility/images/Icons/blank.gif' />";
    oCell6.innerHTML = "<div onclick='ClickRows(this)'  style='float:left;width:70px;border-left:1px solid black;' title='" + XMLNODE.selectSingleNode("F").text + "'>" + ImgStr + StrSemat + "</div>";

    //======================================================روزهای دوره====================================               
    var SDate1 = SDate;
    var EDate1 = EDate;
    var str = "";
    if (oRow.className == "CssItemStyle")
        str = "background-color:#d5e1fd;";
    else str = "background-color:OldLace";
    var StrTemp
    var Karkard = 0;
    var ChangeMode = 0;
    var title = "";
    var OXMLTMPNode
    var WPDayName1 = parseInt(WPDayName);
    for (var i = 1; i <= CountDay; i++) {
        title = "";
        if (XmlNodeForHoliday != null)
            StrTemp = XmlNodeForHoliday.item(i - 1).selectSingleNode("F").text == 1 ? "background-color:#FFD1C4;" : str;
        str2 = WPDayName1 == 6 ? "border-left-style: groove; border-left-width: 1; border-left-color: #808080;" : "";
        //----------------------------تغییر رنگ ساختارهای تغییر یافته-------
        if (XMLNODE.selectSingleNode('P').text != "") {
            XmlNodeTmp = oXmlData.documentElement.selectNodes("/DataEntryEntity/ChangeShift[M=" + XMLNODE.selectSingleNode('P').text + " and D='" + XTabTable.rows(1).cells(i - 1).firstChild.title + "']");

            if (XmlNodeTmp.length > 0) {

                switch (XmlNodeTmp[0].selectSingleNode("S").text.trim()) {
                    case "203":
                        StrTemp = "background-color:#B3FFD9;";
                        break;
                    case "201":
                        StrTemp = "background-color:#FFFFB0;";
                        break;
                    case "204":
                        StrTemp = "background-color:#FFCCFF;";
                        break;
                }
                ChangeMode = true;
                title = XmlNodeTmp[0].selectSingleNode("A").text;
            }
            else ChangeMode = false;
        }
        //-----------------------------------------------
        WPDayName1 = (WPDayName1 + 1) % 7;
        var OCell = OrowData.insertCell();
        OCell.className = 'TD' + i.toString();
        OCell.align = "left";
        if (XMLNODE.childNodes[i + 1].text != "") {
            OXMLTMPNode = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + XMLNODE.childNodes[i + 1].text.trim() + "']");
            if (OXMLTMPNode.length > 0) {
                if (ChangeMode)
                    title = XmlNodeTmp[0].selectSingleNode("A").text;
                else
                    title = OXMLTMPNode.item(0).selectSingleNode('N').text;
                OCell.innerHTML = "<input onclick='onclickGrd(this)'  class='TxtControls'  align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)'  onkeydown='onkeydownEnter(this)'" : " readonly oncontextmenu='contextMenuDays(this);return false;'") + "  style='text-align:left;Width:35px;font-weight:bold;" + StrTemp + str2 + "'   title='" + title + "' TrueVal='" + XMLNODE.childNodes[i + 1].text + "' value='" + XMLNODE.childNodes[i + 1].text + "'/>";
                AddCountGrid(OXMLTMPNode, i - 1, 1);
                Karkard = Karkard + KarkardFunc(OXMLTMPNode, XTabTable.rows(1).cells(i - 1).firstChild.title);
            }
            else OCell.innerHTML = "<input onclick='onclickGrd(this)' class='TxtControls' align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)'  onkeydown='onkeydownEnter(this)' " : "readonly oncontextmenu='contextMenuDays(this);return false;'") + "   style='text-align:left;Width:35px;font-weight:bold;" + StrTemp + str2 + "'   title='" + title + "' TrueVal=''/>";
        }
        else {
            OCell.innerHTML = "<input onclick='onclickGrd(this)'  class='TxtControls' align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)'  onkeydown='onkeydownEnter(this)' " : "readonly oncontextmenu='contextMenuDays(this);return false;'") + "   style='text-align:left;Width:35px;font-weight:bold ;" + StrTemp + str2 + "'   title='" + title + "' TrueVal=''/>";
        }
        OCell.bgcolor = StrTemp;
        OCell.style.height = "28px";
    }
    //====================================مجموع================================================================
    var Ezafe = 0; var SignFlag = 0; var Movazaf
    if ($get(MasterObj + "txtShowHourlyTime").value == 1)
        Movazaf = SetTimely(XMLNODE.selectSingleNode("M").text);
    else Movazaf = XMLNODE.selectSingleNode("M").text;

    Ezafe = Math.abs(Karkard - Movazaf)
    if (Karkard - Movazaf < 0)
        SignFlag = 1;

    if (document.getElementById(MasterObj + "txtShowHourlyTime").value == 1) {
        Karkard = SetHourlyTime(Karkard);
        Ezafe = SetHourlyTime(Ezafe);
    }
    var oCell3 = OrowKarkard.insertCell()
    oCell3.innerHTML = "<div style='width:45px;border-right:1px solid black;' align='center'>" + Karkard + "</div>";

    var oCell4 = OrowKarkard.insertCell()
    oCell4.innerHTML = " <input class='TxtControls' align='center' onfocus='onfocusMo(this)'  Type='Text' onchange='onchangeMo(this)' Value='" + XMLNODE.selectSingleNode("M").text.toString() + "' style='text-align:left;Width:45px;font-weight:bold ;height:20px;" + str2 + "' /> ";
    var oCell5 = OrowKarkard.insertCell()
    oCell5.innerHTML = "<div  style='width:45px;' dir='rtl' align='center'>" + Ezafe + (SignFlag == 1 ? "-" : "") + "</div>";
    oCell3.style.height = "28px";
    oCell4.style.height = "28px";
    oCell5.style.height = "28px";
}
//====================================================================================
function ClickRows(obj) {
    SetColorFulRowsColumn(obj.parentElement.parentElement.rowIndex, -1);
}
//==================================
function SetSumE_K_M() {
    var Sum = 0;
    var Val1 = 0, Val2 = 0, Val3 = 0;
    var flag = true;

    for (var i = 0; i < XtableKarkard.rows.length; i++) {
        flag = getCntChar("-", XtableKarkard.rows(i).cells(0).innerText) > 0 ? false : true;
        Val1 = Val1 + (flag ? SetTimely(XtableKarkard.rows(i).cells(0).innerText) : (-1 * SetTimely(XtableKarkard.rows(i).cells(0).innerText)));
        //---------------       
        flag = getCntChar("-", XtableKarkard.rows(i).cells(1).firstChild.value) > 0 ? false : true;
        Val2 = Val2 + (flag ? SetTimely(XtableKarkard.rows(i).cells(1).firstChild.value) : (-1 * SetTimely(XtableKarkard.rows(i).cells(1).firstChild.value)));
        //---------------              
        flag = getCntChar("-", XtableKarkard.rows(i).cells(2).innerText) > 0 ? false : true;
        Val3 = Val3 + (flag ? SetTimely(XtableKarkard.rows(i).cells(2).innerText) : (-1 * SetTimely(XtableKarkard.rows(i).cells(2).innerText)));
    }
    if (Table3.rows.length > 0) {
        Table3.rows(0).cells(0).innerHTML = "<div style='width:40px;background-color:#DBEEDB'>" + SetHourlyTime(Val1) + "</div>";
        Table3.rows(0).cells(1).innerHTML = "<div style='width:40px;background-color:#DBEEDB'>" + SetHourlyTime(Val2) + "</div>";
        Table3.rows(0).cells(2).innerHTML = "<div style='width:40px;background-color:#FFFFCC'>" + SetHourlyTime(Val3) + "</div>";
    }
}
//==================================================
function onchangeMo(obj) {
    var Movazafi = 0;
    var KarObj = obj.parentElement.previousSibling.firstChild.innerText;
    var Karkard = 0;
    if (document.getElementById(MasterObj + "txtShowHourlyTime").value == 1) {
        Movazafi = parseInt(obj.value.split(":")[0]) * 60;
        Karkard = parseInt(KarObj.split(":")[0]) * 60;
        if (obj.value.split(":").length > 1)
            Movazafi = parseInt(Movazafi) + obj.value.split(":")[1];
        if (KarObj.split(":").length > 1)
            Karkard = parseInt(Karkard) + parseInt(KarObj.split(":")[1]);
    }
    else {
        Movazafi = parseInt(obj.value.split(":")[0])
        Karkard = parseInt(KarObj.split(":")[0]);
    }
    obj.parentElement.nextSibling.firstChild.innerText = SetHourlyTime(parseInt(Karkard) - parseInt(Movazafi));
}
function onfocusMo(obj) {
    obj.select();
    obj.focus();
}
//=======================================================
function ClearHeader() {
    while (XTabTable.rows.length > 0) {
        XtableHName.deleteRow();
        XTabTable.deleteRow();
        XtableHkarkard.deleteRow();
    }
}
//=======================================================
function MakeHeader() {
    ClearHeader();
    XtableHName.insertRow(0);
    XtableHName.insertRow(1);
    XTabTable.insertRow(0);
    XTabTable.insertRow(1);
    XtableHkarkard.insertRow(0);
    XtableHkarkard.insertRow(1);
    TRHIntval.style.display = "inline";
    TDHIntval.innerHTML = "<div class='CssHeaderStyle'  style='height:42px;width:20px'></div>";
    TDHIntval.className = "CssHeaderStyle";
    //------------------------------
    var OGridH = XtableHName;
    var OCEll = OGridH.rows(0).insertCell();
    OGridH.rows(0).insertCell();
    OGridH.rows(0).insertCell();

    OGridH.rows(0).cells(0).className = "CssHeaderStyle"
    OGridH.rows(0).cells(1).className = "CssHeaderStyle"
    OGridH.rows(0).cells(2).className = "CssHeaderStyle"
    OGridH.rows(1).insertCell();
    OGridH.rows(1).insertCell();
    OGridH.rows(1).insertCell();

    OGridH.rows(1).cells(0).innerHTML = "<div style='width:50px;height:21;' align='center'>پرسنلي</div>";
    OGridH.rows(1).cells(1).innerHTML = "<div style='width:121px;height:21;' align='center'>واحد</div>";
    OGridH.rows(1).cells(2).innerHTML = "<div style='width:70px;border-left:1px solid black;height:20;' align='center'>سمت</div>";

    OGridH.rows(1).cells(0).className = "CssHeaderStyle"
    OGridH.rows(1).cells(1).className = "CssHeaderStyle"
    OGridH.rows(1).cells(2).className = "CssHeaderStyle"

    OGridH.rows(0).cells(0).style.width = "50px";
    OGridH.rows(0).cells(1).innerHTML = "<div style='width:121px;height:21;' align='left'></div>";
    OGridH.rows(0).cells(2).innerHTML = "<div style='width:70px;border-left:1px solid black;height:21;' align='center'></div>";
    //-------------------------
    var XmlNodeNew = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily");
    var SDate1
    var Day
    var str = "background-color:#CBD5DE;";
    var StrDay = '';
    var DayName = "";
    var WPDayName1 = parseInt(WPDayName);
    var Desc = "";
    for (var i = 0; i < CountDay; i++) {
        StrDay = XmlNodeNew.item(i).selectSingleNode("N").text;
        DayName = XmlNodeNew.item(i).selectSingleNode("U").text;
        SDate1 = XmlNodeNew.item(i).selectSingleNode("D").text;
        Day = XmlNodeNew.item(i).selectSingleNode("Y").text;
        Desc = XmlNodeNew.item(i).selectSingleNode("C").text;
        var Ocell1 = XTabTable.rows(0).insertCell();
        var OCEllName = XTabTable.rows(1).insertCell();

        if (WPDayName1 == 0 && str == "background-color:#CBD5DE;")
            str = "background-color:#B1C0CD;"
        else if (WPDayName1 == 0 && str == "background-color:#B1C0CD;")
            str = "background-color:#CBD5DE;"
        if (Desc != "") DayName = DayName + "-" + Desc;
        Ocell1.innerHTML = "<div style='width:35px;color:Black;" + str + "' title=" + DayName + ">" + StrDay + "</div>";
        Ocell1.style.width = "35px";
        Ocell1.align = "center"
        Ocell1.className = "CssHeaderStyle";

        OCEllName.innerHTML = "<div style='width:35px;' title=" + SDate1 + ">" + Day + "</div>";
        OCEllName.style.width = "35px";
        OCEllName.align = "center"
        OCEllName.className = "CssHeaderStyle";
        WPDayName1 = (WPDayName1 + 1) % 7;
    }
    //---------------------------------
    var Ocell1 = XtableHkarkard.rows(0).insertCell();
    var OCEllName = XtableHkarkard.rows(1).insertCell();

    Ocell1.style.width = "45px";
    Ocell1.align = "center"
    Ocell1.className = "CssHeaderStyle";
    Ocell1.innerHTML = "<div style='width:45px;border-right:1px solid black;' align='center'></div>";
    OCEllName.innerHTML = "<div style='width:45px;border-right:1px solid black;' align='center' title='کارکرد' >ک</div>";
    OCEllName.className = "CssHeaderStyle";

    var Ocell2 = XtableHkarkard.rows(0).insertCell();
    var OCEllName2 = XtableHkarkard.rows(1).insertCell();
    Ocell2.style.width = "45px";
    Ocell2.align = "center"
    Ocell2.className = "CssHeaderStyle";
    OCEllName2.innerHTML = "<div style='width:45px;' align='center' title='موظفي' >م.ظ</div>";
    OCEllName2.className = "CssHeaderStyle";

    var Ocell3 = XtableHkarkard.rows(0).insertCell();
    var OCEllName3 = XtableHkarkard.rows(1).insertCell();
    Ocell3.style.width = "45px";
    Ocell3.align = "center"
    Ocell3.className = "CssHeaderStyle";

    OCEllName3.innerHTML = "<div style='width:45px;' align='center' title='اضافه کاري' >اض</div>";
    OCEllName3.className = "CssHeaderStyle";
    XTabTable.className = "FrozenHeader";
    XtableHkarkard.className = "FrozenHeader";
    XtableHName.className = "FrozenHeader";
    TDHIntval.className = "FrozenHeader";
}
//###########################end Create Grid********************************************
function OnClickBtnFilter() {

    document.getElementById(MasterObj + "TemptxtWP").value = $get(MasterObj + "CmbWorkPeriod").value;

    if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "") {
        SetMsg("لطفا پرسنل مورد نظر را انتخاب کنيد")
    }
    else {

        document.getElementById(MasterObj + "txtPCodeTemp").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;
        $get(MasterObj + "txtVersions").value = $get(MasterObj + "CmbVersion").value;
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//=======================================================
function onclickGrd(Obj) {
    //        var Temp = Obj.innerText;
    //        Obj.innerText = "";
    //        $get("txtTemp").value = Temp;
    //        Obj.appendChild($get("txtTemp"));
    var Row, Column;
    Row = Obj.parentElement.parentElement.rowIndex;
    Column = Obj.parentElement.cellIndex;
    SetColorFulRowsColumn(Row, Column + 1);
}
//========================================================
function SetColorFulRowsColumn(Row, Column) {
    if (SelectedRow != undefined) {
        if (SelectedColumn != -1) {
            eval("$('td.TD" + SelectedColumn + "').removeClass('SelectedCol');");
            eval("$('td.TDCount" + SelectedColumn + "').removeClass('SelectedCol');");
            XTabTable.rows(1).cells(SelectedColumn - 1).style.removeAttribute("backgroundColor");
        }
        XTableData.rows(parseInt(SelectedRow)).style.removeAttribute("backgroundColor");
        XtableName.rows(parseInt(SelectedRow)).style.removeAttribute("backgroundColor");
        XtableKarkard.rows(parseInt(SelectedRow)).style.removeAttribute("backgroundColor");
    }
    SelectedColumn = Column;
    SelectedRow = Row;
    if (Column != -1) {
        eval("$('td.TD" + Column + "').addClass('SelectedCol');");
        eval("$('td.TDCount" + Column + "').addClass('SelectedCol');");
        XTabTable.rows(1).cells(Column - 1).style.background = "#88C142";
    }
    XTableData.rows(Row).style.background = "#88C142";
    XtableName.rows(Row).style.background = "#88C142";
    XtableKarkard.rows(Row).style.background = "#88C142";
}
//======================================================
function KarkardFunc(OXMLTMPNode, Date) {
    var Time = 0;
    Date = Date.split("/")[0] + Date.split("/")[1] + Date.split("/")[2];
    XmlNode = oXmlDCOll.documentElement.selectNodes("/DataEntryEntity/DCollect[A ='" + OXMLTMPNode[0].selectSingleNode("A").text + "' and  '" + Date + "'>=SD and '" + Date + "'<=E]");
    if (XmlNode.length > 0) {
        Time = parseInt(XmlNode.item(0).selectSingleNode("T").text);
    }
    return Time
}
//=========================================================       
function TimeWPDate(Obj) {
    var OROW = Obj.parentElement.parentElement;
    var index = Obj.parentElement.parentElement.rowIndex;
    var Sum = 0;
    var XmlNode;
    var Date;
    for (var i = 0; i < OROW.cells.length; i++) {
        if (OROW.cells(i).firstChild.style.color != "red") {
            Date = XTabTable.rows(1).cells(i).childNodes(0).title
            Date = Date.split("/")[0] + Date.split("/")[1] + Date.split("/")[2];
            XmlNode = oXmlDCOll.documentElement.selectNodes("/DataEntryEntity/DCollect[A ='" + OROW.cells(i).firstChild.value.toUpperCase() + "' and  '" + Date + "'>=SD and '" + Date + "'<=E]");
            if (XmlNode.length > 0) {
                Sum += parseInt(XmlNode.item(0).selectSingleNode("T").text);
            }
        }
    }
    var Movazaf
    if (document.getElementById(MasterObj + "txtShowHourlyTime").value == 1)
        Movazaf = SetTimely(XtableKarkard.rows(index).cells(1).firstChild.value);
    else
        Movazaf = XtableKarkard.rows(index).cells(1).firstChild.value;
    var Ezafe = Sum - Movazaf;
    if (document.getElementById(MasterObj + "txtShowHourlyTime").value == 1) {
        XtableKarkard.rows(index).cells(0).firstChild.innerText = SetHourlyTime(Sum);
        XtableKarkard.rows(index).cells(2).firstChild.innerText = SetHourlyTime(Ezafe);
    }
    else {
        XtableKarkard.rows(index).cells(0).firstChild.innerText = Sum;
        XtableKarkard.rows(index).cells(2).firstChild.innerText = Ezafe;
    }
}
//==========================================================
function SetTimely(Val) {
    var Sum = Val.split(":")[0] * 60

    if (Val.split(":").length > 1) {
        Sum = Sum + parseInt(Val.split(":")[1]);
    }
    return Sum;
}
//===========================================================
function SetHourlyTime(Sum) {
    var SignFlag = Sum < 0 ? 1 : 0;
    Sum = Math.abs(Sum);
    return parseInt(Sum / 60).toString() + ":" + Sum % 60 + (SignFlag == 1 ? "-" : "");
}
//=======================================================
function AddCountGrid(OXMLTMPNode, Index, Count) {
    var a = 0, b = 0, c = 0;
    var OGrid = XtableStructName; var Flag1 = false;
    var OGridCount = XTableCount;
    //-------------------------------مربوط به تشخيص ساختار اصلی یا ترکیبی-----------       
    var StructNew = OXMLTMPNode[0].selectSingleNode("S").text.trim();
    var Home = OXMLTMPNode[0].selectSingleNode("H").text.trim();
    var ISBaseStruct = OXMLTMPNode[0].selectSingleNode("B").text.trim();  //---------جزو ساختارهای اصلی است یا ترکیبی
    var MustInsert = $get(MasterObj + "txtShowCombinStruct").value == "1" ? "1" : ISBaseStruct; //------------بايد جزو محاسبات بیاید یا نه       
    var CS = OXMLTMPNode[0].selectSingleNode("CS").text.trim();
    //-------------------------------------------------------------------------------        
    if (MustInsert == "1") {
        if (Home != "") {
            a = parseInt(OGridCount.rows(parseInt(Home)).cells(Index).firstChild.innerText);
            b = Count;
            c = parseInt(a + b);
            OGridCount.rows(parseInt(Home)).cells(Index).firstChild.innerText = c.toString();
        }
        else {
            var IntvalNew = 0;
            var XmlForHome = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S>" + StructNew + " and H!='']");
            if (XmlForHome.length > 0) {
                IntvalNew = XmlForHome[0].selectSingleNode("H").text;
                for (var i = 0; i < XmlForHome.length; i++) {
                    XmlForHome[i].selectSingleNode("H").text = parseInt(XmlForHome[i].selectSingleNode("H").text) + 1;
                }
            }
            else {
                var XmlForHome1 = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[ H!='']");
                if (XmlForHome1.length > 0) {
                    IntvalNew = parseInt(XmlForHome1[XmlForHome1.length - 1].selectSingleNode("H").text) + 1;
                }
            }
            OXMLTMPNode[0].selectSingleNode("H").text = IntvalNew;
            $get(MasterObj + 'txtXmlInfo').value = oXmlStruct.xml;
            oXmlStruct.loadXML($get(MasterObj + 'txtXmlInfo').value)
            var orow = OGrid.insertRow(IntvalNew);
            orow.insertCell();
            orow.cells(0).innerHTML = "<div class='NameOFStruct'  style='width:255px;background-color:#DBEEDB;height:21px' align='center' SID=" + OXMLTMPNode[0].selectSingleNode("S").text.trim() + " title='" + OXMLTMPNode[0].selectSingleNode("A").text + "'>" + OXMLTMPNode[0].selectSingleNode("N").text + " : " + OXMLTMPNode[0].selectSingleNode("A").text + "</div>";
            var ORow = OGridCount.insertRow(IntvalNew);
            ORow.className = "CssHeaderStyle";
            for (var j = 1; j <= CountDay; j++) {
                var Cell = ORow.insertCell();
                Cell.className = "TDCount" + j;
                Cell.innerHTML = "<div  style='width:34px;he' align='center'>0</div>";
                //Cell.className = "CssHeaderStyle";
            }
            var OROW = Table3.insertRow(IntvalNew);
            var Cell1 = OROW.insertCell();
            var Cell2 = OROW.insertCell();
            var Cell3 = OROW.insertCell();
            Cell1.innerHTML = "<div class='NameOFStruct' style='width:45px;background-color:#DBEEDB;' align='center' >  </div>";
            Cell2.innerHTML = "<div class='NameOFStruct'  style='width:45px;background-color:#DBEEDB;' align='center' >&nbsp;</div>";
            Cell3.innerHTML = "<div class='NameOFStruct'  style='width:45px;background-color:#DBEEDB;' align='center' >&nbsp;</div>";
            AddCountGrid(OXMLTMPNode, Index, Count);
        }
    }
    if (ISBaseStruct == "0") {
        var S1 = CS.split(",")[0];
        var S2 = CS.split(",")[1];
        var S3 = CS.split(",")[2];
        var S4 = CS.split(",")[3];
        if (S1 != 0 && S1 != undefined) {
            XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S1 + "]");
            AddCountGrid(XmlNodestr, Index, Count);
        }
        if (S2 != 0 && S2 != undefined) {
            XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S2 + "]");
            AddCountGrid(XmlNodestr, Index, Count);
        }
        if (S3 != 0 && S3 != undefined) {
            XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S3 + "]");
            AddCountGrid(XmlNodestr, Index, Count);
        }
        if (S4 != 0 && S4 != undefined) {
            XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S4 + "]");
            AddCountGrid(XmlNodestr, Index, Count);
        }
    }
}
//================================================================================
function ClearCountGrid() {
    while (XTableCount.rows.length > 0) {
        XTableCount.deleteRow();
        XtableStructName.deleteRow();
        Table3.deleteRow();
    }
}
//==============================================================================    
function DeleteRowPopup() {
    if (XTableData.rows(DeletedIndex).P != "") {
        for (var i = 0; i < XTableData.rows(DeletedIndex).cells.length; i++) {
            onfocusWPDate(XTableData.rows(DeletedIndex).cells(i).firstChild, 1);
            XTableData.rows(DeletedIndex).cells(i).firstChild.value = "";
            onblurWPDate(XTableData.rows(DeletedIndex).cells(i).firstChild);
        }
        var XmlNode = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + XTableData.rows(DeletedIndex).P + "]");
        if (XmlNode.length > 0) {
            var f = oXmlData.documentElement.removeChild(XmlNode.item(0))
            $get(MasterObj + 'txtXml').value = oXmlData.xml;
        }
    }
    XTableData.deleteRow(DeletedIndex);
    XtableName.deleteRow(DeletedIndex);
    XtableKarkard.deleteRow(DeletedIndex);
    var Obj = IntvalUL.childNodes[DeletedIndex];
    IntvalUL.removeChild(Obj);
    for (var i = DeletedIndex; i < IntvalUL.childNodes.length; i++) {
        IntvalUL.childNodes[i].firstChild.innerText = i + 1;
    }
}
//===============================================
function OnClickBtnExportToPdf() {
    document.getElementById(MasterObj + "BtnSendTOPdf").click();
}
//================================================ 
function DeleteStructure() {
    oXmlStruct.loadXML($get(MasterObj + 'txtXmlInfo').value)
    var XmlNodeStruct = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct");
    for (var i = 0; i < XmlNodeStruct.length; i++) {
        XmlNodeStruct[i].selectSingleNode("H").text = "";
    }
    $get(MasterObj + 'txtXmlInfo').value = oXmlStruct.xml;
    oXmlStruct.loadXML($get(MasterObj + 'txtXmlInfo').value)
}
//=================================
function onclickTB() {
}