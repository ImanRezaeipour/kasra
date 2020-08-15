window.document.title = "انتخاب گروه";
//*************************************Declaration*************************************
var str = "<Root></Root>";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var LastSelectedRow = ""
var LastSelectedRowClass = "";
//if (str2 != "" || str2 != "<Root></Root>" || str2 != "<Root/>") {
//    var str2 = document.getElementById(MasterObj + "txtHidden").value
//}
//MakeXml();
//=========================================================
if ($get(MasterObj + "txtGroupMode").value == "1")
    $get("TBAndGroup").style.display = "inline";
else
    $get("TBAndGroup").style.display = "none";
//========================================================

if ($get(MasterObj + "txtChkGroup").value == "1")
    $get(MasterObj + "ChkAndGroup").checked = true;
else
    $get(MasterObj + "ChkAndGroup").checked = false;
//*************************************EndDeclaration*************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//==========================================================
function BeginRequestHandler(sender, args) {

}
//==========================================================
function EndRequestHandler(sender, args) {

    var StrVal = $get(MasterObj + "txtSubmit").value

    if (StrVal != "") {
        if ($get(MasterObj + "lblTo").value == "") {
            document.getElementById('OToolBar_txtFromData').value = "";
            document.getElementById('OToolBar_txtToData').value = "";
            document.getElementById('OToolBar_txtTotalData').value = "";

            document.getElementById('OToolBar_BtnNext').disabled = true;
            document.getElementById('OToolBar_BtnPrv').disabled = true;
            document.getElementById('OToolBar_BtnFirst').disabled = true;
            document.getElementById('OToolBar_BtnLast').disabled = true;
        }
        else if ($get(MasterObj + "lblTo").value != "") {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;

            if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                document.getElementById('OToolBar_BtnPrv').disabled = false;

            document.getElementById('OToolBar_BtnFirst').disabled = false;
            document.getElementById('OToolBar_BtnLast').disabled = false;
        }
        if (StrVal != "Search")
            SetChk()
        if (StrVal == "Search") {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        }
    }
    $get(MasterObj + "txtSubmit").value = "";
}
//*************************************OnLoad*************************************
window.name = "selectGroup.aspx"
aspnetForm.target = "selectGroup.aspx"
returnValue = "";
//***********************************************************************************
var ParentDialog = window.dialogArguments;
if ($get(MasterObj + "ParentPage").value == "DefineSetting")
    $get(MasterObj + "txtSelectedGroup").value = ParentDialog.$get(MasterObj + "txtSelectedGroupFromParent").value;
//----------------------------------------------------------------------------------
if ($get(MasterObj + "ParentPage").value == "DefineSetting") {
    str = "<Root>" + $get(MasterObj + "txtSelectedGroup").value + "</Root>";
    SetChk();
}
//----------------------------------------------------------------------------------
if ($get(MasterObj + "txtHidden").value != "") {
    //    str = "<Root>" + $get(MasterObj + "txtHidden").value + "</Root>";
    str = $get(MasterObj + "txtHidden").value;
    SetChk();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
document.getElementById('OToolBar_BtnPrv').disabled = true;
document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
    document.getElementById('OToolBar_BtnNext').disabled = true
else
    document.getElementById('OToolBar_BtnNext').disabled = false;
//**********************************EndOnLoad*************************************

//*************************************Toolbar*************************************
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage() {
    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (document.getElementById(MasterObj + "SelCategory").value != '' || document.getElementById(MasterObj + "SelCategory").value != 0) {
        document.getElementById(MasterObj + "txtCategoryID").value = document.getElementById(MasterObj + "SelCategory").value
        document.getElementById(MasterObj + "txtGroupID").value = document.getElementById(MasterObj + "CmbGroupName").value

        document.getElementById(MasterObj + "txtSubmit").value = "Search";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {

    if (document.getElementById(MasterObj + "txtType").value == "Radio") {
        var OGrid = document.getElementById("GrdGroup");
        var CurPage = document.getElementById(MasterObj + "txtCurPage").value
        var GroupID = LastSelectedRow.GroupID;
        str += "<Tb>"
        str += "<GroupId>" + GroupID + "</GroupId>"
        str += "<GroupName>" + LastSelectedRow.cells(0).innerText + "</GroupName>"
        str += "</Tb>"
    }

    str = str.replace("<Root>", "");
    str = str.replace("</Root>", "");

    if ($get(MasterObj + "txtGroupMode").value == "1") {
        if ($get(MasterObj + "ChkAndGroup").checked == true) {
            str += "<TbAnd>"
            str += "<Selected>1</Selected>"
            str += "</TbAnd>"
        }
        else {
            str += "<TbAnd>"
            str += "<Selected>0</Selected>"
            str += "</TbAnd>"
        }
    }

    str = "<Root>" + str + "</Root>";

    returnValue = str
    //    alert(returnValue)
    window.close();
}
//*************************************EndToolbar*************************************
//function OnclickChkAndGroup(obj) {
//    if (obj.checked) {
//    }
//}
//*************************************ThisPage***************************************

function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickHeaderChk(obj) {
    var OGrid = document.getElementById("GrdGroup");
    var oLen = OGrid.rows.length;
    for (var i = 1; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
        OnClickChk(OGrid.rows(i).cells(0).firstChild);
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    var OGrid = document.getElementById("GrdGroup");
    var RowIndex = obj.parentElement.parentElement.rowIndex;
    var TbObj = obj.parentElement.parentElement.parentElement.parentElement
    var PID = TbObj.rows(RowIndex).getAttribute("GroupID")
    var CID = TbObj.rows(RowIndex).getAttribute("CategoryID")

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(str);
    var oXmlNodes;

    if ($get(MasterObj + "ParentPage").value == "ControlRuleMember" & obj.checked) {
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [CID!=" + CID + "]");
        if (oXmlNodes.length != 0) {
            alert("گروههاي انتخاب شده جهت انتساب به يک قانون بايد متعلق به يک دسته بندي باشند")
            obj.checked = false;
            return;
        }
    }
    oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [GroupId=" + PID + "]");

    if (oXmlNodes.length == 0 & obj.checked == true) {
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocTemp.async = "false";
        var Str = OGrid.rows(RowIndex).cells(1).firstChild.title != "" ? OGrid.rows(RowIndex).cells(1).firstChild.title : OGrid.rows(RowIndex).cells(1).innerText
        oXmlDocTemp.loadXML("<Root><Tb><GroupId>" + PID + "</GroupId><GroupName>" + Str + "</GroupName><CID>" + OGrid.rows(RowIndex).getAttribute("CategoryID") + "</CID></Tb></Root>");
        var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);

    }
    else if (oXmlNodes.length > 0 & obj.checked == false) {

        var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[GroupId=" + PID + "]");
        var f = oXmlDoc.documentElement.removeChild(oXmlNodeTemp);

    }
    str = oXmlDoc.xml
}

//***********************************************************************

function SetChk() {
    var oXml = new ActiveXObject("Microsoft.XMLDOM");
    oXml.async = "false";
    oXml.loadXML(str);
    var XmlNode = oXml.documentElement.selectNodes("/Root/Tb");
    //    alert("setchk"+str)
    if (XmlNode.length != 0) {
        var OGrid = document.getElementById("GrdGroup")
        if (OGrid != null)
            for (var i = 1; i < OGrid.rows.length; i++) {
                var XmlNode1 = oXml.documentElement.selectNodes("Tb[GroupId=" + OGrid.rows(i).getAttribute("GroupId") + "]");
                if (XmlNode1.length != 0)
                    OGrid.rows(i).cells(0).firstChild.checked = true;
            }
    }

    //=======زدن تیک مربوط به اشتراک عضویت در گروه های انتخابی====
    //    var XmlNodeAnd = oXml.documentElement.selectNodes("/Root/TbAnd");
    //    if (XmlNodeAnd.length > 0) {
    //        if(XmlNodeAnd.item('Selected').selectSingleNode
    //    }
}
//======================================
//function OnClickChk(obj) {
//    var oGrid = obj.parentElement;
//    while (oGrid.tagName != "TABLE")
//        oGrid = oGrid.parentElement

//    var oRow = obj.parentElement;
//    while (oRow.tagName != "TR")
//        oRow = oRow.parentElement
//    var oIndex = oRow.rowIndex
//    //========================================================
//    var strXml = "<Root>" + str + "</Root>"

//    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
//    oXmlDoc.async = "false";
//    oXmlDoc.loadXML(strXml);

//    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
//    //========================================================
//    if (oXmlNodes.length > 0) {
//        if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
//            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
//            f.selectSingleNode("Val").text = 1;
//            oXmlDoc.childNodes[0].appendChild(f);
//        }
//        else {
//            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
//            f.selectSingleNode("Val").text = 0;
//            oXmlDoc.childNodes[0].appendChild(f);
//        }
//        strXml = oXmlDoc.xml;
//        strChk = strXml.replace("<Root>", "");
//        strChk = strChk.replace("</Root>", "");
//    }
//    else {
//        strChk += "<Tb>"
//        strChk += "<GroupId>" + oGrid.rows(oIndex).getAttribute("GroupId") + "</GroupId>"
//        if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
//            strChk += "<Selected>0</Selected>"
//        else
//            strChk += "<Selected>1</Selected>"
//        strChk += "</Tb>"
//    }
//}