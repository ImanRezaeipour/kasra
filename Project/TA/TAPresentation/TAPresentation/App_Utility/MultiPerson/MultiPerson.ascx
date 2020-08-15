<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiPerson.ascx.cs" Inherits="TaPresentation.App_Utility.MultiPerson.MultiPerson" %>
<%@ Register src="../ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc1" %>
<link href="combobox.css" type="text/css" rel="stylesheet" />
 <%--ie10--%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<table id="TBMain" IsMainTable="true" runat="server" dir="rtl" align="right" style="height: 20px">
    <tr>
        <td>
            <uc1:ComboBox ID="cmbPerson" runat="server"/>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" "
                style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." onclick="onClickselectPerson()"/><%----%>
        </td>
    </tr>
</table>
<div style="display: none;">
    <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtXml" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtHidden" runat="server"></asp:TextBox>
     <asp:TextBox ID="txtSplitXml" runat="server" ></asp:TextBox>
</div>

<script type="text/javascript" language="javascript">
//=====================================================================================================================
    var ThisIDPerson = null;
    //===========================================OnChange==============================================
//    document.getElementById("ctl00_ContentPlaceHolder1_MuliPerson1_cmbPerson_txtPCode").attachEvent("onchange", onchangecmbPerson);
//    document.getElementById("ctl00_ContentPlaceHolder1_MuliPerson1_cmbPerson_grd").attachEvent("onmousedown", onkeydownDivForGrid);
    $("#ctl00_ContentPlaceHolder1_MuliPerson1_cmbPerson_txtOnChangeFunc").val("onchangecmbPerson()");
   
//    $("#" + MasterObj + "KCalEDate_txtOnChangeFunc").val("onchangeElem()");

    var strXml = ""
    //=========================================onkeydownDivForGrid=========================================================================
    function onkeydownDivForGrid() {

        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDPerson = this.id
        }

        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
            if (document.getElementById(ThisIDPerson + "_txtHidden").value == "") {
                if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                    strXml = "<Root><Tb>"
                    strXml += "<DepartmentID>" + window.event.srcElement.parentElement.cells(0).innerText + "</DepartmentID>"
                    strXml += "<Selected>1</Selected>"
                    strXml += "</Tb></Root>"
                    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                }
                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                    strXml = "<Root><Tb>"
                    strXml += "<GroupId>" + window.event.srcElement.parentElement.cells(0).innerText + "</GroupId>"
                    strXml += "<Selected>1</Selected>"
                    strXml += "</Tb></Root>"
                    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                }
//                 else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
//                    strXml = "<Root><Tb>"
//                    strXml += "<GroupId>" + window.event.srcElement.parentElement.cells(0).innerText + "</GroupId>"
//                    strXml += "<Chk>1</Chk>"
//                    strXml += "</Tb></Root>"
//                    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
//                }
                else {
                    strXml = "<Root><Tb>"
                    strXml += "<PID>" + window.event.srcElement.parentElement.cells(0).innerText + "</PID>"
                    strXml += "<Selected>1</Selected>"
                    strXml += "</Tb></Root>"
                    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                }
            }
        }
    }
    //=========================================onchangecmbPerson=========================================================================
    function onchangecmbPerson() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDPerson = this.id
        }
        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
            if (document.getElementById(ThisIDPerson + "_txtHidden").value == "") {
                if (strXml == "") {
                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                        strXml = "<Root><Tb>"
                        strXml += "<DepartmentID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value + "</DepartmentID>"
                        strXml += "<Selected>1</Selected>"
                        strXml += "</Tb></Root>"
                        document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                    }
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                        strXml = "<Root><Tb>"
                        strXml += "<GroupId>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</GroupId>"
                        strXml += "<Selected>1</Selected>"
                        strXml += "</Tb></Root>"
                        document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                    }
// else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
//     strXml = "<BaseInfoEntity><CodeGroup>"
//     strXml += "<CodeID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</CodeID>"
//     strXml += "<Chk>1</Chk>"
//                        strXml += "</CodeGroup></BaseInfoEntity>"
//                        document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
//                    }
                    else {
                        strXml = "<Root><Tb>"
                        strXml += "<PID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</PID>"
                        strXml += "<Selected>1</Selected>"
                        strXml += "</Tb></Root>"
                        document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                    }
                }
            }
        }
    }
    //========================================onClickselectPerson=================================================
    function onClickselectPerson() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDPerson = this.id
        }
        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
        var strUrl="";
        if (document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value != "") {
            if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                strXml = "<Tb>"
                strXml += "<DepartmentID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value + "</DepartmentID>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb>"
                document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
            }
            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                strXml = "<Root><Tb>"
                strXml += "<GroupId>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</GroupId>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
                document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
            }
//            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
//                strXml = "<BaseInfoEntity><CodeGroup>"
//                strXml += "<CodeID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</CodeID>"
//                strXml += "<Chk>1</Chk>"
//                strXml += "</CodeGroup></BaseInfoEntity>"
//                document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
//            }
            else {
                strXml = "<Root><Tb>"
                strXml += "<PID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</PID>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
                document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
            }
        }
        if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Person") {
            strUrl = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
                + "&txtHidden="
                + "&txtIDParent=" + ThisIDPerson + "_txtHidden";
        }
//        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
//            strUrl = "/TAPresentation/App_Pages/BaseInfo/CodeSelector.aspx?Type=MultiCode"
//                        + "&SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
//                               + "&CodeVlue=" + document.getElementById(ThisIDPerson + "_txtHidden").value
//        }
        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
             + "&txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value
        }
        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
            var strUrl = "/TAPresentation/App_Utility/MultiDepartment/MultiDepartment1.aspx?txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value + "&SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDPerson + "_txtGetCompanyFinatialPeriodID").value;
        }
               strUrl = encodeURI(strUrl)
               var rValue = window.showModalDialog(strUrl, window, 'dialogHeight: 1000px;dialogWidth: 1000px;center: Yes;help: no;status: no')
//               alert(rValue)
               if ((rValue != undefined) && (rValue != "")) {
//        alert(strXml)
                strXml = rValue;
                if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department")
                  strXml="<Root>"+strXml+"</Root>"
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
//                if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code")
//                alert(1)
//                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CodeGroup");
//                else
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                //=====================================================================
                if (oXmlNodes.length == 1) {
                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                        document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                    }
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                        document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("GroupId").text
                    }
// else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
//                        document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("CodeID").text
//                    }
                    else
                        document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("PID").text
                } else if (oXmlNodes.length != 1)
                    document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = ""
                document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value = ""
                document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = ""
                document.getElementById(ThisIDPerson + "_txtHidden").value = rValue
                var endFor = oXmlNodes.length;
                document.getElementById(ThisIDPerson + "_txtXml").value = ""
                for (var i = 0; i < endFor; i++) {
                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                        document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_txtXml").value + oXmlNodes.item(i).selectSingleNode('DepartmentID').text + ",";
                    }
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                        document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_txtXml").value + oXmlNodes.item(i).selectSingleNode('GroupId').text + ",";
                    }
                    //else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Code") {
                    //                        document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_txtXml").value + oXmlNodes.item(i).selectSingleNode('CodeID').text + ",";
                    //                    }
                    else
                        document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_txtXml").value + oXmlNodes.item(i).selectSingleNode('PID').text + ",";
                }

                (document.getElementById(ThisIDPerson + "_txtXml").value) = (document.getElementById(ThisIDPerson + "_txtXml").value).substr(document.getElementById(ThisIDPerson + "_txtXml").value, parseInt((document.getElementById(ThisIDPerson + "_txtXml").value).length) - 1)
//                alert(document.getElementById(ThisIDPerson + "_txtXml").value)
                           }
        }
}
    //===============================================F_GetUserControlID============================================================================
    function F_GetUserControlID(obj) {
        // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 

        try {
            var strUserControlID = "";
            var iCounter = 0;

            while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                obj = obj.parentElement;

            }
            if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
                strUserControlID = obj.UserControlID;

            }
            return strUserControlID;
        }
        catch (e) {
        }
    }
</script>
