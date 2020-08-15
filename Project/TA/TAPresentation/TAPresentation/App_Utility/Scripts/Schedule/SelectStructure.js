var MasterObj = "ctl00_ContentPlaceHolder1_";
document.body.scroll = "no";
//=====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//====================================================================================================
onLoad();
function onLoad() {
    $("#" + MasterObj + "GrdStructure")
         .find("tr")
         .each(function () {
             if ($(this).attr("StructureID") == $("#" + MasterObj + "txtStrucure").val()) {
                 $(this).find("td").find('input:checkbox').attr("checked", "checked");
             }
         });
    //-----------------------------------------در گزارشساز-----------------------------------------------------
    var OGrd = $("#" + MasterObj + "GrdStructure");
    if ($("#" + MasterObj + "txtXmlHidden").val() != "" && $("#" + MasterObj + "txtXmlHidden").val() != undefined && $("#" + MasterObj + "txtXmlHidden").val() != "<Root></Root>") {
        var StrTemp = $("#" + MasterObj + "txtXmlHidden").val(), XMLStr = "";

        var xml;
        if (window.ActiveXObject) {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = "false";
            xml.loadXML(StrTemp)
        }
        else {
            var parser = new DOMParser();
            xml = parser.parseFromString(StrTemp, 'text/xml');
        }

        var XmlNodeTmp = $(xml).find("Root").find("Tb").find("StrChek").filter(function () {
            return $(this).text() == "1"
        });

        for (var i = 0; i < $(XmlNodeTmp).length; i++) {
            XMLStr += "<Tb>";
            XMLStr += "<ID>" + $($(XmlNodeTmp)[i]).siblings('ID').text() + "</ID>"
            XMLStr += "<StrChek>1</StrChek>"
            XMLStr += "</Tb>"
        }
        $("#" + MasterObj + "txtXml").val("<Root>" + XMLStr + "</Root>");
        for (var j = 0; j < $(OGrd).find("tr").length; j++) {
            for (var k = 0; k < $(XmlNodeTmp).length; k++) {
                if ($(OGrd).find("tr:eq(" + j + ")").attr("StructureID") == $($(XmlNodeTmp)[k]).siblings('ID').text()) {
                    $(OGrd).find("tr:eq(" + j + ")").find("input:checkbox").attr("checked", true);
                }
            }
        }
    }

}
function EndRequestHandler(sender, args) {

}
//======================================متابعت چکباکس ها از چکباکس هدر=========
function OnClickHeaderChk(header) {
    $("#" + MasterObj + "GrdStructure").find("TBODY").find("tr").find("input:checkbox").each(function () {
        if (!$(this).hasClass("header")) {
            $(this).attr("checked", $(header).attr("checked"));
        }
    });
    MakeXmlSave();
}
//==============================================================================
function onchangeCheck() {
    $("#" + MasterObj + "GrdStructure").find("TBODY").find("tr").find("input:checkbox").each(function () {
        $(this).attr("checked", $(this).attr("checked"));
    });
    MakeXmlSave();
}
//============================MakeXmlSave==================================
function MakeXmlSave() {
    var XMLStr = ""
    var counter = '1'
    $("#" + MasterObj + "GrdStructure")
     .find("TBODY")
     .find('tr')
     .each(function () {
         if (counter != '1') {
             if ($(this).find('input:checkbox').attr("checked")) {
                 XMLStr += "<Tb>"
                 XMLStr += "<ID>" + $(this).attr("StructureID") + "</ID>"
                 XMLStr += "<StrChek>1</StrChek>"
                 XMLStr += "</Tb>"

             }

         }
         counter++;
     });
    var str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "txtXml").val(str);
    return str;

}
//=================================================================
function OnClickBtnOk() {
    returnValue = $("#" + MasterObj + "txtXml").val();
    window.close();
}