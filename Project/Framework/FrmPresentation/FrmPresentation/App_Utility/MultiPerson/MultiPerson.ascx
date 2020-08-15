<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiPerson.ascx.cs" Inherits="FrmPresentation.App_Utility.MultiPerson.MultiPerson" %>
<%@ Register src="../ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc1"  %>  
<link href="combobox.css" type="text/css" rel="stylesheet" />
 <%--ie10--%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<table id="TBMain" IsMainTable="true" runat="server" dir="rtl" align="right" style="height: 20px">
    <tr>
        <td>
            <uc1:ComboBox ID="cmbPerson" runat="server"/>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" 
                style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." onclick="onClickselectPerson()"/><%----%>
        </td>
    </tr>
</table>
<div style="display: none;">
    <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtXml" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtHidden" runat="server" ></asp:TextBox>
    <asp:TextBox ID="txtXmlRq" runat="server" ClientIDMode="Static"></asp:TextBox>
     <asp:TextBox ID="txtSplitXml" runat="server" ></asp:TextBox>
</div>
<script type="text/javascript" language="javascript">
    //=====================================================================================================================
    var ThisIDPerson = null;
    var strXml = ""
    //=========================================onchangecmbPerson=========================================================================
    function onchangecmbPerson(ClientID) {
        ThisIDPerson = ClientID;
        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
            document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value
            if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                strXml = "<Tb>"
                strXml += "<DepartmentID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value + "</DepartmentID>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb>"
                document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value
            }
            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                strXml = "<Root><Tb>"
                strXml += "<GroupId>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</GroupId>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
            }
            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Resturant") {
                strXml = "<Root><Tb>"
                strXml += "<ResturantNo>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</ResturantNo>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
            }
            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "FoodCenter") {
                strXml = "<Root><Tb>"
                strXml += "<FCCode>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</FCCode>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
            }
            else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Structure") {
                strXml = "<Root><Tb>"
                strXml += "<ID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</ID>"
                strXml += "<StrChek>1</StrChek>"
                strXml += "</Tb></Root>"
            }
            else {
                strXml = "<Root><Tb>"
                strXml += "<PID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value + "</PID>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
            }
            document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
        }
    }
    //========================================onClickselectPerson=================================================
    function onClickselectPerson() {
        var rValue = "";
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDPerson = this.id
        }
        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
            var strUrl = "";
            if (document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value != "") {
                if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department")
                    strXml = "<Tb><DepartmentID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value + "</DepartmentID><Selected>1</Selected></Tb>"
                else
                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group")
                        strXml = "<Root><Tb><GroupId>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</GroupId><Selected>1</Selected></Tb></Root>"
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Resturant")
                        strXml = "<Root><Tb><ResturantNo>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</ResturantNo><Selected>1</Selected></Tb></Root>"
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "FoodCenter")
                        strXml = "<Root><Tb><FCCode>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</FCCode><Selected>1</Selected></Tb></Root>"
                    else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Structure")
                        strXml = "<Root><Tb><ID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</ID><StrChek>1</StrChek></Tb></Root>"
                    else
                        strXml = "<Root><Tb><PID>" + document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value + "</PID><Selected>1</Selected></Tb></Root>"

                    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml
                    document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value
                }
                //---------------------------------------------------------------------------
                if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Person") {//باز شدن صفحه انتخاب پرسنل در حالتی که کنترل انتخاب چندین پرسنل مد نظر است
                    strUrl = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
                           + "&txtHidden="
                           + "&txtIDParent=" + ThisIDPerson + "_txtHidden";
                }
                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {//باز شدن صفحه انتخاب گروه در حالتی که کنترل انتخاب چندین گروه مد نظر است
                    var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
             + "&txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value
                }
                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") { //باز شدن صفحه انتخاب واحد سازمانی در حالتی که کنترل انتخاب چندین واحد مد نظر است               

                    var strUrl = "/FrmPresentation/App_Utility/MultiDepartment/MultiDepartment1.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDPerson + "_txtGetCompanyFinatialPeriodID").value + "&ThisIDPerson=" + ThisIDPerson;
                }

                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Resturant") { //باز شدن صفحه انتخاب چندین رستوران در حالتی که کنترل انتخاب چندین رستوران مد نظر است               

                    var strUrl = "/RstPresentation/App_Pages/Resturant/MultiResturant.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDPerson + "_txtGetCompanyFinatialPeriodID").value + "&ThisIDPerson=" + ThisIDPerson + "&txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value;
                    rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight: 300px;dialogWidth: 400px;center: Yes;help: no;status: no');
                }
                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "FoodCenter") { //باز شدن صفحه انتخاب چندین مرکز پخت در حالتی که کنترل انتخاب چندین مرکز پخت مد نظر است               
                    var strUrl = "/RstPresentation/App_Pages/Resturant/MultiFoodCenter.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDPerson + "_txtGetCompanyFinatialPeriodID").value + "&ThisIDPerson=" + ThisIDPerson + "&txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value;
                    rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight:400px;dialogWidth: 400px;center: Yes;help: no;status: no');
                }
                else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Structure") { //باز شدن صفحه انتخاب چندین ساختار در حالتی که کنترل انتخاب چندین ساختار مد نظر است               
                    var strUrl = "/TAPresentation/App_Pages/Schedule/SelectStructure.aspx?SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDPerson + "_txtGetCompanyFinatialPeriodID").value + "&ThisIDPerson=" + ThisIDPerson + "&txtHidden=" + document.getElementById(ThisIDPerson + "_txtHidden").value;
                    rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight:500px;dialogWidth: 400px;center: Yes;help: no;status: no');
                }
                if (rValue == "")
                    rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight: 1000px;dialogWidth: 1000px;center: Yes;help: no;status: no')


                if ((rValue != undefined)) {

                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                        rValue = rValue.replace("<Root>", "");
                        rValue = rValue.replace("</Root>", "");
                        rValue = "<Root>" + rValue + "</Root>"
                    }

                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(rValue);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                    //=====================================================================                        
                    if (oXmlNodes.length > 0) {
                        if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtID").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group") {
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("GroupId").text
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Resturant") {

                            document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("ResturantNo").text
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "FoodCenter") {
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("FCCode").text
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Structure") {
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = oXmlNodes.item(0).selectSingleNode("ID").text
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                        else {

                            document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = (oXmlNodes.item(0).selectSingleNode("PCode") != null && oXmlNodes.item(0).selectSingleNode("PCode") != undefined) ? oXmlNodes.item(0).selectSingleNode("PCode").text : oXmlNodes.item(0).selectSingleNode("PID").text;
                            document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = "چندين انتخاب";
                        }
                    } else if (oXmlNodes.length != 1)
                        document.getElementById(ThisIDPerson + "_cmbPerson_txtCode").value = ""
                    document.getElementById(ThisIDPerson + "_cmbPerson_txtPCode").value = ""
                    document.getElementById(ThisIDPerson + "_cmbPerson_txtName").value = ""
                    if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department") {
                        rValue = rValue.replace("<Root>", "");
                        rValue = rValue.replace("</Root>", "");
                    }
                    document.getElementById(ThisIDPerson + "_txtHidden").value = rValue
                    var endFor = oXmlNodes.length;
                    document.getElementById(ThisIDPerson + "_txtXml").value = ""
                    for (var i = 0; i < endFor; i++) {
                        if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department")
                            document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode('DepartmentID').text;
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group")
                            document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode('GroupId').text;
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Resturant")
                            document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode('ResturantNo').text;
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "FoodCenter")
                            document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode('FCCode').text;
                        else if (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Structure")
                            document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode('ID').text;
                        else {
                            if (oXmlNodes.item(i).selectSingleNode("PCode") != null && oXmlNodes.item(i).selectSingleNode("PCode") != undefined)
                                document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode("PCode").text
                            else
                                document.getElementById(ThisIDPerson + "_txtXml").value += oXmlNodes.item(i).selectSingleNode("PID").text
                        }

                        document.getElementById(ThisIDPerson + "_txtXml").value += ",";
                    }
                    (document.getElementById(ThisIDPerson + "_txtXml").value) = (document.getElementById(ThisIDPerson + "_txtXml").value).substr(document.getElementById(ThisIDPerson + "_txtXml").value, parseInt((document.getElementById(ThisIDPerson + "_txtXml").value).length) - 1)
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

