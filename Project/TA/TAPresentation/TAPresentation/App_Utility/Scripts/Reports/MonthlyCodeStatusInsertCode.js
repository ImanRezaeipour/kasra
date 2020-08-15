document.body.style.overflowY = "auto";
document.body.style.overflowX = "hidden";
$(document).ready(function () {
    CreateHeader();
    CreateHeaderSum();

    LoadPage();
});

function LoadPage() {
    var StrLoad = $("#" + MasterObj + "txtLoadPage").val();
    if (StrLoad != "" && StrLoad != "<ReportsEntity></ReportsEntity>" && StrLoad != "<ReportsEntity />") {
        var xmlSave;
        if (window.ActiveXObject) {
            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
            xmlSave.async = 'false';
            xmlSave.loadXML(StrLoad);
        } else {
            var parser = new DOMParser();
            xmlSave = parser.parseFromString(StrLoad, 'text/xml');
        }

        if ($(xmlSave).find("ReportsEntity").find("Symbol").length > 0) {
            var XmlSymbol = $(xmlSave).find("ReportsEntity").find("Symbol")
            for (var i = 0; i < $(XmlSymbol).length; i++) {
                if ($("#TblSymbol").find("tr").length == 0)
                    $("#TblSymbol").append("<tr Rowid=" + $($(XmlSymbol)[i]).find("Code").text() + " class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'>" + $($(XmlSymbol)[i]).find("Code").text() + "</td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)'  value='" + $($(XmlSymbol)[i]).find("Value").text() + "' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'></td></tr>");
                else
                    $("#TblSymbol").append("<tr Rowid=" + $($(XmlSymbol)[i]).find("Code").text() + " class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'>" + $($(XmlSymbol)[i]).find("Code").text() + "</td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)'  value='" + $($(XmlSymbol)[i]).find("Value").text() + "' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='OnclickDelRow(this)'  /></td></tr>");

                $("#TblSymbol").find("tr").filter(function () { return $(this).attr("Rowid") == $($(XmlSymbol)[i]).find("Code").text() }).each(function () {
                    $(this).find("td:eq(0)").children(0).val($($(XmlSymbol)[i]).find("Code").text());
                });
            }
        }
        else {
            CreateTblSymbol();
        }
        if ($(xmlSave).find("ReportsEntity").find("Sum").length > 0) {
            var XmlSum = $(xmlSave).find("ReportsEntity").find("Sum")
            for (var i = 0; i < $(XmlSum).length; i++) {
                if ($("#TblSum").find("tr").length == 0)
                    $("#TblSum").append("<tr Rowid=" + $($(XmlSum)[i]).find("Code").text() + " class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'>" + $($(XmlSum)[i]).find("Code").text() + "</td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)'  value='" + $($(XmlSum)[i]).find("Value").text() + "' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'></td></tr>");
                else
                    $("#TblSum").append("<tr Rowid=" + $($(XmlSum)[i]).find("Code").text() + " class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'>" + $($(XmlSum)[i]).find("Code").text() + "</td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)'  value='" + $($(XmlSum)[i]).find("Value").text() + "' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='OnclickDelRow(this)'  /></td></tr>");

                $("#TblSum").find("tr").filter(function () { return $(this).attr("Rowid") == $($(XmlSum)[i]).find("Code").text() }).each(function () {
                    $(this).find("td:eq(0)").children(0).val($($(XmlSum)[i]).find("Code").text());
                });
            }
        }
        else {
            CreateTblSum();
        }
    }
    else {
        CreateTblSymbol();
        CreateTblSum();
    }
}
function CreateHeader() {
    $("#TblHeader").append("<tr class='CssHeader'  ><td class='CssHeader' style='width: 150px' align='center' > نام کد</td><td  align='center' style='width:80px'>شماره کد</td><td  align='center' style='width:100px'>نماد سيمبل </td><td  align='center' >ايجاد</td><td  align='center' >حذف</td></tr>");
}
function CreateTblSymbol() {
    if ($("#TblSymbol").find("tr").length == 0)
        $("#TblSymbol").append("<tr Rowid=0 class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'></td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'></td></tr>");
    else
        $("#TblSymbol").append("<tr Rowid=0 class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'></td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onkeydown='OnkewDowntxt(this)' onblur='onBluretxt(this)' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' Tbl='Symbol' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='OnclickDelRow(this)'  /></td></tr>");
}
//-----------------Create Tbl Sum------------------------
function CreateHeaderSum() {

    $("#TblHeaderSum").append("<tr class='CssHeader'  ><td class='CssHeader' style='width: 150px' align='center' > نام کد</td><td  align='center' style='width:80px'>شماره کد</td><td  align='center' style='width:100px'>نام پيش فرض </td><td  align='center' >ايجاد</td><td  align='center' >حذف</td></tr>");
}
function CreateTblSum() {
    if ($("#TblSum").find("tr").length == 0)
        $("#TblSum").append("<tr Rowid=0 class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'></td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onblur='onBluretxt(this)' onkeydown='OnkewDowntxt(this)' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' /></td><td  align='center' style='width:25px'></td></tr>");
    else
        $("#TblSum").append("<tr Rowid=0 class='CssCellsStyle' ><td  align='center' ><select  class='TxtControls' style='width: 146px' id='CmbCode' onchange='OnChangeCmbCode(this)' >" + $("#" + MasterObj + "CmbMainCode").html() + "</select></td><td  align='center' style='width:80px'></td><td  align='center' ><input type='text' id='txtSymbol' style='width:100px' onblur='onBluretxt(this)' onkeydown='OnkewDowntxt(this)' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='OnclickNewRow(this)' /></td><td  align='center' style='width:25px'><img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='OnclickDelRow(this)' Tbl='Sum' /></td></tr>");
}
//-------------------------------------------------------
function OnChangeCmbCode(obj) {
    var Row = $(obj).parent().parent();
    var RowIndex = $(obj).parent().parent().index();
    Row.attr("Rowid", $(obj).val());

    var Tbl = $(obj).parent().parent().parent();
    if (Row.attr("Rowid") != "0") {
        if ($(Tbl).find("tr").length > 1) {
            if ($(Tbl).find("tr").filter(function () { return ($(this).attr("Rowid") == Row.attr("Rowid") && $(this).index() != RowIndex && $(this).attr("Rowid") != "0") }).length > 0) {
                alert(" براي اين کد قبلا يک سطر تعريف شده است");
                Row.find("td:eq(1)").text("");
                $(obj).val("0");
            }
            else {
                Row.find("td:eq(1)").text($(obj).val());
            }
        }
        else {
            Row.find("td:eq(1)").text($(obj).val());
        }
    }
    else {
        Row.find("td:eq(1)").text("");
    }
}
//-------------------------------------------------------
function OnclickNewRow(obj) {
    if ($(obj).attr("Tbl") == "Symbol") {
        CreateTblSymbol();
    }
    else {
        CreateTblSum();
    }
}
//-------------------------------------------------------
function OnclickDelRow(obj) {
    var Row = $(obj).parent().parent();
    var Tbl = $(obj).parent().parent().parent();
    if ($(Tbl).find("tr").length > 1)
        Row.remove();
}
//-------------------------------------------------------
function OnClickBtnSave() {
    if (CheckEmpty()) {
        MakeXml()
    }
}
//-------------------------------------------------------
function MakeXml() {
    var str = "";
    $("#TblSymbol").find("tr").each(function () {
        if ($(this).attr("Rowid") != "0") {
            str += "<Tb>"
            str += "<CodeID>" + $(this).find("td:eq(0)").children(0).val() + "</CodeID>"
            str += "<Symbol>" + $(this).find("td:eq(2)").children(0).val() + "</Symbol>"
            str += "<Type>S</Type>"
            str += "</Tb>"
        }
    });
    $("#TblSum").find("tr").each(function () {
        if ($(this).attr("Rowid") != "0") {
            str += "<Tb>"
            str += "<CodeID>" + $(this).find("td:eq(0)").children(0).val() + "</CodeID>"
            str += "<Symbol>" + $(this).find("td:eq(2)").children(0).val() + "</Symbol>"
            str += "<Type>F</Type>"
            str += "</Tb>"
        }
    });

    if (str != "") {
        $("#" + MasterObj + "txtXmlSave").val("<Root>" + str + "</Root>");

        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "MonthlyCodeStatusInsertCode.aspx/SaveStatusCode?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",
            data: "{XmlSave:'" + $("#" + MasterObj + "txtXmlSave").val() + "' , CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
            success: function (Data) {
                var xmlSave;
                if (window.ActiveXObject) {
                    xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                    xmlSave.async = 'false';
                    xmlSave.loadXML(Data.d);
                } else {
                    var parser = new DOMParser();
                    xmlSave = parser.parseFromString(Data.d, 'text/xml');
                }
                if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "1") {
                    returnValue = 1;
                    window.close();
                }
                else {
                    alert($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text());
                }
                CloseModelPopup();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("با خطا مواجه شد" + jqXHR.responseText);
                CloseModelPopup();
            }
        });
    }
    else {
        alert("موردي براي ذخيره وجود ندارد")
    }
}
//-------------------------------------------------------
function CheckEmpty() {
    var checkFlag = true;
    if ($("#TblSymbol").find("tr").filter(function () { return $(this).attr("Rowid") == "0" }).length > 1) {
        alert(" در جدول مربوط به تعريف سيمبل ها براي بعضي از سطرها کد تعريف نشده است ");
        checkFlag = false;
    }
    else if ($("#TblSymbol").find("tr").filter(function () { return ($(this).attr("Rowid") != "0" && $(this).find("td:eq(2)").children(0).val() == "") }).length > 0) {
        alert(" در جدول مربوط به تعريف سيمبل ها براي بعضي از سطرها هيچ سيمبلي تعريف نشده است ");
        checkFlag = false;
    }
    else if ($("#TblSum").find("tr").filter(function () { return $(this).attr("Rowid") == "0" }).length > 1) {
        alert(" در جدول مربوط به تعريف آيتم هاي سرجمع براي بعضي از سطرها کد تعريف نشده است ");
        checkFlag = false;
    }
    else if ($("#TblSum").find("tr").filter(function () { return ($(this).attr("Rowid") != "0" && $(this).find("td:eq(2)").children(0).val() == "") }).length > 0) {
        alert(" در جدول مربوط به تعريف آيتم هاي سرجمع براي بعضي از سطرها هيچ سيمبلي تعريف نشده است ");
        checkFlag = false;
    }
   
    return checkFlag;
}
//---------------------------------------------------
var Shift ; 
function OnkewDowntxt(obj) {
//    var Shift = ""
    var key = window.event.keyCode
    
    if (!Shift) {
        if (key == 16)
            Shift = true;
        else {
            window.event.returnValue =
		    (
			(key == 189) ||
			(key == 191) ||
			(key == 67) ||
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46 || key == 39 || key == 37) || (key==40)||
			((key>=35 || key<=37))
	      	)
            
        }
    }
    else if (Shift) {
        window.event.returnValue =
		    (
			(key == 187) ||
			(key == 56) ||
			(key == 57) ||
			(key == 48) ||
			(key == 67)

	      	)
        Shift = false;
    }
   // window.event.returnValue = ((key != 38));
}
//=========================
function onBluretxt(obj) {
    var lenObj = $(obj).val().length
    var key
    var eventObj
    var charC
    
    for (var i = 0; i < lenObj; i++) {
        
        eventObj = $(obj).val().substring(i, i + 1)

        key = eventObj.charCodeAt(0)

        if (key == 38 || key == 39 || key == 60 || key == 62) {
            charC = String.fromCharCode(key)
            alert(" شما مجاز به استفاده از کاراکتر هاي & ' < >  نمي باشيد")
            $(obj).val(ReplaceAll($(obj).val(), charC, ""));
            return false;
        }
    }
}