<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ShiftOverlap.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.ShiftOverlap"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td align="center" style="color: #FF0066">
                            مشخصات مشابه در اين بازه زماني به صورت زير موجود است:
                        </td>
                    </tr>
                    <tr>
                        <td id="GridTD" valign="top" align="center">
                            <table id="xTabTable_header" dir="rtl" border="0" width="550px">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 19px;" align="center">
                                        <img onclick="OnClickSubNodeGroup()" src="../../App_Utility/Images/Icons/btnSubNodes.gif">
                                    </td>
                                    <td class="CssHeaderStyle" align="center">
                                        مشخصات مشابه موجود در بازه زماني
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdGroup" style="display: none">
                                    </td>
                                    <td id="trGroup" style="display: none">
                                        <table id="xTabTable_headeralert" dir="rtl" cellspacing="1" cellpadding="1" border="0">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    ش.پرسنلي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 150px" align="center">
                                                    نام و نام خانوادگي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 120px" align="center">
                                                    نام گروه
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    تاريخ شروع
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    تاريخ خاتمه
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 98%">
                                            <table id="XTabTablealert" align="center" border="1" cellspacing="0" cellpadding="0">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <table id="xTabTable_header1" dir="rtl" border="0" width="550px">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 19px;" align="center">
                                        <img onclick="OnClickSubNodeGroup1()" src="../../App_Utility/Images/Icons/btnSubNodes.gif">
                                    </td>
                                    <td class="CssHeaderStyle" align="center">
                                        مشخصات &nbsp;انتخاب &nbsp;شده جهت&nbsp; ذخيره&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdGroup1" style="display: none">
                                    </td>
                                    <td id="trGroup1" style="display: none">
                                        <table id="xTabTable_headervorody" dir="rtl" cellspacing="1" cellpadding="1" border="0">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    ش.پرسنلي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 150px" align="center">
                                                    نام و نام خانوادگي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 120px" align="center">
                                                    نام گروه
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    تاريخ شروع
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 80px" align="center">
                                                    تاريخ خاتمه
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 98%">
                                            <table id="XTabTablevorody" align="center" border="1" cellspacing="0" cellpadding="0">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                    <input type="text" id="txtOverlapXML" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">

        var oMyObject = window.dialogArguments
        document.getElementById(MasterObj + "txtOverlapXML").value = oMyObject.document.getElementById(MasterObj + "txtOverlapXML").value

        FillTabTable()
        OnClickSubNodeGroup()
        OnClickSubNodeGroup1()
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function FillTabTable() {
            Cleargrd(XTabTablealert)
            Cleargrd(XTabTablevorody)
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            xmlDoc.loadXML(document.getElementById(MasterObj + "txtOverlapXML").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodesalert;
            var xmlNodesvorody;
            var endFor
            var Param
            var x;
            xmlNodesalert = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ModifyEmployeeGroup");
            xmlNodesvorody = xmlDoc.documentElement.selectNodes("/ScheduleEntity/vorody");
            var totalRecords
            if (xmlNodesalert.length != 0) {
                totalRecords = xmlNodesalert.length

                endFor = totalRecords - 1
                for (x = 0; x <= endFor; x++) {
                    Param = '"' + xmlNodesalert.item(x).selectSingleNode('PersonID').text + '","' + xmlNodesalert.item(x).selectSingleNode('PName').text + '","' + xmlNodesalert.item(x).selectSingleNode('GroupName').text + '","' + xmlNodesalert.item(x).selectSingleNode('SDate').text + '","' + xmlNodesalert.item(x).selectSingleNode('EDate').text + '",'
                    AddRow(XTabTablealert, x + 1, Param)
                }
            }
            //----------------
            newrowindex = 0
            if (xmlNodesvorody.length != 0) {
                totalRecords = xmlNodesvorody.length

                endFor = totalRecords - 1
                for (x = 0; x <= endFor; x++) {
                    Param = '"' + xmlNodesvorody.item(x).selectSingleNode('PersonID').text + '","' + xmlNodesvorody.item(x).selectSingleNode('PName').text + '","' + xmlNodesvorody.item(x).selectSingleNode('GroupName').text + '","' + xmlNodesvorody.item(x).selectSingleNode('SDate').text + '","' + xmlNodesvorody.item(x).selectSingleNode('EDate').text + '",'
                    AddRow(XTabTablevorody, x + 1, Param)
                }
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRow(oGrid, cntRow, Param) {
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "XItemStyle";
            var cell
            cell = 0
            var p = new String
            var x = 0

            while (x < getCntChar(',', Param)) {
                p = getArray(Param, x, ',')
                oGrid.rows(newrowindex).insertCell()

                if (cell == 3 || cell == 4) {

                    var d = p.substring(1, p.length - 1)

                    oGrid.rows(newrowindex).cells(cell).innerText = d//d.substring(8, 10) + d.substring(4, 8) + d.substring(0, 4)

                }
                else if (cell == 1 || cell == 2) {

                    var S = p.substring(1, p.length - 1)
                    var val = "", Title = ""
                    if (S.length > 15)
                        val = S.substring(0, 15) + "..."
                    else
                        val = S
                    Title = S

                    oGrid.rows(newrowindex).cells(cell).innerHTML = "<span title='" + Title + "'>" + val + "</span> "
                }
                else {
                    oGrid.rows(newrowindex).cells(cell).innerText = p.substring(1, p.length - 1)
                }
                cell = cell + 1
                x = x + 1

            }
            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "80px"
            oGrid.rows(newrowindex).cells(1).style.width = "150px"
            oGrid.rows(newrowindex).cells(2).style.width = "120px"
            oGrid.rows(newrowindex).cells(3).style.width = "80px"
            oGrid.rows(newrowindex).cells(4).style.width = "80px"
            RestoreStyle(oGrid)
            SetBorderWidthGrid(oGrid)
            newrowindex = newrowindex + 1
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetBorderWidthGrid(objGrid) {
            var i;
            var j;
            for (j = 0; j < objGrid.rows.length; ++j) {
                for (i = 0; i < objGrid.rows(j).cells.length; ++i) {
                    objGrid.rows(j).cells(i).style.borderBottomWidth = "0"
                    objGrid.rows(j).cells(i).style.borderTopWidth = "0"
                    objGrid.rows(j).cells(i).style.borderLeftWidth = "0"
                    objGrid.rows(j).cells(i).style.borderRightWidth = "1"
                    objGrid.rows(j).cells(i).style.borderRightColor = "Gray"
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function RestoreStyle(objGrid) {
            var j;
            var FlagClass;
            var oRowGrid;
            FlagClass = "CssAlternatingItemStyle"
            for (j = 0; j < objGrid.rows.length; ++j) {
                oRowGrid = objGrid.rows(j)
                if (oRowGrid.style.display != 'none') {
                    if (FlagClass == "CssItemStyle") {
                        oRowGrid.className = "CssAlternatingItemStyle"
                        FlagClass = "CssAlternatingItemStyle"
                    }
                    else {
                        oRowGrid.className = "CssItemStyle"
                        FlagClass = "CssItemStyle"
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function OnClickSubNodeGroup() {
            if (document.all.item('tdGroup').style.display == "inline") {
                document.all.item('tdGroup').style.display = 'none'
                document.all.item('trGroup').style.display = 'none'
            }
            else {

                document.all.item('tdGroup').style.display = 'inline'
                document.all.item('trGroup').style.display = 'inline'
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickSubNodeGroup1() {
            if (document.all.item('tdGroup1').style.display == "inline") {
                document.all.item('tdGroup1').style.display = 'none'
                document.all.item('trGroup1').style.display = 'none'
            }
            else {
                document.all.item('tdGroup1').style.display = 'inline'
                document.all.item('trGroup1').style.display = 'inline'
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSetDate() {
            var stralert = "آيا براي تنظيم تاريخ ها و ذخيره مطمئن هستيد!!!"
            //if (confirm(stralert)) {
            returnValue = "1"
            window.close()
            //}
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
