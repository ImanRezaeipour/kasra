//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var GroupID = '0';
var LastSelectedRow = null;
var LastSelectedRowClass = "";
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//        document.getElementById('OPaging_BtnPrv').disabled = true;
//        document.getElementById('OPaging_txtFromData').value = $get(MasterObj + "lblFrom").value;
//        document.getElementById('OPaging_txtToData').value = $get(MasterObj + "lblTo").value;
//        document.getElementById('OPaging_txtTotalData').value = $get(MasterObj + "lblTotal").value;
//        document.getElementById('OPaging_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
//        document.getElementById('OPaging_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
//        if (parseInt(document.getElementById("OPaging_txtCurPage").value) == parseInt(document.getElementById("OPaging_txtTotalPage").value))
//            document.getElementById('OPaging_BtnNext').disabled = true
//        else
//            document.getElementById('OPaging_BtnNext').disabled = false;
document.getElementById('BtnPrv').disabled = true;
document.getElementById('txtFromData').value = $get(MasterObj + "lblFrom").value;
document.getElementById('txtToData').value = $get(MasterObj + "lblTo").value;
document.getElementById('txtTotalData').value = $get(MasterObj + "lblTotal").value;
document.getElementById('txtCurPage').value = $get(MasterObj + "txtCurPage").value;
document.getElementById('txtTotalPage').value = $get(MasterObj + "Totalpage").value;
if (parseInt(document.getElementById("txtCurPage").value) == parseInt(document.getElementById("txtTotalPage").value))
    document.getElementById('BtnNext').disabled = true
else
    document.getElementById('BtnNext').disabled = false;

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnBlurtxtCurPage() {
    document.getElementById("OPaging_txtCurPage").value = document.getElementById("OPaging_txtCurPage").value.replace(" ", "");

    var TotalPage = parseInt(document.getElementById("OPaging_txtTotalPage").value);
    if (document.getElementById("OPaging_txtCurPage").value != "" &&
                    document.getElementById("OPaging_txtCurPage").value != "0") {
        if (parseInt(document.getElementById("OPaging_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OPaging_txtCurPage").value
        }
        document.getElementById(MasterObj + "txtSubmit").value = "Const";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnLast() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnPrv() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFirst() {
    document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnEdit() {
    if (LastSelectedRow != null) {

        url = "GroupMember.aspx?GroupAccessID=" + document.getElementById(MasterObj + "txtGroupAccessID").value
                + "&GroupName=" + $get(MasterObj + "txtGroupName").value
                + "&GroupِDesc=" + $get(MasterObj + "txtGroupِDesc").value
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
        url = encodeURI(url)
        rr = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 600px;center: Yes;help: no;status: no")
        if (rr == 1) {
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNew() {
    url = "GroupMember.aspx?GroupAccessID=0"
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    rr = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 600px;center: Yes;help: no;status: no")
    if (rr == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OndbClickGrd() {
    OnClickBtnEdit()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickImgAccess(obj) {
    var TbObj = obj.parentElement;
    while (TbObj.tagName != "TR")
        TbObj = TbObj.parentElement
    if (TbObj.cells(0).firstChild.title != "")
        document.getElementById(MasterObj + "txtGroupName").value = TbObj.cells(0).firstChild.title
    else
        document.getElementById(MasterObj + "txtGroupName").value = TbObj.cells(0).innerText
    url = "PageAccess.aspx?GroupAccessID=" + TbObj.GroupID
            + "&GroupName=" + $get(MasterObj + "txtGroupName").value
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    url = encodeURI(url)
    window.showModalDialog(url, window, "dialogHeight: 650px;dialogWidth: 500px;center: Yes;help: no;status: no")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
    document.getElementById(MasterObj + "txtGroupAccessID").value = SelectedRow.GroupID
    //            alert(SelectedRow.cells(0).firstChild)
    //            alert(SelectedRow.cells(0).innerHTML)
    if (SelectedRow.cells(0).firstChild.title != "")
        document.getElementById(MasterObj + "txtGroupName").value = SelectedRow.cells(0).firstChild.title
    else
        document.getElementById(MasterObj + "txtGroupName").value = SelectedRow.cells(0).innerText
    if (SelectedRow.cells(1).firstChild.title != "")
        document.getElementById(MasterObj + "txtGroupِDesc").value = SelectedRow.cells(1).firstChild.title
    else
        document.getElementById(MasterObj + "txtGroupِDesc").value = SelectedRow.cells(1).innerText
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnDel() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    if (LastSelectedRow != null) {
        if (confirm("آیا برای حذف اعضا از گروه و حذف گروه مطمئنید؟")) {
            $get(MasterObj + "txtSubmit").value = "Delete"//"Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    else {
        alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnShowAll() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    $get(MasterObjSearch + "CmbPerson_txtCode").value = ""
    $get(MasterObjSearch + "CmbPerson_txtName").value = ""
    OnClickBtnFilter()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnFilter() {
    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
    $get(MasterObj + "txtPersonCode").value = $get(MasterObjSearch + "CmbPerson_txtCode").value;
    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onclickImgClose() {
    document.getElementById("BaseTD").align = "center";
    document.getElementById("shadowMessage").style.display = "none"
    document.getElementById("OToolBar_ImgRestor").style.display = "inline"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickImgRestor() {
    document.getElementById("BaseTD").align = "right";
    document.getElementById("shadowMessage").style.display = "inline"
    document.getElementById("OToolBar_ImgRestor").style.display = "none"
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickImgRefreshPerson() {
    OpenModelPopup();
    document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
    document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!