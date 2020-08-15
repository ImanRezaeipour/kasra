<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="NewGrid.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.NewGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_"
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
           
        }
        function EndRequestHandler(sender, args) {
           
        }
    </script>
<div dir="rtl"  style="width: 100%; height: 100%;" >
        <table dir="rtl" style="width: 100%; height: 100%;"  >
            <tr>
                <td id="tdFilter" style="height: 50px">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:PlaceHolder ID="PHFilter" runat="server"></asp:PlaceHolder>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="height: 30px">
                    <div style="width: 90%">
                        <uc1:ToolBar ID="OToolBar" Paging="0" runat="server" PageName="Template.aspx" PageID="11121" />
                    </div>
                </td>
            </tr>
            <tr>
                <td id="tdGrid" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                         
                            <div id="DivGrd" style="width: 900px; height: 350px; margin-bottom: 0; scrollbar-highlight-color: white;
                                overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;"
                                dir="ltr">
                                <asp:PlaceHolder ID="GridViewPlaceHolder"  runat="server"></asp:PlaceHolder></div>
                         <div style="display:none;" dir="rtl">
                                <asp:PlaceHolder ID="ExcelGridPlaceHolder" runat="server"></asp:PlaceHolder>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div id="divHidden" style="display: none">
                                <asp:TextBox ID="txtRptID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtReportID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
                                <input type="text" runat="server" id="txtSessionID" name="txtSessionID" />
                                <input type="text" runat="server" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" />
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtXmlParamInfo" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtSubmit" runat="server"></asp:TextBox>
                                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                    runat="server" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                                <asp:TextBox ID="txtXmlFilter" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtMenuItemID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtPageID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtGridID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtGridName" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtTemplateID" runat="server"></asp:TextBox>
                                <asp:TextBox ID="lblFrom" runat="server" />
                                <asp:TextBox ID="lblTo" runat="server" />
                                <asp:TextBox ID="lblTotalpage" runat="server" />
                                <asp:TextBox ID="lblCurPage" runat="server" />
                                <asp:TextBox ID="lblTotal" runat="server" />
                                <asp:TextBox ID="txtPageSize" runat="server" />
                                <asp:TextBox ID="txtPageNumber" runat="server" />
                                <asp:TextBox ID="txtXmlAdvanceParameter" runat="server" />
                                <asp:TextBox ID="txtStrAdvanceField" runat="server" />
                                <asp:TextBox ID="txtXmlExcelParam" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" Height="26px" OnClick="BtnSubmit_Click" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div style="display: none;">
                        <asp:Button ID="BtnSendSubmit" runat="server" Text="BtnSendSubmit" Height="26px"
                            OnClick="BtnSendSubmit_Click" />
                        <cc1:MySecurity ID="OnLineUserSec" runat="server">
                        </cc1:MySecurity>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script language="javascript" type="text/javascript">
        window.name = "ReportShow"
        aspnetForm.target = "ReportShow"
        document.dir = "RTL"
        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if (document.getElementById(MasterObj + 'BtnPrv') != null) {
            document.getElementById(MasterObj + 'BtnPrv').disabled = true;
            document.getElementById(MasterObj + 'txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById(MasterObj + 'txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById(MasterObj + 'txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById(MasterObj + 'txtCurPage').value = $get(MasterObj + "lblCurPage").value;
            document.getElementById(MasterObj + 'txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
            if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) == parseInt(document.getElementById(MasterObj + "txtTotalPage").value))
                document.getElementById(MasterObj + 'BtnNext').disabled = true
            else
                document.getElementById(MasterObj + 'BtnNext').disabled = false;
            //        document.getElementById('OToolBar_BtnPrv').disabled = true;
            //        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            //        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            //        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            //        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "lblCurPage").value;
            //        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
            //        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
            //            document.getElementById('OToolBar_BtnNext').disabled = true
            //        else
            //            document.getElementById('OToolBar_BtnNext').disabled = false;
        }
        if (document.getElementById(MasterObj + "txtSubmit").value == "ModalFilter") {
            OnClickBtnFilter()
        }
        //        DivGrd.style.height = window.screen.availHeight - 150 + 10 + "px";
        //        DivGrd.style.width = window.screen.availWidth - 10 + "px"
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function OnBlurtxtCurPage() {
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value.replace(" ", "");
            var TotalPage = parseInt(document.getElementById(MasterObj + "txtTotalPage").value);
            if (document.getElementById(MasterObj + "txtCurPage").value != "" &&
                        document.getElementById(MasterObj + "txtCurPage").value != "0") {
                if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "lblCurPage").value = document.getElementById(MasterObj + "txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            //            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            //            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
            //                        document.getElementById("OToolBar_txtCurPage").value != "0") {
            //                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            //                    document.getElementById(MasterObj + "lblCurPage").value = document.getElementById("OToolBar_txtCurPage").value
            //                }
            //                document.getElementById(MasterObj + "txtSubmit").value = "Const";
            //                document.getElementById(MasterObj + "BtnSubmit").click();
            //            }
        }
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnExcel() {
            var StrExcelParam = "<Root>"
            if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAdvanceParameter").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

                if (xmlNodes.length != 0) {
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        StrExcelParam += "<Tb>"
                        StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                        StrExcelParam += "<Type>A</Type>"
                        StrExcelParam += "</Tb>"
                    }
                }
            }
            if (document.getElementById(MasterObj + 'txtXmlFilter').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlFilter").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

                if (xmlNodes.length != 0) {
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        StrExcelParam += "<Tb>"
                        StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                        StrExcelParam += "<Type>N</Type>"
                        StrExcelParam += "</Tb>"
                    }
                }
            }
            StrExcelParam += "</Root>"
            document.getElementById(MasterObj + "txtXmlExcelParam").value = StrExcelParam
            document.getElementById(MasterObj + "txtSubmit").value = "Excel";
            document.getElementById(MasterObj + "BtnSendSubmit").click();
        }
        function OnClickBtnPDF() {
            var StrExcelParam = "<Root>"
            if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAdvanceParameter").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')
                if (xmlNodes.length != 0) {
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        StrExcelParam += "<Tb>"
                        StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                        StrExcelParam += "<Type>A</Type>"
                        StrExcelParam += "</Tb>"
                    }
                }
            }
            if (document.getElementById(MasterObj + 'txtXmlFilter').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlFilter").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')

                if (xmlNodes.length != 0) {
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        StrExcelParam += "<Tb>"
                        StrExcelParam += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        StrExcelParam += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        StrExcelParam += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                        StrExcelParam += "<Type>N</Type>"
                        StrExcelParam += "</Tb>"
                    }
                }
            }
            StrExcelParam += "</Root>"
            document.getElementById(MasterObj + "txtXmlExcelParam").value = StrExcelParam
            document.getElementById(MasterObj + "txtSubmit").value = "PDF";
            document.getElementById(MasterObj + "BtnSendSubmit").click();
        }
        function OnClickBtnAdvanceFilter() {
            document.getElementById(MasterObj + "txtStrAdvanceField").value = "";
            document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = "";
            var url = "AdvanceFilter.aspx?ReportID=" + document.getElementById(MasterObj + "txtReportID").value + " &OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUserID").value + " &MenuItemID=" + document.getElementById(MasterObj + "txtMenuItemID").value + " &SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            var StrFilter = window.showModalDialog(url, "", "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: yes")
            if (StrFilter != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(StrFilter)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Tb')
                var Str = ""
                if (xmlNodes.length != 0) {
                    Str += "<Root>"
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        Str += "<Tb>"
                        Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        Str += "<Size>" + xmlNodes.item(i).selectSingleNode('Size').text + "</Size>"
                        Str += "<DefaultValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</DefaultValue>"
                        Str += "<AdvanceParameter>" + xmlNodes.item(i).selectSingleNode('AdvanceParameter').text + "</AdvanceParameter>"
                        Str += "<Editable>" + xmlNodes.item(i).selectSingleNode('Editable').text + "</Editable>"
                        Str += "<IntVal>" + xmlNodes.item(i).selectSingleNode('IntVal').text + "</IntVal>"
                        Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                        Str += "<Name>" + xmlNodes.item(i).selectSingleNode('Name').text + "</Name>"
                        Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                        Str += "<TypeAcronym>" + xmlNodes.item(i).selectSingleNode('TypeAcronym').text + "</TypeAcronym>"
                        Str += "<DisplayTypeID>" + xmlNodes.item(i).selectSingleNode('DisplayTypeID').text + "</DisplayTypeID>"
                        Str += "<DisplayTypeAcronym>" + xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text + "</DisplayTypeAcronym>"
                        Str += "<LookupName>" + xmlNodes.item(i).selectSingleNode('LookupName').text + "</LookupName>"
                        Str += "<LookupValue>" + xmlNodes.item(i).selectSingleNode('LookupValue').text + "</LookupValue>"
                        Str += "<LookupParam>" + xmlNodes.item(i).selectSingleNode('LookupParam').text + "</LookupParam>"
                        Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('RValue').text + "</RValue>"
                        Str += "</Tb>"
                    }
                    Str += "</Root>"
                    document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = Str
                }
                var oXmlDocf = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocf.async = "false";
                oXmlDocf.loadXML(StrFilter)
                var xmlNodesf = oXmlDocf.documentElement.selectNodes('/Root/Fields')
                if (xmlNodesf.length != 0) {
                    document.getElementById(MasterObj + "txtStrAdvanceField").value = xmlNodesf.item(0).selectSingleNode('Condition').text
                }
            }
        }
        function OnClickBtnFilter() {
            var Str = ""
            if ($get(MasterObj + 'txtXmlParamInfo').value != "") {
                Str = "<Root>"
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlParamInfo').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')
                if (xmlNodes.length != 0) {
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        Str += "<Tb>"
                        Str += "<RptParamID>" + xmlNodes.item(i).selectSingleNode('RptParamID').text + "</RptParamID>"
                        Str += "<Caption>" + xmlNodes.item(i).selectSingleNode('Caption').text + "</Caption>"
                        // Str += "<Size>" + xmlNodes.item(i).selectSingleNode('Size').text + "</Size>"
                        //                        Str += "<DefaultValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</DefaultValue>"
                        //                        Str += "<AdvanceParameter>" + xmlNodes.item(i).selectSingleNode('AdvanceParameter').text + "</AdvanceParameter>"
                        //                        Str += "<Editable>" + xmlNodes.item(i).selectSingleNode('Editable').text + "</Editable>"
                        //                        Str += "<IntVal>" + xmlNodes.item(i).selectSingleNode('IntVal').text + "</IntVal>"
                        Str += "<TmpParameterID>" + xmlNodes.item(i).selectSingleNode('TmpParameterID').text + "</TmpParameterID>"
                        //                        Str += "<Name>" + xmlNodes.item(i).selectSingleNode('Name').text + "</Name>"
                        Str += "<Type>" + xmlNodes.item(i).selectSingleNode('Type').text + "</Type>"
                        //                        Str += "<TypeAcronym>" + xmlNodes.item(i).selectSingleNode('TypeAcronym').text + "</TypeAcronym>"
                        //                        Str += "<DisplayTypeID>" + xmlNodes.item(i).selectSingleNode('DisplayTypeID').text + "</DisplayTypeID>"
                        //                        Str += "<DisplayTypeAcronym>" + xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text + "</DisplayTypeAcronym>"
                        //                        Str += "<LookupName>" + xmlNodes.item(i).selectSingleNode('LookupName').text + "</LookupName>"
                        //                        Str += "<LookupValue>" + xmlNodes.item(i).selectSingleNode('LookupValue').text + "</LookupValue>"
                        //                        Str += "<LookupParam>" + xmlNodes.item(i).selectSingleNode('LookupParam').text + "</LookupParam>"
                        switch (xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text) {
                            case "ComboBox":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
                                break;
                            case "PersonCombo":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
                                break;
                            case "KasraDate":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value + "</RValue>"

                                    if (xmlNodes.item(i).selectSingleNode('Name').text == "StartDate" || xmlNodes.item(i).selectSingleNode('Name').text == "SDate") {
                                        document.getElementById(MasterObj + 'SDate').value = document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value
                                    }

                                    if (xmlNodes.item(i).selectSingleNode('Name').text == "EndDate" || xmlNodes.item(i).selectSingleNode('Name').text == "EDate") {
                                        document.getElementById(MasterObj + 'EDate').value = document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value
                                    }
                                }
                                else
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                                break;
                            case "CodeCondition":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value != "")
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value + "</RValue>"
                                else
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"

                                break;
                            case "Label":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
                                break;
                            case "OnLineUser":
                                //                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                                //                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                                //                                }
                                //                                else {
                                Str += "<RValue>" + document.getElementById(MasterObj + "txtOnLineUserID").value + "</RValue>"
                                //                                }
                                break;
                            case "TextBox":
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
                                break;
                            case "CheckBox":
                                if (xmlNodes.item(i).selectSingleNode('LookupName').text == "") {
                                    if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).checked) {
                                        Str += "<RValue>1</RValue>"
                                    }
                                    else {
                                        Str += "<RValue>0</RValue>"
                                    }
                                }
                                break;
                            default:
                                Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                break;
                        }
                        Str += "</Tb>"
                    }
                }
                Str += "</Root>"
            }
            else {
                Str = "<Root><Tb></Tb></Root>"
            }
            document.getElementById(MasterObj + 'txtXmlFilter').value = Str
            document.getElementById(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtStrAdvanceField").value = "";
            document.getElementById(MasterObj + "txtXmlAdvanceParameter").value = "";
            document.getElementById(MasterObj + 'SDate').value = "";
            document.getElementById(MasterObj + 'EDate').value = "";
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXmlParamInfo').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')
            if (xmlNodes.length != 0) {
                for (var i = 0; i < xmlNodes.length; ++i) {
                    switch (xmlNodes.item(i).selectSingleNode('DisplayTypeAcronym').text) {
                        case "ComboBox":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value = 0;
                            break;
                        case "PersonCombo":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtCode").value = "";
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtName").value = "";
                            break;
                        case "KasraDate":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value = "";
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value = "";
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value = "";
                            break;
                        case "CodeCondition":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtHidden").value = "";
                            break;
                        case "Label":
                            break;
                        case "OnLineUser":
                            break;
                        case "TextBox":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).value = "";
                            break;
                        case "CheckBox":
                            document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).checked = false;
                            break;
                        default:
                            break;
                    }
                }
            }
            OnClickBtnFilter()
        }
        function OnClickBtnDesign() {
            var VarXmlParam;
            if (document.getElementById(MasterObj + "txtXmlFilter").value == "")
                VarXmlParam = "<Root><Tb></Tb></Root>";
            else
                VarXmlParam = document.getElementById(MasterObj + "txtXmlFilter").value;
            var VarXmlAdvanceParam;
            if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value == "")
                VarXmlAdvanceParam = "<Root><Tb></Tb></Root>";
            else
                VarXmlAdvanceParam = document.getElementById(MasterObj + "txtXmlAdvanceParameter").value;
            VarXmlParam = ReplaceAll(VarXmlParam, "<", "(")
            VarXmlParam = ReplaceAll(VarXmlParam, ">", ")")
            VarXmlAdvanceParam = ReplaceAll(VarXmlAdvanceParam, "<", "(")
            VarXmlAdvanceParam = ReplaceAll(VarXmlAdvanceParam, ">", ")")
            var Url = "ReportDesign.aspx?OnlineUserID=" + document.getElementById(MasterObj + "txtOnLineUserID").value
            + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value
            + "&RptID=" + document.getElementById(MasterObj + "txtRptID").value
            + "&XmlParam=" + VarXmlParam
            + "&XmlAdvanceParam=" + VarXmlAdvanceParam
            + "&StrFiledAdvanceFilter=" + document.getElementById(MasterObj + "txtStrAdvanceField").value
            + "&PageNumber=0" //کل داده ها  با 0//+ document.getElementById(MasterObj + "lblCurPage").value
            + "&PageSize=12"
            + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtCompanyFinatialPeriodID").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&Mode=Design"
            StrFilter = window.showModalDialog(encodeURI(Url), window, "dialogWidth:1050px;dialogHeight:750px;center: Yes;resizable:yes;help: no;status:no#1")
        }
        function OnClickBtnPreview() {
            var VarXmlParam;
            if (document.getElementById(MasterObj + "txtXmlFilter").value == "")
                VarXmlParam = "<Root><Tb></Tb></Root>";
            else
                VarXmlParam = document.getElementById(MasterObj + "txtXmlFilter").value;
            var VarXmlAdvanceParam;
            if (document.getElementById(MasterObj + "txtXmlAdvanceParameter").value == "")
                VarXmlAdvanceParam = "<Root><Tb></Tb></Root>";
            else
                VarXmlAdvanceParam = document.getElementById(MasterObj + "txtXmlAdvanceParameter").value;
            VarXmlParam = ReplaceAll(VarXmlParam, "<", "(")
            VarXmlParam = ReplaceAll(VarXmlParam, ">", ")")
            VarXmlAdvanceParam = ReplaceAll(VarXmlAdvanceParam, "<", "(")
            VarXmlAdvanceParam = ReplaceAll(VarXmlAdvanceParam, ">", ")")
            var Url = "ReportDesign.aspx?OnlineUserID=" + document.getElementById(MasterObj + "txtOnLineUserID").value
            + "&ReportID=" + document.getElementById(MasterObj + "txtReportID").value
            + "&RptID=" + document.getElementById(MasterObj + "txtRptID").value
            + "&XmlParam=" + VarXmlParam
            + "&XmlAdvanceParam=" + VarXmlAdvanceParam
            + "&StrFiledAdvanceFilter=" + document.getElementById(MasterObj + "txtStrAdvanceField").value
            + "&PageNumber=0" //کل داده ها  با 0//+ document.getElementById(MasterObj + "lblCurPage").value
            + "&PageSize=12"
            + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtCompanyFinatialPeriodID").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&Mode=View"
            StrFilter = window.showModalDialog(encodeURI(Url), window, "dialogWidth:1050px;dialogHeight:750px;center: Yes;resizable:yes;help: no;status:no#1")
        }
        document.body.attachEvent('onkeyup', OnkeyupBtnDesign)
        document.body.attachEvent('onkeydown', OnkeydownBtnDesign)
        var vpKey, key;
        function OnkeyupBtnDesign() {
            if (window.event.keyCode == 16) vpKey = false;
        }
        function OnkeydownBtnDesign() {
            key = window.event.keyCode
            if (key == 16)
                vpKey = true;
            if (key == 79 && vpKey == true) {
                OnClickBtnDesign()
                vpKey = false
                return false;
            }
        }        
    </script>
</asp:Content>
