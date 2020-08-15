var str = '';

//------------------------------------------------
function OnClickBtnSelectPerson() {

    url = "../Person/SelectPerson.aspx?ShowFlag=1" + " &RequsterPageID=11110" + " &SessionID=" + $get(MasterObj + "txtSessionID").value + " &CompanyPeriodID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + " &OnLineUser=" + $get(MasterObj + "txtOnlineUserCode").value;
    var returnValue
    returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")


    //            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?TypeAccess=" + "1" + " &MenuItemID=" + "1322" //+ " &SessionID=" + $get("txtSessionID").value;
    //            var returnValue = "";
    //            returnValue = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");
    //alert(returnValue)
    $get(MasterObj + "txtReturnValue").value = returnValue
    //alert($get(MasterObj + "txtReturnValue").value)
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnCancel() {

    window.close();
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSave() {

    //alert($get(MasterObj + "txtReturnValue").value)
    var PersonStr = ""
    PersonStr = $get(MasterObj + "txtReturnValue").value;

    if ($get(MasterObj + "CmbRoleType").value == "0") {
        alert("نوع سمت را انتخاب نمایید")
        return;
    }
    if ($get(MasterObj + "txtRoleTitle").value == "") {
        alert("نام سمت را انتخاب نمایید")
        return;
    }
    //alert(PersonStr)
    if (PersonStr == "<UserEntity></UserEntity>" || PersonStr == undefined || PersonStr == "") {
        alert("پرسنلی انتخاب نشده است")
        return;
    }

    if (PersonStr != "") {
        //alert()
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(PersonStr);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (oXmlNodes.length > 0) {

            var x = 0;

            for (; x < oXmlNodes.length; ++x) {
                str += "<Tb>"
                str += "<DepartmentID>" + $get(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleType>" + $get(MasterObj + "CmbRoleType").value + "</RoleType>"
                str += "<RoleTitle>" + $get(MasterObj + "txtRoleTitle").value + "</RoleTitle>"
                str += "<PersonCode>" + oXmlNodes.item(x).selectSingleNode("PCode").text + "</PersonCode>"
                str += "<RoleID>0</RoleID>"
                str += "<Selected>1</Selected>"

                str += "</Tb>"
            }
        }

    }

    $get(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
    //alert($get(MasterObj + "txtSaveXml").value)
    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
    document.getElementById(MasterObj + "BtnSubmit").click();

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnSaveNew() {

    var PersonStr = ""
    PersonStr = $get(MasterObj + "txtReturnValue").value;



    if ($get(MasterObj + "CmbRoleType").value == "0") {
        alert("نوع سمت را انتخاب نمایید")
        return;
    }
    if ($get(MasterObj + "txtRoleTitle").value == "") {
        alert("نام سمت را انتخاب نمایید")
        return;
    }

    if (PersonStr == "<UserEntity></UserEntity>" || PersonStr == undefined || PersonStr == "") {
        alert("پرسنلی انتخاب نشده است")
        return;
    }


    if (PersonStr != "") {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(PersonStr);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
        if (oXmlNodes.length > 0) {

            var x = 0;

            for (; x < oXmlNodes.length; ++x) {
                str += "<Tb>"
                str += "<DepartmentID>" + $get(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleType>" + $get(MasterObj + "CmbRoleType").value + "</RoleType>"
                str += "<RoleTitle>" + $get(MasterObj + "txtRoleTitle").value + "</RoleTitle>"
                str += "<PersonCode>" + oXmlNodes.item(x).selectSingleNode("PCode").text + "</PersonCode>"
                str += "<RoleID>0</RoleID>"
                str += "<Selected>1</Selected>"

                str += "</Tb>"
            }
        }

    }

    $get(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
    ///---Clear Control
    //alert($get(MasterObj + "txtSaveXml").value)
    $get(MasterObj + "CmbRoleType").value = "0"
    $get(MasterObj + "txtRoleTitle").value = ""
    PersonStr = "";
    //---------------------


    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
    document.getElementById(MasterObj + "BtnSubmit").click();

}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!