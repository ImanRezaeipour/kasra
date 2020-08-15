var LastSelectedRow = null
var LastSelectedRowClass = "";
var PageSize = 10000000000;
var OSelectedMamber = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";
document.getElementsByTagName("body")[0].scroll = "no";

$get(MasterObj + "txtSaveXml").value = "<Root></Root>";
$get(MasterObj + "txtXMLNames").value = "<Root><G></G><P></P><D></D><T></T></Root>";

//====================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {
}
//====================================================================================
function EndRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value;
    if ($get(MasterObj + "txtValidate").value == "0")
        alert($get(MasterObj + "txtAlert").value);
    else
        alert($get(MasterObj + "txtAlert").value);
    CreateGrid("First");
}
//***********************************گرید********************************************
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function ClearRowGrid() {
    var oGrid = XTabTable
    while (oGrid.rows.length > 0) {
        oGrid.deleteRow(oGrid.rows.length - 1);
    }
}
//*******************************************************************************
function CreateGrid(direction) {
    ClearRowGrid()
    if ($get(MasterObj + "txtXMLNames").value != "<Root><G></G><P></P><D></D><T></T></Root>") {

        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + "txtXMLNames").value)

        var xmlNodesG = oXmlDoc.documentElement.selectNodes("/Root/G/All")
        var xmlNodesD = oXmlDoc.documentElement.selectNodes("/Root/D/All")
        var xmlNodesT = oXmlDoc.documentElement.selectNodes("/Root/T/All")
        var xmlNodesP = oXmlDoc.documentElement.selectNodes("/Root/P/All")

        var PNum, GNum, DNum, TNum
        PNum = xmlNodesP.length;
        DNum = xmlNodesD.length;
        TNum = xmlNodesT.length;
        GNum = xmlNodesG.length;

        $get(MasterObj + "lblTotal").value = PNum + GNum + DNum + TNum;

        //================================Paging
        var totalRecords
        totalRecords = $get(MasterObj + "lblTotal").value;
        $get(MasterObj + "Totalpage").value = Math.ceil(totalRecords / PageSize)

        if (totalRecords > 0) {
            currentPage_X = parseInt((($get(MasterObj + "txtCurPage").value == "") ? "1" : $get(MasterObj + "txtCurPage").value))

            switch (direction) {
                case "Const":
                    currentPage_X = currentPage_X
                    break
                case "Next":
                    currentPage_X = parseInt(currentPage_X) + 1
                    break
                case "Previous":
                    currentPage_X = parseInt(currentPage_X) - 1
                    break
                case "First":
                    currentPage_X = 1
                    break
                case "Last":
                    currentPage_X = parseInt($get(MasterObj + "Totalpage").value)
                    break
            }
            var endFor
            if (currentPage_X * PageSize - 1 < 0)
                return
            if (totalRecords <= currentPage_X * PageSize - 1)
                endFor = totalRecords - 1
            else
                endFor = parseInt(currentPage_X) * PageSize - 1
            //====================================================
            $get(MasterObj + "txtCurPage").value = currentPage_X
            $get(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
            $get(MasterObj + "lblTo").value = endFor + 1;
            //====================================================


            var oXmlSaveDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlSaveDocTemp.async = "false";
            oXmlSaveDocTemp.loadXML($get(MasterObj + "txtSaveXml").value)
            var Temp;


            var i = (currentPage_X - 1) * PageSize
            for (; i <= endFor; i++) {
                if (i < PNum) {
                    Temp = oXmlSaveDocTemp.documentElement.selectNodes("P[ID=" + xmlNodesP.item(i).selectSingleNode("ID").text + "]").length > 0 ? 1 : 0;
                    var Param = "" + xmlNodesP.item(i).selectSingleNode("ID").text + "," + xmlNodesP.item(i).selectSingleNode("N").text + ",";
                    AddToGrid("ID", xmlNodesP.item(i).selectSingleNode("ID").text, "Name", xmlNodesP.item(i).selectSingleNode("N").text, "Type", "P", Param, Temp)

                }
                else if (i < PNum + GNum) {
                    Temp = oXmlSaveDocTemp.documentElement.selectNodes("G[ID=" + xmlNodesG.item(i - PNum).selectSingleNode("ID").text + "]").length > 0 ? 1 : 0;
                    var Param = "" + xmlNodesG.item(i - PNum).selectSingleNode("ID").text + "," + xmlNodesG.item(i - PNum).selectSingleNode("N").text + ",";
                    AddToGrid("ID", xmlNodesG.item(i - PNum).selectSingleNode("ID").text, "Name", xmlNodesG.item(i - PNum).selectSingleNode("N").text, "Type", "G", Param, Temp)

                }
                else if (i < PNum + GNum + DNum) {
                    Temp = oXmlSaveDocTemp.documentElement.selectNodes("D[ID=" + xmlNodesD.item(i - PNum - GNum).selectSingleNode("ID").text + "]").length > 0 ? 1 : 0;
                    var Param = "" + xmlNodesD.item(i - PNum - GNum).selectSingleNode("ID").text + "," + xmlNodesD.item(i - PNum - GNum).selectSingleNode("N").text + ",";
                    AddToGrid("ID", xmlNodesD.item(i - PNum - GNum).selectSingleNode("ID").text, "Name", xmlNodesD.item(i - PNum - GNum).selectSingleNode("N").text, "Type", "D", Param, Temp)

                }
                else {
                    Temp = oXmlSaveDocTemp.documentElement.selectNodes("T[ID=" + xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("ID").text + "]").length > 0 ? 1 : 0;
                    var Param = "" + xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("ID").text + "," + xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("N").text + ",";
                    AddToGrid("ID", xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("ID").text, "Name", xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("N").text, "Type", "T", Param, Temp)
                }
            }
            $get("chkAll").checked = ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "P") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "G") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "D") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "T");
        }
        else {
            //====================================================
            $get(MasterObj + "txtCurPage").value = "0";
            $get(MasterObj + "lblFrom").value = "0";
            $get(MasterObj + "lblTo").value = "0";
            $get(MasterObj + "Totalpage").value = "0";
            $get(MasterObj + "lblTotal").value = "0";
            //====================================================
        }
    }
}
//*******************************************************************************
function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, Param, CheckState) {
    var oGrid = XTabTable;
    var oRow = oGrid.insertRow();

    oRow.setAttribute(AttrName1, AttrValue1) //ID            
    oRow.setAttribute(AttrName2, AttrValue2) //Name
    oRow.setAttribute(AttrName3, AttrValue3) //Type

    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle"
    else
        oRow.className = "CssAlternatingItemStyle";

    var x = 0;
    var p = new String;
    var val = "";
    var val1 = CheckState;
    while (x < getCntChar(",", Param)) {
        val = getArray(Param, x, ",")

        switch (x) {
            case 0:
                var oCell0 = oRow.insertCell();
                oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this,-1)' " + ((val1 == 1) ? " checked >" : ">");
                oCell0.className = "XTabTable";
                oCell0.style.width = "25px"
                oCell0.align = "center"
                break

            case 1:
                var tempSrc = "";
                var picTitle = "";
                switch (AttrValue3) {
                    case "P":
                        tempSrc = "../../../App_Utility/Images/Icons/Personel.gif"
                        picTitle = "پرسنل"
                        break
                    case "G":
                        tempSrc = "../../../App_Utility/Images/Icons/PGroup.gif"
                        picTitle = "گروه"
                        break
                    case "D":
                        tempSrc = "../../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                        picTitle = "واحدسازماني"
                        break
                    case "T":
                        tempSrc = "../../../App_Utility/Images/Icons/Group.gif"
                        picTitle = "دفاتر تابل"
                        break
                }
                var oCell1 = oRow.insertCell();
                oCell1.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
                oCell1.className = "XTabTable";
                oCell1.style.width = "40px"
                oCell1.align = "right"

                var oCell2 = oRow.insertCell();
                oCell2.innerText = ((val.length > 30) ? val.substring(0, 25) + "..." : val);
                oCell2.title = val;
                oCell2.style.width = "300px"
                oCell2.align = "right";

                break
        }

        x = x + 1;
    }

}
//*******************************************************************************
function OnClickChk(obj) {
    var SelectedRowID
    var SelectedRowType
    SelectedRowID = obj.parentElement.parentElement.ID;
    SelectedRowType = obj.parentElement.parentElement.Type;

    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //اصلی
    xmlDoc.async = "false";
    xmlDoc.loadXML($get(MasterObj + "txtXMLNames").value);

    var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//انتخاب شده ها
    oXmlSaveDoc.async = "false";
    oXmlSaveDoc.loadXML($get(MasterObj + "txtSaveXml").value)

    var OXmlNode = oXmlSaveDoc.documentElement.selectNodes("/Root/" + SelectedRowType + "[ID=" + SelectedRowID + "]");

    if (obj.checked == true & OXmlNode.length == 0) {
        var oXmlSaveDocTemp = new ActiveXObject("Microsoft.XMLDOM")
        oXmlSaveDocTemp.async = "false";
        oXmlSaveDocTemp.loadXML("<Root><" + SelectedRowType + "><ID>" + SelectedRowID + "</ID></" + SelectedRowType + "></Root>")
        var OXmlNodeTemp = oXmlSaveDocTemp.documentElement.selectNodes("/Root/" + SelectedRowType)
        oXmlSaveDoc.childNodes[0].appendChild(OXmlNodeTemp.item(0));
        $get("chkAll").checked = ISCheckAll(xmlDoc, oXmlSaveDoc, "P") && ISCheckAll(xmlDoc, oXmlSaveDoc, "G") && ISCheckAll(xmlDoc, oXmlSaveDoc, "D") && ISCheckAll(xmlDoc, oXmlSaveDoc, "T");
    }
    else if (obj.checked == false & OXmlNode.length != 0) {
        var f = oXmlSaveDoc.documentElement.removeChild(OXmlNode.item(0))
        $get("chkAll").checked = false;
    }
    $get(MasterObj + "txtSaveXml").value = oXmlSaveDoc.xml;

}
//=========================================ToolBar=============================
function OnClickBtnSaveBackup() {
    if (CheckDate()) {
        if ($get(MasterObj + "txtSaveXml").value == ""
         || $get(MasterObj + "txtSaveXml").value == "<Root/>" 
         || $get(MasterObj + "txtSaveXml").value == "<Root></Root>") {
            alert("اعضاي مورد نظر را انتخاب نماييد")
            return
        }
        else {
            url = "SelectMiniBackupPath.aspx"
            strOptions = "dialogHeight: 200px;dialogWidth:500px;center: Yes;help: no;status: no"
            returnValue = window.showModalDialog(url, "", strOptions);
            if (returnValue != undefined && returnValue != "") {
                $get(MasterObj + "txtMiniBackupPath").value = returnValue.split('#')[0];
                $get(MasterObj + "txtDBName").value = returnValue.split('#')[1];
                $get(MasterObj + "txtSubmit").value = "CreateTransferDB";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
    }
}
//*******************************************************************************
function OnClickBtnSendBackup() {
    url = "SelectMiniBackupPath.aspx"
    strOptions = "dialogHeight: 200px;dialogWidth:500px;center: Yes;help: no;status: no"
    returnValue = window.showModalDialog(url, "", strOptions);
    if (returnValue != undefined && returnValue != "") {
        $get(MasterObj + "txtMiniBackupPath").value = returnValue.split('#')[0];
        $get(MasterObj + "txtDBName").value = returnValue.split('#')[1];
        $get(MasterObj + "txtSubmit").value = "CreateBackupDB";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//*******************************************************************************
function OnclickSelectAllChk(obj) {
    var oGrid = XTabTable;
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    xmlDoc.loadXML($get(MasterObj + "txtXMLNames").value);

    $get(MasterObj + "txtSaveXml").value = "<Root></Root>";

    var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlSaveDoc.async = "false";
    oXmlSaveDoc.loadXML($get(MasterObj + "txtSaveXml").value)

    var Glen = oGrid.rows.length
    for (var j = 0; j < Glen; j++) {
        oGrid.rows(j).cells(0).firstChild.checked = obj.checked;
    }
    if (obj.checked) {
        oXmlSaveDoc = SetChecked(xmlDoc, "P", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "G", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "D", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "T", oXmlSaveDoc);
        $get(MasterObj + "txtSaveXml").value = oXmlSaveDoc.xml;
    }
}
//=========================================================================
function SetChecked(xmlDoc, Type, xmlSaveDoc) {
    var xmlNodesTemp = xmlDoc.documentElement.selectNodes("/Root/" + Type + "/All");

    for (var i = 0; i < xmlNodesTemp.length; i++) {
        var oXmlDocTemp2 = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocTemp2.async = "false";
        oXmlDocTemp2.loadXML("<Root><" + Type + "><ID>" + xmlNodesTemp.item(i).selectSingleNode("ID").text + "</ID></" + Type + "></Root>")
        var xmlNodesTemp2 = oXmlDocTemp2.documentElement.selectNodes("/Root/" + Type);
        xmlSaveDoc.childNodes[0].appendChild(xmlNodesTemp2.item(0));
    }
    return xmlSaveDoc
}
//=========================================================================
function ModifyXML(Type) {
    // دفاتر تابل :T , واحد سازمانی  :D گروه:G  پرسنل:P             
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")//xml اصلی
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + "txtXMLNames").value)
    var xmlNodes;
    //--------------------------------------
    if (Type == "D")
        OSelectedMamber = OSelectedMamber.substr(3, OSelectedMamber.length - 3);
    var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")//xml انتخاب شده
    oXmlDocTemp.async = "false";
    oXmlDocTemp.loadXML(OSelectedMamber)
    var xmlNodesTemp = oXmlDocTemp.documentElement.selectNodes("/Root/Tb")
    //--------------------------------------
    var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//تیک خورده ها 
    oXmlSaveDoc.async = "false";
    oXmlSaveDoc.loadXML($get(MasterObj + "txtSaveXml").value)
    var OXmlNodeSave = oXmlSaveDoc.documentElement.selectNodes("/Root/" + Type);

    //---------------------------------------
    if (xmlNodesTemp.length > 0) {
        for (var i = 0; i < xmlNodesTemp.length; i++) {
            var MemberID, MemberName;
            switch (Type) {
                case "P":
                    MemberID = xmlNodesTemp.item(i).selectSingleNode("PID").text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode("PName").text;
                    break
                case "G":
                    MemberID = xmlNodesTemp.item(i).selectSingleNode("GroupId").text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode("GroupName").text;
                    break

                case "D":
                    MemberID = xmlNodesTemp.item(i).selectSingleNode("DID").text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode("DName").text;
                    break

                case "T":
                    MemberID = xmlNodesTemp.item(i).selectSingleNode("TID").text;
                    MemberName = xmlNodesTemp.item(i).selectSingleNode("TName").text;
                    break
            }
            var xmlRepeateNodes = oXmlDoc.documentElement.selectNodes(Type + "/All[ID= " + MemberID + "]");
            if (xmlRepeateNodes.length == 0) {

                var oXmlDocTemp1 = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocTemp1.async = "false";
                oXmlDocTemp1.loadXML("<Root><" + Type + "><All><ID>" + MemberID + "</ID><N>" + MemberName + "</N></All></" + Type + "></Root>")
                var xmlNodesTemp1 = oXmlDocTemp1.documentElement.selectNodes("/Root/" + Type + "/All");
                xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/" + Type);
                xmlNodes.item(0).appendChild(xmlNodesTemp1.item(0));

                var oXmlDocTemp2 = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocTemp2.async = "false";
                oXmlDocTemp2.loadXML("<Root><" + Type + "><ID>" + MemberID + "</ID></" + Type + "></Root>")
                var xmlNodesTemp2 = oXmlDocTemp2.documentElement.selectNodes("/Root/" + Type);
                oXmlSaveDoc.childNodes[0].appendChild(xmlNodesTemp2.item(0));

            }
        }
    }
    $get(MasterObj + "txtXMLNames").value = oXmlDoc.xml;
    $get(MasterObj + "txtSaveXml").value = oXmlSaveDoc.xml;
}

//*******************************************************************************
function OnClickBtnShowMember() {
    var strOptions = ""
    var url
    var OUserFlag

    if (document.getElementById("RadioPrs").checked) {
        OUserFlag = "P"
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById("RadioGR").checked) {

        OUserFlag = "G"
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById("RadioTab").checked) {
        OUserFlag = "T"
        url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
        strOptions = "dialogHeight: 600px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if (document.getElementById("RadioDep").checked) {

        OUserFlag = "D"
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }

    //-------------------------------------------------------
    if (url != "") {
        OSelectedMamber = "";
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
        if (document.getElementById("XTabTable").rows.length > 0) {
            if (confirm("پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟"))
                $get(MasterObj + "txtXMLNames").value = "<Root><G></G><P></P><D></D><T></T></Root>";
        }
        //----------------------------------------------------------
        ModifyXML(OUserFlag);
        if (OSelectedMamber != "") {
            CreateGrid("First");
        }
    }
}
//*******************************************************************************
function CheckDate() {
    $get(MasterObj + "txtSDate").value = $get(MasterObj + "KcalSDate_txtYear").value + "/" + $get(MasterObj + "KcalSDate_txtMonth").value + "/" + $get(MasterObj + "KcalSDate_txtDay").value;
    $get(MasterObj + "txtEDate").value = $get(MasterObj + "KcalEDate_txtYear").value + "/" + $get(MasterObj + "KcalEDate_txtMonth").value + "/" + $get(MasterObj + "KcalEDate_txtDay").value;

    if ($get(MasterObj + "KcalSDate_txtYear").value == "" || $get(MasterObj + "KcalSDate_txtMonth").value == "" || $get(MasterObj + "KcalSDate_txtDay").value == "") {
        alert("تاریخ شروع را وارد نمایید")
        return false;
    }
    else if ($get(MasterObj + "KcalEDate_txtYear").value == "" || $get(MasterObj + "KcalEDate_txtMonth").value == "" || $get(MasterObj + "KcalEDate_txtDay").value == "") {
        alert("تاریخ خاتمه را وارد نمایید")
        return false;
    }
    else if ($get(MasterObj + "txtSDate").value > $get(MasterObj + "txtEDate").value) {
        alert("تاریخ شروع باید از تاریخ خاتمه کوچکتر باشد")
        return false;
    }
    return true;
}
//*******************************************************************************
function ISCheckAll(xmlDoc, oXmlSaveDoc, Type) {
    var flag = true;
    var i = 0;
    var xmlNodesTemp = xmlDoc.documentElement.selectNodes("/Root/" + Type + "/All");
    while (flag && i < xmlNodesTemp.length) {
        var xmlNodesTemp2 = oXmlSaveDoc.documentElement.selectNodes(Type + "[ID=" + xmlNodesTemp.item(i).selectSingleNode("ID").text + "]");
        flag = xmlNodesTemp2.length > 0 ? true : false;
        i++;
    }
    return flag
}
//========================================================
function OnClickBtnHelp() {
    window.open("../../../App_Utility/Images/BaseInfo/MiniInstalHelp.docx");
}
//=======================================================