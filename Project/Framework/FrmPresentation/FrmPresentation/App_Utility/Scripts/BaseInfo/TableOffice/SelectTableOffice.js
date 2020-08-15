
//*************************************Declaration*************************************
var str = "<Root></Root>";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var LastSelectedRow = ""
var LastSelectedRowClass = "";

//*************************************EndDeclaration*************************************
window.document.title = "انتخاب دفتر تابل";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//*************************************EndDeclaration*************************************
function BeginRequestHandler(sender, args) {

}
//*************************************EndDeclaration*************************************
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
window.name = "SelectTableOffice.aspx"
aspnetForm.target = "SelectTableOffice.aspx"
returnValue = "";
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
function OnClickBtnCancel() {
    window.close();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
    if (document.getElementById(MasterObj + "txtType").value == "Radio") {
        var OGrid = document.getElementById("GrdTableOffice");
        var CurPage = document.getElementById(MasterObj + "txtCurPage").value
        var TID = SelectedRow.TableOfficeId;
        var PName = SelectedRow.TableOfficeName;
        str = "<Tb>"       
        str += "<TID>" + TID + "</TID>"
        str += "<TName>" + PName + "</TName>"
        str += "<Selected>1</Selected>"
        str += "</Tb>"

    }
    returnValue = str;
    window.close();
}
//*************************************EndToolbar*************************************

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
function OnClickChk(obj) {
    var OGrid = document.getElementById("GrdTableOffice");
    var RowIndex = obj.parentElement.parentElement.rowIndex;
    var TbObj = obj.parentElement.parentElement.parentElement.parentElement
    var TID = TbObj.rows(RowIndex).getAttribute("TableOfficeId")
    var PName = TbObj.rows(RowIndex).getAttribute("TableOfficeName");
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(str);
    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [TID=" + TID + "]");
    if (oXmlNodes.length == 0 & obj.checked == true) {
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root><Tb><TID>" + TID + "</TID><TName>" + PName + "</TName></Tb></Root>");
        var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
    }
    else if (oXmlNodes.length > 0 & obj.checked == false) {
        var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[TID=" + TID + "]");
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
    if (XmlNode.length != 0) {
        var OGrid = document.getElementById("GrdTableOffice")
        if (OGrid != null)
            for (var i = 1; i < OGrid.rows.length; i++) {
            var XmlNode1 = oXml.documentElement.selectNodes("Tb[TID=" + OGrid.rows(i).getAttribute("TableOfficeId") + "]");
            if (XmlNode1.length != 0)
                OGrid.rows(i).cells(0).firstChild.checked = true;
        }
    }
}
//======================================