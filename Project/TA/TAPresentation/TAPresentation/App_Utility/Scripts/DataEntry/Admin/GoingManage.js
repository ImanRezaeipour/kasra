

var LastSelectedRow = null;
var LastSelectedRowClass = "";

var lastPersonCode = "";
var lastPersonCodeModify = "";
var rowIndex;

var isCheangedModavemat = false;
var thisControl = 0;
var OGrdGoingMange = document.getElementById("GrdGoingMange");
var txtYear
var txtMonth
var txtDay
var PersonBefor
$("document").ready(function () {
    //if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
        $('#DNewRow').draggable();
        $('#DNewRow').bind('dragstop', function (event, ui) {
            Top = ui.offset.top;
            Left = ui.offset.left;
        });
    //}
});
//======در صورت غیر فعال بودن آپشن کمبو نوع تردد
//$get(MasterObj + "txtOptionCmbAttendanceType").value = "0"
if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
    TBDNewRow.rows(1).cells(7).style.display = "none"
    GrdGoingMange_Header.rows(0).cells(8).style.display = "none"
}
//====================Paging========================
var PageSize = 10;
SetPagingInfo();
//==================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//=========================================================================================
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    if (document.getElementById(MasterObj + "txtSubmit").value == "DetailCredit" ||
    document.getElementById(MasterObj + "txtSubmit").value == "GetGoingFromOnePerson" ||
    document.getElementById(MasterObj + "txtSubmit").value == "PersonCodeGrdSearch")
        document.getElementById("ctl00_ProgressState").value = 1;

}
//=========================================================================================
function EndRequestHandler(sender, args) {

    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value)
        else {
            alert($get(MasterObj + "txtAlert").value);
        }
    }


    if (StrVal == "Filter" || StrVal == "First" || StrVal == "Next" || StrVal == "Last" || StrVal == "Previous" || StrVal == "Const") {
        if (StrVal == "Filter") {
            LastSelectedRow = null;
        }

        CreateGoingManageTable(0)
        SetPagingInfo();
        //==========در حالت ایجاد===============
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601")
            $("#TrFooter").css("display", "none");
    }
    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtSubmitNew").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtStatus").value = "";

    var rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndex").value);
    var GrdGoingMange = document.getElementById("GrdGoingMange");
    if (StrVal == "ModavematKari") {
        //اگر مداومتکاری داشتیم سطر مربوطه را در ایک ام ال بروز می کنم
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + parseInt(rowIndex + 1) + "]");
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11604" || document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11602") {
            if (document.getElementById(MasterObj + "txtInsertModavemat").value == "1")
                xmlNodes.item(0).selectSingleNode('ModavematKari').text = 0
            if (document.getElementById(MasterObj + "txtInsertModavemat").value == "0")
                xmlNodes.item(0).selectSingleNode('ModavematKari').text = 1
            document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml
            CreateGoingManageTable(0)
            LastSelectedRow = null;
        }
    }
    //=============================Delete
    if (StrVal == "Del") {
        //زمان حذف سطر حذف شونده از ایکس ام ال پاک و شماره سطرها از آن به بعد یکی به عقب شیفت پیدا می کند
        clearGrid(document.getElementById("GrdGoingMange"))
        if ($get(MasterObj + "txtValidate").value == 1) {
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value != "11603") {
                root = '/DataEntryEntity/GoingMange'
                rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndex").value) + 1
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                var xmlNodes = xmlDoc.documentElement.selectSingleNode(root + "[RowNumber=" + rowIndex + "]");
                xmlDoc.childNodes[0].removeChild(xmlNodes);
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber>" + rowIndex + "]");
                for (var i = 0; i < xmlNodes.length; ++i)
                    xmlNodes.item(i).selectSingleNode('RowNumber').text = (parseInt(xmlNodes.item(i).selectSingleNode('RowNumber').text) - 1)

                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[AttDate=" + document.getElementById(MasterObj + "txtAttDate").value + "][PersonelNo=" + document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value + "]");
                for (var i = 0; i < xmlNodes.length; ++i)
                    xmlNodes.item(i).selectSingleNode('inout').text = document.getElementById(MasterObj + "txtGoingInRow").value
                document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml
            }
            //==========================رفتن به صفحه ی اول به هنگام حذف یا صفحه جاری======================
            else if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
                if (document.getElementById(MasterObj + "txtXmlGoingManage").value == "" || document.getElementById(MasterObj + "txtXmlGoingManage").value == "<DataEntryEntity></DataEntryEntity>" || document.getElementById(MasterObj + "txtXmlGoingManage").value == "<DataEntryEntity/>") {
                    GetData('First')
                    $("#" + MasterObj + "txtSubmit").val('First');
                    $("#" + MasterObj + "BtnSubmit").click();
                }
                else {
                    GetData('Const')
                    $("#" + MasterObj + "txtSubmit").val('Const');
                    $("#" + MasterObj + "BtnSubmit").click();
                }
            }
        }

        CreateGoingManageTable(0)

    }

    //=============================Filter
    //    if (StrVal == "Filter") {
    //        CreateGoingManageTable(0)
    //        LastSelectedRow = null;
    //    }
    //=============================Save
    if (StrVal == "Save") {

        //======================بستن Popup مربوط به سطر جدید==========================
        onclickBtnCloseDiv()
        //==============================================================================
        root = '/DataEntryEntity/GoingMange'

        rowIndex = parseInt(document.getElementById(MasterObj + "txtRowIndexForNew").value) - 1

        //در صورت وجود کمبو نوع تردد
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
            var obj = GrdGoingMange.rows(parseInt(document.getElementById(MasterObj + "txtRowIndexForNew").value) - 1).cells(10).firstChild
        else
            var obj = GrdGoingMange.rows(parseInt(document.getElementById(MasterObj + "txtRowIndexForNew").value) - 1).cells(11).firstChild

        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        //        alert(document.getElementById(MasterObj + "txtXmlGoingManage").value)
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + document.getElementById(MasterObj + "txtRowIndexForNew").value + "]");
        //        alert(document.getElementById(MasterObj + "CmbFilteringGoingManage").value )
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11604") {
            //اگر در حالت ناقص است مقدار ذخیره شده را در ایکس ام ال بروز می کنم
            //ناقص
            //                    var cnt = getCntChar('--:--', document.getElementById(MasterObj + "txtGoingInRow").value)
            //                    if (cnt == 0) {

            //                        xmlDoc.childNodes[0].removeChild(xmlNodes.item(0));
            //                        xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber>" + document.getElementById(MasterObj + "txtRowIndexForNew").value + "]");
            //                        for (var i = 0; i < xmlNodes.length; ++i)
            //                            xmlNodes.item(i).selectSingleNode('RowNumber').text = (parseInt(xmlNodes.item(i).selectSingleNode('RowNumber').text) - 1)
            //                    
            //                        
            //                    }
            //                    else {
            if (document.getElementById(MasterObj + "txtInsertModavemat").value == "1")
                xmlNodes.item(0).selectSingleNode('ModavematKari').text = 0
            if (document.getElementById(MasterObj + "txtInsertModavemat").value == "0")
                xmlNodes.item(0).selectSingleNode('ModavematKari').text = 1
            xmlNodes.item(0).selectSingleNode('Type').text = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
            xmlNodes.item(0).selectSingleNode('TypeName').text = document.getElementById(MasterObj + "txtTypeName").value

            //در صورت وجود کمبو نوع تردد
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
                xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
            else {
                xmlNodes.item(0).selectSingleNode('AttendanceType').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
                xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(9).firstChild.value
            }
            xmlNodes.item(0).selectSingleNode('Time').text = GrdGoingMange.rows(rowIndex).cells(4).firstChild.value
            xmlNodes.item(0).selectSingleNode('inout').text = document.getElementById(MasterObj + "txtGoingInRow").value
            //                alert(10)
            //                    }
        }

        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601" || document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            //            alert(document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") 
            //اگر در حالت جدید یا تردد کاربری ثبت شده است همه موارد ناقص انجام می شود ولی شماره تردد همچنین ستون ترددها بروز می شود

            xmlNodes.item(0).selectSingleNode('PersonelNo').text = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
            xmlNodes.item(0).selectSingleNode('PersonelName').text = GrdGoingMange.rows(rowIndex).cells(2).innerText
            xmlNodes.item(0).selectSingleNode('Date').text = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value
            xmlNodes.item(0).selectSingleNode('Type').text = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
            xmlNodes.item(0).selectSingleNode('TypeName').text = document.getElementById(MasterObj + "txtTypeName").value

            //در صورت وجود کمبو نوع تردد
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
                xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
            else {
                xmlNodes.item(0).selectSingleNode('AttendanceType').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
                xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(9).firstChild.value
            }
            xmlNodes.item(0).selectSingleNode('Time').text = GrdGoingMange.rows(rowIndex).cells(4).firstChild.value
            xmlNodes.item(0).selectSingleNode('ISNew').text = "0"
            //            alert(GrdGoingMange.rows(rowIndex).cells(5).firstChild.value)
            if ($get(MasterObj + "txtValidate").value == "1") {
                xmlNodes.item(0).selectSingleNode('AttendanceID').text = document.getElementById(MasterObj + "txtAttendanceIDINRow").value
            }
            var str = ""
            var a = (GrdGoingMange.rows(rowIndex).cells(3).firstChild.value).split('/')
            str = str + a[0] + a[1] + a[2]
            xmlNodes.item(0).selectSingleNode('AttDate').text = str

            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[AttDate=" + str + "][PersonelNo=" + GrdGoingMange.rows(rowIndex).cells(1).firstChild.value + "]");

            for (var i = 0; i < xmlNodes.length; ++i) {
                xmlNodes.item(i).selectSingleNode('inout').text = document.getElementById(MasterObj + "txtGoingInRow").value
                //                       
            }

        }
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11602") {
            //در حالت کلیه تردها ستون مداومتکاری و ستون ترددها را بروز می کنم
            if ($get(MasterObj + "txtValidate").value == "1") {
                var str = ""
                var a = (GrdGoingMange.rows(rowIndex).cells(3).firstChild.value).split('/')
                str = str + a[0] + a[1] + a[2]
                xmlNodes.item(0).selectSingleNode('AttDate').text = str
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[AttDate=" + str + "][PersonelNo=" + GrdGoingMange.rows(rowIndex).cells(1).firstChild.value + "]");

                for (var i = 0; i < xmlNodes.length; ++i) {
                    xmlNodes.item(i).selectSingleNode('inout').text = document.getElementById(MasterObj + "txtGoingInRow").value
                    if (document.getElementById(MasterObj + "txtInsertModavemat").value == "1")
                        xmlNodes.item(i).selectSingleNode('ModavematKari').text = 0
                    if (document.getElementById(MasterObj + "txtInsertModavemat").value == "0")
                        xmlNodes.item(i).selectSingleNode('ModavematKari').text = 1
                }
            }
        }
        document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml


        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value != "11601") {
            CreateGoingManageTable(0)
            LastSelectedRow = null;

        }

        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601") {
            if ($get(MasterObj + "txtValidate").value == 1) {
                OnClickNewRow(obj)
            }
            else {
                CreateGoingManageTable(0)
                LastSelectedRow = null;
            }
        }

        if (GrdGoingMange.rows(rowIndex + 1) != null) {
            if (GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.disabled == false) {
                GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.focus();
                GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.select();
            }
            else {
                GrdGoingMange.rows(rowIndex + 1).cells(4).firstChild.focus();
                GrdGoingMange.rows(rowIndex + 1).cells(4).firstChild.select();
            }
        }
        else {
            if (GrdGoingMange.rows(rowIndex) != null) {
                if (GrdGoingMange.rows(rowIndex).cells(1).firstChild.disabled == false) {
                    GrdGoingMange.rows(rowIndex).cells(1).firstChild.focus();
                    GrdGoingMange.rows(rowIndex).cells(1).firstChild.select();
                }
                else {
                    GrdGoingMange.rows(rowIndex).cells(4).firstChild.focus();
                    GrdGoingMange.rows(rowIndex).cells(4).firstChild.select();
                }
            }
        }



    }
    //=============================GetGoingFromOnePerson
    if (StrVal == "GetGoingFromOnePerson") {
        var TextTaradod, TitleTaradod

        if (document.getElementById(MasterObj + "txtGoingInRow").value.length > 27) {
            TextTaradod = document.getElementById(MasterObj + "txtGoingInRow").value.substr(0, 27)
            TitleTaradod = document.getElementById(MasterObj + "txtGoingInRow").value
        }
        else {
            TextTaradod = document.getElementById(MasterObj + "txtGoingInRow").value
            TitleTaradod = ''
        }

        //در حالت اضافه کردن سطر به وسیله Popup
        if ($("#DNewRow").css("display") == "inline") {
            //آوردن ترددها پس از  اینتر تاریخ
            GrdNewRow.rows(0).cells(6).innerHTML = "<TD style='COLOR: blue; HEIGHT: 20px; TEXT-DECORATION: underline' ><SPAN onclick=OpenDialog(this) id=inout title='" + TitleTaradod + "' style='DISPLAY: inline-block; WIDTH: 250px; CURSOR: hand ;TEXT-DECORATION: underline'>" + TextTaradod + "</SPAN></TD>"
            OnClickGrd(GrdNewRow.rows(0), 1)
            GrdNewRow.rows(0).cells(4).firstChild.focus();
            GrdNewRow.rows(0).cells(4).firstChild.select();
        }
        else {
            GrdGoingMange.rows(rowIndex).cells(6).innerHTML = "<TD style='COLOR: blue; HEIGHT: 20px; TEXT-DECORATION: underline' ><SPAN onclick=OpenDialog(this) id=inout title='" + TitleTaradod + "' style='DISPLAY: inline-block; WIDTH: 250px; CURSOR: hand ;TEXT-DECORATION: underline'>" + TextTaradod + "</SPAN></TD>";
            //آوردن ترددها پس از  اینتر تاریخ
            OnClickGrd(GrdGoingMange.rows(rowIndex), 1)
            GrdGoingMange.rows(rowIndex).cells(4).firstChild.focus();
            GrdGoingMange.rows(rowIndex).cells(4).firstChild.select();
        }
        document.getElementById(MasterObj + "txtPersonGrdCode").value = ""
        document.getElementById(MasterObj + "txtDateDetailGoingManage").value = ""


    }
    //=============================Modify
    if (StrVal == "Modify") {
        //======================بستن Popup مربوط به سطر جدید==========================
        onclickBtnCloseDiv()
        //==============================================================================
        //پس از ذخیره ایکامال را بروز کن و کلیه ویژگی های آن را اپدیت کن ستون تردد این تاریخ و این فرد را نیز بروز کن
        document.getElementById(MasterObj + "txtOldDate").value = ""

        root = '/DataEntryEntity/GoingMange'
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + parseInt(rowIndex + 1) + "]");
        str = ""
        a = (document.getElementById(MasterObj + "txtOldDateDetailGoingManage").value).split('/')
        str = str + a[0] + a[1] + a[2]
        xmlNodes.item(0).selectSingleNode('AttDate').text = str
        xmlNodes.item(0).selectSingleNode('PersonelNo').text = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
        xmlNodes.item(0).selectSingleNode('PersonelName').text = GrdGoingMange.rows(rowIndex).cells(2).innerText
        xmlNodes.item(0).selectSingleNode('Time').text = GrdGoingMange.rows(rowIndex).cells(4).firstChild.value
        xmlNodes.item(0).selectSingleNode('Type').text = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
        xmlNodes.item(0).selectSingleNode('TypeName').text = document.getElementById(MasterObj + "txtTypeName").value
        xmlNodes.item(0).selectSingleNode('Date').text = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
            xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
        else {
            xmlNodes.item(0).selectSingleNode('AttendanceType').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
            xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(9).firstChild.value
        }


        if ($get(MasterObj + "txtValidate").value == "1") {

            xmlNodes.item(0).selectSingleNode('AttendanceID').text = document.getElementById(MasterObj + "txtAttendanceIDINRow").value
        }
        str = ""
        a = (document.getElementById(MasterObj + "txtOldDateDetailGoingManage").value).split('/')
        str = str + a[0] + a[1] + a[2]
        var PCode = document.getElementById(MasterObj + "txtOldPNO").value != "" ? document.getElementById(MasterObj + "txtOldPNO").value : document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value;

        xmlNodes = xmlDoc.documentElement.selectNodes(root + "[AttDate=" + str.trim() + " and PersonelNo=" + PCode.trim() + "]");

        for (var i = 0; i < xmlNodes.length; ++i) {
            xmlNodes.item(i).selectSingleNode('inout').text = document.getElementById(MasterObj + "txtOldGoingInRow").value
            //                    
        }

        document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml
        document.getElementById(MasterObj + "txtOldPNO").value = ""


        //==========================رفتن به صفحه ی اول به هنگام ذخیره یا صفحه جاری======================
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value != "11601") {
            if (document.getElementById(MasterObj + "txtXmlGoingManage").value == "" || document.getElementById(MasterObj + "txtXmlGoingManage").value == "<DataEntryEntity></DataEntryEntity>" || document.getElementById(MasterObj + "txtXmlGoingManage").value == "<DataEntryEntity/>") {

                GetData('First')
                $("#" + MasterObj + "txtSubmit").val('First');
                $("#" + MasterObj + "BtnSubmit").click();
            }
            else {
                GetData('Const')
                $("#" + MasterObj + "txtSubmit").val('Const');
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //=====================================================================================================
        CreateGoingManageTable(0)
        OnClickGrd(GrdGoingMange.rows(rowIndex), 0)
        if (GrdGoingMange.rows(rowIndex) != null) {
            if (GrdGoingMange.rows(rowIndex).cells(1).firstChild.disabled == false) {
                GrdGoingMange.rows(rowIndex).cells(1).firstChild.focus();
                GrdGoingMange.rows(rowIndex).cells(1).firstChild.select();
            }
            else {
                GrdGoingMange.rows(rowIndex).cells(4).firstChild.focus();
                GrdGoingMange.rows(rowIndex).cells(4).firstChild.select();
            }
        }

    }
    //=============================PersonCodeGrdSearch
    if (StrVal == "PersonCodeGrdSearch") {
        //اگر پرسنلی معتبر بود
        if (document.getElementById(MasterObj + "txtPersonGrdName").value != "") {

            if (document.getElementById(MasterObj + "txtPersonGrdName").value.length > 15) {
                //در حالت اضافه کردن سطر به وسیله Popup
                if ($("#DNewRow").css("display") == "inline") {
                    GrdNewRow.rows(0).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px' title='" + document.getElementById(MasterObj + "txtPersonGrdName").value + "'>" + document.getElementById(MasterObj + "txtPersonGrdName").value.substr(0, 13) + "..." + "</SPAN></TD>"
                }
                else
                    GrdGoingMange.rows(rowIndex).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px' title='" + document.getElementById(MasterObj + "txtPersonGrdName").value + "'>" + document.getElementById(MasterObj + "txtPersonGrdName").value.substr(0, 13) + "..." + "</SPAN></TD>";

            }
            else {
                //در حالت اضافه کردن سطر به وسیله Popup
                if ($("#DNewRow").css("display") == "inline") {
                    GrdNewRow.rows(0).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px' >" + document.getElementById(MasterObj + "txtPersonGrdName").value + "</SPAN></TD>"
                }
                else
                    GrdGoingMange.rows(rowIndex).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px' >" + document.getElementById(MasterObj + "txtPersonGrdName").value + "</SPAN></TD>"
            }

            //در حالت اضافه کردن سطر به وسیله Popup
            if ($("#DNewRow").css("display") == "inline") {
                GrdNewRow.rows(0).cells(3).firstChild.focus();
                GrdNewRow.rows(0).cells(3).firstChild.select();
            }
            else {
                GrdGoingMange.rows(rowIndex).cells(3).firstChild.focus();
                GrdGoingMange.rows(rowIndex).cells(3).firstChild.select();
            }

        }
        else {

            //در حالت اضافه کردن سطر به وسیله Popup
            if ($("#DNewRow").css("display") == "inline") {
                GrdNewRow.rows(0).cells(1).firstChild.value = ""
                GrdNewRow.rows(0).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px'></SPAN></TD>"
                GrdNewRow.rows(0).cells(1).firstChild.focus();
                GrdNewRow.rows(0).cells(1).firstChild.select();
            }
            else {
                GrdGoingMange.rows(rowIndex).cells(1).firstChild.value = ""
                GrdGoingMange.rows(rowIndex).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px'></SPAN></TD>"
                GrdGoingMange.rows(rowIndex).cells(1).firstChild.focus();
                GrdGoingMange.rows(rowIndex).cells(1).firstChild.select();
            }

        }
        document.getElementById(MasterObj + "txtPersonGrdCode").value = ""
        //در حالت اضافه کردن سطر به وسیله Popup
        if ($("#DNewRow").css("display") == "inline") {
            OnClickGrd(GrdNewRow.rows(0), 0)
        }
        else
            OnClickGrd(GrdGoingMange.rows(rowIndex), 0);
    }
}
//========================================onload==============================================         
CreateGoingManageTable(0)
//=============================================
if (OGrdGoingMange != null) {

    if (OGrdGoingMange.rows.length > 0)
        if (OGrdGoingMange.rows(0).cells(1).firstChild.disabled == false) {
            OGrdGoingMange.rows(0).cells(1).firstChild.select();
            OGrdGoingMange.rows(0).cells(1).firstChild.focus();
        }
}
//================================================
var SDate = $get(MasterObj + "KCalSDate_txtCalendar").value.substr(0, 10)
var EDate = $get(MasterObj + "KCalEDate_txtCalendar").value.substr(0, 10)

$get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(6, 4);
$get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(3, 2);
$get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(0, 2);


$get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(6, 4);
$get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(3, 2);
$get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(0, 2);

$get(MasterObj + "KCalSDate_txtCalendar").focus();

var WindowEvent;
var LastSelectedRowForPopup;
var gridRowIndex = null
var XTabTableRow = 0

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow, GetDetailGoingManage) {
    document.getElementById(MasterObj + "SDate").value = SelectedRow.cells(3).firstChild.value
    document.getElementById(MasterObj + "EDate").value = SelectedRow.cells(1).firstChild.value

    document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = SelectedRow.cells(1).firstChild.value
    document.getElementById(MasterObj + "txtDateDetailGoingManage").value = SelectedRow.cells(3).firstChild.value


    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;

    SelectedRow.className = "CssSelectedItemStyle";

    //در حالت بسته بودن پاپ آپ مربوط به ایجاد سطر
    if ($("#DNewRow").css("display") != "inline") {
        if (GetDetailGoingManage == "1") {
            document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";

            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";

    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/"
  + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value

    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/"
  + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

    $get(MasterObj + "txtGroupPerson").value = $get(MasterObj + "ddlGroupPerson").value



    if ($get(MasterObj + "txtKCalEDate").value < $get(MasterObj + "txtKCalSDate").value) {
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
        return;
    }

    if ($get(MasterObj + "KCalSDate_txtYear").value == '' || $get(MasterObj + "KCalSDate_txtMonth").value == "" || $get(MasterObj + "KCalSDate_txtDay").value == "" || $get(MasterObj + "KCalEDate_txtYear").value == "" || $get(MasterObj + "KCalEDate_txtMonth").value == "" || $get(MasterObj + "KCalEDate_txtDay").value == "") {

        alert("لطفا اطلاعات را تکميل نماييد")
    }

    else {
        ChangeFooter();
        if (document.getElementById(MasterObj + "txtRowIndex").value == "")
            document.getElementById(MasterObj + "txtRowIndex").value = "0";
        clearGrid(document.getElementById("GrdGoingMange"))
        GetData('First')
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";

        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//*********************************************************************************************
function ChangeFooter() {
    $("#TrFooter").css("display", "none");
    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603")
        $("#TblFooter").css("width", "1020px");
    else
        $("#TblFooter").css("width", "965px");
}
//**********************************************************************************************
function onChangeCmbFilteringGoingManage() {
    //اگر ایجاد است بلافاصله سطر جدید ایجاد کند
    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601") {
        OnClickBtnFilter()
    }
}
//**********************************************************************************************
function OnClickNewRow(obj) {
    //ساخت گرید جدید
    ////تردهای کاربری ثبت شده
    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
           // $('#DNewRow').draggable();
//        $('#DNewRow').bind('dragstop', function (event, ui) {
//            Top = ui.offset.top;
//            Left = ui.offset.left;
//        });
        $("#DNewRow").css("display", "inline");

    }
    rowIndex = obj.parentElement.parentElement.rowIndex;

    var grid = obj.parentElement.parentElement.parentElement
    document.getElementById(MasterObj + "txtRowIndexForNew").value = rowIndex + 1

    if (document.getElementById(MasterObj + "txtRowIndexForNew").value == "")
        document.getElementById(MasterObj + "txtRowIndexForNew").value = "0";

    CreateGoingManageTable(document.getElementById(MasterObj + "txtRowIndexForNew").value)
    //=================================

    var newRowIndex = 0;
    root = '/DataEntryEntity/GoingMange'
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var xmlNodes = "";
    xmlDoc.async = "false";
    //اگر در حالت تردهای کاربری ثبت شده بود
    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
        GrdNewRow.rows(newRowIndex).cells(1).firstChild.focus();
        GrdNewRow.rows(newRowIndex).cells(1).firstChild.select();
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlNewRow").value);
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        xmlNodes = xmlDoc.documentElement.selectNodes(root)
    }
    else {
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value);
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + parseInt(rowIndex + 2) + "]");
    }

    //در صورت پر بودن آیتمهای پیشفرض سطر جدید هم در گرید و هم در ایکس ام ال بروز می شود
    //            if (document.getElementById(MasterObj + "chkPerson").checked == true || document.getElementById(MasterObj + "chkDate").checked == true || document.getElementById(MasterObj + "chkTime").checked == true || document.getElementById(MasterObj + "chkTaradodKind").checked == true || document.getElementById(MasterObj + "chkDes").checked == true) {

    if (document.getElementById(MasterObj + "chkPerson").checked == true) {
        //                    GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.value = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
        //                    GrdGoingMange.rows(rowIndex + 1).cells(2).innerText = GrdGoingMange.rows(rowIndex).cells(2).innerText
        //اگر در حالت تردهای کاربری ثبت شده بود
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            GrdNewRow.rows(newRowIndex).cells(1).firstChild.value = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
            GrdNewRow.rows(newRowIndex).cells(2).innerText = GrdGoingMange.rows(rowIndex).cells(2).innerText
        }
        xmlNodes.item(0).selectSingleNode('PersonelNo').text = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
        xmlNodes.item(0).selectSingleNode('PersonelName').text = GrdGoingMange.rows(rowIndex).cells(2).innerText
    }
    if (document.getElementById(MasterObj + "chkDate").checked == true) {
        //اگر در حالت تردهای کاربری ثبت شده بود
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            GrdNewRow.rows(newRowIndex).cells(3).firstChild.value = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value
        }
        xmlNodes.item(0).selectSingleNode('Date').text = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value

    }
    if (document.getElementById(MasterObj + "chkTime").checked == true) {
        //اگر در حالت تردهای کاربری ثبت شده بود
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            GrdNewRow.rows(newRowIndex).cells(4).firstChild.value = GrdGoingMange.rows(rowIndex).cells(4).firstChild.value
        }
        xmlNodes.item(0).selectSingleNode('Time').text = GrdGoingMange.rows(rowIndex).cells(4).firstChild.value
    }
    if (document.getElementById(MasterObj + "chkTaradodKind").checked == true) {
        //اگر در حالت تردهای کاربری ثبت شده بود
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            GrdNewRow.rows(newRowIndex).cells(6).firstChild.validValue = GrdGoingMange.rows(rowIndex).cells(5).firstChild.validValue
            GrdNewRow.rows(newRowIndex).cells(6).innerText = GrdGoingMange.rows(rowIndex).cells(5).innerText
        }
        xmlNodes.item(0).selectSingleNode('Type').text = GrdGoingMange.rows(rowIndex).cells(5).firstChild.validValue
        xmlNodes.item(0).selectSingleNode('TypeName').text = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value

    }
    if (document.getElementById(MasterObj + "chkDes").checked == true) {
        //اگر در حالت تردهای کاربری ثبت شده بود
        if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
                GrdNewRow.rows(newRowIndex).cells(8).firstChild.value = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
            else
                GrdNewRow.rows(newRowIndex).cells(9).firstChild.value = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
        }
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
            xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(8).firstChild.value
        else
            xmlNodes.item(0).selectSingleNode('Des').text = GrdGoingMange.rows(rowIndex).cells(9).firstChild.value
    }
    //درست کردن استایل گریدDivاگر در حالت تردهای کاربری ثبت شده بود
    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
        GrdNewRow.rows(newRowIndex).cells(0).style.width = "17px"
        GrdNewRow.rows(newRowIndex).cells(1).style.width = "70px"
        GrdNewRow.rows(newRowIndex).cells(2).style.width = "108px"
        GrdNewRow.rows(newRowIndex).cells(3).firstChild.style.width = "90px"
        GrdNewRow.rows(newRowIndex).cells(4).firstChild.style.width = "78px"
        GrdNewRow.rows(newRowIndex).cells(5).style.width = "80px"
        GrdNewRow.rows(newRowIndex).cells(6).firstChild.style.width = "255px"
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            GrdNewRow.rows(newRowIndex).cells(9).style.display = "none"
            GrdNewRow.rows(newRowIndex).cells(10).style.display = "none"
        }
        else {
            GrdNewRow.rows(newRowIndex).cells(10).style.display = "none"
            GrdNewRow.rows(newRowIndex).cells(11).style.display = "none"
        }
    }
    //    //            }
    //    //            else {
    //    //                GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.value = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
    //    //                GrdGoingMange.rows(rowIndex + 1).cells(2).innerText = GrdGoingMange.rows(rowIndex).cells(2).innerText
    //    //                GrdGoingMange.rows(rowIndex + 1).cells(3).firstChild.value = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value
    //    //                GrdGoingMange.rows(rowIndex + 1).cells(6).innerText = GrdGoingMange.rows(rowIndex).cells(6).innerText
    //    //                xmlNodes.item(0).selectSingleNode('PersonelNo').text = GrdGoingMange.rows(rowIndex).cells(1).firstChild.value
    //    //                xmlNodes.item(0).selectSingleNode('PersonelName').text = GrdGoingMange.rows(rowIndex).cells(2).innerText
    //    //                xmlNodes.item(0).selectSingleNode('Date').text = GrdGoingMange.rows(rowIndex).cells(3).firstChild.value
    //    //                xmlNodes.item(0).selectSingleNode('inout').text = GrdGoingMange.rows(rowIndex).cells(6).innerText
    //    //            }
    //    //

    if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value != "11603") {
        document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml
        CreateGoingManageTable(0)
        if (GrdGoingMange.rows(rowIndex + 1) == null) {
            OnClickGrd(GrdGoingMange.rows(rowIndex), 0)

            GrdGoingMange.rows(rowIndex).cells(1).firstChild.focus()
            GrdGoingMange.rows(rowIndex).cells(1).firstChild.select()
        }
        else {
            OnClickGrd(GrdGoingMange.rows(rowIndex + 1), 0)
            GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.focus()
            GrdGoingMange.rows(rowIndex + 1).cells(1).firstChild.select()
        }
    }

}
//*******************************************************************************
function onchangeControl() {


}
//*******************************************************************************
function checkEnter(obj) {
    var SkipGetEnter = "0"
    var row = obj.parentElement.parentElement;

    if ((document.getElementById(MasterObj + "txtSkipGetEnter").value == "1") && (row.rowIndex > 1))
        SkipGetEnter = "1"
    WindowEvent = window.event.keyCode
    if (WindowEvent == 113) {
        if (obj.parentElement.cellIndex == 5) {

            obj.parentElement.parentElement.cells(5).firstChild.value = ""
            if (obj.parentElement.parentElement.cells(7).innerHTML != "") {
                obj.parentElement.parentElement.cells(7).firstChild.firstChild.focus()
                obj.parentElement.parentElement.cells(7).firstChild.firstChild.select()
                thisControl = 7
            }
            else {
                if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                    obj.parentElement.parentElement.cells(8).firstChild.select()
                }
                else
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                thisControl = 8
            }
        }
    }
    //پایین رفتن روی گرید
    if (WindowEvent == 38) {
        var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) - 1;
        if (rowIndex != -1) {
            if (obj.parentElement.cellIndex == 0) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 1) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(1).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(1).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 3) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 4) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 5) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.setActive();
                return
            }
            
            //در صورت وجود نداشتن کمبو نوع تردد
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                if (obj.parentElement.cellIndex == 8) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.select()
                    return
                }
            }
            else {
                if (obj.parentElement.cellIndex == 8) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                    return
                }
                if (obj.parentElement.cellIndex == 9) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                    return
                }
            }
        }
    }
    //بالا رفتن روی گرید
    if (WindowEvent == 40) {
        var rowIndex = parseInt(obj.parentElement.parentElement.rowIndex) + 1;
        if (obj.parentElement.parentElement.parentElement.rows(rowIndex) != null) {
            if (obj.parentElement.cellIndex == 0) {
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(0).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 1) {

                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(1).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(1).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 3) {

                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(3).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 4) {

                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(4).firstChild.select()
                return
            }
            if (obj.parentElement.cellIndex == 5) {

                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.focus()
                obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(5).firstChild.setActive();
                return
            }
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                if (obj.parentElement.cellIndex == 8) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.select()
                    return
                }
            }
            else {
                if (obj.parentElement.cellIndex == 8) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(8).firstChild.focus()
                    return
                }
                if (obj.parentElement.cellIndex == 9) {
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.focus()
                    obj.parentElement.parentElement.parentElement.rows(rowIndex).cells(9).firstChild.select()
                    return
                }
            }
        }
    }
    //اینتر روی سلولها
    if (WindowEvent == 13) {
        var row = obj.parentElement.parentElement
        if (obj.parentElement != null && obj.parentElement.cellIndex == 1) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkDate").checked == true)) {
                thisControl = 3
                checkEnter(obj.parentElement.parentElement.cells(3).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(3).firstChild.focus()
                obj.parentElement.parentElement.cells(3).firstChild.select()
                thisControl = 3
            }
        }
        else if (obj.parentElement.cellIndex == 3) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkTime").checked == true)) {
                thisControl = 4
                checkEnter(obj.parentElement.parentElement.cells(4).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(4).firstChild.focus()
                obj.parentElement.parentElement.cells(4).firstChild.select()
                thisControl = 4
            }
        }

        else if (obj.parentElement != null && obj.parentElement.cellIndex == 4) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkTaradodKind").checked == true)) {
                thisControl = 5
                checkEnter(obj.parentElement.parentElement.cells(5).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(5).firstChild.focus()
                obj.parentElement.parentElement.cells(5).firstChild.setActive();
                thisControl = 5
            }
        }
        else if (obj.parentElement != null && obj.parentElement.cellIndex == 5) {
            if (obj.parentElement.parentElement.cells(7).innerHTML != "") {

                obj.parentElement.parentElement.cells(7).firstChild.firstChild.focus()
                obj.parentElement.parentElement.cells(7).firstChild.firstChild.select()
                thisControl = 7
            }
            else {
                if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                    obj.parentElement.parentElement.cells(8).firstChild.select()
                }
                else
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                thisControl = 8
            }
        }
        else if (obj.parentElement != null &&  obj.parentElement.cellIndex == 7) {
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                obj.parentElement.parentElement.cells(8).firstChild.focus()
                obj.parentElement.parentElement.cells(8).firstChild.select()
            }
            else
                obj.parentElement.parentElement.cells(8).firstChild.focus()
            thisControl = 8
        }

        //در صورت نبودن کمبوی مربوط به نوع تردد
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            if (obj.parentElement != null && obj.parentElement.cellIndex == 8) {
                GoForSave(obj, 1);
                document.getElementById(MasterObj + "txtSubmit").value = document.getElementById(MasterObj + "txtSubmitNew").value
                document.getElementById(MasterObj + "txtSubmitNew").value = "";
                if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "") {
                    document.getElementById(MasterObj + "BtnSubmit").click();
                    
                }
            }

            if (obj.parentElement!=null && obj.parentElement.cellIndex == 8 && obj.parentElement.parentElement.cells(1).firstChild.disabled == false) {
                obj.parentElement.parentElement.cells(1).firstChild.select()
                obj.parentElement.parentElement.cells(1).firstChild.focus()
            }
        }
        else {
            if (obj.parentElement != null && obj.parentElement.cellIndex == 8) {
                obj.parentElement.parentElement.cells(9).firstChild.focus()
            }
            else if (obj.parentElement.cellIndex == 9) {
                GoForSave(obj, 1);
                document.getElementById(MasterObj + "txtSubmit").value = document.getElementById(MasterObj + "txtSubmitNew").value
                document.getElementById(MasterObj + "txtSubmitNew").value = "";
                if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                    document.getElementById(MasterObj + "BtnSubmit").click();
            }
            if (obj.parentElement.cellIndex == 9 && obj.parentElement.parentElement.cells(1).firstChild.disabled == false) {
                obj.parentElement.parentElement.cells(1).firstChild.select()
                obj.parentElement.parentElement.cells(1).firstChild.focus()
            }

        }
    }
}
//*********************************************************************************************
function checkEnterGrdNew(obj) {

    var SkipGetEnter = "0"
    var row = obj.parentElement.parentElement;

    if ((document.getElementById(MasterObj + "txtSkipGetEnter").value == "1") && (row.rowIndex > 1))
        SkipGetEnter = "1"
    WindowEvent = window.event.keyCode
    if (WindowEvent == 13) {
        var row = obj.parentElement.parentElement
        if (obj.parentElement.cellIndex == 1) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkDate").checked == true)) {
                thisControl = 3
                checkEnter(obj.parentElement.parentElement.cells(3).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(3).firstChild.focus()
                obj.parentElement.parentElement.cells(3).firstChild.select()
                thisControl = 3
            }
        }
        else if (obj.parentElement.cellIndex == 3) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkTime").checked == true)) {
                thisControl = 4
                checkEnterGrdNew(obj.parentElement.parentElement.cells(4).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(4).firstChild.focus()
                obj.parentElement.parentElement.cells(4).firstChild.select()
                thisControl = 4
            }
        }

        else if (obj.parentElement.cellIndex == 4) {
            if ((SkipGetEnter == "1") && (document.getElementById(MasterObj + "chkTaradodKind").checked == true)) {
                thisControl = 5
                checkEnterGrdNew(obj.parentElement.parentElement.cells(5).firstChild);
            }
            else {
                obj.parentElement.parentElement.cells(5).firstChild.focus()
                obj.parentElement.parentElement.cells(5).firstChild.setActive();
                thisControl = 5
            }
        }
        else if (obj.parentElement.cellIndex == 5) {
            if (obj.parentElement.parentElement.cells(7).innerHTML != "") {

                obj.parentElement.parentElement.cells(7).firstChild.firstChild.focus()
                obj.parentElement.parentElement.cells(7).firstChild.firstChild.select()
                thisControl = 7
            }
            else {
                //در صورت نبودن کمبوی مربوط به نوع تردد
                if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                    obj.parentElement.parentElement.cells(8).firstChild.select()
                }
                else
                    obj.parentElement.parentElement.cells(8).firstChild.focus()
                thisControl = 8
            }
        }
        else if (obj.parentElement.cellIndex == 7) {
            //در صورت نبودن کمبوی مربوط به نوع تردد
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                obj.parentElement.parentElement.cells(8).firstChild.focus()
                obj.parentElement.parentElement.cells(8).firstChild.select()
            }
            else
                obj.parentElement.parentElement.cells(8).firstChild.focus()
            thisControl = 8
        }
        //در صورت نبودن کمبوی مربوط به نوع تردد
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            if (obj.parentElement.cellIndex == 8) {
                GoForSave(obj, 1);
                document.getElementById(MasterObj + "txtSubmit").value = document.getElementById(MasterObj + "txtSubmitNew").value
                document.getElementById(MasterObj + "txtSubmitNew").value = "";
                if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                    document.getElementById(MasterObj + "BtnSubmit").click();
            }
            if (obj.parentElement.cellIndex == 8 && obj.parentElement.parentElement.cells(1).firstChild.disabled == false) {
                obj.parentElement.parentElement.cells(1).firstChild.select()
                obj.parentElement.parentElement.cells(1).firstChild.focus()
            }
        }
        else {
            if (obj.parentElement.cellIndex == 8) {
                obj.parentElement.parentElement.cells(9).firstChild.focus()
            }
            else if (obj.parentElement.cellIndex == 9) {
                GoForSave(obj, 1);
                document.getElementById(MasterObj + "txtSubmit").value = document.getElementById(MasterObj + "txtSubmitNew").value
                document.getElementById(MasterObj + "txtSubmitNew").value = "";
                if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                    document.getElementById(MasterObj + "BtnSubmit").click();
            }
            if (obj.parentElement.cellIndex == 9 && obj.parentElement.parentElement.cells(1).firstChild.disabled == false) {
                obj.parentElement.parentElement.cells(1).firstChild.select()
                obj.parentElement.parentElement.cells(1).firstChild.focus()
            }

        }
    }
}
//**********************************************************************************************
function GoForSave(obj, Sign) {
    Sign = Sign == null ? 0 : Sign;
    var row = obj.parentElement.parentElement

    var Desc
    //در صورت نبودن کمبوی مربوط به نوع تردد
    if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
        Desc = row.cells(8).firstChild.value
    else
        Desc = row.cells(9).firstChild.value

    
    if (isCheangedModavemat == true && row.cells(4).firstChild.value == "00:00") {
        //اگر فقط مداومتکاری زده شده است  سایرین بدون تغییر هستند
        isCheangedModavemat = false;
        document.getElementById(MasterObj + "txtRowIndex").value = obj.parentElement.parentElement.rowIndex;
        document.getElementById(MasterObj + "txtRowIndexForNew").value = "0"
        document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = obj.parentElement.parentElement.cells(1).firstChild.value
        document.getElementById(MasterObj + "txtSubmitNew").value = "ModavematKari";
        return;
    }
    if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {
        //اگر سطر جدید است
        if (Sign == 1) {
            if (row.cells(1).firstChild.value == "" || row.cells(3).firstChild.value == "" || row.cells(4).firstChild.value == "" || row.cells(4).firstChild.value == "00:00" || row.cells(5).firstChild.validValue == "") {
                alert("لطفا اطلاعات را تکميل نماييد")
                return;
            }
        }
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        root = '/DataEntryEntity/GoingMange'
        var rowNumber = parseInt(obj.parentElement.parentElement.rowIndex + 1)
        var xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + rowNumber + "]");
        
        if (xmlNodes.length > 0) {
            if (xmlNodes.item(0).selectSingleNode("Des").text != Desc || xmlNodes.item(0).selectSingleNode("Time").text != row.cells(4).firstChild.value || xmlNodes.item(0).selectSingleNode("Date").text != row.cells(3).firstChild.value || xmlNodes.item(0).selectSingleNode("PersonelNo").text != row.cells(1).firstChild.value || xmlNodes.item(0).selectSingleNode("TypeName").text != row.cells(5).firstChild.value) {

                if (row.cells(1).firstChild.value != "" && row.cells(3).firstChild.value != "" && (row.cells(4).firstChild.value != "" && row.cells(4).firstChild.value != "00:00") && row.cells(5).firstChild.validValue != "") {
                    //alert(row.cells(1).firstChild.value + "  , " + row.cells(3).firstChild.value + "  , " +row.cells(4).firstChild.value + "  , " + row.cells(4).firstChild.value +"  , "+  "00:00" + "  , " + row.cells(5).firstChild.validValue )


                    document.getElementById(MasterObj + "txtRowIndex").value = obj.parentElement.parentElement.rowIndex;
                    document.getElementById(MasterObj + "txtRowIndexForNew").value = parseInt(document.getElementById(MasterObj + "txtRowIndex").value) + 1
                    save(obj);
                    document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = obj.parentElement.parentElement.cells(1).firstChild.value
                    document.getElementById(MasterObj + "txtDateDetailGoingManage").value = obj.parentElement.parentElement.cells(3).firstChild.value
                    document.getElementById(MasterObj + "txtSubmitNew").value = "Save";

                }
                else {
                    if ((row.cells(4).firstChild.value != "" && row.cells(4).firstChild.value != "00:00")) {
                        alert("لطفا اطلاعات را تکميل نماييد")
                        return;
                    }
                }
            }
        }
    }
    else {
        //در حالت بسته بودن پاپ آپ مربوط به ایجاد سطر
        if ($("#DNewRow").css("display") != "inline") {
            //اگر باید ویرایش شود
            if (row.cells(1).firstChild.value == "" || row.cells(3).firstChild.value == "" || row.cells(4).firstChild.value == "" || row.cells(4).firstChild.value == "00:00") {
                alert("لطفا اطلاعات را تکميل نماييد")
                return;
            }
            root = '/DataEntryEntity/GoingMange'
            OnBlurGrdDate(row.cells(3).firstChild, 1);
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
            xmlDoc.setProperty("SelectionLanguage", "XPath")

            var xmlNodes = xmlDoc.documentElement.selectNodes(root + "[AttendanceID=" + row.getAttribute("AttendanceID") + "]");

            if (xmlNodes.length > 0) {
                if (xmlNodes.item(0).selectSingleNode("Des").text != Desc || xmlNodes.item(0).selectSingleNode("Time").text != row.cells(4).firstChild.value || xmlNodes.item(0).selectSingleNode("Date").text != row.cells(3).firstChild.value || xmlNodes.item(0).selectSingleNode("PersonelNo").text != row.cells(1).firstChild.value || xmlNodes.item(0).selectSingleNode("TypeName").text != row.cells(5).firstChild.value) {
                    //alert(row.getAttribute("AttendanceID"))
                    modify(obj);
                    document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = obj.parentElement.parentElement.cells(1).firstChild.value
                    document.getElementById(MasterObj + "txtDateDetailGoingManage").value = obj.parentElement.parentElement.cells(3).firstChild.value
                    document.getElementById(MasterObj + "txtOldDateDetailGoingManage").value = document.getElementById(MasterObj + "txtOldDate").value
                    document.getElementById(MasterObj + "txtRowIndexForNew").value = "0"
                    document.getElementById(MasterObj + "txtRowIndex").value = obj.parentElement.parentElement.rowIndex;
                    document.getElementById(MasterObj + "txtSubmitNew").value = "Modify";
                }

            }
            //                        }
        }
    }
}
//        }
//=================================================================================================
function OnBlurGrdPersonelNo(obj) {
    if (WindowEvent == 13) {
        document.getElementById(MasterObj + "txtRowIndex").value = obj.parentElement.parentElement.rowIndex;
        var row = obj.parentElement.parentElement
        if (obj.value == "") {
            row.cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px'></SPAN></TD>"
        }
        else {
            document.getElementById(MasterObj + "txtPersonGrdCode").value = obj.value;
            if (row.cells(7).firstChild != null)
                document.getElementById(MasterObj + "txtChkInRow").value = row.cells(7).firstChild.checked
            //baraye zamani ke ba personeli ghabli yeki ast , niazi nista samte server beravad...
            if (PersonBefor != obj.value) {
                $get(MasterObj + "txtSubmit").value = "PersonCodeGrdSearch";

                $get(MasterObj + "BtnSubmit").click();
            }
        }
    }
    PersonBefor = document.getElementById(MasterObj + "txtPersonGrdCode").value;
}
//**********************************************************************************************
function OnBlurGrdDate(obj, Sign) {
    Sign = Sign == null ? 0 : Sign;
    if ((WindowEvent == 13 && thisControl == 4) || Sign == 1) {
        var row = obj.parentElement.parentElement;
        if (obj.value == "") {
            row.cells(6).innerHTML = "<TD style='COLOR: blue; HEIGHT: 20px; TEXT-DECORATION: underline' ><SPAN onclick=OpenDialog(this) id=inout title='' style='DISPLAY: inline-block; WIDTH: 130px; CURSOR: hand ;TEXT-DECORATION: underline'></SPAN></TD>"

        }
        else {
            //مشابه تقویم
            var objKCalSdate = $get(MasterObj + "KCalSdate_txtYear").value + "/" + $get(MasterObj + "KCalSdate_txtMonth").value + "/" + $get(MasterObj + "KCalSdate_txtDay").value

            var Year = objKCalSdate.substr(0, 4)
            var Month = objKCalSdate.substr(5, 2)
            var Day = objKCalSdate.substr(8, 2)

            if (obj.value != "") {
                var Date = "";
                var s = obj.value.split('/');
                if (s.length > 3) {

                    obj.value = "";
                    return;
                }
                if (s[2] != null) {
                    var sal;
                    sal = s[2].split('  ');
                }
                if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {

                    obj.value = ""
                    return;
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
                obj.value = Date

                txtYear = obj.value.substr(6, 4)
                txtMonth = CorrectlyChekedForGoingManage(obj.value.substr(3, 2), "Month")
                txtDay = CorrectlyChekedForGoingManage(obj.value.substr(0, 2), "Day")

                obj.value = txtDay + "/" + txtMonth + "/" + txtYear


            }
            if (Sign == 0) {
                //اوردن ستون ترددها
                document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = row.cells(1).firstChild.value
                document.getElementById(MasterObj + "txtDateDetailGoingManage").value = row.cells(3).firstChild.value
                if (row.cells(7).firstChild != null)
                    document.getElementById(MasterObj + "txtChkInRow").value = row.cells(7).firstChild.checked

                document.getElementById(MasterObj + "txtRowIndex").value = obj.parentElement.parentElement.rowIndex;
                $get(MasterObj + "txtSubmit").value = "GetGoingFromOnePerson";

                $get(MasterObj + "BtnSubmit").click();
            }
            //                }
        }
    }
}
//**********************************************************************************************
function CorrectlyChekedForGoingManage(obj, str) {
    if (str == "Month")
        if (obj > 12)
            return 12
        else
            return obj
        if (str == "Day") {
            if (!F_LeapPersian(txtYear) && obj > 29
                && txtMonth == 12
                )//سال کبیسه
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
    //        function F_LeapPersian(year) {
    //            return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
    //        }
    //**********************************************************************************************
    function onblurType(obj) {

        if ((WindowEvent == 13 || WindowEvent == 113) && (thisControl == 7 || thisControl == 8)) {
            var row = obj.parentElement.parentElement;
            //اگر خالی بود کدها نمایش می دهیم
            if (obj.value == "")
                ShowCodes(obj)
            else {
                //فوکوس روی مداومتکاری
                if (row.cells(7).innerHTML != "") {
                    row.cells(7).firstChild.firstChild.focus()
                    row.cells(7).firstChild.firstChild.select()
                }
                else {
                    //فوکوس روی شرح

                    //======در صورت غیر فعال بودن آپشن کمبو نوع تردد
                    if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                        row.cells(8).firstChild.focus()
                        row.cells(8).firstChild.select()
                    }
                    else {
                        row.cells(9).firstChild.focus()
                        row.cells(9).firstChild.select()
                    }
                }
            }
        }
    }
    //**********************************************************************************************
    function OnClickDelRow(obj) {
        rowIndex = obj.parentElement.parentElement.rowIndex;
        if (obj.parentElement.parentElement.getAttribute("ISNew") == 1) {
            //زمان حذف اگر سطر جدید باشد ان سطر را از XML پاک و پس از ان شماره سطر را یکی یکی کم می کنم و مجدا گرید را می سازم
            rowIndex = parseInt(rowIndex) + 1

            clearGrid(document.getElementById("GrdGoingMange"))
            root = '/DataEntryEntity/GoingMange'
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGoingManage").value)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectSingleNode(root + "[RowNumber=" + rowIndex + "]");
            xmlDoc.childNodes[0].removeChild(xmlNodes);
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber>" + rowIndex + "]");
            for (var i = 0; i < xmlNodes.length; ++i)
                xmlNodes.item(i).selectSingleNode('RowNumber').text = (parseInt(xmlNodes.item(i).selectSingleNode('RowNumber').text) - 1)
            document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml
            CreateGoingManageTable(0)
        }
        else
            if (confirm('آيامطمئن هستيد؟')) {
                //حذف سمت بانک
                var row = obj.parentElement.parentElement
                document.getElementById(MasterObj + "txtPCode").value = row.cells(1).firstChild.value
                document.getElementById(MasterObj + "txtTime").value = row.cells(4).firstChild.value
                document.getElementById(MasterObj + "txtDateForSP").value = null
                document.getElementById(MasterObj + "txtAttendanceID").value = row.getAttribute("AttendanceID")
                document.getElementById(MasterObj + "txtInoutKind").value = null
                document.getElementById(MasterObj + "txtUntransfer").value = null
                document.getElementById(MasterObj + "txtDeleteID").value = "1"
                document.getElementById(MasterObj + "txtDesc").value = null

                document.getElementById(MasterObj + "txtRowIndex").value = rowIndex
                document.getElementById(MasterObj + "txtPersonIDDetailGoingManage").value = obj.parentElement.parentElement.cells(1).firstChild.value
                document.getElementById(MasterObj + "txtDateDetailGoingManage").value = obj.parentElement.parentElement.cells(3).firstChild.value
                var str = ""
                var a = (document.getElementById(MasterObj + "txtDateDetailGoingManage").value).split('/')
                str = str + a[0] + a[1] + a[2]
                document.getElementById(MasterObj + "txtAttDate").value = str
                document.getElementById(MasterObj + "txtSubmit").value = "Del";

                document.getElementById(MasterObj + "BtnSubmit").click();
            }
    }
    //**********************************************************************************************
    function modify(obj) {

        rowIndex = obj.parentElement.parentElement.rowIndex;
        var row = obj.parentElement.parentElement
        var Date = row.cells(3).firstChild.value;
        Date = Date.substr(8, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
        document.getElementById(MasterObj + "txtPCode").value = row.cells(1).firstChild.value
        document.getElementById(MasterObj + "txtTime").value = row.cells(4).firstChild.value
        document.getElementById(MasterObj + "txtDateForSP").value = Date
        document.getElementById(MasterObj + "txtAttendanceID").value = row.getAttribute("AttendanceID")
        document.getElementById(MasterObj + "txtInoutKind").value = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
        document.getElementById(MasterObj + "txtUntransfer").value = null
        document.getElementById(MasterObj + "txtDeleteID").value = "0"
        //======در صورت غیر فعال بودن آپشن کمبو نوع تردد
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            document.getElementById(MasterObj + "txtDesc").value = row.cells(8).firstChild.value
        }
        else {
            if (row.cells(8).firstChild.value != "0" && row.cells(8).firstChild.value !=0)
                document.getElementById(MasterObj + "txtDesc").value = row.cells(8).firstChild.value + "$" + row.cells(9).firstChild.value
            else
                document.getElementById(MasterObj + "txtDesc").value = row.cells(9).firstChild.value
        }
        if (document.getElementById(MasterObj + "txtOldDate").value == "")
            document.getElementById(MasterObj + "txtOldDate").value = row.cells(3).firstChild.value

        document.getElementById(MasterObj + "txtType").value = row.cells(5).firstChild.value
        document.getElementById(MasterObj + "txtTypeName").value = row.cells(5).firstChild.value

    }
    //**********************************************************************************************
    function save(obj) {
        var row = obj.parentElement.parentElement
        if (row.cells(1).firstChild.value == "" || row.cells(3).firstChild.value == "" || row.cells(4).firstChild.value == "" || row.cells(4).firstChild.value == "00:00") {
            alert("لطفا اطلاعات را تکميل نمايييد")
            return;
        }
        rowIndex = obj.parentElement.parentElement.rowIndex;
        var row = obj.parentElement.parentElement
        document.getElementById(MasterObj + "txtPCode").value = row.cells(1).firstChild.value
        document.getElementById(MasterObj + "txtTime").value = row.cells(4).firstChild.value
        var Date = row.cells(3).firstChild.value
        Date = Date.substr(8, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
        document.getElementById(MasterObj + "txtDateForSP").value = Date
        document.getElementById(MasterObj + "txtAttendanceID").value = null
        document.getElementById(MasterObj + "txtInoutKind").value = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
        document.getElementById(MasterObj + "txtUntransfer").value = null
        document.getElementById(MasterObj + "txtDeleteID").value = "0"
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
            document.getElementById(MasterObj + "txtDesc").value = row.cells(8).firstChild.value
        else {
            if (row.cells(8).firstChild.value != "0" && row.cells(8).firstChild.value != 0)
                document.getElementById(MasterObj + "txtDesc").value = row.cells(8).firstChild.value + "$" + row.cells(9).firstChild.value
            else
                document.getElementById(MasterObj + "txtDesc").value = row.cells(9).firstChild.value
        }
        document.getElementById(MasterObj + "txtType").value = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
        document.getElementById(MasterObj + "txtTypeName").value = GrdGoingMange.rows(rowIndex).cells(5).firstChild.value
    }
    //**********************************************************************************************
    function SaveOldPNO(obj) {
        //fromRaeisi
        document.getElementById(MasterObj + "txtOldPNO").value = obj.value;
        var lastRow = LastSelectedRow;

        if (obj.parentElement != null) {
            if (LastSelectedRow != obj.parentElement.parentElement && obj.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.cells(3).firstChild.value != "") {
                OnClickGrd(obj.parentElement.parentElement, 0);
                document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";

                if (lastRow != null && lastRow.innerHTML != "") {

                    GoForSave(lastRow.cells(1).firstChild);
                }
                //               
                if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                    document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
    }
    //**********************************************************************************************
    function SaveOldTime(obj) {
        //fromRaeisi
        var lastRow = LastSelectedRow;
        if (LastSelectedRow != obj.parentElement.parentElement && obj.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.cells(3).firstChild.value != "") {
            OnClickGrd(obj.parentElement.parentElement, 0);
            document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
            if (lastRow != null && lastRow.innerHTML != "") {
                GoForSave(lastRow.cells(4).firstChild);
            }

            if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //*******************************************************************************
    function SaveOldDate(obj) {
        document.getElementById(MasterObj + "txtOldDate").value = obj.value;
        //fromRaeisi
        var lastRow = LastSelectedRow;
        if (LastSelectedRow != obj.parentElement.parentElement && obj.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.cells(3).firstChild.value != "") {
            OnClickGrd(obj.parentElement.parentElement, 0);
            document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
            if (lastRow != null && lastRow.innerHTML != "") {
                GoForSave(lastRow.cells(3).firstChild);
            }
            if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //*******************************************************************************
    function CreateGoingManageTable(rowInsert) {
        var xmlNodes = ""
        if ($("#DNewRow").css("display") != "inline")
            clearGrid(document.getElementById("GrdGoingMange"))

        root = '/DataEntryEntity/GoingMange'
        var xmlStr = document.getElementById(MasterObj + "txtXmlGoingManage").value
        
        if (xmlStr == "")
            xmlStr = "<DataEntryEntity></DataEntryEntity>"
        var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
        xmlDoc.loadXML(xmlStr)

        xmlDoc.setProperty("SelectionLanguage", "XPath")
        //برای قرار دادن سطر جدید دروسط سطرها
        if (rowInsert != (0)) {
            //اگر در حالت ایجاد تردد بود
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601") {
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[RowNumber>" + rowInsert + "]");
                for (var i = 0; i < xmlNodes.length; ++i)
                    xmlNodes.item(i).selectSingleNode('RowNumber').text = (parseInt(xmlNodes.item(i).selectSingleNode('RowNumber').text) + 1)

                var oXml = new ActiveXObject("Microsoft.XMLDOM");
                oXml.async = "false";
                rowInsert = parseInt(rowInsert) + 1
                oXml.loadXML("<DataEntryEntity><GoingMange><icon>0</icon><AttendanceType>0</AttendanceType><ModavematKari>0</ModavematKari><Date /><Time>00:00</Time><ISNew>1</ISNew><PersonelNo /><PersonelName /><Type>0</Type><inout /><InOutColor /><DelRow /><NewRow /><RowNumber>" + rowInsert + "</RowNumber><AttDate></AttDate><Des></Des><TypeName>سيستم</TypeName><AttendanceID>0</AttendanceID></GoingMange></DataEntryEntity>");
                var XmlNode = oXml.documentElement.selectNodes(root);
                xmlDoc.childNodes[0].appendChild(XmlNode.item(0));
            }
            //اگر در حالت تردهای کاربری ثبت شده بود
            else if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
                xmlDoc.async = "false";
                xmlDoc.loadXML("<DataEntryEntity><GoingMange><icon>0</icon><AttendanceType>0</AttendanceType><ModavematKari>0</ModavematKari><Date /><Time>00:00</Time><ISNew>1</ISNew><PersonelNo /><PersonelName /><Type>0</Type><inout /><InOutColor /><DelRow /><NewRow /><RowNumber>1</RowNumber><AttDate></AttDate><Des></Des><TypeName>سيستم</TypeName><AttendanceID>0</AttendanceID></GoingMange></DataEntryEntity>");
                document.getElementById(MasterObj + "txtXmlNewRow").value = xmlDoc.xml
            }
        }
        newrowindex = 0
        //===================درحالتی که سطر در گرید ایجاد میشود نه پاپ آپ===============
        if ($("#DNewRow").css("display") != "inline")
            document.getElementById(MasterObj + "txtXmlGoingManage").value = xmlDoc.xml;

        var xmlNodes = xmlDoc.documentElement.selectNodes(root)
        var cnt = xmlNodes.length
        var R;

        //به ترتیب شماره سطر ردیف ایجاد می کند
        for (var i = 0; i < xmlNodes.length; ++i) {
            R = i + 1
            var xmlNodes1 = xmlDoc.documentElement.selectNodes(root + "[RowNumber=" + R + "]");
            if ((rowInsert != (0)) && ($("#DNewRow").css("display") == "inline"))
                AddRowGoingMange(GrdNewRow, xmlNodes1.item(0).selectSingleNode('AttendanceID').text, xmlNodes1.item(0).selectSingleNode('ISNew').text, xmlNodes1.item(0).selectSingleNode('icon').text, xmlNodes1.item(0).selectSingleNode('ModavematKari').text, xmlNodes1.item(0).selectSingleNode('PersonelNo').text, xmlNodes1.item(0).selectSingleNode('PersonelName').text, xmlNodes1.item(0).selectSingleNode('Date').text, xmlNodes1.item(0).selectSingleNode('Time').text, xmlNodes1.item(0).selectSingleNode('Type').text, xmlNodes1.item(0).selectSingleNode('inout').text, xmlNodes1.item(0).selectSingleNode('Des').text, xmlNodes1.item(0).selectSingleNode('TypeName').text, xmlNodes1.item(0).selectSingleNode('InOutColor').text, xmlNodes1.item(0).selectSingleNode('AttendanceType').text, 1)
            else
                AddRowGoingMange(GrdGoingMange, xmlNodes1.item(0).selectSingleNode('AttendanceID').text, xmlNodes1.item(0).selectSingleNode('ISNew').text, xmlNodes1.item(0).selectSingleNode('icon').text, xmlNodes1.item(0).selectSingleNode('ModavematKari').text, xmlNodes1.item(0).selectSingleNode('PersonelNo').text, xmlNodes1.item(0).selectSingleNode('PersonelName').text, xmlNodes1.item(0).selectSingleNode('Date').text, xmlNodes1.item(0).selectSingleNode('Time').text, xmlNodes1.item(0).selectSingleNode('Type').text, xmlNodes1.item(0).selectSingleNode('inout').text, xmlNodes1.item(0).selectSingleNode('Des').text, xmlNodes1.item(0).selectSingleNode('TypeName').text, xmlNodes1.item(0).selectSingleNode('InOutColor').text, xmlNodes1.item(0).selectSingleNode('AttendanceType').text, 0)
        }
    }
    //*******************************************************************************
    function AddRowGoingMange(oGrid, attrParam0, attrParam1, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, InOutColor, AttendanceType, GrdType) {
        //ساخت گرید
        var cell
        oGrid.insertRow()
        oGrid.rows(newrowindex).setAttribute("AttendanceID", attrParam0)

        oGrid.rows(newrowindex).setAttribute("ISNew", attrParam1)

        oGrid.rows(newrowindex).className = "CssItemStyle"
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        oGrid.rows(newrowindex).insertCell()
        var disabled = false;
        if (oGrid.rows(newrowindex).getAttribute("ISNew") == 1) {
            disabled = true
        }
        //اگر تردد در گردش دارد           
        if (param0 == "0")
            oGrid.rows(newrowindex).cells(0).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=icon  style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/Blank.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 20px; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px'  ></BUTTON></TD>"
        else
            oGrid.rows(newrowindex).cells(0).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=icon  style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/BD14793_.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 20px; CURSOR: hand; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px' onclick=OpenDialog(this) ></BUTTON></TD>"
        var NameP = "";
        if (param2.length > 10)
            NameP = param2.substr(0, 8) + "...";
        //نام و تایتل آن
        //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
        if (GrdType == 1)
            oGrid.rows(newrowindex).cells(1).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnterGrdNew(this) onclick=onclickForFocus(this) onblur=OnBlurGrdPersonelNo(this)  onfocus=SaveOldPNO(this) style='WIDTH: 70px' onchange=onchangeControl() name=PersonelNo value=" + (NameP != "" ? NameP : param2) + (NameP != "" ? "title=" + param2 : "") + " ></TD>";
        else
            oGrid.rows(newrowindex).cells(1).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnter(this) onclick=onclickForFocus(this) onblur=OnBlurGrdPersonelNo(this)  onfocus=SaveOldPNO(this) style='WIDTH: 70px' onchange=onchangeControl() name=PersonelNo value=" + (NameP != "" ? NameP : param2) + (NameP != "" ? "title=" + param2 : "") + " ></TD>";

        if (disabled == true) {
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(3).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnterGrdNew(this) onclick=onclickForFocus(this) onblur=datechk();OnBlurGrdDate(this)  style='WIDTH: 85px' onchange=onchangeControl(this) name=Date value=" + param4 + "></TD>"
            else
                oGrid.rows(newrowindex).cells(3).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnter(this) onclick=onclickForFocus(this) onblur=datechk();OnBlurGrdDate(this)  style='WIDTH: 85px' onchange=onchangeControl(this) name=Date value=" + param4 + "></TD>"
        }
        else {
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(3).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnterGrdNew(this) onclick=onclickForFocus(this) onblur=datechk();OnBlurGrdDate(this) onfocus=SaveOldDate(this)  style='WIDTH: 85px' onchange=onchangeControl(this) name=Date value=" + param4 + "></TD>"
            else
                oGrid.rows(newrowindex).cells(3).innerHTML = "<TD style='HEIGHT: 20px'><INPUT class='TxtControls' onkeydown=checkEnter(this) onclick=onclickForFocus(this) onblur=datechk();OnBlurGrdDate(this) onfocus=SaveOldDate(this)  style='WIDTH: 85px' onchange=onchangeControl(this) name=Date value=" + param4 + "></TD>";
        }
        oGrid.rows(newrowindex).cells(2).innerHTML = "<TD style='HEIGHT: 20px'><SPAN id=PersonelName style='DISPLAY: inline-block; WIDTH: 100px'>" + param3 + "</SPAN></TD>"

        //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
        if (GrdType == 1)
            oGrid.rows(newrowindex).cells(4).innerHTML = "<TD style='HEIGHT: 20px'><INPUT   class='TxtControls'  onclick=onclickForFocus(this) onkeydown=checkEnterGrdNew(this) onblur=Timechk(this) style='WIDTH: 70px' onfocus=SaveOldTime(this) onchange=onchangeControl(this)  name=Time value=" + param5 + "></TD>"
        else
            oGrid.rows(newrowindex).cells(4).innerHTML = "<TD style='HEIGHT: 20px'><INPUT   class='TxtControls'  onclick=onclickForFocus(this) onkeydown=checkEnter(this) onblur=Timechk(this) style='WIDTH: 70px' onfocus=SaveOldTime(this) onchange=onchangeControl(this)  name=Time value=" + param5 + "></TD>"

        //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
        if (GrdType == 1)
            oGrid.rows(newrowindex).cells(5).innerHTML = "<TD style='HEIGHT: 20px'><select   class='TxtControls'  onclick=onclickForFocuss(this)  onchange = 'onchangeType(this)' onkeydown=checkEnterGrdNew(this)  style='WIDTH:80px ' onchange=onchangeControl(this)  name=Type value=" + param9 + " validValue=" + param6 + ">" + document.getElementById(MasterObj + "cmbTypeAtendance").innerHTML + "</select></TD>"
        else
            oGrid.rows(newrowindex).cells(5).innerHTML = "<TD style='HEIGHT: 20px'><select   class='TxtControls'  onclick=onclickForFocuss(this)  onchange = 'onchangeType(this)' onkeydown=checkEnter(this)  style='WIDTH:80px ' onchange=onchangeControl(this)  name=Type value=" + param9 + " validValue=" + param6 + ">" + document.getElementById(MasterObj + "cmbTypeAtendance").innerHTML + "</select></TD>"
        //    
        oGrid.rows(newrowindex).cells(5).firstChild.value = param6

        var TextTaradod, TitleTaradod
        if (param7.length > 27) {
            TextTaradod = InOutColor //param7.substr(0, 27)
            TitleTaradod = param7
        }
        else {
            TextTaradod = InOutColor
            TitleTaradod = param7
        }
        //ستوم ترددها و تایتل آن
        oGrid.rows(newrowindex).cells(6).innerHTML = "<TD  style='COLOR: blue; HEIGHT: 20px; TEXT-DECORATION: underline' ><SPAN  class='TxtControls'  onclick=OpenDialog(this) id=inout title='" + TitleTaradod + "' style='DISPLAY: inline-block; WIDTH: 250px; CURSOR: hand ;TEXT-DECORATION: underline'>" + TextTaradod + "</SPAN></TD>"
        //مداومتکاری
        if (param1 == "0") {
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(7).innerHTML = "<SPAN onkeydown=checkEnterGrdNew(this)><INPUT  class='TxtControls' id=ModavematKari; type=checkbox   value=" + param1 + " onclick='onClickModavemat(this)'></SPAN>"
            else
                oGrid.rows(newrowindex).cells(7).innerHTML = "<SPAN onkeydown=checkEnter(this)><INPUT  class='TxtControls' id=ModavematKari; type=checkbox   value=" + param1 + " onclick='onClickModavemat(this)'></SPAN>"
        }
        else {
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(7).innerHTML = "<SPAN onkeydown=checkEnterGrdNew(this)><INPUT class='TxtControls'  id=ModavematKari; type=checkbox   value=" + param1 + " onclick='onClickModavemat(this)' checked></SPAN>"
            else
                oGrid.rows(newrowindex).cells(7).innerHTML = "<SPAN onkeydown=checkEnter(this)><INPUT class='TxtControls'  id=ModavematKari; type=checkbox   value=" + param1 + " onclick='onClickModavemat(this)' checked></SPAN>";
        }


        //============درحالتی که کمبو مربوط به نوع تردد وجود نداشته باشد
        if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(8).innerHTML = "<TD style='HEIGHT: 20px'><INPUT  class='TxtControls'   onfocus='onfocusDesc(this)'  onclick=onclickForFocus(this) onkeydown=checkEnterGrdNew(this)    style='WIDTH: 100px'   value=" + param8 + "></TD>"
            else
                oGrid.rows(newrowindex).cells(8).innerHTML = "<TD style='HEIGHT: 20px'><INPUT  class='TxtControls'   onfocus='onfocusDesc(this)'  onclick=onclickForFocus(this) onkeydown=checkEnter(this)    style='WIDTH: 100px'   value=" + param8 + "></TD>"

            oGrid.rows(newrowindex).cells(9).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=DelRow title=حذف style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/deleteallink.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 32px; CURSOR: hand; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px'  onclick=OnClickDelRow(this) ></BUTTON></TD>"
            oGrid.rows(newrowindex).cells(10).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=NewRow title=ايجاد style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/NewIcon.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 31px; CURSOR: hand; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px' onclick=OnClickNewRow(this) ></BUTTON></TD>"

            document.getElementById("thNew").style.display = "inline"
            document.getElementById("thMod").style.display = "inline"
            document.getElementById("thِDel").style.display = "inline"
            //ترددها کاربری ثبت شده-مداومت ندارد
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
                document.getElementById("thMod").style.display = "none"
                oGrid.rows(newrowindex).cells(7).innerHTML = ""
            }
            //جدید و مداومت ندارد
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601") {
                //جديد
                document.getElementById("thNew").style.display = "none"
                document.getElementById("thMod").style.display = "none"
                oGrid.rows(newrowindex).cells(7).innerHTML = ""
                oGrid.rows(newrowindex).cells(10).style.display = "none"
                //اگر سطر جدید است دکمه حذف غیر فعال است
                if (attrParam0 == 0) {
                    oGrid.rows(newrowindex).cells(9).firstChild.disabled = true;
                }
            }
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11604" || document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11602") {
                //ناقص- کليه ترددها
                //مداومت دارد ولی حذف و ایجاد ندارد
                document.getElementById("thNew").style.display = "none"
                document.getElementById("thِDel").style.display = "none"
                oGrid.rows(newrowindex).cells(10).style.display = "none"
                oGrid.rows(newrowindex).cells(9).style.display = "none"
                oGrid.rows(newrowindex).cells(1).firstChild.disabled = true;
                oGrid.rows(newrowindex).cells(3).firstChild.disabled = true;
            }
        }
        else if ($get(MasterObj + "txtOptionCmbAttendanceType").value == "1") {

            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(8).innerHTML = "<TD style='HEIGHT: 20px'><select   class='TxtControls'  onclick=onclickForFocuss(this)   onkeydown=checkEnterGrdNew(this)  style='WIDTH:120px ' onchange=onchangeControl(this)  name=Type value=" + AttendanceType + " validValue=" + AttendanceType + ">" + document.getElementById(MasterObj + "cmbRequestAttendancetype").innerHTML + "</select></TD>"
            else
                oGrid.rows(newrowindex).cells(8).innerHTML = "<TD style='HEIGHT: 20px'><select   class='TxtControls'  onclick=onclickForFocuss(this)   onkeydown=checkEnter(this)  style='WIDTH:120px ' onchange=onchangeControl(this)  name=Type value=" + AttendanceType + " validValue=" + AttendanceType + ">" + document.getElementById(MasterObj + "cmbRequestAttendancetype").innerHTML + "</select></TD>"
            oGrid.rows(newrowindex).cells(8).firstChild.value = AttendanceType
            //============در حالت اینتر برروی گرید ایجاد سطر جدیدPopup
            if (GrdType == 1)
                oGrid.rows(newrowindex).cells(9).innerHTML = "<TD style='HEIGHT: 20px'><INPUT  class='TxtControls'   onfocus='onfocusDesc(this)'  onclick=onclickForFocus(this) onkeydown=checkEnterGrdNew(this)    style='WIDTH: 100px'   value=" + param8 + "></TD>"
            else
                oGrid.rows(newrowindex).cells(9).innerHTML = "<TD style='HEIGHT: 20px'><INPUT  class='TxtControls'   onfocus='onfocusDesc(this)'  onclick=onclickForFocus(this) onkeydown=checkEnter(this)    style='WIDTH: 100px'   value=" + param8 + "></TD>"

            oGrid.rows(newrowindex).cells(10).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=DelRow title=حذف style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/deleteallink.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 32px; CURSOR: hand; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px'  onclick=OnClickDelRow(this) ></BUTTON></TD>"
            oGrid.rows(newrowindex).cells(11).innerHTML = "<TD style='HEIGHT: 20px'><BUTTON id=NewRow title=ايجاد style='BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: center 50%; BORDER-LEFT-WIDTH: 0px; BACKGROUND-IMAGE: url(../../../App_Utility/Images/Icons/NewIcon.gif); BORDER-BOTTOM-WIDTH: 0px; WIDTH: 31px; CURSOR: hand; BACKGROUND-REPEAT: no-repeat; BACKGROUND-COLOR: transparent; BORDER-RIGHT-WIDTH: 0px' onclick=OnClickNewRow(this) ></BUTTON></TD>"

            document.getElementById("thNew").style.display = "inline"
            document.getElementById("thMod").style.display = "inline"
            document.getElementById("thِDel").style.display = "inline"
            //ترددها کاربری ثبت شده-مداومت ندارد
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11603") {
                document.getElementById("thMod").style.display = "none"
                oGrid.rows(newrowindex).cells(7).innerHTML = ""
            }
            //جدید و مداومت ندارد
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11601") {
                //جديد
                document.getElementById("thNew").style.display = "none"
                document.getElementById("thMod").style.display = "none"
                oGrid.rows(newrowindex).cells(7).innerHTML = ""
                oGrid.rows(newrowindex).cells(11).style.display = "none"
                //اگر سطر جدید است دکمه حذف غیر فعال است
                if (attrParam0 == 0) {
                    oGrid.rows(newrowindex).cells(10).firstChild.disabled = true;
                }
            }
            if (document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11604" || document.getElementById(MasterObj + "CmbFilteringGoingManage").value == "11602") {
                //ناقص- کليه ترددها
                //مداومت دارد ولی حذف و ایجاد ندارد
                document.getElementById("thNew").style.display = "none"
                document.getElementById("thِDel").style.display = "none"
                oGrid.rows(newrowindex).cells(11).style.display = "none"
                oGrid.rows(newrowindex).cells(10).style.display = "none"
                oGrid.rows(newrowindex).cells(1).firstChild.disabled = true;
                oGrid.rows(newrowindex).cells(3).firstChild.disabled = true;
            }

        }
        newrowindex = newrowindex + 1
    }
    //**********************************************************************************
    function onfocusDesc(obj) {
        //fromRaeisi
        var lastRow = LastSelectedRow;

        if (LastSelectedRow != obj.parentElement.parentElement && obj.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.cells(3).firstChild.value != "") {
            OnClickGrd(obj.parentElement.parentElement, 0);
            document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
            if (lastRow != null && lastRow.innerHTML != "") {
                if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1")
                    GoForSave(lastRow.cells(8).firstChild);
                else
                    GoForSave(lastRow.cells(9).firstChild);
            }
            if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")
                document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //******************************************************************************
    function onchangeType(obj) {
        //fromRaeisi
        var lastRow = LastSelectedRow;
        //    alert()
        //    var lastRow = obj.parentElement.parentElement;
        if (LastSelectedRow != obj.parentElement.parentElement && obj.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.cells(3).firstChild.value != "") {

            OnClickGrd(obj.parentElement.parentElement, 0);
            document.getElementById(MasterObj + "txtSubmit").value = "DetailCredit";
            if (lastRow != null && lastRow.innerHTML != "") {
                GoForSave(lastRow.cells(5).firstChild);
            }

            if (document.getElementById(MasterObj + "txtSubmit").value != "" || document.getElementById(MasterObj + "txtSubmitNew").value != "")

                document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }

    //*******************************************************************************
    function onclickForFocus(obj) {
        obj.select();
    }
    //*******************************************************************************
    function onclickForFocuss(obj) {
        obj.focus();
        //    alert(10)
    }

    //*******************************************************************************
    function onClickModavemat(obj) {
        if (obj.parentElement.parentElement.parentElement != LastSelectedRow && obj.parentElement.parentElement.parentElement.cells(1).firstChild.value != "" && obj.parentElement.parentElement.parentElement.cells(3).firstChild.value != "") {
            OnClickGrd(obj.parentElement.parentElement.parentElement, 0);
        }
        //زمان بایند Value با مقدارهای از بانک آمده پر می شود و این الان تیک خورده یا برداشته شده تصمیم گیری بری ذخیره یا حذف مداومت گرفته می شود   
        if ((obj.value == 0 && obj.checked == false) || (obj.value == 1 && obj.checked == true)) {
            obj.className = "";

            isCheangedModavemat = false;
            document.getElementById(MasterObj + "txtInsertModavemat").value = ""
        }
        if (obj.value == false && obj.checked == true) {
            obj.className = "cssInsertSelectChk";

            isCheangedModavemat = true;
            document.getElementById(MasterObj + "txtInsertModavemat").value = "0"
        }
        if (obj.value == true && obj.checked == false) {
            obj.className = "cssDeleteSelectChk";

            isCheangedModavemat = true;
            document.getElementById(MasterObj + "txtInsertModavemat").value = "1"
        }
        var row = obj.parentElement.parentElement.parentElement
        var Date = row.cells(3).firstChild.value
        Date = Date.substr(8, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)

        document.getElementById(MasterObj + "txtDateOfModavemat").value = Date

    }
    //*******************************************************************************
    function OpenDialog(obj) {
        //لینک ترددها           
        if (obj.parentElement.cellIndex == 6) {
            var row = obj.parentElement.parentElement
            if (row.cells(3).firstChild.value == "" || row.cells(1).firstChild.value == "") {
                alert("لطفا اطلاعات را تکمیل نمایید")
                return;
            }
            var url = "GoingManageNew.aspx?OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Date=" + row.cells(3).firstChild.value + "&PersonCode=" + row.cells(1).firstChild.value + "&Name=" + row.cells(2).innerText + "&State=Admin"
            var feture = "dialogHeight: 600px;dialogWidth: 900px;center: Yes;help: no;status:no"
            window.showModalDialog(encodeURI(url), window, feture)
        }
        //باز کردن صفحه ای که نمایش دهنده تردد در حال گردش برای این تاریخ است
        if (obj.parentElement.cellIndex == 0) {
            var row = obj.parentElement.parentElement
            Date = row.cells(3).firstChild.value;

            Date = Date.substr(6, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2)
            var url = "GoingManageNewWithStatus201.aspx?OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + Date + "&PersonCode=" + row.cells(1).firstChild.value
            var feture = "dialogHeight: 400px;dialogWidth: 400px;center: Yes;help: no;status:no"

            window.showModalDialog(encodeURI(url), window, feture)
        }
    }
    //*******************************************************************************
    function onClickTable() {
        if (window.event.srcElement.parentElement.cellIndex == 2) {
            OnClickGrd(window.event.srcElement.parentElement.parentElement, 1)
        }
    }
    //*******************************************************************************
    function clearGrid(obj) {
        try {
            j = obj.rows.length - 1
            for (; j >= 0; --j) {
                obj.deleteRow(j)
            }
            newrowindex = 0
            newrowidxMember = 0
        }
        catch (e) {
            alert('اطلاعات نادرست است')
            //alert(e.message)
        }
    }
    //*******************************************************************************
    function onkeypressDate(obj) {
        //وارد کردن فقط اعداد روی تاریخ
        var key = window.event.keyCode

        window.event.returnValue =
(
	((key >= 96) && (key <= 105)) ||
	((key >= 48) && (key <= 57)) ||
	(key == 8) || (key == 9) || (key == 46) || (key == 191) || (key == 47) ||
	((key >= 35) && (key <= 40))
)
    }
    //*********************************FromSarband*************************************************************
    function onclickGrd() {
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
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.value = SelectedRow.cells(1).innerText
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.validValue = SelectedRow.cells(0).innerText

    }
    //=================================
    function ShowCodes(obj) {
        var oRow = obj.parentElement.parentElement
        gridRowIndex = oRow.rowIndex
        Cleargrd(XTabTable)


        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlComboGrid').value)

        oXmlDoc.setProperty("SelectionLanguage", "XPath");

        if (obj.value == "")
            var XmlNodes = oXmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");



        if (XmlNodes.length != 0) {
            for (var i = 0; i < XmlNodes.length; ++i) {
                var oRowX = XTabTable.insertRow()
                var oCell1 = oRowX.insertCell()
                var oCell2 = oRowX.insertCell()


                oCell1.innerText = XmlNodes.item(i).selectSingleNode('Val').text
                oCell2.innerText = XmlNodes.item(i).selectSingleNode('Title').text

                oRowX.align = "center"
                oRowX.style.height = "25px"

                oCell1.style.display = "none"
                oCell2.style.width = "75px"

            }
        }
        var Y = 217
        var X = 910

        divCodePopup.style.display = "inline"
        divCodePopup.style.position = "absolute"
        var NewObj = obj;
        var posX = NewObj.offsetLeft; var posY = NewObj.offsetTop;

        while (NewObj.offsetParent) {
            posX = posX + NewObj.offsetParent.offsetLeft;
            posY = posY + NewObj.offsetParent.offsetTop;
            if (NewObj == document.getElementsByTagName('body')[0]) { break }
            else { NewObj = NewObj.offsetParent; }
        }

        divCodePopup.style.top = posY + 20;
        divCodePopup.style.left = posX - 5;
        XTabTable.focus()
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

            if (OGrdGoingMange.rows(gridRowIndex).cells(7).innerHTML != "") {

                OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.focus()
                OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.select()
            }
            else {
                if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                    OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.focus()
                    OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.select()
                }
                else
                    OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.focus()
            }

        }
    }
    //=================================
    function XTabTableDblClick(obj) {
        var oRow = event.srcElement.parentElement
        OGrdGoingMange = document.getElementById("GrdGoingMange");
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.value = oRow.cells(1).innerText
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.validValue = oRow.cells(0).innerText

        divCodePopup.style.display = "none"
        divCodePopup.style.position = ""
        divCodePopup.style.top = ""
        divCodePopup.style.right = ""
        XTabTableRow = 0
        if (OGrdGoingMange.rows(gridRowIndex).cells(7).innerHTML != "") {
            OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.focus()
            OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.select()
        }
        else {
            if ($get(MasterObj + "txtOptionCmbAttendanceType").value != "1") {
                OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.focus()
                OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.select()
            }
            else
                OGrdGoingMange.rows(gridRowIndex).cells(8).firstChild.focus()
        }
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
        OGrdGoingMange = document.getElementById("GrdGoingMange");
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.value = SelectedRow.cells(1).innerText
        OGrdGoingMange.rows(gridRowIndex).cells(5).firstChild.validValue = SelectedRow.cells(0).innerText
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
        divCodePopup.style.position = ""
        divCodePopup.style.top = ""
        divCodePopup.style.right = ""
        XTabTableRow = 0
        OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.select();
        OGrdGoingMange.rows(gridRowIndex).cells(7).firstChild.firstChild.select();

    }
    //====================================================Set Paging For Grid==========================
    function GetData(direction) {
        switch (direction) {
            case "First": $("#" + MasterObj + "txtPageNumber").val(1); break;
            case "Next": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) + 1); break;
            case "Previous": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val()) - 1); break;
            case "Last": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#TotalPage").text())); break;
            case "Const": $("#" + MasterObj + "txtPageNumber").val(parseInt($("#txtCurPage").val())); break;
        }
    }
    //*********************************Paging******************************************
    function OnBlurtxtCurPage() {
        $("#txtCurPage").val($("#txtCurPage").val().replace(" ", ""));
        var TotalPage = parseInt($("#TotalPage").text());
        if ($("#txtCurPage").val() != "" && $("#txtCurPage").val() != "0") {
            if (parseInt($("#txtCurPage").val()) > parseInt(TotalPage)) {
                $("#txtCurPage").val(TotalPage);
            }
            GetData('Const')
            $("#" + MasterObj + "txtSubmit").val('Const');
            $("#" + MasterObj + "BtnSubmit").click();
        }
        else {
            $("#txtCurPage").val("1");
            GetData('Const');
            $("#" + MasterObj + "txtSubmit").val('Const');
            $("#" + MasterObj + "BtnSubmit").click();
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnNext() {
        if (parseInt($("#txtCurPage").val()) < parseInt($("#TotalPage").text())) {
            GetData('Next')
            $("#" + MasterObj + "txtSubmit").val('Next');
            $("#" + MasterObj + "BtnSubmit").click();
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnLast() {
        GetData('Last')
        $("#" + MasterObj + "txtSubmit").val('Last');
        $("#" + MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnPrv() {
        if (parseInt($("#txtCurPage").val()) > 1) {
            GetData('Previous')
            $("#" + MasterObj + "txtSubmit").val('Last');
            $("#" + MasterObj + "BtnSubmit").click();
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnFirst() {
        GetData('First')
        $("#" + MasterObj + "txtSubmit").val('First');
        $("#" + MasterObj + "BtnSubmit").click();
    }
    //*********************************************************************************
    function SetPagingInfo() {

        if ($("#" + MasterObj + "txtTotalPage").val() == "")
            $("#" + MasterObj + "txtTotalPage").val("0")

        $("#txtCurPage").val($("#" + MasterObj + "txtPageNumber").val());

        $("#TotalPage").text(Math.ceil(parseInt($("#" + MasterObj + "txtTotalPage").val()) / parseInt(PageSize)));

        $("#txtFrom").text(((parseInt($("#txtCurPage").val()) - 1) * PageSize) + 1);

        $("#txtTo").text((($("#txtCurPage").val() - 1) * PageSize) + PageSize > $("#" + MasterObj + "txtTotalPage").val() ? $("#" + MasterObj + "txtTotalPage").val() : (($("#txtCurPage").val() - 1) * PageSize) + PageSize);

        $("#txtTotalRow").text($("#" + MasterObj + "txtTotalPage").val());

        if ($("#txtCurPage").val() == "" | $("#txtCurPage").val() == "0")
            $('#BtnPrv').disabled = true
        else
            $('#BtnPrv').disabled = false;

        if (parseInt($("#txtCurPage").val()) == parseInt($("#TotalPage").text()))
            $('#BtnNext').disabled = true
        else
            $('#BtnNext').disabled = false;
        if (parseInt($("#" + MasterObj + "txtTotalPage").val()) <= PageSize)
            $("#TrFooter").css("display", "none");
        else {
            $("#TrFooter").css("display", "inline");
            // $("#TblFooter").css("width", TblFooterWidth + ((colCounts * 2) - 40));
            $("#TblFooter").css("height", "35px");
        }
    }
    //************************************************************************
    var TimeoutObj = null;
    var ISClose = false;
    function onclickBtnCloseDiv() {
        $("#DNewRow").slideUp("fast");
        $("#DNewRow").css("display", "none")
        ISClose = false;
        TimeoutObj = null;
    }