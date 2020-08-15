var MasterObj = "ctl00_ContentPlaceHolder1_";
//document.documentElement.style.overflow = 'hidden';  // firefox, chrome
//document.body.scroll = "yes"; // ie only
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//-----------------------------------------------------------------------------------
function EndRequestHandler(sender, args) {

    if ($("#" + MasterObj + "txtSubmit").val() == "Search") {
        //----------------------make header-----------------------------
        AddHeader();
        //----------------------make Row-----------------------------------
        AddRow();
    }
}
function AddRow() {
    var CodeValue = $("#" + MasterObj + "txtMultiCode").val();
    var xml = "";
    if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLDOM");
        xml.async = "false";
        xml.loadXML($("#" + MasterObj + "txtXmlGroupCode").val())
    }
    else {
        var parser = new DOMParser();
        xml = parser.parseFromString($("#" + MasterObj + "txtXmlGroupCode").val(), 'text/xml');
    }

    var RowEO = 0;
    var style = "CssItemStyle";
    var Str = "";
    $(xml).find("RptGetSumGroupCodeReport").each(function () {
        RowEO += 1;
        if (RowEO % 2 == 0)
            style = "CssAlternatingItemStyle";
        else if (RowEO % 2 == 1)
            style = "CssItemStyle";
        Str += "<tr class='CssNewRow' uid='1' >";
        Str += "<td align='center'>" + $(this).find("GroupName").text() + "</td>";
        var CodeVal = CodeValue;
        var CodeVal2 = '';
        if (CodeVal.indexOf(",") != -1) {
            while (CodeVal.indexOf(",") != -1) {
                CodeVal2 = CodeVal.substring(0, CodeVal.indexOf(","))
                CodeVal = CodeVal.substring(CodeVal.indexOf(",") + 1)
                Str += "<td align='center'>" + $(this).find("C" + CodeVal2).text() + "</td>";
            }
            Str += "<td align='center'>" + $(this).find("C" + CodeVal2).text() + "</td>";
        }
        else {
            Str += "<td align='center'>" + $(this).find("C" + CodeVal).text() + "</td>";
        }
        Str += "</tr>";
    });

    $("#TblGridGroupCode").append(Str);
}
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   
function AddHeader() {
    $("#TblGridGroupCode").children(0).remove();
    var Str = "";
    var xmlHeaderCompany;
    var HeaderCompany = "";

    if (window.ActiveXObject) {
        xmlHeaderCompany = new ActiveXObject("Microsoft.XMLDOM");
        xmlHeaderCompany.async = "false";
        xmlHeaderCompany.loadXML($("#" + MasterObj + "txtXmlGroupCode").val())
    }
    else {
        var parser = new DOMParser();
        xmlHeaderCompany = parser.parseFromString($("#" + MasterObj + "txtXmlGroupCode").val(), 'text/xml');
    }

    HeaderCompany += "<th class='CssHeaderStyle' style='height:20px;width:100px'> گروه/ کد </th>";

    $(xmlHeaderCompany)
                 .find("TblCode").each(function () {
                     HeaderCompany += "<th class='CssHeaderStyle'>" + $(this).find("CodeName").text() + "</th>";
                 });

    HeaderCompany = "<tr>" + HeaderCompany + "</tr>";
    $("#TblGridGroupCode").append(HeaderCompany);
}
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function OnClickBtnSearch() {
    $("#" + MasterObj + "txtPeriod").val($("#" + MasterObj + "CmbPeriod").val())
    $("#" + MasterObj + "txtToPeriod").val($("#" + MasterObj + "CmbToPeriod").val())
    //-------------------------------------------------------
    if (CheckNotEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Search")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//================================================================
function OnClickBtnExcel() {
    $("#" + MasterObj + "txtPeriod").val($("#" + MasterObj + "CmbPeriod").val());
    $("#" + MasterObj + "txtToPeriod").val($("#" + MasterObj + "CmbToPeriod").val());
    //-------------------------------------------------------
    if (CheckNotEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Excel");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }


}
//============================================================================
function OnClickBtnPDF() {
    $("#" + MasterObj + "txtPeriod").val($("#" + MasterObj + "CmbPeriod").val());
    $("#" + MasterObj + "txtToPeriod").val($("#" + MasterObj + "CmbToPeriod").val());
    //-------------------------------------------------------
    if (CheckNotEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("PDF");
        $("#" + MasterObj + "BtnSubmitSend").click();
    }

}
//==============================================================================
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function CheckNotEmpty() {
    if ($("#" + MasterObj + "MultiGroups_txtHidden").val() != "") {
        var Groups = $("#" + MasterObj + "MultiGroups_txtHidden").val();
        //به خاطر اینکه از صفحه گروه به صورت ایکس ام ال می امد
        var xml;
        var GroupString = '';
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(Groups)
        }
        else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Groups, 'text/xml');
        }
        $(xml)
        .find("Root").find("Tb").each(function () {
            GroupString = GroupString + "," + $(this).find('GroupId').text();
        });
        GroupString = GroupString.substring(1, GroupString.length)
        $("#" + MasterObj + "txtMultiGroup").val(GroupString);
    }
    else
        $("#" + MasterObj + "txtMultiGroup").val($("#" + MasterObj + "MultiGroups_cmbPerson_txtPCode").val());
    ///////////////////////////Code////////////////////////////////////
    if ($("#" + MasterObj + "MultiCodes_txtHidden").val() != '')
        $("#" + MasterObj + "txtMultiCode").val($("#" + MasterObj + "MultiCodes_txtHidden").val())
    else
        $("#" + MasterObj + "txtMultiCode").val($("#" + MasterObj + "MultiCodes_cmbCode_txtName").val());
    ///////////////////////////////////////////////////////////////
    if ($("#" + MasterObj + "txtMultiGroup").val() == '') {
        alert('لطفا گروههای مورد نظر را انتخاب کنید')
        return false;
    }
    if ($("#" + MasterObj + "txtMultiCode").val() == '') {
        alert('لطفا کدهای مورد نظر را انتخاب کنید')
        return false;
    }
    else
        return true;
}

