var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = "";
var LastSelectedRowClass = "";
document.body.scroll = "yes";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";

//=====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//====================================================================================================
function EndRequestHandler(sender, args) {

    if ($("#" + MasterObj + "txtAlert").val() != "") {

        window.returnValue = "1";
        if ($("#" + MasterObj + "txtSubmit").val() == "Modify") {
            if ($("#" + MasterObj + "txtValidate").val() != "1") {
                alert($("#" + MasterObj + "txtAlert").val());
            }
            else {
                SetMsg($("#" + MasterObj + "txtAlert").val());
            }
        }
    }
    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")

    LastSelectedRow = "";
    LastSelectedRowClass = "";
}

// ===============================Save===================================   
function OnClickBtnSave() {
    if (confirm('ردیفی که انتخاب نشده باشد حذف می شود!')) {
        makeXml();
            $("#" + MasterObj + "txtSubmit").val("Modify")
            $("#" + MasterObj + "BtnSubmit").click()
    }
}
//=====================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyle');
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnblureTxt(obj, tbxvalue) {
    var OGrid = $("#" + MasterObj + "GrdDepartment");
    var grdLen = OGrid.find("tr").length;
    //alert($(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val());
    var m = parseInt($(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val()) - 2;
    //alert(m);
    if (tbxvalue != $(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val()) { //--??? ????? ????? ???? ???? ????? ????
        //-----------delete row where replace------------------------------
        var rowIndex = parseInt(LastSelectedRow.rowIndex); //parseInt(row.rowIndex) ; //----------index ???? ????
        var htmlval = $("#" + MasterObj + "GrdDepartment").find("tr:eq(" + rowIndex + ")").html();
        $("#" + MasterObj + "GrdDepartment").find("tr:eq(" + rowIndex + ")").remove();
        //-------------------------------------------------------------------
        if ($(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val() >= grdLen) {
            $("#" + MasterObj + "GrdDepartment tr:last")
    .after("<tr>" + htmlval + "</tr>");
        }
        else if (m == -1) {
            $("#" + MasterObj + "GrdDepartment tr:first")
    .after("<tr>" + htmlval + "</tr>");
        }
        else {
            //$("#" + MasterObj + "GrdDepartment tr:lt(" + $(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val() + "):gt(" + m + ") ")
            // .after("<tr>" + htmlval + "</tr>");

            $("#" + MasterObj + "GrdDepartment tr:lt(" + $(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val() + "):gt(" + m + ") ")
                        .after("<tr>" + htmlval + "</tr>");


            //            var count = '1';
            //            $("#" + MasterObj + "GrdDepartment")
            //     .find("TBODY")
            //     .find('tr')
            //     .each(function () {
            //         if (count == '1') {
            //             if ($(LastSelectedRow).find("td:eq(" + 3 + ")").children(0).val() >= $(this).find("td:eq(" + 3 + ")").children(0).val()) {
            //                 $(this).find("td:eq(" + 3 + ")")
            //                         .after("<tr>" + htmlval + "</tr>");
            //                 count = '2';
            //             }
            //         }
            //     });
        }
    }
    OnClickChk(obj);
}
//======================================?????? ?????? ?? ?? ?????? ???=========

function OnClickHeaderChk(header) {
    $("#" + MasterObj + "GrdDepartment").find("TBODY").find("tr").find("input:checkbox").each(function () {
        if (!$(this).hasClass("header")) {
            $(this).attr("checked", $(header).attr("checked"));
            OnClickChk($(this));
        }
    });
}
//************************************************************************
function OnClickChk(obj) {
    makeXml();
}
function makeXml() {
    var XMLStr = ""
    var counter = '1'

    $("#" + MasterObj + "GrdDepartment")
     .find("TBODY")
     .find('tr')
     .each(function () {
         if (counter != '1') {
             if ($(this).find('input:checkbox').attr("checked")) {
                 if ($(this).find("td:eq(" + 1 + ")").text() == '')//for insert ID=0
                     $(this).find("td:eq(" + 1 + ")").text('0')
                 XMLStr += "<Tb>"
                 XMLStr += "<ID>" + $(this).find("td:eq(" + 1 + ")").text() + "</ID>"
                 XMLStr += "<Title>" + $(this).find("td:eq(" + 2 + ")").children(0).val() + "</Title>"
                 XMLStr += "<IntVal>" + $(this).find("td:eq(" + 3 + ")").children(0).val() + "</IntVal>"
                 XMLStr += "</Tb>"
             }
         }
         counter++
     });
    var str = "<Root>" + XMLStr + "</Root>"
    $("#" + MasterObj + "TxtXml").val(str)
    // alert(str);
}
//**************************************************************************
function checkEnter(Direction) {
    var OGrid = $("#" + MasterObj + "GrdDepartment");
    var grdLen = OGrid.find("tr").length;

    if (OGrid.find("tr:eq(" + parseInt(grdLen - 2) + ")").attr("Footer") == 1) {
        grdLen = grdLen - 2;
    }
    var firstTitle = $(LastSelectedRow).find("td:eq(" + 2 + ")").children(0).val();
    var firstID = $(LastSelectedRow).find("td:eq(" + 1 + ")").text();
    //-----------------------------------------------------------------
    if (Direction == '0')
        WindowEvent = window.event.keyCode
    else { //for use button ArrowKey
        if (Direction == '1')
            WindowEvent = 40;
        else
            WindowEvent = 38;
    }
    //-----------------------------------------------
    switch (WindowEvent) {
        case 40: //----------------------------------------
            var rowIndex = parseInt(LastSelectedRow.rowIndex) + 1; //parseInt(row.rowIndex) ; //----------index ???? ????
            if (LastSelectedRow.rowIndex != grdLen - 1 && LastSelectedRow.rowIndex != undefined) {//LastSelectedRow.rowIndex != 1 &&
                $(LastSelectedRow).find("td:eq(" + 1 + ")").text(OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 1 + ")").text());
                $(LastSelectedRow).find("td:eq(" + 2 + ")").children(0).val(OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 2 + ")").children(0).val());
                OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 2 + ")").children(0).val(firstTitle);
                OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 1 + ")").text(firstID);
                OGrid.find("tr:eq(" + rowIndex + ")").select();
                //////////////////////////////////////////////////////////////////////////
                OGrid = document.getElementById(MasterObj + "GrdDepartment");
                LastSelectedRow.className = LastSelectedRowClass;
                LastSelectedRowClass = OGrid.rows(rowIndex).className;
                LastSelectedRow = OGrid.rows(rowIndex);
                OGrid.rows(rowIndex).className = "CssSelectedItemStyle";
            }
            break;
        case 38: //--------------------------------- -------------------------------
            var rowIndex = parseInt(LastSelectedRow.rowIndex) - 1;
            if (LastSelectedRow.rowIndex != 1 && LastSelectedRow.rowIndex != undefined) {//LastSelectedRow.rowIndex != grdLen - 1 &&
                $(LastSelectedRow).find("td:eq(" + 1 + ")").text(OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 1 + ")").text());
                $(LastSelectedRow).find("td:eq(" + 2 + ")").children(0).val(OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 2 + ")").children(0).val());
                OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 2 + ")").children(0).val(firstTitle);
                OGrid.find("tr:eq(" + rowIndex + ")").find("td:eq(" + 1 + ")").text(firstID);
                /////////////////////////////////////////////////////////////////////////////////
                OGrid = document.getElementById(MasterObj + "GrdDepartment");
                LastSelectedRow.className = LastSelectedRowClass;
                LastSelectedRowClass = OGrid.rows(rowIndex).className;
                LastSelectedRow = OGrid.rows(rowIndex);   //$(OGrid).find("tr:eq(" + rowIndex + ")");
                OGrid.rows(rowIndex).className = "CssSelectedItemStyle";
                ////       oGrdNewCode.find("tr:eq(" + idx + ")").attr('className', 'CssSelectedItemStyle');
                ////       $(LastSelectedRow).attr('className', LastSelectedRowClass);
                ////       LastSelectedRow = oGrdNewCode.find("tr:eq(" + idx + ")");
                ////       $(LastSelectedRow).attr('className', 'CssSelectedItemStyle');
            }
            break;
    }
    OnClickChk();
}

//*****************************************************************************************
function OnClickNew(obj) {

    var OGrdCard = document.getElementById(MasterObj + "GrdDepartment");
    var RowIndex = obj.parentElement.parentElement.rowIndex;

    if (OGrdCard.rows(RowIndex).cells(2).firstChild.value == "") {
        alert("لطفا نام سمت را وارد کنید")
        return;
    }
    var oRow = OGrdCard.insertRow();
    OGrdCard.rows(RowIndex).cells(4).style.display = "none"; //for Hide +

    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = OGrdCard.rows(RowIndex).cells(0).innerHTML
    oCell0.firstChild.checked = false;

    var oCell1 = oRow.insertCell();
    oCell1.innerHTML = ''; //

    var oCell2 = oRow.insertCell();
    oCell2.innerHTML = '<input type="text" value="" />';

    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = '<input type="text" value=' + document.getElementById(MasterObj + "txtIntVal").value + ' disabled=disabled />'; ;
    document.getElementById(MasterObj + "txtIntVal").value = (parseInt(document.getElementById(MasterObj + "txtIntVal").value) + 1).toString();

    var oCell4 = oRow.insertCell();
    oCell4.innerHTML = OGrdCard.rows(RowIndex).cells(4).innerHTML
    oCell4.firstChild.value = "0";

    //========================================================
    if (oRow.rowIndex % 2 == 1)
        oRow.className = "CssItemStyle";
    else
        oRow.className = "CssAlternatingItemStyle";
}
//*******************************************************************************
