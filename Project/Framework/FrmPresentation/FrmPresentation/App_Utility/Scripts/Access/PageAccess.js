var MasterObj = "ctl00_ContentPlaceHolder1_";
/////-------------------------------------------
window.name = "PageAccess.aspx"
window.target = window.name;
function TreeView1_OnNodeSelect(sender, eventArgs) {
    //alert('Selected node: ' + eventArgs.get_node().get_checked());
    var chk = 0;
    if (eventArgs.get_node().get_checked() == "1") chk = 1
    url = "Action.aspx?GroupAccessID=" + document.getElementById(MasterObj + "txtGroupAccessID").value
                + "&MenuID=" + eventArgs.get_node().get_id()
                + "&MenuText=" + eventArgs.get_node().get_text()
                + "&Checked=" + chk
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
    url = encodeURI(url)
    rr = window.showModalDialog(url, window, "dialogHeight: 620px;dialogWidth: 750px;center: Yes;help: no;status: no")
    if (rr == 1) {
        document.getElementById(MasterObj + "txtSubmit").value = "Refresh";
        document.getElementById(MasterObj + "BtnSubmit").click();

    }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {
    window.close()
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {
    document.getElementById(MasterObj + "txtSubmit").value = "Save";
    document.getElementById(MasterObj + "BtnSubmit").click();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!