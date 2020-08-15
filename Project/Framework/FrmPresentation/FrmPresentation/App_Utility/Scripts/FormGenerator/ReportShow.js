var MasterObj = "ctl00_ContentPlaceHolder1_"
var str1 = "";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {
    //==================================
    if (typeof (document.getElementById("ctl00_ProgressState")) == "Object")
        document.getElementById("ctl00_ProgressState").value = 0

}
function EndRequestHandler(sender, args) {

    document.getElementById("ctl00_ProgressState").value = 1
    CloseModelPopup();
    var StrVal = $get(MasterObj + "txtSubmit").value

    if (StrVal == "Preview") {
        ShowReportDesignModal("View");
    } else if (StrVal == "Design") {
        ShowReportDesignModal("Design");
    }

    /* if (StrVal != "") {
    if ($get(MasterObj + "lblTo").value == "") {
    document.getElementById(MasterObj + 'txtFromData').value = "";
    document.getElementById(MasterObj + 'txtToData').value = "";
    document.getElementById(MasterObj + 'txtTotalData').value = "";
    document.getElementById(MasterObj + 'BtnNext').disabled = true;
    document.getElementById(MasterObj + 'BtnPrv').disabled = true;
    document.getElementById(MasterObj + 'BtnFirst').disabled = true;
    document.getElementById(MasterObj + 'BtnLast').disabled = true;
    }
    else if ($get(MasterObj + "lblTo").value != "" && document.getElementById(MasterObj + 'BtnPrv')) {
    document.getElementById(MasterObj + 'txtFromData').value = $get(MasterObj + "lblFrom").value;
    document.getElementById(MasterObj + 'txtToData').value = $get(MasterObj + "lblTo").value;
    document.getElementById(MasterObj + 'txtTotalData').value = $get(MasterObj + "lblTotal").value;
    document.getElementById(MasterObj + 'txtCurPage').value = $get(MasterObj + "lblCurPage").value;
    document.getElementById(MasterObj + 'txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
    if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) == parseInt(document.getElementById(MasterObj + "txtTotalPage").value))
    document.getElementById(MasterObj + 'BtnNext').disabled = true
    else
    document.getElementById(MasterObj + 'BtnNext').disabled = false;

    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
    document.getElementById(MasterObj + 'BtnPrv').disabled = true
    else
    document.getElementById(MasterObj + 'BtnPrv').disabled = false;
    document.getElementById(MasterObj + 'BtnFirst').disabled = false;
    document.getElementById(MasterObj + 'BtnLast').disabled = false;
    }
               
    //                if ($get(MasterObj + "lblTo").value == "") {
    //                    document.getElementById('OToolBar_txtFromData').value = "";
    //                    document.getElementById('OToolBar_txtToData').value = "";
    //                    document.getElementById('OToolBar_txtTotalData').value = "";

    //                    document.getElementById('OToolBar_BtnNext').disabled = true;
    //                    document.getElementById('OToolBar_BtnPrv').disabled = true;
    //                    document.getElementById('OToolBar_BtnFirst').disabled = true;
    //                    document.getElementById('OToolBar_BtnLast').disabled = true;
    //                }
    //                else if ($get(MasterObj + "lblTo").value != "") {
    //                    
    //                    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
    //                    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
    //                    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
    //                    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "lblCurPage").value;
    //                    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;

    //                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
    //                        document.getElementById('OToolBar_BtnNext').disabled = true
    //                    else
    //                        document.getElementById('OToolBar_BtnNext').disabled = false;

    //                    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
    //                        document.getElementById('OToolBar_BtnPrv').disabled = true
    //                    else
    //                        document.getElementById('OToolBar_BtnPrv').disabled = false;

    //                    document.getElementById('OToolBar_BtnFirst').disabled = false;
    //                    document.getElementById('OToolBar_BtnLast').disabled = false;
    //                }
    } */
    document.getElementById(MasterObj + "txtSubmit").value = "";
}

//window.name = "ReportShow"
//aspnetForm.target = "ReportShow"
document.dir = "RTL"
document.body.scroll = "No"
////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if (document.getElementById(MasterObj + 'BtnPrv') != null) {
    document.getElementById(MasterObj + 'BtnPrv').disabled = true;
    document.getElementById(MasterObj + 'txtFromData').value = $get(MasterObj + "lblFrom").value;
    document.getElementById(MasterObj + 'txtToData').value = $get(MasterObj + "lblTo").value;
    document.getElementById(MasterObj + 'txtTotalData').value = $get(MasterObj + "lblTotal").value;
    document.getElementById(MasterObj + 'txtCurPage').value = $get(MasterObj + "lblCurPage").value;
    document.getElementById(MasterObj + 'txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
    if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) == parseInt(document.getElementById(MasterObj + "txtTotalPage").value))
        document.getElementById(MasterObj + 'BtnNext').disabled = true
    else
        document.getElementById(MasterObj + 'BtnNext').disabled = false;


    //        document.getElementById('OToolBar_BtnPrv').disabled = true;
    //        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
    //        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
    //        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
    //        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "lblCurPage").value;
    //        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
    //        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
    //            document.getElementById('OToolBar_BtnNext').disabled = true
    //        else
    //            document.getElementById('OToolBar_BtnNext').disabled = false;
}
if (document.getElementById('OToolBar_Paging') != null) {
    document.getElementById('OToolBar_Paging').style.display = 'none';

}
if (document.getElementById(MasterObj + "txtSubmit").value == "ModalFilter") {
    OnClickBtnFilter()
}
//        DivGrd.style.height = window.screen.availHeight - 150 + 10 + "px";
//        DivGrd.style.width = window.screen.availWidth - 10 + "px"
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
function OnBlurtxtCurPage() {
    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value.replace(" ", "");
    var TotalPage = parseInt(document.getElementById(MasterObj + "txtTotalPage").value);
    if (document.getElementById(MasterObj + "txtCurPage").value != "" &&
                        document.getElementById(MasterObj + "txtCurPage").value != "0") {
        if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "lblCurPage").value = document.getElementById(MasterObj + "txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    //            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    //            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
    //                        document.getElementById("OToolBar_txtCurPage").value != "0") {
    //                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
    //                    document.getElementById(MasterObj + "lblCurPage").value = document.getElementById("OToolBar_txtCurPage").value
    //                }
    //                document.getElementById(MasterObj + "txtSubmit").value = "Const";
    //                document.getElementById(MasterObj + "BtnSubmit").click();
    //            }
}
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
function OnClickBtnExcel() {
    var StrExcelParam = "<Root>"
    if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAdvanceParameter").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrExcelParam += "<Tb>"
                StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                StrExcelParam += "<Type>A</Type>"
                StrExcelParam += "</Tb>"
            }
        }
    }
    if (document.getElementById(MasterObj + 'txtXmlFilter').value != "") {
        //        alert(document.getElementById(MasterObj + 'txtXmlFilter').value)
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlFilter").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrExcelParam += "<Tb>"
                StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                if (xmlNodes.item(i).selectSingleNode('RText').text != "")
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RText').text + "</RValue>"
                else
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                StrExcelParam += "<Type>N</Type>"
                StrExcelParam += "</Tb>"
            }
        }
    }
    StrExcelParam += "</Root>"
    document.getElementById(MasterObj + "txtXmlExcelParam").value = StrExcelParam
    document.getElementById(MasterObj + "txtSubmit").value = "Excel";
    document.getElementById(MasterObj + "BtnSendSubmit").click();
}
function OnClickBtnPDF() {
    var StrExcelParam = "<Root>"
    if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAdvanceParameter").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')
        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrExcelParam += "<Tb>"
                StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                StrExcelParam += "<Type>A</Type>"
                StrExcelParam += "</Tb>"
            }
        }
    }
    if (document.getElementById(MasterObj + 'txtXmlFilter').value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlFilter").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrExcelParam += "<Tb>"
                StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                if (xmlNodes.item(i).selectSingleNode('RText').text != "")
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RText').text + "</RValue>"
                else
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                StrExcelParam += "<Type>N</Type>"
                StrExcelParam += "</Tb>"
            }
        }
    }
    StrExcelParam += "</Root>"
    document.getElementById(MasterObj + "txtXmlExcelParam").value = StrExcelParam
    document.getElementById(MasterObj + "txtSubmit").value = "PDF";
    document.getElementById(MasterObj + "BtnSendSubmit").click();
}
function OnClickBtnAdvanceFilter() {
    document.getElementById(MasterObj + "txtStrAdvanceField").value = "";
    document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = "";

    var url = "AdvanceFilter.aspx?ReportID=" + document.getElementById(MasterObj + "txtReportID").value + " &OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUserID").value + " &MenuItemID=" + document.getElementById(MasterObj + "txtMenuItemID").value + " &SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + " &condition=" + document.getElementById(MasterObj + "txtStrAdvanceConditions").value
    var StrFilter = window.showModalDialog(encodeURI(url), "", "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: yes")

    //document.getElementById(MasterObj + "txtStrAdvanceConditions").value = "";

    if (StrFilter != "" && StrFilter != undefined) {
        document.getElementById(MasterObj + "txtStrAdvanceConditions").value = "";
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(StrFilter)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')
        var Str = ""
        if (xmlNodes.length != 0) {
            Str += "<Root>"
            for (var i = 0; i < xmlNodes.length; ++i) {
                Str += "<Tb>"
                Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                //                        Str += "<Size>" + xmlNodes.item(i).selectSingleNode('Size').text + "</Size>"
                //                        Str += "<DefaultValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</DefaultValue>"
                //                        Str += "<AdvanceParameter>" + xmlNodes.item(i).selectSingleNode('AdvanceParameter').text + "</AdvanceParameter>"
                //                        Str += "<Editable>" + xmlNodes.item(i).selectSingleNode('Editable').text + "</Editable>"
                //                        Str += "<IntVal>" + xmlNodes.item(i).selectSingleNode('IntVal').text + "</IntVal>"
                Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                //                        Str += "<Name>" + xmlNodes.item(i).selectSingleNode('Name').text + "</Name>"
                Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                //                        Str += "<TypeAcronym>" + xmlNodes.item(i).selectSingleNode('TypeAcronym').text + "</TypeAcronym>"
                //                        Str += "<DisplayTypeID>" + xmlNodes.item(i).selectSingleNode('DisplayTypeID').text + "</DisplayTypeID>"
                //                        Str += "<DisplayTypeAcronym>" + xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text + "</DisplayTypeAcronym>"
                //                        Str += "<LookupName>" + xmlNodes.item(i).selectSingleNode('LookupName').text + "</LookupName>"
                //                        Str += "<LookupValue>" + xmlNodes.item(i).selectSingleNode('LookupValue').text + "</LookupValue>"
                //                        Str += "<LookupParam>" + xmlNodes.item(i).selectSingleNode('LookupParam').text + "</LookupParam>"
                Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                Str += "</Tb>"
            }
            Str += "</Root>"
            document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = Str
        }
        var oXmlDocf = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocf.async = "false";
        oXmlDocf.loadXML(StrFilter)
        var xmlNodesf = oXmlDocf.documentElement.selectNodes('/Root/Fields')
        if (xmlNodesf.length != 0) {
            document.getElementById(MasterObj + "txtStrAdvanceField").value = xmlNodesf.item(0).selectSingleNode('Condition').text
        }

        
        if (window.ActiveXObject) {
            var xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(StrFilter);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }

        var xmlNodesP = $(xml).find("Root").find("Params");
        if ($(xmlNodesP).length > 0) {
            var GridLength = parseInt($(xmlNodesP).find("param0").text(), 10);
        }

        var StrConditions = "<Params>"
        for (var i = 1; i < GridLength; i++) {
            if ($(xmlNodesP).find("param" + i + "").length != 0) {
                StrConditions += "<param" + i + ">";
                StrConditions += "<cells1>" + xmlNodesP.find("param" + i + "").find("cells1").text() + "</cells1>"
                StrConditions += "<cells2>" + xmlNodesP.find("param" + i + "").find("cells2").text() + "</cells2>"
                StrConditions += "<cells3>" + xmlNodesP.find("param" + i + "").find("cells3").text() + "</cells3>"
                //                StrConditions += "<cells4>" + xmlNodesP.find("param" + i + "").find("cells4").text() + "</cells4>"
                StrConditions += "</param" + i + ">"
            }
        }
        StrConditions += "</Params>"
        $("#" + MasterObj + "txtStrAdvanceConditions").val(StrConditions);

    }
}
function OnClickBtnExcelDirect() {
    var StrExcelParam = "<Root>"
    document.getElementById(MasterObj + 'txtXmlFilter').value = GenerateStrFilter();
    GenerateAdvFilter()
    if (document.getElementById(MasterObj + 'txtXmlFilter').value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlFilter").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrExcelParam += "<Tb>"
                StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                if (xmlNodes.item(i).selectSingleNode('RText').text != "")
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RText').text + "</RValue>"
                else
                    StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                StrExcelParam += "<Type>N</Type>"
                StrExcelParam += "</Tb>"
            }
        }
    }
    StrExcelParam += "</Root>"
    document.getElementById(MasterObj + "txtXmlExcelParam").value = StrExcelParam
    document.getElementById(MasterObj + "BtnSendSubmitDirect").click();
}

function GenerateStrFilter() {

    var Str = ""
    if ($get(MasterObj + 'txtXmlParamInfo').value != "") {
        Str = "<Root>"
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlParamInfo').value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')
        , StrText = ""
        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                StrText = ""
                Str += "<Tb>"
                Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                switch (xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text) {
                    case "ComboBox":
                        //                        alert($get(MasterObj +  "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).options[$get(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).selectedIndex].text)
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                            StrText = $get(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).options[$get(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).selectedIndex].text
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "PersonCombo":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>";
                        }
                        break;
                    case "PersonCombo.NoExpireDate":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>";
                        }
                        break;
                    case "PersonCombo.Department":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtID").value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>";
                        }
                        break;
                    case "KasraDate":

                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value + "</RValue>"

                            if (xmlNodes.item(i).selectSingleNode('Name').text == "StartDate" || xmlNodes.item(i).selectSingleNode('Name').text == "SDate") {
                                document.getElementById(MasterObj + 'SDate').value = document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value
                            }

                            if (xmlNodes.item(i).selectSingleNode('Name').text == "EndDate" || xmlNodes.item(i).selectSingleNode('Name').text == "EDate") {
                                document.getElementById(MasterObj + 'EDate').value = document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value
                            }
                        }
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "CodeCondition":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "CodeCondition.SelectCode":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "Label":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "OnLineUser":
                        Str += "<RValue>" + document.getElementById(MasterObj + "txtOnLineUserID").value + "</RValue>"
                        break;
                    case "TextBox":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "CheckBox":
                        if (xmlNodes.item(i).selectSingleNode('LookupName').text == "") {
                            if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).checked) {
                                Str += "<RValue>1</RValue>"
                            }
                            else {
                                Str += "<RValue>0</RValue>"
                            }
                        }
                        break;
                    case "MultiDepartment":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "MultiGroup":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "MultiPerson":
                        //                        alert(document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value)
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        //                        alert(Str)
                        break;
                    case "MultiResturant":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        //                        alert(Str)
                        break;
                    case "MultiFoodCenter":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                    case "MultiStructure":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        break;
                    case "RoleBatch":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        //                        alert(Str)
                        break;
                    case "Report":
                        //alert(document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value)
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value + "</RValue>";
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>";
                        //alert(Str)
                        break;
                    case "SimpleComboBox":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonCode").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonCode").value + "</RValue>";
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        break;
                    default:
                        Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        break;
                }
                Str += "<RText>" + StrText + "</RText>"
                Str += "</Tb>"
            }
        }
        Str += "</Root>"
    }
    else {
        Str = "<Root><Tb></Tb></Root>"
    }
    return Str;

}
//if (document.getElementById("ctl00_ProgressState") != null) {
//    document.getElementById("ctl00_ProgressState").value = 1
//    CloseModelPopup();
//}
function OnClickBtnFilter() {
    document.getElementById(MasterObj + 'txtXmlFilter').value = GenerateStrFilter();
    GenerateAdvFilter()
    document.getElementById(MasterObj + "txtSubmit").value = "Search";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtStrAdvanceField").value = "";
    document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = "";
    document.getElementById(MasterObj + 'SDate').value = "";
    document.getElementById(MasterObj + 'EDate').value = "";
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXmlParamInfo').value)
    var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')
    if (xmlNodes.length != 0) {
        for (var i = 0; i < xmlNodes.length; ++i) {
            switch (xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text) {
                case "ComboBox":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value = 0;
                    break;
                case "PersonCombo":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtName").value = "";
                    break;
                case "PersonCombo.NoExpireDate":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtName").value = "";
                    break;
                case "PersonCombo.Department":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtName").value = "";
                    break;
                case "KasraDate":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCalendar").value = "";
                    break;
                case "CodeCondition":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "CodeCondition.SelectCode":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "MultiDepartment":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "MultiGroup":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "MultiPerson":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "Report":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "Label":
                    break;
                case "OnLineUser":
                    break;
                case "TextBox":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value = "";
                    break;
                case "CheckBox":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).checked = false;
                    break;
                case "MultiResturant":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "MultiFoodCenter":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "MultiStructure":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "RoleBatch":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtXml").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                    break;
                case "SimpleComboBox":
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonCode").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonName").value = "";
                    document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonName").setAttribute("PersonCode", "")
                    break;
                default:
                    break;
            }
        }
    }
    OnClickBtnFilter()
}
function OnClickBtnDesign() {
    var VarXmlParam;
    if (document.getElementById(MasterObj + "txtXmlFilter").value == "")
        VarXmlParam = "<Root><Tb></Tb></Root>";
    else
        VarXmlParam = document.getElementById(MasterObj + "txtXmlFilter").value;
    var VarXmlAdvanceParam;
    if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value == "")
        VarXmlAdvanceParam = "<Root><Tb></Tb></Root>";
    else
        VarXmlAdvanceParam = document.getElementById(MasterObj + "txtXmlAdvanceParameter").value;

    document.getElementById(MasterObj + "txtXmlParam").value = VarXmlParam;
    document.getElementById(MasterObj + "txtXmlAdvanceParam").value = VarXmlAdvanceParam;

    document.getElementById(MasterObj + "txtSubmit").value = "Design";
    document.getElementById(MasterObj + "BtnSubmitPreview").click();
}
function OnClickBtnPreview() {
    var VarXmlParam;
    document.getElementById(MasterObj + 'txtXmlFilter').value = GenerateStrFilter();
    if (document.getElementById(MasterObj + "txtXmlFilter").value == "")
        VarXmlParam = "<Root><Tb></Tb></Root>";
    else
        VarXmlParam = document.getElementById(MasterObj + "txtXmlFilter").value;
    var VarXmlAdvanceParam;
    if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value == "")
        VarXmlAdvanceParam = "<Root><Tb></Tb></Root>";
    else
        VarXmlAdvanceParam = document.getElementById(MasterObj + "txtXmlAdvanceParameter").value;

    document.getElementById(MasterObj + "txtXmlParam").value = VarXmlParam;
    document.getElementById(MasterObj + "txtXmlAdvanceParam").value = VarXmlAdvanceParam;

    document.getElementById(MasterObj + "txtSubmit").value = "Preview";
    document.getElementById(MasterObj + "BtnSubmitPreview").click();
}

function ShowReportDesignModal(mode) {
    var Url = "ReportDesign.aspx?OnlineUserID=" + document.getElementById(MasterObj + "txtOnLineUserID").value
            + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value
            + "&RptID=" + document.getElementById(MasterObj + "txtReportID").value
            + "&PageNumber=0" //کل داده ها  با 0//+ document.getElementById(MasterObj + "lblCurPage").value
            + "&PageSize=12"
            + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtCompanyFinatialPeriodID").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&Mode=" + mode
    StrFilter = window.showModalDialog(encodeURI(Url), window, "dialogWidth:1050px;dialogHeight:750px;center: Yes;resizable:yes;help: no;status:no#1")
}

document.body.attachEvent('onkeyup', OnkeyupBtnDesign)
document.body.attachEvent('onkeydown', OnkeydownBtnDesign)
var vpKey, key;
function OnkeyupBtnDesign() {
    if (window.event.keyCode == 16) vpKey = false;
}
function OnkeydownBtnDesign() {
    key = window.event.keyCode
    if (key == 16)
        vpKey = true;
    if (key == 79 && vpKey == true) {
        OnClickBtnDesign()
        vpKey = false
        return false;
    }
}
//----------------------
function FillTxtCondition() {
    var oGrid = document.getElementById(MasterObj + "GrdField")


    if (oGrid.rows.length > 1) {
        var StrWhere = ""
        var StrWhereTemp = "";
        for (var i = 1; i < oGrid.rows.length; ++i) {

            if (oGrid.rows(i).cells(4).firstChild.value != "") {

                if (StrWhere == "")
                    StrWhere += "(" + oGrid.rows(i).cells(4).firstChild.value + ")"
                else
                    StrWhere += " and (" + oGrid.rows(i).cells(4).firstChild.value + ")"

                if (StrWhereTemp == "")
                    StrWhereTemp += "(" + oGrid.rows(i).cells(4).getAttribute("StrWhereTemp") + ")"
                else
                    StrWhereTemp += " and (" + oGrid.rows(i).cells(4).getAttribute("StrWhereTemp") + ")"
            }
        }
    }

    document.getElementById(MasterObj + "txtCondition").value = StrWhere
    document.getElementById(MasterObj + "txtConditionMain").value = StrWhereTemp
}
function GenerateAdvFilter() {
    if ($get(MasterObj + 'txtXmlAdvParamInfo').value == "")
        return

    var StrWhere = document.getElementById(MasterObj + "txtCondition").value
    var StrWhereTemp = document.getElementById(MasterObj + "txtConditionMain").value

    StrWhere = StrWhere.replace("<", "&lt;")
    StrWhere = StrWhere.replace(">", "&gt;")

    StrWhereTemp = StrWhereTemp.replace("<", "&lt;")
    StrWhereTemp = StrWhereTemp.replace(">", "&gt;")

    var Str = ""
    if ($get(MasterObj + 'txtXmlParamInfo').value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlAdvParamInfo').value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')

        if (xmlNodes.length != 0) {
            for (var i = 0; i < xmlNodes.length; ++i) {
                Str += "<Tb>"
                Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                //                Str += "<Size>" + xmlNodes.item(i).selectSingleNode('Size').text + "</Size>"
                //                Str += "<DefaultValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</DefaultValue>"
                //                Str += "<AdvanceParameter>" + xmlNodes.item(i).selectSingleNode('AdvanceParameter').text + "</AdvanceParameter>"
                //                Str += "<Editable>" + xmlNodes.item(i).selectSingleNode('Editable').text + "</Editable>"
                //                Str += "<IntVal>" + xmlNodes.item(i).selectSingleNode('IntVal').text + "</IntVal>"
                Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                //                Str += "<Name>" + xmlNodes.item(i).selectSingleNode('Name').text + "</Name>"
                Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                //                Str += "<TypeAcronym>" + xmlNodes.item(i).selectSingleNode('TypeAcronym').text + "</TypeAcronym>"
                //                Str += "<DisplayTypeID>" + xmlNodes.item(i).selectSingleNode('DisplayTypeID').text + "</DisplayTypeID>"
                //                Str += "<DisplayTypeAcronym>" + xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text + "</DisplayTypeAcronym>"
                //                Str += "<LookupName>" + xmlNodes.item(i).selectSingleNode('LookupName').text + "</LookupName>"
                //                Str += "<LookupValue>" + xmlNodes.item(i).selectSingleNode('LookupValue').text + "</LookupValue>"
                //                Str += "<LookupParam>" + xmlNodes.item(i).selectSingleNode('LookupParam').text + "</LookupParam>"

                switch (xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text) {
                    case "ComboBox":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "PersonCombo":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtInnerText").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtInnerText").value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "KasraDate":

                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value != "")
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value + "</RValue>"
                        else
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                        break;
                    case "Label":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "OnLineUser":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "TextBox":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    case "CheckBox":
                        if (xmlNodes.item(i).selectSingleNode('LookupName').text == "") {
                            if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).checked) {
                                Str += "<RValue>1</RValue>"
                            }
                            else {
                                Str += "<RValue>0</RValue>"
                            }
                        }

                        break;
                    case "SimpleComboBox":
                        if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonCode").value != "") {
                            Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtPersonCode").value + "</RValue>"
                        }
                        else {
                            Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        }
                        break;
                    default:
                        Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                        break;
                }
                Str += "</Tb>"
            }
        }
    }
    else {

        Str = "<Tb></Tb>"
    }

    var strFilter = "<Root>" + Str + "<Fields><Condition>" + StrWhereTemp + "</Condition></Fields>" + "</Root>"

    func(strFilter)
}
function func(StrFilter) {
    // document.getElementById(MasterObj + "txtStrAdvanceField").value = "";
    document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = "";
    if (StrFilter != "" && StrFilter != undefined) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(StrFilter)
        var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')
        var Str = ""
        if (xmlNodes.length != 0) {
            Str += "<Root>"
            for (var i = 0; i < xmlNodes.length; ++i) {
                Str += "<Tb>"
                Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                Str += "</Tb>"
            }
            Str += "</Root>"
            document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = Str
        }
        var oXmlDocf = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDocf.async = "false";
        oXmlDocf.loadXML(StrFilter)
        var xmlNodesf = oXmlDocf.documentElement.selectNodes('/Root/Fields')
        if (xmlNodesf.length != 0) {
            document.getElementById(MasterObj + "txtStrAdvanceField").value = xmlNodesf.item(0).selectSingleNode('Condition').text
        }
    }
}
function cmbOprandOnChange(obj) {
    var oRow = obj.parentElement.parentElement
    GenerateCondition(oRow)
}

function txtVal1OnBlur(obj) {
    var oRow = obj.parentElement.parentElement
    GenerateCondition(oRow)
}

function txtVal2OnBlur(obj) {
    var oRow = obj.parentElement.parentElement
    GenerateCondition(oRow)
}

function GenerateCondition(ORowField) {

    var StrWhere = ''
    var StrWhereTemp = ''

    var op = ORowField.cells(1).firstChild.value
    op = GetOperandFromVal(op)

    var v1 = ORowField.cells(2).firstChild.value
    var v1T = ORowField.cells(2).firstChild.value

    var v2 = ORowField.cells(3).firstChild.value
    var v2T = ORowField.cells(3).firstChild.value

    var Name = "[" + ORowField.getAttribute("Name") + "]"
    if (op != 0 && (v1 != "" || v2 != "")) {
        v1T = isNaN(v1) == true ? "'" + v1 + "'" : v1;
        v2T = isNaN(v2) == true ? "'" + v2 + "'" : v2;
        switch (op) {
            case "Between":
                if (v1 != "" && v2 != "") {
                    StrWhere = Name + " Between " + v1 + " and " + v2
                    StrWhereTemp = Name + " Between " + v1T + " and " + v2T
                }
                break;
            case ">":
                StrWhere = Name + ">" + v1
                StrWhereTemp = Name + ">" + v1T
                break;
            case "<":
                StrWhere = Name + "<" + v1
                StrWhereTemp = Name + "<" + v1T
                break;
            case "=":
                StrWhere = Name + op + v1
                StrWhereTemp = Name + op + v1T
                break;
            case "<>":
                StrWhere = Name + "<> " + v1
                StrWhereTemp = Name + "<> " + v1T
                break;
            case "in":
                StrWhere = Name + " in ("

                if (v1 != "" && v2 != "")
                    StrWhere += v1 + "," + v2

                else if (v1 != "" && v2 == "")
                    StrWhere += v1

                else if (v1 == "" && v2 != "")
                    StrWhere += v2

                StrWhere += ")"

                StrWhereTemp = Name + " in ("

                if (v1T != "" && v2T != "")
                    StrWhereTemp += v1T + "," + v2T

                else if (v1T != "" && v2T == "")
                    StrWhereTemp += v1T

                else if (v1T == "" && v2T != "")
                    StrWhereTemp += v2T

                StrWhereTemp += ")"

                break;
            case "Like":
                if (v1 != "") {
                    StrWhere = Name + " Like '%" + v1 + "%'"
                    StrWhereTemp = StrWhere;
                }
                break;
        }
    }

    ORowField.cells(4).firstChild.value = StrWhere
    ORowField.cells(4).setAttribute("StrWhereTemp", StrWhereTemp);
    FillTxtCondition()
    //return StrWhere;
}

function GetOperandFromVal(val) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[Val=" + val + "]")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("StrVal").text
    return '';
}

//zkhoodabandeh

function OnClickBtnOK() {
    returnValue = "<Root>" + str1 + "</Root>";
    alert(returnValue)
    window.close();
}
function OnClickChk(obj) {
    var attrCounter = 0;
    var attributes = $get(MasterObj + "txtAttributes").value;
    var attributesArray = attributes.split(',');

    var rowIndex = obj.parentElement.parentElement.rowIndex;
    var tbObj = obj.parentElement.parentElement.parentElement.parentElement
    var ID = tbObj.rows(rowIndex).getAttribute("ID")

    var strXml = "<Root>" + str1 + "</Root>";
    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDocSave.loadXML(strXml);

    var xmlNodeTmp = "";
    if ((strXml != "<Root></Root>") && (strXml != "<Root/>"))
        xmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/Tb[ID=" + ID + "]");
    if (xmlNodeTmp.length > 0) {
        if (obj.checked == true)
            XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
        else
            oXmlDocSave.documentElement.removeChild(XmlNodeTmp.item(0));
        str1 = oXmlDocSave.xml;
        str1 = str1.replace("<Root>", "");
        str1 = str1.replace("</Root>", "");


        //if ((strXml != "<Root></Root>") && (strXml != "<Root/>"))
        //    for (var item = 0; item < (attributesArray.length) - 1; item++) {
        //        if (attributesArray[item] != "") {
        //            var attrItem = attributesArray[item];
        //            var attrValue = tbObj.rows(rowIndex).getAttribute(attrItem);
        //            xmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/Tb[" + attrItem + "=" + attrValue + "]");
        //            if (xmlNodeTmp.length > 0) attrCounter++;
        //        }
        //    }

        //if (attrCounter == (attributesArray.length) - 1) {
        //    if (obj.checked == true)
        //        xmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
        //    else
        //        oXmlDocSave.documentElement.removeChild(xmlNodeTmp.item(0));



    } else {
        str1 += "<Tb>";
        str1 += "<Chk>1</Chk>";
        for (var count = 0; count < (attributesArray.length) - 1; count++) {
            if (attributesArray[count] != "") {
                var attribute = attributesArray[count];
                str1 += "<" + attribute + ">" + tbObj.rows(rowIndex).getAttribute("" + attribute + "") + "</" + attribute + ">";
            }
        }
        //if (attributesArray[0] != "")
        //    str1 += "<ID>" + tbObj.rows(rowIndex).getAttribute("" + attributesArray[0] + "") + "</ID>";
        str1 += "</Tb>";
    }

    // $get(MasterObj + "txttempStrChk").value = str1
}
