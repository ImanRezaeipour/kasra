var strChk = ""
var newrowindex = 0
var newrowindexPersonel = 0
BindPage();

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindPage() {
    BindHeader();
    BindScriptGroups();
    if ((document.getElementById(MasterObj + "txtUpdateXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtUpdateXML").value != "")) {
        var strXml = document.getElementById(MasterObj + "txtUpdateXML").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);

        var oXmlNodesAlarmDesc = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/AlarmDesc");
        var oXmlNodesAlarmParameter = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/AlarmParameter");
        var oXmlNodesAlarmReciever = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/AlarmReciever");
        var lenAlarmDesc = oXmlNodesAlarmDesc.length
        var lenAlarmParameter = oXmlNodesAlarmParameter.length
        var lenAlarmReciever = oXmlNodesAlarmReciever.length

        if (lenAlarmDesc > 0) {
            document.getElementById(MasterObj + "txtAlarmName").value = oXmlNodesAlarmDesc.item(0).selectSingleNode('AlarmName').text

            if (oXmlNodesAlarmDesc.item(0).selectSingleNode('Alarm').text == "True")
                document.getElementById(MasterObj + "chkAlarm").checked = true
            else
                document.getElementById(MasterObj + "chkAlarm").checked = false

            if (oXmlNodesAlarmDesc.item(0).selectSingleNode('Abstract').text == "True")
                document.getElementById(MasterObj + "ChkAbstract").checked = true
            else
                document.getElementById(MasterObj + "ChkAbstract").checked = false

            if (oXmlNodesAlarmDesc.item(0).selectSingleNode('Email').text == "True")
                document.getElementById(MasterObj + "chkEmail").checked = true
            else
                document.getElementById(MasterObj + "chkEmail").checked = false

            if (oXmlNodesAlarmDesc.item(0).selectSingleNode('SMS').text == "True")
                document.getElementById(MasterObj + "chkSMS").checked = true
            else
                document.getElementById(MasterObj + "chkSMS").checked = false

            document.getElementById(MasterObj + "txtCreator").value = oXmlNodesAlarmDesc.item(0).selectSingleNode('Creator').text
            document.getElementById(MasterObj + "tdonlineUser").innerHTML = oXmlNodesAlarmDesc.item(0).selectSingleNode('CreatorName').text
        }
        //-----------------------------------------------
        if (lenAlarmParameter > 0) {
            var oGrid = document.getElementById("ScriptParameter")

            for (var j = 0; j < lenAlarmParameter; j++) {


                oGrid.rows(j).cells(1).firstChild.value = oXmlNodesAlarmParameter.item(j).selectSingleNode('Value').text
            }
        }
        //-----------------------------------------------
        if (lenAlarmReciever > 0) {
            for (var y = 0; y < lenAlarmReciever; y++) {
                var MemberID, MemberName;
                MemberID = oXmlNodesAlarmReciever.item(y).selectSingleNode("RecieverID").text;
                MemberName = oXmlNodesAlarmReciever.item(y).selectSingleNode("RecieverName").text;
                var oGrid = reciever;
                addRowreciever(MemberID, MemberName)
            }
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onchangcmbAlarmScripts() {

    document.getElementById(MasterObj + "txtScriptID").value = document.getElementById(MasterObj + "cmbAlarmScripts").value

    document.getElementById(MasterObj + "txtSubmit").value = "changcmbAlarmScripts";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function Cleargrd(obj) {
    j = obj.rows.length - 1
    for (; j >= 0; --j)
        obj.deleteRow(j)
    newrowindex = 0
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindHeader() {

    var oGrid = document.getElementById("ScriptParameter")
    Cleargrd(oGrid)
    //            Cleargrd(ScriptParameter)

    if ((document.getElementById(MasterObj + "txtXMLHeader").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtXMLHeader").value != "")) {
        var strXml = document.getElementById(MasterObj + "txtXMLHeader").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/ScriptParameter");
        var len = oXmlNodes.length
        if (oGrid.rows.length > 0)
            oGrid.deleteRow(0);

        var oRow
        for (var i = 0; i < len; i++) {
            oRow = oGrid.insertRow();
            oRow.insertCell()
            oRow.cells(0).innerHTML = "<label  style='width:120px' title='" + oXmlNodes.item(i).selectSingleNode('ParameterName').text + "' >" + oXmlNodes.item(i).selectSingleNode('SParameterName').text + "</label>"
            oRow.cells(0).align = "right"
            oRow.cells(0).className = "CssHeaderStyle"
            oRow.cells(0).style.width = "120px"


            oRow.className = "CssItemStyle"


            var oCell = oRow.insertCell();
            oCell.innerHTML = "<input type='text' style='width:90px' />"
            oCell.style.width = "100px"
            oCell.align = "center";

            //                oGrid.rows(0).insertCell()
            //                oGrid.rows(0).insertCell()
            //                oGrid.rows(0).cells(i).innerHTML = "<label  style='width:22px'></label>"
            //                oGrid.rows(0).cells(i + 1).innerHTML = "<label  style='width:22px'></label>"
            //                oGrid.rows(0).cells(i).className = "CssHeaderStyle"
            //                oGrid.rows(0).cells(i + 1).className = "CssHeaderStyle"
            //                oGrid.rows(0).cells(i).style.width = "25px"
            //                oGrid.rows(0).cells(i + 1).style.width = "25px"

            document.getElementById(MasterObj + "lenColumns").value = len
            // addRowScriptParameter(len);
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmptyScriptParameter() {
    var oGrid = ScriptParameter;
    for (var j = 0; j < oGrid.rows.length; j++) {
        //for (var i = 1; i < oGrid.rows(0).cells.length ; i++) {
        if (oGrid.rows(j).cells(1).firstChild.value == "") {
            alert("پارامترهاي سطر " + parseInt(j + 1) + " ام را وارد کنيد ")
            return false;
            // }
        }
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addRowScriptParameter(len) {
    var oGrid = ScriptParameter;
    var oRow = oGrid.insertRow();
    var rowi = oGrid.rows.length - 1
    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle"
    else
        oRow.className = "CssAlternatingItemStyle";

    for (var i = 0; i < len; i++) {
        var oCell = oRow.insertCell();
        oCell.innerHTML = "<input type='text' style='width:80px' />"
        oCell.style.width = "100px"
        oCell.align = "center";
    }
    oGrid.rows(rowi).insertCell()
    oGrid.rows(rowi).insertCell()
    oGrid.rows(rowi).cells(i).innerHTML = "<INPUT type='button' title='جديد'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/FrmPresentation/App_Utility/Images/Icons/NewIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='addRowScriptParameter(" + len + ")'>"
    oGrid.rows(rowi).cells(i + 1).innerHTML = "<INPUT type='button'  title='حذف'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/FrmPresentation/App_Utility/Images/Icons/DelIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickbtnDeleteRow(this)'>"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickbtnDeleteRow(oRow) {
    if (!confirm('آيا براي حذف مطمئن هستيد؟'))
        return
    var oGrid = ScriptParameter;
    if (oGrid.rows.length == 1) {
        alert('حذف امکان پذير نمي باشد')
        return
    }
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    var oIndex = oRow.rowIndex
    oGrid.deleteRow(oIndex)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindScriptGroups() {
    if ((document.getElementById(MasterObj + "txtScriptGroupXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtScriptGroupXML").value != "")) {
        var strXml = document.getElementById(MasterObj + "txtScriptGroupXML").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroups");
        var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1");

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
                addRow(MemberID, MemberName, type)
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
        OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length - 2)

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(OSelectedMamber)

    var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")
    if (xmlNodesTemp.length > 0) {
        for (var i = 0; i < xmlNodesTemp.length; i++) {
            var MemberID, MemberName;
            switch (Type) {
                case 'U':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('PID').text;
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
            addRow(MemberID, MemberName, Type)
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addRow(MemberID, MemberName, type) {
    var oGrid = ScriptGroups;

    for (var j = 0; j < oGrid.rows.length; j++) {
        if (oGrid.rows(j).cells(1).innerText == MemberID) {
            oGrid.rows(j).cells(0).firstChild.checked = true
            return;
        }
    }
    var oRow = oGrid.insertRow();

    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle"
    else
        oRow.className = "CssAlternatingItemStyle";

    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = "<INPUT type='checkbox'  checked />";
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
    oCell2.style.width = "120px"
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSelect() {

    var strOptions = ""
    var url = ""
    var OUserFlag

    if (document.getElementById(MasterObj + "rdbPersonel").checked) {
        OUserFlag = "P"
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    //                  else if (document.getElementById(MasterObj + "RadGroup").checked) {

    //                      OUserFlag = "G"
    //                      url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
    //                      strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    //                  }
    //                  else if (document.getElementById(MasterObj + "RadRole").checked) {

    //                      OUserFlag = "D"
    //                      url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
    //                      strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    //                  }

    //-------------------------------------------------------
    var OSelectedMamber = "";

    if (url != "") {
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
        CreateGridreciever(OSelectedMamber);
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateGridreciever(OSelectedMamber) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(OSelectedMamber)
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb")
    if (xmlNodes.length > 0) {
        for (var i = 0; i < xmlNodes.length; i++) {
            var MemberID, MemberName;
            MemberID = xmlNodes.item(i).selectSingleNode("PID").text;
            MemberName = xmlNodes.item(i).selectSingleNode("PName").text;
            var oGrid = reciever;

            addRowreciever(MemberID, MemberName)
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addRowreciever(MemberID, MemberName) {
    var oGrid = reciever;
    for (var j = 0; j < oGrid.rows.length; j++) {
        if (oGrid.rows(j).cells(1).innerText == MemberID) {
            oGrid.rows(j).cells(0).firstChild.checked = true
            return;
        }
    }
    var oRow = oGrid.insertRow();

    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle"
    else
        oRow.className = "CssAlternatingItemStyle";

    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = "<INPUT type='checkbox'  checked />";
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
    oCell2.style.width = "120px"
    oCell2.align = "center";

    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
    picTitle = "پرسنل"
    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
    oCell3.className = "XTabTable";
    oCell3.style.width = "40px"
    oCell3.align = "center"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {
    window.close()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    document.getElementById(MasterObj + "txtUserCode").value = document.getElementById(MasterObj + "txtTmpUserCode").value
    document.getElementById(MasterObj + "txtCodeName").value = ""
    document.getElementById(MasterObj + "txtDesc").value = ""
    document.getElementById(MasterObj + "txtCodeId").value = ""
    document.getElementById(MasterObj + "txtFormule").value = ""
    document.getElementById(MasterObj + "cmbStep").value = 0
    document.getElementById(MasterObj + "rdbActive").checked = true
    document.getElementById(MasterObj + "rdbNoActive").checked = false
    document.getElementById("chkFormule").checked = false
    onclickchkFormule()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {

    if (checkNotEmpty() == true) {
        if (checkNotEmptyScriptParameter() == true) {
            MakeXML()
            returnValue = "1"
            //alert(document.getElementById(MasterObj + "txtXMLSave").value)
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function MakeXML() {

    var XMLStr = "<Tb>"
    XMLStr = XMLStr + "<AlarmID>" + document.getElementById(MasterObj + "txtAlarm").value + "</AlarmID>"
    XMLStr = XMLStr + "<AlarmName>" + document.getElementById(MasterObj + "txtAlarmName").value + "</AlarmName>"
    XMLStr = XMLStr + "<ScriptID>" + document.getElementById(MasterObj + "txtScriptID").value + "</ScriptID>"
    XMLStr = XMLStr + "<Creator>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</Creator>"


    if (document.getElementById(MasterObj + "rdbOccure").checked == true)
        XMLStr = XMLStr + "<RunTime>Occure</RunTime>"
    else if (document.getElementById(MasterObj + "rdbLogin").checked == true)
        XMLStr = XMLStr + "<RunTime>login</RunTime>"
    else if (document.getElementById(MasterObj + "rdbsettingTime").checked == true)
        XMLStr = XMLStr + "<RunTime>setting</RunTime>"


    if (document.getElementById(MasterObj + "chkAlarm").checked == true)
        XMLStr = XMLStr + "<Alarm>1</Alarm>"
    else
        XMLStr = XMLStr + "<Alarm>0</Alarm>"

    if (document.getElementById(MasterObj + "chkSMS").checked == true)
        XMLStr = XMLStr + "<SMS>1</SMS>"
    else
        XMLStr = XMLStr + "<SMS>0</SMS>"

    if (document.getElementById(MasterObj + "chkEmail").checked == true)
        XMLStr = XMLStr + "<Email>1</Email>"
    else
        XMLStr = XMLStr + "<Email>0</Email>"

    if (document.getElementById(MasterObj + "ChkAbstract").checked == true)
        XMLStr = XMLStr + "<Abstract>1</Abstract>"
    else
        XMLStr = XMLStr + "<Abstract>0</Abstract>"
    XMLStr = XMLStr + "</Tb>"


    var lenreciever = reciever.rows.length;
    for (var i = 0; i < lenreciever; i++) {
        if (reciever.rows(i).cells(0).firstChild.checked == true) {
            XMLStr = XMLStr + "<Reciever>"
            XMLStr = XMLStr + "<RecieverID>" + reciever.rows(i).cells(1).innerText + "</RecieverID>"
            XMLStr = XMLStr + "<RecieverType>P</RecieverType>"
            XMLStr = XMLStr + "</Reciever>"
        }
    }
    var lenScriptParameter = ScriptParameter.rows.length;
    var lenScriptParametercells = ScriptParameter.rows(0).cells.length;
    //            for (var j = 0; j < lenScriptParameter; j++) {
    XMLStr = XMLStr + "<Parameter>"
    for (var k = 0; k < lenScriptParameter; k++)
        XMLStr = XMLStr + "<P" + k + ">" + ScriptParameter.rows(k).cells(1).firstChild.value + "</P" + k + ">"

    XMLStr = XMLStr + "</Parameter>"
    //            }

    CreateStr()
    document.getElementById(MasterObj + "txtXMLSave").value = "<Root>" + XMLStr + strChk + "</Root>"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CreateStr() {
    strChk = "";
    var OGrid = document.getElementById("ScriptGroups");
    var oLen = OGrid.rows.length
    var type = ""
    for (var i = 0; i < oLen; i++) {
        if (OGrid.rows(i).cells(0).firstChild.checked) {
            if (OGrid.rows(i).cells(3).firstChild.title == "واحدسازماني")
                type = "D"
            else if (OGrid.rows(i).cells(3).firstChild.title == "گروه")
                type = "G"
            else if (OGrid.rows(i).cells(3).firstChild.title == "پرسنل")
                type = "U"
            strChk += "<TbCode>"
            strChk += "<CodeID>" + OGrid.rows(i).cells(1).innerText + "</CodeID>"
            strChk += "<type>" + type + "</type>"
            strChk += "<Selected>1</Selected>"
            strChk += "</TbCode>"
        }
    }

    if (document.getElementById(MasterObj + "chkAllPK").checked == true) {
        strChk += "<TbCode>"
        strChk += "<CodeID>AllPK</CodeID>"
        strChk += "<type>0</type>"
        strChk += "<Selected>1</Selected>"
        strChk += "</TbCode>"
    }
    if (document.getElementById(MasterObj + "chkEPK").checked == true) {
        strChk += "<TbCode>"
        strChk += "<CodeID>EPK</CodeID>"
        strChk += "<type>0</type>"
        strChk += "<Selected>1</Selected>"
        strChk += "</TbCode>"
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById("ScriptGroups");
    var oLen = OGrid.rows.length

    for (var i = 0; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        //OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnclickSelectAllChk(obj) {
    var OGrid = document.getElementById("reciever");
    var oLen = OGrid.rows.length

    for (var i = 0; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        //OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function checkNotEmpty() {
    if (document.getElementById(MasterObj + "cmbAlarmScripts").value == "0") {
        alert("لطفا قانون مورد نظر را انتخاب نمائيد")
        //document.getElementById(MasterObj + "cmbAlarmScripts").focus()
        return false;
    }
    return true;
}
              