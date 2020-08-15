var MasterObj = "ctl00_ContentPlaceHolder1_"
document.body.scroll = "No"
PageLoad()

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
    if (document.getElementById(MasterObj + "txtSubmit").value != "Calc")
        document.getElementById("ctl00_ProgressState").value = 1
    var elem = args.get_postBackElement()
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
    document.dir = "RTL"
    var StrVal = $get(MasterObj + "txtSubmit").value

    if (StrVal == "Save") {
        returnValue=1
        if ($get(MasterObj + "txtValidate").value == "1")
            SetMsg($get(MasterObj + "txtAlert").value)
        else
            alert($get(MasterObj + "txtAlert").value)
    }
    $get(MasterObj + "txtAlert").value = ""
    $get(MasterObj + "txtSubmit").value = ""
}

function PageLoad() {
    if ($get(MasterObj + "txtXmlMember").value != "") { //EditMode
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + "txtXmlMember").value)
        var xmlNodes = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/ReportRecipent")
        if (xmlNodes.length > 0)
            for (var i = 0; i < xmlNodes.length; i++)
                addRowreciever(xmlNodes.item(i).selectSingleNode("MemberID").text,
             xmlNodes.item(i).selectSingleNode("Name").text,
             xmlNodes.item(i).selectSingleNode("MemberCode").text)
    
    }
} 
function OnclickSelectAllChk(obj) {
    var OGrid = document.getElementById("reciever");
    var oLen = OGrid.rows.length

    for (var i = 0; i < oLen; i++) {
        OGrid.rows(i).cells(0).firstChild.checked = obj.checked
    }
}
function OnClickBtnSelect() {

    var strOptions = ""
    var url = ""
    var OUserFlag

    if (document.getElementById(MasterObj + "rdbPersonel").checked) {
        OUserFlag = "P"
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtCompanyID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    //                  else if (document.getElementById(MasterObj + "RadGroup").checked) {

    //                      OUserFlag = "G"
    //                      url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtCompanyID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
    //                      strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    //                  }
    //                  else if (document.getElementById(MasterObj + "RadRole").checked) {

    //                      OUserFlag = "D"
    //                      url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtCompanyID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
    //                      strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    //                  }

    //-------------------------------------------------------
    var OSelectedMamber = "";

    if (url != "") {
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
        CreateGridreciever(OSelectedMamber);
}
function CreateGridreciever(OSelectedMamber) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(OSelectedMamber)
    var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb")
    if (xmlNodes.length > 0) 
        for (var i = 0; i < xmlNodes.length; i++)
            addRowreciever(xmlNodes.item(i).selectSingleNode("PID").text,
             xmlNodes.item(i).selectSingleNode("PName").text,
             xmlNodes.item(i).selectSingleNode("PCode").text)
}
function addRowreciever(MemberID, MemberName,MemberCode) {
    var oGrid = reciever;
    for (var j = 0; j < oGrid.rows.length; j++) {
        if (oGrid.rows(j).cells(1).innerText == MemberID) {
            oGrid.rows(j).cells(0).firstChild.checked = true
            return;
        }
    }
    var oRow = oGrid.insertRow();

    if ((oGrid.rows.length - 1) % 2 == 0)
        oRow.className = "CssItemStyle"
    else
        oRow.className = "CssAlternatingItemStyle";
    oRow.setAttribute("MemberID", MemberID)
    var oCell0 = oRow.insertCell();
    oCell0.innerHTML = "<INPUT type='checkbox'  checked />";
    oCell0.className = "XTabTable";
    oCell0.style.width = "25px"
    oCell0.align = "center"

    var oCell1 = oRow.insertCell();
    oCell1.innerText = MemberCode;
    oCell1.style.width = "60px"
    oCell1.align = "center";

    var oCell2 = oRow.insertCell();
    oCell2.innerText = ((MemberName.length > 30) ? MemberName.substring(0, 25) + "..." : MemberName);
    oCell2.title = MemberName;
    oCell2.style.width = "250px"
    oCell2.align = "center";

    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
    picTitle = "پرسنل"
    var oCell3 = oRow.insertCell();
    oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
    oCell3.className = "XTabTable";
    oCell3.style.width = "40px"
    oCell3.align = "center"
}
function OnChangeCmbReport(obj) {
    document.getElementById(MasterObj + "txtSubmit").value = "GetParam"
    document.getElementById(MasterObj + "BtnSubmit2").click()
}
function onkeypressDate(obj) {
    //برای وارد کردن اعداد
    var key = window.event.keyCode
    window.event.returnValue = (
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) || (key == 191) || (key == 47) || (key == 111) ||
			((key >= 35) && (key <= 40)))
}
function OnClickBtnSchedule() {
    url = "/FrmPresentation/App_Pages/BaseInfo/Scheduling/Scheduling.aspx?SessionID="
        + document.getElementById(MasterObj + "txtSessionID").value
        + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
        + "&SchedulingID=" + $get(MasterObj + "txtSchedulingID").value
        + "&Mode=ReportPolicy"
    var rv = window.showModalDialog(encodeURI(url), '', 'dialogHeight: 770px;dialogWidth:800px;center: Yes;help: no;status: no')
    if (rv != undefined && rv != "" && rv != 0)
        document.getElementById(MasterObj + "txtSchedulingID").value = rv
}
function OnClickBtnNew() {
    document.getElementById(MasterObj + "txtSchedulingID").value = 0
    document.getElementById(MasterObj + "txtName").value = ""
    document.getElementById(MasterObj + "txtDescr").innerText = ""
    document.getElementById(MasterObj + "cmbReport").value = 0
    document.getElementById(MasterObj + "txtPolicyID").value=0
    ClearGrd(document.getElementById(MasterObj + "GrdParameter"))
    ClearGrd(document.getElementById("reciever"))
}
function ClearGrd(oGrd) {
    if (oGrd != null) {
        var len = oGrd.rows.length
        for (var i = 0; i < len; i++)
            oGrd.deleteRow(0)
    }
}
function OnClickBtnSave() {
    if (document.getElementById(MasterObj + "txtName").value == "") {
        alert('لطفا نام سياست گزاري را وارد کنيد')
        return

    }
    if (document.getElementById(MasterObj + "txtName").value == "") {
        alert('لطفا شرح را وارد کنيد')
        return

    }
    if (document.getElementById(MasterObj + "cmbReport").value == 0) {
        alert('لطفا گزارش مورد نظر را انتخاب کنيد')
        return

    }
    if (document.getElementById(MasterObj + "txtSchedulingID").value == "" || document.getElementById(MasterObj + "txtSchedulingID").value == "0") {

        alert('لطفا زمانبندي گزارش را تعيين کنيد')
        return

    }
    var strSave = '<Root><Tb>'
    strSave += '<ID>' + document.getElementById(MasterObj + "txtPolicyID").value + '</ID>'
    strSave += '<Name>' + document.getElementById(MasterObj + "txtName").value + '</Name>'
    strSave += '<Desc>' + document.getElementById(MasterObj + "txtDescr").innerText + '</Desc>'
    strSave += '<RepID>' + document.getElementById(MasterObj + "cmbReport").value + '</RepID>'
    strSave += '<SchID>' + document.getElementById(MasterObj + "txtSchedulingID").value + '</SchID>'
    strSave += '<OnlineUser>' + document.getElementById(MasterObj + "txtOnLineUser").value + '</OnlineUser>'
    strSave += '</Tb>'
    var oGrdParam = document.getElementById(MasterObj + "GrdParameter"), len = 0, value = "";

    if (oGrdParam != null) {
        len = oGrdParam.rows.length
        for (var i = 1; i < len; i++) {
            strSave += '<Params>'
            strSave += '<RptParamID>' + oGrdParam.rows(i).getAttribute("RptParamID") + '</RptParamID>'
            strSave += '<TmpParameterID>' + oGrdParam.rows(i).getAttribute("TmpParameterID") + '</TmpParameterID>'

            if (oGrdParam.rows(i).cells(2).firstChild && oGrdParam.rows(i).cells(2).firstChild.value != "" 
            && oGrdParam.rows(i).cells(2).firstChild.value != "0" && oGrdParam.rows(i).cells(2).firstChild.value !="انتخاب نشده") {
                value = oGrdParam.rows(i).cells(2).firstChild.value
            }
            else if (oGrdParam.rows(i).cells(1).firstChild.firstChild && oGrdParam.rows(i).cells(1).firstChild.firstChild.tagName == "INPUT")//CheckBox
            {
                if (oGrdParam.rows(i).cells(1).firstChild.firstChild.checked)
                    value = 1
                else
                    value = 0
            }
            else if (oGrdParam.rows(i).cells(1).firstChild) {
                value = oGrdParam.rows(i).cells(1).firstChild.value
            }
//            else if (oGrdParam.rows(i).cells(3).firstChild && oGrdParam.rows(i).cells(3).firstChild.value != "" && oGrdParam.rows(i).cells(3).firstChild.value != "0") {
//                value = oGrdParam.rows(i).cells(3).firstChild.value
//                Type = "Code"
//            }

            strSave += '<Value>' + value + '</Value>'
            strSave += '</Params>'
        }
    }
    else {
        alert('لطفا پارامترهاي گزارش را مشخص کنيد')
        return
    }
    
    oGrdParam = document.getElementById("reciever"), len = oGrdParam.rows.length,haveData=0;
    if (len>0) {

        for (var i = 0; i < len; i++) {
            if (oGrdParam.rows(i).cells(0).firstChild.checked == "true" || oGrdParam.rows(i).cells(0).firstChild.checked==true)
            {
                strSave += '<Member>'
                strSave += '<MemberID>' + oGrdParam.rows(i).getAttribute("MemberID") + '</MemberID>'
                strSave += '<Type>P</Type>'
                strSave += '</Member>'
                haveData = 1
            }
        }
    }
    if (document.getElementById(MasterObj + "rdbCreator").checked == 'true' || document.getElementById(MasterObj + "rdbCreator").checked == true) {
        strSave += '<Member>'
        strSave += '<MemberID>' + $get(MasterObj + "txtOnLineUser").value + '</MemberID>'
        strSave += '<Type>P</Type>'
        strSave += '</Member>'
        haveData = 1
    }
    if( haveData !=1) {
        alert('لطفا دريافت کنندگان را مشخص کنيد')
        return
    }
    strSave += '</Root>'

    document.getElementById(MasterObj + "txtSaveXml").value = strSave
    document.getElementById(MasterObj + "txtSubmit").value = "Save"
    document.getElementById(MasterObj + "BtnSubmit").click()

}
function OnClickBtnPreview() {
    var strUrl = "ReportShow.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CompanyID=" + $get(MasterObj + "txtCompanyID").value
                            + "&MenuItemID=" + $get(MasterObj + "txtMenuItemID").value
    strUrl += GenerateRequest()
    var retValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 1400px;dialogWidth:1400px;center: Yes;help: no;status: no')
}
function GenerateRequest() {
 var oGrdParam = document.getElementById(MasterObj + "GrdParameter"), len = 0, value = "", strParams="";
 if (oGrdParam != null) {
     len = oGrdParam.rows.length
     for (var i = 1; i < len; i++) {
         value = "";

         if (oGrdParam.rows(i).cells(2).firstChild && oGrdParam.rows(i).cells(2).firstChild.value != ""
            && oGrdParam.rows(i).cells(2).firstChild.value != "0" && oGrdParam.rows(i).cells(2).firstChild.value != "انتخاب نشده") {
             value = oGrdParam.rows(i).cells(2).firstChild.value
         }
         else if (oGrdParam.rows(i).cells(1).firstChild.firstChild && oGrdParam.rows(i).cells(1).firstChild.firstChild.tagName == "INPUT")//CheckBox
         {
             if (oGrdParam.rows(i).cells(1).firstChild.firstChild.checked)
                 value = 1
             else
                 value = 0
         }
         else if (oGrdParam.rows(i).cells(1).firstChild) {
             value = oGrdParam.rows(i).cells(1).firstChild.value
         }
         if (value!="")
             strParams += "&" + oGrdParam.rows(i).getAttribute("Name") + "=" + OfferedParamValue(oGrdParam.rows(i), value)
     }
 }
 return strParams;
}
function OfferedParamValue(oRow,value) {
    switch (value) {
        case "@BeginDayOfMonth":
            return oRow.getAttribute("BeginDayOfMonth")
            break;
        case "@EndDayOfMonth":
            return oRow.getAttribute("EndDayOfMonth")
            break;
        case "@CurrentPeriod":
            return oRow.getAttribute("CurrentPeriod")
            break;
        case "@Today":
            return oRow.getAttribute("Today")
            break;
        case "@Yesterday":
            return oRow.getAttribute("Yesterday")
            break;
        case "@PrePeriod":
            return oRow.getAttribute("PrePeriod")
        default:
            return value;
            break;
    }
}