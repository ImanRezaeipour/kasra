<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeBehind="CreditReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.CreditReport" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .fieldsetStyle
        {
            width: 1080px;
            height: 60px;
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid;
            border-left: #78BED6 thin outset;
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6;
        }
        .DivStyle
        {
            border: thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            clear: right;
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
        }
    </style>
    <table>
        <tr>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="100%" align="center">
                        <tr>
                            <td>
                                از تاريخ:
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSD" runat="server" />
                            </td>
                            <td>
                                تا تاريخ:
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalED" runat="server" />
                            </td>
                            <td>
                                شماره پرسنلي:
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPersonelInfo" runat="server" />
                            </td>
                            <td style="width:30%">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                گروه مجوز:
                            </td>
                            <td>
                                <asp:DropDownList class="TxtControls" ID="CmbGroup" onchange="OnChangeCmbGroup()"
                                    runat="server" Width="120px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                نوع مجوز:
                            </td>
                            <td>
                                <select id="CmbType" runat="server" name="CmbType" style="width: 150px" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                وضعيت مجوز :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbDocStatus" name="CmbDocStatus" Width="100px" class="TxtControls"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width:30%">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center" width="1080px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <input id="txtAlert" runat="server" type="text" />
                            <input id="txtValidate" runat="server" type="text" />
                            <asp:HiddenField ID="txtMaxNumber" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtSortExpression" runat="server" />
                            <asp:HiddenField ID="txtSortDirection" runat="server" />
                        </div>
                        <div id="DivGrd" runat="server" align="center" class="DivStyle">
                            <cc2:KasraGrid ID="GrdCredit" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="GrdCredit_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input id="txtPersonCode" runat="server" type="text" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input id="txtSDate" name="txtSDate" type="text" runat="server" />
        <input id="txtEDate" name="txtEDate" type="text" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtXMLCredite" name="txtXMLCredite" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
    </div>
    <script>
        var LastSelectedRow = null, LastSelectedRowClass = ""
        //    document.getElementsByTagName("body")[0].scroll = "no";
        window.dir = "RTL";
        OnChangeCmbGroup();
        //====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            var StrVal = $get(MasterObj + "txtSubmit").value
            LastSelectedRow = null
            if (StrVal == "Delete") {
                if ($get(MasterObj + "txtValidate").value == "1")
                    SetMsg($get(MasterObj + "txtAlert").value)
                else
                    alert($get(MasterObj + "txtAlert").value)
            }
            $get(MasterObj + "txtAlert").value = ""
            $get(MasterObj + "txtSubmit").value = ""
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null)
                LastSelectedRow.className = LastSelectedRowClass
            LastSelectedRowClass = SelectedRow.className
            LastSelectedRow = SelectedRow
            SelectedRow.className = "CssSelectedItemStyle"
        }
        //===============================================================================================
        function OnClickBtnFilter() {
            var SD = $get(MasterObj + "KCalSD_txtYear").value + "/" + $get(MasterObj + "KCalSD_txtMonth").value + "/" + $get(MasterObj + "KCalSD_txtDay").value
            if (SD == "//")
                SD = ""
            var ED = $get(MasterObj + "KCalED_txtYear").value + "/" + $get(MasterObj + "KCalED_txtMonth").value + "/" + $get(MasterObj + "KCalED_txtDay").value
            if (ED == "//")
                ED = ""
            if (SD == "" || ED == "")
                return
            if (!compareDate())
                return
            $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "CmbPersonelInfo_txtCode").value.trim();
            $get(MasterObj + "txtSDate").value = SD
            $get(MasterObj + "txtEDate").value = ED
            $get(MasterObj + "txtCreditType").value = $get(MasterObj + "CmbType").value   
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //====================================================================================================================
        function compareDate() {
            var ED = document.getElementById(MasterObj + "KCalED_txtYear").value + document.getElementById(MasterObj + "KCalED_txtMonth").value + document.getElementById(MasterObj + "KCalED_txtDay").value
            var SD = document.getElementById(MasterObj + "KCalSD_txtYear").value + document.getElementById(MasterObj + "KCalSD_txtMonth").value + document.getElementById(MasterObj + "KCalSD_txtDay").value
            if (ED < SD) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else
                return true
        }
        //====================================================================================================================
        function OnChangeCmbGroup() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXMLCredite").value);
            var xmlNodes;
            $get(MasterObj + "CmbType").innerHTML = ""

            var j = 0
            if ($get(MasterObj + "CmbGroup").value != 0 && $get(MasterObj + "CmbGroup").value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGroup").value + "]");
            }
            else {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
            }
            if (xmlNodes.length != 0) {
                if ($get(MasterObj + "CmbGroup").value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbType").options.add(optionEl)
                        $get(MasterObj + "CmbType").all(j).innerText = 'انتخاب همه'
                        $get(MasterObj + "CmbType").all(j).value = '0'
                        j++
                    }
                }
                for (var i = 0; i < xmlNodes.length; ++i) {
                    optionEl = document.createElement("OPTION")
                    $get(MasterObj + "CmbType").options.add(optionEl)
                    $get(MasterObj + "CmbType").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    $get(MasterObj + "CmbType").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++
                }
            }
        }
        //====================================================================================================================
        function OnClickImgFlow(obj) {
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement

            var CreditID = oRow.getAttribute('CreditID')
            var WFDocId = oRow.getAttribute('WFDocId')
            var DocTypeID = oRow.getAttribute('DocTypeID')

            if (DocTypeID == 0 && WFDocId != 0)
                window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no");
            else
                window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
        }
        //====================================================================================================================
        function SetChk() {
            var OGrid = document.getElementById(MasterObj + "GrdCredit");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strChk);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            var oXmlNodesLen = oXmlNodes.length;
            for (var j = 0; j < oXmlNodesLen; j++) {
                for (var i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).DocID == oXmlNodes.item(j).selectSingleNode("CreditID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //====================================================================================================================
    </script>
</asp:Content>
