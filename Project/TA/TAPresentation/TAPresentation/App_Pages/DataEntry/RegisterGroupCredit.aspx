<%@ Page Title="------------------------------------------------------ثبت مجوزهای گروهی------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"  AutoEventWireup="true" CodeBehind="RegisterGroupCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RegisterGroupCredit" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
        .Img
        {
            cursor: pointer;
        }
        .fieldsetStyle
        {
            width: 620px; 
            height:90px;
            border-right: lightblue thin inset;
            border-top: lightblue thin solid;
            border-left: lightblue thin outset;
            border-bottom: lightblue thin solid;
            background-color: #EAF0F7
        }
        .legendStyle
        {
            color: #75A3D0;
        }
       .DivStyle
        {
             scrollbar-highlight-color: white; 
             overflow: auto; width: 100%;
             scrollbar-arrow-color: black; 
             scrollbar-base-color: #b0c4de; 
             height: 180px;
        }
        .SelectPerson
        {
            width: 125px;
            height: 29px;
            background-repeat: no-repeat;
            background-color: transparent;
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            border-left: lightsteelblue 2px solid;
            border-bottom: #346fa4 2px solid;
            cursor: pointer;
            background-image: url('/FrmPresentation/App_Utility/Images/Icons/SelectPerson.gif');
        }
     </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<script language="javascript" type="text/javascript">

    </script>

    <table align="center" width="93%" class="TableStyle">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" >
                <fieldset dir="rtl" class="fieldsetStyle" >
                    <legend class="legendStyle"></legend>
                    <table width="100%" align="center">
                        <tr>
                            <td colspan="4">
                                <table >
                                    <tr>
                                        <td style="width: 75px">
                                            از تاريخ :
                                        </td>
                                        <td>
                                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                                        </td>
                                        <td style="width: 70px">
                                        </td>
                                        <td style="width: 57px">
                                            از ساعت :
                                        </td>
                                        <td>
                                            <input id="txtSTime" type="text" class="TxtControls" style="width: 80px" runat="server"
                                                onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtSTime()" onkeydown="OnKeyDownTime(this)" />
                                        </td>
                                        <td>
                                            <input id="RdDaily" name="RdDaily" type="radio" runat="server" onclick="OnChangeCmbGrdGroupCode()" />روزانه
                                        </td>
                                        <td>
                                            <input id="RdHourly" name="RdDaily" type="radio" runat="server" onclick="OnChangeCmbGrdGroupCode()" />ساعتی
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 65px">
                                تا تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td>
                                تا ساعت :
                            </td>
                            <td>
                                <input id="txtETime" type="text" class="TxtControls" style="width: 80px" runat="server"
                                    onblur="Timechk(this);onBlurtxtETime()" value="00:00" onfocus="OnFocuseTxtETime()"
                                    onkeydown="OnKeyDownTime(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 65px">
                                گروه مجوز :
                            </td>
                            <td>
                             <asp:DropDownList class="TxtControls" ID="CmbGroupCode" onchange="OnChangeCmbGrdGroupCode()"
                                    runat="server" Width="145px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                نوع مجوز :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList class="TxtControls" ID="CmbCreditType" runat="server" Width="145px">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شرح :
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                                    Height="50px" Width="520px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtValidate" runat="server" />
                                        <br />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">انتخاب مشمولين مجوز</legend>
                    <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                        <tr>
                            <td valign="top">
                                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                    <tr>
                                        <td style="width: 22px" align="center">
                                            <input id="chkAllPK" type="checkbox" runat="server" />
                                            <%-- onclick='OnClickchkAllPK(this)'--%>
                                        </td>
                                        <td>
                                            <div align="right">
                                                کليه پرسنل
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 22px" align="center">
                                            <input id="chkEPK" runat="server" type="checkbox" />
                                            <%-- onclick='OnClickchkEPK(this)'--%>
                                        </td>
                                        <td>
                                            <div align="right">
                                                پرسنل زير مجموعه
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="TDD">
                                        <td style="width: 22px" align="center">
                                            <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                                        </td>
                                        <td style="width: 160px">
                                            <div align="right">
                                                واحد سازماني
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="TDG">
                                        <td style="width: 22px" align="center">
                                            <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                        </td>
                                        <td>
                                            <div align="right">
                                                گروه خاص
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="TDP">
                                        <td style="width: 22px" align="center">
                                            <input id="rdbPerson" runat="server" name="GroupChk" type="radio" checked />
                                        </td>
                                        <td>
                                            <div align="right">
                                                پرسنل خاص
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" >
                                            <input type="button" runat="server" class="SelectPerson"  id="BtnSelectGroup"
                                                onclick="OnClickBtnSelectGroup()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 219px" valign="top" align="center">
                                <table id="ScriptGroups_Header" style="width: 300px;">
                                    <tr>
                                        <td class="CssHeaderStyle" style="width: 25px" align="center">
                                            <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                type="checkbox" name="chkAll">
                                        </td>
                                        <td align="center" class="CssHeaderStyle" style="width: 60px">
                                            شماره
                                        </td>
                                        <td align="center" class="CssHeaderStyle" style="width: 150px">
                                            نام
                                        </td>
                                        <td align="center" class="CssHeaderStyle" style="width:90px">
                                            نوع
                                        </td>
                                    </tr>
                                </table>
                                <div style="width: 300px; height:150px; scrollbar-highlight-color: white; overflow: auto;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                    <table align="center" id="ScriptGroups" style="width: 275px;">
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>

    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtstrParam" name="txtstrParam" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtCreditMemberXML" name="txtCreditMemberXML" runat="server" />
         <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
    </div>
<script type="text/javascript" language="javascript" >
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    var strChk = "<Root></Root>"
    BindScriptGroups();
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function BindScriptGroups() {
        if (($get(MasterObj + "txtCreditMemberXML").value != "<DataEntryEntity/>") && ($get(MasterObj + "txtCreditMemberXML").value != "")) {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtCreditMemberXML").value);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GetGroupCredit");
            var len = oXmlNodes.length
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    var MemberID = oXmlNodes.item(i).selectSingleNode("MID").text;
                    var MemberName = oXmlNodes.item(i).selectSingleNode("MName").text;
                    var Type = oXmlNodes.item(i).selectSingleNode("Type").text;
                    addRow(MemberID, MemberName, Type)
                    addXML(MemberID, MemberName, Type)
                }
            }
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnSelectGroup() {
        var strOptions = ""
        var url = ""
        var OUserFlag
        if (document.getElementById(MasterObj + "rdbPerson").checked) {
            OUserFlag = "P"
            url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
            strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
        }
        else if (document.getElementById(MasterObj + "rdbGroup").checked) {
            OUserFlag = "G"
            url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
            strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
        }
        else if (document.getElementById(MasterObj + "rdbDepartment").checked) {
            OUserFlag = "D"
            url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
            strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
        }
        //-------------------------------------------------------
        var OSelectedMamber = "";
        if (url != "") {
            OSelectedMamber = window.showModalDialog(url, "", strOptions)
            url = ""
        }
        if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
            CreateGrid(OSelectedMamber, OUserFlag);
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function CreateGrid(OSelectedMamber, Type) {
        if (Type == "D")
            OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length)
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(OSelectedMamber)
        var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")
        var xmlNodesTempLen = xmlNodesTemp.length;
        if (xmlNodesTempLen > 0) {
            for (var i = 0; i < xmlNodesTempLen; i++) {
                var MemberID, MemberName;
                switch (Type) {
                    case 'P':
                        MemberID = xmlNodesTemp.item(i).selectSingleNode('PID').text;
                        MemberName = xmlNodesTemp.item(i).selectSingleNode('PName').text;
                        break

                    case 'G':
                        MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                        MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                        break

                    case 'D':

                        MemberID = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                        MemberName = xmlNodesTemp.item(i).selectSingleNode('DName').text;
                        break
                }
                addRow(MemberID, MemberName, Type)
                addXML(MemberID, MemberName, Type)
            }
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function addXML(MemberID, MemberName, Type) {
        var str = "";
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strChk);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID=" + MemberID + " and Type='" + Type + "']");
        //========================================================
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            strChk = oXmlDoc.xml;
        }
        else {
            str += "<Tb>";
            str += "<MID>" + MemberID + "</MID>"
            str += "<MName>" + MemberName + "</MName>"
            str += "<Type>" + Type + "</Type>"
            str += "</Tb>";
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<Root>" + str + "</Root>")
            var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
            oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
            strChk = oXmlDoc.xml;
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function addRow(MemberID, MemberName, Type) {
        var oGrid = ScriptGroups;
        var len = oGrid.rows.length;
        for (var j = 0; j < len; j++) {
            if (oGrid.rows(j).cells(1).innerText == MemberID) {
                oGrid.rows(j).cells(0).firstChild.checked = true
                return;
            }
        }
        var oRow = oGrid.insertRow();
        oRow.setAttribute("Type", Type)
        if ((oGrid.rows.length - 1) % 2 == 0)
            oRow.className = "CssItemStyle"
        else
            oRow.className = "CssAlternatingItemStyle";
        var oCell0 = oRow.insertCell();
        oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)'  checked />";
        oCell0.className = "XTabTable";
        oCell0.style.width = "25px"
        oCell0.align = "center"

        var oCell1 = oRow.insertCell();
        oCell1.innerText = MemberID;
        oCell1.style.width = "60px"
        oCell1.align = "center";

        var oCell2 = oRow.insertCell();
        oCell2.innerText = ((MemberName.length > 30) ? MemberName.substring(0, 25) + "..." : MemberName);
        oCell2.title = MemberName;
        oCell2.style.width = "160px"
        oCell2.align = "right";

        var tempSrc = "";
        var picTitle = "";
        switch (Type) {
            case "P":
                tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                picTitle = "پرسنل"
                break
            case "G":
                tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                picTitle = "گروه"
                break
            case "D":
                tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                picTitle = "واحدسازماني"
                break
        }
        var oCell3 = oRow.insertCell();
        oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
        oCell3.className = "XTabTable";
        oCell3.style.width = "70px"
        oCell3.align = "center"
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnOk() {
        window.returnValue = strChk;
        window.close();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickchkEPK(obj) {
        var strTemp = "";
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strChk);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='EPK' and Type='0']");
        //========================================================
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            strChk = oXmlDoc.xml;
        }
        else {
            strTemp += "<Tb>"
            strTemp += "<MID>EPK</MID>"
            strTemp += "<Type>0</Type>"
            strTemp += "</Tb>"
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
            var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
            oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
            strChk = oXmlDoc.xml;
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickchkAllPK(obj) {
        var strTemp = "";
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strChk);
        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID='AllPK' and Type='0']");
        //========================================================
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            strChk = oXmlDoc.xml;
        }
        else {
            strChk += "<Tb>"
            strChk += "<MID>AllPK</MID>"
            strChk += "<Type>0</Type>"
            strChk += "</Tb>"
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
            var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
            oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
            strChk = oXmlDoc.xml;
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickHeaderChk(obj) {
        var OGrid = document.getElementById("ScriptGroups");
        var oLen = OGrid.rows.length
        for (var i = 0; i < oLen; i++) {
            OGrid.rows(i).cells(0).firstChild.checked = obj.checked
            OnClickChk(OGrid.rows(i).cells(0).firstChild);
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickChk(obj) {
        var oGrid = obj.parentElement;
        var strTemp = "";
        while (oGrid.tagName != "TABLE")
            oGrid = oGrid.parentElement
        var oRow = obj.parentElement;
        while (oRow.tagName != "TR")
            oRow = oRow.parentElement
        var oIndex = oRow.rowIndex
        //========================================================
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strChk);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ MID=" + oGrid.rows(oIndex).cells(1).innerText + " and Type='" + oGrid.rows(oIndex).Type + "']");
        //========================================================
        if (oXmlNodes.length > 0) {
            var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
            strChk = oXmlDoc.xml;
        }
        else {
            strTemp += "<Tb>"
            strTemp += "<MID>" + oGrid.rows(oIndex).cells(1).innerText + "</MID>"
            strTemp += "<Type>" + oGrid.rows(oIndex).Type + "</Type>"
            strTemp += "</Tb>"
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML("<Root>" + strTemp + "</Root>")
            var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
            oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
            strChk = oXmlDoc.xml;

        }

    }
    //================================================================================
    function OnChangeCmbGrdGroupCode() {
        if ($get(MasterObj + "RdDaily").checked == true) {
            $get(MasterObj + "txtSTime").disabled = true;
            $get(MasterObj + "txtETime").disabled = true;
            $get(MasterObj + "txtSTime").value = "";
            $get(MasterObj + "txtETime").value = "";
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = false;
            $get(MasterObj + "KCalEDate_btnImg").disabled = false;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = false;
        }
        else if ($get(MasterObj + "RdHourly").checked == true) {
            $get(MasterObj + "txtSTime").disabled = false;
            $get(MasterObj + "txtETime").disabled = false;
            $get(MasterObj + "KCalEDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDate_btnImg").disabled = true;
            $get(MasterObj + "KCalEDate_btnCalender").disabled = true;
        }
        $get(MasterObj + "txtstrParam").value = "<Root><CodePermission><Flag></Flag><GroupCodeID>" + $get(MasterObj + "CmbGroupCode").value + "</GroupCodeID><PersonCode>" + $get(MasterObj + "txtOnLineUser").value + "</PersonCode><SDate></SDate><EDate></EDate><OnLineUserID>" + $get(MasterObj + "txtOnLineUser").value + "</OnLineUserID><ISDaily>" + $get(MasterObj + "RdDaily").checked + "</ISDaily><ISTimly>" + $get(MasterObj + "RdHourly").checked + "</ISTimly></CodePermission></Root>"
        $get(MasterObj + "txtSubmit").value = "GetCodePermision";
        $get(MasterObj + "BtnSubmit").click();

    }
    //================================================================================
    function OnFocuseTxtSTime() {
        document.getElementById(MasterObj + "txtSTime").select()
    }
    //================================================================================
    function OnFocuseTxtETime() {
        document.getElementById(MasterObj + "txtETime").select();
    }
    //================================================================================
    function onBlurtxtETime() {
        if (document.getElementById(MasterObj + "txtSTime").value == "00:00" && document.getElementById(MasterObj + "txtETime").value == "00:00")
            document.getElementById(MasterObj + "RdDaily").checked = true;
    }
    //================================================================================
</script>
</asp:Content>


