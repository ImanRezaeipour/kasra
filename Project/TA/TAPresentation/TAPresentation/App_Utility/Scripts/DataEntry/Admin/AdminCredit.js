//=====================================================
var flag = false;
var LastSelectedRow = null;
var LastSelectedRowClass = "";
//document.getElementsByTagName("body")[0].scroll = "no";
document.body.style.overflowX = "auto"
document.body.style.overflowY = "hidden"
$get("OToolBar_TDTopToolBar").style.display = "none"

var lastPersonCodeModify = "";
var rowIndex;
var isCheanged = false;
var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
var WindowEvent;
var XTabTableRow = 0
var LastSelectedRowForPopup;
var gridRowIndex = null
var thisControl
var txtYear
var txtMonth
var txtDay
var ShouldOpen = true;
var SkipGetEnter = document.getElementById(MasterObj + "txtSkipGetEnter").value;
var SelectRowOffer = null
var SelectRowOfferClass = "";
var SelectXtableOffer = 0;
var ScreenW = screen.width;
var XmlNodess
TblBase.style.width = ScreenW - 100;
TDTakmili.style.width = ScreenW - 900;
$get("FTakmili").style.width = ScreenW - 900;
DIVTakmili.style.width = ScreenW - 900;
document.dir = "ltr"
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//==============================================================================
function BeginRequestHandler(sender, args) {
    $get("ImgProgresss").style.display = "inline";
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    if (document.getElementById(MasterObj + "txtSubmit").value == "PersonCodeGrdSearch" ||
            document.getElementById(MasterObj + "txtSubmit").value == "SholdEnterCreditOpen" ||
            document.getElementById(MasterObj + "txtSubmit").value == "DetailCredit" ||
            document.getElementById(MasterObj + "txtSubmit").value == "GetCodePermision")
        document.getElementById("ctl00_ProgressState").value = 1;
}
//==============================================================================
function EndRequestHandler(sender, args) {
    document.dir = "ltr"
    XmlNodess = ""
    $get("ImgProgresss").style.display = "none";
    TblBase.style.width = ScreenW - 100;
    TDTakmili.style.width = ScreenW - 900;
    $get("FTakmili").style.width = ScreenW - 900;
    DIVTakmili.style.width = ScreenW - 900;
    document.body.style.overflowX = "hidden"
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    var StrVal = $get(MasterObj + "txtSubmit").value
    //    alert($get(MasterObj + "txtValidate").value)
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1") {
            SetMsg($get(MasterObj + "txtAlert").value);
        }
        else if ($get(MasterObj + "txtValidate").value != "1") {
            //            alert($get(MasterObj + "txtValidate").value)
            SetMsg($get(MasterObj + "txtAlert").value);

        }
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    var rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndex").value);
    var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
    //    alert($get(MasterObj + "CmbFilteringAdminCredit").value)
    //==================
    if (StrVal == "Del") {

        if ($get(MasterObj + "txtValidate").value == "1") {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";

            xmlDoc.loadXML("<root>" + document.getElementById(MasterObj + "txtXmlNew").value + "</root>")
            xmlDoc.setProperty("SelectionLanguage", "XPath")

            //در صورت حذف در حالت جديد اين سطر را ازايکس ام ال پاک ميکنم تا پس از فيلتر دنبال آن سطر نگردد و نياورد 
            var xmlNodes = xmlDoc.documentElement.selectNodes("/root/Credit[CreditID=" + document.getElementById(MasterObj + "txtOldCreditID").value + "]");
            if (xmlNodes.length != 0) {
                xmlDoc.childNodes[0].removeChild(xmlNodes.item(0));
                document.getElementById(MasterObj + "txtXmlNew").value = xmlDoc.xml
                document.getElementById(MasterObj + "txtXmlNew").value = document.getElementById(MasterObj + "txtXmlNew").value.substr(6, parseInt(document.getElementById(MasterObj + "txtXmlNew").value.length))
                document.getElementById(MasterObj + "txtXmlNew").value = document.getElementById(MasterObj + "txtXmlNew").value.substr(0, parseInt(document.getElementById(MasterObj + "txtXmlNew").value.length) - 7)
            }

            document.getElementById(MasterObj + "txtPersonGrdCode").value = ""

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit1").click();
        }
        else {
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit1").click();
        }
    }
    //==================
    if (StrVal == "DetailCredit") {
        //نگهداشتن شماره ستون وشماره سطر قبل از رفتن سروروفوکوس روي آن پس از برگشتن
        if (DivPopup.style.display == "none") {
            if (document.getElementById(MasterObj + "txtCellIndex").value != "") {
                var cell = parseInt(document.getElementById(MasterObj + "txtCellIndex").value) + 1
                OGrdAdminCredit.rows(rowIndex).cells(cell).firstChild.focus();
                OGrdAdminCredit.rows(rowIndex).cells(cell).firstChild.select();
                document.getElementById(MasterObj + "txtCellIndex").value = ""
            }
        }
    }
    //==================
    if (StrVal == "Filter") {

        LastSelectedRow = null;
        OGrdAdminCredit = document.getElementById("GrdAdminCredit");
        //در حالت ايجاد پس از هر ذخيره بايستي يک فيلتر صورت گيرد و اطلاعات قبلي لود شود و سطر جديد در صورت انخاب ايتمهاي پيشفرض مقدار گيرندو فوکوس روي سطر جديد انجام شود
        if (document.getElementById(MasterObj + "txtXmlNew").value != "") {
            if ($get(MasterObj + "CmbFilteringAdminCredit").value == "31118" && OGrdAdminCredit.rows(rowIndex + 1) != null && OGrdAdminCredit.rows(rowIndex + 1).getAttribute("ISNew") == 1) {
                SetRowNew(OGrdAdminCredit, rowIndex)
            }
            if (document.getElementById(MasterObj + "txtOldCreditID").value != "0") {
                SelectRowGrid(OGrdAdminCredit.rows(rowIndex))
                OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
                OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
            }
        }
    }
    //==================
    if (StrVal == "GetCodePermision") {
        var obj = OGrdAdminCredit.rows(rowIndex).cells(8).firstChild //پس از چک کردن دسترسي در صورت خالي رد کردن پاپاپ باز مي شود   
        if (obj.value == "") {
            ShowCodes(obj)
        }
        else {
            if (isCheanged == true || OGrdAdminCredit.rows(rowIndex).getAttribute("ISNew") == 1) {//درصورت تغيير دادن محتواي کد مقدار وليد براي آن نيز را خالي مي کنم تا با مقدار جديد در صورت وليد بودن مقدار دهي شود

                if (document.getElementById(MasterObj + "LastValueOfObject").value != obj.value)
                    obj.validValue = "0"
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlPersonCode').value)
                oXmlDoc.setProperty("SelectionLanguage", "XPath"); //اگر روي گريد حرکت کرده ام و مقدار کد معتبر است

                if (obj.validValue != "0")
                    var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[CodeID=" + obj.validValue + "]");

                else if (obj.value != "") { //نام را برايش در صورت معتبر بودن مي آورم shortkey  اگر کاربر مقداري را وارد کرده است به عنوان 

                    var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[Shortkey='" + obj.value + "']");
                    //                    alert(obj.value)
                }



                if (XmlNodes.length == 0) {

                    alert("لطفا نوع مجوزرادرست واردکنيد")
                    obj.parentElement.parentElement.cells(8).firstChild.value = ""
                    obj.parentElement.parentElement.cells(8).firstChild.validValue = "0"
                    obj.parentElement.parentElement.cells(9).firstChild.focus()
                    obj.parentElement.parentElement.cells(9).firstChild.select()
                }
                else {
                    obj.parentElement.parentElement.cells(8).firstChild.value = XmlNodes.item(0).selectSingleNode('CodeName').text
                    obj.parentElement.parentElement.cells(8).firstChild.validValue = XmlNodes.item(0).selectSingleNode('CodeID').text
                    obj.parentElement.parentElement.cells(9).firstChild.focus()
                    obj.parentElement.parentElement.cells(9).firstChild.select()
                }
            }
        }
    }
    //==================
    if (StrVal == "Modify") {//حالت جديد 
        if ($get(MasterObj + "CmbFilteringAdminCredit").value == "31118") {
            //        alert($get(MasterObj + "txtValidate").value)
            if ($get(MasterObj + "txtValidate").value == "1") {
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML("<root>" + document.getElementById(MasterObj + "txtXmlNew").value + "</root>")
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                //               alert(document.getElementById(MasterObj + "txtOldCreditID").value)
                if (document.getElementById(MasterObj + "txtOldCreditID").value != "") {
                    var xmlNodes = xmlDoc.documentElement.selectNodes("/root/Credit[CreditID=" + document.getElementById(MasterObj + "txtOldCreditID").value + "]");
                    xmlNodes.item(0).selectSingleNode('CreditID').text = document.getElementById(MasterObj + "txtCreditIDForNew").value

                    document.getElementById(MasterObj + "txtXmlNew").value = xmlDoc.xml
                    document.getElementById(MasterObj + "txtXmlNew").value = document.getElementById(MasterObj + "txtXmlNew").value.substr(6, parseInt(document.getElementById(MasterObj + "txtXmlNew").value.length))
                    document.getElementById(MasterObj + "txtXmlNew").value = document.getElementById(MasterObj + "txtXmlNew").value.substr(0, parseInt(document.getElementById(MasterObj + "txtXmlNew").value.length) - 7)

                    if (document.getElementById(MasterObj + "txtOldCreditID").value == "0") {
                        var Orow = OGrdAdminCredit.insertRow();
                        copyPreviuosRow(Orow, rowIndex);
                        clearRow(OGrdAdminCredit, Orow.rowIndex - 1)
                        SetRowNew(OGrdAdminCredit, Orow.rowIndex - 1)



                    }
                    if (document.getElementById(MasterObj + "txtOldCreditID").value != "0") {
                        SelectRowGrid(OGrdAdminCredit.rows(rowIndex))
                        OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
                        OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
                    }
                }
                //اگر ذخيره نشد فوکوس روي سطر جاري
                if ($get(MasterObj + "txtValidate").value != "1") {
                    SelectRowGrid(OGrdAdminCredit.rows(rowIndex))
                    OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
                    OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
                }
            }
            //حالت غير جديد
            if ($get(MasterObj + "CmbFilteringAdminCredit").value != "31118") {

                //اگر ذخيره شد فيلتر
                if ($get(MasterObj + "txtValidate").value == "1") {
                    OGrdAdminCredit.rows(rowIndex).CreditID = $get(MasterObj + "txtCreditIDForNew").value
                    if ($get(MasterObj + "CmbFilteringAdminCredit").value == "31117")
                        if (OGrdAdminCredit.rows(rowIndex + 1) != null) {
                            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.focus();
                            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.select();
                        }
                }
                //اگر ذخيره نشد فوکوس روي سطر جاري
                if ($get(MasterObj + "txtValidate").value != "1") {


                    SelectRowGrid(OGrdAdminCredit.rows(rowIndex))

                    OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
                    OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
                }
            }
        }
    }
    //==================
    //    alert(StrVal)
    if (StrVal == "PersonCodeGrdSearch") {
        //اگر پرسنلي معتبر بود      
        if (document.getElementById(MasterObj + "txtPersonGrdName").value != "") {
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.value = document.getElementById(MasterObj + "txtPersonGrdCode").value;
            OGrdAdminCredit.rows(rowIndex).cells(1).innerText = document.getElementById(MasterObj + "txtPersonGrdName").value;
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
            onclickForFocus(OGrdAdminCredit.rows(rowIndex).cells(0).firstChild);
            CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(0), rowIndex);
            ////            alert(OGrdAdminCredit.rows(rowIndex).cells(0), rowIndex)
            onchangeControlPersonelNo(OGrdAdminCredit.rows(rowIndex).cells(0).innerText);
        }
        //اگر پرسنلي نامعتبر بود
        else {
            alert("شماره پرسنلي نامعتبر است ");
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.value = $get(MasterObj + "txtOldPersonCode").value;
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.focus();
            OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.select();
        }
        document.getElementById(MasterObj + "txtPersonGrdName").value = ""
    }
    //==================
    if (StrVal == "ShouldEnterCreditOpen") { //اگر مودال پس از زدن خالي رد کردن تاريخ و ساعت مي تواند باز شود و داراي رکورد است
        if (document.getElementById(MasterObj + "txtGetCountAggrigatedCode").value != "") {

            CreateGridOffers("<Root>" + $get(MasterObj + "txtGetCountAggrigatedCode").value + "</Root>", rowIndex);
            //           onchangeControl(document.getElementById(MasterObj + "cellIndex").value)
        }
        else {

            //اگر نيست فوکوس روي بعدي
            if (document.getElementById(MasterObj + "cellIndex").value == "6") {
                OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 2).firstChild.setActive()
            }
            else {
                OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.focus()
                OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.select()
            }
        }
        if (document.getElementById(MasterObj + "cellIndex").value == "6") {
            document.getElementById(MasterObj + "txtSTimeGetvalue").value = OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value
            document.getElementById(MasterObj + "txtETimeGetvalue").value = OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value
            var Vlue = GetVlue(OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value, OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value)
            OGrdAdminCredit.rows(rowIndex).cells(7).innerText = Vlue;
        }
    }
}
//=============================================================
function copyPreviuosRow(PreviuosRow, rowIndex) {
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()
    PreviuosRow.insertCell()

    PreviuosRow.cells(0).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(0).innerHTML
    PreviuosRow.cells(1).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(1).innerHTML
    PreviuosRow.cells(2).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(2).innerHTML
    PreviuosRow.cells(3).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(3).innerHTML
    PreviuosRow.cells(4).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(4).innerHTML
    PreviuosRow.cells(5).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(5).innerHTML
    PreviuosRow.cells(6).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(6).innerHTML
    PreviuosRow.cells(7).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(7).innerHTML
    PreviuosRow.cells(8).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(8).innerHTML
    PreviuosRow.cells(9).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(9).innerHTML
    PreviuosRow.cells(10).innerHTML = OGrdAdminCredit.rows(rowIndex).cells(10).innerHTML

}
function clearRow(OGrdAdminCredit, rowIndex) {
    OGrdAdminCredit.rows(rowIndex + 1).cells(0).firstChild.value = ""
    OGrdAdminCredit.rows(rowIndex + 1).cells(1).innerText = ""
    OGrdAdminCredit.rows(rowIndex + 1).cells(3).firstChild.value = ""
    OGrdAdminCredit.rows(rowIndex + 1).cells(4).firstChild.value = ""
    OGrdAdminCredit.rows(rowIndex + 1).cells(5).firstChild.value = "00:00"
    OGrdAdminCredit.rows(rowIndex + 1).cells(6).firstChild.value = "00:00"
    OGrdAdminCredit.rows(rowIndex + 1).cells(7).innerText = ""
    if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0")
        OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.validValue = ""
    OGrdAdminCredit.rows(rowIndex + 1).cells(9).firstChild.value = ""
    OGrdAdminCredit.rows(rowIndex + 1).setAttribute("CreditID", 0)
    OGrdAdminCredit.rows(rowIndex).setAttribute("CreditID", $get(MasterObj + "txtCreditIDForNew").value)

    OGrdAdminCredit.rows(rowIndex).cells(10).innerHTML = '<button  style="background-image: url(' + "'../../../App_Utility/Images/Icons/deleteallink.gif'" + ');background-color:transparent;cursor:hand;background-position:center;background-repeat:no-repeat;border-width:0px;width:25px;" Title="حذف"  onclick="OnClickDelRow(this)"></button>'

}
////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var SDate = $get(MasterObj + "txtKCalSDate").value
var EDate = $get(MasterObj + "txtKCalEDate").value
$get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
$get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
$get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
$get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
$get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
$get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);

//*************************************OnLoad*************************************
$get(MasterObj + "txtXmlNew").value = ""
////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          
document.body.attachEvent('onkeydown', aa)
document.body.attachEvent('onclick', aa)
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SetRowNew(OGrdAdminCredit, rowIndex) {
    //کپي کردن سطر بالايي در سطر زيري در صورت تيک خورده بودن آيتمهاي پيشفرض

    if (document.getElementById(MasterObj + "chkPerson").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(0).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.value
        OGrdAdminCredit.rows(rowIndex + 1).cells(1).innerText = OGrdAdminCredit.rows(rowIndex).cells(1).innerText

    }
    if (document.getElementById(MasterObj + "chkStartDate").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(3).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value
    }
    if (document.getElementById(MasterObj + "chkEndDate").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(4).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value
    }

    if (document.getElementById(MasterObj + "chkSTime").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(5).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value
    }
    if (document.getElementById(MasterObj + "chkETime").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(6).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value
    }

    if (document.getElementById(MasterObj + "chkCreditGroup").checked == true) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1") {
            OGrdAdminCredit.rows(rowIndex + 1).cells(2).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.value
            if (document.getElementById(MasterObj + "chkCreditType").checked == false)
                OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.value = "0";
        }


    }
    if (document.getElementById(MasterObj + "chkDesc").checked == true) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(9).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(9).firstChild.value
    }
    if (document.getElementById(MasterObj + "chkCreditType").checked == true) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1")
            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.value

    }


    if (document.getElementById(MasterObj + "chkCreditGroup").checked == false) {
        OGrdAdminCredit.rows(rowIndex + 1).cells(2).firstChild.value = document.getElementById(MasterObj + "CmbTemp").value
        if (document.getElementById(MasterObj + "chkCreditType").checked == false) {
            if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1") {
                OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.value = document.getElementById(MasterObj + "CmbCreditType").value

            }
        }

    }


    if (document.getElementById(MasterObj + "chkCreditGroup").checked == true) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
            OGrdAdminCredit.rows(rowIndex + 1).cells(2).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.value
        }
    }

    if (document.getElementById(MasterObj + "chkCreditGroup").checked == false) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
            OGrdAdminCredit.rows(rowIndex + 1).cells(2).firstChild.value = document.getElementById(MasterObj + "CmbTemp").value
        }
    }


    if (document.getElementById(MasterObj + "chkCreditType").checked == true) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.value = OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.value
            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.validValue = OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.validValue
            onchangeControl1(OGrdAdminCredit.rows(rowIndex + 1).cells(2).firstChild)




        }
    }



    if (document.getElementById(MasterObj + "chkCreditType").checked == false) {
        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.value = ""
            OGrdAdminCredit.rows(rowIndex + 1).cells(8).firstChild.validValue = ""
        }
    }




    SelectRowGrid(OGrdAdminCredit.rows(rowIndex + 1))
    OGrdAdminCredit.rows(rowIndex + 1).cells(0).firstChild.focus();
    OGrdAdminCredit.rows(rowIndex + 1).cells(0).firstChild.select();
    document.getElementById(MasterObj + "txtPersonGrdCode").value = OGrdAdminCredit.rows(rowIndex + 1).cells(0).firstChild.value


}
//==========================================================================
function aa() {
    if (flag == true) {
        XTabTable.focus()
    }
    flag = false;
}
//==========================================================================
function onClickPersonelName(obj, Mode) {
    var row = obj.parentElement;
    if (Mode == "Client") { //اگر پس از ازتاريخ يا تا تاريخ صداخورد تا بررسي شود در صورت خالي بودن آنها صفحه مودال باز شود ياخير

        document.getElementById(MasterObj + "txtPCForEnterC").value = row.cells(0).firstChild.value
        if (row.cells(2).firstChild.value == "1") {
            document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10102"
        }
        if (row.cells(2).firstChild.value == "2") {
            document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10103"
        }
        document.getElementById(MasterObj + "txtCellIndex").value = obj.cellIndex;
    }

    document.getElementById(MasterObj + "txtRowIndex").value = parseInt(row.rowIndex);
    if (document.getElementById(MasterObj + "txtDateDetailCredit").value != row.cells(3).firstChild.value || document.getElementById(MasterObj + "txtPersonIDDetailCredit").value != row.cells(0).firstChild.value) {
        document.getElementById(MasterObj + "txtPersonIDDetailCredit").value = row.cells(0).firstChild.value
        document.getElementById(MasterObj + "txtDateDetailCredit").value = row.cells(3).firstChild.value
        document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
        document.getElementById(MasterObj + "BtnSubmit2").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function SelectRowGrid(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRow = SelectedRow;
    LastSelectedRowClass = LastSelectedRow.className;
    SelectedRow.className = "CssSelectedItemStyle";

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    var MyLast = LastSelectedRow;
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
    $get(MasterObj + "txtRowIndex").value = SelectedRow.rowIndex;
    if (LastSelectedRow != MyLast && MyLast != null)
        if (window.event.srcElement.tagName != "BUTTON")
            onClickPersonelName(LastSelectedRow.cells(1), "Server");

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onChangeCmbFilteringAdminCredit() {
    //خالي کردن گريد با تغيير مود فيلتر

    if (document.getElementById("GrdAdminCredit") != null)
        clearGrid(document.getElementById("GrdAdminCredit"))
    //
    //ايجاد يک سطر پس از تغيير مود و ايجاد يک سطر بدون آنکه فيلتر زده شود
    if (document.getElementById(MasterObj + "CmbFilteringAdminCredit").value == 31118) {
        document.getElementById(MasterObj + "txtRengTime").style.display = "none"
        OnClickBtnFilter();
    }
    else
        document.getElementById(MasterObj + "txtRengTime").style.display = "inline"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function clearGrid(obj) {

    j = obj.rows.length - 1
    for (; j >= 0; --j) {
        obj.deleteRow(j)
    }
    newrowindex = 0
    newrowidxMember = 0

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function CheckSameWorkPeriod() {
    var FlagChekWF = true;

    if ($get(MasterObj + "txtKCalSDate").value == "//")
        $get(MasterObj + "txtKCalSDate").value = "";
    if ($get(MasterObj + "txtKCalEDate").value == "//")
        $get(MasterObj + "txtKCalEDate").value = "";
    oXmlDoc = new ActiveXObject("MsXml2.DomDocument");
    oXmlDoc.loadXML($get(MasterObj + "txtWorkPeriodXml").value)
    if ($get(MasterObj + "txtKCalSDate").value != "" && $get(MasterObj + "txtKCalEDate").value != "") {
        var WorkPeriodXmlS = oXmlDoc.documentElement.selectNodes("/GeneralEntity/WorkPeriodInfo [S<='" + $get(MasterObj + "txtKCalSDate").value.substr(2, 10) + "' and E>='" + $get(MasterObj + "txtKCalSDate").value.substr(2, 10) + "' ] ");
        var WorkPeriodXmlE = oXmlDoc.documentElement.selectNodes("/GeneralEntity/WorkPeriodInfo [S<='" + $get(MasterObj + "txtKCalEDate").value.substr(2, 10) + "' and E>='" + $get(MasterObj + "txtKCalEDate").value.substr(2, 10) + "' ] ");
        if (WorkPeriodXmlS.length > 0 && WorkPeriodXmlE.length > 0) {
            if (WorkPeriodXmlS.item(0).selectSingleNode("W").text != WorkPeriodXmlE.item(0).selectSingleNode("W").text)
                FlagChekWF = false;
        }
        else if (WorkPeriodXmlS.length == 0 || WorkPeriodXmlE.length == 0) {
            FlagChekWF = false;
        }
    }
    return FlagChekWF;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {


    $get(MasterObj + "txtXmlNew").value = ""
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value

    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

    $get(MasterObj + "txtGroupPerson").value = $get(MasterObj + "CmbPersonelGroup").value
    $get(MasterObj + "txtGroupCode").value = $get(MasterObj + "CmbGroupCode").value
    $get(MasterObj + "txtCodeGroupCode").value = $get(MasterObj + "CmbCreditType").value

    if (!CheckSameWorkPeriod()) {
        alert("تاريخ شروع و خاتمه بايد در يک دوره باشند")
        return;
    }
    if ($get(MasterObj + "txtKCalEDate").value < $get(MasterObj + "txtKCalSDate").value) {
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
        return;
    } //در حالا ثبت نشده پر کردن گروه اجباري است


    if ($get(MasterObj + "CmbFilteringAdminCredit").value == "31117" && $get(MasterObj + "CmbGroupCode").value == 0) {
        alert("لطفا گروه مجوز را وارد نماييد")
        return;
    }
    if ($get(MasterObj + "KCalSDate_txtYear").value == '' || $get(MasterObj + "KCalSDate_txtMonth").value == "" || $get(MasterObj + "KCalSDate_txtDay").value == "" || $get(MasterObj + "KCalEDate_txtYear").value == "" || $get(MasterObj + "KCalEDate_txtMonth").value == "" || $get(MasterObj + "KCalEDate_txtDay").value == "") {

        alert("لطفا اطلاعات را تکميل نماييد")
    }

    else {
        if (document.getElementById(MasterObj + "txtRowIndex").value == "")
            document.getElementById(MasterObj + "txtRowIndex").value = "0";
        //اگر حالت جديد است طبق دستور خانم نجفي پرسنلي خالي شود
        if (document.getElementById(MasterObj + "CmbFilteringAdminCredit").value == "31118") {
            document.getElementById(MasterObj + "cmbPersonCode_txtCode").value = ""
            document.getElementById(MasterObj + "cmbPersonCode_txtName").value = ""
            document.getElementById(MasterObj + "CmbPersonelGroup").value = "0"



        }

        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit1").click();
    }
}
//*******************************************************************************
function OnChangeCmbGroupCode() {

    //فيلتر کمبوها گروه و نوع از روي هم -کپي از صفحه قبل وقوع
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    //    alert($get(MasterObj + "txtXMLCmbCredite").value)
    xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
    var xmlNodes;
    $get(MasterObj + "CmbCreditType").innerHTML = ""
    //    alert($get(MasterObj + "CmbGroupCode").value)
    var j = 0
    if ($get(MasterObj + "CmbGroupCode").value != 0 && $get(MasterObj + "CmbGroupCode").value != "") {
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGroupCode").value + "]");
    }
    else {
        xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
        //        alert(xmlNodes.xml)
    }

    //    alert(xmlNodes.length)
    if (xmlNodes.length != 0) {
        if ($get(MasterObj + "CmbGroupCode").value != 0) {
            if (j == 0) {

                optionEl = document.createElement("OPTION")
                $get(MasterObj + "CmbCreditType").options.add(optionEl)
                $get(MasterObj + "CmbCreditType").all(j).innerText = 'انتخاب نشده'
                $get(MasterObj + "CmbCreditType").all(j).value = '0'
                j++
            }
        }
        for (var i = 0; i < xmlNodes.length; ++i) {
            optionEl = document.createElement("OPTION")
            $get(MasterObj + "CmbCreditType").options.add(optionEl)
            $get(MasterObj + "CmbCreditType").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
            $get(MasterObj + "CmbCreditType").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
            j++
        }
    }
}
//*******************************************************************************
function onchangeControl1(obj) {
    isCheanged = true
    var rowIndex = obj.parentElement.parentElement.rowIndex
    if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
        if ($get(MasterObj + 'txtXmlPersonCode').value != "") {

            if (document.getElementById(MasterObj + "chkCreditType").checked == true) {
                var rowIndex = obj.parentElement.parentElement.rowIndex
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlPersonCode').value)
                oXmlDoc.setProperty("SelectionLanguage", "XPath");

                //                   alert(XmlNodes.length)
                if (obj.value != "0")
                    var XmlNodess = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[CodeGroupID=" + OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.value + "]");

                if (XmlNodess.length == 0) {
                    obj.parentElement.parentElement.cells(8).firstChild.value = ""
                    obj.parentElement.parentElement.cells(8).firstChild.validValue = ""

                }

                else {

                    if (rowIndex != "1") {
                        obj.parentElement.parentElement.cells(8).firstChild.value = OGrdAdminCredit.rows(rowIndex - 1).cells(8).firstChild.value
                        obj.parentElement.parentElement.cells(8).firstChild.validValue = OGrdAdminCredit.rows(rowIndex - 1).cells(8).firstChild.validValue
                    }
                    else if (rowIndex == "1") {
                        obj.parentElement.parentElement.cells(8).firstChild.value = ""
                        obj.parentElement.parentElement.cells(8).firstChild.validValue = ""
                    }


                }
            }


        }

    }
}
//*******************************************************************************
function onchangeControl(obj) {
    if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0")
        isCheanged = true
    else if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1") {
        isCheanged = true
        var row = obj.parentElement.parentElement;
        var CellIndex = obj.parentElement.cellIndex;

        var rowIndex = obj.parentElement.parentElement.rowIndex
        var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
        if (row.cells(5).firstChild.value == "00") {
            row.cells(5).firstChild.value = "00:00"
        }
        if (row.cells(5).firstChild.value == "0") {
            row.cells(5).firstChild.value = "00:00"
        }
        if (row.cells(6).firstChild.value == "00") {
            row.cells(6).firstChild.value = "00:00"
        }
        if (row.cells(6).firstChild.value == "0") {
            row.cells(6).firstChild.value = "00:00"

        }


        //    if (CellIndex == 5 || CellIndex == 6) {
        if (row.cells(5).firstChild.value == "00:00" && row.cells(6).firstChild.value == "00:00") {
            //               isCheanged = true
            //فيلتر کمبوها گروه و نوع از روي هم -کپي از صفحه قبل وقوع
            //            alert(row.cells(5).firstChild.value)
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";

            xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
            var xmlNodes;
            OGrdAdminCredit.rows(rowIndex).cells(8).innerHTML = '<select   style="width:160px"  class="TxtControls" onkeydown="checkEnter(this,0)" onfocus="onclickForFocus" > </select>'

            var j = 0
            //       alert(obj.value)
            if (obj.value != 0 && obj.value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + row.cells(2).firstChild.value + " and Daily=1" + "]");
                //     
                //                alert(row.cells(2).firstChild.value)      
                //                alert(xmlNodes.length)
            }
            else {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");

            }
            //            alert(xmlNodes.length )
            if (xmlNodes.length != 0) {
                if (obj.value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = 'انتخاب نشده';
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = '0';
                        j++
                    }
                }


                for (var i = 0; i < xmlNodes.length; ++i) {
                    optionEl = document.createElement("OPTION")
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++
                    //                 alert(j)
                }
            }
            if (xmlNodes.length == 0) {
                if (obj.value != 0) {
                    if (j == 0) {
                        optionEl = document.createElement("OPTION")
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = 'انتخاب نشده';
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = '0';

                    }


                }

            }

        }

        if (row.cells(5).firstChild.value != "00:00" && row.cells(6).firstChild.value != "00:00" || row.cells(5).firstChild.value == "00:00" && row.cells(6).firstChild.value != "00:00" || row.cells(5).firstChild.value != "00:00" && row.cells(6).firstChild.value == "00:00") {
            //        alert(row.cells(5).firstChild.value)
            var rowIndex = obj.parentElement.parentElement.rowIndex
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            //فيلتر کمبوها گروه و نوع از روي هم -کپي از صفحه قبل وقوع
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
            var xmlNodes;
            OGrdAdminCredit.rows(rowIndex).cells(8).innerHTML = '<select   style="width:160px"  class="TxtControls" onkeydown="checkEnter(this,0)"  > </select>'

            var j = 0
            if (obj.value != 0 && obj.value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + row.cells(2).firstChild.value + " and Timely=1" + "]");

            }
            else {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
            }

            if (xmlNodes.length != 0) {

                if (obj.value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = 'انتخاب نشده';
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = '0';
                        j++
                    }
                }

                for (var i = 0; i < xmlNodes.length; ++i) {
                    //             alert(xmlNodes.item(i).selectSingleNode('CodeName').text)
                    optionEl = document.createElement("OPTION")
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++

                }
            }
        }
    }

}



//*******************************************************************************
function OnBlurGrdStartDate(obj) {

    var row = obj.parentElement.parentElement; //اگر اينتر خورده و فوکوس روي بعدي افتاده است    
    if ((thisControl > 3) && WindowEvent == 13) {
        if (obj.value != "") { //  کنترل صحت تاريخ و اصلاح آن دقيقا مشابه تقويم در ان توضيح داده شده است           
            var objKCalSdate = $get(MasterObj + "KCalSdate_txtYear").value + "/" + $get(MasterObj + "KCalSdate_txtMonth").value + "/" + $get(MasterObj + "KCalSdate_txtDay").value

            var Year = objKCalSdate.substr(0, 4)
            var Month = objKCalSdate.substr(5, 2)
            var Day = objKCalSdate.substr(8, 2)

            obj.value = CorrectDate(obj, Year, Month, Day);

            txtYear = obj.value.substr(6, 4)
            txtMonth = CorrectlyChekedForAdminCredit(obj.value.substr(3, 2), "Month")
            txtDay = CorrectlyChekedForAdminCredit(obj.value.substr(0, 2), "Day")

            obj.value = txtDay + "/" + txtMonth + "/" + txtYear

            if ($get(MasterObj + "CmbFilteringAdminCredit").value == "31118")
                if (!(document.getElementById(MasterObj + "chkEndDate").checked && row.rowIndex > 1))
                    obj.parentElement.parentElement.cells(4).firstChild.value = obj.value
            }
            else if (obj.value == "") {
                $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
                $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
                if (row.cells(0).firstChild.value == "") {
                    alert("لطفاپرسنلي راواردکنيد")
                    return;
                }


                ShouldEnterCreditOpen(row, "Date", 3);
                $get(MasterObj + "txtSubmit").value = "ShouldEnterCreditOpen";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        if (obj.value != "") { //صدا کردن متد براي آوردن اطلاعات تکميلي
            if (row.cells(0).firstChild.value == "") {
                alert("لطفاپرسنلي راواردکنيد")
                return;
            }

            onClickPersonelName(row.cells(3), "Client");
        }
        //        if (row.cells(3).firstChild.value.value != "" && row.cells(5).firstChild.value.value != "" && row.cells(6).firstChild.value.value == "00:00" && row.cells(7).firstChild.value.value == "00:00") {
        //            OnChangeCmbGrdGroupCode(obj)
        //            
        //        }
        thisControl = ""
    }
    //**********************************************************************************************       
    function CorrectlyChekedForAdminCredit(obj, str) {
        if (str == "Month")
            if (obj > 12)
                return 12
            else
                return obj
            if (str == "Day") {
                if (!F_LeapPersian(txtYear) && obj > 29
                        && txtMonth == 12
                        )//سال کبيسه
                {
                    return 29
                }
                if (txtMonth > '06' && obj > 30)
                    return 30
                else if (obj > 31)
                    return 31
                else
                    return obj
            }
        }
        //**********************************************************************************************
        function OnBlurGrdEndDate(obj) {  //دقيقا مشابه از تاريخ
            var row = obj.parentElement.parentElement;
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var rowIndex = obj.parentElement.parentElement.rowIndex
            if (thisControl > 4 && WindowEvent == 13) {
                if (obj.value != "") {
                    var objKCalSdate = $get(MasterObj + "KCalEdate_txtYear").value + "/" + $get(MasterObj + "KCalEdate_txtMonth").value + "/" + $get(MasterObj + "KCalEdate_txtDay").value

                    var Year = objKCalSdate.substr(0, 4)
                    var Month = objKCalSdate.substr(5, 2)
                    var Day = objKCalSdate.substr(8, 2)

                    obj.value = CorrectDate(obj, Year, Month, Day);
                    txtYear = obj.value.substr(6, 4)
                    txtMonth = CorrectlyChekedForAdminCredit(obj.value.substr(3, 2), "Month")
                    txtDay = CorrectlyChekedForAdminCredit(obj.value.substr(0, 2), "Day")

                    obj.value = txtDay + "/" + txtMonth + "/" + txtYear
                }
                else if (obj.value == "") {
                    if (row.cells(0).firstChild.value == "") {
                        alert("لطفاپرسنلي راواردکنيد")
                        return;
                    }

                    ShouldEnterCreditOpen(row, "Date", 4);

                    var SDate = row.cells(3).firstChild.value
                    SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2)
                    var strXML = document.getElementById(MasterObj + "txtGetCountAggrigatedCode").value
                    var strXML = "<Root>" + strXML + "</Root>";
                    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDocSave.loadXML(strXML);
                    var XmlNodeTmp = "";
                    if ((strXML != "<Root></Root>") && (strXML != "<Root/>"))
                        XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/pc[DATE='" + SDate + "']");
                    //                        alert(XmlNodeTmp.length)
                    if (XmlNodeTmp.length != "") {
                        CreateGridOffers(strXML, rowIndex);

                    }
                    else {

                        if (obj.value.substr(6, 4) + obj.value.substr(3, 2) + obj.value.substr(0, 2) < row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2)) {
                            alert("تاريخ خاتمه از تاريخ شروع کوچکتر است ");
                        }


                    }

                }
            }
            if (obj.value != "") {
                if (row.cells(0).firstChild.value == "") {
                    alert("لطفاپرسنلي راواردکنيد")
                    return;
                }
                onClickPersonelName(row.cells(4), "Client");
            }
            thisControl = ""


        }
        //**********************************************************************************************
        function ShouldEnterCreditOpen(row, obj, cellIndex) {

            //فراهم آوردن پارامترها ي مورد نيازبراي چک کردن آنکه آيا مودال باز شود
            $get(MasterObj + "txtRowIndex").value = row.rowIndex;
            rowIndex = $get(MasterObj + "txtRowIndex").value
            document.getElementById(MasterObj + "cellIndex").value = cellIndex

            document.getElementById(MasterObj + "txtPCForEnterC").value = row.cells(0).firstChild.value

            if (row.cells(2).firstChild.value == "1") {

                document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10102"
                //                  alert (document.getElementById(MasterObj + "txtMainCodeForEnterC").value)
            }
            if (row.cells(2).firstChild.value == "2") {
                document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10103"
                //                              alert( document.getElementById(MasterObj + "txtMainCodeForEnterC").value)
            }

            if (obj == "Date") {
                document.getElementById(MasterObj + "txtSDateForEnterC").value = $get(MasterObj + "KCalSDate_txtYear").value + "/"
          + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
                document.getElementById(MasterObj + "txtEDateForEnterC").value = $get(MasterObj + "KCalEDate_txtYear").value + "/"
          + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value


            }
            if (obj == "Time") {
                var SDate = row.cells(3).firstChild.value
                SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2)
                var EDate = row.cells(4).firstChild.value
                EDate = EDate.substr(6, 4) + "/" + EDate.substr(3, 2) + "/" + EDate.substr(0, 2)
                document.getElementById(MasterObj + "txtSDateForEnterC").value = SDate
                document.getElementById(MasterObj + "txtEDateForEnterC").value = EDate

            }
        }
        //**********************************************************************************************
        function OnBlurGrdPersonelNo(obj) {
            var row = obj.parentElement.parentElement;
            if (obj.value == "") {
                row.cells(1).innerText = ""
            }
            else {
                if ($get(MasterObj + "txtOldPersonCode").value != obj.value) {
                    document.getElementById(MasterObj + "txtPersonGrdCode").value = obj.value;

                    document.getElementById(MasterObj + "txtRowIndex").value = parseInt(obj.parentElement.parentElement.rowIndex);
                    $get(MasterObj + "txtSubmit").value = "PersonCodeGrdSearch";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
            thisControl = "";
        }
        //**********************************************************************************************
        function OnBlurGrdStartTime(obj) {
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var rowIndex = obj.parentElement.parentElement.rowIndex
            //            document.getElementById(MasterObj + "cellIndex").value = obj.parentElement.cellIndex
            if (thisControl > 5 && WindowEvent == 13) {
                var row = obj.parentElement.parentElement;

                if (row.cells(5).firstChild.value == "") {
                    //پک کردن آنکه آيامودال باز شود يا خير 
                    obj.parentElement.parentElement.cells(6).firstChild.focus()
                    obj.parentElement.parentElement.cells(6).firstChild.select()
                    if (row.cells(0).firstChild.value == "") {
                        alert("لطفا پرسنلي راواردکنيد")
                        return;
                    }
                    if (row.cells(3).firstChild.value == "") {
                        alert("لطفا تاريخ شروع راواردکنيد")
                        return;
                    }
                    if (row.cells(4).firstChild.value == "") {
                        alert("لطفا تاريخ خاتمه راواردکنيد")
                        return;
                    }

                    if (row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2) > row.cells(4).firstChild.value.substr(6, 4) + row.cells(4).firstChild.value.substr(3, 2) + row.cells(4).firstChild.value.substr(0, 2)) {
                        alert("تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد")
                        return;
                    }

                    ShouldEnterCreditOpen(row, "Time", 5);
                    var strXML = document.getElementById(MasterObj + "txtGetCountAggrigatedCode").value
                    var strXML = "<Root>" + strXML + "</Root>";
                    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDocSave.loadXML(strXML);
                    var XmlNodeTmp = "";
                    if ((strXML != "<Root></Root>") && (strXML != "<Root/>"))
                        XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/pc[DATE='" + document.getElementById(MasterObj + "txtEDateForEnterC").value + "']");
                    if (XmlNodeTmp.length != "") {

                        CreateGridOffers(strXML, rowIndex);

                    }
                    else {

                        OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.focus()
                        OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.select()
                    }
                    thisControl = ""
                }
            }
        }
        //**********************************************************************************************
        function OnBlurGrdEndTime(obj) {
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var rowIndex = obj.parentElement.parentElement.rowIndex
            document.getElementById(MasterObj + "cellIndex").value = obj.parentElement.cellIndex

            if (thisControl > 7 && WindowEvent == 13) {
                var row = obj.parentElement.parentElement;
                if (row.cells(6).firstChild.value == "") {
                    if (row.cells(0).firstChild.value == "") {
                        alert("لطفا پرسنلي راواردکنيد")
                        return;
                    }
                    if (row.cells(3).firstChild.value == "") {
                        alert("لطفا ازتاريخ راواردکنيد")
                        return;
                    }
                    if (row.cells(4).firstChild.value == "") {
                        alert("لطفا تاتاريخ راواردکنيد")
                        return;
                    }
                    if (row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2) > row.cells(4).firstChild.value.substr(6, 4) + row.cells(4).firstChild.value.substr(3, 2) + row.cells(4).firstChild.value.substr(0, 2)) {
                        alert("تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد")
                        return;
                    }
                    ShouldEnterCreditOpen(row, "Time", 6);
                    var strXML = document.getElementById(MasterObj + "txtGetCountAggrigatedCode").value
                    var strXML = "<Root>" + strXML + "</Root>";
                    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDocSave.loadXML(strXML);
                    var XmlNodeTmp = "";
                    if ((strXML != "<Root></Root>") && (strXML != "<Root/>"))
                        XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/pc[DATE='" + document.getElementById(MasterObj + "txtEDateForEnterC").value + "']");

                    if (XmlNodeTmp.length != "") {

                        CreateGridOffers(strXML, rowIndex);

                    }
                    else {

                        ////                        اگر نيست فوکوس روي بعدي
                        if (document.getElementById(MasterObj + "cellIndex").value == "6") {
                            OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 2).firstChild.setActive()
                        }
                        else {
                            OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.focus()
                            OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.select()
                        }
                    }

                }
            }
            thisControl = ""
            if (document.getElementById(MasterObj + "cellIndex").value == "6") {
                document.getElementById(MasterObj + "txtSTimeGetvalue").value = OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value
                document.getElementById(MasterObj + "txtETimeGetvalue").value = OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value
                var Vlue = GetVlue(OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value, OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value)
                OGrdAdminCredit.rows(rowIndex).cells(7).innerText = Vlue;


            }

        }
        //**********************************************************************************************
        function GetVlue(STime, ETime) {
            if (STime != "" && ETime != "") { //مقدار عددي از ساعت

                var ValueStime = Math.abs(STime.substring(0, 2)) * 60
                ValueStime = Math.abs(ValueStime) + Math.abs(STime.substring(3, 5))//مقدار عددي تا ساعت

                var ValueEtime = Math.abs(ETime.substring(0, 2)) * 60
                ValueEtime = Math.abs(ValueEtime) + Math.abs(ETime.substring(3, 5))

                var Ret = ValueEtime - ValueStime

                if (Ret >= 60) {

                    var s = Ret - Math.floor(Ret / 60) * 60;
                    if (s.toString().length == 1)
                        s = "0" + s
                    Ret = s + " : " + Math.floor(Ret / 60)
                }
                else {
                    if (Ret.toString().length == 1)
                        Ret = "0" + Ret
                    Ret = "00:" + Ret
                }
                if (STime == "00:00" && ETime == "00:00")
                    Ret = "روزانه"
                return Ret;
            }
            else
                return "";
        }
        //**********************************************************************************************
        function OnBlurGrdCode(obj) {
            //چک کردن دسترسي کدهاي کاربر
            var row = obj.parentElement.parentElement;

            if (thisControl > 8 && WindowEvent == 13) {
                if (row.cells(8).firstChild.value == "") {
                    onchangeControl(row.cells(8).firstChild)
                }
                if (row.cells(0).firstChild.value == "") {
                    alert("لطفا پرسنلي راواردکنيد")
                    return;
                }

                if (row.cells(3).firstChild.value == "") {
                    alert("لطفا ازتاريخ راواردکنيد")
                    return;
                }
                if (row.cells(4).firstChild.value == "") {
                    alert("لطفا تاتاريخ راواردکنيد")
                    return;
                }
                if (row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2) > row.cells(4).firstChild.value.substr(6, 4) + row.cells(4).firstChild.value.substr(3, 2) + row.cells(4).firstChild.value.substr(0, 2)) {
                    alert("تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد")
                    return;
                }
                else if ((row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2) == row.cells(4).firstChild.value.substr(6, 4) + row.cells(4).firstChild.value.substr(3, 2) + row.cells(4).firstChild.value.substr(0, 2)) && row.cells(5).firstChild.value > row.cells(6).firstChild.value) {
                    alert("ساعت خاتمه بايد بزرگتر از ساعت شروع باشد")
                    return;
                }
                var ISDaily = 0;
                var ISTimely = 0;
                if (row.cells(7).innerText == "روزانه")
                    ISDaily = 1
                else
                    ISTimely = 1
                var SDate = row.cells(3).firstChild.value
                SDate = SDate.substr(6, 4) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2)
                var EDate = row.cells(4).firstChild.value
                EDate = EDate.substr(6, 4) + "/" + EDate.substr(3, 2) + "/" + EDate.substr(0, 2)
                document.getElementById(MasterObj + "strParam").value = "<Root><CodePermission><Flag></Flag><GroupCodeID>" + row.cells(2).firstChild.value + "</GroupCodeID><PersonCode>" + row.cells(0).firstChild.value + "</PersonCode><SDate>" + SDate + "</SDate><EDate>" + EDate + "</EDate><OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</OnLineUserID><ISDaily>" + ISDaily + "</ISDaily><ISTimly>" + ISTimely + "</ISTimly></CodePermission></Root>"
                document.getElementById(MasterObj + "txtRowIndex").value = row.rowIndex
                document.getElementById(MasterObj + "txtSubmit").value = "GetCodePermision";
                document.getElementById(MasterObj + "BtnSubmit").click();

            }
            thisControl = ""
        }
        //**********************************************************************************************
        function checkEnter(obj) {
            var row = obj.parentElement.parentElement;
            var CellIndex = obj.parentElement.cellIndex;
            //           alert(CellIndex)
            if ((SkipGetEnter == 1) && (row.rowIndex > 1))
                SkipGetEnter = 1
            //-----------------------مقدار دهي نوع کليد فشرده شده-----------           
            WindowEvent = window.event.keyCode
            //-----------------------------------------------تشخيص نوع کليد
            switch (WindowEvent) {
                case 113: //-----------F2 روي کدها  
                    if (obj.parentElement.cellIndex == 8) {
                        obj.value = ""
                        obj.validValue = "0"
                        thisControl = 9
                        WindowEvent = 13
                        isCheanged = true
                        obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()

                    }
                    break;
                case 40: //---------------اروکي بالا
                    var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) + 1; //----------index رديف جديد
                    if (obj.parentElement.parentElement.parentElement.rows(rowIndex) != null) {
                        if (CellIndex == 0) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.select()
                            return
                        }
                        else if (CellIndex == 3) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                            return
                        }
                        else if (CellIndex == 4) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.select()
                            return
                        }
                        else if (CellIndex == 5) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.select()
                            return
                        }
                        else if (CellIndex == 6) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(6).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(6).firstChild.select()
                            return
                        }
                        else if (CellIndex == 8) {
                            if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
                                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.select()
                                return
                            }
                        }
                        else if (CellIndex == 9) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                            return
                        }
                    }
                    break;
                case 38: //----------------اروکي پايين
                    var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) - 1; //----------index رديف جديد
                    if (rowIndex != 0) {
                        if (obj.parentElement.cellIndex == 0) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.select()
                            return
                        }
                        else if (obj.parentElement.cellIndex == 3) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                            return
                        }
                        else if (obj.parentElement.cellIndex == 4) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.select()
                            return
                        }
                        else if (obj.parentElement.cellIndex == 5) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.select()
                            return
                        }
                        else if (obj.parentElement.cellIndex == 6) {
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(6).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(6).firstChild.select()
                            return
                        }
                        else if (obj.parentElement.cellIndex == 8) {
                            if (document.getElementById(MasterObj + "txtPopupAdmin").value = "0") {
                                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.select()
                                return
                            }
                        }
                        else if (obj.parentElement.cellIndex == 9) {

                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                            obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                            return
                        }
                    }
                    break;
                case 13: //---------------------------اينتر    
                    //                       alert(obj.parentElement.parentElement.rowIndex) 

                    CheckNextFocus(obj.parentElement, obj.parentElement.parentElement.rowIndex);
                    break;
            }
        }

        //**********************************************************************************************
        function save(obj) {
            var xmlStr;
            xmlStr = "<Root><Tb><PersonID>";
            xmlStr = xmlStr + obj.cells(0).firstChild.value + "</PersonID><PersonCode>";
            xmlStr = xmlStr + obj.cells(0).firstChild.value + "</PersonCode><StartDate>";
            xmlStr = xmlStr + obj.cells(3).firstChild.value + "</StartDate><EndDate>";
            xmlStr = xmlStr + obj.cells(4).firstChild.value + "</EndDate><Type>";
            xmlStr = xmlStr + obj.cells(2).firstChild.value + "</Type><CreditType>";
            if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0")
                xmlStr = xmlStr + obj.cells(8).firstChild.validValue + "</CreditType><StartTime>";
            else if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1")
                xmlStr = xmlStr + obj.cells(8).firstChild.value + "</CreditType><StartTime>";
            xmlStr = xmlStr + obj.cells(5).firstChild.value + "</StartTime><EndTime>";
            xmlStr = xmlStr + obj.cells(6).firstChild.value + "</EndTime><Des>";
            xmlStr = xmlStr + obj.cells(9).firstChild.value + "</Des><StatusType>";
            xmlStr = xmlStr + "Admin" + "</StatusType><UserPersonelID>";
            xmlStr = xmlStr + document.getElementById(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";
            //                      alert(xmlStr)

            if (obj.cells(3).firstChild.value != obj.cells(4).firstChild.value && obj.cells(5).firstChild.value > obj.cells(6).firstChild.value)
                xmlStr = xmlStr + "<_Flags>1</_Flags>";
            //                alert(obj.getAttribute("CreditID"))
            if (obj.getAttribute("CreditID") == 0)
                xmlStr = xmlStr + "<CreditID>0</CreditID></Tb><Setting><Flag>";
            else
                xmlStr = xmlStr + "<CreditID>" + obj.getAttribute("CreditID") + "</CreditID></Tb><Setting><Flag>";
            xmlStr = xmlStr + "2" + "</Flag></Setting></Root>";
            //            alert(xmlStr)
            document.getElementById(MasterObj + "txtXml").value = xmlStr;
            $get(MasterObj + "txtOldCreditID").value = obj.getAttribute("CreditID")
            //هر دفعه زمان ايجاد شماره مجوزها را به هم مي چسبانم براي اينکه با فيلتر مجوزهاي جاري وارد شده از بانک بيايد
            if (obj.getAttribute("CreditID") == "0")
                $get(MasterObj + "txtXmlNew").value = $get(MasterObj + "txtXmlNew").value + "<Credit><CreditID>" + obj.getAttribute("CreditID") + "</CreditID></Credit>"
            //               alert($get(MasterObj + "txtXmlNew").value )
        }
        //**********************************************************************************************
        function OnClickDelRow(obj) {
            rowIndex = obj.parentElement.parentElement.rowIndex;
            var row = obj.parentElement.parentElement;
            var SDate = row.cells(3).firstChild.value
            SDate = SDate.split("/")[2].substr(2, 2) + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[0];
            document.getElementById(MasterObj + "txtSDateDel").value = SDate;
            var EDate = row.cells(4).firstChild.value
            EDate = EDate.split("/")[2].substr(2, 2) + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[0];
            document.getElementById(MasterObj + "txtEDateDel").value = EDate;
            document.getElementById(MasterObj + "txtCreditID").value = row.getAttribute("CreditID")
            if (confirm('آيامطمئن هستيد؟')) {
                $get(MasterObj + "txtOldCreditID").value = document.getElementById(MasterObj + "txtCreditID").value

                document.getElementById(MasterObj + "txtSubmit").value = "Del";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //**********************************************************************************************
        function onclickForFocus(obj) {
            obj.select();
            obj.focus();
            isCheanged = true
            //            alert(obj.value)
            var Index = obj.parentElement.cellIndex;
            if (Index == 8) {
                document.getElementById(MasterObj + "LastValueOfObject").value = obj.value;
            }
            else if (Index == 0)
                $get(MasterObj + "txtOldPersonCode").value = obj.value;
            else if (Index == 3)
                $get(MasterObj + "txtOldSDate").value = obj.value;
        }
        //**********************************************************************************************

        function onclickForFocus1(obj) {

            obj.focus();
            var Index = obj.parentElement.cellIndex;
            //            alert(Index)
            if (Index == 8) {
                document.getElementById(MasterObj + "LastValueOfObject").value = obj.value;
            }
            else if (Index == 0)
                $get(MasterObj + "txtOldPersonCode").value = obj.value;
            else if (Index == 3)
                $get(MasterObj + "txtOldSDate").value = obj.value;
        }
        //**********************************************************************************************

        function onkeypressDate(obj) {
            //براي وارد کردن اعداد
            var key = window.event.keyCode
            window.event.returnValue = (
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) || (key == 191) || (key == 47) || (key == 111) ||
			((key >= 35) && (key <= 40)))
        }
        //        //*********************************FromSarband*************************************************************
        function SelectRow() {
            var SelectedRow = event.srcElement.parentElement
            XTabTableRow = SelectedRow.rowIndex
            var obj;
            obj = XTabTable
            if (LastSelectedRowForPopup != "")
                if (parseInt(LastSelectedRowForPopup) < obj.rows.length) {
                    if (parseInt(LastSelectedRowForPopup) % 2 == 0)
                        obj.rows(parseInt(LastSelectedRowForPopup)).className = ""
                    else
                        obj.rows(parseInt(LastSelectedRowForPopup)).className = "";
                }

            if (LastSelectedRowForPopup == "0")
                if (obj.rows.length > 0)
                    obj.rows(parseInt(LastSelectedRowForPopup)).className = "";

            LastSelectedRowForPopup = SelectedRow.rowIndex;
            SelectedRow.className = "CssSelectedItemStyle";
            OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            OGrdAdminCredit.rows(gridRowIndex).cells(8).firstChild.value = SelectedRow.cells(2).innerText

            OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.focus();
            OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.select();
        }
        //=================================
        function ShowCodes(obj) {
            OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var oRow = obj.parentElement.parentElement
            gridRowIndex = oRow.rowIndex
            Cleargrd(XTabTable)


            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXmlPersonCode').value)
            oXmlDoc.setProperty("SelectionLanguage", "XPath");

            if (obj.value == "")
            //             alert(Shortkey)
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[Shortkey!='']");

            else
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[starts-with(Shortkey,'" + obj.value + "')]");

            if (XmlNodes.length == 0) {
                alert("فرد مورد نظر دسترسي مجوز ندارد");
                OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.focus();
                OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.select();
                return;
            }
            if (XmlNodes.length != 0) {
                for (var i = 0; i < XmlNodes.length; ++i) {
                    var oRowX = XTabTable.insertRow()
                    var oCell1 = oRowX.insertCell()
                    var oCell2 = oRowX.insertCell()
                    var oCell3 = oRowX.insertCell()

                    oCell1.innerText = XmlNodes.item(i).selectSingleNode('Shortkey').text
                    oCell2.innerText = XmlNodes.item(i).selectSingleNode('CodeID').text
                    oCell3.innerText = XmlNodes.item(i).selectSingleNode('CodeName').text


                    oRowX.align = "center"
                    oRowX.style.height = "25px"

                    oCell1.style.width = "30px"
                    oCell2.style.display = "none"
                    oCell3.style.width = "150px"
                }
            }


            var Y = 217
            var X = 1160
            divCodePopup.style.display = "inline"
            divCodePopup.style.position = "absolute"
            var NewObj = obj;
            var posX = NewObj.offsetLeft; var posY = NewObj.offsetTop;

            while (NewObj.offsetParent) {
                posX = posX
                //                + NewObj.offsetParent.offsetLeft;
                posY = posY
                //                + NewObj.offsetParent.offsetTop;

                if (NewObj == document.getElementsByTagName('body')[0]) { break }
                else { NewObj = NewObj.offsetParent; }
            }

            divCodePopup.style.top = posY + 20;
            divCodePopup.style.left = posX - 5;
            SelectRow(XTabTableRow)

        }
        //=================================
        function XTabTableOnkeyDown(obj) {
            if (event.keyCode == 40) {
                if (XTabTableRow < XTabTable.rows.length - 1) {
                    XTabTableRow = XTabTableRow + 1
                    SelectRow(XTabTableRow)
                }
            }
            else if (event.keyCode == 38) {
                if (XTabTableRow > 0) {
                    XTabTableRow = XTabTableRow - 1
                    SelectRow(XTabTableRow)
                }
            }
            else if (event.keyCode == 13 || event.keyCode == 27) {

                divCodePopup.style.display = "none"
                divCodePopup.style.position = ""
                divCodePopup.style.top = ""
                divCodePopup.style.right = ""
                XTabTableRow = 0

                OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.focus();
                OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.select();


            }
        }
        //=================================
        function XTabTableDblClick(obj) {
            var oRow = event.srcElement.parentElement
            OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            OGrdAdminCredit.rows(gridRowIndex).cells(8).firstChild.value = oRow.cells(2).innerText
            OGrdAdminCredit.rows(gridRowIndex).cells(8).firstChild.validValue = oRow.cells(1).innerText

            divCodePopup.style.display = "none"
            divCodePopup.style.position = ""
            divCodePopup.style.top = ""
            divCodePopup.style.right = ""
            XTabTableRow = 0

            OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.focus();
            OGrdAdminCredit.rows(gridRowIndex).cells(9).firstChild.select();
        }
        //=================================
        function SelectRow(RowNum) {
            var SelectedRow = XTabTable.rows(RowNum)
            XTabTable.focus()
            var obj;
            obj = XTabTable
            if (LastSelectedRowForPopup != "")
                if (parseInt(LastSelectedRowForPopup) < obj.rows.length) {
                    if (parseInt(LastSelectedRowForPopup) % 2 == 0)
                        obj.rows(parseInt(LastSelectedRowForPopup)).className = ""
                    else
                        obj.rows(parseInt(LastSelectedRowForPopup)).className = "";
                }
            if (LastSelectedRowForPopup == "0")
                if (obj.rows.length > 0)
                    obj.rows(parseInt(LastSelectedRowForPopup)).className = "";
            LastSelectedRowForPopup = SelectedRow.rowIndex;
            SelectedRow.className = "CssSelectedItemStyle";
            OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            OGrdAdminCredit.rows(gridRowIndex).cells(8).firstChild.value = SelectedRow.cells(2).innerText
            OGrdAdminCredit.rows(gridRowIndex).cells(8).firstChild.validValue = SelectedRow.cells(1).innerText
        }
        //=================================
        function Cleargrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //=================================
        function onblurdivCodePopup() {
            divCodePopup.style.display = "none"
            onclickClose();
            divCodePopup.style.position = ""
            divCodePopup.style.top = ""
            divCodePopup.style.right = ""
            XTabTableRow = 0
        }
        //=================================
        function CheckNextFocus(Obj, rowIndex) {
            var CellIndex = Obj.cellIndex;
            //            alert(CellIndex)
            SkipGetEnter = document.getElementById(MasterObj + "txtSkipGetEnter").value;
            OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            if (rowIndex > 1 && SkipGetEnter == 1)
                SkipGetEnter = 1
            else SkipGetEnter = 0;
            //                             alert(CellIndex)
            ////         ===================   CellIndex==0
            switch (CellIndex) {
                case 0:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkCreditGroup").checked) {
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(2), rowIndex);
                    }
                    else {
                        //                  alert(10)
                        thisControl = 2;
                        ShouldOpen = false;
                        OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.focus();
                        OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.setActive();
                        //                        isCheanged = true
                    }
                    break;
                case 2:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkStartDate").checked)
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(3), rowIndex);

                    else {

                        thisControl = 3
                        OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.select();
                        OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.focus();

                    }
                    break;
                case 3:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkEndDate").checked)
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(4), rowIndex);
                    else {
                        thisControl = 4
                        OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.select();
                        OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.focus();

                    }
                    break;
                case 4:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkSTime").checked)
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(5), rowIndex);
                    else {
                        thisControl = 5
                        OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.select();
                        OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.focus();
                    }
                    break;
                case 5:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkETime").checked)
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(6), rowIndex);
                    else {
                        thisControl = 6
                        OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.select();
                        OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.focus();
                    }
                    break;
                case 6:
                    if (SkipGetEnter == 1 && $get(MasterObj + "chkCreditType").checked)
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(8), rowIndex);

                    else {

                        thisControl = 8
                        ShouldOpen = false;
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.focus();
                        if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1")
                            OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.setActive();
                        else if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0")
                            OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.select();
                        isCheanged = false

                    }
                    break;

                case 8:


                    if (SkipGetEnter == 1 && $get(MasterObj + "chkDesc").checked) {
                        CheckNextFocus(OGrdAdminCredit.rows(rowIndex).cells(9), rowIndex);
                        //                        alert(10)
                    }
                    else {
                        //                        alert(20)
                        thisControl = 9
                        OGrdAdminCredit.rows(rowIndex).cells(9).firstChild.select();
                        OGrdAdminCredit.rows(rowIndex).cells(9).firstChild.focus();
                        //                        isCheanged = true
                    }
                    break;
                case 9:
                    var row = OGrdAdminCredit.rows(rowIndex);

                    if (row.cells(3).firstChild.value.substr(6, 4) + row.cells(3).firstChild.value.substr(3, 2) + row.cells(3).firstChild.value.substr(0, 2) > row.cells(4).firstChild.value.substr(6, 4) + row.cells(4).firstChild.value.substr(3, 2) + row.cells(4).firstChild.value.substr(0, 2)) {
                        alert("تاريخ خاتمه بايد بزگتر از تاريخ شروع باشد")
                        return;
                    }
                    if (document.getElementById(MasterObj + "txtPopupAdmin").value == "1") {
                        if (row.cells(0).firstChild.value == "" || row.cells(2).firstChild.value == 0 || row.cells(3).firstChild.value == "" || row.cells(4).firstChild.value == "" || row.cells(5).firstChild.value == "" || row.cells(6).firstChild.value == "" || row.cells(8).firstChild.value == 0) {
                            alert("لطفا اطلاعات را تکميل نمايييد")
                            return;
                        }
                    }

                    if (document.getElementById(MasterObj + "txtPopupAdmin").value == "0") {
                        if (row.cells(0).firstChild.value == "" || row.cells(2).firstChild.value == 0 || row.cells(3).firstChild.value == "" || row.cells(4).firstChild.value == "" || row.cells(5).firstChild.value == "" || row.cells(6).firstChild.value == "" || row.cells(8).firstChild.validValue == "0" || row.cells(8).firstChild.validValue == "") {
                            alert("لطفا اطلاعات را تکميل نمايييد")
                            return;
                        }
                        if (document.getElementById(MasterObj + "chkCreditType").checked == true) {

                            if (row.cells(5).firstChild.value == "00") {
                                row.cells(5).firstChild.value = "00:00"
                            }
                            if (row.cells(5).firstChild.value == "0") {
                                row.cells(5).firstChild.value = "00:00"
                            }
                            if (row.cells(6).firstChild.value == "00") {
                                row.cells(6).firstChild.value = "00:00"
                            }
                            if (row.cells(6).firstChild.value == "0") {
                                row.cells(6).firstChild.value = "00:00"

                            }

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML($get(MasterObj + 'txtXmlPersonCode').value)
                            oXmlDoc.setProperty("SelectionLanguage", "XPath"); //اگر روي گريد حرکت کرده ام و مقدار کد معتبر است
                            if (row.cells(5).firstChild.value == "00:00" && row.cells(6).firstChild.value == "00:00") {
                                var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[CodeGroupID=" + row.cells(2).firstChild.value + "and Daily=1" + "and CodeID=" + row.cells(8).firstChild.validValue + "]");
                                if (XmlNodes.length == 0) {
                                    alert("لطفا نوع مجوز را درست وارد نمایید")
                                    row.cells(8).firstChild.value = ""
                                    row.cells(8).firstChild.validValue = "0"
                                    return;
                                }
                                else {

                                    row.cells(8).firstChild.value = XmlNodes.item(0).selectSingleNode('CodeName').text
                                    row.cells(8).firstChild.validValue = XmlNodes.item(0).selectSingleNode('CodeID').text

                                }
                            }

                            else if (row.cells(5).firstChild.value != "00:00" || row.cells(6).firstChild.value != "00:00") {
                                var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[CodeGroupID=" + row.cells(2).firstChild.value + "and Timely=1" + "and CodeID=" + row.cells(8).firstChild.validValue + "]");
                                if (XmlNodes.length == 0) {
                                    alert("لطفا نوع مجوز را درست وارد نمایید")
                                    row.cells(8).firstChild.value = ""
                                    row.cells(8).firstChild.validValue = "0"

                                    return;
                                }
                                else {
                                    row.cells(8).firstChild.value = XmlNodes.item(0).selectSingleNode('CodeName').text
                                    row.cells(8).firstChild.validValue = XmlNodes.item(0).selectSingleNode('CodeID').text

                                }
                            }


                        }

                    }

                    //اينتر شرح و ذخيره
                    if (IFISChange(Obj.parentElement)) {
                        save(Obj.parentElement);
                        document.getElementById(MasterObj + "txtRowIndex").value = rowIndex
                        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                        isCheanged = false;
                    }

                    break;
            }
        }

        //*********************************FromSarband*************************************************************
        function CorrectDate(obj, Year, Month, Day) {
            var sal;
            var Date = "";
            var s = obj.value.split('/');

            if (obj.value != "") {

                if (s.length > 3) {
                    obj.value = "";
                    return Date;
                }
                if (s[2] != null) {
                    sal = s[2].split('  ');
                }
                if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
                    obj.value = ""
                    return Date;
                }
                if (s.length == 3) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    if (s[2] == null)
                        Date = Year + "/" + Date
                    if (s[2] != null) {
                        var sal;
                        sal = s[2].split('  ');
                        if (sal[0].length == 0)
                            Date = Year + "/" + Date
                        if (sal[0].length == 1)
                            Date = Year.substr(0, 3) + sal[0] + "/" + Date
                        if (sal[0].length == 2)
                            Date = Year.substr(0, 2) + sal[0] + "/" + Date
                        if (sal[0].length == 3)
                            Date = Year.substr(0, 1) + sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] != "0000")
                            Date = sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] == "0000")
                            Date = Year + "/" + Date
                    }
                }

                if (s.length == 2) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    Date = Year + "/" + Date
                }

                if (s.length == 1) {
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Year + "/" + Month + "/" + Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Year + "/" + Month + "/" + Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Year + "/" + Month + "/" + Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Year + "/" + Month + "/" + Date + "01"
                }

                Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
                return Date;
            }
        }

        //=====================================================================================
        function IFISChange(ROW) {
            var Flag = false;
            if (isCheanged == true || document.getElementById(MasterObj + "LastValueOfCell9").value != ROW.cells(9).firstChild.value)
            //         if (ROW.cells(0).firstChild.value != ROW.cells(0).firstChild.TrueVal ||
            //             ROW.cells(2).firstChild.value != ROW.cells(2).firstChild.TrueVal ||
            //             ROW.cells(3).firstChild.value != ROW.cells(3).firstChild.TrueVal ||
            //             ROW.cells(4).firstChild.value != ROW.cells(4).firstChild.TrueVal ||
            //             ROW.cells(5).firstChild.value != ROW.cells(5).firstChild.TrueVal ||
            //             ROW.cells(6).firstChild.value != ROW.cells(6).firstChild.TrueVal ||
            //             ROW.cells(8).firstChild.value != ROW.cells(8).firstChild.TrueVal ||
            //             ROW.cells(9).firstChild.value != ROW.cells(9).firstChild.TrueVal
            //             )
                Flag = true;
            return Flag;
        }
        //--------------------------------------------------------
        function onfocusDes(obj) {//تغيير روي شرح را به اين ترتيب متوجه مي شوم    
            document.body.style.overflowX = "scroll";
            document.getElementById(MasterObj + "LastValueOfCell9").value = obj.value;
        }
        //#####################################################################################مربوط به گريد پيشنهادي
        function CreateGridOffers(XmlDoc, RowIndex) {

            var oXmlData = new ActiveXObject("Microsoft.XMLDOM")
            oXmlData.async = "false";
            oXmlData.loadXML(XmlDoc)

            var Grid = GridOffer;
            Grid.setAttribute("EntityIndex", RowIndex);
            var Date = "";
            while (Grid.rows.length > 0)
                Grid.deleteRow();
            var OXmlNodes = oXmlData.documentElement.selectNodes("/Root/pc");
            for (var i = 0; i < OXmlNodes.length; i++) {
                var ORow = Grid.insertRow();
                ORow.style.width = "200px";
                ORow.insertCell();
                ORow.insertCell();
                ORow.insertCell();
                if ((Grid.rows.length - 1) % 2 == 0)
                    ORow.className = "CssItemStyle";
                else
                    ORow.className = "CssAlternatingItemStyle";

                Date = OXmlNodes[i].selectSingleNode("DATE").text;
                ORow.cells(0).innerText = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4);
                ORow.cells(1).innerText = OXmlNodes[i].selectSingleNode("STime").text;
                ORow.cells(2).innerText = OXmlNodes[i].selectSingleNode("ETime").text;
                ORow.cells(0).style.width = "80px";
                ORow.cells(1).style.width = "50px";
                ORow.cells(2).style.width = "50px";
                ORow.cells(0).align = "center";
                ORow.cells(1).align = "center";
                ORow.cells(2).align = "center";
            }
            var Index = GridOffer.getAttribute("EntityIndex");
            DivPopup.style.display = "inline";
            Grid.focus();
            onclickRowOffer(Grid.rows(0))

        }
        //====================================
        function onclickClose() {
            DivPopup.style.display = "none";
        }
        //====================================
        function onclickRowOffer(Sign) {
            var obj;
            if (Sign != null)
                obj = Sign;
            else obj = window.event.srcElement.parentElement;
            obj.focus();
            obj.setActive();
            if (SelectRowOffer != null) {
                SelectRowOffer.className = SelectRowOfferClass;
            }
            SelectRowOffer = obj;
            SelectXtableOffer = SelectRowOffer.rowIndex;
            SelectRowOfferClass = obj.className;
            SelectRowOffer.className = "CssSelectedItemStyle";
        }
        //====================================
        function onkeydownRowOffer() {
            var Key = window.event.keyCode;
            var Len = GridOffer.rows.length;

            //              alert(Key)

            switch (Key) {
                case 38:
                    if (SelectXtableOffer > 0) {
                        onclickRowOffer(GridOffer.rows(SelectXtableOffer - 1));
                    }
                    break;
                case 40:
                    if (SelectXtableOffer < Len - 1) {
                        onclickRowOffer(GridOffer.rows(SelectXtableOffer + 1));
                    }
                    break;
                case 13:
                    ondblclickGridOffer(GridOffer.rows(SelectXtableOffer));
                    break;
                case 27:
                    onclickClose();
                    var Index = GridOffer.getAttribute("EntityIndex");
                    OGrdAdminCredit.rows(Index).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.focus()
                    OGrdAdminCredit.rows(Index).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.select()

                    break;
            }
        }
        //====================================
        function ondblclickGridOffer(Sign) {
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndex").value);


            var obj;
            if (Sign != null)
                obj = Sign;
            else obj = window.event.srcElement.parentElement;

            var Index = GridOffer.getAttribute("EntityIndex");

            OGrdAdminCredit.rows(Index).cells(5).firstChild.value = obj.cells(1).innerText;
            OGrdAdminCredit.rows(Index).cells(6).firstChild.value = obj.cells(2).innerText;
            OGrdAdminCredit.rows(Index).cells(3).firstChild.value = obj.cells(0).innerText;
            OGrdAdminCredit.rows(Index).cells(4).firstChild.value = obj.cells(0).innerText;
            onclickClose();
            if (document.getElementById(MasterObj + "cellIndex").value == "6") {
                OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 2).firstChild.focus()
                OGrdAdminCredit.rows(rowIndex).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 2).firstChild.setActive()
            }
            else {
                OGrdAdminCredit.rows(Index).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.focus()
                OGrdAdminCredit.rows(Index).cells(parseInt(document.getElementById(MasterObj + "cellIndex").value) + 1).firstChild.select()
            }
        }
        //##################################################################################################
        function onchangeControlPersonelNo(obj) {
            // isCheanged = true;
            var rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndex").value);
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            document.getElementById(MasterObj + "txtPersonIDDetailCredit").value = OGrdAdminCredit.rows(rowIndex).cells(0).firstChild.value
            OGrdAdminCredit.rows(rowIndex).Change = 1
            if (OGrdAdminCredit.rows(rowIndex).Change == 1) {

                if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value != "") {
                    document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
                    document.getElementById(MasterObj + "BtnSubmit2").click();

                }
            }
        }
        //##################################################################################################

        function OnChangeCmbGrdGroupCode(obj) {
            //        alert()
            var rowIndex = obj.parentElement.parentElement.rowIndex;
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            //فيلتر کمبوها گروه و نوع از روي هم -کپي از صفحه قبل وقوع
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";

            if (OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.value == "1") {
                document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10102"
            }
            if (OGrdAdminCredit.rows(rowIndex).cells(2).firstChild.value == "2") {
                document.getElementById(MasterObj + "txtMainCodeForEnterC").value = "10103"
            }

            //           alert($get(MasterObj + "txtXMLCmbCredite").value)
            xmlDoc.loadXML($get(MasterObj + "txtXMLCmbCredite").value);
            var xmlNodes;
            OGrdAdminCredit.rows(rowIndex).cells(8).innerHTML = '<select   style="width:160px"  class="TxtControls" onkeydown="checkEnter(this,0)" > </select>'

            var j = 0
            //                alert(obj.value)
            //           if (obj.value != 0 && obj.value != "") {
            if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value == "00:00" && OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value == "00:00") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + obj.value + " and Daily=1" + "]");
            }
            else if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value != "00:00" && OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value != "00:00") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + obj.value + " and Timely=1" + "]");
            }


            else if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value != "00:00" && OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value == "00:00") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + obj.value + " and Timely=1" + "]");
            }

            else if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value != "" && OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value == "00:00" && OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value != "00:00") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + obj.value + " and Timely=1" + "]");
            }

            else if (OGrdAdminCredit.rows(rowIndex).cells(3).firstChild.value == "" && OGrdAdminCredit.rows(rowIndex).cells(4).firstChild.value == "" && OGrdAdminCredit.rows(rowIndex).cells(5).firstChild.value == "00:00" && OGrdAdminCredit.rows(rowIndex).cells(6).firstChild.value == "00:00") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + obj.value + "]");
            }


            //            else {
            //     
            //                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
            //                //                     alert(xmlNodes.xml)
            //            }

            if (xmlNodes.length != 0) {
                if (obj.value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = 'انتخاب نشده';
                        OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = '0';
                        j++
                    }
                }

                for (var i = 0; i < xmlNodes.length; ++i) {
                    //             alert(xmlNodes.item(i).selectSingleNode('CodeName').text)
                    optionEl = document.createElement("OPTION")
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.options.add(optionEl)
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    OGrdAdminCredit.rows(rowIndex).cells(8).firstChild.all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++
                    //                 alert(j)
                }
            }
        }

        //##################################################################################################
        function onchangeMemberCode(obj) {

            var rowIndex = obj.parentElement.parentElement.rowIndex;
            var OGrdAdminCredit = document.getElementById("GrdAdminCredit");
            var strOptions = "", url = "";
            var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=1&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value + "&MenuItemID=" + $get(MasterObj + "txtPageID").value;
            strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            if (url != "") {
                var OSelectedMamber = ""
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                if (OSelectedMamber != undefined) {
                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(OSelectedMamber);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                    if (oXmlNodes.length > 0) {
                        var MemberID, MemberName;
                        for (var i = 0; i < oXmlNodes.length; i++) {

                            MemberID = oXmlNodes.item(i).selectSingleNode('PCode').text;
                            MemberName = oXmlNodes.item(i).selectSingleNode('PName').text;
                            OGrdAdminCredit.rows(rowIndex + i).cells(0).firstChild.value = MemberID
                            OGrdAdminCredit.rows(rowIndex + i).cells(1).innerText = MemberName
                            OGrdAdminCredit.rows(rowIndex + i).cells(2).firstChild.focus();
                            thisControl = "";

                        }
                    }
                }
            }
        }
     
