//*************************************Declaration*************************************
//not in patch
document.body.scroll = 'NO';
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.dir = "rtl";
returnValue = "";
var strChk = ""
var CodeValue, CodeNames, CodeNamesTitle, CodeValue1, CodeNames1, CodeNamesTitle1;
//**************************************EndDeclaration*********************************       
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//*************************************************************************************
function EndRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "") {
            alert($get(MasterObj + "txtAlert").value)
        }
        else {
            SetMsg($get(MasterObj + "txtAlert").value);
        }

    }
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtSubmit").value = "";
}
//========================================================================
function onclickbtnCodeSelector(id) {
    if (id == 'Inc') {
        CodeValue = $("#" + MasterObj + "txtCodesInc").val();
        var strUrl = "../BaseInfo/CodeSelector.aspx?"
        + "SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&Type=MultiCode" + "&CodeVlue=" + CodeValue

        var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
        if (rValue != null) {
            $("#" + MasterObj + "txtReportCode").val(rValue);
            LoadXMLCodeSelector(rValue)
            if (CodeNames.length > 50)
                CodeNamesTitle = CodeNames.substr(0, 50) + '...';
            else
                CodeNamesTitle = CodeNames;

            $("#" + MasterObj + "txtCodeSelectorInc").val(CodeNamesTitle);
            $("#" + MasterObj + "txtCodeSelectorInc").val(CodeNames);
            $("#" + MasterObj + "txtCodesInc").val(CodeValue);

        }
    } else {
        CodeValue1 = $("#" + MasterObj + "txtCodesDec").val();
        var strUrl = "../BaseInfo/CodeSelector.aspx?"
        + "SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + CodeValue1

        var rValue1 = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
        if (rValue1 != null) {
            $("#" + MasterObj + "txtReportCode1").val(rValue1);
            LoadXMLCodeSelector1(rValue1)
            if (CodeNames1.length > 50)
                CodeNamesTitle1 = CodeNames1.substr(0, 50) + '...';
            else
                CodeNamesTitle1 = CodeNames1;
            $("#" + MasterObj + "txtCodeSelectorDec").val(CodeNamesTitle1);
            $("#" + MasterObj + "txtCodeSelectorDec").val(CodeNames1);
            $("#" + MasterObj + "txtCodesDec").val(CodeValue1);

        }
    }
}

//=================================================================================
function LoadXMLCodeSelector(rValue) {
    var strXml = rValue;
    if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLDOM");
        xml.async = "false";
        xml.loadXML(strXml)
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString(strXml, 'text/xml');
    }
    $(xml)
          .find("Root").find("Tb").each(function () {
              CodeNames = $(this).find('Name').text();
              CodeValue = $(this).find('ID').text();
          });
}
//=================================================================================
function LoadXMLCodeSelector1(rValue) {

    var strXml = rValue;
    if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLDOM");
        xml.async = "false";
        xml.loadXML(strXml)
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString(strXml, 'text/xml');
    }
    $(xml)
          .find("Root").find("Tb").each(function () {
              CodeNames1 = $(this).find('Name').text();
              CodeValue1 = $(this).find('ID').text();
          });
}
//=====================================================================
function OnClickBtnTransferCardex() {
    //alert(document.getElementById(MasterObj + "txtPersScript").value)
    if ($("#" + MasterObj + "chkTransfer").attr("checked") == true)
        $("#" + MasterObj + "txtchkTransfer").val("1")
    else {
        $("#" + MasterObj + "txtchkTransfer").val("0")
    }
    if ($("#" + MasterObj + "txtZarib").val() == '')
        alert('لطفا ضریب را وارد کنید');
    else {
        $("#" + MasterObj + "txtPersScript").val( $("#" + MasterObj + "txtPersScript").val() );
        if ($("#" + MasterObj + "txtZarib").val() > 1)
            alert('لطفا ضریب ملزم را بین صفر و یک انتخاب کنید');
        else {
            $("#" + MasterObj + "txtSubmit").val("Transfer");
            $("#" + MasterObj + "BtnSubmit").click();
        }

    }

}
//======================================================================
function OnClickBtnSelectScriptGroups() {

    var strOptions = ""
    var url = ""
    var OUserFlag
    var kind = 0

    if ($("#" + MasterObj + "rdbPerson").attr("checked")) {
        OUserFlag = "U"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    } else if ($("#" + MasterObj + "rdbGroup").attr("checked")) {

        OUserFlag = "G"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    } else if ($("#" + MasterObj + "rdbDepartment").attr("checked")) {

        OUserFlag = "D"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    } else if ($("#" + MasterObj + "rdbPerson1").attr("checked")) {
        OUserFlag = "U"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    } else if ($("#" + MasterObj + "rdbGroup1").attr("checked")) {

        OUserFlag = "G"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    } else if ($("#" + MasterObj + "rdbDepartment1").attr("checked")) {

        OUserFlag = "D"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }
    //-------------------------------------------------------
    var OSelectedMamber = "";

    if (url != "") {
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }

    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
        if ($("#" + MasterObj + "rdbPerson").attr("checked") || $("#" + MasterObj + "rdbGroup").attr("checked") || $("#" + MasterObj + "rdbDepartment").attr("checked")) {
            if ($($("#ScriptGroups")).find("tr").length > 0) {
                if (confirm("پرسنل انتخاب شده جايگزين پرسنل مشمول قبلي گردند؟")) {
                    $("#ScriptGroups").find("Tr").remove();
                    document.getElementById(MasterObj + "txtPersScript").value = '';
                    strChk = '';
                }
            }
        }
        else if ($("#" + MasterObj + "rdbPerson1").attr("checked") || $("#" + MasterObj + "rdbGroup1").attr("checked") || $("#" + MasterObj + "rdbDepartment1").attr("checked")) {
            if ($($("#ScriptGroups1")).find("tr").length > 0) {
                if (confirm("پرسنل انتخاب شده جايگزين پرسنل غیر مشمول قبلي گردند؟")) {
                    $("#ScriptGroups").find("Tr").remove();
                    document.getElementById(MasterObj + "txtPersScript").value = '';
                    strChk = '';
                }
            }
        }
        CreateGrid(OSelectedMamber, OUserFlag, kind);
    }
}

//=========================================================================================
function CreateGrid(OSelectedMamber, Type, kind) {
    //        alert(Type)
    if ((Type == "D"))
        OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length)

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(OSelectedMamber)

    var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")

    if (xmlNodesTemp.length > 0) {
        for (var i = 0; i < xmlNodesTemp.length; i++) {
            var MemberID, MemberName;
            switch (Type) {
                case 'U':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('PCode').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('PName').text;
                    break

                case 'G':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                    break

                case 'D':

                    MemberID = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('DName').text;
                    break

            }
            addRow(MemberID, MemberName, Type, kind)

            addXML(MemberID, Type, kind)
        }
    }
}
//===========================================================================================
function BindScriptGroups() {

    if ((document.getElementById(MasterObj + "txtScriptGroupXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtScriptGroupXML").value != "")) {
        var strXml = document.getElementById(MasterObj + "txtScriptGroupXML").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroups[kind=0]");
        var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1[kind=0]");

        var len = oXmlNodes.length
        var len1 = oXmlNodes1.length
        if (len1 > 0) {
            for (var i = 0; i < len1; i++) {
                if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "AllPK")
                    if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                        document.getElementById(MasterObj + "chkAllPK").checked = true
                    else
                        document.getElementById(MasterObj + "chkAllPK").checked = false

                    if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "EPK")
                        if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                            document.getElementById(MasterObj + "chkEPK").checked = true
                        else
                            document.getElementById(MasterObj + "chkEPK").checked = false
                    }
                }
                //-----------------------------------------------

                if (len > 0) {
                    for (var y = 0; y < len; y++) {
                        var MemberID, MemberName, type;
                        MemberID = oXmlNodes.item(y).selectSingleNode("GroupID").text;
                        MemberName = oXmlNodes.item(y).selectSingleNode("GroupName").text;
                        type = oXmlNodes.item(y).selectSingleNode("Type").text;
                        var oGrid = ScriptGroups;
                        addRow(MemberID, MemberName, type, 0)
                    }
                }
                var oXmlNodesN = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroups[kind=1]");
                var oXmlNodes1N = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1[kind=1]");

                var len = oXmlNodesN.length
                var len1 = oXmlNodes1N.length
                if (len1 > 0) {
                    for (var i = 0; i < len1; i++) {
                        if (oXmlNodes1N.item(i).selectSingleNode("Acronym").text == "AllPK")
                            if (oXmlNodes1N.item(i).selectSingleNode("Value").text == "1")
                                document.getElementById(MasterObj + "chkAllPK1").checked = true
                            else
                                document.getElementById(MasterObj + "chkAllPK1").checked = false

                            if (oXmlNodes1N.item(i).selectSingleNode("Acronym").text == "EPK")
                                if (oXmlNodes1N.item(i).selectSingleNode("Value").text == "1")
                                    document.getElementById(MasterObj + "chkEPK1").checked = true
                                else
                                    document.getElementById(MasterObj + "chkEPK1").checked = false
                            }
                        }
                        //-----------------------------------------------

                        if (len > 0) {
                            for (var y = 0; y < len; y++) {
                                var MemberID, MemberName, type;
                                MemberID = oXmlNodesN.item(y).selectSingleNode("GroupID").text;
                                MemberName = oXmlNodesN.item(y).selectSingleNode("GroupName").text;
                                type = oXmlNodesN.item(y).selectSingleNode("Type").text;
                                var oGrid = ScriptGroups1;
                                addRow(MemberID, MemberName, type, 1)
                            }
                        }
                    }
                }
                //=======================================================================================
                function addXML(MemberID, Type, kind) {
                    var strXml = "<Root>" + strChk + "</Root>"

                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(strXml);

                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + MemberID + " and type='" + Type + "' and kind='" + kind + "']");
                    //========================================================
                    if (oXmlNodes.length > 0) {
                        oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                        strXml = oXmlDoc.xml;
                        strChk = strXml.replace("<Root>", "");
                        strChk = strChk.replace("</Root>", "");
                    }
                    else {
                        strChk += "<TbCode>"
                        strChk += "<CodeID>" + MemberID + "</CodeID>"
                        strChk += "<type>" + Type + "</type>"
                        strChk += "<kind>" + kind + "</kind>"
                        strChk += "<Selected>1</Selected>"

                        strChk += "</TbCode>";
                    }
                    document.getElementById(MasterObj + "txtPersScript").value = strChk;

                }
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                function addRow(MemberID, MemberName, type, kind) {
                    var oGrid
                    if (kind == 0)
                        oGrid = ScriptGroups;
                    else
                        oGrid = ScriptGroups1;
                    for (var j = 0; j < oGrid.rows.length; j++) {
                        if (oGrid.rows(j).cells(1).innerText == MemberID) {
                            oGrid.rows(j).cells(0).firstChild.checked = true
                            return;
                        }
                    }
                    var oRow = oGrid.insertRow();
                    oRow.setAttribute("type", type) //ControlRuleMemberID


                    if ((oGrid.rows.length - 1) % 2 == 0)
                        oRow.className = "CssItemStyle"
                    else
                        oRow.className = "CssAlternatingItemStyle";

                    var oCell0 = oRow.insertCell();
                    oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)'  checked />";
                    oCell0.className = "XTabTable";
                    oCell0.style.width = "25px"
                    oCell0.align = "center"

                    var oCell1 = oRow.insertCell();
                    oCell1.innerText = MemberID;
                    oCell1.style.width = "60px"
                    oCell1.align = "center";

                    var oCell2 = oRow.insertCell();
                    oCell2.innerText = ((MemberName.length > 30) ? MemberName.substring(0, 25) + "..." : MemberName);
                    oCell2.title = MemberName;
                    oCell2.style.width = "150px"
                    oCell2.align = "center";

                    var tempSrc = "";
                    var picTitle = "";
                    switch (type) {
                        case "U":
                            tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                            picTitle = "پرسنل"
                            break
                        case "G":
                            tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                            picTitle = "گروه"
                            break
                        case "D":
                            tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                            picTitle = "واحدسازماني"
                            break

                    }
                    var oCell3 = oRow.insertCell();
                    oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
                    oCell3.className = "XTabTable";
                    oCell3.style.width = "60px"
                    oCell3.align = "center"

                }
                function OnClickHeaderChk(obj) {
                   
                    var OGrid = document.getElementById("ScriptGroups");
                    if (obj.id == "chkAll1")
                        OGrid = document.getElementById("ScriptGroups1");

                    var oLen = OGrid.rows.length
                    for (var i = 0; i < oLen; i++) {
                        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                        OnClickChk(OGrid.rows(i).cells(0).firstChild);
                    }
                }
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                function OnClickChk(obj) {
                    
                    /////////////////////////////////////////////////////////////////////////////
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

                    var oXmlNodes
                    if (oGrid.id == "ScriptGroups")
                        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='0']");
                    else
                        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='1']");
                    //========================================================
                    if (oXmlNodes.length > 0) {
                        if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                            oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                        else
                            oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                        strXml = oXmlDoc.xml;
                        strChk = strXml.replace("<Root>", "");
                        strChk = strChk.replace("</Root>", "");
                    }
                    else {
                        strChk += "<TbCode>"
                        strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
                        strChk += "<type>" + oGrid.rows(oIndex).type + "</type>"
                        if (oGrid.id == "ScriptGroups")
                            strChk += "<kind>0</kind>"
                        else
                            strChk += "<kind>1</kind>"
                        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                            strChk += "<Selected>0</Selected>"
                        else
                            strChk += "<Selected>1</Selected>"

                        strChk += "</TbCode>"
                    }
                    document.getElementById(MasterObj + "txtPersScript").value = strChk;
                }
                //===================================================================
                function OnChangeCardexPeriod() {
                    $("#" + MasterObj + "txtSubmit").val("ChangeCardexPeriod");
                    $("#" + MasterObj + "BtnSubmitrefresh").click();
                }
                function OnKeyDownIntZarib() {
//                    var key = window.event.keyCode
//                    window.event.returnValue =
//                        (
//                            ((key >= 96) && (key <= 97))
//                                || ((key >= 48) && (key <= 49))
//                       || key == 110
//                        );
                }
                //--------------------------------------------------
                function OnChangeZaribCardexType() {
                   $("#" + MasterObj + "txtZarib").val("");
               }
               function onblurtxtValue(obj) {
                   if (obj.value != "" || obj.value != "0") {
                       if ($("#" + MasterObj + "CmbZaribCardexType").val() == "2")
                           TimechkNew(obj);
                       else
                           obj.value = obj.value.split(":")[0];
                   }
               }
               function TimechkNew(Obj) {
                   if (Obj.value.split(":").length == 1)
                       Obj.value = Obj.value + ":00";
                   else
                       if (Obj.value.split(":")[1] > 59) {
                           alert("لطفا تاريخ صحيح را وارد کنيد");
                           Obj.select();
                           Obj.focus();
                       }
                   }
                   //===================================for other--------------------------------
                   function onclickbtnCodeSelector1(id) {
                       if (id == 'Inc') {
                           CodeValue = $("#" + MasterObj + "txtCodesInc1").val();
                           var strUrl = "../BaseInfo/CodeSelector.aspx?"
        + "SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&Type=MultiCode" + "&CodeVlue=" + CodeValue

                           var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
                           if (rValue != null) {
                               $("#" + MasterObj + "txtReportCode").val(rValue);
                               LoadXMLCodeSelector(rValue)
                               if (CodeNames.length > 50)
                                   CodeNamesTitle = CodeNames.substr(0, 50) + '...';
                               else
                                   CodeNamesTitle = CodeNames;

                               $("#" + MasterObj + "txtCodeSelectorInc1").val(CodeNamesTitle);
                               $("#" + MasterObj + "txtCodeSelectorInc1").val(CodeNames);
                               $("#" + MasterObj + "txtCodesInc1").val(CodeValue);

                           }
                       } else {
                           CodeValue1 = $("#" + MasterObj + "txtCodesDec1").val();
                           var strUrl = "../BaseInfo/CodeSelector.aspx?"
        + "SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + CodeValue1

                           var rValue1 = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')
                           if (rValue1 != null) {
                               $("#" + MasterObj + "txtReportCode1").val(rValue1);
                               LoadXMLCodeSelector1(rValue1)
                               if (CodeNames1.length > 50)
                                   CodeNamesTitle1 = CodeNames1.substr(0, 50) + '...';
                               else
                                   CodeNamesTitle1 = CodeNames1;
                               $("#" + MasterObj + "txtCodeSelectorDec1").val(CodeNamesTitle1);
                               $("#" + MasterObj + "txtCodeSelectorDec1").val(CodeNames1);
                               $("#" + MasterObj + "txtCodesDec1").val(CodeValue1);

                           }
                       }
                   }