//*************************************Declaration*******************************
var str = "<Root></Root>";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var PersonCode = "0";
var LastSelectedRow = ""
var LastSelectedRowClass = "";
var MemberFile = "";
//SetChk();
var ParentDialogm = window.dialogArguments;
if (ParentDialogm != "") {
    if ($get(MasterObj + "txtIDParent").value == MasterObj + "CtrlPersonID" + "_txtHidden")
        $get(MasterObj + "txtHidden").value = ParentDialogm.document.getElementById($get(MasterObj + "txtIDParent").value).value
    if ($get(MasterObj + "txtIDParent").value == MasterObj + "MultiPerson_txtHidden")
        $get(MasterObj + "txtHidden").value = ParentDialogm.document.getElementById($get(MasterObj + "txtIDParent").value).value
}
//*************************************EndDeclaration*****************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//--------------------------------------------------------------------------------
if ($get(MasterObj + "txtMode").value == "SimpleMode") {
    if (document.getElementById('OToolBar_BtnOK') != null)
        document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
    HideAllChecked();
}
function BeginRequestHandler(sender, args) {
   
}
//=======================================================
function EndRequestHandler(sender, args) {
   
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "") {
        LastSelectedRow = ""
//        SetChk();
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
        SetChk()
       
    }
    if ($get(MasterObj + "txtAlert").value != "") {
        SetMsg($get(MasterObj + "txtAlert").value)
        $get(MasterObj + "txtAlert").value = ""
    }
    $get(MasterObj + "txtSubmit").value = "";
    //--------------------------مخفی کردن چک باکس------------------------------
    if ($get(MasterObj + "txtMode").value == "SimpleMode") {
        if (document.getElementById('OToolBar_BtnOK') != null)
            document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
        HideAllChecked();
    }
}
//*****************************************************************************
if ($get(MasterObj + "txtHidden").value != "") {
//    str = "<Root>" + $get(MasterObj + "txtHidden").value + "</Root>";
str =  $get(MasterObj + "txtHidden").value 
    SetChk();
}
//---------------------------HideChekBox Column-------------------------------
function HideAllChecked() {
    var OGrid = document.getElementById("GrdPerson");
    if (OGrid != null) {
        for (var i = 0; i < OGrid.rows.length; i++) {
            //-----------------جلوگیری از برداشتن Paging----------------------
            if (!(OGrid.rows(i).getAttribute("Footer")))
                OGrid.rows(i).cells(0).style.display = "none";
        }
    }
}
//*************************************OnLoad*************************************        
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
document.getElementById('OToolBar_BtnOk').style.display = "inline"
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnOk() {
    if ($get(MasterObj + "txtShowFlag").value != "Check") {
        var OGrid = document.getElementById("GrdPerson");
        var CurPage = document.getElementById(MasterObj + "txtCurPage").value
        var strXml = str
        var PID, PName
        if (LastSelectedRow != "") {
            PID = OGrid.rows(LastSelectedRow).cells(0).innerText;
            PName = OGrid.rows(LastSelectedRow).cells(1).innerText;
        }
        else {
            alert('لطفا سطر مورد نظر را انتخاب نماييد')
            return
        }
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);

        var oXmlSelNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

        if (oXmlSelNodes.length > 0) {

            for (var j = 0; j < oXmlSelNodes.length; j++) {
                oXmlSelNodes.item(j).selectSingleNode("Selected").text = 0
            }
            strXml = oXmlDoc.xml;
            str = strXml.replace("<Root>", "");
            str = str.replace("</Root>", "");

        }
        //------------------------------------------------------
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and PersonCode=" + PID + "]");

        if (oXmlNodes.length > 0) {
            oXmlNodes.item(0).selectSingleNode("Selected").text = 1

            strXml = oXmlDoc.xml;
            str = strXml.replace("<Root>", "");
            str = str.replace("</Root>", "");
        }
        else {
            if ($get(MasterObj + "txtOutputFormat").value != "Json") {
                if (str == "<Root></Root>") {
                    str = "<Root>";
                    str += "<Tb>"
                    str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                    str += "<PCode>" + PID + "</PCode>"
                    str += "<PName>" + PName + "</PName>"
                    str += "<Selected>1</Selected>"
                    str += "</Tb>"
                    str += "</Root>";
                }
                else {
                    str += "<Tb>"
                    str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                    str += "<PCode>" + PID + "</PCode>"
                    str += "<PName>" + PName + "</PName>"
                    str += "<Selected>1</Selected>"
                    str += "</Tb>"
                }
            }
            else if ($get(MasterObj + "txtOutputFormat").value == "Json") {
                str = "{ \"Tb\" :[{"
                str += "\"PageNo\":\"" + document.getElementById(MasterObj + "txtCurPage").value + "\","
                str += "\"PCode\":\"" + PID + "\","
                str += "\"PName\":\"" + PName + "\","
                str += "\"Selected\":\"1\""
                str += "}]}"
            }
        }
        //------------------------------------------------------       
    }
    returnValue = str;
    //    alert(returnValue)
    window.close();
}
//*************************************EndToolbar*************************************        
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    document.getElementById(MasterObj + "hdnPersonCode").value = document.getElementById(MasterObj + "CmbPersonCodeSearch").selectedIndex + document.getElementById(MasterObj + "txtPersonCode").value
    document.getElementById(MasterObj + "hdnPersonName").value = document.getElementById(MasterObj + "cmbPersonNameSearch").selectedIndex + document.getElementById(MasterObj + "txtPersonName").value

    document.getElementById(MasterObj + "hdnRoleCodeType").value = document.getElementById(MasterObj + "cmbRoleCodeSearch").selectedIndex + document.getElementById(MasterObj + "txtRoleCode").value
    document.getElementById(MasterObj + "hdnDepartment").value = document.getElementById(MasterObj + "cmbDeptsNameSearch").selectedIndex + document.getElementById(MasterObj + "txtDeptsName").value
    //document.getElementById(MasterObj + "hdnDepartment").value = document.getElementById(MasterObj + "CmbCodeDepts").selectedIndex 
    document.getElementById(MasterObj + "hdnDepartmentType").value = document.getElementById(MasterObj + "cmbRoleSearch").selectedIndex + document.getElementById(MasterObj + "txtRole").value

    document.getElementById(MasterObj + "txtSubmit").value = "Search";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrdPerson(SelectedRow) {
    if (LastSelectedRow != "")
        if (SelectedRow.parentElement.rows(parseInt(LastSelectedRow)) != null) {
        SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).className = LastSelectedRowClass;
    }
    LastSelectedRow = SelectedRow.rowIndex;
    LastSelectedRowClass = SelectedRow.className;
    SelectedRow.className = "CssSelectedItemStyle";
}
//**********************************EndThisPage*************************************
function OnClickChk(obj) {
    var OGrid = document.getElementById("GrdPerson");
    var RowIndex = obj.parentElement.parentElement.rowIndex;
    var TbObj = obj.parentElement.parentElement.parentElement.parentElement
    var PID = TbObj.rows(RowIndex).getAttribute("PersonID")
    var PName = TbObj.rows(RowIndex).cells(2).innerText;
    var PCode = TbObj.rows(RowIndex).cells(1).innerText;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    var oXmlNodes = "";
    oXmlDoc.loadXML(str);
    if ((str != "<Root></Root>") && (str != "<Root/>"))
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PID=" + PID + "]");

    if (oXmlNodes.length == 0 & obj.checked == true) {
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML("<Root><Tb><PID>" + PID + "</PID><PCode>" + PCode + "</PCode><PName>" + PName + "</PName></Tb></Root>");
        var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
        oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
    }
    else if (oXmlNodes.length > 0 & obj.checked == false) {
        var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[PID=" + PID + "]");
        var f = oXmlDoc.documentElement.removeChild(oXmlNodeTemp);
    }
    str = oXmlDoc.xml
}
//***********************************************************************
function SetChk() {
    var oXml = new ActiveXObject("Microsoft.XMLDOM");
    oXml.async = "false";
    oXml.loadXML(str);
    var OGrid = document.getElementById("GrdPerson")
    //    alert(str)
    var XmlNode = oXml.documentElement.selectNodes("/Root/Tb");
    if (XmlNode.length != 0) {

        if (OGrid != null)
            for (var i = 1; i < OGrid.rows.length; i++) {
                var XmlNode1 = oXml.documentElement.selectNodes("Tb[PID=" + OGrid.rows(i).getAttribute("PersonID") + "]");
                if (XmlNode1.length != 0)
                    OGrid.rows(i).cells(0).firstChild.checked = true;
            }
    }
    else {
        if (OGrid != null) {
            for (var i = 1; i < OGrid.rows.length; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked == true)
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
        }
    }
    for (i = 0; i < XmlNode.length; i++) {
        if (OGrid != null) {
            for (var k = 0; k < OGrid.rows.length; k++) {
                if (OGrid.rows(k).cells(1).innerText == XmlNode[i].selectSingleNode('PID').text) {
                    OGrid.rows(k).cells(0).firstChild.checked = true
                }
            }
        }
    }
}
//*******************************************************************
function OnClickBtnMemberFile() {
    document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
    var strUrl = "/FrmPresentation/App_Pages/DataEntry/MemberFile.aspx?MenuItemID=" + document.getElementById(MasterObj + "txtMenuItemID").value;
    strUrl = encodeURI(strUrl)
    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 300px;dialogWidth: 450px;center: Yes;help: no;status: no;scroll:no')

    if (rValue != "" && rValue != undefined) {
        MemberFile = rValue;
        ChkSelectedPerson();
    }

    document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
}
//*******************************************************************
function ChkSelectedPerson() {
    var OGrid = document.getElementById("GrdPerson");
    if (MemberFile != "" && MemberFile != "<Root></Root>") {
        //-----------------------Xml Excel File-------------------
        var oXml = new ActiveXObject("Microsoft.XMLDOM");
        oXml.async = "false";
        oXml.loadXML(MemberFile);
        var XmlNode = oXml.documentElement.selectNodes("/Root/Tb");
        //-----------------------Xml Grid-------------------------
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(str);
        //----------------------------------------------------------
        var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocTemp.async = "false";
        for (var i = 0; i < XmlNode.length; i++) {
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PID=" + XmlNode.item(i).selectSingleNode("PID").text + "]");
            if (oXmlNodes.length == 0) {
                var PID = XmlNode.item(i).selectSingleNode("PID").text;
                var PCode = XmlNode.item(i).selectSingleNode("PCode").text;
                var PName = XmlNode.item(i).selectSingleNode("PName").text;
                oXmlDocTemp.loadXML("<Root><Tb><PID>" + PID + "</PID><PCode>" + PCode + "</PCode><PName>" + PName + "</PName></Tb></Root>");
                var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
                oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
            }
            str = oXmlDoc.xml
        }
        SetChk();

    }
}
//=======================================================================
function onClickselectGroup() {
   
    if ($get(MasterObj + "cmbGroup").value == 0) {
        var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value
                + "&GroupMode=1"
                + "&txtHidden=" + $get(MasterObj + "txtXmlGroup").value
                + "&GetChk=" + $get(MasterObj + "txtChkGroup").value

        var rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight: 1000px;dialogWidth: 1000px;center: Yes;help: no;status: no')
        //        alert(rValue);
        //-----------------------Xml Grid-------------------------
        if (rValue != "") {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            var StrXmlChk = "";
            $get(MasterObj + "txtXmlGroup").value = "";
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(rValue);
            var XmlNode = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            if (XmlNode.length > 0) {
                for (var i = 0; i < XmlNode.length; i++) {
                    StrXmlChk += "<Tb>"
                    StrXmlChk += "<GroupId>" + XmlNode.item(i).selectSingleNode("GroupId").text + "</GroupId>"
                    StrXmlChk += "<GroupName>" + XmlNode.item(i).selectSingleNode("GroupName").text + "</GroupName>"
                    StrXmlChk += "<CID>" + XmlNode.item(i).selectSingleNode("GroupName").text + "</CID>"
                    StrXmlChk += "</Tb>"
                }
                $get(MasterObj + "txtXmlGroup").value = "<Root>" + StrXmlChk + "</Root>";
            }

            var XmlNodeAnd = oXmlDoc.documentElement.selectNodes("/Root/TbAnd");
            //        alert(XmlNodeAnd.length)
            if (XmlNodeAnd.length > 0) {
                if (XmlNodeAnd.item(0).selectSingleNode("Selected").text == "1")
                    $get(MasterObj + "txtChkGroup").value = "1";
                else
                    $get(MasterObj + "txtChkGroup").value = "0";
            }
        }
    }
    else {
        alert("برای انتخاب چندين گروه بايد کمبو گروه را در حالت انتخاب همه قرار دهيد");
    }
}
//======================================================================
function OnClickHeaderChk(header) {
    $("#GrdPerson").find("TBODY").find("tr").find("input:checkbox").each(function () {
        if (!$(this).hasClass("header")) {
            $(this).attr("checked", $(header).attr("checked"));
            OnClickChkAll($(this));
        }
    });
}
//====================================================================
function OnClickChkAll(obj) {
    var OGrid = document.getElementById("GrdPerson");
    var PID = obj.parent(0).parent(0).attr("PersonID")
    var PName = obj.parent(0).parent(0).find("TD:eq(2)").text()
    var PCode = obj.parent(0).parent(0).find("TD:eq(1)").text()
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    var oXmlNodes = "";
    oXmlDoc.loadXML(str);
    if ((str != "<Root></Root>") && (str != "<Root/>"))
        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PID=" + PID + "]");
    if (oXmlNodes.length == 0 & obj.attr("checked") == true) {
        if (PID != undefined) {
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<Root><Tb><PID>" + PID + "</PID><PCode>" + PCode + "</PCode><PName>" + PName + "</PName></Tb></Root>");
            var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
            oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
        }
    } else if (oXmlNodes.length > 0 & obj.attr("checked") == false) {
        var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[PID=" + PID + "]");
        var f = oXmlDoc.documentElement.removeChild(oXmlNodeTemp);
    }
    str = oXmlDoc.xml
}
//=======================================================================
function OnClickBtnChkAllPage(obj) {
    OpenModelPopup();
    var OGrid = document.getElementById("GrdPerson");
    var strXml = "";
    var semat = 0;
    var xmlSave;
    if ($(obj).attr("checked") == true) {
        $("#" + MasterObj + "txtCheckAllMode").val("1");
        document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
        document.getElementById(MasterObj + "hdnPersonCode").value = document.getElementById(MasterObj + "CmbPersonCodeSearch").selectedIndex + document.getElementById(MasterObj + "txtPersonCode").value
        document.getElementById(MasterObj + "hdnPersonName").value = document.getElementById(MasterObj + "cmbPersonNameSearch").selectedIndex + document.getElementById(MasterObj + "txtPersonName").value

        document.getElementById(MasterObj + "hdnRoleCodeType").value = document.getElementById(MasterObj + "cmbRoleCodeSearch").selectedIndex + document.getElementById(MasterObj + "txtRoleCode").value
        document.getElementById(MasterObj + "hdnDepartment").value = document.getElementById(MasterObj + "cmbDeptsNameSearch").selectedIndex + document.getElementById(MasterObj + "txtDeptsName").value
        //document.getElementById(MasterObj + "hdnDepartment").value = document.getElementById(MasterObj + "CmbCodeDepts").selectedIndex 
        document.getElementById(MasterObj + "hdnDepartmentType").value = document.getElementById(MasterObj + "cmbRoleSearch").selectedIndex + document.getElementById(MasterObj + "txtRole").value

        if ($("#" + MasterObj + "rdbSemat").attr("checked") == true)
            semat = 1;
        else
            semat = 0;

        if ($("#" + MasterObj + "txtMenuItemID").val() == "")
            $("#" + MasterObj + "txtMenuItemID").val("1306");

        if ($("#" + MasterObj + "cmbGroup").val() != "0") {
            $("#" + MasterObj + "txtXmlGroup").val("");
            $("#" + MasterObj + "txtChkGroup").val("");
        }

       
        $.ajax({
            type: "POST",
            url: "SelectPerson.aspx/CheckAll?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{PersonID:'" + $("#" + MasterObj + "hdnPersonCode").val() + "' ,PersonName:'" + $("#" + MasterObj + "hdnPersonName").val() + "',DepartmentID:'" + $("#" + MasterObj + "CmbCodeDepts_txtCode").val() + "',DepartmentName:'" + $("#" + MasterObj + "hdnDepartment").val() + "',RoleType:'" + $("#" + MasterObj + "hdnDepartmentType").val() + "',RoleCodeType:'" + $("#" + MasterObj + "hdnRoleCodeType").val() + "',semat:'" + semat + "' , CardNO:'" + $("#" + MasterObj + "txtCardNO").val() + "', GroupID:'" + $("#" + MasterObj + "cmbGroup").val() + "', SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "', GroupID:'" + $("#" + MasterObj + "cmbGroup").val() + "', XmlGroup:'" + $("#" + MasterObj + "txtXmlGroup").val() + "', ChkGroup:'" + $("#" + MasterObj + "txtChkGroup").val() + "', CompanyFinatialPeriodID:'" + $("#" + MasterObj + "txtCompanyFinatialPeriodID").val() + "', SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "', MenuItemId:'" + $("#" + MasterObj + "txtMenuItemID").val() + "' }",
            async: false,
            success: function (Data) {
                // alert(Data.d)
                if (Data.d != "") {
                    if (window.ActiveXObject) {
                        xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                        xmlSave.async = 'false';
                        xmlSave.loadXML(Data.d);
                    } else {
                        var parser = new DOMParser();
                        xmlSave = parser.parseFromString(Data.d, 'text/xml');
                    }
                    if ($(xmlSave).find("NewDataSet").find("SelectPersonAll").length > 0) {
                        $(xmlSave).find("NewDataSet").find("SelectPersonAll").each(function () {
                            strXml += "<Tb>"
                            strXml += "<PID>" + $(this).find("PersonID").text() + "</PID>"
                            strXml += "<PCode>" + $(this).find("PersonCode").text() + "</PCode>"
                            strXml += "<PName>" + $(this).find("Fullname").text() + "</PName>"
                            strXml += "</Tb>"
                        });
                        str = "";
                        str = "<Root>" + strXml + "</Root>";
                        SetChk();
                    }

                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("خطا در انجام عمليات");
            }
        });
       
    }
    else {
        str = "<Root></Root>";
        SetChk();
    }
    CloseModelPopup();
}