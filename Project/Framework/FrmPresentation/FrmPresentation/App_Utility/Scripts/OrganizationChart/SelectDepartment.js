
//*************************************Declaration*************************************
window.name = "SelectDepartment"
aspnetForm.target = window.name;

var str = "<Root></Root>";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var LastSelectedRow = ""
var LastSelectedRowClass = "";


window.name = "SelectDepartment.aspx"
window.target = window.name;

window.document.title = "انتخاب واحد سازماني";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {

}
//========================================================================
function EndRequestHandler(sender, args) {

    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "" |
                 ($get(MasterObj + "txtTreeDeptID").value != "" & $get(MasterObj + "txtTreeDeptID").value != "0")) {

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
        if (document.getElementById(MasterObj + "txtShowFlag").value != 1)
            SetChk()
        if (StrVal == "" & $get(MasterObj + "txtAlert").value != "")
            SetMsg($get(MasterObj + "txtAlert").value)
        //====================================================
        if ($get(MasterObj + "SearchRowIndex").value != "") {
            var OGrid = document.getElementById("GrdDepartment");
            var SelectedRow = OGrid.rows(parseInt($get(MasterObj + "SearchRowIndex").value) + 1)
            OnClickGrd(SelectedRow);

        }
    }
    if (StrVal == "Search") {
        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
    }
    if (StrVal == "SubDepartment") {
        $get(MasterObj + "txtXmlDepartment").value = $get(MasterObj + "txtXmlDepartment").value.replace("<BaseInfoEntity>", "<Root>");
        $get(MasterObj + "txtXmlDepartment").value = $get(MasterObj + "txtXmlDepartment").value.replace("</BaseInfoEntity>", "</Root>");
        window.returnValue = "#DA" + $get(MasterObj + "txtXmlDepartment").value;
        window.close();
    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";

}
//*************************************EndDeclaration*************************************        
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$get("TDTypeSelDept").style.display = "inline"
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
    var TotalPage = parseInt($get(MasterObj + "txtCurPage").value);
    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
        document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
        document.getElementById(MasterObj + "BtnSubmit").click();

        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
            document.getElementById("OToolBar_BtnNext").disabled = true
        else
            document.getElementById("OToolBar_BtnNext").disabled = false
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//         function OnTreeClick(evt) {
//         alert(0)
//             if (LastSelectedRow != "" && LastSelectedRow != null) {
//                 LastSelectedRow.className = LastSelectedRowClass;
//                 LastSelectedRow = "";
//             }               
//             if (window.event.srcElement.tagName != "IMG") {
//                 var src = window.event != window.undefined ? window.event.srcElement : evt.target;
//                 document.getElementById(MasterObj + "txtSubmit").value = "ChangeNode";
//                 document.getElementById(MasterObj + "BtnSubmit").click();
//             }
//             return false; //comment this if you want postback on node click
//         }
//========================================================================
function OnClickBtnPrv() {
    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
        document.getElementById(MasterObj + "BtnSubmit").click();

        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
            document.getElementById("OToolBar_BtnPrv").disabled = true
        else
            document.getElementById("OToolBar_BtnPrv").disabled = false
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!             
function OnClickBtnOk() {
    var Type = (($get('ChkDepartmentA').checked) ? 'DA' : 'DS');
    if (Type == "DS") {
        window.returnValue = (($get(MasterObj + "txtShowTypeSelDept").value != "0") ? Type + '#' + str : str);
        window.close();
    }
    else {
        $get(MasterObj + "txtXmlDepartment").value = str
        $get(MasterObj + "txtSubmit").value = "SubDepartment";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//*************************************EndToolbar*************************************
function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    $get(MasterObj + "txtTreeDeptID").value = "0";

    var StrXML = "";
    StrXML += "<Root><Tb>";
    StrXML += "<Department>" + $get(MasterObj + "CmbDepartment").selectedIndex + $get(MasterObj + "txtDepartment").value + "</Department>";
    StrXML += "<DepartmentType>" + $get(MasterObj + "cmbDepartmentType").value + "</DepartmentType>";
    StrXML += "</Tb></Root>";
    document.getElementById(MasterObj + "txtSearch").value = StrXML;
    document.getElementById(MasterObj + "txtSubmit").value = "Search";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

    document.getElementById(MasterObj + "CmbDepartment").value = "0"
    document.getElementById(MasterObj + "txtDepartment").value = "";
    document.getElementById(MasterObj + "cmbDepartmentType").value = "0"
    $get(MasterObj + "txtTreeDeptID").value = "0";

    var StrXML = "";
    StrXML += "<Root><Tb>";
    StrXML += "<Department></Department>";
    StrXML += "<DepartmentType></DepartmentType>";
    StrXML += "</Tb></Root>";
    document.getElementById(MasterObj + "txtSearch").value = StrXML;

    document.getElementById(MasterObj + "txtSubmit").value = "ShowAll";
    document.getElementById(MasterObj + "BtnSubmitMain").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != "" && LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
        LastSelectedRow = "";
    }
    LastSelectedRow = SelectedRow;
    LastSelectedRowClass = SelectedRow.className;
    SelectedRow.className = "CssSelectedItemStyle";
    $get(MasterObj + "txtGrdDeptID").value = SelectedRow.getAttribute("DepartmentID")
    //====================================================
    SetXMLStr(SelectedRow)
    //====================================================             
    $get(MasterObj + "txtTreeDeptID").value = "0";
    if (document.getElementById(MasterObj + "SearchRowIndex").value == "") {
        document.getElementById(MasterObj + "txtSubmit").value = "FilterDeptTree";
        document.getElementById(MasterObj + "BtnSubmitTree").click();
    }
    $get(MasterObj + "SearchRowIndex").value = "";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetXMLStr(SelectedRow) {

    var strXml = ""; // "<Root>" + str + "</Root>"
    if (document.getElementById(MasterObj + "txtShowFlag").value == 1) {

        var PID = LastSelectedRow.DepartmentID;
        //                   
        //             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        //             oXmlDoc.async = "false";
        //             oXmlDoc.loadXML(strXml);
        //             
        //                if ($get(MasterObj + "txtShowFlag").value == "1") {                               
        //                 var CurPage = document.getElementById(MasterObj + "txtCurPage").value
        //                 var oXmlSelNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");                
        //                    
        //                 if (oXmlSelNodes.length > 0) {
        //                     for (var j = 0; j < oXmlSelNodes.length; j++) {
        //                         oXmlSelNodes.item(j).selectSingleNode("Selected").text = 0
        //                     }
        //                     strXml = oXmlDoc.xml;
        //                     str = strXml.replace("<Root>", "");
        //                     str = str.replace("</Root>", "");                    
        //                 }
        //                 //------------------------------------------------------                
        //                 var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and DID=" + PID + "]");
        //                
        //                 if (oXmlNodes.length > 0) {
        //                     oXmlNodes.item(0).selectSingleNode("Selected").text = 1

        //                     strXml = oXmlDoc.xml;
        //                     str = strXml.replace("<Root>", "");
        //                     str = str.replace("</Root>", "");
        //                 }
        //                 else {
        strXml = "<Root>";
        strXml += "<Tb>"
        strXml += "<DepartmentID>" + PID + "</DepartmentID>"
        strXml += "<Name>" + LastSelectedRow.Name + "</Name>"
        strXml += "<Selected>1</Selected>"
        strXml += "</Tb>"
        strXml += "</Root>";
        str = strXml;
        // }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickChk(obj) {
    var OGrid = document.getElementById("GrdDepartment");
    var RowIndex = obj.parentElement.parentElement.rowIndex;
    var TbObj = obj.parentElement.parentElement.parentElement.parentElement
    var DID = TbObj.rows(RowIndex).getAttribute("DepartmentID")
    var PName = TbObj.rows(RowIndex).getAttribute("Name");
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    var oXmlNodes = "";
    oXmlDoc.loadXML(str);
    if ((str != "<Root></Root>") && (str != "<Root/>"))
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [DID=" + DID + "]");

    if (oXmlNodes.length == 0 & obj.checked == true) {
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root><Tb><DID>" + DID + "</DID><DName>" + PName + "</DName></Tb></Root>");
        var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
    }
    else if (oXmlNodes.length > 0 & obj.checked == false) {
        var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[DID=" + DID + "]");
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
        var OGrid = document.getElementById("GrdDepartment")
        if (OGrid != null)
            for (var i = 1; i < OGrid.rows.length; i++) {
                var XmlNode1 = oXml.documentElement.selectNodes("Tb[DID=" + OGrid.rows(i).getAttribute("DepartmentID") + "]");
                if (XmlNode1.length != 0)
                    OGrid.rows(i).cells(0).firstChild.checked = true;
            }
    }
}
//======================================
function OndbClickGrd(Obj) {
    if (document.getElementById(MasterObj + "txtShowFlag").value == 1) {
        OnClickBtnOk();
    }
}
      
