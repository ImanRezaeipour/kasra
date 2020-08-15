Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

returnValue = "";
var strChk = "";
var grd = 0;
var MasterObj = "ctl00_ContentPlaceHolder1_";

BindGroupMember();

function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
//===================================
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    $get(MasterObj + "txtSubmit").value = "";
    if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
        document.getElementById('OToolBar_BtnOk').style.display = "none"
        document.getElementById('Table2').style.display = "none"
        var oGrid = GroupMember;
        Groups_Header.rows(0).cells(0).style.display = "none"
        for (var j = 0; j < oGrid.rows.length; j++)
            oGrid.rows(j).cells(0).style.display = "none"
    }
}
//==================================
if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
    document.getElementById('OToolBar_BtnOk').style.display = "none"

    document.getElementById('TDP').style.display = "none"
    document.getElementById('TDG').style.display = "none"
    document.getElementById('TDD').style.display = "none"

    document.getElementById('TDP1').style.display = "none"
    document.getElementById('TDG1').style.display = "none"
    document.getElementById('TDD1').style.display = "none"

    $get(MasterObj + "chkAllPK").disabled = "disabled"
    $get(MasterObj + "chkEPK").disabled = "disabled"
    $get(MasterObj + "chkAllPK1").disabled = "disabled"
    $get(MasterObj + "chkEPK1").disabled = "disabled"
    document.getElementById('OToolBar_BtnGroupMember').style.display = "none"
    var oGrid = GroupMember;
    Groups_Header.rows(0).cells(0).style.display = "none"
    for (var j = 0; j < oGrid.rows.length; j++)
        oGrid.rows(j).cells(0).style.display = "none"
    var oGrid1 = GroupMember1;
    Groups_Header1.rows(0).cells(0).style.display = "none"
    for (var j = 0; j < oGrid1.rows.length; j++)
        oGrid1.rows(j).cells(0).style.display = "none"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function BindGroupMember() {
   
    if ((document.getElementById(MasterObj + "txtGroupMemberXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtGroupMemberXML").value != "")) {
        var strXml = document.getElementById(MasterObj + "txtGroupMemberXML").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GroupMember[kind=0]");
        var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/AllGroup[kind=0]");

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
            var oGrid = GroupMember;
           
            addRow(MemberID, MemberName, type, 0)
        }
    }
    var oXmlNodesN = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GroupMember[kind=1]");
    var oXmlNodes1N = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/AllGroup[kind=1]");

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
                var oGrid = GroupMember1;

                addRow(MemberID, MemberName, type, 1)
            }
        }
    }
    if ($get(MasterObj + "chkEPK1").checked == true) {
        $get(MasterObj + "chkAllPK1").checked = false;
        $get(MasterObj + "chkAllPK1").disabled = true;
    }
    if ($get(MasterObj + "chkEPK").checked == true) {
        $get(MasterObj + "chkAllPK").checked = false;
        $get(MasterObj + "chkAllPK").disabled = true;
    }

    if ($get(MasterObj + "chkAllPK1").checked == true) {

        $get(MasterObj + "rdbDepartment1").checked = false;
        $get(MasterObj + "rdbGroup1").checked = false;
        $get(MasterObj + "rdbPerson1").checked = false;
        $get(MasterObj + "rdbCard1").checked = false;
        $get(MasterObj + "rdbOfficeTb1").checked = false;
        $get(MasterObj + "chkEPK1").checked = false;

        $get(MasterObj + "rdbDepartment1").disabled = true;
        $get(MasterObj + "rdbGroup1").disabled = true;
        $get(MasterObj + "rdbPerson1").disabled = true;
        $get(MasterObj + "rdbCard1").disabled = true;
        $get(MasterObj + "rdbOfficeTb1").disabled = true;
        $get(MasterObj + "chkEPK1").disabled = true;


    }
    if ($get(MasterObj + "chkAllPK").checked == true) {

        $get(MasterObj + "rdbDepartment").checked = false;
        $get(MasterObj + "rdbGroup").checked = false;
        $get(MasterObj + "rdbPerson").checked = false;
        $get(MasterObj + "rdbCard").checked = false;
        $get(MasterObj + "rdbOfficeTb").checked = false;
        $get(MasterObj + "chkEPK").checked = false;

        $get(MasterObj + "rdbDepartment").disabled = true;
        $get(MasterObj + "rdbGroup").disabled = true;
        $get(MasterObj + "rdbPerson").disabled = true;
        $get(MasterObj + "rdbCard").disabled = true;
        $get(MasterObj + "rdbOfficeTb").disabled = true;
        $get(MasterObj + "chkEPK").disabled = true;
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnGroupMember() {
    var strOptions = ""
    var url = ""
    var OUserFlag
    var kind = 0
    if ((document.getElementById(MasterObj + "rdbPerson").checked) && (grd == 0)) {

        OUserFlag = "U"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    else if ((document.getElementById(MasterObj + "rdbGroup").checked) && (grd == 0)) {

        OUserFlag = "G"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if ((document.getElementById(MasterObj + "rdbDepartment").checked) && (grd == 0)) {

        OUserFlag = "D"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }

    else if ((document.getElementById(MasterObj + "rdbCard").checked) && (grd == 0)) {

        OUserFlag = "C"
        kind = 0
        url = "/RstPresentation/App_Pages/OtherCard/SelectOtherCard.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }

    //------------------------دفتر تابل------------------------------
    else if ((document.getElementById(MasterObj + "rdbOfficeTb").checked) && (grd == 0)) {

        OUserFlag = "T"
        kind = 0
        url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById(MasterObj + "rdbPerson1").checked) {

        OUserFlag = "U"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    else if ((document.getElementById(MasterObj + "rdbGroup1").checked) && (grd == 1)) {

        OUserFlag = "G"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if ((document.getElementById(MasterObj + "rdbDepartment1").checked) && (grd == 1)) {

        OUserFlag = "D"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }
    else if ((document.getElementById(MasterObj + "rdbCard1").checked) && (grd == 1)) {

        OUserFlag = "C"
        kind = 1
        url = "/RstPresentation/App_Pages/OtherCard/SelectOtherCard.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
    }
    //------------------------دفتر تابل------------------------------
    else if ((document.getElementById(MasterObj + "rdbOfficeTb1").checked) && (grd == 1)) {

        OUserFlag = "T"
        kind = 1
        url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
    }
    //-------------------------------------------------------------------
    //-------------------------------------------------------
    var OSelectedMamber = "";

    if (url != "") {
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }

    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
        CreateGrid(OSelectedMamber, OUserFlag, kind);
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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

                case 'P':
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


                case 'C':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('CardCode').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('DisplayName').text;
                    break
                    //------------------------دفتر تابل------------------------------
                case 'T':
                    MemberID = xmlNodesTemp.item(i).selectSingleNode('TID').text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode('TName').text;
                    break
                    //---------------------------------------------------------------------------

            }

            addRow(MemberID, MemberName, Type, kind)

            addXML(MemberID, Type, kind)
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addXML(MemberID, Type, kind) {
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);

    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID=" + MemberID + " and type='" + Type + "' and kind='" + kind + "']");
    //========================================================
    if (oXmlNodes.length > 0) {
        oXmlNodes.item(0).selectSingleNode("Selected").text = 1
        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<Tb>"
        strChk += "<CodeID>" + MemberID + "</CodeID>"
        strChk += "<type>" + Type + "</type>"
        strChk += "<kind>" + kind + "</kind>"
        strChk += "<Selected>1</Selected>"

        strChk += "</Tb>"
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function addRow(MemberID, MemberName, type, kind) {
    var oGrid
    if (kind == 0)
        oGrid = GroupMember;
    else
        oGrid = GroupMember1;
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

        case "P":
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

        case "C":
            tempSrc = "../../App_Utility/Images/Icons/Restore.gif"
            picTitle = "کارتهای متفرقه"
            break

            // ------------------------دفتر تابل------------------------------
        case "T":
            tempSrc = "../../App_Utility/Images/Icons/Group.gif"
            picTitle = "دفترتابل"
            break

    }
    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
    oCell3.className = "XTabTable";
    oCell3.style.width = "60px"
    oCell3.align = "center"

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {
    window.close()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
    returnValue = strChk;
    //                                      alert(strChk)
    window.close();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkEPK(obj) {
    if ($get(MasterObj + "chkEPK").checked == true) {
        //                                $get(MasterObj + "rdbDepartment").disabled = true;
        //                                $get(MasterObj + "rdbGroup").disabled = true;
        //                                $get(MasterObj + "rdbPerson").disabled = true;
        $get(MasterObj + "chkAllPK").disabled = true;
        //                                $get(MasterObj + "rdbCard").disabled = true;
        //                                //------------------------دفتر تابل------------------------------
        //                                $get(MasterObj + "rdbOfficeTb").disabled = true;
        //                                //------------------------------------------------
        //                                $get(MasterObj + "rdbDepartment").checked = false;
        //                                $get(MasterObj + "rdbGroup").checked = false;
        //                                $get(MasterObj + "rdbPerson").checked = false;
        $get(MasterObj + "chkAllPK").checked = false;
        //                                $get(MasterObj + "rdbCard").checked = false;
        //------------------------دفتر تابل------------------------------
        //                                $get(MasterObj + "rdbOfficeTb").checked = false;
        //-----------------------------------------
    }
    else {
        $get(MasterObj + "rdbDepartment").disabled = false;
        $get(MasterObj + "rdbGroup").disabled = false;
        $get(MasterObj + "rdbPerson").disabled = false;
        $get(MasterObj + "chkAllPK").disabled = false;
        $get(MasterObj + "rdbCard").disabled = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb").disabled = false;
        //--------------------------------------------------
    }
    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes
    if (obj.id == MasterObj + "chkEPK")
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='EPK' and type='0' and kind='0']");
    else
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='EPK' and type='0' and kind='1']");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (obj.checked == true)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1
        else
            oXmlNodes.item(0).selectSingleNode("Selected").text = 0

        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<Tb>";
        strChk += "<CodeID>EPK</CodeID>";
        strChk += "<type>0</type>";
        if (obj.id == MasterObj + "chkEPK")
            strChk += "<kind>0</kind>";
        else
            strChk += "<kind>1</kind>";
        if (obj.checked == false)
            strChk += "<Selected>0</Selected>";
        else
            strChk += "<Selected>1</Selected>";

        strChk += "</Tb>";

    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkEPK1(obj) {
    if ($get(MasterObj + "chkEPK1").checked == true) {
        //                                $get(MasterObj + "rdbDepartment1").disabled = true;
        //                                $get(MasterObj + "rdbGroup1").disabled = true;
        //                                $get(MasterObj + "rdbPerson1").disabled = true;
        $get(MasterObj + "chkAllPK1").disabled = true;
        //                                $get(MasterObj + "rdbCard1").disabled = true;
        //                                //------------------------دفتر تابل------------------------------
        //                                $get(MasterObj + "rdbOfficeTb1").disabled = true;
        //                                //------------------------------------------------
        //                                $get(MasterObj + "rdbDepartment1").checked = false;
        //                                $get(MasterObj + "rdbGroup1").checked = false;
        //                                $get(MasterObj + "rdbPerson1").checked = false;
        $get(MasterObj + "chkAllPK1").checked = false;
        //                                $get(MasterObj + "rdbCard1").checked = false;
        //                                //------------------------دفتر تابل------------------------------
        //                                $get(MasterObj + "rdbOfficeTb1").checked = false;
        //                                //-----------------------------------------
    }
    else {
        $get(MasterObj + "rdbDepartment1").disabled = false;
        $get(MasterObj + "rdbGroup1").disabled = false;
        $get(MasterObj + "rdbPerson1").disabled = false;
        $get(MasterObj + "chkAllPK1").disabled = false;
        $get(MasterObj + "rdbCard1").disabled = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb1").disabled = false;
        //--------------------------------------------------
    }
    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes
    if (obj.id == MasterObj + "chkEPK")
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='EPK' and type='0' and kind='0']");
    else
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='EPK' and type='0' and kind='1']");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (obj.checked == true)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1
        else
            oXmlNodes.item(0).selectSingleNode("Selected").text = 0

        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<Tb>";
        strChk += "<CodeID>EPK</CodeID>";
        strChk += "<type>0</type>";
        if (obj.id == MasterObj + "chkEPK")
            strChk += "<kind>0</kind>";
        else
            strChk += "<kind>1</kind>";
        if (obj.checked == false)
            strChk += "<Selected>0</Selected>";
        else
            strChk += "<Selected>1</Selected>";

        strChk += "</Tb>";
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkAllPK(obj) {

    if ($get(MasterObj + "chkAllPK").checked == true) {
        $get(MasterObj + "rdbDepartment").disabled = true;
        $get(MasterObj + "rdbGroup").disabled = true;
        $get(MasterObj + "rdbPerson").disabled = true;
        $get(MasterObj + "chkEPK").disabled = true;
        $get(MasterObj + "rdbCard").disabled = true;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb").disabled = true;
        //----------------------------------------------
        $get(MasterObj + "rdbDepartment").checked = false;
        $get(MasterObj + "rdbGroup").checked = false;
        $get(MasterObj + "rdbPerson").checked = false;
        $get(MasterObj + "chkEPK").checked = false;
        $get(MasterObj + "rdbCard").checked = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb").checked = false;
        //-----------------------------------------------
    }
    else {
        $get(MasterObj + "rdbDepartment").disabled = false;
        $get(MasterObj + "rdbGroup").disabled = false;
        $get(MasterObj + "rdbPerson").disabled = false;
        $get(MasterObj + "chkEPK").disabled = false;
        $get(MasterObj + "rdbCard").disabled = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb").disabled = false;
        //---------------------------------------------
    }

    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes;
    if (obj.id == MasterObj + "chkAllPK")
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='AllPK' and type='0' and kind='0']");
    else
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='AllPK' and type='0' and kind='1']");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (obj.checked == true)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1
        else
            oXmlNodes.item(0).selectSingleNode("Selected").text = 0

        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {

        strChk += "<Tb>";
        strChk += "<CodeID>AllPK</CodeID>";
        strChk += "<type>0</type>";
        if (obj.id == MasterObj + "chkAllPK")
            strChk += "<kind>0</kind>";
        else
            strChk += "<kind>1</kind>";
        if (obj.checked == false)
            strChk += "<Selected>0</Selected>";
        else
            strChk += "<Selected>1</Selected>";

        strChk += "</Tb>";
        var oGrid = document.getElementById("GroupMember");

        var oLen = oGrid.rows.length;
        for (var i = 0; i < oLen; i++) {
            oGrid.rows(i).cells(0).firstChild.checked = false;
            OnClickChk(oGrid.rows(i).cells(0).firstChild);
        }
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickchkAllPK1(obj) {
   
    if ($get(MasterObj + "chkAllPK1").checked == true) {
        $get(MasterObj + "rdbDepartment1").disabled = true;
        $get(MasterObj + "rdbGroup1").disabled = true;
        $get(MasterObj + "rdbPerson1").disabled = true;
        $get(MasterObj + "chkEPK1").disabled = true;
        $get(MasterObj + "rdbCard1").disabled = true;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb1").disabled = true;
        //----------------------------------------------
        $get(MasterObj + "rdbDepartment1").checked = false;
        $get(MasterObj + "rdbGroup1").checked = false;
        $get(MasterObj + "rdbPerson1").checked = false;
        $get(MasterObj + "chkEPK1").checked = false;
        $get(MasterObj + "rdbCard1").checked = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb1").checked = false;
        //-----------------------------------------------
    }
    else {
        $get(MasterObj + "rdbDepartment1").disabled = false;
        $get(MasterObj + "rdbGroup1").disabled = false;
        $get(MasterObj + "rdbPerson1").disabled = false;
        $get(MasterObj + "chkEPK1").disabled = false;
        $get(MasterObj + "rdbCard1").disabled = false;
        //------------------------دفتر تابل------------------------------
        $get(MasterObj + "rdbOfficeTb1").disabled = false;
        //---------------------------------------------
    }

    //========================================================
    var strXml = "<Root>" + strChk + "</Root>"

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(strXml);
    var oXmlNodes
    if (obj.id == MasterObj + "chkAllPK")
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='AllPK' and type='0' and kind='0']");
    else
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID='AllPK' and type='0' and kind='1']");
    //========================================================
    if (oXmlNodes.length > 0) {
        if (obj.checked == true)
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1
        else
            oXmlNodes.item(0).selectSingleNode("Selected").text = 0

        strXml = oXmlDoc.xml;
        strChk = strXml.replace("<Root>", "");
        strChk = strChk.replace("</Root>", "");
    }
    else {
        strChk += "<Tb>";
        strChk += "<CodeID>AllPK</CodeID>";
        strChk += "<type>0</type>";
        if (obj.id == MasterObj + "chkAllPK")
            strChk += "<kind>0</kind>";
        else
            strChk += "<kind>1</kind>";
        if (obj.checked == false)
            strChk += "<Selected>0</Selected>";
        else
            strChk += "<Selected>1</Selected>";
        strChk += "</Tb>";

        var oGrid = document.getElementById("GroupMember1");

        var oLen = oGrid.rows.length;
        for (var i = 0; i < oLen; i++) {
            oGrid.rows(i).cells(0).firstChild.checked = false;
            OnClickChk(oGrid.rows(i).cells(0).firstChild);
        }
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById("GroupMember");

    if (obj.id == "chkAll1")
        OGrid = document.getElementById("GroupMember1");

    var oLen = OGrid.rows.length
    for (var i = 0; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {

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
    if (oGrid.id == "GroupMember")
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='0']");
    else
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='1']");
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
        strChk += "<Tb>"
        strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
        strChk += "<type>" + oGrid.rows(oIndex).type + "</type>"
        if (oGrid.id == "GroupMember")
            strChk += "<kind>0</kind>"
        else
            strChk += "<kind>1</kind>"
        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
            strChk += "<Selected>0</Selected>"
        else
            strChk += "<Selected>1</Selected>"

        strChk += "</Tb>"
    }

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function OnClickrdb(obj) {
    grd = 0;
    if ($get(MasterObj + "rdbDepartment").checked == true || $get(MasterObj + "rdbGroup").checked == true
|| $get(MasterObj + "rdbPerson").checked == true || $get(MasterObj + "rdbCard").checked == true || $get(MasterObj + "rdbOfficeTb").checked == true) {
        //                $get(MasterObj + "chkEPK").checked = false;
        $get(MasterObj + "chkAllPK").checked = false;
        $get(MasterObj + "chkAllPK").disabled = true;

    }
    //            else {
    //                $get(MasterObj + "chkEPK").checked = true;
    //                $get(MasterObj + "chkAllPK").checked = true;
    //            }           
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickrdb1(obj) {
    grd = 1;
    if ($get(MasterObj + "rdbDepartment1").checked == true || $get(MasterObj + "rdbGroup1").checked == true
|| $get(MasterObj + "rdbPerson1").checked == true || $get(MasterObj + "rdbCard1").checked == true || $get(MasterObj + "rdbOfficeTb1").checked == true) {
        //               $get(MasterObj + "chkEPK1").checked = false;
        $get(MasterObj + "chkAllPK1").checked = false;
        $get(MasterObj + "chkAllPK1").disabled = true;
    }
    //            else {
    //                $get(MasterObj + "chkEPK1").checked = true;
    //                $get(MasterObj + "chkAllPK1").checked = true;
    //            }           
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
    returnValue = strChk;
    //                                      alert(strChk)
    window.close();
}