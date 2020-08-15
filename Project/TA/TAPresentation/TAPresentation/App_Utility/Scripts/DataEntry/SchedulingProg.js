document.dir = "RTL"
//window.name = "SchedulingProg"
//aspnetForm.target = "SchedulingProg"
//window.target = "SchedulingProg.aspx";
//alert($get(MasterObj + "txtCellsWidth").value);
//var MasterObj = "ctl00_ContentPlaceHolder1_";
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
var oXmlDefault = new ActiveXObject("Microsoft.XMLDOM")
oXmlDefault.async = "false";
oXmlDefault.loadXML($get(MasterObj + 'txtDefXml').value)
var xmlNodeDefault;
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
var modalObject = null;

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

MakeTBStruct(TBStruct);
MakeTBStruct(TBS);
PopupStruct.setAttribute("Entity", "");
var WidthScreen = window.screen.width;
$get("TDMain").style.width = WidthScreen - 10;
$get("DivMain").style.width = WidthScreen - 10;
$get("DivGrid").style.width = WidthScreen - 10;
$get("DivCount").style.width = WidthScreen - 10;

if ($get(MasterObj + "CmbVersion").value == 19002) {
    if (typeof document.getElementById("OToolBar_BtnSave") == "object") {
        if (document.getElementById("OToolBar_BtnSave") != null)
            document.getElementById("OToolBar_BtnSave").style.display = "none";
    }

    if (typeof document.getElementById("OToolBar_BtnConfirm") == "object") {
        if (document.getElementById("OToolBar_BtnConfirm") != null)
            document.getElementById("OToolBar_BtnConfirm").style.display = "none";
    }
}

var StartTime = "";
var EndTime = "";
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
//------------------------------------------------------------
$('document').ready(function () {
    scrollTips.init();
    $("#IntvalUL").sortable('');
    $('#IntvalUL').bind('sortstart', function (event, ui) {
        ObjIntval = ui.item[0].firstChild.innerText;
        if (LastSelectIntval != null) {
            XtableName.rows(parseInt(LastSelectIntval) - 1).cells(0).firstChild.style.color = "black";
            LastSelectIntval = null;
        }
        XtableName.rows(parseInt(ObjIntval) - 1).cells(0).firstChild.style.color = "red";
    });
    $('#IntvalUL').bind('sortstop', function (event, ui) {
        var Obj;
        for (var i = 0; i < $('li').length; i++) {
            if ($('#IntvalUL')[0].childNodes.length > i) {
                Obj = $('#IntvalUL')[0].childNodes[i];
                if (Obj.childNodes.length > 0)
                    Obj.childNodes[0].innerText = i + 1;
            }
        }
        var DestinationIntval = ui.item[0].firstChild.innerText;
        FlagForIntval = FlagForIntval || (ObjIntval != DestinationIntval);
        //--------------------------------------
        var ObjRow, ObjNew;
        XtableName.moveRow(parseInt(ObjIntval) - 1, parseInt(DestinationIntval) - 1);
        XTableData.moveRow(parseInt(ObjIntval) - 1, parseInt(DestinationIntval) - 1);
        XtableKarkard.moveRow(parseInt(ObjIntval) - 1, parseInt(DestinationIntval) - 1);
        CorrectClass();
        XtableName.rows(parseInt(DestinationIntval) - 1).cells(0).firstChild.style.color = "black";
    });
});
//---------------------------------------------
if ($get(MasterObj + "txtIDTemp").value != "" && $get(MasterObj + "txtIDTemp").value != "0") {

    oXmlData.loadXML($get(MasterObj + 'txtXml').value)
    StrDelete = "<Root></Root>";
    SelectedRow = null
    SelectedColumn = null;
    //------اطلاعات مربوط به دوره انتخابي در متغيير های مربوطه ریخته می شود 
    xmlNodesme = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + $get(MasterObj + "TemptxtWP").value + "]")
    EDate = xmlNodesme.item(0).selectSingleNode('E').text;
    SDate = xmlNodesme.item(0).selectSingleNode('S').text;
    CountDay = xmlNodesme.item(0).selectSingleNode('C').text;
    WPDayName = xmlNodesme.item(0).selectSingleNode('DN').text;
    //-----------                
    XmlNodeForHoliday = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily");
    WidthScreen = window.screen.width;
    if (CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 425 > WidthScreen) {
        $get("DivGridData").style.width = WidthScreen - 425;
        $get("TDDivData").style.width = WidthScreen - 425;
        $get("DivBaseCount").style.width = WidthScreen - 425;
    }
    Readonly = true;
    if ($get(MasterObj + "DivDept").style.display == "inline") {
        $("#" + MasterObj + "UCDepartment_txtHidden").val($get(MasterObj + "txtDepartment").value);
        $get(MasterObj + "UCDepartment_cmbDepartment").value = $get(MasterObj + "txtIntvals").value;
        $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").disabled = true;
        $get(MasterObj + "UCDepartment_cmbDepartment").disabled = true;
    }
    else {
        $get(MasterObj + "MultiPerson_cmbPerson_txtCode").value = $get(MasterObj + "txtIntvals").value;
        $get(MasterObj + "MultiPerson_cmbPerson_txtPCode").value = $get(MasterObj + "txtIntvals").value;
        $get(MasterObj + "MultiPerson_cmbPerson_txtName").value = $get(MasterObj + "txtMName").value;
        document.getElementById(MasterObj + "MultiPerson_txtHidden").value = "<Root><Tb><DepartmentID>" + $get(MasterObj + "txtIntvals").value + "</DepartmentID><Selected>1</Selected></Tb></Root>";
    }

   
    if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
        if (document.getElementById('OToolBar_BtnSave') != null)
            document.getElementById('OToolBar_BtnSave').style.display = "none";
    }
    if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
        if (document.getElementById('OToolBar_BtnConfirm') != null) {
            document.getElementById('OToolBar_BtnConfirm').style.display = "none";
        }
    }
    if (typeof document.getElementById('OToolBar_BtnExportToPdf') == "object") {
        if (document.getElementById('OToolBar_BtnExportToPdf') != null) {
            document.getElementById('OToolBar_BtnExportToPdf').style.display = "none";
        }
    }
    if ($get(MasterObj + "txtTableName").value != "") {
        if (document.getElementById('OToolBar_BtnSave') != null)
            document.getElementById('OToolBar_BtnSave').style.display = "inline";
        if (document.getElementById('OToolBar_BtnExportToPdf') != null)
            document.getElementById('OToolBar_BtnExportToPdf').style.display = "inline";
        if (document.getElementById('OToolBar_BtnFilter') != null)
            document.getElementById('OToolBar_BtnFilter').style.display = "none";

        $("#" + MasterObj + "UCDepartment_txtHidden").val($get(MasterObj + "txtDepartment").value);
        $get(MasterObj + "UCDepartment_cmbDepartment").value = $get(MasterObj + "txtIntvals").value;
        $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").disabled = true;
        $get(MasterObj + "UCDepartment_cmbDepartment").disabled = true;

        $get(MasterObj + "MultiPerson_cmbPerson_txtPCode").disabled = true;
        $get(MasterObj + "MultiPerson_cmbPerson_btnDown").disabled = true;
        $get(MasterObj + "MultiPerson_cmbPerson_txtName").disabled = true;
        $get(MasterObj + "MultiPerson_tbMain").all("BtnShowActive").disabled = true;
    }
    Readonly = $get(MasterObj + "txtStatus").value == 1 ? false : true;
    Readonly = $get(MasterObj + "txtVersions").value == 19002 ? true : Readonly;

    MakeHeader();
    CreateGrid();
    MakeTBStruct(TBS);

    var SelectedCell = XTableData.rows(parseInt($get(MasterObj + "txtPersonels").value) - 1).cells(parseInt($get(MasterObj + "txtXmlSave").value) - 1).firstChild;
    if (SelectedCell != null && SelectedCell != undefined) {
        onclickGrd(SelectedCell);
    }
    $get(MasterObj + "txtXmlSave").value = "<Root></Root>";
    $get(MasterObj + "txtPersonels").value = "";
    $get(MasterObj + "txtIntvals").value = "";
}
$get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
//GetAccessBtn();
//================================================================================  
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {
    $get("ImgProgresss").style.display = "inline";
    if (LastSelectIntval != null) {
        XtableName.rows(parseInt(LastSelectIntval) - 1).cells(0).firstChild.style.color = "black";
    }
}
function EndRequestHandler(sender, args) {
    $get("ImgProgresss").style.display = "none";
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "")
        switch (StrVal) {
        //------------------------------------------ 
        case "Filter":
            oXmlData.loadXML($get(MasterObj + 'txtXml').value)
            $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
            StrDelete = "<Root></Root>";
            SelectedRow = null
            SelectedColumn = null;
            //------اطلاعات مربوط به دوره انتخابي در متغيير های مربوطه ریخته می شود 
            if (oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + $get(MasterObj + "TemptxtWP").value + "]").length > 0)
                xmlNodesme = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + $get(MasterObj + "TemptxtWP").value + "]")
            EDate = xmlNodesme.item(0).selectSingleNode('E').text;
            SDate = xmlNodesme.item(0).selectSingleNode('S').text;
            CountDay = xmlNodesme.item(0).selectSingleNode('C').text;
            WPDayName = xmlNodesme.item(0).selectSingleNode('DN').text;
            //-----------  
            if (oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily").length > 0)
                XmlNodeForHoliday = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily");
            WidthScreen = window.screen.width;
            if (CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 425 > WidthScreen) {
                $get("DivGridData").style.width = WidthScreen - 425;
                $get("TDDivData").style.width = WidthScreen - 425;
                $get("DivBaseCount").style.width = WidthScreen - 425;
            }

            Readonly = $get(MasterObj + "txtStatus").value == 1 ? false : true;
            Readonly = $get(MasterObj + "txtVersions").value == 19002 ? true : Readonly;
            FlagCountClick = false;
            MakeHeader();
            CreateGrid();

            $get("DivWFDoc").innerHTML = "";
            if ($get(MasterObj + "txtStatusBase").value != 0) {
                $get("DivWFDoc").innerHTML = "<img style='cursor:pointer' onclick='onclickImgWF()' src='" + ($get(MasterObj + "txtStatusBase").value == 203 ? "/TAPresentation/App_Utility/Images/Icons/mojavezhaye vaghe shode.gif" : "/TAPresentation/App_Utility/Images/Icons/mojaveze ghabl az voghoo.gif") + "'/>";
            }
            if ($get(MasterObj + "txtStatus").value == 0 || $get(MasterObj + "CmbVersion").value == "19002") {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "none";
                }
                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
                    }
                }
            }
            else {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "inline";
                }

                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "inline";
                    }
                }
            }
            //GetAccessBtn();
            MakeTBStruct(TBS);
            break;
        //---------------------------------
        case "Save":
            var Flag = true;
            if ($get(MasterObj + "txtStatus").value == 0 || $get(MasterObj + "CmbVersion").value == "19002") {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "none";
                }

                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
                    }
                }
            }
            else {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "inline";
                }
                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "inline";
                    }
                }
            }
            if ($get(MasterObj + "txtTableName").value != "") {
                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
                    }
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1") {
                $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
                StrDelete = "<Root></Root>";
                oXmlData.loadXML($get(MasterObj + 'txtXml').value)

                if (oXmlData.xml != oXmlDoc2.xml) {
                    CreateGrid();
                    if ($get(MasterObj + 'txtInvalidSave').value != "") {
                        var oXmlD = new ActiveXObject("Microsoft.XMLDOM")
                        oXmlD.async = "false";
                        oXmlD.loadXML($get(MasterObj + 'txtInvalidSave').value)
                        var XmlNodeNew = oXmlD.documentElement.selectNodes("/GeneralEntity/InvalidData");

                        var XmlNodeDoc1, XmlNodeDoc2, Row, Column;
                        for (var i = 0; i < XmlNodeNew.length; i++) {
                            Flag = false;
                            XmlNodeDoc1 = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + XmlNodeNew.item(i).selectSingleNode("P").text.trim() + "]");
                            if (XmlNodeDoc1.length > 0)
                                Row = XmlNodeDoc1[0].selectSingleNode("V").text;
                            XmlNodeDoc2 = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily[D='" + XmlNodeNew.item(i).selectSingleNode("D").text + "']");
                            if (XmlNodeDoc2.length > 0)
                                Column = XmlNodeDoc2[0].selectSingleNode("R").text;
                            onfocusWPDate(XTableData.rows(Row - 1).cells(Column - 1).firstChild);
                            XTableData.rows(Row - 1).cells(Column - 1).firstChild.value = XmlNodeNew.item(i).selectSingleNode("S").text;
                            onblurWPDate(XTableData.rows(Row - 1).cells(Column - 1).firstChild);
                        }
                    }
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1" && Flag)
                SetMsg($get(MasterObj + "txtAlert").value);
            else alert($get(MasterObj + "txtAlert").value);
            break;
        //-----------------------------------------          
        case "Delete":

            if ($get(MasterObj + "txtValidateDelete").value == "1") {
                SetMsg($get(MasterObj + "txtAlertDelete").value);
                DeleteRowPopup();
            }
            else alert($get(MasterObj + "txtAlertDelete").value);
            break;
        //--------------------------------------------- 
        case "Confirm":
            var Flag = true;
            if ($get(MasterObj + "txtStatus").value == 0 || $get(MasterObj + "CmbVersion").value == "19002") {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "none";
                }

                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "none";
                    }
                }
            }
            else {
                if (typeof document.getElementById('OToolBar_BtnSave') == "object") {
                    if (document.getElementById('OToolBar_BtnSave') != null)
                        document.getElementById('OToolBar_BtnSave').style.display = "inline";
                }
                if (typeof document.getElementById('OToolBar_BtnConfirm') == "object") {
                    if (document.getElementById('OToolBar_BtnConfirm') != null) {
                        document.getElementById('OToolBar_BtnConfirm').style.display = "inline";
                    }
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1") {
                $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
                StrDelete = "<Root></Root>";
                oXmlData.loadXML($get(MasterObj + 'txtXml').value)

                if (oXmlData.xml != oXmlDoc2.xml) {
                    CreateGrid();

                    if (oXmlData.xml != oXmlDoc2.xml) {
                        CreateGrid();
                        if ($get(MasterObj + 'txtInvalidSave').value != "") {
                            var oXmlD = new ActiveXObject("Microsoft.XMLDOM")
                            oXmlD.async = "false";
                            oXmlD.loadXML($get(MasterObj + 'txtInvalidSave').value)
                            var XmlNodeNew = oXmlD.documentElement.selectNodes("/GeneralEntity/InvalidData");

                            var XmlNodeDoc1, XmlNodeDoc2, Row, Column;
                            for (var i = 0; i < XmlNodeNew.length; i++) {
                                Flag = false;
                                XmlNodeDoc1 = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + XmlNodeNew.item(i).selectSingleNode("P").text.trim() + "]");
                                if (XmlNodeDoc1.length > 0)
                                    Row = XmlNodeDoc1[0].selectSingleNode("V").text;
                                XmlNodeDoc2 = oXmlData.documentElement.selectNodes("/DataEntryEntity/Daily[D='" + XmlNodeNew.item(i).selectSingleNode("D").text + "']");
                                if (XmlNodeDoc2.length > 0)
                                    Column = XmlNodeDoc2[0].selectSingleNode("R").text;
                                onfocusWPDate(XTableData.rows(Row - 1).cells(Column - 1).firstChild);
                                XTableData.rows(Row - 1).cells(Column - 1).firstChild.value = XmlNodeNew.item(i).selectSingleNode("S").text;
                                onblurWPDate(XTableData.rows(Row - 1).cells(Column - 1).firstChild);
                            }
                        }
                    }
                }
            }
            if ($get(MasterObj + "txtValidate").value == "1" && Flag)
                SetMsg($get(MasterObj + "txtAlert").value);
            else alert($get(MasterObj + "txtAlert").value);
            break;
        //-----------------------------------          
        case "Default":
            oXmlDefault.loadXML($get(MasterObj + 'txtDefXml').value)
            xmlNodeDefault = oXmlDefault.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + parseInt(DivDefault.getAttribute("Entity").P) + " ]");
            ContinueForDefault(DivDefault.getAttribute("Entity"), document.getElementById(MasterObj + "CmbDefault").value, 0);
            break;
        //-------------------------------------------------          
        case "RowPersonel":
            oXmlDefault.loadXML($get(MasterObj + 'txtDefXml').value)
            var SignMe;
            if (oXmlDefault.xml != oXmlDoc2.xml) {
                xmlNodeDefault = oXmlDefault.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[C=" + document.getElementById(MasterObj + "txtDefPID").value + "]");
                if (xmlNodeDefault.length > 0) {
                    var RowIndex = NewObj.parentElement.parentElement.rowIndex;

                    if (NewObj.parentElement.parentElement.P != "")
                        SignMe = 1;
                    document.getElementById(MasterObj + "txtDefPID").value = xmlNodeDefault.item(0).selectSingleNode("P").text;
                    NewObj.parentElement.parentElement.P = document.getElementById(MasterObj + "txtDefPID").value;
                    XtableName.rows(RowIndex).P = document.getElementById(MasterObj + "txtDefPID").value;
                    XTableData.rows(RowIndex).P = document.getElementById(MasterObj + "txtDefPID").value;
                    XtableKarkard.rows(RowIndex).P = document.getElementById(MasterObj + "txtDefPID").value;

                    if (xmlNodeDefault.item(0).selectSingleNode("N").text.length > 16) {
                        XtableName.rows(RowIndex).cells(1).firstChild.innerText = xmlNodeDefault.item(0).selectSingleNode("N").text.substr(0, 15) + "...";
                        XtableName.rows(RowIndex).cells(1).firstChild.title = xmlNodeDefault.item(0).selectSingleNode("N").text
                    }
                    else XtableName.rows(RowIndex).cells(1).firstChild.innerText = xmlNodeDefault.item(0).selectSingleNode("N").text;

                    OXMLNODE = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[C='" + PersonCode + "']");

                    var XmlStructMember = oXmlDefault.documentElement.selectNodes("/DataEntryEntity/ValidS[M=" + document.getElementById(MasterObj + "txtDefPID").value + "]");
                    //-------------------------------------------------
                    var STRC = "";
                    if ($get(MasterObj + "txtChk").value == "1") {
                        for (var Count = 0; Count < XmlStructMember.length; Count++) {
                            STRC = STRC + XmlStructMember.item(Count).selectSingleNode("S").text + "$";
                            STRC = STRC + XmlStructMember.item(Count).selectSingleNode("N").text + "$";
                            STRC = STRC + XmlStructMember.item(Count).selectSingleNode("A").text + "$#";

                            oXmlDoc2.loadXML("<DataEntryEntity><ValidS><S>" + XmlStructMember.item(Count).selectSingleNode("S").text + "</S><N>" + XmlStructMember.item(Count).selectSingleNode("N").text + "</N><A>" + XmlStructMember.item(Count).selectSingleNode("A").text + "</A><A>" + XmlStructMember.item(Count).selectSingleNode("A").text + "</A><M>" + document.getElementById(MasterObj + "txtDefPID").value + "</M></ValidS></DataEntryEntity>");
                            var OxmlNodeYadak = oXmlDoc2.documentElement.selectNodes("/DataEntryEntity/ValidS");

                            oXmlData.childNodes[0].appendChild(OxmlNodeYadak.item(0));
                        }
                    }

                    XTableData.rows(RowIndex).setAttribute("Struct", STRC);
                    //-----------------------------------------------------
                    XtableKarkard.rows(RowIndex).cells(1).firstChild.value = xmlNodeDefault.item(0).selectSingleNode("M").text;
                    ContinueForDefault(NewObj.parentElement.parentElement, document.getElementById(MasterObj + "txtDefWp").value, 1)

                    var f = oXmlDefault.documentElement.removeChild(xmlNodeDefault.item(0))
                    oXmlData.childNodes[0].appendChild(f);

                    if (SignMe == 0)
                        var F1 = oXmlData.documentElement.removeChild(OXMLNODE.item(0))
                    $get(MasterObj + 'txtXml').value = oXmlData.xml;

                    if (PersonCode != "") {
                        var OXMLNode1 = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[C=" + PersonCode + "]");
                        if (OXMLNode1.length > 0) {
                            var f = oXmlData.documentElement.removeChild(OXMLNode1.item(0));
                            $get(MasterObj + 'txtXml').value = oXmlData.xml;
                            oXmlData.loadXML($get(MasterObj + 'txtXml').value)
                        }
                    }
                    var RowIndex = NewObj.parentElement.parentElement.rowIndex;
                    PersonCode = NewObj.value;
                }
                else {
                    alert("شماره پرسنلي وارد شده نامعتبر است");
                    NewObj.value = PersonCode;
                    NewObj.select();
                    NewObj.focus();
                }
            }
            break;
        //-----------------------------------------------------     
        case "SetIntval":
            if ($get(MasterObj + "txtValidateDelete").value == "1") {
                SetMsg($get(MasterObj + "txtAlertDelete").value);
            }
            else alert($get(MasterObj + "txtAlertDelete").value);
            break;
        //------------------------------------------------------------                 
    }
    //    if (XTableData.rows(0) != null && StrVal != "RowPersonel") {
    //        XTableData.rows(0).cells(0).firstChild.select();
    //        XTableData.rows(0).cells(0).firstChild.focus();
    //    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";
    //GetAccessBtn();
}
//###############################################################################################
var oPopupDay = window.createPopup()
var ObjPopupDay = "";
function contextMenuDays(Obj) {
    var lefter = event.screenX
    var topper = event.screenY
    var str = $get("DivPopupDays").innerHTML;
    str = str.replace("onclickChangeShift(0)", "parent.onclickChangeShift()");
    str = str.replace("onclickSowLog()", "parent.onclickSowLog()");
    oPopupDay.document.body.innerHTML = str;
    ObjPopupDay = Obj;
    oPopupDay.show(lefter, topper, 80, 60)
}
//==================================================
function onclickChangeShift() {
    var index = ObjPopupDay.parentElement.cellIndex;
    var date = XTabTable.rows(1).cells(index).firstChild.title;
    var PID = XtableName.rows(ObjPopupDay.parentElement.parentElement.rowIndex).cells(0).firstChild.title;
    var url = "RequestChangeShift.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&SDate=13" + date + "&EDate=13" + date + "&PersonCode=" + PID + "&InstanceID=" + $get(MasterObj + "txtInstanceID").value;
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
                OCell1.innerText = Str1.split("$")[1];
                var OCell2 = NewRow.insertCell();
                OCell2.innerText = Str1.split("$")[2];
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
    OrowKarkard.setAttribute("P", XMLNODE.selectSingleNode('P').text)//--------------------------------------پرسنلی

    oRow.setAttribute("Sex", XMLNODE.selectSingleNode("A").text);
    oRow.setAttribute("Job", XMLNODE.selectSingleNode("G").text);
    oRow.setAttribute("Contract", XMLNODE.selectSingleNode("CT").text);
    oRow.setAttribute("SD", XMLNODE.selectSingleNode("SD").text);
    oRow.setAttribute("ED", XMLNODE.selectSingleNode("ED").text);
    //---------------------
    oRow.setAttribute("ISD", XMLNODE.selectSingleNode('ISD').text)
    var XmlNodeTmp;
    var Maxim = 0
    if (!Readonly) {
        var STRC = "";
        if ($get(MasterObj + "txtChk").value == "1") {
            for (var Count = 0; Count < XmlStructM.length; Count++) {
                STRC = STRC + XmlStructM.item(Count).selectSingleNode("S").text + "$";
                STRC = STRC + XmlStructM.item(Count).selectSingleNode("N").text + "$";
                STRC = STRC + XmlStructM.item(Count).selectSingleNode("A").text + "$#";
            }
        }
        OrowData.setAttribute("Struct", STRC);
    }
    //--------------------------رديف   
    Intval = Intval + 1;
    var UL = $get("IntvalUL");
    UL.innerHTML += "<li><div style='width:20px;height:28px;" + StrClassName + "' align='center' >" + Intval + "</div> </li>";
    //--------------------------پرسنلی
    val = XMLNODE.selectSingleNode('C').text.substr(0, 7);
    var title = XMLNODE.selectSingleNode('C').text;
    var oCell1 = oRow.insertCell()
    if (Readonly) oCell1.innerHTML = "<div align='center' onclick='ClickRows(this)'  style='width:50px;font-weight:bold' title='" + title + "' >" + val + "</div>";
    else {
        if (val != "") oCell1.innerHTML = "<input class='TxtControls' onclick='ClickRows(this)' align='center' type='text' value='" + val + "' style='width:50px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
        else oCell1.innerHTML = "<input class='TxtControls' align='center' onclick='ClickRows(this)' type='text' value='' style='width:50px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
    }
    //------------------------------نام
    val = XMLNODE.selectSingleNode("N").text;
    var oCell2 = oRow.insertCell()
    var StrColor = ""
    var StrContract = "";
    var StrName = "";

    if (XMLNODE.selectSingleNode("CT").text != 0)
        StrContract = "<img src='" + (XMLNODE.selectSingleNode("BG").text.trim() == "true" ? "../../App_Utility/Images/Icons/GoldSign.gif" : "../../App_Utility/Images/Icons/SilverSign.gif") + "' title='" + XMLNODE.selectSingleNode("CN").text + "'/>";

    if (val != "") StrName = val.length > 16 ? val.substring(0, 15) + "..." : val;
    if (oRow.ISD == 0)
        StrColor = "color:Green;";
    oCell2.innerHTML = "<div onclick='ClickRows(this)'  style='float:left; width:120px;" + StrColor + "'" + (Readonly ? "" : "oncontextmenu='contextMenu(this);return false;") + "' title='" + val + "'>" + StrContract + StrName + "</div>";

    oCell2.align = "right"
    oCell1.style.height = "28px";
    oCell2.style.height = "28px";
    //----------------------------------    -سمت سازماني
    var oCell6 = oRow.insertCell()
    var ImgStr = " ";
    var StrSemat = XMLNODE.selectSingleNode("F").text;
    if (StrSemat.length > 7) {
        StrSemat = StrSemat.substr(0, 5) + "..";
    }
    if (XMLNODE.selectSingleNode("A").text == 9701)
        ImgStr = "<img src='../../App_Utility/images/Icons/Male.png'  width='16px' title='مرد'/>"
    else if (XMLNODE.selectSingleNode("A").text == 9702)
        ImgStr = "<img  src='../../App_Utility/images/Icons/Female.png'  width='16px' title='زن'/>";
    else ImgStr = "<img  src='../../App_Utility/images/Icons/blank.gif' width='16px' />";
    oCell6.innerHTML = "<div style='width:70px' onclick='ClickRows(this)'  style='float:left;width:70px;border-left:1px solid black;' title='" + XMLNODE.selectSingleNode("F").text + "'>" + ImgStr + StrSemat + "</div>";

    //======================================================روزهای دوره====================================               
    var SDate1 = SDate;
    var EDate1 = EDate;
    var str = "";
    if (oRow.className == "CssItemStyle") {
        str = "background-color:#d5e1fd;";
        SavedBGColor = "#d5e1fd";
    }
    else {
        str = "background-color:OldLace";
        SavedBGColor = "OldLace";
    }
    var StrTemp
    var Karkard = 0;
    var ChangeMode = 0;
    var title = "";
    var OXMLTMPNode
    var SavedBGColor = "";
    var XmlNodeRowed;
    var WPDayName1 = parseInt(WPDayName);
    for (var i = 1; i <= CountDay; i++) {
        title = "";
        SavedBGColor = oRow.className == "CssItemStyle" ? "#d5e1fd" : "OldLace";
        if (XmlNodeForHoliday != null) {
            StrTemp = XmlNodeForHoliday.item(i - 1).selectSingleNode("F").text == 1 ? "background-color:#FFD1C4;" : str;
            SavedBGColor = XmlNodeForHoliday.item(i - 1).selectSingleNode("F").text == 1 ? "#FFD1C4" : SavedBGColor;
        }
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
            OXMLTMPNode = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + XMLNODE.childNodes[i + 1].text.trim().split(';')[0] + "' and S='" + XMLNODE.childNodes[i + 1].text.trim().split(';')[1] + "' ]");

            if (OXMLTMPNode.length > 0) {
                if (ChangeMode)
                    title = XmlNodeTmp[0].selectSingleNode("A").text;
                else
                    title = OXMLTMPNode.item(0).selectSingleNode('N').text;
                XmlNodeRowed = oXmlData.documentElement.selectNodes("/DataEntryEntity/RowedAtt[PID=" + XMLNODE.selectSingleNode('P').text + " and  Date='" + XTabTable.rows(1).cells(i - 1).firstChild.title + "']");
                if (XmlNodeRowed.length > 0) {
                    title = title + '_' + XmlNodeRowed[0].selectSingleNode("InOut").text;
                }
                OCell.innerHTML = "<input onclick='onclickGrd(this)'  class='TxtControls'  align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)' realColor='" + SavedBGColor + "'  onkeydown='onkeydownEnter(this)'" : " readonly " + ($get(MasterObj + "txtStatusBase").value == 203 ? "oncontextmenu='contextMenuDays(this);return false;'" : "")) + "  style='text-align:left;Width:" + $get(MasterObj + "txtCellsWidth").value + "px;font-weight:bold;font-size:" + $get(MasterObj + "txtCellsFont").value + ";" + StrTemp + str2 + "'   title='" + title + "' TrueVal='" + XMLNODE.childNodes[i + 1].text.split(';')[0] + "' value='" + XMLNODE.childNodes[i + 1].text.split(';')[0] + "'/>";
                AddCountGrid(OXMLTMPNode, i - 1, 1, Intval - 1);
                Karkard = Karkard + KarkardFunc(OXMLTMPNode, XTabTable.rows(1).cells(i - 1).firstChild.title);
            }
            else OCell.innerHTML = "<input onclick='onclickGrd(this)' class='TxtControls' align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)' realColor='" + SavedBGColor + "'  onkeydown='onkeydownEnter(this)' " : "readonly " + ($get(MasterObj + "txtStatusBase").value == 203 ? "oncontextmenu='contextMenuDays(this);return false;'" : "")) + "   style='text-align:left;Width:" + $get(MasterObj + "txtCellsWidth").value + "px;font-weight:bold;font-size:" + $get(MasterObj + "txtCellsFont").value + ";" + StrTemp + str2 + "'   title='" + title + "' TrueVal=''/>";
        }
        else {
            // OCell.innerText = "";
            OCell.innerHTML = "<input onclick='onclickGrd(this)'  class='TxtControls' align='center' " + (!Readonly ? " onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)' realColor='" + SavedBGColor + "'  onkeydown='onkeydownEnter(this)' " : "readonly " + ($get(MasterObj + "txtStatusBase").value == 203 ? "oncontextmenu='contextMenuDays(this);return false;'" : "")) + "   style='text-align:left;Width:" + $get(MasterObj + "txtCellsWidth").value + "px;font-weight:bold ;font-size:" + $get(MasterObj + "txtCellsFont").value + ";" + StrTemp + str2 + "'   title='" + title + "' TrueVal=''/>";
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
        Movazafi = SetTimely(obj.value);
        Karkard = SetTimely(KarObj);
        obj.parentElement.nextSibling.firstChild.innerText = SetHourlyTime(parseInt(Karkard) - parseInt(Movazafi));
    }
    else {
        Movazafi = parseInt(obj.value.split(":")[0])
        Karkard = parseInt(KarObj.split(":")[0]);
        obj.parentElement.nextSibling.firstChild.innerText = parseInt(Karkard) - parseInt(Movazafi);
    }


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
    DivHeader.innerText = "";
    try {
        if (modalObject != null) {
            modalObject.DivDataHeader.innerHTML = "";
        }
    } catch (e) {
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
    TDHIntval.innerHTML = "<div class='CssHeaderStyle'  style='height:42px;width:20px'><img style='cursor:pointer' src='../../App_Utility/Images/Icons/OK2.png' title='ذخيره جابجايي' onclick='onclickImgSetIntval(1)'/></div>";
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
    OGridH.rows(1).cells(1).innerHTML = "<div style='width:121px;height:21;' align='center'>نام</div>";
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
    var Flag1;
    for (var i = 0; i < CountDay; i++) {
        StrDay = XmlNodeNew.item(i).selectSingleNode("N").text;
        DayName = XmlNodeNew.item(i).selectSingleNode("U").text;
        SDate1 = XmlNodeNew.item(i).selectSingleNode("D").text;
        Day = XmlNodeNew.item(i).selectSingleNode("Y").text;
        Desc = XmlNodeNew.item(i).selectSingleNode("C").text;
        Flag1 = XmlNodeNew.item(i).selectSingleNode("F").text;
        var Ocell1 = XTabTable.rows(0).insertCell();
        var OCEllName = XTabTable.rows(1).insertCell();

        if (WPDayName1 == 0 && str == "background-color:#CBD5DE;")
            str = "background-color:#B1C0CD;"
        else if (WPDayName1 == 0 && str == "background-color:#B1C0CD;")
            str = "background-color:#CBD5DE;"
        if (Desc != "") DayName = DayName + "-" + Desc;
        Ocell1.innerHTML = "<div style='width:" + $get(MasterObj + "txtCellsWidth").value + "px;color:" + (Flag1 == 1 ? "#990000" : "Black") + ";height:21px;" + str + "' title=" + DayName + ">" + StrDay + "</div>";
        Ocell1.style.width = $get(MasterObj + "txtCellsWidth").value + "px";
        Ocell1.align = "center"
        Ocell1.className = "CssHeaderStyle";

        OCEllName.innerHTML = "<div style='width:" + $get(MasterObj + "txtCellsWidth").value + "px;height:21px;' title=" + SDate1 + ">" + Day + "</div>";
        OCEllName.style.width = $get(MasterObj + "txtCellsWidth").value + "px";
        OCEllName.align = "center"
        OCEllName.className = "CssHeaderStyle";
        WPDayName1 = (WPDayName1 + 1) % 7;
    }
    DivHeader.innerText = "<tr>" + XTabTable.rows(0).innerHTML + "</tr><tr>" + XTabTable.rows(1).innerHTML + "</tr>";
    SetHeader();
    //---------------------------------
    var Ocell1 = XtableHkarkard.rows(0).insertCell();
    var OCEllName = XtableHkarkard.rows(1).insertCell();

    Ocell1.style.width = "45px";
    Ocell1.align = "center"
    Ocell1.className = "CssHeaderStyle";
    Ocell1.innerHTML = "<div style='width:45px;height:21px;border-right:1px solid black;' align='center'></div>";
    OCEllName.innerHTML = "<div style='width:45px;border-right:1px solid black;height:21px;' align='center' title='کارکرد' >ک</div>";
    OCEllName.className = "CssHeaderStyle";

    var Ocell2 = XtableHkarkard.rows(0).insertCell();
    var OCEllName2 = XtableHkarkard.rows(1).insertCell();
    Ocell2.style.width = "45px";
    Ocell2.align = "center"
    Ocell2.className = "CssHeaderStyle";
    OCEllName2.innerHTML = "<div style='width:45px;height:21px;' align='center' title='موظفي' >م.ظ</div>";
    OCEllName2.className = "CssHeaderStyle";

    var Ocell3 = XtableHkarkard.rows(0).insertCell();
    var OCEllName3 = XtableHkarkard.rows(1).insertCell();
    Ocell3.style.width = "45px";
    Ocell3.align = "center"
    Ocell3.className = "CssHeaderStyle";

    OCEllName3.innerHTML = "<div style='width:45px;height:21px;' align='center' title='اضافه کاري' >اض</div>";
    OCEllName3.className = "CssHeaderStyle";
    XTabTable.className = "FrozenHeader";
    XtableHkarkard.className = "FrozenHeader";
    XtableHName.className = "FrozenHeader";
    TDHIntval.className = "FrozenHeader";

}
//###########################end Create Grid********************************************
function OnClickBtnSave() {
    var FlagRED = true;
    var Flag = true;
    var i = 3;
    var j = 3;
    while (i < XTableData.rows.length && FlagRED) {
        j = 3;
        while (j < XTableData.rows(i).cells.length - 4 && FlagRED) {
            if (XTableData.rows(i).cells(j).firstChild.style.color == "red" && XTableData.rows(i).cells(j).firstChild.value != "")
                FlagRED = false;
            j++;
        }
        i += 1;
    }
    if (!FlagRED) {
        if (!confirm("ساختار نامعتبر وجود دارد \n آيا ناديده گرفته شود؟"))
            Flag = false;
    }
    if (Flag) {
        if ((document.getElementById(MasterObj + "txtXmlSave").value != "<Root></Root>" &&
               document.getElementById(MasterObj + "txtXmlSave").value != "<Root/>")
         || (StrDelete != "<Root></Root>" && StrDelete != "<Root/>")) {

            if (Flag && CheckData()) {
                document.getElementById(MasterObj + "txtPersonels").value = "<Root></Root>";
                $get(MasterObj + "txtDelXml").value = StrDelete;
                onclickImgSetIntval();
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        else alert("موردي براي ذخيره وجود ندارد")
    }
}
//=====================================================================================
function Save() {
    var Flag = true;
    if ($get(MasterObj + "txtCheckEmpty").value == "1") {
        var SD, ED, Date, ISD

        for (var i = 0; i < XTableData.rows.length; i++) {
            for (var j = 0; j < CountDay; j++) {
                SD = XtableName.rows(i).SD;
                ED = XtableName.rows(i).ED;
                ISD = XtableName.rows(i).ISD;
                Date = XTabTable.rows(1).cells(j).firstChild.title;
                if ((XTableData.rows(i).cells(j).firstChild.value == "" || (XTableData.rows(i).cells(j).firstChild.style.color == "red")) && Date >= SD && Date <= ED && ISD == 1) {
                    XTableData.rows(i).cells(j).firstChild.style.background = "Orange";
                    Flag = false;
                }
            }
        }
        if (!Flag) {
            alert("موارد نارنجي رنگ حتما بايد پر شوند!");
        }
    }
    var Str = "<Root>";
    for (var i = 1; i < XTableData.rows.length; i++) {
        if (XTableData.rows(i).getAttribute("P") != null && XTableData.rows(i).getAttribute("I") != document.getElementById(MasterObj + "txtInstanceID").value)
            Str = Str + "<D><P>" + XTableData.rows(i).P + "</P></D>"
    }
    Str = Str + "</Root>";
    $get(MasterObj + "txtPersonels").value = Str;
    onclickImgSetIntval();
    $get(MasterObj + "txtDelXml").value = StrDelete;
    return Flag;
}
//====================================================================
function CheckData() {
    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDocSave.async = "false";
    oXmlDocSave.loadXML($get(MasterObj + 'txtXmlSave').value)
    $get(MasterObj + "txtForSave").value = "<Root></Root>";
    var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc1.async = "false";
    oXmlDoc1.loadXML($get(MasterObj + "txtForSave").value)
    var XmlNode;
    var XmlNodeSave = oXmlDocSave.documentElement.selectNodes("/Root/TB[S='' and A='']");
    if (XmlNodeSave.length != 0) {
        var str = "";
        for (var i = 0; i < XmlNodeSave.length; i++) {
            XmlNode = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + XmlNodeSave.item(i).selectSingleNode("P").text + "]");
            str = str + XmlNodeSave.item(i).selectSingleNode("D").text + "     " + XmlNode.item(0).selectSingleNode("C").text + "     " + XmlNode.item(0).selectSingleNode("N").text + "\n";
        }
        if (confirm("ساختار هاي زير بايد وارد شوند:\n" + str + " \n آيا ناديده گرفته شود؟")) {
            for (var i = 0; i < XmlNodeSave.length; i++) {
                var f = oXmlDocSave.documentElement.removeChild(XmlNodeSave.item(i));
                oXmlDoc1.childNodes[0].appendChild(f);
            }
            $get(MasterObj + 'txtXmlSave').value = oXmlDocSave.xml;
            $get(MasterObj + "txtForSave").value = oXmlDoc1.xml;

            var oXmlDocSave1 = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocSave1.async = "false";
            oXmlDocSave1.loadXML("<Root/>")

            if (oXmlDocSave1.xml == oXmlDocSave.xml) {
                alert("موردي براي ذخيره وجود ندارد")
                return false;
            }
            return true;
        }
        else
            return false;
    }
    else return true;
}
//=============================================================
function OnClickBtnFilter() {

    var xml;
    var counter = 0;
    document.getElementById(MasterObj + "TemptxtWP").value = $get(MasterObj + "CmbWorkPeriod").value;
    //---------------------------------------------------------------------------------------------

    if ($get(MasterObj + "DivDept").style.display == "inline") {

        if ($("#" + MasterObj + "UCDepartment_txtHidden").val() == "" || $("#" + MasterObj + "UCDepartment_txtHidden").val() == 0) {
            SetMsg("لطفا واحد مورد نظر را انتخاب کنيد");
            return;
        }
    }
    else {
        if ($("#" + MasterObj + "MultiPerson_txtHidden").val() == "") {
            $("#" + MasterObj + "txtMultiPerson").val($("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val());
        }
        else {
            $("#" + MasterObj + "txtMultiPerson").val(document.getElementById(MasterObj + "MultiPerson_txtHidden").value);
        }
        $("#" + MasterObj + "MultiPerson_cmbPerson").val($("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val())
        //---------------------------------------------------------------------------------------------
        if ($("#" + MasterObj + "txtMultiPerson").val() == "") {
            if ($("#" + MasterObj + "txtTypeCombo").val() == "D") {
                SetMsg("لطفا واحد مورد نظر را انتخاب کنيد")
                return;
            }
            if ($("#" + MasterObj + "txtTypeCombo").val() == "P") {
                SetMsg("لطفا پرسنلی مورد نظر را انتخاب کنيد")
                return;
            }
            if ($("#" + MasterObj + "txtTypeCombo").val() == "G") {
                SetMsg("لطفا گروه مورد نظر را انتخاب کنيد")
                return;
            }
        }
    }

    if (document.getElementById(MasterObj + "txtTypeCombo").value == "D")
        document.getElementById(MasterObj + "txtType").value = "D";
    else
        if (document.getElementById(MasterObj + "txtTypeCombo").value == "P")
            document.getElementById(MasterObj + "txtType").value = "P";
        else
            if (document.getElementById(MasterObj + "txtTypeCombo").value == "G")
                document.getElementById(MasterObj + "txtType").value = "G";


    $get(MasterObj + "txtIDTemp").value = $get(MasterObj + "DivDept").style.display == "inline" ? $("#" + MasterObj + "UCDepartment_txtHidden").val() : $("#" + MasterObj + "MultiPerson_cmbPerson_txtID").val();
    if (document.getElementById(MasterObj + "txtTypeCombo").value == "D") {

        document.getElementById(MasterObj + "txtDepartment").value = $get(MasterObj + "DivDept").style.display == "inline" ? "<Root>" + $("#" + MasterObj + "UCDepartment_txtHidden").val() + "</Root>" : "<Root><Tb><DepartmentID>" + $get(MasterObj + "txtIDTemp").value + "</DepartmentID><Selected>1</Selected></Tb></Root>";
    }
    else
        document.getElementById(MasterObj + "txtDepartment").value = $("#" + MasterObj + "txtMultiPerson").val();
    //------------------------------for chek one select of combo--------------------------       
    if (document.getElementById(MasterObj + "txtDepartment").value.indexOf('Root') != -1) {
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(document.getElementById(MasterObj + "txtDepartment").value)
        }
        else {
            var parser = new DOMParser();
            xml = parser.parseFromString(document.getElementById(MasterObj + "txtDepartment").value, 'text/xml');
        }
        $(xml)
        .find("Root").find("Tb").each(function () {
            counter++;
        });
        if (counter > 1) {
            alert('لطفا یک مورد از کمبو انتخاب کنید');
            $("#" + MasterObj + "MultiPerson_txtHidden").val('');
            document.getElementById(MasterObj + "txtDepartment").value = "";

            return;
        }
        else {
            //////---------------------------------------------------------------------------
            $get(MasterObj + "txtChk").value = $get(MasterObj + "ChkCheck").checked == true ? "1" : "0";
            $get(MasterObj + "txtVersions").value = $get(MasterObj + "CmbVersion").value;
            if (document.getElementById(MasterObj + "txtTypeCombo").value == "D")
                $get(MasterObj + "txtIDTemp").value = $(xml).find("Root").find("Tb").find("DepartmentID").text();
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        //////---------------------------------------------------------------------------
        $get(MasterObj + "txtChk").value = $get(MasterObj + "ChkCheck").checked == true ? "1" : "0";
        $get(MasterObj + "txtVersions").value = $get(MasterObj + "CmbVersion").value;
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }

}
//==============================================
function onclickImgDefult(Sign) {
    $get(MasterObj + "CmbDefault").value = $get(MasterObj + "TemptxtWP").value;
    if (Sign == 0) {
        DivDefault.setAttribute("Entity", DivPopup.getAttribute("Entity"));
    }
    else {
        DivDefault.setAttribute("Entity", OpopupRow);
    }
    if (DivDefault.getAttribute("Entity").P != "") {
        DivStruct.style.display = "none";
        DivDefault.style.display = "inline";
        if (Sign == 1)
            oPopup.hide()
        else
            DivPopup.style.display = "none";
    }
    else {
        if (Sign == 1)
            oPopup.hide()
        else
            DivPopup.style.display = "none";
        alert("شماره پرسنلي را وارد کنيد");
    }
}
//==============================================
function onclickBtnCancel() {
    DivDefault.style.display = "none";
}
//=============================================
function onclickBtnOK() {
    if (document.getElementById(MasterObj + "CmbDefault").value != "0") {
        document.getElementById(MasterObj + "txtDefPID").value = DivDefault.getAttribute("Entity").P;
        document.getElementById(MasterObj + "txtDefWp").value = document.getElementById(MasterObj + "CmbDefault").value;
        document.getElementById(MasterObj + "txtSubmit").value = "Default";
        document.getElementById(MasterObj + "BtnGetDefXml").click();
    }
    else {
        DivDefault.style.display = "none";
    }
}
//====================================================
function ContinueForDefault(Obj1, WPNew, IsOnblur) {
    //دوره      
    var OXmlNode;
    var PID = Obj1.P;
    var Obj1 = XTableData.rows(Obj1.rowIndex);
    oXmlWP.loadXML($get(MasterObj + 'txtXmlInfo').value)
    var XmlNodeWP1 = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + document.getElementById(MasterObj + "TemptxtWP").value + "]");
    var XmlNodeWP2 = oXmlWP.documentElement.selectNodes("/DataEntryEntity/WP[W=" + parseInt(WPNew) + "]");
    var Count1, Count2, EDate1, EDate2, SDate1, SDate2;

    Count1 = XmlNodeWP1.item(0).selectSingleNode('C').text;
    EDate1 = XmlNodeWP1.item(0).selectSingleNode("E").text;
    SDate1 = XmlNodeWP1.item(0).selectSingleNode('S').text;

    Count2 = XmlNodeWP2.item(0).selectSingleNode('C').text;
    EDate2 = XmlNodeWP2.item(0).selectSingleNode("E").text;
    SDate2 = XmlNodeWP2.item(0).selectSingleNode('S').text;

    var Counter = Math.min(parseInt(Count1), parseInt(Count2));
    var WhitchRow = Obj1.rowIndex;
    var str = Obj1.className == "CssItemStyle" ? "background-color:#EAE7F1;" : "background-color:#FFFFE1;";
    //--------------------------
    var WStr = "";
    var WPDayName1 = parseInt(WPDayName);
    var newRow = XTableData.rows(WhitchRow);
    var j, Flag;
    var StrTemp = "";
    OXmlNode = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + PID + "]");
    for (var i = 1; i <= Count1; i++) {
        if (i <= Count2) {
            if (xmlNodeDefault[0].childNodes[i + 1].text != "") {
                var splitStruct = xmlNodeDefault[0].childNodes[i + 1].text;
                splitStruct = splitStruct.split(';')[0];
                var OXMLTMPNode = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + splitStruct + "']");
                onfocusWPDate(Obj1.cells(i - 1).firstChild, 1);
                Obj1.cells(i - 1).firstChild.value = splitStruct;
                onblurWPDate(Obj1.cells(i - 1).firstChild);
                Obj1.cells(i - 1).firstChild.title = OXMLTMPNode.item(0).selectSingleNode("N").text;
            }
            else {
                onfocusWPDate(Obj1.cells(i - 1).firstChild, 1);
                Obj1.cells(i - 1).firstChild.value = "";
                onblurWPDate(Obj1.cells(i - 1).firstChild);
                Obj1.cells(i - 1).firstChild.title = "";
            }
        }
        else {
            if (OXmlNode.length > 0) {
                var OXMLTMPNode = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + OXmlNode[0].childNodes[i + 1].text.trim() + "']");
                onfocusWPDate(Obj1.cells(i - 1).firstChild, 1);
                Obj1.cells(i - 1).firstChild.value = OXmlNode[0].childNodes[i + 1].text;
                onblurWPDate(Obj1.cells(i - 1).firstChild);
                Obj1.cells(i - 1).firstChild.title = OXMLTMPNode.item(0).selectSingleNode("N").text;
            }
            else {
                onfocusWPDate(Obj1.cells(i - 1).firstChild, 1);
                Obj1.cells(i - 1).firstChild.value = "";
                onblurWPDate(Obj1.cells(i - 1).firstChild);
                Obj1.cells(i - 1).firstChild.title = "";
            }
        }
    }
    //---------------------------         
    DivDefault.style.display = "none";
}
//================================================  
function onclickImgCopy(Sign) {
    var Obj;
    if (Sign == 1)
        Obj = OpopupRow;
    else
        Obj = DivPopup.getAttribute("Entity");
    var RowIndex = Obj.rowIndex;
    var Counter = XTableData.rows(RowIndex).cells.length;
    for (var i = 0; i < Counter; i++) {
        S[i] = XTableData.rows(RowIndex).cells(i).firstChild.value;
    }
    if (Sign == 1)
        oPopup.hide()
    else
        DivPopup.style.display = "none";
}
//================================================
function onclickImgPaste(Sign) {
    var Obj
    if (Sign == 1)
        Obj = OpopupRow;
    else
        Obj = DivPopup.getAttribute("Entity");
    var RowIndex = Obj.rowIndex;
    var Counter = Math.min(S.length, XTableData.rows(RowIndex).cells.length);
    for (var i = 0; i < Counter; i++) {
        onfocusWPDate(XTableData.rows(RowIndex).cells(i).firstChild, 1);
        if (XTableData.rows(RowIndex).cells(i).firstChild != null && S[i] != null)
            XTableData.rows(RowIndex).cells(i).firstChild.value = S[i];
        onblurWPDate(XTableData.rows(RowIndex).cells(i).firstChild)
    }
    if (Sign == 1)
        oPopup.hide()
    else
        DivPopup.style.display = "none";
}
//======================================================================================================
function onblurWPDate(Obj, StructureID) {
    if (SelectPopupMode == 0) {
        Obj.value = Obj.value.toUpperCase().trim();
        var Row = Obj.parentElement.parentElement.rowIndex;
        var INDEX = Obj.parentElement.cellIndex;
        var Pid, MyDate, SID = "", XmlNodeStruct, TrueValue;
        var Fflag = false;
        var FlagSave = false;

        Pid = Obj.parentElement.parentElement.P;

        oXmlData.loadXML($get(MasterObj + 'txtXml').value)
        MyDate = XTabTable.rows(1).cells(INDEX).childNodes(0).title;


        if (Pid != "" && Obj.value != SelectWPDate) {

            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocSave.async = "false";
            oXmlDocSave.loadXML($get(MasterObj + 'txtXmlSave').value)

            TrueValue = Obj.TrueVal;
            var XmlNodeSave = oXmlDocSave.documentElement.selectNodes("/Root/TB[P=" + Pid + " and D='" + MyDate + "']");
            ///////////////////////////////////////////////////////////////////////////////ساختار ذخیره شده
            if (XmlNodeSave.length > 0)
                if (XmlNodeSave.item(0).selectSingleNode("A").text == Obj.value)
                    FlagSave = true;
            /////////////////////////////////////////////////////////////////////چک کردن ساختارهای مجازو همه ساختارها       
            if ($get(MasterObj + "txtChk").value == "1") {
                var str = Obj.parentElement.parentElement.getAttribute("Struct"), Str1 = "";
                var i = 0;
                while (i < str.split("#").length - 1 && !Fflag) {
                    Str1 = str.split("#")[i];
                    if (StructureID && StructureID != null) {
                        if (StructureID == Str1.split("$")[0].trim()) {
                            SID = StructureID;
                            Fflag = true;
                        }
                    }
                    else if (Obj.value == Str1.split("$")[2]) {
                        SID = Str1.split("$")[0];
                        Fflag = true;
                    }
                    i++;
                }
            }
             
            if (StructureID && StructureID != null && StructureID != undefined)
                XmlNodeStruct = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S='" + StructureID + "']");
            else if (SID != "")
                XmlNodeStruct = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S='" + SID + "']");
            else
                XmlNodeStruct = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + Obj.value + "']");
            if (XmlNodeStruct.length != 0 && ($get(MasterObj + "txtChk").value == "0" || $get(MasterObj + "txtChk").value == "")) {
                SID = XmlNodeStruct.item(0).selectSingleNode("S").text;
                Fflag = true;
            }
            /////////////////////////////////////////////////////////////////رشته ذخیره شونده

            var oXmlTempSave = new ActiveXObject("Microsoft.XMLDOM")
            oXmlTempSave.async = "false";
            oXmlTempSave.loadXML("<Root><TB><P>" + Pid + "</P><D>" + MyDate + "</D><A>" + Obj.value + "</A><S>" + SID + "</S></TB></Root>")

            var XmlNodeTemp = oXmlTempSave.documentElement.selectNodes("/Root/TB[P=" + Pid + " and D='" + MyDate + "']");
            /////////////////////////////////////////////////////////////////////
            var SubXml = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + SelectWPDate + "']");
            if (FlagSave) {
                Obj.style.color = "blue";
            }
            else if (Fflag && Obj.value != TrueValue) {
                if (XmlNodeSave.length > 0) {
                    var f = oXmlDocSave.documentElement.removeChild(XmlNodeSave.item(0));
                }
                oXmlDocSave.childNodes[0].appendChild(XmlNodeTemp.item(0));
                Obj.style.color = "blue";
            }
            else if (Fflag && Obj.value == TrueValue) {
                if (XmlNodeSave.length > 0) {
                    var f = oXmlDocSave.documentElement.removeChild(XmlNodeSave.item(0));
                }
                Obj.style.color = "black";
            }

            else if (!Fflag) {
                if (XmlNodeSave.length != 0) {
                    var f = oXmlDocSave.documentElement.removeChild(XmlNodeSave.item(0));
                }
                Obj.style.color = "red";
                Obj.title = "";
            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////                
            $get(MasterObj + 'txtXmlSave').value = oXmlDocSave.xml;
            if ((Obj.style.color == "blue" || Obj.style.color == "black") && Fflag) {
                Obj.title = XmlNodeStruct.item(0).selectSingleNode("N").text;
            }
            if (!FlagSave) {
                TimeWPDate(Obj);
            }
            if (Obj.style.color == "blue" || Obj.style.color == "black")
                AddCountGrid(XmlNodeStruct, INDEX, 1, Row)
            if (FocusStyle == "black" || (SelectWPDate != "" && FocusStyle == "") || FocusStyle == "blue") {
                var XmlNodeSub = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[A='" + SelectWPDate + "']");
                if (XmlNodeSub.length > 0)
                    AddCountGrid(XmlNodeSub, INDEX, -1, Row)
            }
            if (TrueValue != "") {
                var oXmlDel = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDel.async = "false";
                oXmlDel.loadXML(StrDelete)
                var Xmlnew;
                if (Obj.value == "") {//=======================برای حالت حذف ساختار

                    oXmlDel.childNodes[0].appendChild(XmlNodeTemp.item(0));
                }
                if (Obj.value != "" && SelectWPDate == "") {
                    Xmlnew = oXmlDel.documentElement.selectNodes("/Root/TB[P=" + Pid + " and D='" + MyDate + "']");
                    if (Xmlnew.length > 0)
                        var f = oXmlDel.documentElement.removeChild(Xmlnew.item(0));
                }
                StrDelete = oXmlDel.xml;
            }
        }
        SetSumE_K_M();
        if (Obj.value != "" && Obj.style.color != "red") {
            Obj.style.background = Obj.realColor;
        }
    }
}
//==================================================
function onclickBtnClose() {
    DivStruct.style.display = "none";
}
//===================================================     
function MakeTBStruct(XTable) {
    var OGrid = XTable;
    while (OGrid.rows.length > 0)
        OGrid.deleteRow(OGrid.rows.length - 1);
    var XmlNodeStruct = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S!=0]");
    if (XTable == TBS)
        DivForStruct.style.height = "35";
    for (var i = 0; i < XmlNodeStruct.length; i++) {
        if (XTable == TBS) {
            if (parseInt(DivForStruct.style.height) + 25 < 500)
                DivForStruct.style.height = parseInt(DivForStruct.style.height) + 25;
            else DivForStruct.style.height = 500;
        }
        var ORow1 = OGrid.insertRow();
        ORow1.setAttribute("S", XmlNodeStruct.item(i).selectSingleNode("S").text);

        var oCell2 = ORow1.insertCell();
        oCell2.innerText = XmlNodeStruct.item(i).selectSingleNode("A").text;
        oCell2.style.width = "50px";
        oCell2.align = "center";

        var oCell3 = ORow1.insertCell();
        if (XmlNodeStruct.item(i).selectSingleNode("N").text.length > 11) {
            oCell3.title = XmlNodeStruct.item(i).selectSingleNode("N").text;
            oCell3.innerText = XmlNodeStruct.item(i).selectSingleNode("N").text;
        }
        else
            oCell3.innerText = XmlNodeStruct.item(i).selectSingleNode("N").text;
        oCell3.align = "right";
        oCell3.style.width = "150px";
    }
}
//======================================================
function ondblclickWPDate(OBJ) {
    DivDefault.style.display = "none"
    DivStruct.style.display = "inline";
    DivStruct.setAttribute("Entity", OBJ);
}
//======================================================
function OnclickGrdStruct() {
    if (window.event.srcElement.tagName == "TD") {
        if (StructRow != null)
            StructRow.className = "StructunClick";
        StructRow = window.event.srcElement.parentElement;
        StructRow.className = "StructClick";

        var str = window.event.srcElement.parentElement.cells(0).innerText;

        onfocusWPDate(DivStruct.getAttribute("Entity"), 1);
        DivStruct.getAttribute("Entity").value = str;
        onblurWPDate(DivStruct.getAttribute("Entity"), window.event.srcElement.parentElement.getAttribute("S"));

        if (DivStruct.getAttribute("Entity").parentElement.nextSibling != null)
            if (DivStruct.getAttribute("Entity").parentElement.nextSibling != null) {
                DivStruct.setAttribute("Entity", DivStruct.getAttribute("Entity").parentElement.nextSibling.firstChild);
                var NextWPDate = DivStruct.getAttribute("Entity");
                NextWPDate.select();
                NextWPDate.focus();
                $get("DivBaseCount").scrollLeft = $get("DivGridData").scrollLeft;
            }
    }
}
//======================================================
var oPopup = window.createPopup()
var OpopupRow = "";
function contextMenu(obj) {
    var lefter = event.screenX
    var topper = event.screenY
    OpopupRow = window.event.srcElement.parentElement.parentElement;
    var str = DivPopup.innerHTML;
    str = str.replace("onclickImgDefult(0)", "parent.onclickImgDefult('1')");
    str = str.replace("onclickImgCopy(0)", "parent.onclickImgCopy('1')");
    str = str.replace("onclickImgPaste(0)", "parent.onclickImgPaste('1')");
    str = str.replace("onclickImgDelText(0)", "parent.onclickImgDelText('1')");
    str = str.replace("onclickImgNew(0)", "parent.onclickImgNew('1')");
    str = str.replace("onclickDeleteRow(0)", "parent.onclickDeleteRow('1')");
    oPopup.document.body.innerHTML = str;
    if (OpopupRow.ISD == 1)
        oPopup.show(lefter, topper, 81, 145)
    else oPopup.show(lefter, topper, 81, 175)
}
//============================================================================================
function onclickDeleteRow() {
    if (confirm("آيا براي حذف پرسنل و تمام شيفت هاي مربوطه مطمئن هستيد؟")) {
        if ($get(MasterObj + "txtInstanceID").value != "" && OpopupRow.P != "") {
            $get(MasterObj + "txtPersonDelete").value = OpopupRow.P;
            DeletedIndex = OpopupRow.rowIndex;
            $get(MasterObj + "txtSubmit").value = "Delete";
            $get(MasterObj + "BtnGetDefXml").click();
        }
        else {
            DeletedIndex = OpopupRow.rowIndex;
            DeleteRowPopup();
        }
    }
}
//==============================================
function onclickIMGTools(Obj) {
    var lefter = event.screenX - 150;
    var topper = event.screenY - 195;
    if (topper + 400 >= window.screen.height)
        topper = window.screen.height - 400;

    DivPopup.style.left = lefter;
    DivPopup.style.top = topper;
    DivPopup.setAttribute("Entity", Obj.parentElement.parentElement);
    DivPopup.style.display = "inline";
}
//=================================================================
function onKeyDownEnter(Obj) {
    if (event.keyCode == 13) {
        var RowIndex = Obj.parentElement.parentElement.rowIndex;
        XTableData.rows(RowIndex).cells(0).firstChild.select();
        XTableData.rows(RowIndex).cells(0).firstChild.focus();
    }
}
//===============================================================
function onkeydownEnter(Obj) {
    if (event.keyCode == 13 || event.keyCode == 37) {
        if (Obj.parentElement.nextSibling != null) {
            Obj.parentElement.nextSibling.firstChild.select();
            Obj.parentElement.nextSibling.firstChild.focus();
        }
        else
            if (Obj.parentElement.parentElement.nextSibling != null) {
                Obj.parentElement.parentElement.nextSibling.cells(0).firstChild.select();
                Obj.parentElement.parentElement.nextSibling.cells(0).firstChild.focus();
            }
            else {
                XTableData.rows(0).cells(0).firstChild.select();
                XTableData.rows(0).cells(0).firstChild.focus();
            }
    }
    else
        if (event.keyCode == 40) {
            if (Obj.parentElement.parentElement.nextSibling != null) {
                Obj.parentElement.parentElement.nextSibling.childNodes(Obj.parentElement.cellIndex).firstChild.select();
                Obj.parentElement.parentElement.nextSibling.childNodes(Obj.parentElement.cellIndex).firstChild.focus();
            }
            else {
                XTableData.rows(0).cells(Obj.parentElement.cellIndex).firstChild.select();
                XTableData.rows(0).cells(Obj.parentElement.cellIndex).firstChild.focus();
            }
        }
        else
            if (event.keyCode == 38) {
                if (Obj.parentElement.parentElement.previousSibling != null) {
                    Obj.parentElement.parentElement.previousSibling.childNodes(Obj.parentElement.cellIndex).firstChild.select();
                    Obj.parentElement.parentElement.previousSibling.childNodes(Obj.parentElement.cellIndex).firstChild.focus();
                }
                else {
                    XTableData.rows(XTableData.rows.length - 1).cells(Obj.parentElement.cellIndex).firstChild.select();
                    XTableData.rows(XTableData.rows.length - 1).cells(Obj.parentElement.cellIndex).firstChild.focus();
                }
            }
            else
                if (event.keyCode == 39) {
                    if (Obj.parentElement.previousSibling != null) {
                        Obj.parentElement.previousSibling.firstChild.select();
                        Obj.parentElement.previousSibling.firstChild.focus();
                    }
                    else
                        if (Obj.parentElement.parentElement.previousSibling != null) {
                            Obj.parentElement.parentElement.previousSibling.cells(XTableData.rows(0).cells.length - 1).firstChild.select();
                            Obj.parentElement.parentElement.previousSibling.cells(XTableData.rows(0).cells.length - 1).firstChild.focus();
                        }
                        else {
                            XTableData.rows(XTableData.rows.length - 1).cells(XTableData.rows(0).cells.length - 1).firstChild.select();
                            XTableData.rows(XTableData.rows.length - 1).cells(XTableData.rows(0).cells.length - 1).firstChild.focus();
                        }
                }
                else {
                    if (event.keyCode == 113)
                        MakePopupStruct(Obj);

                    else {
                        if (event.keyCode == 118) {
                            var i = Obj.parentElement.cellIndex;
                            var XmlNodeTemp = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[P=" + Obj.parentElement.parentElement.P + "]");

                            if (XmlNodeTemp.length > 0) {
                                Obj.value = XmlNodeTemp.item(0).childNodes[i + 2].text;
                                Obj.select();
                                Obj.focus();
                            }
                            else {
                                Obj.value = "";
                                Obj.select();
                                Obj.focus();
                            }
                        }
                    }
                }
    $get("DivBaseCount").scrollLeft = $get("DivGridData").scrollLeft;
}
//================================================================   
function ClearTBS() {
    TBS.deleteRow();
}
//========================================
function OnKeyEnter(Obj) {
    if (event.keyCode == 13) {
        switch (Obj.id) {
            case MasterObj + "CmbWorkPeriod":
                $get(MasterObj + "CmbPerson_txtCode").focus();
                $get(MasterObj + "CmbPerson_txtCode").setActive();
                break;
            case MasterObj + "CmbGroup":
                if (!$get(MasterObj + "ChkCheck").disabled)
                    $get(MasterObj + "ChkCheck").focus();
                else {
                    if (typeof document.getElementById('OToolBar_BtnFilter') == "object") {
                        if (document.getElementById('OToolBar_BtnFilter') != null)
                            document.getElementById('OToolBar_BtnFilter').focus()
                    }
                }
                break;
            case MasterObj + "ChkCheck":
                if (typeof document.getElementById('OToolBar_BtnFilter') == "object") {
                    if (document.getElementById('OToolBar_BtnFilter') != null)
                        document.getElementById('OToolBar_BtnFilter').focus();
                }
                break;
        }
    }
    else if (event.keyCode == 34)
        if (Obj.id == MasterObj + "ChkCheck")
            $get(MasterObj + "ChkCheck").checked = !$get(MasterObj + "ChkCheck").checked
    }
    //==============================================================
    function onclickTB() {
        if (window.event.srcElement.tagName != "IMG") {
            DivPopup.style.display = "none";
            PopupStruct.style.display = "none";
            DivPopup.style.display = "none";
        }
    }
    //============================================================
    function onclickImgDelText(Sign) {
        var Obj
        if (Sign == 1)
            Obj = OpopupRow;
        else
            Obj = DivPopup.getAttribute("Entity");
        var RowIndex = Obj.rowIndex;
        var Counter = XTableData.rows(RowIndex).cells.length;
        for (var i = 0; i < Counter; i++) {
            onfocusWPDate(XTableData.rows(RowIndex).cells(i).firstChild, 1);
            XTableData.rows(RowIndex).cells(i).firstChild.value = "";
            onblurWPDate(XTableData.rows(RowIndex).cells(i).firstChild)
        }
        if (Sign == 1)
            oPopup.hide()
        else
            DivPopup.style.display = "none";
    }
    //=======================================================
    function onclickImgNew(Sign) {
        var Obj;
        if (Sign == 0)
            Obj = DivPopup.getAttribute("Entity");
        else Obj = OpopupRow;

        var Str = "";
        var RowIndex = Obj.rowIndex;

        var xmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[I=" + RowIndex + 1 + "]")
        for (var i = 0; i < CountDay; i++) {
            Str = Str + "<D" + i.toString() + "/>";
        }
        var oXmlTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlTemp.async = "false";
        oXmlTemp.loadXML("<DataEntryEntity><ReplaceShift><C/><N/>" + Str + "<K/><M/><E/><P/><U/><I></I><ISD>0</ISD><V></V><F></F><A></A><G>0</G><CT>0</CT><CN>0</CN><BG>0</BG><SD>01/01/01</SD><ED>01/01/01</ED></ReplaceShift></DataEntryEntity>")

        var XmlNodeTemp = oXmlTemp.documentElement.selectNodes("/DataEntryEntity/ReplaceShift");

        oXmlData.childNodes[0].appendChild(XmlNodeTemp.item(0));

        document.getElementById(MasterObj + "txtXml").value = oXmlData.xml;
        AddToGrid(XmlNodeTemp.item(0), "", parseInt(parseInt(RowIndex) + 1));

        if (Sign == 1)
            oPopup.hide()
        else
            DivPopup.style.display = "none";
        for (var i = Obj.rowIndex; i < XTableData.rows.length; i++) {
            $get("IntvalUL").childNodes[i].firstChild.innerText = XTableData.rows(i).rowIndex + 1;
        }
        XtableName.rows(parseInt(parseInt(RowIndex) + 1)).cells(0).firstChild.focus();
        XtableName.rows(parseInt(parseInt(RowIndex) + 1)).cells(0).firstChild.select();
    }
    //=========================================================
    function onblurtxtPersonCode(Obj) {
        if (Obj.value != PersonCode && Obj.value != "") {
            NewObj = Obj;

            var xmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/ReplaceShift[C=" + Obj.value + "]")
            if (xmlNodes.length == 0) {
                document.getElementById(MasterObj + "txtDefPID").value = Obj.value;
                document.getElementById(MasterObj + "txtDefWp").value = document.getElementById(MasterObj + "TemptxtWP").value;
                document.getElementById(MasterObj + "txtSubmit").value = "RowPersonel";
                document.getElementById(MasterObj + "BtnGetDefXml").click();
            }
            else {
                alert("ساختار پرسنلي مورد نظر وجود دارد")
                Obj.value = PersonCode;
                Obj.select();
                Obj.focus();
            }
        }
        else if (Obj.value == "" && PersonCode != "")
            Obj.value = PersonCode;
    }
    //==========================================================
    var LastSelectIntval = null;
    function onfocusPersonCode(Obj) {
        PersonCode = Obj.value;
        Obj.select();
        Obj.focus();
        if (LastSelectIntval != null)
            XtableName.rows(parseInt(LastSelectIntval) - 1).cells(0).firstChild.style.color = "black";
        Obj.style.color = "red";
        LastSelectIntval = Obj.parentElement.parentElement.rowIndex + 1;
    }
    //=========================================================
    function onfocusWPDate(Obj, Sign) {
        try {
            LastSelectIntval = null;
            Obj.select();
            if ($get(MasterObj + "txtChk").value == "1") {
                if (Obj.parentElement.parentElement.getAttribute("Struct") != "") {
                    var str = Obj.parentElement.parentElement.getAttribute("Struct");

                    var i = 0; j = 0;
                    while (i < TBStruct.rows.length) {
                        var flagForDisplay = false;
                        j = 0;
                        while (j < str.split("#").length - 1 && !flagForDisplay) {
                            var Str1 = str.split("#")[j];
                            if (Str1.split("$")[0].trim() == TBStruct.rows(i).getAttribute("S").trim()) {
                                flagForDisplay = true;
                            }
                            j++;
                        }
                        if (!flagForDisplay)
                            TBStruct.rows(i).style.display = "none";
                        else TBStruct.rows(i).style.display = "inline";
                        i++;
                    }
                }
                else {
                    for (var i = 0; i < TBStruct.rows.length; i++)
                        TBStruct.rows(i).style.display = "none";
                }
            }
            else {
                for (var K = 0; K < TBStruct.rows.length; K++)
                    TBStruct.rows(K).style.display = "inline";
            }
            if (DivStruct.style.display == "inline")
                DivStruct.setAttribute("Entity", Obj);
            if (SelectPopupMode == 0) {
                SelectWPDate = Obj.value;
                FocusStyle = Obj.style.color;
            }
            else SelectPopupMode = 0;
        }
        catch (e) { }
    }
    //=======================================================
    function onclickGrd(Obj) {
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
        try {
            if (modalObject != null)
                modalObject.SetColorFulRowsColumn(Row, Column, SelectedColumn, SelectedRow);
        }
        catch (e) { }


        if (Column != -1) {
            eval("$('td.TD" + Column + "').addClass('SelectedCol');");
            eval("$('td.TDCount" + Column + "').addClass('SelectedCol');");
            XTabTable.rows(1).cells(Column - 1).style.background = "#8FC9A0";
        }
        XTableData.rows(Row).style.background = "#8FC9A0";
        XtableName.rows(Row).style.background = "#8FC9A0";
        XtableKarkard.rows(Row).style.background = "#8FC9A0";

        SelectedColumn = Column;
        SelectedRow = Row;
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
    function AddCountGrid(OXMLTMPNode, Index, Count, Row) {
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

                AddRemoveReportData(OXMLTMPNode[0].selectSingleNode("A").text.trim(), Row, Index, Count);
            }
            else {
                var IntvalNew = 0;
                var XmlForHome = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[ H!='']");
                if (XmlForHome.length > 0) {
                    //IntvalNew = XmlForHome[0].selectSingleNode("H").text;
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
                    Cell.innerHTML = "<div  style='width:" + (parseInt($get(MasterObj + "txtCellsWidth").value) - 1).toString() + "px;height:21px' align='center'>0</div>";
                    //Cell.className = "CssHeaderStyle";
                }
                var OROW = Table3.insertRow(IntvalNew);
                var Cell1 = OROW.insertCell();
                var Cell2 = OROW.insertCell();
                var Cell3 = OROW.insertCell();
                Cell1.innerHTML = "<div class='NameOFStruct' style='width:45px;background-color:#DBEEDB;height:21px' align='center' >  </div>";
                Cell2.innerHTML = "<div class='NameOFStruct'  style='width:45px;background-color:#DBEEDB;height:21px' align='center' >&nbsp;</div>";
                Cell3.innerHTML = "<div class='NameOFStruct'  style='width:45px;background-color:#DBEEDB;height:21px' align='center' >&nbsp;</div>";
                if (modalObject != null)
                    addStruct(ORow, IntvalNew, OXMLTMPNode[0].selectSingleNode("S").text.trim(), OXMLTMPNode[0].selectSingleNode("A").text);
                addStructRowToDiv(ORow, IntvalNew, OXMLTMPNode[0].selectSingleNode("S").text.trim(), OXMLTMPNode[0].selectSingleNode("A").text)
                ORow.setAttribute("SID", OXMLTMPNode[0].selectSingleNode("S").text.trim())
                AddCountGrid(OXMLTMPNode, Index, Count, Row);
                Count = 0;
            }
        }
        if (ISBaseStruct == "0") {
            var S1 = CS.split(",")[0];
            var S2 = CS.split(",")[1];
            var S3 = CS.split(",")[2];
            var S4 = CS.split(",")[3];
            if (S1 != 0 && S1 != undefined) {
                XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S1 + "]");
                AddCountGrid(XmlNodestr, Index, Count, Row);
            }
            if (S2 != 0 && S2 != undefined) {
                XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S2 + "]");
                AddCountGrid(XmlNodestr, Index, Count, Row);
            }
            if (S3 != 0 && S3 != undefined) {
                XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S3 + "]");
                AddCountGrid(XmlNodestr, Index, Count, Row);
            }
            if (S4 != 0 && S4 != undefined) {
                XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S=" + S4 + "]");
                AddCountGrid(XmlNodestr, Index, Count, Row);
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
        DivReportSex.innerHTML = "";
        DivReportJob.innerHTML = "";
        DivReportContract.innerHTML = "";
        // DivHeader.innerText = "";
        try {
            if (modalObject != null) {
                modalObject.DivSex.innerHTML = "";
                modalObject.DivJob.innerHTML = "";
                modalObject.DivContract.innerHTML = "";
            }
        } catch (e) {
        }
    }
    //==============================================================================
    function OnClickBtnConfirm() {
        if (Save()) {
            document.getElementById(MasterObj + "txtSubmit").value = "Confirm";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //============================================
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
        document.getElementById(MasterObj + "TemptxtWP").value = $get(MasterObj + "CmbWorkPeriod").value;

        $get(MasterObj + "txtChk").value = $get(MasterObj + "ChkCheck").checked == true ? "1" : "0";
        $get(MasterObj + "txtVersions").value = $get(MasterObj + "CmbVersion").value;
        document.getElementById(MasterObj + "BtnSendTOPdf").click();
    }

    function OnClickBtnExcel() {
        document.getElementById(MasterObj + "TemptxtWP").value = $get(MasterObj + "CmbWorkPeriod").value;

        $get(MasterObj + "txtChk").value = $get(MasterObj + "ChkCheck").checked == true ? "1" : "0";
        $get(MasterObj + "txtVersions").value = $get(MasterObj + "CmbVersion").value;
        document.getElementById(MasterObj + "BtnSendTOExl").click();
    }
    //================================================
    function onclickImgSetIntval(Sign) {
        if (FlagForIntval) {
            var Count = $('#IntvalUL')[0].childNodes.length;
            var StrXml = "<R>";
            for (var i = 0; i < Count; i++) {
                StrXml = StrXml + "<T><P>" + XtableName.rows(i).P + "</P><I>" + $('#IntvalUL')[0].childNodes[i].firstChild.innerText + "</I></T>";
            }
            StrXml += "</R>";
            $get(MasterObj + 'txtIntvals').value = StrXml;
            if (Sign == 1) {
                $get(MasterObj + "txtSubmit").value = "SetIntval";
                $get(MasterObj + "BtnGetDefXml").click();
            }
        }
        else {
            if (Sign == 1)
                alert("تغييري اعمال نگرديده است");
        }
    }
    //------------------------------------------------------   
    function onclickUpIntval() {
        if (SelectedRow != undefined) {
            if (SelectedRow > 0) {
                var From, To
                From = SelectedRow;
                To = parseInt(SelectedRow) - 1;
                XtableName.moveRow(From, To);
                XTableData.moveRow(From, To);
                XtableKarkard.moveRow(From, To);
                CorrectClass();
                SetColorFulRowsColumn(To, SelectedColumn);
                FlagForIntval = true;
            }
        }
        else {
            alert("پرسنلي انتخاب نشده است");
        }
    }
    //-----------------------------
    function onclickDownIntval() {
        if (SelectedRow != undefined) {
            if (parseInt(SelectedRow) < XtableName.rows.length - 1) {
                var From, To
                From = SelectedRow;
                To = parseInt(SelectedRow) + 1;
                XtableName.moveRow(From, To);
                XTableData.moveRow(From, To);
                XtableKarkard.moveRow(From, To);
                CorrectClass();
                SetColorFulRowsColumn(To, SelectedColumn);
                FlagForIntval = true;
            }
        }
        else {
            alert("پرسنلي انتخاب نشده است");
        }
    }
    //-----------------------------
    function onfocusIntval(Obj) {
        Obj.select();
        Obj.focus();
    }
    //--------------------------
    function onblurIntval(Obj) {
        if (Obj.value <= XtableName.rows.length && Obj.value > 0) {
            var From, To
            From = SelectedRow;
            To = parseInt(Obj.value) - 1;
            XtableName.moveRow(From, To);
            XTableData.moveRow(From, To);
            XtableKarkard.moveRow(From, To);
            CorrectClass();
            SetColorFulRowsColumn(To, SelectedColumn);
            FlagForIntval = true;
        }
        else
            if (Obj.value != "")
                Obj.value = "";
    }
    //---------------------------
    function CorrectClass() {
        for (var i = 0; i < XtableName.rows.length; i++) {
            if (i % 2 == 0) {
                XtableName.rows(i).className = "CssItemStyle";
                XTableData.rows(i).className = "CssItemStyle";
                XtableKarkard.rows(i).className = "CssItemStyle";
                $('#IntvalUL')[0].childNodes[i].firstChild.style.background = "#d5e1fd";
            }
            else {
                XtableName.rows(i).className = "CssAlternatingItemStyle";
                XTableData.rows(i).className = "CssAlternatingItemStyle";
                XtableKarkard.rows(i).className = "CssAlternatingItemStyle";
                $('#IntvalUL')[0].childNodes[i].firstChild.style.background = "OldLace";
            }
        }
    }
    //==================================
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
    function onclickImgWF() {
        if ($get(MasterObj + "txtNewWF").value == 0)
            window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + $get(MasterObj + "txtWFDocID").value + "&DocId=" + $get(MasterObj + "txtInstanceID").value, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
        else
            window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + $get(MasterObj + "txtWFDocID").value + "&DocID=" + $get(MasterObj + "txtInstanceID").value, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
    }
    //---------------------------------------------------
    $get("txtStrTab").value = "";
    $(document).ready(function () {
        var oXmlComb = new ActiveXObject("Microsoft.XMLDOM")
        oXmlComb.async = "false";
        oXmlComb.loadXML($get(MasterObj + "txtTabData").value)
        var XmlNo
        for (var i = 1; i < 4; i++) {
            XmlNo = oXmlComb.documentElement.selectNodes("/A/TabData[Type=" + i + "]");
            if (XmlNo.length > 0)
                for (var j = 0; j < XmlNo.length; j++) {
                    $get("txtStrTab").value = $get("txtStrTab").value + XmlNo[j].selectSingleNode("Title").text + ":" + XmlNo[j].selectSingleNode("ID").text;
                    $get("txtStrTab").value = $get("txtStrTab").value + (j == XmlNo.length - 1 ? "" : ";");
                }
            $get("txtStrTab").value += "#" + i;
        }
        $('#BtnCalcDetail').click(function () {
            try {
                if (modalObject != null)
                    modalObject.window.close();
            }
            catch (e) {
            }
            modalObject = window.showModelessDialog("FrameDetailSchedulingProg.htm", window, "dialogWidth:1250px;dialogHeight:200px;center: Yes;help: no;status:no;minimize: yes;resizable:yes");
            SetHeader();
            SetDataReport();
        });
    });
    //---------------------------------------------------------
    function SetHeader() {
        DivHeader.innerText = DivHeader.innerText;
        try {
            if (modalObject != null && DivHeader.innerText != "")
                modalObject.DivDataHeader.innerHTML = "<table dir='rtl' cellpadding='0' cellspacing='0'>" + DivHeader.innerText + "</table>";

        } catch (e) { }
    }
    function SetDataReport() {
        DivReportContract.innerHTML = DivReportContract.innerHTML;

        try {
            modalObject.TblTab.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;
            modalObject.TblData.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;
            modalObject.TblHeader.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;
            modalObject.DivSex.innerHTML = DivReportSex.innerHTML;
            modalObject.DivJob.innerHTML = DivReportJob.innerHTML;
            modalObject.DivContract.innerHTML = DivReportContract.innerHTML;
        } catch (e) { }

    }
    function addStruct(OROW, intval, ID, Acronym) {
        try {
            modalObject.TblTab.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;
            modalObject.TblData.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;
            modalObject.TblHeader.style.width = CountDay * parseInt($get(MasterObj + "txtCellsWidth").value) + 120;

            var Str1 = $get("txtStrTab").value.split("#1")[0];
            var Str2 = $get("txtStrTab").value.split("#1")[1].split("#2")[0];
            var Str3 = $get("txtStrTab").value.split("#1")[1].split("#2")[1].split("#3")[0];
            var NameTab, IDTab
            for (var i = 0; i < Str1.split(";").length; i++) {
                NameTab = Str1.split(";")[i].split(":")[0];
                IDTab = Str1.split(";")[i].split(":")[1];
                CreateRowCalc(OROW, modalObject.DivSex, NameTab, IDTab, Acronym);
            }
            for (var i = 0; i < Str2.split(";").length; i++) {
                NameTab = Str2.split(";")[i].split(":")[0];
                IDTab = Str2.split(";")[i].split(":")[1];
                CreateRowCalc(OROW, modalObject.DivJob, NameTab, IDTab, Acronym);
            }
            for (var i = 0; i < Str3.split(";").length; i++) {
                NameTab = Str3.split(";")[i].split(":")[0];
                IDTab = Str3.split(";")[i].split(":")[1];
                CreateRowCalc(OROW, modalObject.DivContract, NameTab, IDTab, Acronym);
            }
        } catch (e) { }
    }
    function addStructRowToDiv(OROW, intval, ID, Acronym) {
        try {
            var Str1 = $get("txtStrTab").value.split("#1")[0];
            var Str2 = $get("txtStrTab").value.split("#1")[1].split("#2")[0];
            var Str3 = $get("txtStrTab").value.split("#1")[1].split("#2")[1].split("#3")[0];

            var NameTab, IDTab
            if (Str1.split(";").length > 1)
                for (var i = 0; i < Str1.split(";").length; i++) {
                    NameTab = Str1.split(";")[i].split(":")[0];
                    IDTab = Str1.split(";")[i].split(":")[1];
                    CreateRowCalc(OROW, DivReportSex, NameTab, IDTab, Acronym);
                }
            if (Str2.split(";").length > 1)
                for (var i = 0; i < Str2.split(";").length; i++) {
                    NameTab = Str2.split(";")[i].split(":")[0];
                    IDTab = Str2.split(";")[i].split(":")[1];
                    CreateRowCalc(OROW, DivReportJob, NameTab, IDTab, Acronym);
                }
            if (Str3.split(";").length > 1)
                for (var i = 0; i < Str3.split(";").length; i++) {
                    NameTab = Str3.split(";")[i].split(":")[0];
                    IDTab = Str3.split(";")[i].split(":")[1];
                    CreateRowCalc(OROW, DivReportContract, NameTab, IDTab, Acronym);
                }
            ColorFlag = !ColorFlag;
        }
        catch (e) {
        }
    }
    //================================
    var ColorFlag = true;
    function CreateRowCalc(OROW, obj, Name, ID, Acronym) {
        if (obj.firstChild != null)
            obj.innerHTML = "<table cellpadding='0' cellspacing='1' >" + obj.firstChild.firstChild.innerHTML + "<tr  AccID='" + ID.toString() + "#" + Acronym + "' " + (ColorFlag ? " class='CellBlue3'" : " class='CellPink3'") + "><td align='center' " + (ColorFlag ? " class='CellBlue2'" : " class='CellPink2'") + " style='width:120px'>" + Acronym + " : " + Name + "</td>" + OROW.innerHTML + "</tr></table>"
        else
            obj.innerHTML = "<table cellpadding='0' cellspacing='1'><tr " + (ColorFlag ? " class='CellBlue3'" : " class='CellPink3'") + " AccID='" + ID.toString() + "#" + Acronym + "'><td align='center' " + (ColorFlag ? " class='CellBlue2'" : " class='CellPink2'") + " style='width:120px'>" + Acronym + " : " + Name + "</td>" + OROW.innerHTML + "</tr></table>";
    }
    //========================================================
    function AddRemoveReportData(StructNew, Row, Index, Count) {
        var a = 0, b = 0;
        var i = 0;
        var Sex = XtableName.rows(Row).Sex
        var Job = XtableName.rows(Row).Job
        var Contract = XtableName.rows(Row).Contract

        if (XtableName.rows(Row).Sex != 0) {
            var obj = DivReportSex.firstChild;
            if (obj != null) {
                var Flag = true;
                i = 0;
                while (i < obj.rows.length && Flag) {
                    if (obj.rows(i).AccID == Sex + '#' + StructNew) {
                        obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                        Flag = false;
                    }
                    i++;
                }
            }
        }
        if (XtableName.rows(Row).Contract != 0) {
            obj = DivReportContract.firstChild;
            if (obj != null) {
                Flag = true;
                i = 0;
                while (i < obj.rows.length && Flag) {
                    if (obj.rows(i).AccID == Contract + '#' + StructNew) {
                        obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                        Flag = false;
                    }
                    i++;
                }
            }
        }
        if (XtableName.rows(Row).Job != 0) {
            obj = DivReportJob.firstChild;
            if (obj != null) {
                Flag = true;
                i = 0;
                while (i < obj.rows.length && Flag) {
                    if (obj.rows(i).AccID == Job + '#' + StructNew) {
                        obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                        Flag = false;
                    }
                    i++;
                }
            }
        }
        try {
            if (XtableName.rows(Row).Sex != 0 && modalObject != null) {
                var obj = modalObject.DivSex.firstChild;
                var Flag = true;
                i = 0;
                if (obj != null) {
                    while (i < obj.rows.length && Flag) {
                        if (obj.rows(i).AccID.trim() == Sex + '#' + StructNew) {
                            obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                            Flag = false;
                        }
                        i++;
                    }
                }
            }
            if (XtableName.rows(Row).Job != 0 && modalObject != null) {
                var obj = modalObject.DivJob.firstChild;
                var Flag = true;
                i = 0;
                if (obj != null) {
                    while (i < obj.rows.length && Flag) {
                        if (obj.rows(i).AccID == Job + '#' + StructNew) {
                            obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                            Flag = false;
                        }
                        i++;
                    }
                }
            }
            if (XtableName.rows(Row).Contract != 0 && modalObject != null) {
                var obj = modalObject.DivContract.firstChild;
                var Flag = true;
                i = 0;
                if (obj != null) {
                    while (i < obj.rows.length && Flag) {
                        if (obj.rows(i).AccID == Contract + '#' + StructNew) {
                            obj.rows(i).cells(Index + 1).firstChild.innerText = parseInt(obj.rows(i).cells(Index + 1).firstChild.innerText) + Count;
                            Flag = false;
                        }
                        i++;
                    }
                }
            }
        }
        catch (e) { }
    }
    //--------------------------------------------------------------------------
    var FlagCountClick = false;
    function onclickCount(obj) {
        var XmlNodestr = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Struct[S='" + obj.parentElement.parentElement.SID + "']");
        var cellindex = obj.parentElement.cellIndex;
        var A = new Array;
        var B = new Array;

        if (XmlNodestr.length > 0)
            if (!FlagCountClick) {
                A = XmlNodestr[0].selectSingleNode("CS").text.split(",");
                for (var i = 0; i < XTableData.rows.length; i++) {
                    for (var j = 0; j < A.length; j++)
                        if (A[j] == (XTableData.rows(i).cells(cellindex).firstChild.value))
                            XTableData.rows(i).cells(cellindex).firstChild.className = "SelectedCount";
                }
            }
            else {
                for (var i = 0; i < XTableData.rows.length; i++) {
                    XTableData.rows(i).cells(cellindex).firstChild.className = "TxtControls";
                }
            }

        FlagCountClick = !FlagCountClick;
    }
    //=================================
    function onclickSowLog() {
        var index = ObjPopupDay.parentElement.cellIndex;
        var date = XTabTable.rows(1).cells(index).firstChild.title;
        var PID = XtableName.rows(ObjPopupDay.parentElement.parentElement.rowIndex).P;
        var url = "ShowLogsShiftSchedule.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&Date=" + date + "&PersonID=" + PID + "&InstanceID=" + $get(MasterObj + "txtInstanceID").value;
        window.showModalDialog(encodeURI(url), window, "dialogHeight:500px;dialogWidth:650px;center: Yes;help: no;status: no");
    }
    //===================================
    //    function GetAccessBtn() {
    //        var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    //        xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
    //        xmlDoc.setProperty("SelectionLanguage", "XPath")
    //        var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
    //        if (xmlNodes.length != 0) {
    //            if (xmlNodes.item(0).selectSingleNode('BtnSave') && xmlNodes.item(0).selectSingleNode('BtnSave').text == 2)
    //                document.getElementById('OToolBar_BtnSave').style.display = "none"
    //            if (xmlNodes.item(0).selectSingleNode('BtnConfirm') && xmlNodes.item(0).selectSingleNode('BtnConfirm').text == 2)
    //                document.getElementById('OToolBar_BtnConfirm').style.display = "none"
    //        }
    //    }