
document.getElementsByTagName("body")[0].scroll = "no";
var ParentDialog = window.dialogArguments;

//=========================================
if ($get(MasterObj + "txtXmlMode").value =="1")
    $get(MasterObj + "txtScriptGroupXML").value = ParentDialog.$get(MasterObj + "txtScriptGroupXML").value
else if ($get(MasterObj + "txtXmlMode").value == "2")
    $get(MasterObj + "txtScriptGroupXML").value = ParentDialog.$get(MasterObj + "txtMemberXML").value
//========================================
if (ParentDialog != "") {
    if (ParentDialog.$get(MasterObj + "ScriptXmlFromParent") != null && ParentDialog.$get(MasterObj + "ScriptXmlFromParent").value != "")
        if ($get(MasterObj + "txtScriptGroupXML").value == ""
     || $get(MasterObj + "txtScriptGroupXML").value == "<Root></Root>"
     || $get(MasterObj + "txtScriptGroupXML").value == "<Root/>")
            $get(MasterObj + "txtScriptGroupXML").value = ParentDialog.$get(MasterObj + "ScriptXmlFromParent").value;
}
if ($get(MasterObj + "txtSelectPersonGroup").value == 1) {
    $get(MasterObj + "chkAllPK").style.display = "none"
    $get(MasterObj + "chkEPK").style.display = "none"
    $get(MasterObj + "rdbDepartment").style.display = "none"
    document.getElementById("TDchkAllPK").style.display = "none";
    document.getElementById("TDchkEPK").style.display = "none";
    document.getElementById("TDDepartment").style.display = "none";
    var strChk = "<Root></Root>"
    BindScriptGroups();

}
if ($get(MasterObj + "txtSelectPerson").value == 1) {
    $get(MasterObj + "chkAllPK").style.display = "none"
    $get(MasterObj + "chkEPK").style.display = "none"
    $get(MasterObj + "rdbDepartment").style.display = "none"
    document.getElementById("TDchkAllPK").style.display = "none";
    document.getElementById("TDchkEPK").style.display = "none";
    document.getElementById("TDDepartment").style.display = "none";
    document.getElementById("TDG").style.display = "none";

    var strChk = "<Root></Root>"
    BindScriptGroups();


}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

var strChk = "<Root></Root>"
if ($get(MasterObj + "txtCreditID").value != "0" && $get(MasterObj + "txtCreditID").value != "") {
    $get(MasterObj + "chkEPK").disabled = true;
    $get(MasterObj + "rdbDepartment").disabled = true;
    $get(MasterObj + "rdbGroup").disabled = true;
    $get(MasterObj + "rdbPerson").disabled = true;
    $get(MasterObj + "chkAllPK").disabled = true;
    document.getElementById("OToolBar_BtnSelectScriptGroups").style.visibility = "hidden";
    BindPackPerson();
}
else

    BindScriptGroups();


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindPackPerson() {
    if (($get(MasterObj + "txtScriptGroupXML").value != "")) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtScriptGroupXML").value);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/Pack");

        var oXmlNodesEPK = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/Pack [ MID='0' and MName='EPK']");
        if (oXmlNodesEPK.length > 0)
            $get(MasterObj + "chkEPK").checked = true;

        var oXmlNodesAllPK = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/Pack [ MID='0' and MName='AllPK']");
        if (oXmlNodesAllPK.length > 0)
            $get(MasterObj + "chkAllPK").checked = true;

        var len = oXmlNodes.length
        if (len > 0) {
            for (var i = 0; i < len; i++) {
                var MemberID = oXmlNodes.item(i).selectSingleNode("MID").text;
                var MemberName = oXmlNodes.item(i).selectSingleNode("MName").text;
                if (MemberID == "0")
                    var Type = oXmlNodes.item(i).selectSingleNode("MName").text;
                else
                    var Type = oXmlNodes.item(i).selectSingleNode("Type").text;
                var IDPersonel = oXmlNodes.item(i).selectSingleNode("MPID").text;

                addRow(MemberID, MemberName, Type, IDPersonel)
                addXML(MemberID, MemberName, Type, IDPersonel)
            }
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindScriptGroups() {
    if ($get(MasterObj + "txtScriptGroupXML").value != "<Root/>"
     && $get(MasterObj + "txtScriptGroupXML").value != ""
       && $get(MasterObj + "txtScriptGroupXML").value != "null"
     && $get(MasterObj + "txtScriptGroupXML").value != "undefined") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtScriptGroupXML").value);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        var oXmlNodesEPK = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='0' and Type='EPK']");
        if (oXmlNodesEPK.length > 0)
            $get(MasterObj + "chkEPK").checked = true;
        
        var oXmlNodesAllPK = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='0' and Type='AllPK']");
        if (oXmlNodesAllPK.length > 0)
            $get(MasterObj + "chkAllPK").checked = true;
        
        var len = oXmlNodes.length

        if (len > 0) {
            for (var i = 0; i < len; i++) {
                var MemberID = oXmlNodes.item(i).selectSingleNode("MID").text;
                if (oXmlNodes.item(i).selectSingleNode("MName"))
                    var MemberName = oXmlNodes.item(i).selectSingleNode("MName").text;

                var Type = oXmlNodes.item(i).selectSingleNode("Type").text;

                if (oXmlNodes.item(i).selectSingleNode("MPID"))
                    var IDPersonel = oXmlNodes.item(i).selectSingleNode("MPID").text;

                addRow(MemberID, MemberName, Type, IDPersonel)
                addXML(MemberID, MemberName, Type, IDPersonel)
            }
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSelectScriptGroups() {
    var strOptions = ""
    var url = ""
    var OUserFlag
    if (document.getElementById(MasterObj + "rdbPerson").checked) {
        OUserFlag = "U"
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById(MasterObj + "rdbGroup").checked) {
        OUserFlag = "G"
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById(MasterObj + "rdbDepartment").checked) {
        OUserFlag = "D"
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }
    //-------------------------------------------------------
    var OSelectedMamber = "";
    if (url != "") {
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }

    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
        CreateGrid(OSelectedMamber, OUserFlag);
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateGrid(OSelectedMamber, Type) {

    if (Type == "D")
        OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length)
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(OSelectedMamber)
    var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")
    var xmlNodesTempLen = xmlNodesTemp.length;
    if (xmlNodesTempLen > 0) {
        for (var i = 0; i < xmlNodesTempLen; i++) {
            var MemberID, MemberName, IDPersonel;
            switch (Type) {
                case 'U':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('PCode').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('PName').text;
                    IDPersonel = xmlNodesTemp.item(i).selectSingleNode('PID').text;

                    break

                case 'G':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                    IDPersonel = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                    break

                case 'D':

                    MemberID = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('DName').text;
                    IDPersonel = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                    break
            }
            addRow(MemberID, MemberName, Type, IDPersonel)
            addXML(MemberID, MemberName, Type, IDPersonel)
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addXML(MemberID, MemberName, Type, IDPersonel) {

    var str = "";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID=" + MemberID + " and Type='" + Type + "']");

    //========================================================
    if (oXmlNodes.length > 0) {
        strChk = oXmlDoc.xml;
    }
    else {
        str += "<Tb>";
        str += "<MID>" + MemberID + "</MID>"
        str += "<MName>" + MemberName + "</MName>"
        str += "<Type>" + Type + "</Type>"
        str += "<MPID>" + IDPersonel + "</MPID>"
        str += "</Tb>";
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + str + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        strChk = oXmlDoc.xml;
         
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addRow(MemberID, MemberName, Type, IDPersonel) {
    if (Type == "AllPK" || Type == "EPK" || Type == "A" || Type == "E")
        return;
    var oGrid = ScriptGroups;
    var len = oGrid.rows.length;
    for (var j = 0; j < len; j++) {
        if (oGrid.rows(j).cells(1).innerText == MemberID) {
            oGrid.rows(j).cells(0).firstChild.checked = true
            return;
        }
    }
    var oRow = oGrid.insertRow();
    oRow.setAttribute("Type", Type)
    oRow.setAttribute("IDPersonel", IDPersonel)
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
    switch (Type) {
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
            picTitle = "واحد سازماني"
            break
    }
    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
    oCell3.className = "XTabTable";
    oCell3.style.width = "60px"
    oCell3.align = "center"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
   // alert(strChk+'OK')
    window.returnValue = strChk;
    window.close();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkEPK(obj) {
    if ($get(MasterObj + "chkEPK").checked == true) {
//        $get(MasterObj + "rdbDepartment").disabled = true;
//        $get(MasterObj + "rdbGroup").disabled = true;
//        $get(MasterObj + "rdbPerson").disabled = true;
        $get(MasterObj + "chkAllPK").disabled = true;
//        $get(MasterObj + "rdbDepartment").checked = false;
//        $get(MasterObj + "rdbGroup").checked = false;
//        $get(MasterObj + "rdbPerson").checked = false;
        $get(MasterObj + "chkAllPK").checked = false;
    }
    else {
        $get(MasterObj + "rdbDepartment").disabled = false;
        $get(MasterObj + "rdbGroup").disabled = false;
        $get(MasterObj + "rdbPerson").disabled = false;
        $get(MasterObj + "chkAllPK").disabled = false;
    }
    var strTemp = "";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='0' and Type='EPK']");
    //========================================================
    if (oXmlNodes.length > 0) {
        var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
        strChk = oXmlDoc.xml;
    }
    else {
        strTemp += "<Tb>"
        strTemp += "<MID>0</MID>"
        strTemp += "<MPID>0</MPID>"
        strTemp += "<Type>EPK</Type>"
        strTemp += "</Tb>"
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        strChk = oXmlDoc.xml;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkAllPK(obj) {
    
    if ($get(MasterObj + "chkAllPK").checked == true) {
        $get(MasterObj + "rdbDepartment").disabled = true;
        $get(MasterObj + "rdbGroup").disabled = true;
        $get(MasterObj + "rdbPerson").disabled = true;
        $get(MasterObj + "chkEPK").disabled = true;
        $get(MasterObj + "rdbDepartment").checked = false;
        $get(MasterObj + "rdbGroup").checked = false;
        $get(MasterObj + "rdbPerson").checked = false;
        $get(MasterObj + "chkEPK").checked = false;
    }
    else {
        $get(MasterObj + "rdbDepartment").disabled = false;
        $get(MasterObj + "rdbGroup").disabled = false;
        $get(MasterObj + "rdbPerson").disabled = false;
        $get(MasterObj + "chkEPK").disabled = false;
    }
    var strTemp = "";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='0' and Type='AllPK']");
    //========================================================
    if (oXmlNodes.length > 0) {
        var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
        strChk = oXmlDoc.xml;
    }
    else {
        strTemp += "<Tb>"
        strTemp += "<MID>0</MID>"
        strTemp += "<MPID>0</MPID>"
        strTemp += "<Type>AllPK</Type>"
        strTemp += "</Tb>"
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        strChk = oXmlDoc.xml;
    }
    var oGrid = document.getElementById("ScriptGroups");

    var oLen = oGrid.rows.length;
    for (var i = 0; i < oLen; i++) {
        oGrid.rows(i).cells(0).firstChild.checked = false;
        OnClickChk(oGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById("ScriptGroups");
    var oLen = OGrid.rows.length
    for (var i = 0; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    var oGrid = obj.parentElement;
    var strTemp = "";
    while (oGrid.tagName != "TABLE")
        oGrid = oGrid.parentElement
    var oRow = obj.parentElement;
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    //========================================================
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strChk);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID=" + oGrid.rows(oIndex).cells(1).innerText + " and Type='" + oGrid.rows(oIndex).Type + "']");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (obj.checked == false) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            strChk = oXmlDoc.xml;
        }
    }

    else {
        strTemp += "<Tb>"
        strTemp += "<MID>" + oGrid.rows(oIndex).cells(1).innerText + "</MID>"
        strTemp += "<MName>" + oGrid.rows(oIndex).cells(2).innerText + "</MName>"
        strTemp += "<MPID>" + oGrid.rows(oIndex).IDPersonel + "</MPID>"
        strTemp += "<Type>" + oGrid.rows(oIndex).Type + "</Type>"
        strTemp += "</Tb>"
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
        var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
        strChk = oXmlDoc.xml;

    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickrdb(obj) {

    if ($get(MasterObj + "rdbDepartment").checked == true || $get(MasterObj + "rdbGroup").checked == true
               || $get(MasterObj + "rdbPerson").checked == true) {
//        $get(MasterObj + "chkEPK").checked = false;
        $get(MasterObj + "chkAllPK").checked = false;
    }
//    else {
    //        $get(MasterObj + "chkEPK").checked = true;
    //        $get(MasterObj + "chkAllPK").checked = true;
//    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!