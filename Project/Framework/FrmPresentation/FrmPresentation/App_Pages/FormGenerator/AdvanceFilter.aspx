<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" 
    AutoEventWireup="true" CodeBehind="AdvanceFilter.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.AdvanceFilter" 
    Title="-------------------------------------------------------------------------فيلتر پيشرفته------------------------------------------------------------------------" 
    ValidateRequest="false"%>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register src="../../App_Utility/PersonComboBox/PersonComboBox.ascx" tagname="PersonComboBox" tagprefix="uc4" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_"
        
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            //
            
        }

        function EndRequestHandler(sender, args) {
            //

            
        }

        
        
         
    </script>
    <div>
        
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" Paging="0" runat="server" PageName="AdvanceFilter.aspx" PageID="11160" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" id="tdParam">
                            <asp:PlaceHolder ID="PHParam" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" id="tdField">
                            <asp:PlaceHolder ID="PHField" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <table class="style1">
                                <tr>
                                    <td width="120">
                                        شرايط</td>
                                    <td align="right" dir="ltr">
                                        <asp:TextBox ID="txtCondition" ReadOnly runat="server" CssClass="TxtControls" 
                                            Width="85%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                </table>
            
        
    
    </div>
    <div style="display: none;">
        <input type="text" runat="server" id="txtSavedConditions" name="txtSavedConditions" />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="display:none;">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtReportID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtMenuItemID" runat="server"></asp:TextBox>
                <input type="text" runat="server" id="txtSessionID" name="txtSessionID" />
                <input type="text" runat="server" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" />
                <asp:TextBox ID="txtXmlParamInfo" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtXmlFieldInfo" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtSubmit" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSubmit" runat="server" Text="Button" 
                    onclick="BtnSubmit_Click" />
                <asp:TextBox ID="txtXmlOperand" runat="server"></asp:TextBox>
                <input type="text" runat="server" id="txtConditionMain" name="txtConditionMain" />
                
            </div>
        </ContentTemplate>
        <Triggers>
        
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
        
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    <script language="javascript" type="text/javascript">
//        window.name = "AdvanceFilter"
//        form1.target = "AdvanceFilter"
        var MasterObj = "ctl00_ContentPlaceHolder1_"


        window.returnValue = ''
        $(document).ready(function () {
            fillLastConditions();
        });
        
        function fillLastConditions() {
            if ($("#"+MasterObj + "txtSavedConditions").val() != null) {

                var lastConditions = $("#"+MasterObj + "txtSavedConditions").val();
                var oGrid = document.getElementById(MasterObj + "GrdField");
            }
            if (lastConditions != "") {
                if (window.ActiveXObject) {
                    var xml = new ActiveXObject('Microsoft.XMLDOM');
                    xml.async = 'false';
                    xml.loadXML(lastConditions);
                } else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString(Data, 'text/xml');
                }
                var xmlNodesP = $(xml).find("Params");
                var StrConditions = "</Params>"
                for (var i = 1; i < oGrid.rows.length; ++i) {
                    if ($(xmlNodesP).find("param" + i + "").length!=0) {

                        oGrid.rows(i).cells(1).firstChild.value = xmlNodesP.find("param" + i + "").find("cells1").text()
                        oGrid.rows(i).cells(2).firstChild.value = xmlNodesP.find("param" + i + "").find("cells2").text()
                        oGrid.rows(i).cells(3).firstChild.value = xmlNodesP.find("param" + i + "").find("cells3").text()
//                      oGrid.rows(i).cells(4).firstChild.value = xmlNodesP.find("param" + i + "").find("cells4").text()
                        GenerateCondition(oGrid.rows(i))
                    }
                }
                StrConditions += "</Params>"
            }
        }

        function OnClickBtnCancel() {
            
            window.returnValue = "";
            window.close();
        }

        function FillTxtCondition() {
            var oGrid = document.getElementById(MasterObj + "GrdField")
            
            if (oGrid.rows.length > 1) {
                var StrWhere = ""
                var StrWhereTemp = "";
                for (var i = 1; i < oGrid.rows.length; ++i) {

                    if (oGrid.rows(i).cells(4).firstChild.value != "") {

                        if (StrWhere == "")
                            StrWhere += "(" + oGrid.rows(i).cells(4).firstChild.value + ")"
                        else
                            StrWhere += " and (" + oGrid.rows(i).cells(4).firstChild.value + ")"

                        if (StrWhereTemp == "")
                            StrWhereTemp += "(" + oGrid.rows(i).cells(4).getAttribute("StrWhereTemp") + ")"
                        else
                            StrWhereTemp += " and (" + oGrid.rows(i).cells(4).getAttribute("StrWhereTemp") + ")"
                    }
                }
            }

            document.getElementById(MasterObj + "txtCondition").value = StrWhere
            document.getElementById(MasterObj + "txtConditionMain").value = StrWhereTemp
        }

        function OnClickBtnOk() {

            var StrWhere = document.getElementById(MasterObj + "txtCondition").value
            var StrWhereTemp = document.getElementById(MasterObj + "txtConditionMain").value

            StrWhere=StrWhere.replace("<", "&lt;")
            StrWhere = StrWhere.replace(">", "&gt;")

            StrWhereTemp = StrWhereTemp.replace("<", "&lt;")
            StrWhereTemp = StrWhereTemp.replace(">", "&gt;")

            var Str = ""

            if ($get(MasterObj + 'txtXmlParamInfo').value != "") {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlParamInfo').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/FormGeneratorEntity/GetParameterInfo')
                if (xmlNodes.length != 0) {
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
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtInnerText").value != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtInnerText").value + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
                                break;
                            case "KasraDate":

                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value != "" && document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value != "")
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtYear").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtMonth").value + '/' + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text + "_txtDay").value + "</RValue>"
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
                                if (document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText != "") {
                                    Str += "<RValue>" + document.getElementById(MasterObj + "Ctrl" + xmlNodes.item(i).selectSingleNode('Name').text).innerText + "</RValue>"
                                }
                                else {
                                    Str += "<RValue>" + xmlNodes.item(i).selectSingleNode('DefaultValue').text + "</RValue>"
                                }
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
                
            }
            else {

                Str = "<Tb></Tb>"
            }

            var oGrid = document.getElementById(MasterObj + "GrdField")
            var strConditions = "<Params>";
            if (oGrid.rows.length > 1) {
                strConditions += "<param0>" + oGrid.rows.length + "</param0>";
                for (var i = 1; i < oGrid.rows.length; ++i) {

                    if (oGrid.rows(i).cells(4).firstChild.value != "") {
                    
                        strConditions += "<param"+i+">"
                        strConditions += "<cells1>" + oGrid.rows(i).cells(1).firstChild.value + "</cells1>"
                        strConditions += "<cells2>" + oGrid.rows(i).cells(2).firstChild.value  + "</cells2>"
                        strConditions += "<cells3>" + oGrid.rows(i).cells(3).firstChild.value + "</cells3>"
                        strConditions += "</param" + i + ">";
                        
                    }
                }
            }
            strConditions += "</Params>"
            var strFilter = "<Root>" + Str + "<Fields><Condition>" + StrWhereTemp + "</Condition></Fields>" + strConditions + "</Root>"
            
            window.returnValue = strFilter;
            window.close()
        }

        function cmbOprandOnChange(obj) {
            var oRow = obj.parentElement.parentElement
            GenerateCondition(oRow)
        }

        function txtVal1OnBlur(obj) {
            var oRow = obj.parentElement.parentElement
            GenerateCondition(oRow)
        }

        function txtVal2OnBlur(obj) {
            var oRow = obj.parentElement.parentElement
            GenerateCondition(oRow)
        }

        function GenerateCondition(ORowField) {

            var StrWhere = ''
            var StrWhereTemp=''
            var op = ORowField.cells(1).firstChild.value
            op = GetOperandFromVal(op)

            var v1 = ORowField.cells(2).firstChild.value
            var v1T=ORowField.cells(2).firstChild.value
            var v2 = ORowField.cells(3).firstChild.value
            var v2T = ORowField.cells(3).firstChild.value

            var Name = "[" + ORowField.getAttribute("Name") + "]"
            if (op != 0 && (v1 != "" || v2 != "")) {
                v1T = isNaN(v1) == true ? "'" + v1 + "'" : v1;
                v2T = isNaN(v2) == true ? "'" + v2 + "'" : v2;
                switch (op) {
                    case "Between":
                        if (v1 != "" && v2 != "") {
                            StrWhere = Name + " Between " + v1 + " and " + v2
                            StrWhereTemp = Name + " Between " + v1T + " and " + v2T
                        }
                        break;
                    case ">":
                        StrWhere = Name + ">" + v1
                        StrWhereTemp = Name + ">" + v1T
                        break;
                    case "<":
                        StrWhere = Name + "<" + v1
                        StrWhereTemp = Name + "<" + v1T
                        break;
                    case "=":
                        StrWhere = Name + op + v1
                        StrWhereTemp = Name + op + v1T
                        break;
                    case "<>":
                        StrWhere = Name + "<> " + v1
                        StrWhereTemp = Name + "<> " + v1T
                        break;
                    case "in":
                        StrWhere = Name + " in ("

                        if (v1 != "" && v2 != "")
                            StrWhere += v1 + "," + v2

                        else if (v1 != "" && v2 == "")
                            StrWhere += v1

                        else if (v1 == "" && v2 != "")
                            StrWhere += v2

                        StrWhere += ")"

                        StrWhereTemp = Name + " in ("

                        if (v1T != "" && v2T != "")
                            StrWhereTemp += v1T + "," + v2T

                        else if (v1T != "" && v2T == "")
                            StrWhereTemp += v1T

                        else if (v1T == "" && v2T != "")
                            StrWhereTemp += v2T

                        StrWhereTemp += ")"

                        break;
                    case "Like":
                        if (v1 != "") {
                            StrWhere = Name + " Like '%" + v1 + "%'"
                            StrWhereTemp = StrWhere;
                        }
                        break;
                }
            }

            ORowField.cells(4).firstChild.value = StrWhere
            ORowField.cells(4).setAttribute("StrWhereTemp", StrWhereTemp);
            FillTxtCondition()
            //return StrWhere;
        }
        
        function GetOperandFromVal(val) {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            var strHtml = ''
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
            XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[Val=" + val + "]")

            if (XmlNode.length > 0)
                return XmlNode.item(0).selectSingleNode("StrVal").text
            return '';
        }
        
        
        
    </script>
        

</asp:Content>
