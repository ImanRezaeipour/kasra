var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = ""
var LastSelectedRowClass = ""
var PageSize = 10;
var PersonCodeValue = "";
var PersonCodeSearchValue = "";
var Flag = 0;
var Mode = $get(MasterObj + "txtShowDate").value;
document.dir = "rtl";
document.body.scroll = "no";
BaseTable.style.height = parseInt(window.screen.height) * 0.73;
BaseTable.style.width = parseInt(window.screen.width) * 0.91;

$get(MasterObj + 'txtXMLGrid').value == "<DataEntryEntity />"

DivResult.style.top = parseFloat(window.screen.height) * 0.75 / 2 - 50;
DivResult.style.right = parseFloat(window.screen.width) / 2 - 350;

var Img1 = "../../App_Utility/Images/Icons/DelIcon.gif";
var Img2 = "../../App_Utility/Images/Icons/Save6.png";
if (Mode == 1) {
    $get(MasterObj + "KCalSDate_txtCalendar").attachEvent("onkeydown", onKeyDownEnter);
    $get(MasterObj + "KCalEDate_txtCalendar").attachEvent("onkeydown", onKeyDownEnter);
}
//********************************
$get(MasterObj + "txtPersonCode").select();
$get(MasterObj + "txtPersonCode").focus();
if ($get(MasterObj + "ModalPCode").value != "")
    LoadModalData();

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(sender, args) {
    if (document.getElementById(MasterObj + "txtSubmit").value == "PersonCodeSearch"
        || document.getElementById(MasterObj + "txtSubmit").value == "PersonCode")
        document.getElementById("ctl00_ProgressState").value = 1;
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    $get(MasterObj + "txtAlert").value = "";
}
//-----------------
function EndRequestHandler(sender, args) {
    Flag = 0;
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal != "") {
        if (StrVal == "Filter") {
            CreateGrid("First")
            OnClickBtnNew();
            document.getElementById(MasterObj + "txtPersonCode").focus()
            document.getElementById(MasterObj + "txtPersonCode").select()
        }
        //**********************************
        else if (StrVal == "Delete") {
            if ($get(MasterObj + "txtValidate").value == "1") {
                ModifyXML()
                OnClickBtnNew();
                SetMsg("حذف شد")
            }
        }
        //*********************************        
        else if (StrVal == "Save" || StrVal == "NewItem") {
            if (document.getElementById(MasterObj + "txtValidate").value == 1) {
                if (document.getElementById(MasterObj + "txtWRID").value != "" || document.getElementById(MasterObj + "txtWRID").value != "0") {
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    ModifyXML()
                    document.getElementById(MasterObj + "txtSubmit").value = "Save";
                }
                SetMsg($get(MasterObj + "txtAlert").value);
                ModifyXML()
                OnClickBtnNew();
            }
            else if ($get(MasterObj + "txtValidate").value == "2") {
                MakeDivPopup();
                $get(MasterObj + "txtAlert").value = "";
            }
            else alert($get(MasterObj + "txtAlert").value);
            //*****************************
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //    if ($get(MasterObj + "txtAlert").value != "" && $get(MasterObj + "txtAlert").value != "23")
    //        SetMsg($get(MasterObj + "txtAlert").value);
    if ($get(MasterObj + "txtAlert1").value != "") {
        alert($get(MasterObj + "txtAlert1").value);
        if ($get(MasterObj + "txtSubmit").value == "PersonCode")
            document.getElementById(MasterObj + "txtPersonCode").value = "";
        else
            $get(MasterObj + "txtPersonCodeSearch").value = "";
    }
    //----------------For Focus
    if ((StrVal == "Save" || StrVal == "NewItem") && ($get(MasterObj + "txtValidate").value == "2")) {
        $get("BtnNewItem").focus();
    }
    else {
        $get(MasterObj + "txtValue").select();
        document.getElementById(MasterObj + "txtValue").focus();

        if ($get(MasterObj + "txtSubmit").value == "PersonCode") {
            if (Flag == 0) {
                if ($get(MasterObj + "txtAlert1").value != "")
                    FocusElement(0);
                else
                    FocusElement(1);
            }
        }
        else {
            if (Flag == 0 && StrVal != "Refresh") {
                FocusElement(0);
            }
        }

        if (StrVal == "Refresh") {
            if (!$get(MasterObj + "ChkCreditType").checked) {
                document.getElementById(MasterObj + "CmbCreditType").focus()
                document.getElementById(MasterObj + "CmbCreditType").setActive();
            }
        }
    }
    //-------------------------
    if ($get(MasterObj + "txtSubmit").value != "NewItem")
        $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtAlert1").value = "";


    PersonCodeSearchValue = $get(MasterObj + "txtPersonCodeSearch").value;
    PersonCodeValue = $get(MasterObj + "txtPersonCode").value;
}
//***********************************************************************************

//**************************paging***********************************************
function OnBlurtxtCurPage() {
    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
    if (document.getElementById("OToolBar_txtCurPage").value != "" &&
            document.getElementById("OToolBar_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
        }
        CreateGrid('Const')
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value))
        CreateGrid('Next')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    CreateGrid('Last')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1)
        CreateGrid('Previous')
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    CreateGrid('First')
}
//***********************************EndPaging******************************************
//###################################Create Grid#########################################
function CreateGrid(direction) {

    ClearRowGrid(XTabTable_Header)
    if ($get(MasterObj + "txtXMLGrid").value != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXMLGrid').value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes("GetWPResult")

        $get(MasterObj + 'lblTotal').value = xmlNodes.length;
        //================================Paging
        var totalRecords
        totalRecords = xmlNodes.length

        $get(MasterObj + 'Totalpage').value = Math.ceil(totalRecords / PageSize)

        if (totalRecords > 0) {

            currentPage_X = parseInt((($get(MasterObj + 'txtCurPage').value == "") ? "1" : $get(MasterObj + 'txtCurPage').value))

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
                    currentPage_X = parseInt($get(MasterObj + 'Totalpage').value)
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
            $get(MasterObj + 'txtCurPage').value = currentPage_X
            $get(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
            $get(MasterObj + "lblTo").value = endFor + 1;
            //====================================================

            var i = (currentPage_X - 1) * PageSize

            for (; i <= endFor; i++) {
                // alert(xmlNodes.item(i).selectSingleNode("SDate").text);
                var Param = '' + xmlNodes.item(i).selectSingleNode('StatusID').text + ',' + xmlNodes.item(i).selectSingleNode('personCode').text + ',' + xmlNodes.item(i).selectSingleNode('DisplayName').text + ',' + xmlNodes.item(i).selectSingleNode('CreditTypeName').text + ',' + xmlNodes.item(i).selectSingleNode('WorkPeriodName').text + ',' + xmlNodes.item(i).selectSingleNode("Value").text + ',' + xmlNodes.item(i).selectSingleNode('Descr').text + ',' + xmlNodes.item(i).selectSingleNode('DName').text + ',';
                AddToGrid("WPID", xmlNodes.item(i).selectSingleNode("WPID").text, "Value", xmlNodes.item(i).selectSingleNode("Value").text, "CategoryID", 0, "CodeID", xmlNodes.item(i).selectSingleNode("CodeID").text, "PersonID", xmlNodes.item(i).selectSingleNode("PersonID").text, "Kind", xmlNodes.item(i).selectSingleNode("Kind").text, "WRID", xmlNodes.item(i).selectSingleNode("WRID").text, "WFID", xmlNodes.item(i).selectSingleNode("WFID").text, "Flow", xmlNodes.item(i).selectSingleNode("Flow").text,
                    "SDate", xmlNodes.item(i).selectSingleNode("SDate").text, "EDate", xmlNodes.item(i).selectSingleNode("EDate").text, Param, XTabTable_Header)
            }
        }
        else {
            //====================================================
            $get(MasterObj + 'txtCurPage').value = "0";
            $get(MasterObj + "lblFrom").value = "0";
            $get(MasterObj + "lblTo").value = "0";
            $get(MasterObj + 'Totalpage').value = "0";
            $get(MasterObj + 'lblTotal').value = "0";
            //====================================================
        }
    }
    SetPagingInfo();
}
//********************************************************************************
function ClearRowGrid(GridName) {
    var oGrid = GridName
    while (oGrid.rows.length > 1)
        oGrid.deleteRow(oGrid.rows.length - 1);

}
//*******************************************************************************       
function SetPagingInfo() {
    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

    if (document.getElementById("OToolBar_txtCurPage").value == "" | document.getElementById("OToolBar_txtCurPage").value == "0")
        document.getElementById('OToolBar_BtnPrv').disabled = true
    else
        document.getElementById('OToolBar_BtnPrv').disabled = false;

    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
        document.getElementById('OToolBar_BtnNext').disabled = true
    else
        document.getElementById('OToolBar_BtnNext').disabled = false;
}
/*******************************************************************/
function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, AttrName4, AttrValue4, AttrName5, AttrValue5, AttrName6, AttrValue6, AttrName7, AttrValue7, AttrName8, AttrValue8, AttrName9, AttrValue9, AttrName10, AttrValue10, AttrName11, AttrValue11, Param, GridName) {
    var oGrid = GridName
    var oRow = oGrid.insertRow();
    oRow.setAttribute(AttrName1, AttrValue1)
    oRow.setAttribute(AttrName2, AttrValue2)
    oRow.setAttribute(AttrName3, AttrValue3)
    oRow.setAttribute(AttrName4, AttrValue4)
    oRow.setAttribute(AttrName5, AttrValue5)
    oRow.setAttribute(AttrName6, AttrValue6)
    oRow.setAttribute(AttrName7, AttrValue7)
    oRow.setAttribute(AttrName8, AttrValue8)
    oRow.setAttribute(AttrName9, AttrValue9)
    oRow.setAttribute(AttrName10, AttrValue10)
    oRow.setAttribute(AttrName11, AttrValue11)

    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle ";
    else
        oRow.className = "CssAlternatingItemStyle";

    var x = 1;
    var p = new String;
    var val = "";
    val = getArray(Param, 0, ',')
    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = "<img src='" + (val == "203" ? "../../App_Utility/Images/Icons/BlueTick.gif" : "../../App_Utility/Images/Icons/default_phase_icon.gif") + "' style='cursor:pointer' onclick='onclickBtnImgFlow(this)'/>";
    while (x < getCntChar(',', Param)) {
        val = getArray(Param, x, ',')

        var oCell0 = oRow.insertCell();
        if (val.length > 25) {
            oCell0.innerText = val.substring(0, 22) + "...";
            oCell0.title = val;
        }
        else oCell0.innerText = val;
        x = x + 1;
    }

    oRow.cells(0).style.width = "40px";
    oRow.cells(1).style.width = "10%";
    oRow.cells(2).style.width = "15%";
    oRow.cells(3).style.width = "15%";
    oRow.cells(4).style.width = "15%";
    oRow.cells(5).style.width = "10%";
    oRow.cells(6).style.width = "20%";
    oRow.cells(7).style.width = "20%";

    oRow.cells(0).align = "center";
    oRow.cells(1).align = "center";
    oRow.cells(2).align = "right";
    oRow.cells(3).align = "right";
    oRow.cells(4).align = "center";
    oRow.cells(5).align = "center";
    oRow.cells(6).align = "right";
    oRow.cells(7).align = "right";

    oRow.cells(0).className = GridName.toString();
    oRow.cells(1).className = GridName.toString();
}
//###########################end Create Grid********************************************       
//**************************************************************************************   
function ClearAll() {
    $get(MasterObj + 'ChkClock').checked = false;
    $get(MasterObj + 'ChkPeriod').checked = false;
    $get(MasterObj + 'ChkCreditType').checked = false;

    $get(MasterObj + 'ChkPrsId').checked = false;
    $get(MasterObj + 'ChkValue').checked = false;
    if (Mode == 1) {
        $get(MasterObj + "ChkSDate").checked = false;
        $get(MasterObj + "ChkEDate").checked = false;
    }
    Clear()
}
//*******************************************************************************
function Clear() {
    if (!$get(MasterObj + 'ChkPrsId').checked) {
        $get(MasterObj + 'txtPersonCode').value = "";
        $get(MasterObj + 'PersonName').value = '0';
        PersonCodeValue = "";
    }


    if (!$get(MasterObj + 'ChkCreditType').checked)
        $get(MasterObj + 'CmbCreditType').value = '0';

    if (!$get(MasterObj + 'ChkPeriod').checked)
        $get(MasterObj + 'CmbPeriod').value = '0';

    if (!$get(MasterObj + 'ChkValueType').checked)
        $get(MasterObj + 'CmbValueType').selectedIndex = 0;

    if (!$get(MasterObj + 'ChkValue').checked)
        $get(MasterObj + 'txtValue').value = "0";

    if (!$get(MasterObj + 'ChkDescr').checked)
        $get(MasterObj + 'txtDesc').value = "";
    if (Mode == 1) {
        if (!$get(MasterObj + "ChkSDate").checked) {
            $get(MasterObj + 'KCalSDate_txtCalendar').value = "";
            $get(MasterObj + 'KCalSDate_txtDay').value = "";
            $get(MasterObj + 'KCalSDate_txtMonth').value = "";
            $get(MasterObj + 'KCalSDate_txtYear').value = "";
        }
        if (!$get(MasterObj + "ChkEDate").checked) {
            $get(MasterObj + 'KCalEDate_txtCalendar').value = "";
            $get(MasterObj + 'KCalEDate_txtDay').value = "";
            $get(MasterObj + 'KCalEDate_txtMonth').value = "";
            $get(MasterObj + 'KCalEDate_txtYear').value = "";
        }
    }
    document.getElementById(MasterObj + "txtWRID").value = "0";
    LastSelectedRow = "";
}
//*******************************************************************************
function onblurtxtPersonCode(obj) {

    if (obj.value != "" && obj.value != "0") {
        if (obj.id == MasterObj + "txtPersonCodeSearch") {

            if ($get(MasterObj + "txtPersonCodeSearch").value != PersonCodeSearchValue) {
                $get(MasterObj + "txtSubmit").value = "PersonCodeSearch";
                $get(MasterObj + "BtnRefreshPersonSubmit").click();

            }
        }
        else
            if ($get(MasterObj + "txtPersonCode").value != PersonCodeValue) {

                $get(MasterObj + "txtSubmit").value = "PersonCode";
                $get(MasterObj + "BtnRefreshPersonSubmit").click();
            }
    }
    else
        if (obj.id == MasterObj + "txtPersonCode") {
            PersonCodeValue = "";
            $get(MasterObj + "PersonName").value = "";
        }
        else {
            PersonCodeSearchValue = "";
            $get(MasterObj + "PersonNameSearch").value = "";
        }
}
//*********************************ToolBar Buttons*********************************
function OnClickBtnFilter() {
    if ($get(MasterObj + "CmbPeriodSearch").value != "0") {
        $get(MasterObj + "TemptxtPersonCode").value = $get(MasterObj + "txtPersonCodeSearch").value;
        $get(MasterObj + "TemptxtPeriodID").value = $get(MasterObj + "CmbPeriodSearch").value;

        var str = $get(MasterObj + "CmbCreditTypeSearch").value;
        str = "00" + str;
        $get(MasterObj + "TemptxtCreditType").value = str.substr(str.length - 5, 5)
        $get(MasterObj + "TmpValueType").value = $get(MasterObj + "CmbValueTypeSearch").value;
        $get(MasterObj + "txtSubmit").value = "Filter";
        $get(MasterObj + "BtnSubmit").click();
    }
    else alert("دوره مورد نظر را انتخاب کنيد");
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
        LastSelectedRow = "";
    }

    Clear();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    if (CheckNotEmpty()) {
        if ($get(MasterObj + 'txtPersonCode').value != "" && $get(MasterObj + 'PersonName').value == "") {
            alert("کد پرسنلي نا معتبر است")
            $get(MasterObj + 'txtPersonCode').value = "";
            $get(MasterObj + 'txtPersonCode').focus();
        }
        else {
            Save("Save")
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckNotEmpty() {
    
    if ($get(MasterObj + 'txtPersonCode').value == "" || $get(MasterObj + 'txtPersonCode').value == "0") {
        alert("اطلاعات را تکميل نماييد")
        $get(MasterObj + 'txtPersonCode').focus()
        return false
    }
    else if ($get(MasterObj + 'CmbCreditType').value == "0" || $get(MasterObj + 'CmbCreditType').value == "") {
        alert("اطلاعات را تکميل نماييد");
        $get(MasterObj + 'CmbCreditType').focus();
        return false;
    }
    else if ($get(MasterObj + 'CmbPeriod').value == "0" || $get(MasterObj + 'CmbPeriod').value == "") {
        alert("اطلاعات را تکميل نماييد")
        $get(MasterObj + 'CmbPeriod').focus()
        return false
    }

    if (document.getElementById(MasterObj + "CmbValueType").selectedIndex != 0) {
        if (parseInt(document.getElementById(MasterObj + "txtValue").value) == 0 || document.getElementById(MasterObj + "txtValue").value == "") {
            alert("اطلاعات را تکميل نماييد")
            $get(MasterObj + 'txtValue').focus()
            return false
        }
    }

    // else {

        if ($get(MasterObj + 'txtValue').value == "00:00" || $get(MasterObj + 'txtValue').value == "0" || $get(MasterObj + 'txtValue').value == "") {
            alert("اطلاعات را تکميل نماييد")
            $get(MasterObj + 'txtValue').focus()
            return false
        }
        else
            if (Mode == 1) {
                if ($get(MasterObj + "KCalSDate_txtCalendar").value == "") {
                    alert("تاريخ شروع را وارد کنيد ");
                    $get(MasterObj + 'KCalSDate_txtCalendar').focus()
                    return false;
                }
                else if ($get(MasterObj + "KCalEDate_txtCalendar").value == "") {
                    alert("تاريخ خاتمه را وارد کنيد ");
                    $get(MasterObj + 'KCalEDate_txtCalendar').focus()
                    return false;
                }
                else {
                    if ($get(MasterObj + "KCalEDate_txtYear").value + $get(MasterObj + "KCalEDate_txtMonth").value + $get(MasterObj + "KCalEDate_txtDay").value < $get(MasterObj + "KCalSDate_txtYear").value + $get(MasterObj + "KCalSDate_txtMonth").value + $get(MasterObj + "KCalSDate_txtDay").value) {
                        alert("تاريخ شروع از تاريخ خاتمه بزرگتر است ")
                        $get(MasterObj + 'KCalSDate_txtCalendar').focus()
                        return false;
                    }
                }
            }
    //}
    return true
}
//*******************************************************************************
function Save(Type) {
    var Value = $get(MasterObj + "txtValue").value;
    //برای حالتیکه روز انتخاب شود که در صورت خالی بودن آپشن طول روز مقدار 7:20را در نظر می گیرد
    var DayLength = $("#" + MasterObj + "txtDayLength").val()
    if (DayLength == "" && document.getElementById(MasterObj + "CmbValueType").value == "18703") {
        alert("لطفا مقدار طول روز را در تنطيمات سيستم وارد کنيد");
        return;
    }

    if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
        Value = parseInt(Math.abs(Value.split(":")[0]) * 60) + parseInt(Math.abs(Value.split(":")[1]));
    else if (document.getElementById(MasterObj + "CmbValueType").value == "18703")
        Value = parseInt(Value) * parseInt(DayLength);

    document.getElementById(MasterObj + "txtValueSave").value = Value;
    document.getElementById(MasterObj + "txtCreditType").value = document.getElementById(MasterObj + "CmbCreditType").value;
    //====================================================
    if (Mode == 1) {
//                $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
//                $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        $get(MasterObj + "txtSDate").value = $get(MasterObj + 'KCalSDate_txtYear').value + "/" + $get(MasterObj + 'KCalSDate_txtMonth').value + "/" + $get(MasterObj + 'KCalSDate_txtDay').value;
        $get(MasterObj + "txtEDate").value = $get(MasterObj + 'KCalEDate_txtYear').value + "/" + $get(MasterObj + 'KCalEDate_txtMonth').value + "/" + $get(MasterObj + 'KCalEDate_txtDay').value;
    }
    else {
        $get(MasterObj + "txtSDate").value = "";
        $get(MasterObj + "txtEDate").value = "";

    }
    $get(MasterObj + "txtSubmit").value = Type;
    $get(MasterObj + "BtnSubmit").click();
}
//*********************************************************************
function OnClickBtnDelete() {

    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (LastSelectedRow == "") {
        alert("لطفا يک سطر را انتخاب نماييد")
        return;
    }
    if (confirm('آيا براي حذف مطمئن هستيد؟') == true) {

        $get(MasterObj + "txtSubmit").value = "Delete";
        $get(MasterObj + "BtnSubmit").click();
    }
}
//*********************************end ToolBar Buttons*****************************  
function onClickImgRefreshPersonSearch(obj) {

    var Entity = obj.id == "ImgRefreshPersonSearch" ? $get(MasterObj + "txtPersonCodeSearch") : $get(MasterObj + "txtPersonCode");
    var Name = obj.id == "ImgRefreshPersonSearch" ? $get(MasterObj + "PersonNameSearch") : $get(MasterObj + "PersonName");

    var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=" + $get(MasterObj + "txtMenuItemID").value + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
    var Result = "";
    Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

    if (Result != "") {
        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
        xmlDoc.loadXML(Result);
        xmlDoc.setProperty("SelectionLanguage", "XPath");
        var xmlNodes;
        xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
        if (xmlNodes.length != 0) {
            var PCode;
            PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
            Entity.value = PCode;
            Name.value = xmlNodes.item(0).selectSingleNode('Family').text
            if (obj.id == "ImgRefreshPersonSearch") PersonCodeSearchValue = Entity.value;
            else PersonCodeValue = Entity.value;
        }
    }
}

//*******************************************************************************
function ModifyXML() {
    var flag = true;
    $get(MasterObj + 'txtXMLGrid').value = (($get(MasterObj + 'txtXMLGrid').value == "<DataEntryEntity />" || $get(MasterObj + 'txtXMLGrid').value == "") ? "<DataEntryEntity></DataEntryEntity>" : $get(MasterObj + 'txtXMLGrid').value);

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML($get(MasterObj + 'txtXMLGrid').value)
    //=================================================================
    if ($get(MasterObj + 'txtSubmit').value == "Save") {

        if ($get(MasterObj + "TemptxtPersonCode").value != "0" && $get(MasterObj + "TemptxtPersonCode").value != "") {
            if ($get(MasterObj + "SaveResult").value.split('#')[10] != $get(MasterObj + "TemptxtPersonCode").value)
                flag = false;
        }
        if ($get(MasterObj + "TemptxtPeriodID").value != "0" && $get(MasterObj + "TemptxtPeriodID").value != "" && flag) {
            if ($get(MasterObj + "SaveResult").value.split('#')[4] != $get(MasterObj + "TemptxtPeriodID").value)
                flag = false;
        }
        if ($get(MasterObj + "TemptxtCreditType").value != "000" && $get(MasterObj + "TemptxtCreditType").value != "" && flag) {
            var str = $get(MasterObj + "SaveResult").value.split('#')[5]
            str = "00" + str;
            str = str.substr(str.length - 5, 5)
            if (str != $get(MasterObj + "TemptxtCreditType").value)
                flag = false;
        }
        if (flag) {
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<DataEntryEntity>" + MakeXml() + "</DataEntryEntity>")
            var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/DataEntryEntity/GetWPResult");

            oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
            $get(MasterObj + 'txtXMLGrid').value = oXmlDoc.xml;

            CreateGrid("Last");
        }
        //        InsertToDivLog($get(MasterObj + "SaveResult").value, "Save");
    } //===========================================================================Delete

    else if ($get(MasterObj + 'txtSubmit').value == "Delete") {

        var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc1.async = "false";
        oXmlDoc1.loadXML("<DataEntryEntity></DataEntryEntity>")

        if (oXmlDoc.xml != oXmlDoc1.xml && oXmlDoc.xml != "<DataEntryEntity></DataEntryEntity>") {
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GetWPResult[WRID=" + document.getElementById(MasterObj + "txtWRID").value + "]");

            if (xmlNodes.length != 0) {
                var f = oXmlDoc.documentElement.removeChild(xmlNodes.item(0));
                $get(MasterObj + 'txtXMLGrid').value = oXmlDoc.xml;
                CreateGrid("Const");
                //                InsertToDivLog(f.childNodes(0).text + "#" + f.childNodes(1).text + "#" + f.childNodes(2).text + "#" + f.childNodes(3).text + "#" + f.childNodes(4).text + "#" + f.childNodes(5).text + "#" + f.childNodes(6).text + "#" + f.childNodes(7).text + "#" + f.childNodes(8).text + "#" + f.childNodes(9).text + "#" + f.childNodes(10).text + "#" + f.childNodes(11).text, "Delete");
            }
        }
    }
}

/*******************************************************************/
function MakeXml() {
    var str = "<GetWPResult>";
    str += "<DisplayName>" + $get(MasterObj + "SaveResult").value.split('#')[0] + "</DisplayName>";
    str += "<CreditTypeName>" + $get(MasterObj + "SaveResult").value.split('#')[1] + "</CreditTypeName>";
    str += "<WorkPeriodName>" + $get(MasterObj + "SaveResult").value.split('#')[2] + "</WorkPeriodName>";
    str += "<PersonID>" + $get(MasterObj + "SaveResult").value.split('#')[3] + "</PersonID>";
    str += "<WPID>" + $get(MasterObj + "SaveResult").value.split('#')[4] + "</WPID>";
    var s = "00" + $get(MasterObj + "SaveResult").value.split('#')[5];
    str += "<CodeID>" + s.substr(s.length - 5, 5) + "</CodeID>";
    str += "<Value>" + $get(MasterObj + "SaveResult").value.split('#')[6] + "</Value>";
    str += "<Descr>" + $get(MasterObj + "SaveResult").value.split('#')[8] + "</Descr>";
    str += "<WRID>" + $get(MasterObj + "SaveResult").value.split('#')[9] + "</WRID>";
    str += "<personCode>" + $get(MasterObj + "SaveResult").value.split('#')[10] + "</personCode>";
    str += "<Kind>" + $get(MasterObj + "SaveResult").value.split('#')[11] + "</Kind>";
    str += "<DName>" + $get(MasterObj + "SaveResult").value.split('#')[12] + "</DName>";
    str += "<WFID>" + $get(MasterObj + "SaveResult").value.split('#')[13] + "</WFID>";
    str += "<StatusID>" + $get(MasterObj + "SaveResult").value.split('#')[14] + "</StatusID>";
    str += "<Flow>" + $get(MasterObj + "SaveResult").value.split('#')[15] + "</Flow>";
    str += "<SDate>" + $get(MasterObj + "SaveResult").value.split('#')[16] + "</SDate>";
    str += "<EDate>" + $get(MasterObj + "SaveResult").value.split('#')[17] + "</EDate>";
    str += "</GetWPResult>";

    return str
}

//*********************************************************************
function onKeyDownEnter(obj) {
    if (event.keyCode == 13) {
        if (obj.id == null || obj.id == undefined) {
            obj = window.event.srcElement;
        }
        switch (obj.id) {
            case MasterObj + "txtPersonCode":
                if (!$get(MasterObj + "ChkCreditType").checked) {
                    document.getElementById(MasterObj + "CmbCreditType").focus()
                    document.getElementById(MasterObj + "CmbCreditType").setActive();
                }
                else onKeyDownEnter($get(MasterObj + "CmbCreditType"))
                break

            case MasterObj + "PersonName":
                if (!$get(MasterObj + "ChkCreditType").checked) {
                    document.getElementById(MasterObj + "CmbCreditType").focus()
                    document.getElementById(MasterObj + "CmbCreditType").setActive();
                }
                else onKeyDownEnter($get(MasterObj + "CmbCreditType"))
                break

            case MasterObj + "CmbCreditType":
                if (!$get(MasterObj + "ChkPeriod").checked) {
                    document.getElementById(MasterObj + "CmbPeriod").focus()
                    document.getElementById(MasterObj + "CmbPeriod").setActive()
                }
                else onKeyDownEnter($get(MasterObj + "CmbPeriod"))
                break

            case MasterObj + "CmbPeriod":
                if (!$get(MasterObj + "ChkValueType").checked) {
                    document.getElementById(MasterObj + "CmbValueType").focus()
                    document.getElementById(MasterObj + "CmbValueType").setActive()
                } else onKeyDownEnter($get(MasterObj + "CmbValueType"))
                break;
            case MasterObj + "CmbValueType":
                if (!$get(MasterObj + "ChkValue").checked) {
                    document.getElementById(MasterObj + "txtValue").focus()
                    document.getElementById(MasterObj + "txtValue").select()
                } else onKeyDownEnter($get(MasterObj + "txtValue"))
                break;

            case MasterObj + "txtValue":
                if (Mode == 1) {
                    if (!$get(MasterObj + "ChkSDate").checked) {
                        document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus()
                        document.getElementById(MasterObj + "KCalSDate_txtCalendar").select()
                    }
                    else onKeyDownEnter($get(MasterObj + "KCalSDate_txtCalendar"))
                }
                else {
                    if (!$get(MasterObj + "ChkDescr").checked) {
                        document.getElementById(MasterObj + "txtDesc").focus()
                        document.getElementById(MasterObj + "txtDesc").select()
                    }
                    else onKeyDownEnter($get(MasterObj + "txtDesc"))
                }

                break
            case MasterObj + "KCalSDate_txtCalendar":
                if (!$get(MasterObj + "ChkEDate").checked) {
                    document.getElementById(MasterObj + "KCalEDate_txtCalendar").focus()
                    document.getElementById(MasterObj + "KCalEDate_txtCalendar").select()
                }
                else onKeyDownEnter($get(MasterObj + "KCalEDate_txtCalendar"))

                break;
            case MasterObj + "KCalEDate_txtCalendar":
                if (!$get(MasterObj + "ChkDescr").checked) {
                    document.getElementById(MasterObj + "txtDesc").focus()
                    document.getElementById(MasterObj + "txtDesc").select()
                }
                else onKeyDownEnter($get(MasterObj + "txtDesc"))
                break;
            case MasterObj + "txtDesc":
                if (!$get(MasterObj + "ChkPrsId").checked) {
                    document.getElementById(MasterObj + "txtPersonCode").focus()
                    document.getElementById(MasterObj + "txtPersonCode").select()
                }
                else onKeyDownEnter($get(MasterObj + "txtPersonCode"))
                OnClickBtnSave();
                break;
        }
    }
}
//*******************************************************************************
function onclickgrdXTabTable() {
    if (window.event.srcElement.parentElement.id != "TrHead") {
        if (window.event.srcElement.tagName != "IMG" && window.event.srcElement.tagName != "TABLE") {
            if (window.event.srcElement.parentElement.tagName == "TD")
                SelectedRow = window.event.srcElement.parentElement.parentElement
            else
                SelectedRow = window.event.srcElement.parentElement
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            LoadData(SelectedRow)
            $get(MasterObj + "txtPersonCode").focus();
            $get(MasterObj + "txtPersonCode").select();
        }
    }
}
//*******************************************************************************
function LoadData(SelectedRow) {
    if ($get(MasterObj + "txtShowDate").value!="0")
        {
    $get(MasterObj + "KCalSDate_txtDay").value = SelectedRow.getAttribute("SDate").substr(0, 2);
    $get(MasterObj + "KCalSDate_txtMonth").value = SelectedRow.getAttribute("SDate").substr(3, 2);
    $get(MasterObj + "KCalSDate_txtYear").value = SelectedRow.getAttribute("SDate").substr(6, 4);
    $get(MasterObj + "KCalSDate_txtCalendar").value = SelectedRow.getAttribute("SDate")
    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
    $get(MasterObj + "KCalEDate_txtDay").value = SelectedRow.getAttribute("EDate").substr(0, 2);
    $get(MasterObj + "KCalEDate_txtMonth").value = SelectedRow.getAttribute("EDate").substr(3, 2);
    $get(MasterObj + "KCalEDate_txtYear").value = SelectedRow.getAttribute("EDate").substr(6, 4);
    $get(MasterObj + "KCalEDate_txtCalendar").value = SelectedRow.getAttribute("EDate")
    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
        
    $get(MasterObj + "KCalSDate_txtCalendar").value = SelectedRow.getAttribute("SDate");
    $get(MasterObj + "KCalEDate_txtCalendar").value = SelectedRow.getAttribute("EDate");
      }
       
    $get(MasterObj + 'txtPersonCode').value = SelectedRow.cells(1).innerText;
    $get(MasterObj + 'PersonName').value = SelectedRow.cells(2).innerText;


    document.getElementById(MasterObj + "CmbValueType").value = SelectedRow.Kind;
    $get(MasterObj + 'txtValue').value = SelectedRow.Value;
    var str = "00" + SelectedRow.CodeID;
    $get(MasterObj + 'CmbCreditType').value = str.substr(str.length - 5, 5);
    $get(MasterObj + 'CmbPeriod').value = SelectedRow.WPID;
    $get(MasterObj + 'txtDesc').value = (SelectedRow.cells(6).title == null || SelectedRow.cells(6).title == "") ? SelectedRow.cells(6).innerText : SelectedRow.cells(6).title;

    PersonCodeValue = $get(MasterObj + 'txtPersonCode').value;
    document.getElementById(MasterObj + "txtWRID").value = SelectedRow.WRID;
}
//*******************************************************************************
function ShowDivResult() {
    TDCode.innerText = $get(MasterObj + "SaveResult").value.split('#')[0]
    var Name = $get(MasterObj + "SaveResult").value.split('#')[1];
    if (Name.length > 15) {
        TDName.innerText = Name.substring(0, 10) + "...";
        TDName.title = Name;
    }
    else TDName.innerText = Name;

    TDCreditType.innerText = $get(MasterObj + "SaveResult").value.split('#')[2]

    TDPeriod.innerText = $get(MasterObj + "SaveResult").value.split('#')[3]

    TDValue.innerText = $get(MasterObj + "SaveResult").value.split('#')[4]
    var Desc = $get(MasterObj + "SaveResult").value.split('#')[5];
    if (Desc.length > 10) {
        TDDescr.innerText = Desc.substring(0, 8) + "...";
        TDDescr.title = Desc;
    }
    else TDDescr.innerText = Desc;
    TDDescr.innerText = $get(MasterObj + "SaveResult").value.split('#')[5].substring(0, 10);

    DivResult.style.display = "inline";
    $get("BtnCloseDiv").focus();
    $get("BtnCloseDiv").select();

}
//****************************************************************************
function onclickBtnCloseDiv() {
    DivResult.style.display = "none";
    document.getElementById(MasterObj + "txtPersonCode").focus()
    document.getElementById(MasterObj + "txtPersonCode").select()
}
//**************************************************************************
function OnClickBtnRestor() {
    DivLog.style.display = "inline";
    document.getElementById('OToolBar_BtnRestor').style.visibility = "hidden";
}
//***********************************************************************
function onclickImgClose() {
    DivLog.style.display = "none";
    document.getElementById('OToolBar_BtnRestor').style.visibility = "visible";
}
//*********************************************************************

//******************************************************************
function onclickBtnUpdate() {
    Save("Update");
    onclickBtnCloseDiv();
}
//***************************************
function onblurtxtPersonNameSearch() {
    if ($get(MasterObj + "PersonNameSearch").value == "") {
        PersonCodeSearchValue = "";
        $get(MasterObj + "txtPersonCodeSearch").value = "";
    }
}
function onblurtxtPersonName() {

    if ($get(MasterObj + "PersonName").value == "") {
        PersonCodeValue = "";
        $get(MasterObj + "txtPersonCode").value = "";
    }
}

//********************************************
function onkeydownArrow(obj) {
    if (event.keyCode == 37) {
        if (obj.id == "BtnUpdate")
            $get("BtnCloseDiv").focus();
    }
    else if (event.keyCode == 39)
        if (obj.id == "BtnCloseDiv") {
            $get("BtnUpdate").focus();
        }

}
//********************************************
function FocusElement(Value) {
    if (Value == 0) {

        if (!$get(MasterObj + "ChkPrsId").checked) {
            document.getElementById(MasterObj + "txtPersonCode").focus()
            document.getElementById(MasterObj + "txtPersonCode").select()
            return
        }
    }
    if (!$get(MasterObj + "ChkCreditType").checked) {
        document.getElementById(MasterObj + "CmbCreditType").focus()
        document.getElementById(MasterObj + "CmbCreditType").setActive();
    }
    else
        if (!$get(MasterObj + "ChkPeriod").checked) {
            document.getElementById(MasterObj + "CmbPeriod").focus()
            document.getElementById(MasterObj + "CmbPeriod").setActive()
        }
        else
            if (!$get(MasterObj + "ChkValueType").checked) {
                document.getElementById(MasterObj + "CmbValueType").focus()
                document.getElementById(MasterObj + "CmbValueType").setActive()
            }
            else
                if (!$get(MasterObj + "ChkValue").checked) {
                    document.getElementById(MasterObj + "txtValue").focus()
                    document.getElementById(MasterObj + "txtValue").select()
                }
                else
                    if (!$get(MasterObj + "ChkDescr").checked) {
                        document.getElementById(MasterObj + "txtDesc").focus()
                        document.getElementById(MasterObj + "txtDesc").select()
                    }
}
//******************************************************
function onblurtxtValue(obj) {
    if (obj.value != "" || obj.value != "0") {
        if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
            TimechkNew(obj);
        else
            obj.value = obj.value.split(":")[0];
    }
}
//==================================================
function TimechkNew(Obj) {
    if (Obj.value.split(":").length == 1)
        Obj.value = Obj.value + ":00";
    else
        if (Obj.value.split(":")[1] > 59) {
            alert("لطفا تاريخ صحيح را وارد کنيد");
            Obj.select();
            Obj.focus();
        }
}
//=================================================
function PersonName_onclick() {
}
//==================================================
function onchangeCmbValueType(obj) {
    onblurtxtValue(document.getElementById(MasterObj + "txtValue"));
}
//===================================================
function OnKeyDownTimeNew(obj) {
    if (document.getElementById(MasterObj + "CmbValueType").selectedIndex == 0)
        OnKeyDownTime();
    else OnKeyDownInt(obj);
}
//===================================================
function LoadModalData() {
    $get(MasterObj + 'txtPersonCode').value = $get(MasterObj + "ModalPCode").value;
    $get(MasterObj + 'PersonName').value = $get(MasterObj + "ModalName").value;

    $get(MasterObj + 'CmbCreditType').value = $get(MasterObj + "ModalCredit").value.trim();
    $get(MasterObj + 'CmbPeriod').value = $get(MasterObj + "ModalWPID").value.trim();

    document.getElementById(MasterObj + "CmbValueType").selectedIndex = 0;
    $get(MasterObj + 'txtValue').value = $get(MasterObj + "ModalValue").value;

    PersonCodeValue = $get(MasterObj + 'txtPersonCode').value;
    $get(MasterObj + 'txtValue').select();
    $get(MasterObj + 'txtValue').focus();

}
//================================================
function MakeDivPopup() {
    DivPopup.style.display = "inline";
    MakeGrid($get(MasterObj + "txtAlert").value)
    $get("BtnNewItem").select();
}
//===============================================
function onclickBtnNewItem() {
    DivPopup.style.display = "none";
    document.getElementById(MasterObj + "txtSubmit").value = "NewItem";
    $get(MasterObj + "BtnSubmit").click();
}
//===============================================
function onclickBtnEditItem() {
    DivPopup.style.display = "none";
    for (var i = 1; i < ItemTable.rows.length; i++) {
        if (ItemTable.rows(i).cells(0).firstChild.checked)
            $get(MasterObj + "txtWRID").value = ItemTable.rows[i].getAttribute("WRID");
    }
    document.getElementById(MasterObj + "txtSubmit").value = "Save";
    $get(MasterObj + "BtnSubmit").click();
}
//===============================================
function onclickBtnCloseItem() {
    DivPopup.style.display = "none";
    $get(MasterObj + "txtPersonCode").select();
    $get(MasterObj + "txtPersonCode").focus();
}
//==========================
function MakeGrid(Val) {
    while (ItemTable.rows.length > 1)
        ItemTable.deleteRow();
    var Ogrid = ItemTable;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML("<Root>" + Val + "</Root>")
    var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/WP");
    for (var i = 0; i < XmlNodes.length; i++) {
        var Row = Ogrid.insertRow();
        if ((Ogrid.rows.length - 1) % 2 == 0)
            Row.className = "CssItemStyle";
        else Row.className = "CssAlternatingItemStyle";

        Row.style.width = "100%";
        Row.setAttribute("WRID", XmlNodes[i].selectSingleNode("ID").text);
        Row.setAttribute("SDate", XmlNodes[i].selectSingleNode("SDate").text);
        Row.setAttribute("EDate", XmlNodes[i].selectSingleNode("EDate").text);
        Row.insertCell()
        Row.insertCell()
        Row.insertCell()
        Row.cells(0).innerHTML = "<input type='radio' name='A' " + (i == 0 ? "checked" : "") + "/>";
        Row.cells(1).innerText = XmlNodes[i].selectSingleNode("Value").text;
        Row.cells(2).innerText = XmlNodes[i].selectSingleNode("Description").text;
        Row.cells(0).style.width = "20px";
        Row.cells(1).style.width = "80px";
        Row.cells(2).style.width = "250px";
    }
}
//===================================
function OnkeyDownModal(Obj) {
    var key = window.event.keyCode;
    switch (key) {
        case 13:
            if (Obj.id == "BtnCloseItem")
                onclickBtnCloseItem();
            else if (Obj.id == "BtnEditItem")
                onclickBtnEditItem();
            else if (Obj.id == "BtnNewItem")
                onclickBtnNewItem();
            break;
        case 37:
            if (Obj.id == "BtnCloseItem")
                $get("BtnNewItem").focus();
            else if (Obj.id == "BtnEditItem")
                $get("BtnCloseItem").focus();
            else if (Obj.id == "BtnNewItem")
                $get("BtnEditItem").focus();
            break;
        case 39:
            if (Obj.id == "BtnCloseItem")
                $get("BtnEditItem").focus();
            else if (Obj.id == "BtnEditItem")
                $get("BtnNewItem").focus();
            else if (Obj.id == "BtnNewItem")
                $get("BtnCloseItem").focus();
            break;

    }
}
//===============================================
function OnClickSendToExcel() {
    $get(MasterObj + "BtnSendToExcel").click();
}
//===========================================
function onclickBtnImgFlow(obj) {
    var Row = obj.parentElement.parentElement;
    var Flow = Row.Flow;
    var WFDocID = Row.WFID;
    var DocID = Row.WRID;

    if (Flow == 0)
        window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocID + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no");
    else
        window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
}

function Refresh() {
    if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLDOM");
        xml.async = "false";
        xml.loadXML($get(MasterObj + "txtXmlValueType").value);
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString($get(MasterObj + "txtXmlValueType").value, 'text/xml');
    }
    $(xml)
        .find("BaseInfoEntity").find("GetMyNature").each(function () {
            if ($(this).find('CodeID').text() == $get(MasterObj + 'CmbCreditType').value)
                {
                $get(MasterObj + "CmbValueType").value = $(this).find('MyNature').text();
            }
        });
}
function RefreshTop() {
    if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLDOM");
        xml.async = "false";
        xml.loadXML($get(MasterObj + "txtXmlValueTypeSearch").value);
    } else {
        var parser = new DOMParser();
        xml = parser.parseFromString($get(MasterObj + "txtXmlValueTypeSearch").value, 'text/xml');
    }
    $(xml)
        .find("BaseInfoEntity").find("GetMyNature").each(function () {
            if ($(this).find('CodeID').text() == $get(MasterObj + 'CmbCreditTypeSearch').value) {
                $get(MasterObj + "CmbValueTypeSearch").value = $(this).find('MyNature').text();
            }
        });
}
