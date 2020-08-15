//*************************************Declaration*************************************
var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.getElementsByTagName("body")[0].scroll = "no";
//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//=====================================================================================================
function BeginRequestHandler(sender, args) {
}
//====================================================================================================
function EndRequestHandler(sender, args) {
    LastSelectedRow = null;
    var StrVal = $("#" + MasterObj + "txtSubmit").val()
    if ($get(MasterObj + "txtAlert").value != "") {
        if ($("#" + MasterObj + "txtValidate").val("1"))
            SetMsg($("#" + MasterObj + "txtAlert").val());
        else
            alert($("#"+MasterObj + "txtAlert").val());
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtValidate").value = "";

}

//----------------------------------------------------ToolBar---------------------
function OnClickBtnFilter() {
    LastSelectedRow = "";
    $("#" + MasterObj + "txtpersonCode").val($("#" + MasterObj + "CmbPerson_txtCode").val());
   // $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
    if ($("#" + MasterObj + "txtpersonCode").val() == "" ) {
        alert('لطفا پرسنل را وارد کنید')
    } else {
        $("#" + MasterObj + "txtSubmit").val("Const")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//-----------------------------------------------------------------------
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('class', 'CssSelectedItemStyles1');
}
//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
  if (obj.value != 0 && obj.value.replace(" ", "") != "")
      $("#" + MasterObj + "txtCurPage").val(obj.value);
    alert($("#" + MasterObj + "txtCurPage").val())
        $("#" + MasterObj + "txtSubmit").val("Const");
        $("#" + MasterObj + "BtnSubmit").click();
   }
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
  
   $("#" + MasterObj + "txtSubmit").val("BtnNext");
        $("#" + MasterObj + "BtnSubmit").click();
}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
   $("#" + MasterObj + "txtSubmit").val("BtnLast")
        $("#" + MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
   $("#" + MasterObj + "txtSubmit").val("BtnPrev")
        $("#" + MasterObj + "BtnSubmit").click()
   }
//--------------------------------------------------------------------------------------------
function OnClickBtnFirst() {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit").click()
}
//-------------------------------------------------------------------------------------------
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyle');
}
//===================================================
function OnClickBtnNew() {
    var strUrl = 'PersonFamilyInfoNew.aspx?ID=0'
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                        + "&txtGetCompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value
                        + "&PersonID=" + $("#" + MasterObj + "CmbPerson_txtCode").val();
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 600px;center: Yes;help: no;status: no")
    if (returnValue == "1") {
        $("#" + MasterObj + "txtSubmit").val("BtnFirst")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//=======================================================ویرایش ========================================  
function OnClickBtnEdit() {
    //alert($(LastSelectedRow).find("td:eq(" + 4 + ")").html()) 
    if (LastSelectedRow == "" || LastSelectedRow == null)
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
    else {
        var strUrl = "PersonFamilyInfoNew.aspx?ID= " + $(LastSelectedRow).attr("ID")
                   + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                   + "&FName=" + $(LastSelectedRow).find("td:eq(" +0 + ")").text()
                   + "&LName=" + $(LastSelectedRow).find("td:eq(" + 1 + ")").text()
                   + "&Relation=" + $(LastSelectedRow).attr("Relation")
                   + "&BirthDate=" + $(LastSelectedRow).attr("BirthDate").toString().trim()
                   + "&ValidDate=" + $(LastSelectedRow).attr("ValidDate").toString().trim()
                   + "&Activ=" + $(LastSelectedRow).attr("ActiveNum")
                   + "&txtGetCompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value
                   + "&PersonID=" + $("#" + MasterObj + "CmbPerson_txtCode").val()
                   //+ "&SexID=" + $(LastSelectedRow).attr("SexID");
        var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 300px;dialogWidth: 600px;center: Yes;help: no;status: no")

        if (returnValue == "1") {
            $("#" + MasterObj + "txtSubmit").val("Const")
            $("#" + MasterObj + "BtnSubmit").click()
        }
    }
}

function OnClickBtnDel() {
    if (LastSelectedRow != null && LastSelectedRow != "") {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
            $("#" + MasterObj + "txtID").val($(LastSelectedRow).attr("ID"))
            $("#" + MasterObj + "txtSubmit").val("Delete")
            $("#" + MasterObj + "BtnSubmit").click()
        }
    }
    else
        alert('لطفا يک سطر از گريد انتخاب کنيد')
}
//======================================================دابل کلیک ==============================
function OndbClickGrd() {
    OnClickBtnEdit()
}
