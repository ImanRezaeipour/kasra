window.document.title = "انتخاب سمت";
//*************************************Declaration*************************************
//var str = "<Root></Root>";
var str = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var LastSelectedRow = ""
var LastSelectedRowClass = "";
var XMLStrforPage = "";

//*************************************EndDeclaration*************************************

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//==========================================================
function EndRequestHandler(sender, args) {

    var StrVal = $("+" + MasterObj + "txtSubmit").val()
    SetChk()

    $("#" + MasterObj + "txtSubmit").val("");
}
//*************************************OnLoad*************************************
window.name = "selectRoleType.aspx"
aspnetForm.target = "selectRoleType.aspx"
returnValue = "";
//----------------------------------------------------------------------------------
if ($("#" + MasterObj + "ParentPage").val() == "DefineSetting") {
    str = "<Root>" + $("#" + MasterObj + "txtSelectedRoleType").val() + "</Root>";
    SetChk();
}
//----------------------------------------------------------------------------------
if ($get(MasterObj + "txtHidden").value != "") {
    str = $("#" + MasterObj + "txtHidden").val();
    str = str.substring(0, str.indexOf('<RoleType>'));
    SetChk();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        
function OnClickBtnFilter() {
    $("#" + MasterObj + "txtAcCode").val(GetAccessCode(window.event.srcElement))
    $("#" + MasterObj + "txtRoleTypeID").val($("#" + MasterObj + "CmbRoleTypeName").val())
    $("#" + MasterObj + "txtSubmit").val("Filter");
    $("#" + MasterObj + "BtnSubmit").click();

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
    if ($("#" + MasterObj + "txtType").val() == "Radio") {
        var OGrid = $("#" + MasterObj + "GrdRoleType")[0];
        var CurPage = $("#" + MasterObj + "txtCurPage").val();
        var RoleTypeID = LastSelectedRow.RoleTypeID;
        str = "<Root>"
        str += "<Tb>"
        str += "<RoleTypeId>" + RoleTypeID + "</RoleTypeId>"
        str += "</Tb>"
        str += "</Root>"
    }
    var Xml = '';
    if (str.indexOf("<Root>") != -1)
        Xml = str
    else
        Xml = "<Root>" + str + "</Root>";

    var XmlReturn = MakeXmlSave_forReturn(Xml);
    returnValue = Xml + '++' + XmlReturn;
    window.close();
}
//*************************************ThisPage***************************************
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyle');

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = $("#" + MasterObj + "GrdRoleType");
    var grdLen = OGrid.find("tr").length;

    if (OGrid.find("tr:eq(" + parseInt(grdLen - 2) + ")").attr("Footer") == 1) {
        grdLen = grdLen - 2;
    }

    for (var i = 1; i < grdLen; i++) {
        $(OGrid).find("tr:eq(" + i + ")").find("td:eq(" + 0 + ")").children(0).children(0).attr("checked", $(obj).attr("checked"))
        OnClickChk($(OGrid).find("tr:eq(" + i + ")").find("td:eq(" + 0 + ")").children(0).children(0), "header")
    }
}
//===========================================
function OnClickChk(obj, haeder) {
    var obj = $(obj)[0]
    var RowIndex = obj.parentElement.parentElement.parentElement.rowIndex;
    var TbObj = obj.parentElement.parentElement.parentElement.parentElement.parentElement
    var ID = $(TbObj).find("tr:eq(" + parseInt(RowIndex) + ")").attr("RoleTypeID");

    var strXML = "<Root>" + str + "</Root>";
    var oXmlDoc = ""


    if (window.ActiveXObject) {
        oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXML)
    }
    else {
        var parser = new DOMParser();
        oXmlDoc = parser.parseFromString(strXML, 'text/xml');
    }
    var XmlNode = "";

    //----------------------------------------------
    if ((strXML != "<Root></Root>") && (strXML != "<Root/>"))
        XmlNode = $(oXmlDoc).find("Root").find("Tb").find("RoleTypeID").filter(function () {
            return $(this).text() == ID
        });
    if ($(XmlNode).length > 0) {
        if (obj.checked == true)
            $(XmlNode).siblings("Chk").text("1")
        else
            $(XmlNode).siblings("Chk").text("0")
        //--------------------------------------
        if (window.ActiveXObject) {
            str = $(oXmlDoc)[0].xml;
        }
        else {
            var s = new XMLSerializer();
            str = s.serializeToString(oXmlDoc[0]);
        }
        str = str.replace("<Root>", "")
        str = str.replace("</Root>", "")
    }
    else {
        str += "<Tb>";
        str += "<Chk>1</Chk>"
        str += "<RoleTypeID>" + ID + "</RoleTypeID>"
        str += "</Tb>";
    }
    $get(MasterObj + "txtXml2").value = str
    while (str.indexOf("</Root>") != -1) {
        str = str.replace("</Root>", "");
    }
    while (str.indexOf("<Root>") != -1) {
        str = str.replace("<Root>", "");
    }
    //alert(str)
    SetChk()
}
//===========================================
function SetChk() {
    var oXml;
    var strXML = str;
    while (strXML.indexOf("<Root>") == -1) {
        strXML = "<Root>" + strXML + "</Root>";
    }
    //----------------------------
    if (window.ActiveXObject) {
        oXml = new ActiveXObject("Microsoft.XMLDOM");
        oXml.async = "false";
        oXml.loadXML(strXML)
    }
    else {
        var parser = new DOMParser();
        oXml = parser.parseFromString(strXML, 'text/xml');
    }
    var XmlNode = $(oXml).find("Root").find("Tb");


    if ($(XmlNode).length != 0) {
        var OGrid = $("#" + MasterObj + "GrdRoleType");
        if ($(OGrid) != null) {
            var PageSize = $(OGrid).find("tr").length;
            //------------------------
            if ($(OGrid).find("tr:eq(" + parseInt(PageSize - 1) + ")").children(0).attr("Footer") == 1)
                PageSize = PageSize - 1;
            //----------------------
            for (var i = 1; i < PageSize; i++) {
                var XmlNode1 = $(oXml).find("Root").find("Tb").find("RoleTypeID").filter(function () {
                    return $(this).text() == $(OGrid).find("tr:eq(" + i + ")").attr("RoleTypeID")
                });
                if ($(XmlNode1).length != 0) {
                    if ($(XmlNode1).siblings('Chk').text() == "1") {
                        $(OGrid).find("tr:eq(" + i + ")").find("td:eq(0)").children(0).children(0).attr('checked', true)
                        var Grid = $get(MasterObj + "GrdRoleType");
                    }
                    else
                        $(OGrid).find("tr:eq(" + i + ")").find("td:eq(0)").attr("checked", false)
                }
            }
        }
    }
}
//========================================
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeXmlSave_forReturn(Xml) {
    var strtemp = Xml;
    var strnum = '';

    if (window.ActiveXObject) {
        oXml = new ActiveXObject("Microsoft.XMLDOM");
        oXml.async = "false";
        oXml.loadXML(strtemp)
    }
    else {
        var parser = new DOMParser();
        oXml = parser.parseFromString(strtemp, 'text/xml');
    }
    $(oXml)
              .find("RoleTypeID")
             .each(function () {
                 if ($(this).parent(0).find("Chk").text() == '1') {
                     strnum = strnum + "," + $(this).text();
                 }
             });
    strtemp = "<RoleType>" + strnum.substring(1, strtemp.lenght) + "</RoleType>";
    //alert(strtemp)
    return strtemp;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        $("#" + MasterObj + "txtSubmit").val("Const")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    $("#" + MasterObj + "txtSubmit").val("BtnNext")
    $("#" + MasterObj + "BtnSubmit").click()

}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    $("#" + MasterObj + "txtSubmit").val("BtnLast")
    $("#" + MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    $("#" + MasterObj + "txtSubmit").val("BtnPrev")
    $("#" + MasterObj + "BtnSubmit").click()
}
//===============================================================================================
function OnClickBtnFirst() {
    $("#" + MasterObj + "txtSubmit").val("BtnFirst")
    $("#" + MasterObj + "BtnSubmit").click()

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
