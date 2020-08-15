<%@ Page Title="---------------------------------------------------------------------------------------انتخاب مشمولين/ غير مشمولين--------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="ScriptGroups.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptGroups"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; ">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptGroups.aspx" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        $get(MasterObj + "txtSubmit").value = "";
                        if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
                            document.getElementById('OToolBar_BtnOk').style.display = "none"
                            document.getElementById('Table2').style.display = "none"
                            document.getElementById('OToolBar_BtnSelect').style.display = "none"
                            var oGrid = ScriptGroups;
                            ScriptGroups_Header.rows(0).cells(0).style.display = "none"
                            for (var j = 0; j < oGrid.rows.length; j++)
                                oGrid.rows(j).cells(0).style.display = "none"
                        }
                    }
                </script>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;height: 100%;">
                    <tr>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 50%; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">مشمولين</legend>
                                <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0" style="height: 100%;">
                                    <tr>
                                        <td valign="top" style="width: 50%">
                                            <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkAllPK" onclick='OnClickchkAllPK(this)' type="checkbox" runat="server" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            کليه پرسنل
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkEPK" runat="server" onclick='OnClickchkEPK(this)' type="checkbox" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل زير مجموعه
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDD">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDC">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbCard" runat="server" name="GroupChk" type="radio"  onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            نمايش کارتهای متفرقه رستوران
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="TDT">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbOfficeTb" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            دفتر تابل
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="center" style="width: 50%">
                                            <table id="ScriptGroups_Header" style="width: 275px;">
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
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td valign="top">
                                                        <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; vertical-align: top"
                                                            align="right">
                                                            <table align="center" id="ScriptGroups" style="width: 275px;">
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 50%; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">غير مشمولين</legend>
                                <table id="Table3" cellspacing="0" cellpadding="0" align="center" border="0" style="height: 100%;">
                                    <tr>
                                        <td valign="top">
                                            <table id="Table4" cellspacing="1" cellpadding="1" border="0">
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkAllPK1" onclick='OnClickchkAllPK1(this)' type="checkbox" runat="server"/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            کليه پرسنل
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkEPK1" runat="server" onclick='OnClickchkEPK1(this)'  type="checkbox" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل زير مجموعه
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDD1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDC1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbCard1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            نمايش کارتهای متفرقه رستوران
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="Tr1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbOfficeTb1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            دفتر تابل
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="ScriptGroups_Header1" style="width: 275px;">
                                                <tr>
                                                    <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                        <input id="chkAll1" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                            type="checkbox" />
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        شماره
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; vertical-align: top"
                                                align="right">
                                                <table align="center" id="ScriptGroups1" style="width: 275px;">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width: 500" align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtSDate" runat="server" />
                                    <asp:HiddenField ID="txtEDate" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtScriptGroupXML" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtScriptID" runat="server" />
                    <input type="text" id="txtXML" runat="server" />
                    <input type="text" id="txtTypeView" runat="server" />
                    <input type="text" id="txtSystem" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        returnValue = "";
        var strChk = "";
        var grd = 0;
        BindScriptGroups();
        if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
            document.getElementById('OToolBar_BtnOk').style.display = "none"

            document.getElementById('TDP').style.display = "none"
            document.getElementById('TDG').style.display = "none"
            document.getElementById('TDD').style.display = "none"

            document.getElementById('TDP1').style.display = "none"
            document.getElementById('TDG1').style.display = "none"
            document.getElementById('TDD1').style.display = "none"

            $get(MasterObj + "chkAllPK").disabled = "disabled"
            $get(MasterObj + "chkEPK").disabled = "disabled"
            $get(MasterObj + "chkAllPK1").disabled = "disabled"
            $get(MasterObj + "chkEPK1").disabled = "disabled"
            document.getElementById('OToolBar_BtnSelectScriptGroups').style.display = "none"
            var oGrid = ScriptGroups;
            ScriptGroups_Header.rows(0).cells(0).style.display = "none"
            for (var j = 0; j < oGrid.rows.length; j++)
                oGrid.rows(j).cells(0).style.display = "none"
            var oGrid1 = ScriptGroups1;
            ScriptGroups_Header1.rows(0).cells(0).style.display = "none"
            for (var j = 0; j < oGrid1.rows.length; j++)
                oGrid1.rows(j).cells(0).style.display = "none"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindScriptGroups() {
            if ((document.getElementById(MasterObj + "txtScriptGroupXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtScriptGroupXML").value != "")) {
                var strXml = document.getElementById(MasterObj + "txtScriptGroupXML").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroups[kind=0]");
                var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1[kind=0]");

                var len = oXmlNodes.length
                var len1 = oXmlNodes1.length
                if (len1 > 0) {
                    for (var i = 0; i < len1; i++) {
                        if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "AllPK")
                            if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                                document.getElementById(MasterObj + "chkAllPK").checked = true
                            else
                                document.getElementById(MasterObj + "chkAllPK").checked = false

                            if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "EPK")
                                if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                                    document.getElementById(MasterObj + "chkEPK").checked = true
                                else
                                    document.getElementById(MasterObj + "chkEPK").checked = false
                            }
                        }
                        //-----------------------------------------------

                        if (len > 0) {
                            for (var y = 0; y < len; y++) {
                                var MemberID, MemberName, type;
                                MemberID = oXmlNodes.item(y).selectSingleNode("GroupID").text;
                                MemberName = oXmlNodes.item(y).selectSingleNode("GroupName").text;
                                type = oXmlNodes.item(y).selectSingleNode("Type").text;
                                var oGrid = ScriptGroups;
                                
                                addRow(MemberID, MemberName, type, 0)
                            }
                        }
                        var oXmlNodesN = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroups[kind=1]");
                        var oXmlNodes1N = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1[kind=1]");

                        var len = oXmlNodesN.length
                        var len1 = oXmlNodes1N.length
                        if (len1 > 0) {
                            for (var i = 0; i < len1; i++) {
                                if (oXmlNodes1N.item(i).selectSingleNode("Acronym").text == "AllPK")
                                    if (oXmlNodes1N.item(i).selectSingleNode("Value").text == "1")
                                        document.getElementById(MasterObj + "chkAllPK1").checked = true
                                    else
                                        document.getElementById(MasterObj + "chkAllPK1").checked = false

                                    if (oXmlNodes1N.item(i).selectSingleNode("Acronym").text == "EPK")
                                        if (oXmlNodes1N.item(i).selectSingleNode("Value").text == "1")
                                            document.getElementById(MasterObj + "chkEPK1").checked = true
                                        else
                                            document.getElementById(MasterObj + "chkEPK1").checked = false
                                    }
                                }
                                //-----------------------------------------------

                                if (len > 0) {
                                    for (var y = 0; y < len; y++) {
                                        var MemberID, MemberName, type;
                                        MemberID = oXmlNodesN.item(y).selectSingleNode("GroupID").text;
                                        MemberName = oXmlNodesN.item(y).selectSingleNode("GroupName").text;
                                        type = oXmlNodesN.item(y).selectSingleNode("Type").text;
                                        var oGrid = ScriptGroups1;
                                        
                                        addRow(MemberID, MemberName, type, 1)
                                    }
                                }
                            }
                            if ($get(MasterObj + "chkEPK1").checked == true) {
                                $get(MasterObj + "chkAllPK1").checked = false;
                                $get(MasterObj + "chkAllPK1").disabled = true;
                            }
                            if ($get(MasterObj + "chkEPK").checked == true) {
                                $get(MasterObj + "chkAllPK").checked = false;
                                $get(MasterObj + "chkAllPK").disabled = true;
                            }
                                
                            if ($get(MasterObj + "chkAllPK1").checked == true) {

                                $get(MasterObj + "rdbDepartment1").checked = false;
                                $get(MasterObj + "rdbGroup1").checked = false;
                                $get(MasterObj + "rdbPerson1").checked = false;
                                $get(MasterObj + "rdbCard1").checked = false;
                                $get(MasterObj + "rdbOfficeTb1").checked = false;
                                $get(MasterObj + "chkEPK1").checked = false;
                                
                                $get(MasterObj + "rdbDepartment1").disabled = true;
                                $get(MasterObj + "rdbGroup1").disabled = true;
                                $get(MasterObj + "rdbPerson1").disabled = true;
                                $get(MasterObj + "rdbCard1").disabled = true;
                                $get(MasterObj + "rdbOfficeTb1").disabled = true;
                                $get(MasterObj + "chkEPK1").disabled = true;


                            }
                            if ($get(MasterObj + "chkAllPK").checked == true) {

                                $get(MasterObj + "rdbDepartment").checked = false;
                                $get(MasterObj + "rdbGroup").checked = false;
                                $get(MasterObj + "rdbPerson").checked = false;
                                $get(MasterObj + "rdbCard").checked = false;
                                $get(MasterObj + "rdbOfficeTb").checked = false;
                                $get(MasterObj + "chkEPK").checked = false;

                                $get(MasterObj + "rdbDepartment").disabled = true;
                                $get(MasterObj + "rdbGroup").disabled = true;
                                $get(MasterObj + "rdbPerson").disabled = true;
                                $get(MasterObj + "rdbCard").disabled = true;
                                $get(MasterObj + "rdbOfficeTb").disabled = true;
                                $get(MasterObj + "chkEPK").disabled = true;
                            }
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickBtnSelectScriptGroups() {
                            var strOptions = ""
                            var url = ""
                            var OUserFlag
                            var kind = 0
                            if ((document.getElementById(MasterObj + "rdbPerson").checked)&&(grd==0)) {
                                
                                OUserFlag = "U"
                                kind = 0
                                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
                            }
                            else if ((document.getElementById(MasterObj + "rdbGroup").checked)&&(grd==0)) {
                                
                                OUserFlag = "G"
                                kind = 0
                                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
                            }
                            else if ((document.getElementById(MasterObj + "rdbDepartment").checked)&&(grd==0)) {
                                
                                OUserFlag = "D"
                                kind = 0
                                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
                            }

                            else if ((document.getElementById(MasterObj + "rdbCard").checked) && (grd == 0)) {
                                
                                OUserFlag = "C"
                                kind = 0
                                url = "/RstPresentation/App_Pages/OtherCard/SelectOtherCard.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
                            }

                            //------------------------دفتر تابل------------------------------
                            else if ((document.getElementById(MasterObj + "rdbOfficeTb").checked)&&(grd==0)) {
                                
                                OUserFlag = "T"
                                kind = 0
                                url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
                            }
                            else if (document.getElementById(MasterObj + "rdbPerson1").checked) {
                                
                                OUserFlag = "U"
                                kind = 1
                                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
                            }
                            else if ((document.getElementById(MasterObj + "rdbGroup1").checked)&&(grd==1)) {
                                
                                OUserFlag = "G"
                                kind = 1
                                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
                            }
                            else if ((document.getElementById(MasterObj + "rdbDepartment1").checked)&&(grd==1)) {
                                
                                OUserFlag = "D"
                                kind = 1
                                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
                            }
                            else if ((document.getElementById(MasterObj + "rdbCard1").checked) && (grd == 1)) {
                                
                                OUserFlag = "C"
                                kind = 1
                                url = "/RstPresentation/App_Pages/OtherCard/SelectOtherCard.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
                            }
                            //------------------------دفتر تابل------------------------------
                            else if ((document.getElementById(MasterObj + "rdbOfficeTb1").checked)&&(grd==1)) {
                                
                                OUserFlag = "T"
                                kind = 1
                                url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                                strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
                            }
                            //-------------------------------------------------------------------
                            //-------------------------------------------------------
                            var OSelectedMamber = "";

                            if (url != "") {
                                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                                url = ""
                            }
                            
                            if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
                                CreateGrid(OSelectedMamber, OUserFlag, kind);
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function CreateGrid(OSelectedMamber, Type, kind) {
                            //        alert(Type)
                            if ((Type == "D"))
                                OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length)

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(OSelectedMamber)

                            var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")

                            if (xmlNodesTemp.length > 0) {
                                for (var i = 0; i < xmlNodesTemp.length; i++) {
                                    var MemberID, MemberName;
                                    switch (Type) {
                                        case 'U':
                                            MemberID = xmlNodesTemp.item(i).selectSingleNode('PCode').text;
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


                                        case 'C':
                                            MemberID = xmlNodesTemp.item(i).selectSingleNode('CardCode').text;
                                            MemberName = xmlNodesTemp.item(i).selectSingleNode('DisplayName').text;
                                            break
                                            //------------------------دفتر تابل------------------------------
                                        case 'T':
                                            MemberID = xmlNodesTemp.item(i).selectSingleNode('TID').text;
                                            MemberName = xmlNodesTemp.item(i).selectSingleNode('TName').text;
                                            break
                                            //---------------------------------------------------------------------------

                                    }
                                    
                                    addRow(MemberID, MemberName, Type, kind)

                                    addXML(MemberID, Type, kind)
                                }
                            }
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function addXML(MemberID, Type, kind) {
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);

                            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + MemberID + " and type='" + Type + "' and kind='" + kind + "']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                strChk += "<TbCode>"
                                strChk += "<CodeID>" + MemberID + "</CodeID>"
                                strChk += "<type>" + Type + "</type>"
                                strChk += "<kind>" + kind + "</kind>"
                                strChk += "<Selected>1</Selected>"

                                strChk += "</TbCode>"
                            }

                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function addRow(MemberID, MemberName, type, kind) {
                            var oGrid
                            if (kind == 0)
                                oGrid = ScriptGroups;
                            else
                                oGrid = ScriptGroups1;
                            for (var j = 0; j < oGrid.rows.length; j++) {
                                if (oGrid.rows(j).cells(1).innerText == MemberID) {
                                    oGrid.rows(j).cells(0).firstChild.checked = true
                                    return;
                                }
                            }
                            var oRow = oGrid.insertRow();
                            oRow.setAttribute("type", type) //ControlRuleMemberID


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
                            oCell2.style.width = "150px"
                            oCell2.align = "center";

                            var tempSrc = "";
                            var picTitle = "";
                            switch (type) {
                                case "U":
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

                                case "C":
                                    tempSrc = "../../App_Utility/Images/Icons/Restore.gif"
                                    picTitle = "کارتهای متفرقه"
                                    break

                                    // ------------------------دفتر تابل------------------------------
                                case "T":
                                    tempSrc = "../../App_Utility/Images/Icons/Group.gif"
                                    picTitle = "دفترتابل"
                                    break

                            }
                            var oCell3 = oRow.insertCell();
                            oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
                            oCell3.className = "XTabTable";
                            oCell3.style.width = "60px"
                            oCell3.align = "center"

                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickBtnCancel() {
                            window.close()
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickBtnOk() {
                            returnValue = strChk;
//                                      alert(strChk)
                            window.close();
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickchkEPK(obj) {
                            if ($get(MasterObj + "chkEPK").checked == true) {
//                                $get(MasterObj + "rdbDepartment").disabled = true;
//                                $get(MasterObj + "rdbGroup").disabled = true;
//                                $get(MasterObj + "rdbPerson").disabled = true;
                                $get(MasterObj + "chkAllPK").disabled = true;
//                                $get(MasterObj + "rdbCard").disabled = true;
//                                //------------------------دفتر تابل------------------------------
//                                $get(MasterObj + "rdbOfficeTb").disabled = true;
//                                //------------------------------------------------
//                                $get(MasterObj + "rdbDepartment").checked = false;
//                                $get(MasterObj + "rdbGroup").checked = false;
//                                $get(MasterObj + "rdbPerson").checked = false;
                                $get(MasterObj + "chkAllPK").checked = false;
//                                $get(MasterObj + "rdbCard").checked = false;
                                //------------------------دفتر تابل------------------------------
//                                $get(MasterObj + "rdbOfficeTb").checked = false;
                                //-----------------------------------------
                            }
                            else {
                                $get(MasterObj + "rdbDepartment").disabled = false;
                                $get(MasterObj + "rdbGroup").disabled = false;
                                $get(MasterObj + "rdbPerson").disabled = false;
                                $get(MasterObj + "chkAllPK").disabled = false;
                                $get(MasterObj + "rdbCard").disabled = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb").disabled = false;
                                //--------------------------------------------------
                            }
                            //========================================================
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);
                            var oXmlNodes
                            if (obj.id == MasterObj + "chkEPK")
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='0']");
                            else
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='1']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                if (obj.checked == true)
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                else
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                strChk += "<TbCode>";
                                strChk += "<CodeID>EPK</CodeID>";
                                strChk += "<type>0</type>";
                                if (obj.id == MasterObj + "chkEPK")
                                    strChk += "<kind>0</kind>";
                                else
                                    strChk += "<kind>1</kind>";
                                if (obj.checked == false)
                                    strChk += "<Selected>0</Selected>";
                                else
                                    strChk += "<Selected>1</Selected>";

                                strChk += "</TbCode>";

                            }
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!4444444
                        function OnClickchkEPK1(obj) {
                            if ($get(MasterObj + "chkEPK1").checked == true) {
//                                $get(MasterObj + "rdbDepartment1").disabled = true;
//                                $get(MasterObj + "rdbGroup1").disabled = true;
//                                $get(MasterObj + "rdbPerson1").disabled = true;
                                $get(MasterObj + "chkAllPK1").disabled = true;
//                                $get(MasterObj + "rdbCard1").disabled = true;
//                                //------------------------دفتر تابل------------------------------
//                                $get(MasterObj + "rdbOfficeTb1").disabled = true;
//                                //------------------------------------------------
//                                $get(MasterObj + "rdbDepartment1").checked = false;
//                                $get(MasterObj + "rdbGroup1").checked = false;
//                                $get(MasterObj + "rdbPerson1").checked = false;
                                $get(MasterObj + "chkAllPK1").checked = false;
//                                $get(MasterObj + "rdbCard1").checked = false;
//                                //------------------------دفتر تابل------------------------------
//                                $get(MasterObj + "rdbOfficeTb1").checked = false;
//                                //-----------------------------------------
                            }
                            else {
                                $get(MasterObj + "rdbDepartment1").disabled = false;
                                $get(MasterObj + "rdbGroup1").disabled = false;
                                $get(MasterObj + "rdbPerson1").disabled = false;
                                $get(MasterObj + "chkAllPK1").disabled = false;
                                $get(MasterObj + "rdbCard1").disabled = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb1").disabled = false;
                                //--------------------------------------------------
                            }
                            //========================================================
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);
                            var oXmlNodes
                            if (obj.id == MasterObj + "chkEPK")
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='0']");
                            else
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='1']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                if (obj.checked == true)
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                else
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                strChk += "<TbCode>";
                                strChk += "<CodeID>EPK</CodeID>";
                                strChk += "<type>0</type>";
                                if (obj.id == MasterObj + "chkEPK")
                                    strChk += "<kind>0</kind>";
                                else
                                    strChk += "<kind>1</kind>";
                                if (obj.checked == false)
                                    strChk += "<Selected>0</Selected>";
                                else
                                    strChk += "<Selected>1</Selected>";

                                strChk += "</TbCode>";
                            }

                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickchkAllPK(obj) {

                            if ($get(MasterObj + "chkAllPK").checked == true) {
                                $get(MasterObj + "rdbDepartment").disabled = true;
                                $get(MasterObj + "rdbGroup").disabled = true;
                                $get(MasterObj + "rdbPerson").disabled = true;
                                $get(MasterObj + "chkEPK").disabled = true;
                                $get(MasterObj + "rdbCard").disabled = true;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb").disabled = true;
                                //----------------------------------------------
                                $get(MasterObj + "rdbDepartment").checked = false;
                                $get(MasterObj + "rdbGroup").checked = false;
                                $get(MasterObj + "rdbPerson").checked = false;
                                $get(MasterObj + "chkEPK").checked = false;
                                $get(MasterObj + "rdbCard").checked = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb").checked = false;
                                //-----------------------------------------------
                            }
                            else {
                                $get(MasterObj + "rdbDepartment").disabled = false;
                                $get(MasterObj + "rdbGroup").disabled = false;
                                $get(MasterObj + "rdbPerson").disabled = false;
                                $get(MasterObj + "chkEPK").disabled = false;
                                $get(MasterObj + "rdbCard").disabled = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb").disabled = false;
                                //---------------------------------------------
                            }

                           //========================================================
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);
                            var oXmlNodes;
                            if (obj.id == MasterObj + "chkAllPK")
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='0']");
                            else
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='1']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                if (obj.checked == true)
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                else
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                
                                strChk += "<TbCode>";
                                strChk += "<CodeID>AllPK</CodeID>";
                                strChk += "<type>0</type>";
                                if (obj.id == MasterObj + "chkAllPK")
                                    strChk += "<kind>0</kind>";
                                else
                                    strChk += "<kind>1</kind>";
                                if (obj.checked == false)
                                    strChk += "<Selected>0</Selected>";
                                else
                                    strChk += "<Selected>1</Selected>";

                                strChk += "</TbCode>";
                                var oGrid = document.getElementById("ScriptGroups");
                                
                                var oLen = oGrid.rows.length;
                                for (var i = 0; i < oLen; i++) {
                                    oGrid.rows(i).cells(0).firstChild.checked = false;
                                    OnClickChk(oGrid.rows(i).cells(0).firstChild);
                                }
                            }
                            
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickchkAllPK1(obj) {

                            if ($get(MasterObj + "chkAllPK1").checked == true) {
                                $get(MasterObj + "rdbDepartment1").disabled = true;
                                $get(MasterObj + "rdbGroup1").disabled = true;
                                $get(MasterObj + "rdbPerson1").disabled = true;
                                $get(MasterObj + "chkEPK1").disabled = true;
                                $get(MasterObj + "rdbCard1").disabled = true;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb1").disabled = true;
                                //----------------------------------------------
                                $get(MasterObj + "rdbDepartment1").checked = false;
                                $get(MasterObj + "rdbGroup1").checked = false;
                                $get(MasterObj + "rdbPerson1").checked = false;
                                $get(MasterObj + "chkEPK1").checked = false;
                                $get(MasterObj + "rdbCard1").checked = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb1").checked = false;
                                //-----------------------------------------------
                            }
                            else {
                                $get(MasterObj + "rdbDepartment1").disabled = false;
                                $get(MasterObj + "rdbGroup1").disabled = false;
                                $get(MasterObj + "rdbPerson1").disabled = false;
                                $get(MasterObj + "chkEPK1").disabled = false;
                                $get(MasterObj + "rdbCard1").disabled = false;
                                //------------------------دفتر تابل------------------------------
                                $get(MasterObj + "rdbOfficeTb1").disabled = false;
                                //---------------------------------------------
                            }

                            //========================================================
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);
                            var oXmlNodes
                            if (obj.id == MasterObj + "chkAllPK")
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='0']");
                            else
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='1']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                if (obj.checked == true)
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                else
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                strChk += "<TbCode>";
                                strChk += "<CodeID>AllPK</CodeID>";
                                strChk += "<type>0</type>";
                                if (obj.id == MasterObj + "chkAllPK")
                                    strChk += "<kind>0</kind>";
                                else
                                    strChk += "<kind>1</kind>";
                                if (obj.checked == false)
                                    strChk += "<Selected>0</Selected>";
                                else
                                    strChk += "<Selected>1</Selected>";
                                strChk += "</TbCode>";

                                var oGrid = document.getElementById("ScriptGroups1");

                                var oLen = oGrid.rows.length;
                                for (var i = 0; i < oLen; i++) {
                                    oGrid.rows(i).cells(0).firstChild.checked = false;
                                    OnClickChk(oGrid.rows(i).cells(0).firstChild);
                                }
                            }

                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickHeaderChk(obj) {
                            var OGrid = document.getElementById("ScriptGroups");

                            if (obj.id == "chkAll1")
                                OGrid = document.getElementById("ScriptGroups1");

                            var oLen = OGrid.rows.length
                            for (var i = 0; i < oLen; i++) {
                                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                                OnClickChk(OGrid.rows(i).cells(0).firstChild);
                            }
                        }
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        function OnClickChk(obj) {

                            var oGrid = obj.parentElement;
                            while (oGrid.tagName != "TABLE")
                                oGrid = oGrid.parentElement

                            var oRow = obj.parentElement;
                            while (oRow.tagName != "TR")
                                oRow = oRow.parentElement
                            var oIndex = oRow.rowIndex
                            //========================================================
                            var strXml = "<Root>" + strChk + "</Root>"

                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML(strXml);
                            var oXmlNodes
                            if (oGrid.id == "ScriptGroups")
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='0']");
                            else
                                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='1']");
                            //========================================================
                            if (oXmlNodes.length > 0) {
                                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                                else
                                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                                strXml = oXmlDoc.xml;
                                strChk = strXml.replace("<Root>", "");
                                strChk = strChk.replace("</Root>", "");
                            }
                            else {
                                strChk += "<TbCode>"
                                strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
                                strChk += "<type>" + oGrid.rows(oIndex).type + "</type>"
                                if (oGrid.id == "ScriptGroups")
                                    strChk += "<kind>0</kind>"
                                else
                                    strChk += "<kind>1</kind>"
                                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                                    strChk += "<Selected>0</Selected>"
                                else
                                    strChk += "<Selected>1</Selected>"

                                strChk += "</TbCode>"
                            }

                        }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                        function OnClickrdb(obj) {
                            grd = 0;
            if ($get(MasterObj + "rdbDepartment").checked == true || $get(MasterObj + "rdbGroup").checked == true
               || $get(MasterObj + "rdbPerson").checked == true || $get(MasterObj + "rdbCard").checked == true || $get(MasterObj + "rdbOfficeTb").checked == true) {
//                $get(MasterObj + "chkEPK").checked = false;
                $get(MasterObj + "chkAllPK").checked = false;
                $get(MasterObj + "chkAllPK").disabled = true;
                
            }
//            else {
//                $get(MasterObj + "chkEPK").checked = true;
//                $get(MasterObj + "chkAllPK").checked = true;
//            }           
        }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickrdb1(obj) {
            grd = 1;
           if ($get(MasterObj + "rdbDepartment1").checked == true || $get(MasterObj + "rdbGroup1").checked == true
               || $get(MasterObj + "rdbPerson1").checked == true || $get(MasterObj + "rdbCard1").checked == true || $get(MasterObj + "rdbOfficeTb1").checked == true) {
//               $get(MasterObj + "chkEPK1").checked = false;
               $get(MasterObj + "chkAllPK1").checked = false;
               $get(MasterObj + "chkAllPK1").disabled = true;
            }
//            else {
//                $get(MasterObj + "chkEPK1").checked = true;
//                $get(MasterObj + "chkAllPK1").checked = true;
//            }           
        }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
