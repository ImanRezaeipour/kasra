window.name = "MainMonthlyReport";
document.dir = "RTL"
var str = ""
var SearchFlag = 0, win = "", DailyState = 0, DailyInfoDialogObj = null
var keyCode = 0
var RefreshRowFlag = 0, SelectRow = null
var CreditInfoDialogObj = null, CreditState = 0;
/*****************************Grid Information*******************************/
var GridName = "GrdMontly";
var Grid = GrdMontly;
var XmlGridProperty = document.getElementById(MasterObj + "txtXmlGridProperty").value;
var XmlGridSetting = document.getElementById(MasterObj + "txtXmlGridSetting").value;
var XmlGridData = document.getElementById(MasterObj + "txtXmlRptGetPersonelMonthlyReport").value;

//XmlGridData = XmlGridData.replace(/_x0020_/g, "_");

var arrGridEvent = {
    0: ["cell", "1", "", "onmouseup", onclickPersonCode]
};
/*****************************Grid Information*******************************/

/*****************************Tree Setting*******************************/
var setting = {
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {

        beforeExpand: beforeExpand,
        onClick: zTreeOnClick
    }
};

/*****************************Tree Setting*******************************/


$(document).ready(function () {
    var xml = document.getElementById(MasterObj + "TxtXmlTree").value;
    var json = $.xml2json(xml);

    $.fn.zTree.init($("#treeDemo"), setting, json.ZTreeDepartment);

    var startDate = document.getElementById(MasterObj + "SDate").value;
    var endDate = document.getElementById(MasterObj + "EDate").value;

    var revStartDate = ReverceDate(document.getElementById(MasterObj + "SDate").value);
    var revEndDate = ReverceDate(document.getElementById(MasterObj + "EDate").value);

    /*****************************Create Grid*******************************/
    var x = 0;
    var XmlDateInfo = "", XmlGrid = "";
    x = XmlGridData.search("</Tb></Root>");
    x = x + 12;
    XmlDateInfo = XmlGridData.substring(0, x);
    XmlGrid = XmlGridData.substring(x, XmlGridData.length);
    XmlGrid = XmlGrid.replace(/_x0020_/g, "_");
    BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, startDate, revStartDate, endDate, revEndDate, document.getElementById(MasterObj + "txtCompanyID").value, document.getElementById(MasterObj + "txtSessionID").value, document.getElementById(MasterObj + "txtOnLineUser").value, "", "IsSum;1", OnClickGrd, arrGridEvent, 1, true);
    SetPaging(Grid, 1, XmlGrid);
    /*****************************Create Grid*******************************/

    GetAccessBtn();
    PageLoad();

    document.body.attachEvent('onkeypress', SetEnterSearch);
    document.body.attachEvent('onkeydown', onkeydownBody);

    if ($get(MasterObj + "txtShowMonthlyChart").value != "1") {
        document.getElementById("shadowMessage").style.display = "none"
        if (document.getElementById("OToolBar_ImgRestor") != null)
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
    }
    else {
        if (document.getElementById(MasterObj + "txtShowTre").value != "1") {
            onclickImgClose()

        }
        else {
            if (typeof document.getElementById("OToolBar_ImgRestor") == "object") {
                if (document.getElementById("OToolBar_ImgRestor") != null)
                    document.getElementById("OToolBar_ImgRestor").style.display = "none"
            }
        }
    }

    if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
        document.getElementById("TDSearchTxt").style.display = "inline";
        document.getElementById("TDSearchCombo").style.display = "none";
    }
    else {
        document.getElementById("TDSearchTxt").style.display = "none";
        document.getElementById("TDSearchCombo").style.display = "inline";
    }
});




/*****************************Tree Event*******************************/
function beforeExpand(treeId, treeNode) {

    var ParentID = treeNode.id;
    var PersonID = $("#" + MasterObj + "txtOnLineUser").val();
    var CompanyID = $("#" + MasterObj + "txtCompanyID").val();
    var SessionID = $("#" + MasterObj + "txtSessionID").val();
    var PageID = $("#" + MasterObj + "txtPageID").val();

    if (treeNode.isParent && treeNode.children == undefined) {
        $.ajax({
            type: "POST",
            url: "MainMonthlyReport.aspx/GetZTreeDepartment?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{DepartmentID : 0 , DepartmentName : '' , DepartmentCode : 0, ParentID:'" + ParentID + "' , PersonID : '" + PersonID + "' , PageID : '" + PageID + "' ,CompanyID : '" + CompanyID + "' , SessionID : '" + SessionID + "'}",
            success: function (Data) {

                var XmlDept;

                XmlDept = Data.d;

                if (XmlDept != "") {
                    var xml = XmlDept;
                    var json = $.xml2json(xml);


                    var treeObj = $.fn.zTree.getZTreeObj(treeId);



                    var nodes = treeObj.getNodesByParam("id", treeNode.id, null);

                    if (nodes.length == 1) {




                        var newNode = json.ZTreeDepartment;
                        newNode = treeObj.addNodes(nodes[0], newNode);


                        nodes[0].open = false;
                    }

                }


            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("با خطا مواجه شد" + jqXHR.responseText);

            }
        });
    }



}

function zTreeOnClick(event, treeId, treeNode) {


    $get(MasterObj + "txtDepartmentID").value = treeNode.id;
    GridSearch(1);
}


/*****************************Tree Event*******************************/

/*****************************PersonCode Control*******************************/
function onclickPersonCode() {
    e = window.event;
    if (e.button == 2) {
        //alert(window.event);
        return false;
    }
    else {
        //alert(window.event);
        OpenModelPopup();
        return true;
    }
}

function onkeydownEnterPersonCode() {
    if (window.event != null)
        if (window.event.keyCode == 13) {
            if (event.srcElement.id == MasterObj + "txtPersonCode")
                OnClickBtnRefreshPersonGrid();
        }
}

function SetEnterSearch() {
    if (event.srcElement.id == MasterObj + "CmbPerson_txtPCode") {
        if (document.getElementById(MasterObj + 'cmbPerson_txtCode').value != "" && parseInt(document.getElementById(MasterObj + 'cmbPerson_txtCode').value) && window.event.keyCode == 13)
            OnClickBtnFilter()
    }
}

function OnClickPersonCode(obj) {
    //alert('22222222222');
    var row = window.event.srcelement.parentelement
    while (row.tagname != 'tr')
        row = row.parentelement
    if (dailystate != 1) {
        if (row != null) {
            var personcode = row.cells(1).innertext
            var url = "maindailyreport.aspx?personcode=" + personcode
                + "&sdate=" + document.getelementbyid(masterobj + "sdate").value
                + "&edate=" + document.getelementbyid(masterobj + "edate").value
                + "&requsterpageid=1306&requsteraction=personcode"
                + "&sessionid=" + document.getelementbyid(masterobj + "txtsessionid").value
                + "&topersonid=" + document.getelementbyid(masterobj + "txtonlineuser").value
                + "&onlineuser=" + document.getelementbyid(masterobj + "txtonlineuser").value
                + "&wpid=" + row.getattribute('workperiodid')
                + "&personname=" + row.cells(2).firstchild.innertext
            var winpro = "dialogwidth:1450px;dialogheight:1000px;center: yes;help: no;status:no#1;minimize: yes;resizable:yes"
            dailyinfodialogobj = window.showmodelessdialog(encodeuri(url), window, winpro)
        }
    }
}

function OnBlurtxtPersonCode() {

    if ($get(MasterObj + "txtPersonCode").value == "" || $get(MasterObj + "txtPersonCode").value == "0") {
        $get(MasterObj + "txtPersonName").value = "";
        $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
    }
    else {
        var PersonCode, OnLineUserID, CompanyID, SessionID;

        if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1")
            PersonCode = $("#" + MasterObj + "txtPersonCode").val();
        else
            PersonCode = $("#" + MasterObj + "CmbPerson_txtPCode").val();

        OnLineUserID = $("#" + MasterObj + "txtOnLineUser").val();


        CompanyID = $("#" + MasterObj + "txtCompanyID").val();
        SessionID = $("#" + MasterObj + "txtSessionID").val();



        // OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "MainMonthlyReport.aspx/RefreshPerson?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{PersonCode:'" + PersonCode + "' , OnLineUserID:'" + OnLineUserID + "', CompanyID:'" + CompanyID + "' , SessionID:'" + SessionID + "'}",
            success: function (Data) {

                var Result;

                Result = Data.d;

                if (Result != "") {

                    $get(MasterObj + "txtPersonName").value = Result;
                    $get(MasterObj + "txtPersonName").setAttribute("PersonCode", $get(MasterObj + "txtPersonCode").value);
                }
                else {
                    $get(MasterObj + "txtPersonCode").value = "";
                    $get(MasterObj + "txtPersonName").value = "";
                    $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
                }
                //CloseModelPopup();

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("با خطا مواجه شد" + jqXHR.responseText);
                // CloseModelPopup();
            }
        });
    }
}
/******************************************************************************************/
function onClickbtnRefreshPerson(obj) {
    var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value + "&MenuItemID=" + $get(MasterObj + "txtPageID").value;
    var strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    var Result = Result = window.showModalDialog(url, "", strOptions);
    if (Result != "" && Result != undefined) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(Result);
        oXmlDoc.setProperty("SelectionLanguage", "XPath");
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (oXmlNodes.length != 0) {
            $get(MasterObj + "txtPersonCode").value = oXmlNodes.item(0).selectSingleNode('PCode').text;
            $get(MasterObj + "txtPersonName").value = oXmlNodes.item(0).selectSingleNode('PName').text;
            $get(MasterObj + "txtPersonName").setAttribute("PersonCode", oXmlNodes.item(0).selectSingleNode('PCode').text);
        }
    }
}
/******************************************************************************************/
function OnClickBtnRefreshPersonGrid() {
    document.getElementById(MasterObj + "txtDepartmentID").value = "0"
    document.getElementById(MasterObj + "txtSearchFlag").value = "1"
    //            $get(MasterObj + "txtSubmit").value = "RefreshPersonGridSubmit";
    //            $get(MasterObj + "RefreshPersonGridSubmit").click();
    OnClickBtnFilter();
}

function CheckSearch() {
    if (document.getElementById(MasterObj + "txtSearchFlag").value == "0") {
        $get(MasterObj + "CmbPerson_txtCode").value = "";
        $get(MasterObj + "CmbPerson_txtPCode").value = "";
        $get(MasterObj + "CmbPerson_txtName").value = "";
        $get(MasterObj + "txtPersonCode").value = '';

    }
}
/*****************************PersonCode Control*******************************/

/*****************************Inputs Control Event*******************************/
function PageLoad() {
    win = window.dialogArguments

    oGrd = document.getElementById("GrdMontly")
    if (oGrd) {
        var len = oGrd.rows.length

        if (len == 3) {
            if (LastSelectedGridRow != null) {

                if (LastSelectedGridRow.rowIndex % 2 == 1) {

                    for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                        LastSelectedGridRow.cells[i].style.backgroundColor = GridItemRowStyle;
                    }
                }
                else {

                    for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                        LastSelectedGridRow.cells[i].style.backgroundColor = GridAlternatingRowStyle;
                    }
                }
            }


            LastSelectedGridRowStyle = oGrd.rows[1].cells[0].style.backgroundColor;

            LastSelectedGridRow = oGrd.rows[1]

            for (var i = 0; i < oGrd.rows[1].cells.length; ++i) {
                oGrd.rows[1].cells[i].style.backgroundColor = GridSelectedRowStyle;

            }

            RefreshCreditInfoPage()
        }
    }
    if (document.getElementById("OToolBar_BtnLoadReport") != null)
        document.getElementById("OToolBar_BtnLoadReport").style.display = "none"
    if (document.getElementById("OToolBar_BtnViewReport") != null)
        document.getElementById("OToolBar_BtnViewReport").style.display = "none"
}
function ChangeCmbPeriod() {
    $get(MasterObj + "CmbPerson_txtSWPID").value = document.getElementById(MasterObj + "CmbPeriod").value;
}

function OnClickRestore() {
    document.getElementById("shadowMessage").style.display = "inline"
    if (typeof document.getElementById("OToolBar_Restore") == "object") {
        if (document.getElementById("OToolBar_Restore") != null)
            document.getElementById("OToolBar_Restore").style.display = "none"
    }
}
//ThisPage
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "1";
    document.getElementById(MasterObj + "txtDepartmentID").value = "0";
    GridSearch(1);
}

function OnClickBtnSearch() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "0";
    $get(MasterObj + "txtDepartmentID").value = "0";
    GridSearch(1);
}

function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtSearchFlag").value = "1"
    $get(MasterObj + "SDate").value = ""
    $get(MasterObj + "EDate").value = ""
    $get(MasterObj + "txtCmbGroup").value = "0"
    $get(MasterObj + "txtCmbShift").value = "0"
    document.getElementById(MasterObj + "cmbGroup").value = 0
    document.getElementById(MasterObj + "cmbShift").value = 0
    $get(MasterObj + "chkCreditNeed").checked = false
    $get(MasterObj + "CmbPerson_txtCode").value = ""
    $get(MasterObj + "CmbPerson_txtPCode").value = ""
    $get(MasterObj + "CmbPerson_txtName").value = ""
    $get(MasterObj + "txtPersonCode").value = ""
    $get(MasterObj + "txtPersonName").value = ""
    $get(MasterObj + "txtPersonName").setAttribute("PersonCode", "");
    $get(MasterObj + "txtDepartmentID").value = $get(MasterObj + "txtOnlineDepID").value;
    //            $get(MasterObj + "txtSubmit").value = "ShowAll"
    //            $get(MasterObj + "BtnSubmit").click()
    onchangeCmbShift();
    GridSearch(1);
}
function onclickImgClose() {
    document.getElementById("shadowMessage").style.display = "none"
    if (typeof document.getElementById("OToolBar_ImgRestor") == "object") {
        if (document.getElementById("OToolBar_ImgRestor") != null)
            document.getElementById("OToolBar_ImgRestor").style.display = "inline"
    }
}
function OnClickImgRestor() {
    document.getElementById("shadowMessage").style.display = "inline"
    if (typeof document.getElementById("OToolBar_ImgRestor") == "object") {
        if (document.getElementById("OToolBar_ImgRestor") != null)
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
    }
}

function onkeydownBody() {
    keyCode = event.keyCode
    setTimeout("keyCode=0", 1000)
}
function OnClickBtnCalc() {
    if (LastSelectedGridRow != null)
        document.getElementById(MasterObj + "txtRowPersonID").value = LastSelectedGridRow.cells(1).innerText
    if (keyCode == 16) // =>  را گرفته براي همه محاسبه کن shift اگر کليد
        document.getElementById(MasterObj + "txtRowPersonID").value = "0"
    //در صورتی که قبلا پرسنلی را جستجو نموده محاسبه را روی همان نفر انجام دهد
    if (SearchFlag == 1) {
        if ($get(MasterObj + "CmbPerson_txtCode").value != "")
            $get(MasterObj + "txtRowPersonID").value = $get(MasterObj + "CmbPerson_txtCode").value;
        if ($get(MasterObj + "txtPersonName").value != "")
            $get(MasterObj + "txtRowPersonID").value = $get(MasterObj + "txtPersonName").getAttribute("PersonCode");
    }
    if ($get(MasterObj + "txtRowPersonID").value != "") {
        Calculate();
    }
    else {
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
        return
    }
}

function Calculate() {


    var PersonID, SDate, EDate, OnLineUserID, CompanyID, SessionID;

    PersonID = $get(MasterObj + "txtRowPersonID").value;

    SDate = document.getElementById(MasterObj + "SDate").value;
    EDate = document.getElementById(MasterObj + "EDate").value;

    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/Calculate?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ PersonID:'" + PersonID + "' ,SDate :'" + SDate + "' ,EDate:'" + EDate + "' ,OnLineUserID:'" + OnLineUserID + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;



            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(xmlSave)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {

                $get(MasterObj + "txtAlert").value = xmlNodes.item(0).selectSingleNode("Alert").text;
                $get(MasterObj + "txtValidate").value = xmlNodes.item(0).selectSingleNode("Validate").text;

                if ($get(MasterObj + "txtValidate").value == "1")
                    SetMsg($get(MasterObj + "txtAlert").value)
                else
                    alert($get(MasterObj + "txtAlert").value)

            }

            var GridCurPage = 0;
            if (document.getElementById('TxtGridCurPage').value != "" && document.getElementById('TxtGridCurPage').value != "0") {
                GridCurPage = document.getElementById('TxtGridCurPage').value;
            }
            else {
                GridCurPage = 1;
            }

            GridSearch(GridCurPage);
            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}
function OnClickbtnCodeLimit() {
    var strUrl = "/TAPresentation/App_Pages/DataEntry/DefineLimitOnCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&MenuPage=0"
    strUrl = encodeURI(strUrl)
    window.showModalDialog(strUrl, '', 'dialogHeight: 770px;dialogWidth:800px;center: Yes;help: no;status: no')
}
function OnClickbtnDefinitionDayStructure() {
    url = "/TAPresentation/App_Pages/Schedule/DefinitionDayStructure.aspx?ModalFlag=1"
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 550px;dialogWidth: 800px;center: Yes;help: no;status: no")
}

function CheckDailyClick() {
    oGrd = document.getElementById("GrdMontly")
    if (oGrd)
        var len = oGrd.rows.length
    else
        return
    var oCell = window.event.srcElement, oRow = window.event.srcElement
    while (oCell.tagName != "TD")
        oCell = oCell.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    if (oRow.rowIndex == len - 1) //روي سطر جمع کليک شده است
        return
    if (DailyState == 1 && oCell.cellIndex == 1)
        RefreshDailyPage()
    if (CreditState == 1)
        RefreshCreditInfoPage()
}
function onchangeCmbShift() {
    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ShiftID, CompanyID;

    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;





    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/CmbShift_OnChange?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ ShiftID:'" + ShiftID + "' ,CompanyID:'" + CompanyID + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            if (xmlSave != "") {
                document.getElementById(MasterObj + "cmbGroup").innerHTML = "";

                var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                xmlDoc.loadXML(xmlSave)
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/GetGroupOfSchedule");
                if (xmlNodes.length > 0) {

                    for (var i = 0; i < xmlNodes.length; ++i) {
                        var option = document.createElement('option');
                        option.text = xmlNodes.item(i).selectSingleNode("Title").text;
                        option.value = xmlNodes.item(i).selectSingleNode("Val").text;
                        document.getElementById(MasterObj + "cmbGroup").add(option, i);
                    }

                }
            }





        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);

        }
    });
}
function onchangecmbGroup() {
    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value
    var ShiftID, CompanyID;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;





    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/CmbGroup_OnChange?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ GroupID:'" + GroupID + "' ,CompanyID:'" + CompanyID + "' }",
        success: function (Data) {

            var ShiftID;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            ShiftID = Data.d;

            document.getElementById(MasterObj + "cmbShift").value = ShiftID;
            document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value;




        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);

        }
    });
}
function OnClickbtnCardtable() {
    var resource = ""
    if ($get(MasterObj + "txtNewWFO").value == "1") {
        if ($get(MasterObj + "txtShowWorkCartable").value == "1")
            resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/ShowCartable.aspx";
        else
            resource = "/FrmPresentation/App_Pages/BaseInfo/WorkFlow/CartableNew.aspx";
    }
    else
        resource = "../DataEntry/CreditManagement.aspx";
    if (LastSelectedGridRow == null) {
        SD = document.getElementById(MasterObj + "SDate").value
        ED = document.getElementById(MasterObj + "EDate").value
        url = resource + "?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                    + "&SDate=" + encode64(SD)
                    + "&EDate=" + encode64(SD)
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        // + "&PersonCode=" + $get(MasterObj + "txtOnLineUser").value
                    + "&Creator= "
                    + "&Flag=1"
                    + "&HashFlag=1";
        var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        window.showModalDialog(url, window, winPro)
    }
    else {
        SD = document.getElementById(MasterObj + "SDate").value
        ED = document.getElementById(MasterObj + "EDate").value
        url = resource + "?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                    + "&SDate=" + encode64(SD)
                    + "&EDate=" + encode64(SD)
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        // + "&PersonCode=" + $get(MasterObj + "txtOnLineUser").value
                    + "&Creator=" + LastSelectedGridRow.cells(1).innerText
                    + "&Flag=1"
                    + "&HashFlag=1";
        var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        window.showModalDialog(url, window, winPro)
    }
}
function OnClickbtnCalendar() {
    if (LastSelectedGridRow == null) {
        alert('لطفا يک سطر ازگريد انتخاب کنيد')
        return
    }
    else {
        var url = "/Ta/TAPeresentation/Pages/SpecialCal/SpecialCal.aspx?GroupId=0&PersonId=" + LastSelectedGridRow.cells(1).innerText //LastSelectedGridRow.getAttribute("personelid")
                + "&P=1" + "&SDate=" + document.getElementById(MasterObj + "SDate").value
                + "&PersonCode=" + LastSelectedGridRow.cells(1).innerText + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 1000px;center: Yes;help: no;status: no")
    }
}
function OnClickbtnDefineGroup() {
    if (LastSelectedGridRow == null)
        var url = "/TAPresentation/App_Pages/Schedule/DefineGroup.aspx?PersonId=" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonCode="
    else
        var url = "/TAPresentation/App_Pages/Schedule/DefineGroup.aspx?PersonId=" + LastSelectedGridRow.cells(1).innerText + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonCode=" + encode64(LastSelectedGridRow.cells(1).innerText) + "&HashFlag=1";
    var returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 1000px;center: Yes;help: no;status: no")
}
function OnClickBtnRegCredit() {

    var PersonID = '', PersonName = '', PCode = ''
    if (LastSelectedGridRow != null) {
        PersonID = LastSelectedGridRow.getAttribute("personelid")
        PersonName = LastSelectedGridRow.cells(2).firstChild.innerText
        PCode = LastSelectedGridRow.cells(1).innerText
    }
    var url = "../DataEntry/RegisterCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&PCode=" + encode64(PCode)
            + "&SDate=" + encode64(document.getElementById(MasterObj + "SDate").value)
            + "&EDate=" + encode64(document.getElementById(MasterObj + "EDate").value)
    //            + "&PCode=" + (PCode)
    //            + "&SDate=" + (document.getElementById(MasterObj + "SDate").value)
    //            + "&EDate=" + (document.getElementById(MasterObj + "EDate").value)
            + "&Name=" + PersonName
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&MonthlyPage=1"
            + "&HashFlag=1";
    var returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no")
}
function OnClickbtnDefineٌWorkTimes() {
    var url = "/Ta/TAPeresentation/Pages/BaseInfo/DefineWorkTimes.aspx?flag=11" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    var returnValue = window.showModalDialog(url, window, "dialogHeight: 750px;dialogWidth: 1000px;center: Yes;help: no;status: no")
}
function OnClickbtnReplaceChanges() {
    if (LastSelectedGridRow == null) {
        url = "/Ta/TAPeresentation/Pages/BaseInfo/RplaceChanges.aspx?flag=11" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 900px;center: Yes;help: no;status: no")
    }
    else {
        url = "/Ta/TAPeresentation/Pages/BaseInfo/RplaceChanges.aspx?flag=11" + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonID=" + LastSelectedGridRow.getAttribute("personelid")
                + "&PersonCode=" + LastSelectedGridRow.cells(1).innerText
        returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 900px;center: Yes;help: no;status: no")
    }
}
function OnClickBtnWPResult() {
    if (LastSelectedGridRow == "" || LastSelectedGridRow == null) {
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
    }
    else {
        var url = "WPResult.aspx?WorkPeriodID=" + document.getElementById(MasterObj + "CmbPeriod").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonCode=" + LastSelectedGridRow.cells(1).firstChild.innerText;
        window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 1180px;center: Yes;help: no;status: no");
    }
}
function OnClickBtnDailyResult() {
    if (LastSelectedGridRow != "" && LastSelectedGridRow != null) {
        var url = "DailyResult.aspx?SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonCode=" + LastSelectedGridRow.cells(1).firstChild.innerText;
        window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 1180px;center: Yes;help: no;status: no");
    }
    else
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
}
function OnClickBtnDefineTaradod() {
    if (LastSelectedGridRow == null) {
        url = "/Ta/TAPeresentation/Pages/Credit/DefineTaradod.aspx?flag=11&PersonId=" + "0" + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 780px;center: Yes;help: no;status: no")
    }
    else {
        url = "/Ta/TAPeresentation/Pages/Credit/DefineTaradod.aspx?flag=11&PersonId=" + LastSelectedGridRow.getAttribute("personelid") + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 780px;center: Yes;help: no;status: no")
    }
}

function OnClickChkChildren(obj) {
    if (obj.checked == false)
        document.getElementById(MasterObj + "txtDepartmentID").value = 0
    else
        document.getElementById(MasterObj + "txtDepartmentID").value = document.getElementById(MasterObj + "txtOnlineDepID").value
}

function OnClickBtnCreditInfo() {
    if (document.getElementById(MasterObj + "txtShowDocInfoNew").value == "1")
        resource = "DocInfoNew.aspx";
    else
        resource = "DocInfo.aspx";
    var winPro = "dialogHeight: 550px;dialogWidth: 1100px;Bottom:0pX;center: no;help: no;resizable:1;status: no;minimize: yes;"
    //"dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no;resizable=1;minimize: yes"
    if (LastSelectedGridRow != null) {
        var PersonID = LastSelectedGridRow.cells(1).innerText
        var url = resource
               + "?PersonCode=" + encode64(PersonID)
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&PageMode=1&GrdHeight=480px"
               + "&PersonName=" + LastSelectedGridRow.cells(2).innerText
               + "&WPeriodID=" + document.getElementById(MasterObj + "CmbPeriod").value
               + "&SDate=" + encode64(document.getElementById(MasterObj + "SDate").value)
               + "&EDate=" + encode64(document.getElementById(MasterObj + "EDate").value)
               + "&HashFlag=1";
        CreditState = 1
        CreditInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
    }
    else {
        alert('لطفا یک سطر از گرید انتخاب کنيد')
    }
}

function OnClickBtnCodeReport() {
    var url = "../BaseInfo/DetailCodeReport.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ReportID=1"
    window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;help: no;resizable:1;status: no;")
}
function OnClickBtnCardexInfo() {
    if (LastSelectedGridRow != null && LastSelectedGridRow != "") {
        var url2 = "../Cardex/CardexReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&PersonCode=" + encode64(LastSelectedGridRow.cells(1).innerText)
               + "&WPID=" + document.getElementById(MasterObj + "CmbPeriod").value
               + "&HashFlag=1";
        var winPro = "dialogHeight:600px;dialogWidth:900px;center: Yes;help: no;status: no"
        //        alert(url2)
        var CardexInfoDialogObj = window.showModalDialog(encodeURI(url2), window, winPro)
    }
    else
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
}
function OnClickBtnBackupDaily() {
    document.getElementById(MasterObj + "txtSubmit").value = "BackupDaily"
    document.getElementById(MasterObj + "BtnBackup").click()
}
function OnClickBtnBackupWPResult() {
    document.getElementById(MasterObj + "txtSubmit").value = "BackupWPResult"
    document.getElementById(MasterObj + "BtnBackup").click()
}
function OnClickBtnTolerance() {
    var Url = "../Schedule/Tolerance.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:500px;dialogWidth:730px;center: Yes;help: no;status: no")
}
function OnClickBtnRegisterCredit() {
    var Url = "../DataEntry/Admin/AdminCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no")
}
function OnClickBtnRegisterCreditNew() {
    var Url = "../DataEntry/Admin/AdminCreditNew.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    window.showModalDialog(Url, window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no")
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnReplaceShift() {
    var url = "../DataEntry/SchedulingProg.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModelessDialog(encodeURI(url), window, "dialogHeight:" + screen.height + ";dialogWidth:" + screen.width + ";center: Yes;help: no;status: no;resizable=1;minimize: yes")
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnRequestDuty() {
    var PersonID = '', PersonName = '', PCode = ''
    if (LastSelectedGridRow != null) {
        PersonID = LastSelectedGridRow.getAttribute("personelid")
        PersonName = LastSelectedGridRow.cells(2).firstChild.innerText
        PCode = LastSelectedGridRow.cells(1).innerText
    }
    var url = "DefineDutyCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&PCode=" + encode64(PCode)
            + "&SDate=" + encode64(document.getElementById(MasterObj + "SDate").value)
            + "&EDate=" + encode64(document.getElementById(MasterObj + "EDate").value)
            + "&Name=" + PersonName
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&MonthlyPage=1"
            + "&HashFlag=1";
    var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
    var returnValue = window.showModalDialog(encodeURI(url), window, DialogProperty)
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnRequestIO() {
    var PersonCode = "", HashFlag = "";
    if (LastSelectedGridRow != null && LastSelectedGridRow != "") {
        PersonCode = encode64(LastSelectedGridRow.cells(1).firstChild.innerText);
        HashFlag = 1;
    }
    var url = "../DataEntry/RegisterGooing.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&PersonCode=" + PersonCode
            + "&HashFlag=" + HashFlag;
    window.showModalDialog(encodeURI(url), window, "dialogHeight:300px;dialogWidth:630px;center: Yes;help: no;status: no")
}
//----------------------------------------------------------------------------------------------------------------------
function OnClickBtnScheduleChange() {
    var url = "../DataEntry/ShiftRequest.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    var DialogProperty = "dialogHeight:300px;dialogWidth:650px;center: Yes;help: no;status: no;resizable=1"
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
}

function OnClickBtnDayContinuation() {
    var url = "../DataEntry/RequestDayContinuation.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnMonthly() {
    if (LastSelectedGridRow != null) {
        PersonCode = LastSelectedGridRow.cells(1).innerText
    } else
        PersonCode = '';
    var url = "../DataEntry/RequestMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnChangeStructure() {
    if (LastSelectedGridRow != null) {
        PersonCode = LastSelectedGridRow.cells(1).innerText
    } else
        PersonCode = '';
    var url = "../DataEntry/RegisterChangeStructure.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDailyItem() {
    if (LastSelectedGridRow != null) {
        PersonCode = LastSelectedGridRow.cells(1).innerText
    } else
        PersonCode = '';
    var url = "../DataEntry/RequestDailyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&PCode=" + PersonCode
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnRepeatMonthlyItem() {
    var url = "../DataEntry/RequestRepeatMonthlyItem.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
    returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no")
    if (returnValue == 1)
        OnClickBtnFilter();
}

//--------------------------------------------------------------
function OnClickBtnDashbordPersoneli() {
    if (LastSelectedGridRow != null && LastSelectedGridRow != "") {
        var url = "/FrmPresentation/App_Pages/BaseInfo/personelDashboard.aspx"
               + "?SessionID=" + $get(MasterObj + "txtSessionID").value
               + "&PersonCode=" + encode64(LastSelectedGridRow.cells(1).innerText)
               + "&Date=" + encode64($get(MasterObj + "SDate").value)
               + "&HashFlag=1";
        var winPro = "dialogHeight:600px;dialogWidth:900px;center: Yes;help: no;status: no"
        window.showModalDialog(encodeURI(url), window, winPro)
    }
    else
        alert('لطفا يک سطر از گريد را انتخاب کنيد')
}

function OnClickBtnCalculateTrace() {
    if (LastSelectedGridRow == null) {
        alert('لطفا يک سطر ازگريد انتخاب کنيد');
        return;
    }
    else {
        var url = "/TAPresentation/App_Pages/SystemTrace/CalculateTrace.aspx?PersonCode=" + LastSelectedGridRow.cells(1).innerText
               + "&Date=" + document.getElementById(MasterObj + "SDate").value
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value;

        var winPro = "dialogWidth:1300px;dialogHeight:800px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
        DailyInfoDialogObj = window.showModelessDialog(encodeURI(url), window, winPro);
    }
}
/*****************************Inputs Control Event*******************************/

/*****************************Grid Control Event*******************************/
function Grid_RowDataBound(oGrid) {

    var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
    var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
    var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];

    Header.rows[0].cells[5].style.backgroundColor = "#ffdfe7";
    Header.rows[0].cells[8].style.backgroundColor = "#ffdfe7";

    for (var i = 0; i < Body.rows.length; ++i) {

        if (Body.rows[i].find == 1) {
            for (var f = 0; f < Body.rows[i].cells.length; ++f) {
                Body.rows[i].cells[f].style.backgroundColor = "#ffdfe7";
            }

        }

        if (Body.rows[i].cells[2].firstChild != null && Body.rows[i].cells[2].firstChild!=undefined)
            Body.rows[i].cells[2].firstChild.style.textDecoration = "none";
        else
            Body.rows[i].cells[2].style.textDecoration = "none";

        Body.rows[i].cells[5].firstChild.style.color = "Red";
        Body.rows[i].cells[8].firstChild.style.color = "Red";

        if ($get(MasterObj + "TxtLKasr").value == 2) {
            Body.rows[i].cells[5].firstChild.onclick = "";
            Body.rows[i].cells[5].firstChild.style.color = "";
            Body.rows[i].cells[5].firstChild.style.textDecoration = "none";
            Body.rows[i].cells[5].firstChild.style.cursor = "none";
        }

        if ($get(MasterObj + "TxtLMazad").value == 2) {
            Body.rows[i].cells[8].firstChild.onclick = "";
            Body.rows[i].cells[8].firstChild.style.color = "";
            Body.rows[i].cells[8].firstChild.style.textDecoration = "none";
            Body.rows[i].cells[8].firstChild.style.cursor = "none";
        }




    }

    oGrd = document.getElementById("GrdMontly")
    if (oGrd) {
        var len = oGrd.rows.length

        if (len == 3) {
            if (LastSelectedGridRow != null) {

                if (LastSelectedGridRow.rowIndex % 2 == 1) {

                    for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                        LastSelectedGridRow.cells[i].style.backgroundColor = GridItemRowStyle;
                    }
                }
                else {

                    for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                        LastSelectedGridRow.cells[i].style.backgroundColor = GridAlternatingRowStyle;
                    }
                }
            }


            LastSelectedGridRowStyle = oGrd.rows[1].cells[0].style.backgroundColor;

            LastSelectedGridRow = oGrd.rows[1]

            for (var i = 0; i < oGrd.rows[1].cells.length; ++i) {
                oGrd.rows[1].cells[i].style.backgroundColor = GridSelectedRowStyle;
            }

            RefreshCreditInfoPage()
        }
    }


}

function GridSearch(PageNumber) {


    if (document.getElementById(MasterObj + "txtSearchFlag").value == "1") {
        SearchFlag = 1;
    }
    else {
        SearchFlag = 0;
    }

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ReportID, OnLineUserID, WPID, DepartmentID, Children, ShowManager, GroupID, ShiftID, PageSize, CompanyID, SessionID, Seach, CreditNeed;

    ReportID = 1;
    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;
    WPID = document.getElementById(MasterObj + "CmbPeriod").value;



    if (document.getElementById(MasterObj + 'txtDepartmentID').value == "" || document.getElementById(MasterObj + 'txtDepartmentID').value == "0")
        document.getElementById(MasterObj + 'txtDepartmentID').value = "0";

    DepartmentID = document.getElementById(MasterObj + 'txtDepartmentID').value;

    if (document.getElementById(MasterObj + 'chkChildren').checked)
        Children = 1;
    else
        Children = 0;

    if (document.getElementById(MasterObj + 'chkManager').checked)
        ShowManager = 1;
    else
        ShowManager = 0;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;
    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    PageSize = document.getElementById(MasterObj + 'txtPageSize').value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    if (document.getElementById(MasterObj + 'txtPersonCode').value != "")
        Search = document.getElementById(MasterObj + 'txtPersonCode').value;
    else
        Search = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

    if (document.getElementById(MasterObj + 'chkCreditNeed').checked)
        CreditNeed = 1;
    else
        CreditNeed = 0;



    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/GenerateGridXmlData?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonID:'" + OnLineUserID + "', WPID:'" + WPID + "' , DepartmentID:'" + DepartmentID + "' , ChkChildren:'" + Children + "' ,ChkShowManager:'" + ShowManager + "' ,GroupID:'" + GroupID + "' , ShiftID:'" + ShiftID + "' ,PageSize:'" + PageSize + "' ,PageNumber :'" + PageNumber + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Search:'" + Search + "' ,CreditNeed:'" + CreditNeed + "' ,SearchFlag:'" + SearchFlag + "' }",
        success: function (Data) {

            var xmlSave;
            //                        if (window.ActiveXObject) {
            //                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            //                            xmlSave.async = 'false';
            //                            xmlSave.loadXML(Data.d);
            //                        } else {
            //                            var parser = new DOMParser();
            //                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
            //                        }
            xmlSave = Data.d;

            var x = 0;
            var XmlDateInfo = "", XmlGrid = "";
            x = xmlSave.search("</Tb></Root>");
            x = x + 12;
            XmlDateInfo = xmlSave.substring(0, x);
            XmlGrid = xmlSave.substring(x, xmlSave.length);
            XmlGrid = XmlGrid.replace(/_x0020_/g, "_");

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(XmlDateInfo)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            if (xmlNodes.length == 1) {
                document.getElementById(MasterObj + "SDate").value = xmlNodes.item(0).selectSingleNode("SDate").text;
                document.getElementById(MasterObj + "EDate").value = xmlNodes.item(0).selectSingleNode("EDate").text;

                if (xmlNodes.item(0).selectSingleNode("WPID").text == "0")
                    document.getElementById(MasterObj + "CmbPeriod").value = WPID;
                else
                    document.getElementById(MasterObj + "CmbPeriod").value = xmlNodes.item(0).selectSingleNode("WPID").text;

            }

            var StartDate = document.getElementById(MasterObj + "SDate").value;
            var EndDate = document.getElementById(MasterObj + "EDate").value;

            var revStartDate = ReverceDate(document.getElementById(MasterObj + "SDate").value);
            var revEndDate = ReverceDate(document.getElementById(MasterObj + "EDate").value);

            BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, StartDate, revStartDate, EndDate, revEndDate, CompanyID, SessionID, OnLineUserID, "", "IsSum;1", OnClickGrd, arrGridEvent, 1, true);
            SetPaging(Grid, PageNumber, XmlGrid);
            //LastSelectedGridRow = null;

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}



function OnClickGrd() {

    CheckDailyClick()
}

function Filter() {

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value
    SearchFlag = 1
    //            document.getElementById(MasterObj + "txtSubmit").value = "Search"
    //            document.getElementById(MasterObj + "BtnSubmit").click()
}

function RefreshThisRow() {
    SelectRow = window.event.srcElement.parentElement
    while (SelectRow.tagName != 'TR')
        SelectRow = SelectRow.parentElement
    document.getElementById(MasterObj + "txtRPID").value = SelectRow.getAttribute("personelid")
    RefreshRowFlag = 1
    //            $get(MasterObj + "txtSubmit").value = "RefreshRow";
    //            $get(MasterObj + "BtnSubmit2").click()
}
function RefreshThisRowCreditInfo() {
    SelectRow = LastSelectedGridRow
    if (SelectRow == null)
        return
    document.getElementById(MasterObj + "txtRPID").value = SelectRow.getAttribute("personelid")
    RefreshRowFlag = 1
    //            $get(MasterObj + "txtSubmit").value = "RefreshRow";
    //            $get(MasterObj + "BtnSubmit2").click()
}
function UpdateRow() {
    //            var resultVal = document.getElementById(MasterObj + "txtXmlRowInfo").value
    //            if (document.getElementById(MasterObj + "txtXmlRowInfo").value == ""
    //            || document.getElementById(MasterObj + "txtXmlGridSetting").value == "")
    //                return
    //            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    //            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlRowInfo").value)
    //            xmlDoc.setProperty("SelectionLanguage", "XPath")
    //            var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/RptGetPersonelMainReport")
    //            var xmlDoc1 = new ActiveXObject("MsXml2.DomDocument")
    //            xmlDoc1.loadXML(document.getElementById(MasterObj + "txtXmlGridSetting").value)



    //            xmlDoc1.setProperty("SelectionLanguage", "XPath")
    //            var xmlNodes1 = xmlDoc1.documentElement.selectNodes("/NewDataSet/GridSetting[Attributable=0]")
    //            var len1 = xmlNodes1.length, OGrid = document.getElementById(MasterObj + "GrdMontly")
    //            if (!OGrid)
    //                return
    //            var colName, GLen = OGrid.rows.length, SumRow
    //            for (var i = 0; i < len1; i++) {
    //                colName = xmlNodes1.item(i).selectSingleNode("ColName").text
    //                colName = ReplaceAll(colName, " ", "_")
    //                if (xmlDoc.selectSingleNode("/ReportsEntity/RptGetPersonelMainReport/" + colName) != null) {
    //                    if (ReplaceAll(xmlNodes.item(0).selectSingleNode(colName).text, " ", "") == "") {
    //                        SelectRow.cells(i + 1).style.textDecoration = "none"
    //                        SelectRow.cells(i + 1).firstChild.style.textDecoration = "none"
    //                    }
    //                    SelectRow.cells(i + 1).firstChild.innerText = xmlNodes.item(0).selectSingleNode(colName).text
    //                }
    //            }
}

function BtnSendToExcel_OnClick() {


    if (document.getElementById(MasterObj + "txtSearchFlag").value == "1") {
        SearchFlag = 1;
    }
    else {
        SearchFlag = 0;
    }

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ReportID, OnLineUserID, WPID, DepartmentID, Children, ShowManager, GroupID, ShiftID, PageNumber, PageSize, CompanyID, SessionID, Seach, CreditNeed;

    ReportID = 1;
    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;
    WPID = document.getElementById(MasterObj + "CmbPeriod").value;



    if (document.getElementById(MasterObj + 'txtDepartmentID').value == "" || document.getElementById(MasterObj + 'txtDepartmentID').value == "0")
        document.getElementById(MasterObj + 'txtDepartmentID').value = "0";

    DepartmentID = document.getElementById(MasterObj + 'txtDepartmentID').value;

    if (document.getElementById(MasterObj + 'chkChildren').checked)
        Children = 1;
    else
        Children = 0;

    if (document.getElementById(MasterObj + 'chkManager').checked)
        ShowManager = 1;
    else
        ShowManager = 0;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;
    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    PageSize = document.getElementById(MasterObj + 'txtPageSize').value;

    PageNumber = document.getElementById('TxtGridCurPage').value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    if (document.getElementById(MasterObj + 'txtPersonCode').value != "")
        Search = document.getElementById(MasterObj + 'txtPersonCode').value;
    else
        Search = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

    if (document.getElementById(MasterObj + 'chkCreditNeed').checked)
        CreditNeed = 1;
    else
        CreditNeed = 0;



    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/SendExcel?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonID:'" + OnLineUserID + "', WPID:'" + WPID + "' , DepartmentID:'" + DepartmentID + "' , ChkChildren:'" + Children + "' ,ChkShowManager:'" + ShowManager + "' ,GroupID:'" + GroupID + "' , ShiftID:'" + ShiftID + "' ,PageSize:'" + PageSize + "' ,PageNumber :'" + PageNumber + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Search:'" + Search + "' ,CreditNeed:'" + CreditNeed + "' ,SearchFlag:'" + SearchFlag + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/ExcelReport/RptGetPersonelMonthlyReport.xls");
            }

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });


}

function BtnSendAllToExcel_OnClick() {


    if (document.getElementById(MasterObj + "txtSearchFlag").value == "1") {
        SearchFlag = 1;
    }
    else {
        SearchFlag = 0;
    }

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ReportID, OnLineUserID, WPID, DepartmentID, Children, ShowManager, GroupID, ShiftID, PageNumber, PageSize, CompanyID, SessionID, Seach, CreditNeed;

    ReportID = 1;
    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;
    WPID = document.getElementById(MasterObj + "CmbPeriod").value;



    if (document.getElementById(MasterObj + 'txtDepartmentID').value == "" || document.getElementById(MasterObj + 'txtDepartmentID').value == "0")
        document.getElementById(MasterObj + 'txtDepartmentID').value = "0";

    DepartmentID = document.getElementById(MasterObj + 'txtDepartmentID').value;

    if (document.getElementById(MasterObj + 'chkChildren').checked)
        Children = 1;
    else
        Children = 0;

    if (document.getElementById(MasterObj + 'chkManager').checked)
        ShowManager = 1;
    else
        ShowManager = 0;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;
    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    PageSize = "0";

    PageNumber = "0";

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    if (document.getElementById(MasterObj + 'txtPersonCode').value != "")
        Search = document.getElementById(MasterObj + 'txtPersonCode').value;
    else
        Search = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

    if (document.getElementById(MasterObj + 'chkCreditNeed').checked)
        CreditNeed = 1;
    else
        CreditNeed = 0;



    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/SendExcel?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonID:'" + OnLineUserID + "', WPID:'" + WPID + "' , DepartmentID:'" + DepartmentID + "' , ChkChildren:'" + Children + "' ,ChkShowManager:'" + ShowManager + "' ,GroupID:'" + GroupID + "' , ShiftID:'" + ShiftID + "' ,PageSize:'" + PageSize + "' ,PageNumber :'" + PageNumber + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Search:'" + Search + "' ,CreditNeed:'" + CreditNeed + "' ,SearchFlag:'" + SearchFlag + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/ExcelReport/RptGetPersonelMonthlyReport.xls");
            }

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });


}

function BtnSendToPDF_OnClick(GridID) {
    if (document.getElementById(MasterObj + "txtSearchFlag").value == "1") {
        SearchFlag = 1;
    }
    else {
        SearchFlag = 0;
    }

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ReportID, OnLineUserID, WPID, DepartmentID, Children, ShowManager, GroupID, ShiftID, PageNumber, PageSize, CompanyID, SessionID, Seach, CreditNeed;

    ReportID = 1;
    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;
    WPID = document.getElementById(MasterObj + "CmbPeriod").value;



    if (document.getElementById(MasterObj + 'txtDepartmentID').value == "" || document.getElementById(MasterObj + 'txtDepartmentID').value == "0")
        document.getElementById(MasterObj + 'txtDepartmentID').value = "0";

    DepartmentID = document.getElementById(MasterObj + 'txtDepartmentID').value;

    if (document.getElementById(MasterObj + 'chkChildren').checked)
        Children = 1;
    else
        Children = 0;

    if (document.getElementById(MasterObj + 'chkManager').checked)
        ShowManager = 1;
    else
        ShowManager = 0;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;
    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    PageSize = document.getElementById(MasterObj + 'txtPageSize').value;

    PageNumber = document.getElementById('TxtGridCurPage').value;

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    if (document.getElementById(MasterObj + 'txtPersonCode').value != "")
        Search = document.getElementById(MasterObj + 'txtPersonCode').value;
    else
        Search = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

    if (document.getElementById(MasterObj + 'chkCreditNeed').checked)
        CreditNeed = 1;
    else
        CreditNeed = 0;



    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/SendPDF?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonID:'" + OnLineUserID + "', WPID:'" + WPID + "' , DepartmentID:'" + DepartmentID + "' , ChkChildren:'" + Children + "' ,ChkShowManager:'" + ShowManager + "' ,GroupID:'" + GroupID + "' , ShiftID:'" + ShiftID + "' ,PageSize:'" + PageSize + "' ,PageNumber :'" + PageNumber + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Search:'" + Search + "' ,CreditNeed:'" + CreditNeed + "' ,SearchFlag:'" + SearchFlag + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/PDFReport/RptGetPersonelMonthlyReport.pdf");
            }

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });

}

function BtnSendAllToPDF_OnClick(GridID) {
    if (document.getElementById(MasterObj + "txtSearchFlag").value == "1") {
        SearchFlag = 1;
    }
    else {
        SearchFlag = 0;
    }

    document.getElementById(MasterObj + "txtCmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value
    document.getElementById(MasterObj + "txtCmbShift").value = document.getElementById(MasterObj + "cmbShift").value

    var ReportID, OnLineUserID, WPID, DepartmentID, Children, ShowManager, GroupID, ShiftID, PageNumber, PageSize, CompanyID, SessionID, Seach, CreditNeed;

    ReportID = 1;
    OnLineUserID = document.getElementById(MasterObj + 'txtOnLineUser').value;
    WPID = document.getElementById(MasterObj + "CmbPeriod").value;



    if (document.getElementById(MasterObj + 'txtDepartmentID').value == "" || document.getElementById(MasterObj + 'txtDepartmentID').value == "0")
        document.getElementById(MasterObj + 'txtDepartmentID').value = "0";

    DepartmentID = document.getElementById(MasterObj + 'txtDepartmentID').value;

    if (document.getElementById(MasterObj + 'chkChildren').checked)
        Children = 1;
    else
        Children = 0;

    if (document.getElementById(MasterObj + 'chkManager').checked)
        ShowManager = 1;
    else
        ShowManager = 0;

    GroupID = document.getElementById(MasterObj + "txtCmbGroup").value;
    ShiftID = document.getElementById(MasterObj + "txtCmbShift").value;

    PageSize = "0";

    PageNumber = "0";

    CompanyID = document.getElementById(MasterObj + "txtCompanyID").value;

    SessionID = document.getElementById(MasterObj + "txtSessionID").value;


    if (document.getElementById(MasterObj + 'txtPersonCode').value != "")
        Search = document.getElementById(MasterObj + 'txtPersonCode').value;
    else
        Search = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

    if (document.getElementById(MasterObj + 'chkCreditNeed').checked)
        CreditNeed = 1;
    else
        CreditNeed = 0;



    OpenModelPopup();
    $.ajax({
        type: "POST",
        url: "MainMonthlyReport.aspx/SendPDF?SubmitMode=Ajax",
        contentType: "application/json; charset=utf-8",
        data: "{ReportID:'" + ReportID + "' , PersonID:'" + OnLineUserID + "', WPID:'" + WPID + "' , DepartmentID:'" + DepartmentID + "' , ChkChildren:'" + Children + "' ,ChkShowManager:'" + ShowManager + "' ,GroupID:'" + GroupID + "' , ShiftID:'" + ShiftID + "' ,PageSize:'" + PageSize + "' ,PageNumber :'" + PageNumber + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Search:'" + Search + "' ,CreditNeed:'" + CreditNeed + "' ,SearchFlag:'" + SearchFlag + "' }",
        success: function (Data) {

            var Result;

            Result = Data.d;

            if (Result == 1) {
                window.open("/TAPresentation/PDFReport/RptGetPersonelMonthlyReport.pdf");
            }

            CloseModelPopup();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("با خطا مواجه شد" + jqXHR.responseText);
            CloseModelPopup();
        }
    });
}

/*****************************Grid Control Event*******************************/

/****************************Other*******************************/
var keyStr = "ABCDEFGHIJKLMNOP" +
                "QRSTUVWXYZabcdef" +
                "ghijklmnopqrstuv" +
                "wxyz0123456789+/" +
                "=";
function encode64(input) {

    input = escape(input);

    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;

    do {

        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (isNaN(chr2)) {
            enc3 = enc4 = 64;

        } else if (isNaN(chr3)) {
            enc4 = 64;
        }

        output = output +
            keyStr.charAt(enc1) +
            keyStr.charAt(enc2) +
            keyStr.charAt(enc3) +
            keyStr.charAt(enc4);

        chr1 = chr2 = chr3 = "";
        enc1 = enc2 = enc3 = enc4 = "";
    } while (i < input.length);
    return output;
}

function RefreshCreditInfoPage() {
    try {
        if (CreditInfoDialogObj) {

            CreditInfoDialogObj.document.getElementById(MasterObj + "txtDocMemberCode").value = LastSelectedGridRow.cells(1).innerText
            CreditInfoDialogObj.document.getElementById(MasterObj + "CmbWorkPeriod").value = document.getElementById(MasterObj + "CmbPeriod").value
            var sDate = document.getElementById(MasterObj + "SDate").value
            var eDate = document.getElementById(MasterObj + "EDate").value
            var rsDate, reDate
            rsDate = sDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
            reDate = eDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = rsDate + "  " + CreditInfoDialogObj.F_adbsghh(rsDate)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = reDate + "  " + CreditInfoDialogObj.F_adbsghh(reDate)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtYear").value = sDate.substring(0, 4)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtMonth").value = sDate.substring(5, 7)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtDay").value = sDate.substring(8, 10)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtYear").value = eDate.substring(0, 4)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtMonth").value = eDate.substring(5, 7)
            CreditInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtDay").value = eDate.substring(8, 10)
            CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtCode").value = LastSelectedGridRow.cells(1).innerText
            CreditInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtName").value = LastSelectedGridRow.cells(2).firstChild.innerText
            CreditInfoDialogObj.OnClickBtnFilter()

        }
    } catch (e) {
        CreditInfoDialogObj = null
        CreditState = 0
    }
}

function GetAccessBtn() {


    if (window.ActiveXObject) {
        // code for IE6, IE5
        xmlDoc = new ActiveXObject("MsXml2.DomDocument")
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
        if (xmlNodes.length != 0) {

            if (xmlNodes.item(0).selectSingleNode('ShiftGroupFilter') && xmlNodes.item(0).selectSingleNode('ShiftGroupFilter').text == 2) {
                document.getElementById(MasterObj + "cmbShift").style.display = "none"
                document.getElementById(MasterObj + "cmbGroup").style.display = "none"
                document.getElementById("TDGroupText").style.display = "none"
                document.getElementById("TDShiftText").style.display = "none"

            }
            if (xmlNodes.item(0).selectSingleNode('CreditNeedFilter') && xmlNodes.item(0).selectSingleNode('CreditNeedFilter').text == 2)
                document.getElementById("TDCreditNeed").style.display = "none"

            if (xmlNodes.item(0).selectSingleNode('ManagerFilter') && xmlNodes.item(0).selectSingleNode('ManagerFilter').text == 2)
                document.getElementById("TDManager").style.display = "none"

            //                    if (xmlNodes.item(0).selectSingleNode('DaftarTablFilter') && xmlNodes.item(0).selectSingleNode('DaftarTablFilter').text == 2)
            //                        document.getElementById("TDDaftarTabl").style.display = "none"
        }
    }

    //    CorrectToolBar()
}

function RefreshDailyPage() {
    try {
        if (DailyInfoDialogObj) {
            var sDate = document.getElementById(MasterObj + "SDate").value
            var eDate = document.getElementById(MasterObj + "EDate").value
            var rsDate, reDate
            rsDate = sDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
            reDate = eDate.substring(8, 10) + "/" + eDate.substring(5, 7) + "/" + eDate.substring(0, 4)
            DailyInfoDialogObj.document.getElementById(MasterObj + "txtPersonCodeSearch").value = LastSelectedGridRow.cells(1).innerText
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = rsDate + "  " + DailyInfoDialogObj.F_adbsghh(rsDate)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = reDate + "  " + DailyInfoDialogObj.F_adbsghh(reDate)
            DailyInfoDialogObj.document.getElementById(MasterObj + "SDate").value = sDate
            DailyInfoDialogObj.document.getElementById(MasterObj + "EDate").value = eDate
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtYear").value = sDate.substring(0, 4)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtMonth").value = sDate.substring(5, 7)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalSDate_txtDay").value = sDate.substring(8, 10)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtYear").value = eDate.substring(0, 4)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtMonth").value = eDate.substring(5, 7)
            DailyInfoDialogObj.document.getElementById(MasterObj + "KCalEDate_txtDay").value = eDate.substring(8, 10)
            if (document.getElementById(MasterObj + "txtOptionCmbPerson").value != "1") {
                DailyInfoDialogObj.document.getElementById(MasterObj + "txtPersonCode").value = LastSelectedGridRow.cells(1).innerText
                DailyInfoDialogObj.document.getElementById(MasterObj + "txtPersonName").value = LastSelectedGridRow.cells(2).firstChild.innerText
            }
            else {
                DailyInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtPCode").value = LastSelectedGridRow.cells(1).innerText
                DailyInfoDialogObj.document.getElementById(MasterObj + "CmbPerson_txtName").value = LastSelectedGridRow.cells(2).firstChild.innerText
            }
            DailyInfoDialogObj.OnClickBtnFilter()
        }
    } catch (e) {
        DailyState = 0
        OnClickPersonCode(0)
    }
}

/****************************Other*******************************/

