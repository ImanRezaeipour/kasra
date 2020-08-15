var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.dir = "rtl";
var MasterObj = "ctl00_ContentPlaceHolder1_";
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {



}


function EndRequestHandler(sender, args) {


    LastSelectedRow = null;
    var StrVal = $get(MasterObj + "txtSubmit").value
    if ($get(MasterObj + "txtAlert").value != "") {
        if (($get(MasterObj + "txtStatus").value == "2"))
            alert($get(MasterObj + "txtAlert").value);
        else
            SetMsg($get(MasterObj + "txtAlert").value);
    }

    $get(MasterObj + "txtSubmit").value = "";
    $get(MasterObj + "txtAlert").value = "";
    $get(MasterObj + "txtStatus").value = "";

    if (StrVal != "") {

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
    }
}

//===================================================

////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {

    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd() {


    var url = "DefineCardReaderNew.aspx?&DepletionID=" + LastSelectedRow.getAttribute("DepletionID")
            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
            + "&CardReaderModelID=" + LastSelectedRow.getAttribute("CardReaderModelID")
            + "&CardReaderNo=" + LastSelectedRow.cells(1).innerText
            + "&CardReaderName=" + LastSelectedRow.cells(2).innerText
            + "&Location=" + LastSelectedRow.cells(3).innerText
            + "&IP=" + LastSelectedRow.cells(5).innerText
            + "&TRT=" + LastSelectedRow.cells(6).innerText
            + "&StartDate=" + LastSelectedRow.cells(8).innerText
            + "&EndDate=" + LastSelectedRow.cells(9).innerText
            + "&StartTime=" + LastSelectedRow.cells(10).innerText
            + "&EndTime=" + LastSelectedRow.cells(11).innerText
            + "&ID=" + LastSelectedRow.getAttribute("ID")
            + "&Active=" + LastSelectedRow.getAttribute("Active")
            + "&SessionID=" + $get(MasterObj + "txtSessionID").value;


    url = encodeURI(url)
    //alert(url)
   
    returnValue = window.showModalDialog(url, "window", 'dialogHeight: 400px;dialogWidth: 550px;center: Yes;help: no;status: no');

    if (returnValue == 1) {
        OnClickBtnFilter();
    }
}


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {

    document.getElementById(MasterObj + "txtCardReaderNo").value = $get(MasterObj + "CmbCardReader_Input").value.split("-")[0];
    if ($get(MasterObj + "ChkActive").checked == true && $get(MasterObj + "ChkDeActive").checked == false)
        $get(MasterObj + "txtActiveStatus").value = 1;
    else if ($get(MasterObj + "ChkDeActive").checked == true && $get(MasterObj + "ChkActive").checked == false)
        $get(MasterObj + "txtActiveStatus").value = 2;
    else if ($get(MasterObj + "ChkDeActive").checked == false && $get(MasterObj + "ChkActive").checked == false)
        $get(MasterObj + "txtActiveStatus").value = 0;
    else if ($get(MasterObj + "ChkDeActive").checked == true && $get(MasterObj + "ChkActive").checked == true)
        $get(MasterObj + "txtActiveStatus").value = 0;

    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {

    $get(MasterObj + "txtCardReaderNo").value = "";
    $get(MasterObj + "txtActiveStatus").value = "";
    $get(MasterObj + "ChkActive").checked = false;
    $get(MasterObj + "ChkDeActive").checked = false;
    $get(MasterObj + "CmbCardReader_Input").value = "";
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    if (LastSelectedRow != null) {
        var Msg = "آيا برای حذف مطمئنيد؟"
        if (confirm(Msg) == true) {
            document.getElementById(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("ID");
            document.getElementById(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("به منظور حذف يک سطر را انتخاب کنيد")
    }
}


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {
        OndbClickGrd();
    }
    else
        alert("به منظور ويرايش يک سطر را انتخاب کنيد")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
function OnClickBtnNew() {
    returnValue = window.showModalDialog("DefineCardReaderNew.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value, "", 'dialogHeight: 400px;dialogWidth: 550px;center: Yes;help: no;status: no');
    if (returnValue == 1) {
        OnClickBtnFilter();
    }

}