var RowIndex = 0;
//برای ست کردن زمان برروی textBox که پس از یک زمانی سمت سرور برود و قاب خود را بیاورد   

///////////////////////////////////////////////////////////////////////////////////////////////////////////    
function searchAjax(myID) {
    RowIndex = 1;
    $.ajax({
        type: "POST",
        url: "/FrmPresentation/Services/GetPersonel.asmx/GetData",
        contentType: "application/json; charset=utf-8",
        data: "{Mode:'Search',PCode:'" + $("#" + myID + "_txtPCode").val() + "',SP:'" + $("#" + myID + "_txtSP").val() + "',OnlineUser:'" + $("#" + myID + "_txtOnLineUserID").val() + "',MenuItemID:'" + $("#" + myID + "_txtMenuItemID").val() + "',SWPID:'" + $("#" + myID + "_txtSWPID").val() + "',EWPID:'" + $("#" + myID + "_txtEWPID").val() + "',NoExitDate:'" + $("#" + myID + "_NotExitDate").val() + "', SDate:'" + $("#" + myID + "_txtSDate").val() + "' ,EDate:'" + $("#" + myID + "_txtEDate").val() + "',CompanyID:" + $("#" + myID + "_txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + myID + "_txtSessionID").val() + "}",
        success: function (Data) {
            LoadDataSearch(Data.d, myID);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
        }
    });
}
//--------------------------------------------------------------------
function onkeydownEnter() {
    if (window.event != null)
        if (window.event.keyCode == 13) {
            if (typeof $("#OToolBar_BtnFilter") == "object") {
                window.event.keyCode = "";
                if ($("#OToolBar_BtnFilter").length != 0)
                    OnClickBtnFilter();
            }
        }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function LoadDataSearch(Data, myID) {
    var oXmlDoc;
    if (window.ActiveXObject) {
        oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(Data)
    }
    else {
        var parser = new DOMParser(); oXmlDoc = parser.parseFromString(Data, 'text/xml');
    }
    var xmlNodes = oXmlDoc.selectNodes('/GeneralEntity/GetUC')

    switch (xmlNodes.length) {
        case 0:
            $("#" + myID + "_txtPCode").val("")//اگر کد یا نام نامعتبر باشد
            $("#" + myID + "_txtName").val("")
            $("#" + myID + "_txtPCode").attr("OldVal", "");
            $("#" + myID + "_txtCode").val("")
            $("#" + myID + "_txtID").val("")
            eval($("#" + myID + "_txtOnChangeFunc").val());

            break;
        case 1: //اگر کد یا نام کاملا صحیح باشد                     
            LoadName(myID, xmlNodes)

            break;
        default: //در صورتی که دسته ای از رکوردها داریم و بایستی قاب باز شود
            Fillgrd(myID, xmlNodes);
            break;
    }
    $("#" + myID + "_txtPCode").keydown(function () { onkeydownEnter() });

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function LoadName(myID, xmlNodes) {
    //txt پر کردن نام بر اساس کد یا نام وارد شده در       
    if (xmlNodes.length != 0) {
        $("#" + myID + "_txtPCode").val($($(xmlNodes)[0]).find('Code').text().trim());
        $("#" + myID + "_txtPCode").attr("title", $($(xmlNodes)[0]).find('Name').text());
        $("#" + myID + "_txtName").val($($(xmlNodes)[0]).find('Name').text());
        $("#" + myID + "_txtCode").val($($(xmlNodes)[0]).find('Code').text().trim());
        $("#" + myID + "_txtID").val($($(xmlNodes)[0]).find('ID').text().trim());
        $("#" + myID + "_txtPCode").attr("OldVal", $($(xmlNodes)[0]).find('Code').text().trim());
        HideDivPopup(myID)
        eval($("#" + myID + "_txtOnChangeFunc").val());
    }

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function Fillgrd(myID, xmlNodes) {
    RowIndex = 0;
    //پاک کردن گرید یا قاب قبلی
    $("#" + myID + "_grd").find("tr").each(function () {
        $(this).remove();
    });
    //به دست آوردن ارتفاع قاب
    $("#" + myID + "_grd").css("height", 20 * parseInt(xmlNodes.length))
    //اضافه کردن ردیف ها قرار دادن سلول ها داخل آن  ست کردن استایل سطرها و اضافه کردن متد کلیک و موس آور برای سطرهای گرید
    var NewRowFlag = 0;
    var TblInsert;
    $(xmlNodes).each(function () {
        NewRowFlag = $("#" + myID + "_txtPCode").val().trim() == $(this).find('Code').text().trim() ? 1 : 0;

        $("#" + myID + "_grd").append("<tr " + (NewRowFlag == 0 ? "class='CssGridRow'" : "class='CssGridRowSelected'") + "><td style='width:100px;' align='center' ID=" + $(this).find('ID').text().trim() + " >" + $(this).find('Code').text().trim() + "</td><td style='width:200px;' align='right'>" + $(this).find('Name').text() + "</td></tr>");
        if ($("#" + myID + "_txtPCode").val().trim() == $(this).find('Code').text().trim()) {
            RowIndex = $("#" + myID + "_grd tr:last").index();
        }
        $("#" + myID + "_grd tr:last").click(function () { grd_OnClick(myID) });
        $("#" + myID + "_grd tr:last").mouseover(function () { grd_OnMouseOver(myID) });
    });
    //  رنگی کردن ردیف اول
    $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRowSelected");
    // نمایش دیو
    ShowDivPopup(myID);

}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
function HideDivPopup(myID) {
    //پنهان کردن دیو           
    $("#" + myID + "_DivPopup").css("top", "");
    $("#" + myID + "_DivPopup").css("left", "");
    $("#" + myID + "_DivPopup").hide();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function ShowDivPopup(myID) {
    //txtName به دست آوردن موقعیت
    var NewObj = $get(myID + "_txtName");

    var posX = NewObj.offsetLeft;
    var posY = NewObj.offsetTop;
    //پرسش از آقای سربند
    while (NewObj.offsetParent) {
        posX = posX + NewObj.offsetParent.offsetLeft;
        posY = posY + NewObj.offsetParent.offsetTop;
        if (NewObj == document.getElementsByTagName('body')[0]) { break }
        else { NewObj = NewObj.offsetParent; }
    }

    $("#" + myID + "_DivPopup").css("top", posY + 22);
    $("#" + myID + "_DivPopup").css("left", posX - 13);
    $("#" + myID + "_DivPopup").show();

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function BtnDown_onclick(obj) {
    var myID = $(obj).attr("UserControlID");
    //txtPCode حفظ فوکوس روی      
    $("#" + myID + "_txtPCode").focus();
    $("#" + myID + "_txtPCode").select();
    if ($("#" + myID + "_DivPopup").css("display") != "none") {
        HideDivPopup(myID)
    }
    else if ($("#" + myID + "_txtPCode").val() == "") {
        $("#" + myID + "_txtName").val("")
        //که فوکوس ازروی پرسنلی نپرد updatePanel داخل _txtPCodeTmp گذاشتن
        searchAjax(myID);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
function grd_OnClick(myID) {
    //باکلیک روی هر سطر آن داده های آن سطر داخل کد و نام قرار میگیرن وگرید بسته می شود
    var obj = window.event.srcElement.parentElement
    $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").addClass("CssGridRow");
    RowIndex = obj.rowIndex;
    $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").addClass("CssGridRowSelected");

    $("#" + myID + "_txtPCode").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
    $("#" + myID + "_txtCode").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
    $("#" + myID + "_txtID").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").attr("ID"));
    $("#" + myID + "_txtPCode").attr("title", $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(1)").text());
    $("#" + myID + "_txtName").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(1)").text());


    $("#" + myID + "_txtPCode").attr("OldVal", $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
    eval($("#" + myID + "_txtOnChangeFunc").val());
    HideDivPopup(myID);
}
function grd_OnMouseOver(myID) {
    //تغییر استایل سطرهای گرید براساس حرکت روی آنها
    var obj = window.event.srcElement.parentElement

    if (obj != null && $("#" + myID + "_grd tr:eq(" + RowIndex + ")") != null) {
        $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
        $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRow");
        RowIndex = obj.rowIndex;
        $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
        $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRowSelected");
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtPCodeonmousedown(obj) {
    txtPCodeOnKeyDown(obj)
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function txtPCodeOnKeyDown(obj) {
    var myID = $(obj).attr("UserControlID");
    //دکمه های بال و پایین روی گرید -توجه شود تمام اینها داخل فوکوس کد است زیرا با وجود آنکه گرید باز است ولی همچنان فوکوس روی کد است
    if (event.keyCode == 38) {
        if (RowIndex > 0) {
            if ($("#" + myID + "_grd tr:eq(" + RowIndex + ")") != null) {
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRow");
                --RowIndex;
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRowSelected");
            }
        }
    }
    else if (event.keyCode == 40) {
        if (RowIndex < $("#" + myID + "_grd")[0].rows.length - 1) {
            if ($("#" + myID + "_grd tr:eq(" + RowIndex + ")") != null) {
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRow");
                ++RowIndex;
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").removeClass();
                $("#" + myID + "_grd tr:eq(" + RowIndex + ")").addClass("CssGridRowSelected");
            }
        }
    }
    //زدن اینتر و مقداردهی کد و نام و بستن گرید
    else if (event.keyCode == 13) {
        if ($("#" + myID + "_DivPopup").css("display") != "none") {
            $("#" + myID + "_txtPCode").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
            $("#" + myID + "_txtCode").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
            $("#" + myID + "_txtID").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").attr("ID"));
            $("#" + myID + "_txtPCode").attr("title", $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(1)").text());
            $("#" + myID + "_txtName").val($("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(1)").text());
            $("#" + myID + "_txtPCode").attr("OldVal", $("#" + myID + "_grd").find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text());
            HideDivPopup(myID);
        }
    }
    else {
        //1ثانیه پس از وارد کردن هر کدی و رها کردن یا تایپ نکردنن سمت سرور رفته تا قاب را باز کند                     
        if (obj.timeout != "" && obj.timeout != null)
            clearTimeout(obj.timeout)
        var Str = $(obj).attr("MethodName");
        Str += "()";
        obj.timeout = setTimeout(Str, 1000);

    }
}
/////////////////////////////////////////////////////////////////////////////////   
function txtPCodeChanged(obj) {
    var myID = $(obj).attr("UserControlID");
    if ($("#" + myID + "_txtPCode").val() != "") {
        //خالی کردن نام و رفتن سمت سرور
        $("#" + myID + "_txtName").val("")
        $("#" + myID + "_txtID").val("");
        searchAjax(myID);
    }
    else {
        $("#" + myID + "_txtPCode").attr("title", "");
        $("#" + myID + "_txtName").val("");
        $("#" + myID + "_txtID").val("");

        HideDivPopup(myID)
    }
}
/////////////////////////////////////////////////////////////////////////////////
function onFocusTxt(obj) {
    var myID = $(obj).attr("UserControlID");
    $(obj).attr("OldVal", $(obj).val());
    //انتخاب کامل کد زمان فوکوس برروی آن جهت ساده تر کردن تایپ       
    $("#" + myID + "_txtPCode").focus()
    $("#" + myID + "_txtPCode").select()
}
///////////////////////////////////////////////////////////////////////////////
function onBlurtxtPCode(obj) {
    //بستن دیو درصورتی که روی مکانی غیر از دیو کلیک شود
    var myID = $(obj).attr("UserControlID");

    if ($("#" + myID + "_txtOnMouseOver").val() == false || $("#" + myID + "_txtOnMouseOver").val() == "0" || $("#" + myID + "_txtOnMouseOver").val() == "false") {

        if ($("#" + myID + "_DivPopup").css("display") != "none") {
            $("#" + myID + "_txtPCode").val($("#" + myID + "_grd").find("tr:eq(0)").find("td:eq(0)").text())
            $("#" + myID + "_txtCode").val($("#" + myID + "_grd").find("tr:eq(0)").find("td:eq(0)").text())
            $("#" + myID + "_txtID").val($("#" + myID + "_grd").find("tr:eq(0)").attr("ID"))
            $("#" + myID + "_txtName").val($("#" + myID + "_grd").find("tr:eq(0)").find("td:eq(1)").text())
            $("#" + myID + "_txtPCode").attr("OldVal", $("#" + myID + "_grd").find("tr:eq(0)").find("td:eq(0)").text())

            HideDivPopup(myID)
        }
    }
}
///////////////////////////////////////////////////////////////////////////////   
//تا زمانی که موس روی دیو است یک متغییر 1 و با رفتن از روی آن صفر می شود و به این ترتیب تصمیم گرفته می شود که ایا دیو باز بماند یا بسته شود
function onmouseoverDiv(obj) {
    var MyID = $(obj).attr("UserControlID");
    $("#" + MyID + "_txtOnMouseOver").val("1");

}
function onMouseOutDiv(obj) {
    var MyID = $(obj).attr("UserControlID");
    $("#" + MyID + "_txtOnMouseOver").val("0");
}
function grd_OnKeyDown(obj) {
}
